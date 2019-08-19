//
//  SimpleTableController.swift
//  SimpleVideoPlayer
//
//  Created by Ignacio Opazo Gana on 7/29/19.
//  Copyright © 2019 Moveapps SpA. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell
{
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var video: Video! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        thumbnailImageView.image = UIImage(named: video.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 8.0
        thumbnailImageView.layer.masksToBounds = true
        
        usernameLabel.text = video.authorName
    }
}
