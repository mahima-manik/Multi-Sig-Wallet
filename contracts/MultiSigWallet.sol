//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// How to install openzeppelin in Hardhat projects: https://docs.openzeppelin.com/upgrades-plugins/1.x/hardhat-upgrades
// npm install @openzeppelin/contracts
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MultiSigWallet is AccessControl {

    uint public balance;
    
    struct Proposal {
        uint amount;
        address receiver;
        uint votes;
        mapping (address => bool) hasVoted;
    }

    uint numProposals;
    mapping (uint => Proposal) public proposals;

    // Create a new role identifier for the admin role
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor() payable {
        // Grant ADMIN_ROLE to the deploying address
        _setupRole(ADMIN_ROLE, msg.sender);
        balance += msg.value;
    }

    function propose(uint _amount, address _receiver) public payable {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(_amount < balance, "Not enough balance in the wallet");

        Proposal storage proposal = proposals[numProposals++];

        proposal.amount = _amount;
        proposal.receiver = _receiver;
        proposal.votes = 1;
        proposal.hasVoted[msg.sender] = true;
    }
}
