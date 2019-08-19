//
//  Video.swift
//  Play Local Videos
//
//  Created by David Tran on 8/21/18.
//  Copyright © 2018 Wallie. All rights reserved.
//

import Foundation

struct Video
{
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    let siteId: String
    let heartBeat: Double
    let type: String
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(authorName: "David Tran", videoFileName: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", description: "This is an example of local video.", thumbnailFileName: "v1", siteId: "1", heartBeat: 5.0, type: "streaming")
        let v2 = Video(authorName: "Tracy Noah", videoFileName: "v2", description: "This is an example of local video.", thumbnailFileName: "v2", siteId: "1", heartBeat: 5.0, type: "local")
        let v3 = Video(authorName: "Brendon Burchard", videoFileName: "v3", description: "This is an example of local video.", thumbnailFileName: "v3", siteId: "25", heartBeat: 5.0, type: "local")
        let v4 = Video(authorName: "Elon Musk", videoFileName: "v4", description: "This is an example of local video.", thumbnailFileName: "v4", siteId: "25", heartBeat: 5.0, type: "local")
        let v5 = Video(authorName: "David Tran", videoFileName: "v5", description: "This is an example of local video.", thumbnailFileName: "v5", siteId: "1", heartBeat: 5.0, type: "local")
        let v6 = Video(authorName: "Steve Jobs", videoFileName: "https://c13-live-1.cdn.nedmedia.io/index.m3u8", description: "This is an example of local video.", thumbnailFileName: "v6", siteId: "25", heartBeat: 5.0, type: "streaming")
        
        return [v1, v2, v3, v4, v5, v6]
    }
    
    static func getVideo() -> Video {
        return Video(authorName: "David Tran", videoFileName: "v1", description: "This is an example of local video.", thumbnailFileName: "v1", siteId: "25", heartBeat: 60.0, type: "local")
    }
}
