//
//  SelectOptionsViewController.swift
//  SignUpExample
//
//  Created by Ethan Petersen on 1/22/18.
//  Copyright © 2018 Ethan Petersen. All rights reserved.
//

import UIKit
import VizAISDK

class SelectOptionsViewController: UIViewController {
    @IBOutlet var optionButtons: [UIButton]!
    
    let messages = [
        "Please select another option.",
        "Something is wrong with your username, please enter a new one.",
        "Uh oh! Something went wrong.",
        "Try again."
    ]
    var numberTimesOptionPressed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for button in optionButtons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = button.titleColor(for: .normal)?.cgColor
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func optionButtonPressed(_ sender: Any) {
        numberTimesOptionPressed += 1
        if numberTimesOptionPressed >= 2 {
            VizAIApp.shared().stop_recording()
        }
        let randomIndex = Int(arc4random()) % messages.count
        let randomMessage = messages[randomIndex]
        let ac = UIAlertController.init(title: randomMessage, message: nil, preferredStyle: .alert)
        let closeAction = UIAlertAction.init(title: "Close", style: .cancel) { (_) in
            ac.dismiss(animated: true, completion: nil)
        }
        ac.addAction(closeAction)
        present(ac, animated: true, completion: nil)
    }
}
