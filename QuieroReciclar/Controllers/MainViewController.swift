//
//  ViewController.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 28/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var glassSelector : UIView!
    @IBOutlet weak var plasticSelector : UIView!
    @IBOutlet weak var metalSelector : UIView!
    @IBOutlet weak var foamSelector : UIView!
    @IBOutlet weak var paperSelector : UIView!
    @IBOutlet weak var organicSelector : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let glassGesture = UITapGestureRecognizer(target: self, action: #selector(selectGlass))
        let plasticGesture = UITapGestureRecognizer(target: self, action: #selector(selectPlastic))
        let metalGesture = UITapGestureRecognizer(target: self, action: #selector(selectMetal))
        let foamGesture = UITapGestureRecognizer(target: self, action: #selector(selectFoam))
        let paperGesture = UITapGestureRecognizer(target: self, action: #selector(selectPaper))
        let organicGesture = UITapGestureRecognizer(target: self, action: #selector(selectOrganic))
        
        glassSelector.addGestureRecognizer(glassGesture)
        plasticSelector.addGestureRecognizer(plasticGesture)
        metalSelector.addGestureRecognizer(metalGesture)
        foamSelector.addGestureRecognizer(foamGesture)
        paperSelector.addGestureRecognizer(paperGesture)
        organicSelector.addGestureRecognizer(organicGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func selectGlass() {
        goToQuestionnaire(title: "Vidrio", tree: GlassTreeFactory.getNew())
    }
    
    @objc func selectPlastic() {
        goToQuestionnaire(title: "Plástico", tree: PlasticTreeFactory.getNew())
    }
    
    @objc func selectMetal() {
        goToQuestionnaire(title: "Metal", tree: MetalTreeFactory.getNew())
    }
    
    @objc func selectFoam() {
        goToQuestionnaire(title: "Telgopor", tree: FoamTreeFactory.getNew())
    }
    
    @objc func selectPaper() {
        goToQuestionnaire(title: "Papel / Cartón", tree: PaperTreeFactory.getNew())
    }
    
    @objc func selectOrganic() {
        goToQuestionnaire(title: "Orgánico", tree: OrganicTreeFactory.getNew())
    }
    
    func goToQuestionnaire(title: String, tree: QuestionTree) {
        if let questionaireController = storyboard?.instantiateViewController(withIdentifier: "questonnaire") {
            let qvc = questionaireController as! QuestonnaireViewController
            qvc.title = title
            qvc.tree = tree
            self.navigationController?.pushViewController(questionaireController, animated: true)
        }
    }

}

