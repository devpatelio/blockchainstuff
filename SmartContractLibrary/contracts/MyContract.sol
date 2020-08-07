pragma solidity ^0.5.1;

import "./Math.sol";

contract MyContract{
    uint256 public value;
    
    function calculate(uint _value1, uint _value2) public {
        value = Math.divide(_value1, _value2);
    }
}





//----------------------------------------------------------------------//




// enum State { Waiting, Ready, Active }
    // State public state;
    
    // constructor() public{
    //     state = State.Waiting;
    // }
    
    // function activate() public {
        
    //     state = State.Active;
    // }
    
    // function isActive() public view returns(bool){
    //     return state == State.Active;
    // }
    
    // string public stringValue = "myValue";
    // bool public myBool = true; 
    // int public myInt = -1;
    // uint public myUint = 1;
    // uint8 public myUint8 = 8;
    // uint256 public myUint256 = 256;
    
    
    
//----------------------------------------------------------------------//
    
    
    
    
    
//----------------------------------------------------------------------//

    
    
    // mapping(address => uint256) public balances;
    // address payable wallet;
    // address public token;
    
    // constructor(address payable _wallet, address _token) public {
        
    //     wallet = _wallet;
    //     token = _token;
    // }
    
    // function() external payable {
    //     buyToken();
    // }
    
    // function buyToken() public payable{
    //     ERC20Token(address(token)).mint();
    //     wallet.transfer(msg.value);
    // }