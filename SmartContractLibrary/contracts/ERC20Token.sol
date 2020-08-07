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


contract MyToken is ERC20Token{
    string public symbol;
    address[] public owners; 
    uint256 ownerCount;
    constructor(string memory _token_name, string memory _symbol) ERC20Token(_token_name) public {
        symbol = _symbol;
        
    }
    
    function mint() public {
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }
}

