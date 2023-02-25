//Get funds for users
//Withdraw funds
//Set a minimum funding value in USD
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./PriceConvertor.sol";
error FundMe__Notowenr();

/**
 * @title A contract for fund me learning
 * @author Monesh soni
 * @notice This contract is imlement for learning purposes.
 */
contract FundMe{

    //Type declarations
    using PriceConverter for uint256;
    //state variabales
    uint public MINIMUM_USD = 50 * 1e18;
    address public owner;
    address[] public funders;

    uint public number;
    mapping(address=>uint256) public addressToAmountFunded;

    constructor(){
        owner = msg.sender;
    }

    function setNumber(uint _number)public{
        number = _number;
    }
    
    function fund() public payable{
        // Want to be able to set a minimum fund amount in USD
        // How do we send ETH to this contract.
        // A ton of computation here.
        //Reverting
        // Undo any action before, and send remaining gas back.

        require(msg.value.getConverstionRate() >=  MINIMUM_USD, "Didn't send enough!"); // 1e18 == 1*10**18 == 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value; 

    }


    //for loop example for(starting index, ending index, step amount)
    function Withdraw() public onlyOwner{
        
        for(uint256 funderIndex =0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        funders = new address[](0);
        //actually withdraw the funds
        //We can transfer fund using three methods 
        //transfer
        // payable(msg.sender).transfer(address(this).balance);
        // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "send failed");
        // call
        //Most prafer method for transfer is call methods
        (bool callSuccess, )=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call transfer failed"); 
  
    }
    modifier onlyOwner{
        if(msg.sender!=owner){
            revert FundMe__Notowenr();
        }
        _;
    }
// send money to contract recieve functions  
}


