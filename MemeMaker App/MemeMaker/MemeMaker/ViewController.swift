//
//  ViewController.swift
//  MemeMaker
//
//  Created by Administrator on 8/17/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    var topChoices = [CaptionOptions]()
    var bottomChoices = [CaptionOptions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstChoice = CaptionOptions(emoji: "💗", caption: "What is Love?")
        
        let secondChoice = CaptionOptions(emoji: "🤣", caption: "What is Laughter?")
        
        let thirdChoice = CaptionOptions(emoji: "🤬", caption: "What Makes You Angry?")
        
        topChoices = [firstChoice, secondChoice, thirdChoice]
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: topChoices.count,
                                             animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        
        
        let sealChoice = CaptionOptions(emoji: "🦭", caption: "A Seal-Ly moment !")
        
        let pandaChoice = CaptionOptions(emoji: "🐼", caption: "A panda-monium !")
        
        let owlChoice = CaptionOptions(emoji: "🦉", caption: "An Owl-Ver Commitement !")
        
        bottomChoices = [sealChoice, pandaChoice, owlChoice]
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: topChoices.count,
                                             animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        updatedCaptions()
    }
    
    func updatedCaptions () {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        
        
        let topChoice = topChoices[topIndex]
        let bottomChoice = bottomChoices[bottomIndex]
        
        topCaptionLabel.text = topChoice.caption
        bottomCaptionLabel.text = bottomChoice.caption
        
    }
    
    
    @IBAction func selectedChoice(_ sender: Any) {
        updatedCaptions()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                topCaptionLabel.center = sender.location(in: view)
            
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
}

