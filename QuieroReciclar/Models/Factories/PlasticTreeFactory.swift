//
//  PlasticModel.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 28/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class PlasticTreeFactory {
    static func getNew() -> QuestionTree {
        let clean = QuestionModel("¿Está limpio y seco?")
        let cleanYes = AnswerModel("Si", imageName: "tick")
        let cleanNo = AnswerModel("No", imageName: "cross").flagNotRecyclable(Literals.notClean.rawValue)
        
        let plasticCat = QuestionModel("¿Corresponde a alguno de los siguientes artículos?")
        cleanYes.hook(question: plasticCat)
        
        let catEnvoltorio = AnswerModel("Envoltorio", imageName: "envoltorio")
        
        let symbol = QuestionModel("¿Exhibe un símbolo de reciclaje con un numero del 1 al 6?")
        let symbolYes = AnswerModel("Si", imageName: "tick")
        let symbolNo = AnswerModel("No", imageName: "cross").flagNotRecyclable("Son plásticos que tienen procesos mas complicados.")
        catEnvoltorio.hook(question: symbol)
        
        let catBotella = AnswerModel("Botella / Bidón", imageName: "bottle")
        let catPote = AnswerModel("Pote", imageName: "pote")
        let catSachet = AnswerModel("Sachet", imageName: "sachet")
        let catBolsa = AnswerModel("Bolsa", imageName: "plasticbag")
        
        
        clean.add(cleanYes, cleanNo)
        plasticCat.add(catEnvoltorio, catBotella, catPote, catSachet, catBolsa)
        symbol.add(symbolYes, symbolNo)
        
        return QuestionTree(tree: clean, type: .plastic)
    }
    
    
}
