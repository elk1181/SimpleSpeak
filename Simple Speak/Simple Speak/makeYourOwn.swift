//
//  makeYourOwn.swift
//  Simple Speak
//
//  Created by Emma Koslow on 5/29/19.
//  Copyright © 2019 Emma Koslow. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import CoreData
class FriendsandFamilyViewController: UIViewController {
    override func viewDidLoad() {
       
    }
    var ex: Int = 20
    var ey: Int = 100
    var ewidth: Int = 100
    var eheight: Int = 50
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "Add Button", preferredStyle: .alert)
        
       
        alert.addTextField { (textField) in
            textField.text = "Name"
        }
        
       
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            print(textField!.text)
            let button = UIButton(frame: CGRect( x: self.ex, y: self.ey, width: self.ewidth, height: self.eheight))
            button.backgroundColor = .green
            button.setTitle(textField!.text, for: .normal)
            button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
         
            
            self.view.addSubview(button)
            
            
            
            
            self.ey=self.ey+100
            if self.ey==800{
                self.ex = self.ex+150
                self.ey=100
            }
            if self.ex>=200{
                  let alert = UIAlertController(title: "Stop", message: "You have too many buttons", preferredStyle: .alert)
                self.present(alert,animated:true, completion: nil)
                let when = DispatchTime.now() + 5
                DispatchQueue.main.asyncAfter(deadline: when){
                
                    alert.dismiss(animated: true, completion: nil)
                }
            }
           
    }))
        
     
        self.present(alert, animated: true, completion: nil)
       
    }
   
    @objc func buttonAction(sender: UIButton!) {
        
        
        let utterance = AVSpeechUtterance(string: sender.titleLabel!.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
       
    }
}
