pragma solidity 0.8.9;
contract Voting{
    mapping(address => bool)public vote;
    uint public VoteCount;
    function DoVote(address _user)public VotedOrnot(_user){
        vote[_user]=true;
        VoteCount++;  
    }

    modifier VotedOrnot(address _user){
        require(vote[_user]==false,"You'r already voted Only vote one time");
        _;
    }
}