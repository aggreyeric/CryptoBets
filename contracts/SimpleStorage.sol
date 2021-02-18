// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;


contract SimpleBank {

  //like adictionary balances[addess] = unit
  mapping(address=>uint) private balances;
  address public owner;
//Events - publicize actions to external listeners
  event LogDepositMade(address accountAdress, uint amount);
 
 constructor() public{
   owner = msg.sender;
 }


 function deposit() public payable returns (uint){
   require((balances[msg.sender] + msg.value)>= balances[msg.sender]);
   balances[msg.sender] + msg.value;
   emit LogDepositMade(msg.sender,msg.value);
   return balances[msg.sender];
 }


 function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        require(withdrawAmount <= balances[msg.sender]);
        balances[msg.sender] -= withdrawAmount;
        msg.sender.transfer(withdrawAmount);

        return balances[msg.sender];
    }

     function balance() view public returns (uint) {
        return balances[msg.sender];
    }

}