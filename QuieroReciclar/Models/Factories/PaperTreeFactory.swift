//
//  PaperTreeFactory.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 30/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation

class PaperTreeFactory {
    static func getNew() -> QuestionTree {
        let clean = QuestionModel("¿Está limpio?")
        let cleanYes = AnswerModel("Si", imageName: "tick")
        let cleanNo = AnswerModel("No", imageName: "cross").flagNotRecyclable(Literals.notCleanable.rawValue)
        
        let type = QuestionModel("¿Corresponde a alguno de los siguientes artículos?")
        let typeNapkin = AnswerModel("Papel Higienico", imageName: "toiletpaper").flagNotRecyclable("Estos tipos de papel son celulosa y no son reciclables")
        let typeEnvelope = AnswerModel("Sobres", imageName: "envelope")
        let typePost = AnswerModel("Post-It", imageName: "postit").flagNotRecyclable("Cualquier tipo de papel con pegamento no es reciclable.")
        let typePhoto = AnswerModel("Plastificado / Fotografía", imageName: "foto").flagNotRecyclable("La capa de plastificado contiene elementos no reciclables.")
        let typePaper = AnswerModel("Papel de Diario", imageName: "newspaper")
        let typeBook = AnswerModel("Cuadernos / Anotadores", imageName: "notebook")
        let typeCups = AnswerModel("Vasos y Platos", imageName: "papercup").flagNotRecyclable("Estos articulos tienen una capa de plastificado para resistir la comida. Esta capa contiene elementos no reciclables.")
        let typeCarton = AnswerModel("Cartón", imageName: "carton")
        
        let envelope = QuestionModel("Qué tipo de sobre es?")
        let envelopeYes = AnswerModel("Con Ventana", imageName: "envelopewindow").flagNotRecyclable("Si tiene ventana, se debe retirar antes de reciclar con los papeles.")
        let envelopeNo = AnswerModel("Sin Ventana", imageName: "envelope")
        
        let book = QuestionModel("El cuaderno / anotador tiene riel metalico?")
        let bookYes = AnswerModel("Si", imageName: "tick").flagNotRecyclable("Para poder reciclarlos como papel hay que remover el riel metalico.")
        let bookNo = AnswerModel("No", imageName: "cross")
        
        book.add(bookYes, bookNo)
        envelope.add(envelopeYes, envelopeNo)
        typeEnvelope.hook(question: envelope)
        typeBook.hook(question: book)
        type.add(typeNapkin, typeEnvelope, typePost, typePhoto, typePaper, typeBook, typeCups, typeCarton)
        cleanYes.hook(question: type)
        clean.add(cleanYes, cleanNo)
        
        return QuestionTree(tree: clean, type: .paper)
    }
}
