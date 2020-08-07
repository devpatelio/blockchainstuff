

# metacoin/migrations/3_deploy_nftoken.js


var Migrations = artifacts.require("Migrations");
var NFTokenMetaData = artifacts.require("NFTokenMetadata");
module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(NFTokenMetaData);
};