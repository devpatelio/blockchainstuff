pragma solidity ^0.5.1;
pragma experimental ABIEncoderV2;




contract Permission{
    
    address owner;
    mapping (uint => File) files;
    uint256 public fileCount;
    address[] public doctor_list;
    address added_doctor;
    
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
    
    modifier DoctorandOwner() {
        require(owner == msg.sender || owner == added_doctor);
        _;
    }
    
    struct File {
        uint id;
        string _name; 
        string _message;
        address[] list_of_doctors;
        
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function newFile(string memory _name, string memory _message) public onlyOwner{
        fileCount +=1;
        files[fileCount] = File(fileCount, _name, _message, doctor_list);
    }
    
    function addDoctor(address added_doctor) public onlyOwner{
        doctor_list.push(added_doctor);
    }
    
    function viewFile(uint256 fileCount) public DoctorandOwner view returns (File memory) {
        return files[fileCount];
    }

    
}

