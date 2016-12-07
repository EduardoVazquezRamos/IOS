//: Playground - noun: a place where people can play

import UIKit
import AFNetworking

var str = "Hello, playground"

extension String {
    func reversa()-> String{
        print("Reversando")
        return "hola"
    }
    func IntValue () -> Int{
        return Int(self)!
    }
    func validar() -> Bool {
        return self.characters.first == "A"
    }
}

"Hola".validar()
"B".validar()
"Alan".validar()
"0".IntValue()

extension Int {
    func cuadrado() -> Int {
        return self * self
    }
}
    3.cuadrado()
