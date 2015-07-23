//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var age = 19999

str = "Bradley"

let team = "Seahawks"

//team = "niners"

func doubleNumber(number : Int) -> Int {
  return number * 2
}

doubleNumber(34)

//doubleNumber("Brad")

for i in 0...100 {
  let x = i * i
}

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.redColor()

view.backgroundColor = UIColor.blueColor()


class Person {
  var name = "John Doe"
  var age = 0
  
  func sayStuff() {
    println("stuff")
  }
  
}

class Developer : Person {
  init (name : String, age : Int) {
    super.init()
    self.name = name
    self.age = age
  }
  
  func googleStuff() {
    //google.com
  }
  
}

let brad = Developer(name: "Brad", age: 26)





















