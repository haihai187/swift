//
//  ViewController.swift
//  TestLabelButton
//
//  Created by WangShuanghai on 2018/10/31.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var Label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Btn1(_ sender: Any) {
        print("Btn1 onClick event!")
        self.Label1.text = "Hello world !!---Btn1"
        self.Label2.text = "Hello swift !! --- Btn1"
    }
    
    @IBAction func Btn2(_ sender: Any) {
        print("Btn2 onClick event!!")
        self.Label1.text = "Btn2,event! Hello!!"
        self.Label2.text = "Btn2  event! swift!!"
        
    }
}

