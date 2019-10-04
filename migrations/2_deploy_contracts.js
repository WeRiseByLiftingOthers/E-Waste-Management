const Ewaste = artifacts.require("Ewaste.sol");

module.exports = function(deployer) {
  deployer.deploy(Ewaste);
};
