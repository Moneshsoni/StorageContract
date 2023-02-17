pragma solidity 0.8.9;
import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage{
    // +5
    //we can override
    //virtual override 
    function store1(uint _favoriteNumber)public override{
        favoriteNumber = _favoriteNumber+10;
    }
}