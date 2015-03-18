//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Joseph Thompson on 3/9/15.
//  Copyright (c) 2015 Joseph Thompson. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var PlaySlowAudio: UIButton!
    @IBOutlet weak var PlayFastAuido: UIButton!
    @IBOutlet weak var StopPlaying: UIButton!
    @IBOutlet weak var PlayChipmunk: UIButton!
    @IBOutlet weak var PlayDarthVader: UIButton!
    @IBOutlet weak var PlayReverb: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var recievedAudio:RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathURL, error: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        //change button alphas
        PlaySlowAudio.alpha = 0.8
        PlayFastAuido.alpha = 0.8
        PlayChipmunk.alpha = 0.8
        PlayDarthVader.alpha = 0.8
        PlayReverb.alpha = 0.8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowAudio(sender: UIButton) {
        //change button alphas
        PlaySlowAudio.alpha = 1.0
        PlayFastAuido.alpha = 0.3
        PlayChipmunk.alpha = 0.3
        PlayDarthVader.alpha = 0.3
        PlayReverb.alpha = 0.3
        
        // Play slow Audio here
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        StopPlaying.hidden = false
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        //change button alphas
        PlaySlowAudio.alpha = 0.3
        PlayFastAuido.alpha = 1.0
        PlayChipmunk.alpha = 0.3
        PlayDarthVader.alpha = 0.3
        PlayReverb.alpha = 0.3
        
        
        //Play Fast audio here
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        StopPlaying.hidden = false
    }
    
    @IBAction func stopPlayback(sender: UIButton) {
        //stop playback
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        //change button alphas
        PlaySlowAudio.alpha = 0.8
        PlayFastAuido.alpha = 0.8
        PlayChipmunk.alpha = 0.8
        PlayDarthVader.alpha = 0.8
        PlayReverb.alpha = 0.8
    }
    
    @IBAction func playReverbAudio(sender: UIButton) {
        //change button alphas
        PlaySlowAudio.alpha = 0.3
        PlayFastAuido.alpha = 0.3
        PlayChipmunk.alpha = 0.3
        PlayDarthVader.alpha = 0.3
        PlayReverb.alpha = 1.0
        
        playAudioWithReverb(80)
        
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        //change button alphas
        PlaySlowAudio.alpha = 0.3
        PlayFastAuido.alpha = 0.3
        PlayChipmunk.alpha = 1.0
        PlayDarthVader.alpha = 0.3
        PlayReverb.alpha = 0.3
        
        
        playAudioWithVariablePitch(1000)
        StopPlaying.hidden = false
        
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        //change button alphas
        PlaySlowAudio.alpha = 0.3
        PlayFastAuido.alpha = 0.3
        PlayChipmunk.alpha = 0.3
        PlayDarthVader.alpha = 1.0
        PlayReverb.alpha = 0.3
        
        
        playAudioWithVariablePitch(-1000)
    }
    
    
    func playAudioWithVariablePitch(pitch: Float){
        
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    func playAudioWithReverb(reverb: Float){
        
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var reverbEffect = AVAudioUnitReverb()
        reverbEffect.wetDryMix = reverb
        audioEngine.attachNode(reverbEffect)
        
        audioEngine.connect(audioPlayerNode, to: reverbEffect, format: nil)
        audioEngine.connect(reverbEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
