//
//  MetalTreeFactory.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 30/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class MetalTreeFactory {
    static func getNew() -> QuestionTree {
        let clean = QuestionModel("¿Está limpio?")
        let cleanYes = AnswerModel("Si", imageName: "tick")
        let cleanNo = AnswerModel("No", imageName: "cross").flagNotRecyclable(Literals.notClean.rawValue)
        
        let type = QuestionModel("¿Corresponde a alguno de los siguientes artículos?")
        let typeNail = AnswerModel("Clavos / Tornillos", imageName: "tornillo")
        let typeCan = AnswerModel("Latas", imageName: "can")
        let typeSpray = AnswerModel("Aerosol", imageName: "spraypaint").flagNotRecyclable("Este tipo de envase tiene gases y contenidos contaminantes, no solo para lo reciclado sino también para el medio ambiente.")
        let typeHanger = AnswerModel("Percha", imageName: "hanger").flagNotRecyclable("El Plástico con el que está recubierto no es reciclable.")
        let typeCopper = AnswerModel("Cobre / Bronce / Latón")
        let typeKey = AnswerModel("Llave", imageName: "key")
        
        let can = QuestionModel("La lata es de pintura o de gaseosa?")
        let canPaint = AnswerModel("Pintura", imageName: "paint").flagNotRecyclable("La pintura contamina todo lo ya reciclado.")
        let canSoda = AnswerModel("Gaseosa", imageName: "can")
        
        can.add(canPaint, canSoda)
        typeCan.hook(question: can)
        type.add(typeNail, typeCan, typeSpray, typeHanger, typeCopper, typeKey)
        cleanYes.hook(question: type)
        clean.add(cleanYes, cleanNo)
        
        return QuestionTree(tree: clean, type: .metal)
    }
    
}
