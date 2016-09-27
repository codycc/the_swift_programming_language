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
var triangle0 = Shape()
triangle0.numberOfSides = 3

var triangleDescription = triangle0.simplesDescription()


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


//SQUARE CLASS
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


// CIRCLE CLASS
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
        return " A round object with the radius of \(radius) and area of \(area())"
    }
}

let test2 = Circle(radius: 49, name: "test circle")

test2.area()
test2.simpleDescription()



//TRIANGLE CLASS
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")

print(triangle.perimeter)

triangle.perimeter = 9.9

print(triangle.sideLength)


//TRIANGLE AND SQUARE CLASS
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")

print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength )


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")

let sideLength = optionalSquare?.sideLength


//ENUMERATIONS AND STRUCTURES

enum Rank: Int {
    case ace = 1
    case two, three, four, five,six,seven,eight,nine,ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    //Write a function that compares two Rank values by comparing their raw values.
    func isEqual(secondRank: Rank) -> Bool {
        return self.rawValue == secondRank.rawValue
    }

}
let ace = Rank.ace
let aceRawValue = ace.rawValue

let jack = Rank.jack
jack.isEqual(secondRank: ace)

let queen = Rank.queen
queen.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds,clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "Spades"
        case .hearts:
            return "hearts"
        case.diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case(.spades),(.clubs):
            return "Black"
        case(.hearts),(.diamonds):
            return "red"
    }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()

let clubs = Suit.clubs
clubs.color()

//STRUCTURES
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func fullDeck() -> [Card] {
        let ranks = [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king]
        
        let suits = [Suit.clubs,Suit.hearts,Suit.diamonds,Suit.spades]
        var deck = [Card]()
        
        for suit in suits {
            for rank in ranks {
                deck.append(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}



let threeOfSpades = Card(rank: .three, suit: .spades)

let threeOfSpadesDescription = threeOfSpades.simpleDescription()

threeOfSpades.fullDeck()



enum ServerResponse {
    case result(String,String)
    case failure(String)
    case broken(String)
}

let success = ServerResponse.result("6:00am", "8:09pm")
let failure = ServerResponse.failure("Out of cheese")
let broken = ServerResponse.broken("The server is broken at the moment please try again later")

switch success {
case let .result(sunrise,sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
case let .broken(message):
    print("failure... \(message)")
}


//Protocols
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription



enum ExampleEnum: ExampleProtocol {
    case Base, Adjusted
    var simpleDescription: String {
        return self.getDescription()
    }
    func getDescription() -> String {
        switch self {
        case .Base:
            return " A simple description"
        case .Adjusted:
            return " Adjusted description"
        }
    }
    
    mutating func adjust() {
        self = ExampleEnum.Adjusted
    }
}

var c = ExampleEnum.Base
c.adjust()

let cDescription = c.simpleDescription



extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}


print(7.simpleDescription)

extension Double: ExampleProtocol {
    var simpleDescription: String {
        return " The number \(self)"
    }
    
    var absoluteValue: Double {
        return fabs(self)
    }
    
    mutating func adjust() {
        
    }
}

var double: Double = -12.34
double.simpleDescription
double.absoluteValue

let protocolValue: ExampleProtocol = a

print(protocolValue.simpleDescription)

// The anotherProperty was added on top of the protocol uncomment to see the error
// print(protocolValue.anotherProperty)


//ERRORS AND ERROR HANDLING 

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has toner" {
        throw PrinterError.noToner
    }
    return "Job Sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never has toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "GutenBerg")
    print(printerResponse)
    
    // to make second catch run
    throw PrinterError.onFire
    // to make third catch run
    throw PrinterError.outOfPaper
    
} catch PrinterError.onFire {
    print("Ill just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")

let printerFailure = try? send(job: 1885, toPrinter: "Never has toner")


//DEFER
var fridgeIsOpen = false
let fridgeContent = ["milk","eggs","leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)


//GENERICS
















