// we can define solidiy version >= 0.8.7 <0.9.0

// WE use specific version using ^0.8.0
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract SimpleStorage{
    struct People{
        uint favoriteNumber;
        string name;
    }
    mapping(string=>uint)public feNumber;


    // People public person = People({favoriteNumber: 200, name: "monesh soni"}); 
    People[] public person;
    uint public favoriteNumber;
    function store1(uint _favoriteNumber)public virtual{
        favoriteNumber = _favoriteNumber;
        retrive1();
    }

    function retrive1()public view  returns(uint){
        return favoriteNumber;
    }

    function setMapPer(string memory _name, uint _number)public{
        feNumber[_name] = _number;
    }
  
    function addPerson(uint _number, string memory _name)public{
        person.push(People(_number,_name));
    }

    function addLocalPrt(uint _number, string memory _name)public{
        People memory newPerson = People({favoriteNumber:_number,name:_name});
        person.push(newPerson);
    }
}

