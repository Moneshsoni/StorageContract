const hre = require("hardhat");
async function main(){
    const FundMe = await hre.ethers.getContractFactory("FundMe");
    const fundme = await FundMe.deploy();
    await fundme.deployed();
    console.log("Fund me addres",fundme.address);
}

main();