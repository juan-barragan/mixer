//
//  ViewController.swift
//  mixer
//
//  Created by Juan Barragan on 24/03/2018.
//  Copyright © 2018 euterpy. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class ViewController: UIViewController {
    let sounds = AKSampler()
    @IBOutlet weak var tam: AKButton!
    override func viewDidLoad() {
        do {
            let hiTomFile = try AKAudioFile(readFileName: "hi_tom_D2.wav")
            try sounds.loadAudioFiles([hiTomFile])
            AudioKit.output = sounds
        } catch {
            print ("error reading file")
        }
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
        // Bad access here!
        tam.callback = { button in self.sounds.play() }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

