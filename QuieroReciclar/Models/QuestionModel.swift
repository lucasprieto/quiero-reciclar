//
//  QuestionModel.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 28/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class QuestionModel {
    var question : String
    var answers : [AnswerModel]
    
    init(_ question: String) {
        self.question = question
        self.answers = []
    }
    
    func add(_ answers: AnswerModel...) {
        self.answers.append(contentsOf: answers)
    }
}
