//
//  ViewController.swift
//  ToolbarSample
//
//  Created by WangShuanghai on 2018/11/2.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        let toolbarHeight:CGFloat = 44 //默认高度
        
        let toolbar = UIToolbar(frame:CGRect(x:0,y:screen.size.height - toolbarHeight,width:screen.size.width,height:toolbarHeight))
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ViewController.save(_:)))
        
        let openButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(ViewController.open(_:)))
        
        let addButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(ViewController.add(_:)))
        
        let flexibleButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [saveButtonItem,flexibleButtonItem,addButtonItem,openButtonItem]
        self.view.addSubview(toolbar)
        
        //添加标签
        
        let labelWidth:CGFloat = 84
        let laberHeight:CGFloat = 21
        let laberTopView:CGFloat = 250
        
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2,y:laberTopView,width: labelWidth,height:laberHeight))
        
        self.label.textColor = UIColor.red
        self.label.text = "Label"
        
        //字体居中
        self.label.textAlignment = .center
        self.view.addSubview(self.label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

 @objc  func save(_ sender: AnyObject){
       // self.label.highlightedTextColor = UIColor.blue
        self.label.textColor = UIColor.green
        self.label.text = "点击Save"
    }
    
  @objc func open(_ sender:AnyObject){
        self.label.textColor = UIColor.brown
        self.label.text = "点击Open"
    }
    
    @objc func add(_ sender:AnyObject){
        self.label.textColor = UIColor.blue
        self.label.text = "add"
    }
    

}

