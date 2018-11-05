//
//  ViewController.swift
//  NavigationBarSample
//
//  Created by WangShuanghai on 2018/11/5.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screen = UIScreen.main.bounds
        
        //创建Toolbar
//        let toolbarHeight:CGFloat = 44 //默认高度
//
//        let toolbar = UIToolbar(frame: CGRect(x: 0,y:screen.size.height - toolbarHeight,width: screen.size.width,height: toolbarHeight))
        
        
        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ViewController.save(_:)))
        
//        let openButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(ViewController.open(_:)))
//
        
        //创建NavigtaionBar
        let navigationBarHeight:CGFloat = 44   //44 是默认高度
        let navigationBar = UINavigationBar(frame: CGRect(x:0,y:20,width:screen.size.width,height:navigationBarHeight))
        
//        let saveButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ViewController.save(_:)))
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.add(_:)))
        
//        toolbar.items = [saveButtonItem,openButtonItem]
//        
//        self.view.addSubview(toolbar)
        
        let navigationItem = UINavigationItem(title: "人品计算器")
        
    
        navigationItem.leftBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        //添加标签
        let labelWidth:CGFloat = 84
        let labelHeight:CGFloat = 21
        let labelTopView:CGFloat = 198
        self.label = UILabel(frame: CGRect(x:(screen.size.width - labelWidth)/2,y:labelTopView,width:labelWidth,height:labelHeight))
        self.label.text = "Label"
        
        //字体居中
        self.label.textAlignment = .center
        
        self.view.addSubview(label)
    }
    
    @objc func save(_ sender:AnyObject)
    {
        self.label.textColor = UIColor.red
        self.label.text = "点击Save"
    }
    
    @objc func add(_ sender:AnyObject)
    {
        self.label.textColor = UIColor.blue
        self.label.text = "点击Add"
    }
    
//    @objc func open(_ sender:AnyObject)
//    {
//        self.label.textColor = UIColor.green
//        self.label.text = "点击Open"
//    }


}

