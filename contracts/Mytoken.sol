pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract Mytoken is ERC20
{
    string public name ="Mytoken";
    string public symbol ="MT";
    uint8 public decimal =2;
    uint public INITIAL_SUPPLY =50000000000;
    
    constructor() public {
  _mint(msg.sender, INITIAL_SUPPLY);
}
    
}
