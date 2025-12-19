import UIKit

class Pet {
    //Attributes
    var name: String
    var breed: String
    var age: Int
    var owner: String
    
    //Initializer / Constructor
    init(name: String, breed: String, age: Int, owner: String){
        self.name = name
        self.breed = breed
        self.age = age
        self.owner = owner
    }
}

//How to create an object
let petObject = Pet(name:"Walter", breed:"Pitbull", age: 3, owner: "James Doe")

//How to access to an attribute of an object
petObject.name
print("The Pet name is: ", petObject.name)
print("The Pet owner name is: ", petObject.owner)

//How to update values of an attribute
petObject.age = 5
print("The pet age is:", petObject.age)
