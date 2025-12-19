import UIKit

//Array

print ("---------- ARRAY-----------")
print ("""
    These are characteristics of an Array:
    1. It is Ordered
    2. Each item is positioned (index)
    3. Supports duplicate items
    """)


// Define an Array.
var studentAge: [Int] = [33, 24, 50 ,65]
var studentName: [String] = ["Jay", "James", "John"]

print("List of names: ", studentName)


//String interpolation
print("Students ages are \(studentAge)")


//Sets
print("------set-------")
print("""
    These are characteristics of a Set:
    1. It is unordered.
    2. Items do not have a position
    3. Duplicates are not allowed
    """)


// Define a Set
var studentGrades: Set<Int> = [80, 77, 100, 95, 63]
print("List of grades \(studentGrades)")


//Dictionaries
print("-------Dictionary-------")
print("""
    These are the Characteristics of a Dictionary:
    1. Unordered
    2. Collection of Key Value pairs
    3. Each Key must be unique
    """)


//Define a Dictionary
var studentDictionary: [String:Int] = [
    "Jay": 80,
    "James": 77,
    "John": 100
]
print("The student grades are as follows \(studentDictionary)")


//Structure of a Class
print("------------Structure of a Class-------------")
class ClassName {
    //Attributes
    
    //Ininitializer
    
    //Methods
}

