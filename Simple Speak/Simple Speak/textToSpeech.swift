//
//  textToSpeech.swift
//  Simple Speak
//
//  Created by Emma Koslow on 5/29/19.
//  Copyright © 2019 Emma Koslow. All rights reserved.
//
import UIKit
import Foundation
import AVFoundation
class textSpeechViewController: UIViewController{

  
    override func viewDidLoad() {
        
        
    }


    @IBAction func ifPressed(_ sender: UIButton) {
      
    
        let utterance = AVSpeechUtterance(string: sender.titleLabel!.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
        
        
    }
    



