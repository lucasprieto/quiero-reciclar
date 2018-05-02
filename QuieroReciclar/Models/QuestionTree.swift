//
//  QuestionTree.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 29/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class QuestionTree {
    var tree : QuestionModel
    var current : QuestionModel
    var complete : Bool
    var success: Bool
    var message: String?
    var type : QuestionnaireType
    
    init(tree: QuestionModel, type: QuestionnaireType) {
        self.tree = tree
        self.current = self.tree
        self.complete = false
        self.success = true
        self.type = type
    }
    
    func advance(response: String) {
        let s = self.current.answers.first { el in el.text == response }
        if let selectedAns = s {
            if let followingQuestion = selectedAns.next {
                current = followingQuestion
            } else {
                self.complete = true
                if selectedAns.notRecyclable {
                    self.success = false
                    self.message = selectedAns.reason
                }
            }
        } else {
            fatalError("No answer with that response string")
        }
    }
}
