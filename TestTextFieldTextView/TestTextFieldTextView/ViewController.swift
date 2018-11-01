//
//  ViewController.swift
//  TestTextFieldTextView
//
//  Created by WangShuanghai on 2018/10/31.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("TextField 获得焦点，点击return键")
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n")
        {
            textView.resignFirstResponder()
            print("TextView 获得焦点，点击return键")
            return false
        }
       
        return true
    }


}

