//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// VARIABLES
let var1: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()



// OPTIONALS
var optionalString: String? = "HELLO"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"

var greeting = "Hello"

optionalName = nil


// IF STATEMENTS
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "No body exists"
}


let nickName: String? = nil

let fullName :String = "John Appleseed"

let informalGreeting = "Hi \(nickName ?? fullName)"

//Setting default value if nickname doesnt exist
nickName ?? fullName




// SWITCH STATEMENTS
let vegetable = "red pepper"

switch vegetable {
    
case "celery":
    print("Add some raisons and make aints on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwhich")
case let x where x.hasSuffix("pepper"):
    print("Is it spicy \(x)?")
default:
    print("Everything tastes good in soup")
}



// LOOPS
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5],
    "Square": [1,4,9,16,25]
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print (largest)

//While loop
var n = 2
while n < 100 {
    n = n*2
}
print(n)

// Repeat while loop
var m = 2

repeat {
    m = m * 2
} while m < 100

print(m)


//for in loop 
var total = 0
for i in 0..<4 {
    total += i
}
print(total)


//FUNCTIONS
func greet(person:String, lunch:String) -> String {
    return "Hello \(person), todays special is \(lunch)"
}

greet(person: "BOB", lunch: "Tuna")



//CUSTOM PARAMETERS
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

greet("John", on: "Wednesday")



//Calculating the mix and max and sum of an array of numbers
func calculateStatistics(scores: [Int]) ->(min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum )
}

let statistics = calculateStatistics(scores: [5,3,100,3,9])

print(statistics.sum)
print(statistics.2)



//Calculate the sum of numbers

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}


sumOf(numbers: 42, 597, 12)


//Write a function that takes in numbers and creates the average
func averageOf(numbers: Int...) -> Int {
    var average = 0
    var sum = 0
    for number in numbers {
        sum += number
    }
    average = sum / numbers.count
    return average
}

averageOf(numbers: 3,5,7,9,100)


func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()



//Returning a function in a function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)



// Function that takes another function as one of its arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) ->Bool {
    return number < 10
}


var numbers = [20,19,7,12]

hasAnyMatches(list: numbers, condition: lessThanTen)

// CLOSURES
numbers.map({
    (number: Int) -> Int in
    var result = 0
    if number % 2 == 0 {
        result = 3 * number
    }
    return result
})

//
let mappedNumbers = numbers.map({ number in 3 * number})

print(mappedNumbers)


let sortedNumbers = numbers.sorted { $0 > $1 }

print(sortedNumbers)


//CLASSES

class Shape {
    var numberOfSides = 0
    
    func simplesDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    func whatColor(color: String) -> String {
        return "You chose the color \(color) for this shape"
    }
}
let blue = "blue"
let grey = "grey"

//circle
let circle = Shape()
circle.whatColor(color: grey)
circle.simplesDescription()

//square
var triangle = Shape()
triangle.numberOfSides = 3

var triangleDescription = triangle.simplesDescription()


//Adding an initializer

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides"
    }
    
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")

test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return (3.14 * radius) * 2
    }
    
    override func simpleDescription() -> String {
        return " A round object with the radius of \(radius)"
    }
}

let test2 = Circle(radius: 49, name: "test circle")

test2.area()













