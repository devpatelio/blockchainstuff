pragma solidity ^0.5.1;



contract ERC20Token {
    string public name; 
    mapping(address => uint256) public balances;
    
    constructor(string memory _token_name) public{
        name = _token_name;
    }
    
    function mint() public {
        balances[tx.origin] +=1;
    }

    
}

contract SecondContract {
    
    mapping(address => uint256) public balances;
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        
        wallet = _wallet;
        token = _token;
    }
    
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable{
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }
}