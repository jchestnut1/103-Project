import UIKit

// Create
var fruitsArray: [String] = ["Orange", "Mango", "Pineapple", "Kiwi"]
var fruitsSet: Set<String> = ["Orange", "Mango", "Pineapple", "Kiwi"]
var fruitsDictionary: [String: String] = [
    "Orange": "Orange",
    "Yellow": "Mango",
    "Green": "Pineapple",
    "Blue": "Kiwi"
]
print(fruitsArray)
print(fruitsSet)
print(fruitsDictionary)



print("--------ADD ELEMENTS---------------")
//Add elements to ARRAY
fruitsArray.append("Strawberry")

//Add elements to Sets
fruitsSet.insert("Strawberry")

//Add elements to Dictionary
fruitsDictionary["Pink"] = "Strawberry"



print("--------Remove Elements-----------")
//Remove elements from Array
fruitsArray.remove(at: 2)

//Remove elements from Set
fruitsSet.remove("Orange")

//Remove elements from Dictionary
fruitsDictionary.removeValue(forKey: "Yellow")


print(fruitsArray)
print(fruitsSet)
print(fruitsDictionary)



//Search / Check Elements

//Array
print("The fruit in position 1 is", fruitsArray[1])
print("Array contains 'Apple'?:", fruitsArray.contains("Apple"))

//Set (Search/Check Element)
print("Set contains 'Mango'?:", fruitsSet.contains("Mango"))

//Dictionary (Search/Check Element)
print("Dictionary contains 'Pineapple'", fruitsDictionary.values.contains("Pineapple")) //can switch between searching keys and searching values in the Dictionary




//Iterate a Collection (Array)
for fruit in fruitsArray {    //naming the new key while iterating the array
    print(fruit)              //Calling the new key with the action
}

//Iterate a collection (Set)
for fruit in fruitsSet {
    print(fruit)
}

//Iterate a collection (Dictionary)
for (color, fruit) in fruitsDictionary {  //use key/value set for dicitonary
    print(color, fruit)                   //print both key and value
}

for fruit in fruitsDictionary{
    print(fruit.value)
}




//Sorting a Collection
print("Array sorted: ", fruitsArray.sorted(by:>))
print("Set sorted:", fruitsSet.sorted(by:>))

let sortedKey = fruitsDictionary.sorted{ $0.key < $1.key } //sort by key
print(sortedKey)

