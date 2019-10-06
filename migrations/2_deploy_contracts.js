const Ewaste = artifacts.require("Ewaste.sol");
const Mytoken = artifacts.require("Mytoken.sol");

module.exports = function(deployer) {
  deployer.deploy(Ewaste);
  deployer.deploy(Mytoken);
};
