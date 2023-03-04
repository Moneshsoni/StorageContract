pragma solidity 0.8.9;


contract Array{


    address public owner;
    address[] public funders;

    constructor (){
        owner = msg.sender;
    }
    function putAddtress(address[] memory _funders)public onlyOwner{
        require(_funders.length<=5,"you can fund only 5 users");
        funders = _funders;
    }

    function getArrlen()public view returns(uint){
        return funders.length;
    }

    function delFunders()external{
        delete funders;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"You are not authorized person to call");
        _;
    }



}

// ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
// "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"]