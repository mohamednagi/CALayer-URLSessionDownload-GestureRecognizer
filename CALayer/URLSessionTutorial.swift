//
//  URLSessionTutorial.swift
//  CALayer
//
//  Created by Sierra on 5/8/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit

class URLSessionTutorial: UIViewController , URLSessionDownloadDelegate{
    override var preferredStatusBarStyle: UIStatusBarStyle{return .lightContent}
    
    @IBOutlet weak var photoView: UIImageView!
    var downloadTask : URLSessionDownloadTask!
    var backgroundSession : URLSession!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "background")
        backgroundSession = URLSession(configuration: backgroundConfig, delegate: self, delegateQueue: OperationQueue())
        progressView.setProgress(0.0, animated: false)
        
    }
    
    
    @IBAction func Start(_ sender: UIButton) {
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")
        if let url = url {
            downloadTask = backgroundSession.downloadTask(with: url)
            downloadTask.resume()
        }
    }
    @IBAction func Stop(_ sender: UIButton) {
        if downloadTask != nil {
            downloadTask.cancel()
        }
    }
    @IBAction func Pause(_ sender: UIButton) {
        if downloadTask != nil {
            downloadTask.suspend()
        }
    }
    @IBAction func Resume(_ sender: UIButton) {
        if downloadTask != nil {
            downloadTask.resume()
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //        print("download finish successfuly")
        let data = try? Data(contentsOf: location)
        if let data = data{
            DispatchQueue.main.async {
                self.photoView.image = UIImage(data: data)
            }
        }
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.progressView.setProgress(progress, animated: true)
        }
//        print(progress)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        downloadTask = nil
        DispatchQueue.main.async {
            self.progressView.setProgress(0.0, animated: false)
        }
        
        if error != nil{
            print(error!.localizedDescription)
        }else{
            print("the task completed successfully")
        }
    }
}
