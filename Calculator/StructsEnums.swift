//
//  StructsEnums.swift
//  Calculator
//
//  Created by Farhan Salam on 31/10/2022.
//

import Foundation

enum Operator: String{
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String{
    
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
