import UIKit

var studentNames: [String] = ["Jaylen Johnson", "Keith Smith", "Steph Curry", "Reggie Miller", "Sydney Crosby"]

var studentGrades: [String: [Int]] = [
    "Jaylen Johnson": [83, 79, 91, 85],
    "Keith Smith": [79, 82, 66, 97],
    "Steph Curry": [93, 82, 91, 99],
    "Reggie Miller": [86, 85, 81, 92],
    "Sydney Crosby": [78, 88, 75, 86]
]

for name in studentNames{
    if let grades = studentGrades[name]{
        let avg = averageGrade(grades: grades)
        print(studentSummary(name: name, grades: grades))
    }
}

func averageGrade(grades: [Int]) -> Double{
    if grades.isEmpty {return 0.0}
    let sum = grades.reduce(0, +)
    return Double(sum)/Double(grades.count)
}

func studentSummary(name: String, grades: [Int]) -> String{
    let avg = averageGrade(grades: grades)
    let avgText = String(format: "%.2f", avg)
    return
        """
        Name: \(name)
        Grades: \(grades)
        Average: \(avg)
        """
}

