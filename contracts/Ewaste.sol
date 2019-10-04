pragma solidity ^0.5.0;

contract Ewaste{
    
    /**
     *enums are one way to create a user-defined type in Solidity. 
     * They are explicitly convertible to and from all integer types
     * but implicit conversion is not allowed.
     * The explicit conversions check the value ranges at runtime and a failure causes an exception.
     * Enums needs at least one member.

     */
   
    enum Status {create, aggregate, recycle, complete}
    
    
    /**
     * A struct in solidity is just a custom type that you can define.
     * You define the struct with a name and associated properties inside of it.
     */
    
   struct List{
        uint listId;
        address manufacture;
        address aggregator;
        address recycler;
        string category;
        string description;
        uint amountOffered;
        Status status;
    }
    struct User{
    
        address user;
        string name;
        string addres;
        uint userType;
        uint[] myList;
    }
  
    mapping (uint => List) lists;
    mapping (address =>User) users;
    
    address[] allusers;
    uint[] allLits;
    
    /**
     * Register the various users like
     * Manufacturer
     * Aggregators
     * Recyclers
     * etc
     */
    
    function regUser(address user, string memory name, string memory addres,uint userType) public returns (bool){
    users[user].user=user;
    users[user].name=name;
    users[user].addres=addres;
    users[user].userType=userType;
    
    allusers.push(user);
    return true;
    }
    
    /**
     * Manufacture can place order for require amount of e-waste
     */
    
    function addList( uint id, address man, string memory cat, string memory des,uint amount) public returns(bool){
        lists[id].listId=id;
        lists[id].manufacture=man;
        lists[id].category=cat;
        lists[id].description=des;
        lists[id].amountOffered=amount;
        lists[id].status=Status.create;
        users[msg.sender].myList.push(id);
    }
    /**
     * Get the list of orders
     */
    
    function getMyList()public view returns(uint[] memory){
       return users[msg.sender].myList;
    }
    
    function getMyListDetail(uint id) public view returns(string memory, string memory,string memory, string memory,uint){
        return (users[lists[id].aggregator].name,users[lists[id].recycler].name,lists[id].category,lists[id].description,lists[id].amountOffered);
    }
    
    function getLists() public view returns(uint[] memory){
        return allLits;
    }
    
    /**
     * Get the list of orders for Aggregators
     */
    
    function getListForAggregator(uint id, address aggregator) public view returns(uint,string memory, string memory, string memory, uint amount){
        require(lists[id].status==Status.create);
        require(lists[id].aggregator!=aggregator);
        string memory name=users[lists[id].manufacture].name;
        return (lists[id].listId,name,lists[id].category,lists[id].description,lists[id].amountOffered);
    }
    
    /**
     * aggregator can approve the order from manufacture
     */

    
    function approveAggregate(uint id, address aggregator) public returns(bool){
        lists[id].aggregator=aggregator;
        lists[id].status=Status.aggregate;
        return true;
    }
    
    /**
     * aggregator can add the recycler in this function
     */
    
    function approveRecycler(uint id, address recycler) public returns(bool){
        lists[id].recycler=recycler;
        lists[id].status=Status.recycle;
        return true;
    }
    
    
}
    
    
