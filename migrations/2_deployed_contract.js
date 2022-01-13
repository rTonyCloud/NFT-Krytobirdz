const KrytoBird = artifacts.require("Krytobird");

module.exports = function (deployer) {
  deployer.deploy(KrytoBird);
};
