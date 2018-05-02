//
//  AnswerModel.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 29/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation
import UIKit

class AnswerModel {
    var text : String
    var image : String?
    var next: QuestionModel?
    var notRecyclable: Bool
    var reason: String?
    
    init(_ text: String) {
        self.text = text
        self.notRecyclable = false
    }
    
    init(_ text: String, imageName: String) {
        self.text = text
        self.image = imageName
        self.notRecyclable = false
    }
    
    func hook(question: QuestionModel) {
        self.next = question
    }
    
    func flagNotRecyclable(_ reason: String) -> AnswerModel {
        self.notRecyclable = true
        self.reason = reason
        return self
    }
}
