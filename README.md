# E-Waste-Management
The potential use of Blockchain in e-waste management sector

Here we are using the truffle framework forcompiling and deploying the smart contract in Ethereum blockchain
Prerequisites 
--------------
1. Testrpc or Ganache-cli
2.truffle framework
3.Node js


Installing Ganache-cli and testrpc
----------------------------------
Download the ganache app image from the below link

https://github.com/trufflesuite/ganache/releases/download/v2.1.1/ganache-2.1.1-linux-x86_64.AppImage

# Provide the permission for execte the file

If you want to install testrpc
Run this command 

# npm install -g ethereumjs-testrpc




Step to follow
-------------------
1. clone the repository in your local machine
2. Go to the root repository
3. Run the command 
   # truffle compile
4. Take another terminal for testrpc, run the command 
    # testrpc -p 7545 or run Ganache-cli
5. In the root directory repo, run the command
   # truffle migrate
   
6. Going to interact with our smart contract through truffle framework
   # truffle console
   Enter the below command in the truffle console
   # Ewaste.deployed()
   # let EwasteInstance = await Ewaste.deployed()
   
   choose the function in the smart contract
   
   # EwasteInstance.regUser("0xca35b7d915458ef540ade6068dfe2f44e8fa733c","Apple Private Limited","USA",1)
   
   Like wise you can interact with functions through the truffle console or you can use Remix IDE 





