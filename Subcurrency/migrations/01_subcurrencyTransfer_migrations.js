var Calculator = artifacts.require("subcurrencyTransfer.sol");
module.exports = function(deployer) {
deployer.deploy(subcurrencyTransfer);
};