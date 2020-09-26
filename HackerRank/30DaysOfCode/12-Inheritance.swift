import Foundation

class Person {
    private let firstName: String
    private let lastName: String
    private let id: Int

    init(firstName: String, lastName: String, id: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
    }

    func printPerson() {
        print("Name: \(lastName), \(firstName)")
        print("ID: \(id)")
    }
} 

class Student: Person {
    var testScores: [Int]
    
    /*    
    *   Initializer
    *   
    *   Parameters:
    *   firstName - A string denoting the Person's first name.
    *   lastName - A string denoting the Person's last name.
    *   id - An integer denoting the Person's ID number.
    *   scores - An array of integers denoting the Person's test scores.
    */
    init(firstName: String, lastName: String, id: Int, scores: [Int]) {
        self.testScores = scores
        super.init(firstName: firstName, lastName: lastName, id: id)

    }

    /*    
    *   Method Name: calculate
    *   Return: A character denoting the grade.
    */
    func calculate() -> Character {

        var sum = 0
        var average = 0

        for score in testScores {
            sum += score
        }

        average = sum / testScores.count

        switch average {
            case 90...100:
                return "O"
            case 80..<90:
                return "E"
            case 70..<80:
                return "A"
            case 55..<70:
                return "P"
            case 40..<55:
                return "D"
            default:
                return "T"
        }
    }
} 

let nameAndID = readLine()!.components(separatedBy: " ")
let _ = readLine()
let scores = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], id: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")
