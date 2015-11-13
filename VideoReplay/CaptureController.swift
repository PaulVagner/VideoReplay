//
//  ViewController.swift
//  VideoReplay
//
//  Created by Paul Vagner on 11/12/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import MobileCoreServices


class CaptureController: UIViewController   {

    
    @IBOutlet weak var liveView: UIView!
    
    @IBOutlet weak var recordStatusView: UIView!
    
let picker = UIImagePickerController()
    
    var captureTimer: NSTimer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        picker.sourceType = .Camera
        picker.showsCameraControls = false
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.delegate = self
        
        liveView.addSubview(picker.view)
        
    }
   
    override func viewDidLayoutSubviews() {
        
        picker.view.frame = liveView.frame
        
    }
    
    var captureTime: Double = 0.0
    
    
    func updateCaptureTime() {
        
        captureTime += 0.01
        
        if captureTime >= 10 {
            
        endCapture()
            
        }
        
    }
    
    var isCapturing: Bool = false
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
        isCapturing = true
        
        captureTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateCaptureTime", userInfo: nil, repeats: true)
        
        recordStatusView.backgroundColor = UIColor.redColor()
        picker.startVideoCapture()
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
                endCapture()
        
           }
    
    func endCapture() {
        
        //keep from firing once per recording
        guard isCapturing else { return }
        isCapturing = false
        
        captureTimer?.invalidate()
        captureTimer = nil
        
        recordStatusView.backgroundColor = UIColor.lightGrayColor()
        picker.stopVideoCapture()

    }
    
}

extension CaptureController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        guard captureTime > 1 else { return }
        
        // collect the file path for the video that was captured
        guard let url = info[UIImagePickerControllerMediaURL] as? NSURL else { return }
        
        guard let replayVC = storyboard?.instantiateViewControllerWithIdentifier("ReplayVC") as? ReplayController else { return }
        
        // push to the replay view controller
        replayVC.url = url
        
        
        // pass the path to the replay view controller
        navigationController?.pushViewController(replayVC, animated: true)
        
        
        }
    
}



















