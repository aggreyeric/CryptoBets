// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Bets {
    struct Bet {
        string betType;
        string betDesc;
        uint256 winOptions;
        uint256[] options;
        string img;
    }

    struct PlaceBets {
        uint256 betID;
        uint256 amount;
        uint256 boptions;
        address who;
    }

    uint256[] public betIDs;
    uint256[] public pbetIDs;
    address owner = msg.sender;

    mapping(uint256 => Bet) private BetStruct;
    mapping(uint256 => PlaceBets) private PlaceBetStruct;



function newBet(uint256 _betID, string memory _betDesc, string memory _betType, uint256[] memory _options  ,string  memory _img ) public returns (bool){
   BetStruct[_betID].betType = _betType; 
   BetStruct[_betID].betDesc = _betDesc;
   BetStruct[_betID].img = _img; 
   BetStruct[_betID].options = _options;
   BetStruct[_betID].winOptions = 0; 
   betIDs.push(_betID);
   return true;  
}

function playBet(uint256 _pbetID,uint256 _betID, uint256 _amount,uint256 _boptions ) public  returns (bool){
    PlaceBetStruct[_pbetID].betID = _betID;
    PlaceBetStruct[_pbetID].amount = _amount;
    PlaceBetStruct[_pbetID].boptions = _boptions;
    PlaceBetStruct[_pbetID].who = msg.sender;
    pbetIDs.push(_pbetID);
   return true;
}


}
