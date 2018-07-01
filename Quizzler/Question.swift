//
//  Question.swift
//  Fact Quiz
//
//  Created by Jo Thorpe on 23/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    //use this instead of writing i.e. questionText: String = ""
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
}


