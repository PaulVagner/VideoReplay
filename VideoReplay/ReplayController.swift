//
//  ReplayController.swift
//  VideoReplay
//
//  Created by Paul Vagner on 11/12/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import AVKit

import AVFoundation

class ReplayController: UIViewController {

    @IBOutlet weak var replayView: UIView!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    var url: NSURL!
    
    var videoPlayer = AVPlayerViewController()
    
    var currentTimeTimer: NSTimer?
    
    var totalTimeTimer: NSTimer?
    
    override func viewDidLoad() {
        
        updateCurrentTime()
        
        currentTimeTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateCurrentTime", userInfo: nil, repeats: true)
    
    
    }
    
    func updateCurrentTime() {
        
        let date = NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        currentTimeLabel.text = formatter.stringFromDate(date)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        guard url != nil else { return print("URL not set!!") }
        
        replayView.addSubview(videoPlayer.view)
        videoPlayer.view.frame = replayView.frame
        
        videoPlayer.player = AVPlayer(URL: url)
        videoPlayer.showsPlaybackControls = false
        
    }
    
}
