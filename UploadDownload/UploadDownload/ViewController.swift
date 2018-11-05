//
//  ViewController.swift
//  UploadDownload
//
//  Created by WangShuanghai on 2018/11/2.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var startToMove: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  @IBAction func downLoadProgress(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(download), userInfo: nil, repeats: true)
    }
    
@objc   func download(){
        self.progressView.progress = self.progressView.progress + 0.1
        if(self.progressView.progress == 1.0)
        {
            self.timer.invalidate()
            //self.progressView.progress = 0
            let alertController: UIAlertController = UIAlertController(title: "download completed!", message: "", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            self.present(alertController,animated: true,completion: nil)
            //self.progressView.progress = 0
        }

    }
    
    
    @IBAction func startToMove(_ sender: Any) {
        if(self.activityIndicatorView.isAnimating)
        {
            self.activityIndicatorView.stopAnimating()
        }else
        {
            self.activityIndicatorView.startAnimating()
        }
    }
    
    
   // self.view.backgroundColor = UIColor.black
   // let screen = UIScreen.main.bounds
    
    
}

