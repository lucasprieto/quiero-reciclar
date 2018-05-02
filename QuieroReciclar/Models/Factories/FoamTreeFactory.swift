//
//  FoamTreeFactory.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 30/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class FoamTreeFactory {
    static func getNew() -> QuestionTree {
        let clean = QuestionModel("¿Está limpio?")
        let cleanYes = AnswerModel("Si", imageName: "tick")
        let cleanNo = AnswerModel("No", imageName: "cross").flagNotRecyclable(Literals.notClean.rawValue)
        
        clean.add(cleanYes, cleanNo)
        
        return QuestionTree(tree: clean, type: .foam)
    }
}
