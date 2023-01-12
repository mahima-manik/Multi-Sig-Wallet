# Multi-Sig-Wallet

In this project, we create a multi-sig wallet. 

Here are the requirements:
1. Wallet has set of owners
2. Wallet can hold balance
3. Owner can propose or submit a transaction to the smart contract
4. Owner can approve and revoke approval of pending transcations
5. anyone can execute a transcation after enough owners has approved it

### Project Setup

1. Install Node, Solidity and Hardhat
2. Create a new folder called multi-sig-wallet and `cd` inside the folder. Initialize an npm project by running: `npm init`. Enter the details and it will create `package.json`.
```➜  MultiSigWallet git:(master) ✗ npm init
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help init` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (multisigwallet) 
version: (1.0.0) 
description: Creating a Multi Sig Wallet
entry point: (index.js) 
test command: 
git repository: (https://github.com/mahima-manik/Multi-Sig-Wallet.git) 
keywords: 
author: 
license: (ISC) 
About to write to /Users/mahimamanik/Desktop/web3-plan/MultiSigWallet/package.json:

{
  "name": "multisigwallet",
  "version": "1.0.0",
  "description": "Creating a Multi Sig Wallet",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/mahima-manik/Multi-Sig-Wallet.git"
  },
  "author": "",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/mahima-manik/Multi-Sig-Wallet/issues"
  },
  "homepage": "https://github.com/mahima-manik/Multi-Sig-Wallet#readme"
}


Is this OK? (yes) yes
```

`package.json` will contain something like:
3. To install Hardhat, use the following command: `npm install --save-dev hardhat`
4. Created a new hardhat project by running `npx hardhat` in the project folder. If hardhat was not installed before, it will install `hardhat@2.12.6` or latest. Create an empty hardhat.config.js.
```
➜  MultiSigWallet git:(master) ✗ npx hardhat
Need to install the following packages:
  hardhat@2.12.6
Ok to proceed? (y) y
888    888                      888 888               888
888    888                      888 888               888
888    888                      888 888               888
8888888888  8888b.  888d888 .d88888 88888b.   8888b.  888888
888    888     "88b 888P"  d88" 888 888 "88b     "88b 888
888    888 .d888888 888    888  888 888  888 .d888888 888
888    888 888  888 888    Y88b 888 888  888 888  888 Y88b.
888    888 "Y888888 888     "Y88888 888  888 "Y888888  "Y888

👷 Welcome to Hardhat v2.12.6 👷‍

✔ What do you want to do? · Create an empty hardhat.config.js
✨ Config file created ✨

You need to install hardhat locally to use it. Please run:

npm install --save-dev "hardhat@^2.12.6"
```

And then run `npm install --save-dev "hardhat@^2.12.6"` to add Hardhat to the npm project.

5. This completes basic setup. Now we can start writing smart contracts and compile it locally.

