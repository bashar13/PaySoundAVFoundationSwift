//
//  ViewController.swift
//  PlaySoundAVFoundation
//
//  Created by Khairul Bashar on 18/5/18.
//  Copyright © 2018 Khairul Bashar. All rights reserved.
//
//  This program is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this program. Permission is granted to anyone to
//  use this program for any purpose.

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var displayLabel: UILabel!
    var audioPlayer:AVAudioPlayer! //creates an audio player object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = ""
    }
    
    //responses when a button been pressed and call playSound() function with the button tag
    @IBAction func buttonDidPresses(_ sender: UIButton){
        playSound(tagValue: sender.tag, buttonTitle: String((sender.title(for: .normal) ?? nil)!))
    }
    
    //Plays sound according to the button pressed
    func playSound(tagValue:Int, buttonTitle:String){
        var arrayOfSound = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
        let soundFile = arrayOfSound[tagValue - 1]
        
        //gets the URL of the selected sould file using Bundle identifier
        let soundURL = Bundle.main.url(forResource: soundFile, withExtension: "wav")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            
            audioPlayer.play()
            print(soundFile)
            updateDisplayLabel(buttonTitle: buttonTitle)
        }
        catch {
            print("Sound File Error")
            
        }
    }
    
    //displays the pressed button title on top
    func updateDisplayLabel(buttonTitle: String) {
        displayLabel.text = buttonTitle
    }


}

