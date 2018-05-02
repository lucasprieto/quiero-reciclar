//
//  QuestonaryViewController.swift
//  QuieroReciclar
//
//  Created by Lucas Prieto on 28/4/18.
//  Copyright © 2018 blunoid. All rights reserved.
//

import Foundation
import UIKit

class QuestonnaireViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var tree : QuestionTree?
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstQuestion = viewForCurrent()

        pushNewView(view: firstQuestion, scroll: false)

    }
    
    
    
    @objc func answerTapped(_ sender: Any) {
        let from = sender as! UITapGestureRecognizer
        let view = from.view as! AnswerView
        
        self.tree!.advance(response: view.label.text!)
        self.counter += 1
        if self.tree!.complete {
            
            if self.tree!.success {
                // puedo reciclar
                let recView = getSuccessView()
                self.pushNewView(view: recView, scroll: true)
            } else {
                // no se puede reciclar
                let notRecView = getFailureView(reason: self.tree!.message)
                self.pushNewView(view: notRecView, scroll: true)
            }
        } else {
            //crear y pushear nueva vista
            let newView = viewForCurrent()
            self.pushNewView(view: newView, scroll: true)
            
        }
        
    }
    
    func viewForCurrent() -> QuestionView {
        frame.origin.x = scrollView.frame.size.width * CGFloat(self.counter)
        frame.size = scrollView.frame.size
        
        let qView = Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)?.first as! QuestionView
        qView.frame = frame
        qView.question.text = tree!.current.question
        
        for (ix, ans) in tree!.current.answers.enumerated() {
            
            let aView = Bundle.main.loadNibNamed("AnswerView", owner: self, options: nil)?.first as! AnswerView
            aView.label.text = ans.text
            if let img = ans.image {
                aView.image.image = UIImage(named: img)
            }
            aView.tap.addTarget(self, action: #selector(answerTapped))
            
            if case 0...1 = ix {
                qView.topRow.addArrangedSubview(aView)
            } else if case 2...3 = ix {
                qView.bottomRow.addArrangedSubview(aView)
            } else {
                if ix % 2 == 0 {
                    qView.topRow.addArrangedSubview(aView)
                } else {
                    qView.bottomRow.addArrangedSubview(aView)
                }
            }
            
        }
        
        return qView
    }
    
    func pushNewView(view: UIView, scroll: Bool) {
        self.scrollView.addSubview(view)
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(counter + 1)), height: scrollView.frame.size.height)
        
        if scroll {
            scrollView.setContentOffset(CGPoint(x: (scrollView.frame.size.width * CGFloat(counter)), y: 0), animated: true)
        }
    }
    
    func getSuccessView() -> RecyclableView {
        frame.origin.x = scrollView.frame.size.width * CGFloat(self.counter)
        frame.size = scrollView.frame.size
        
        let rView = Bundle.main.loadNibNamed("RecyclableView", owner: self, options: nil)?.first as! RecyclableView
        rView.frame = frame
        if self.tree!.type == .organic {
            rView.title.text = "¡Apto para Compost!"
        }
        
        return rView
    }
    
    func getFailureView(reason: String?) -> NotRecyclableView {
        frame.origin.x = scrollView.frame.size.width * CGFloat(self.counter)
        frame.size = scrollView.frame.size
        
        let nrView = Bundle.main.loadNibNamed("NotRecyclableView", owner: self, options: nil)?.first as! NotRecyclableView
        nrView.frame = frame
        if self.tree!.type == .organic {
            nrView.title.text = "No apto para Compost"
        }
        nrView.recomendation.text = reason
        
        return nrView
    }
    
    //    @objc func answerYes() {
    //        print("Yes")
    //        current = current + 1
    //        if(current < questions.count) {
    //
    //            pageControl.currentPage = current
    //        } else {
    //
    //        }
    //    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
