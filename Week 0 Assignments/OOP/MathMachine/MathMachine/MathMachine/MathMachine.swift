//
//  MathMachine.swift
//  MathMachine
//
//  Created by Ale Mohamad on 10/01/2020.
//  Copyright © 2020 Cyril Garcia. All rights reserved.
//

import Foundation

class MathMachine {
    var results: Double?
    
    private var commands = [Command]()
    
    func command(_ c: Command) {
        commands.append(c)
    }
    
    func execute() {
        for command in commands {
            command.execute()
        }
        
        results = Stack.peek()
    }
}

protocol Command {
    func execute()
}

class Push: Command {
    private let x: Double
    
    required init(_ x: Double) {
        self.x = x
    }
    
    func execute() {
        Stack.push(self.x)
    }
}

class Add: Command {
    func execute() {
        if let first = Stack.pop(),
            let second = Stack.pop() {
            Stack.push(first + second)
        }
    }
}

class Sub: Command {
    func execute() {
        if let first = Stack.pop(),
            let second = Stack.pop() {
            Stack.push(first - second)
        }
    }
}

class Mul: Command {
    func execute() {
        if let first = Stack.pop(),
            let second = Stack.pop() {
            Stack.push(first * second)
        }
    }
}

class Div: Command {
    func execute() {
        if let first = Stack.pop(),
            let second = Stack.pop() {
            Stack.push(first / second)
        }
    }
}
