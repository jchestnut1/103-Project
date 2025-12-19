import UIKit

class Student{
    
    var name: String
    var age: Int
    var grades: [Int]
    
    init(name: String, age: Int, grades: [Int]){
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    func averageGrade () -> Double{
        let sum = grades.reduce(0, +)
        //.reduce takes a list of values and shrinks down to one, with an action/operation after the comma. 0 is the start number.
        return Double(sum) / Double(grades.count)  //converts both numbers to doubles.
    }
    
    func isPassing() -> Bool{
        return averageGrade() >= 70
    }
}

//Create a Student

let student = Student(name: "James", age: 12, grades: [88, 92, 87, 84])
print("Name: \(student.name), Age: \(student.age), Grades: \(student.grades)")
print("Average Grade:", student.averageGrade())
print("Is \(student.name) passing?: \(student.isPassing())")
