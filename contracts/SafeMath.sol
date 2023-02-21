// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract safeMathTester{
    uint8 public bigNumber = 255;//Above version of 0.8 they can handle outboud and add safemath library on that version
    uint8 public secodnBigNumber =255;
    function add() public{
        bigNumber = bigNumber+1;

    }

    function add1()public{
        unchecked{secodnBigNumber = secodnBigNumber +1;}
    }
}