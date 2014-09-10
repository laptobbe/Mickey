//
//  PlayerViewController.swift
//  Mickey
//
//  Created by Tobias Sundstrand on 2014-09-06.
//  Copyright (c) 2014 Computertalk Sweden. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    let audioPlayer = TSAudioStreamer(URL: NSURL(string: "http://podcasts.thoughtbot.com/buildphase/51.mp3"))
    let timeFormatter = TSTimeFormatter(formattingStyle: TSTimeFormatterAdoptiveStyle)
    var timer:NSTimer? = nil
    
    @IBOutlet var progressView: UISlider!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var totalTimeLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "refreshView:", userInfo: nil, repeats: true)
        self.audioPlayer.prime()
    }
    
    func refreshView(timer:NSTimer) {
        self.currentTimeLabel.text = "\(self.timeFormatter.formattedTimeFromTimeInterval(self.audioPlayer.currentTime()))"
    }
    
    @IBAction func previousButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func playButtonPressed(sender: UIButton) {
        if(self.audioPlayer.play()) {

            self.currentTimeLabel.text = "\(self.timeFormatter.formattedTimeFromTimeInterval(self.audioPlayer.currentTime()))"
            self.totalTimeLabel.text = "\(self.timeFormatter.formattedTimeFromTimeInterval(self.audioPlayer.totalTime()))"

        }else {
            println("Play failed!")
        }
        
    }
    
}
