//
//  ViewController.swift
//  mpp-ios
//
//  Created by Dexter Brylle Matos on 2/19/20.
//  Copyright © 2020 Dexter Brylle Matos. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupVideo()
    }

    func setupElements() {
        Utilities.styleFilledButton(signupButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    func setupVideo() {
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mov")
        
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.3)
    }

}

