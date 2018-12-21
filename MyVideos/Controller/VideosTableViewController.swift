//
//  VideosTableViewController.swift
//  MyVideos
//
//  Created by David Tran on 8/22/18.
//  Copyright © 2018 Wallie. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideosTableViewController: UITableViewController
{
    var videos: [Video] = Video.fetchVideos()
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        let video = videos[indexPath.row]
        
        cell.video = video
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
    }
    
    
    func playVideo(at indexPath : IndexPath){
        let selectedVideo = videos[indexPath.row]
        let videoPath = Bundle.main.path(forResource: selectedVideo.videoFileName, ofType: "mp4")
        let videoPathUrl = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathUrl)
        playerViewController.player = player
        self.present(playerViewController , animated: true, completion: {
        self.playerViewController.player?.play()
        })
    }
}
