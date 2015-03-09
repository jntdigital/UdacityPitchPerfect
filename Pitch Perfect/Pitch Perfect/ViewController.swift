//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Joseph Thompson on 3/4/15.
//  Copyright (c) 2015 Joseph Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordinginProgress: UILabel!
    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecording.hidden = true
        recordButton.enabled = true
    }

    @IBAction func stopRecordingInProgress(sender: UIButton) {
        recordinginProgress.hidden = true
        stopRecording.hidden = true
        recordButton.enabled = true
        
    }

    @IBAction func recordAudio(sender: UIButton) {
        stopRecording.hidden = false
        recordinginProgress.hidden = false
        //TODO: Record voice
        
        recordButton.enabled = false
        println("in recordAudio")
        
    }
}

