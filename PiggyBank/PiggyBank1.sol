 
pragma solidity 0.5.4;

contract PiggyBank {
    
    address payable  bank;
    address payable  owner;
    uint ownerdeposit;
    
    
    constructor() public  payable {
        owner = msg.sender;
        ownerdeposit = msg.value;
        
        }
        
    modifier onlyOwner {
        require (owner == msg.sender);
        _;
    } 
        
    
    
    function toFillBank() onlyOwner public payable  {
        
       
    }
    
    function getDeposit() public view onlyOwner returns(uint) {
        
        return ownerdeposit;
    }
    
    function getBankBalance() public view onlyOwner returns(uint) {
        
        return address(this).balance;
    }
    
    function changeOwner(address payable _newOwner) public onlyOwner {
        
        owner = _newOwner;
    }
    
    function getOwner() public view returns (address) {
        
        return owner;
    }
    
    function breakUpBank()public onlyOwner {
        
        selfdestruct(owner);
    }
}
