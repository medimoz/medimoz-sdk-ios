//
//  SimpleTableController.swift
//  SimpleVideoPlayer
//
//  Created by Ignacio Opazo Gana on 7/29/19.
//  Copyright © 2019 Moveapps SpA. All rights reserved.
//

import UIKit
import AVKit
//import MedimozSdk

class SimpleTableVideoController: UITableViewController {
    
    var videos : [Video] = Video.fetchVideos()
    
    var player = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        let video = videos[indexPath.row]
        cell.video = video
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
    }
    
    func playVideo(at indexPath: IndexPath) {
        let selectedVideo = videos[indexPath.row]
        var urlVideo = URL(string: "");
        if (selectedVideo.type == "local"){
            let videoPath = Bundle.main.path(forResource: selectedVideo.videoFileName, ofType: "mp4")
            urlVideo = URL(fileURLWithPath: videoPath!)
        }
        else {
            urlVideo = URL(string: selectedVideo.videoFileName)
        }
        
        let playerViewController = MedimozAVController()
        
        player = AVPlayer(url: urlVideo!)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: {
            playerViewController.player?.play()
            playerViewController.heartBeat = 5.0
            playerViewController.siteId = selectedVideo.siteId
            playerViewController.listeInit()
        })
    }
}




