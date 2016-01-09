//: Playground - noun: a place where people can play

import UIKit

class BagelShop {
    var numberOfBagels: Int
    var totalAmountMade: Double
    
    init (numberOfBagels: Int) {
        self.numberOfBagels = numberOfBagels
        self.totalAmountMade = 0
    }
    
    convenience init () {
        self.init(numberOfBagels: 5)
    }
    
    func isClosed () -> Bool {
        return self.numberOfBagels == 0
    }
    
    func procesOrder (order: Order) {
        if !isClosed() && !order.isCompleted && order.numberOfBagels() <= self.numberOfBagels {
            self.numberOfBagels = self.numberOfBagels - order.bagels.count
            self.totalAmountMade += order.totalPrice()
            order.isCompleted = true
            if isClosed() {
                print("totalAmountMade is \(totalAmountMade)")
            }
            
        }
    }
    
}

class Customer {
    var order: Order
    
    init(order: Order ){
        self.order = order
    }
    
    
}

class Order {
    var isCompleted: Bool
    var bagels: [Bagel]
    
    init (bagels: [Bagel]) {
        self.isCompleted = false
        self.bagels = bagels
    }
    
    convenience init () {
        self.init (bagels: [])
    }
    
    func numberOfBagels() -> Int {
        return bagels.count
    }
    
    func totalPrice () -> Double {
        var totalPrice : Double = 0
        for bagel in bagels {
            totalPrice += bagel.price
        }
        return totalPrice
    }
}

class Bagel {
    let price = 1.5
    
}



let bagelShop = BagelShop (numberOfBagels: 5)
var bagels = [Bagel]()
for i in 0...5 {
    bagels.append(Bagel())
}
let order1 = Order (bagels: bagels)
let customer = Customer(order: order1)

bagelShop.procesOrder(customer.order)
print("number of Bagels  is \(bagelShop.numberOfBagels)")


////////////////////////////////////////////


func isPalindrome1(word: String) -> Bool{
    let wordLength = word.characters.count
    for i in 0...wordLength/2 {
        if (Array(word.characters)[i] != Array(word.characters)[wordLength - i - 1]) {
            return false
        }
    }
    return true
}

func isPalindrome2(word: String) -> Bool {
    return String(word.characters.reverse()) == word
}

struct Stack<T> {
    private var items:[T]
    var count: Int {
        get {
            return items.count
        }
    }
    
    mutating func push(element: T) {
        items.append(element)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

func isPalindrome3(word: String) -> Bool {
    var stack = Stack<Character>(items: Array(word.characters))
    var reverseStack = Stack<Character>(items: Array(word.characters).reverse())
    
    for _ in 0..<stack.count {
        if stack.pop() != reverseStack.pop() {
            return false
        }
    }
    return true
}

print("is 'racecar' palidrome1? \(isPalindrome1("racecar"))")
print("is 'not' palidrome1? \(isPalindrome1("not"))")
print("is 'racecar' palidrome2? \(isPalindrome2("racecar"))")
print("is 'not' palidrome2? \(isPalindrome2("not"))")
print("is 'racecar' palidrome3? \(isPalindrome3("racecar"))")
print("is 'not' palidrome3? \(isPalindrome3("not"))")

// find the missing Number
func findMissingNumber(N: Int, list:[Int]) -> Int {
    var totalSumOfNArray = 0
    var totalSumOfList = 0
    
    for i in 1...N {
        totalSumOfNArray += i
    }
    
    for i in list {
        totalSumOfList += i
    }
    
    return totalSumOfNArray - totalSumOfList
}

func findMissingNumber2 (N: Int, list: [Int]) -> Int{
    list.sort({$0 < $1})
    var j = 0
    var missingNum = 0
    for i in (0..<list.count){
        j = i + 1
        if (j-1 != 1) {
            missingNum = i+1
        }
    }
    return missingNum
}

let arr = [1,4,6,3,2]
let N = arr.count + 1

findMissingNumber(N, list: arr)
findMissingNumber2(N, list: arr)








