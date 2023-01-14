//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// How to install openzeppelin in Hardhat projects: https://docs.openzeppelin.com/upgrades-plugins/1.x/hardhat-upgrades
// npm install @openzeppelin/contracts
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MultiSigWallet is AccessControl {

    uint public balance;
    uint public minimumVotes;
    
    struct Proposal {
        uint amount;
        address receiver;
        uint votes;
        mapping (address => bool) hasVoted;
        bool hasExecuted;
    }

    uint numProposals;
    mapping (uint => Proposal) public proposals;

    // Create a new role identifier for the admin role
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor() payable {
        // Grant ADMIN_ROLE to the deploying address
        _setupRole(ADMIN_ROLE, msg.sender);
        balance += msg.value;
        minimumVotes = 1;
    }

    function propose(uint _amount, address _receiver) external payable {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(_amount < balance, "Not enough balance in the wallet");

        Proposal storage proposal = proposals[numProposals++];

        proposal.amount = _amount;
        proposal.receiver = _receiver;
        proposal.votes = 1;
        proposal.hasVoted[msg.sender] = true;
        proposal.hasExecuted = false;
    }

    function approve(uint _index) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(_index < numProposals, "Proposal does not exist");

        Proposal storage proposal = proposals[_index];

        require(!proposal.hasExecuted, "Proposal has already been executed");
        require(!proposal.hasVoted[msg.sender], "Caller has already voted");
        
        proposal.votes += 1;
        proposal.hasVoted[msg.sender] = true;
    }

    function execute_proposal(uint _index) external payable {
        require(_index < numProposals, "Proposal does not exist");

        Proposal storage proposal = proposals[_index];

        require(!proposal.hasExecuted, "Proposal has already been executed");
        require(proposal.votes >= minimumVotes, "Not enough approvals");

        proposal.hasExecuted = true;
        (bool sent, bytes memory data) = proposal.receiver.call{value: proposal.amount}("");
        require(sent, "Failed to send amount to receiver");
    }
}
