const {ethers} = require("hardhat");
const {expect,assert} = require("chai");
describe("SimpleStorage", function(){
    let SimpleStorage, simpleStorageFactory;
    
    beforeEach(async function(){
        
        const simpleStorageFactory = await ethers.getContractFactory("Storage");
        SimpleStorage = await simpleStorageFactory.deploy();
    })

    describe("Start test ..",function(){
        it("Should check retriev methods",async function(){
            const currentValue = await SimpleStorage.retrive1();
            const expectValue = "0";
            assert.equal(currentValue.toString(),expectValue);
        })

        it("Should update when we call store",async function(){
            console.log("Storage address",SimpleStorage.address);
        })
    })
})