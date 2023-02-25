const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("Fund me", function () {

  let Fundme;
  let fundme;
  

  beforeEach(async function () {

    accounts = await ethers.getSigners();

    const Fundme = await ethers.getContractFactory("FundMe");
    fundme = await Fundme.deploy();
    await fundme.deployed();
  });

  describe("Fund me starting .... ", async function () {

    // it("Should Check test revert with reason", async function () {
    //     await expect(fundme.fund()).to.be.revertedWith("Didn't send enough!");
    // });

    it("Should check the number ",async function(){
        await expect(fundme.setNumber(1000));
        console.log("number",await fundme.number());
    })

    it("Should check fund functions",async function(){
        const [sender] = await ethers.getSigners();
        let eth_value = ethers.utils.parseEther("2");
        await expect( fundme.connect(sender).fund({value:eth_value}));
        
        // console.log(fundme);
    })

    describe("Withdraw",async function(){
        let sendValue = ethers.utils.parseEther("3");
        beforeEach(async function(){
            await fundme.fund({value:sendValue});
        });

        it("Withdraw eth from a single founders",async function(){
            const startingFundBalance = await fundme.provider.getBalance(fundme.address);
           
        })
        
    })




  });

});