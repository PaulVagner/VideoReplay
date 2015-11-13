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
    
    
    
    @IBOutlet weak var currentTimeTimer: UILabel!
    
    
    
    @IBOutlet weak var totalTimeTimer: UILabel!
    
    
    
    var url: NSURL!
    
    var videoPlayer = AVPlayerViewController()
    
    override func viewDidAppear(animated: Bool) {
        
        guard url != nil else { return print("URL not set!!") }
        
        replayView.addSubview(videoPlayer.view)
        videoPlayer.view.frame = replayView.frame
        
        videoPlayer.player = AVPlayer(URL: url)
        videoPlayer.showsPlaybackControls = false
        
        
        
    }
    
}
