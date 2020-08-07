
  
pragma solidity ^0.5.1;
// a more simpler and dynamic implementation for role based architecture -- serves the function of OpenZepplin

contract RolesandPermissions{
    event NewBearer(address account, uint256 role);


    modifier adminOnly() {
        require(admin == msg.sender);
        _;
    }
    

    constructor() public {
        admin = msg.sender;
    }
    
    uint256 public role_count = 0;
    address admin;
    mapping(uint => Role) public roles_list;

     struct Role{
        
        uint256 role_id;
        string description;
        address bearer;

    }
    
    function adminRole(string memory _roleDescription) public {
        role_count += 1;
        roles_list[role_count] = Role(role_count, _roleDescription, msg.sender);
        
    }
    
    function addRole(string memory _roleDescription, address _assignedBearer) public adminOnly{
        role_count += 1;
        roles_list[role_count] = Role(role_count, _roleDescription, _assignedBearer);
        emit NewBearer(_assignedBearer, role_count);
    }
    
    function changeAdmin(uint256 _role_id, address _newBearer) public {
        
        address _previousBearer = roles_list[_role_id].bearer;
        require(_previousBearer != admin);
        require(admin == msg.sender || admin == _previousBearer);
        roles_list[_role_id].bearer = _newBearer;
        
    }
    
    function removeRole(uint256 _role_id) public {
        address _previousBearer = roles_list[_role_id].bearer;
        require(_previousBearer != admin);
        require(admin == msg.sender || admin == _previousBearer);
        require(_role_id != 1);
        delete roles_list[_role_id];
        role_count -= 1;
    }
    
    
}
  
  
