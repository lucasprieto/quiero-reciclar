//
//  OrganicTreeFactory.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 1/5/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation
class OrganicTreeFactory {
    static func getNew() -> QuestionTree {
        let type = QuestionModel("Qué tipo de ogánico es?")
        let typeTea = AnswerModel("Saquitos de te o morra de cafe", imageName: "teabag")
        let typeVeg = AnswerModel("Restos de Vegetales", imageName: "vegetables")
        let typeFruit = AnswerModel("Restos de Frutas", imageName: "fruits")
        let typeFood = AnswerModel("Restos de Comida Elaborada", imageName: "food").flagNotRecyclable("No se puede hacer compost con estos restos")
        let typeSalad = AnswerModel("Ensalada de Vegetales / de Frutas", imageName: "salad")

        let salad = QuestionModel("La ensalada está condimentada o preparada?")
        let saladYes = AnswerModel("Si", imageName: "tick").flagNotRecyclable("No se puede hacer compost cuando las frutas o vegetales no están naturales.")
        let saladNo = AnswerModel("No", imageName: "cross")

        salad.add(saladYes, saladNo)
        typeSalad.hook(question: salad)
        type.add(typeVeg, typeFruit, typeFood, typeSalad, typeTea)

        return QuestionTree (tree: type, type: .organic)
    }
    
}
