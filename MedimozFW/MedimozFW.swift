//
//  Medimoz.swift
//  medimoz
//
//  Created by Ignacio Opazo Gana on 7/5/19.
//  Copyright © 2019 iopazog. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import MatomoTracker

open class MedimozAVController : AVPlayerViewController {
    
    var timer = Timer()
    var previousTime: Double = 0
    var stopped = false
    public var videoName = ""
    public var heartBeat = 5.0
    public var siteId = "1"
    public var urlPiwik : String = "https://mensis.medimoz.com/piwik.php"
    var heartBeatTimer = Timer()
    var matomoTracker = MatomoTracker(siteId: "1", baseURL: URL(string: "https://mensis.medimoz.com/piwik.php")!)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(goingToBackground), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(goingToBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appCameToForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "rate" && (change?[NSKeyValueChangeKey.newKey] as? Float) == 0 {
            heartBeatTimer.invalidate()
            stopped = true
        } else if keyPath == "rate" && (change?[NSKeyValueChangeKey.newKey] as? Float) == 1 {
            startHeartBeat();
            stopped = false
        }
    }
    
    open func listeInit() {
        
        self.matomoTracker = MatomoTracker(siteId: siteId, baseURL: URL(string: urlPiwik)!)
        
        self.player?.addObserver(self, forKeyPath: "rate", options: .new, context: nil)
        
        if #available(iOS 10.0, *) {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                let currentTime = self.player?.currentTime().seconds ?? 0
                if self.previousTime != currentTime && self.stopped {
                    self.heartBeatTimer.invalidate()
                }
                self.previousTime = currentTime
            })
        } else {
            // Fallback on earlier versions
            self.timer = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(getCurrentTimer),
                                              userInfo: nil,
                                              repeats: true)
        }
        self.startHeartBeat();
    }
    
    @objc private func goingToBackground() {
        heartBeatTimer.invalidate()
    }
    
    @objc private func getCurrentTimer() {
        let currentTime = self.player?.currentTime().seconds ?? 0
        if self.previousTime != currentTime && self.stopped {
            self.heartBeatTimer.invalidate()
        }
        self.previousTime = currentTime
    }
    
    @objc private func appCameToForeground() {
        startHeartBeat();
    }
    
    @objc private func interval() {
        
        let currentTime = self.player?.currentTime().seconds.rounded() ?? 0
        
        if videoName.count == 0 {
            let asset = self.player?.currentItem?.asset
            
            if asset !== nil {
                if let urlAsset = asset as? AVURLAsset {
                    videoName = urlAsset.url.lastPathComponent
                }
            }
        }
        
        if (Int(currentTime) % Int(self.heartBeat) == 0) {
            self.matomoTracker.track(eventWithCategory: "video", action: "time-\(Int(currentTime))", name: videoName, value: nil)
            self.matomoTracker.dispatch()
        }
    }
    
    private func startHeartBeat() {
        heartBeatTimer = Timer.scheduledTimer(timeInterval: heartBeat, target: self, selector: #selector(interval), userInfo: nil, repeats: true)
    }
    
    @objc private func playerDidFinishPlaying() {
        self.timer.invalidate()
        heartBeatTimer.invalidate()
    }
}
