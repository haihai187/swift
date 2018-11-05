//
//  ViewController.swift
//  renPinCalculator
//
//  Created by WangShuanghai on 2018/11/5.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    var labelName: UILabel!
    var labelScore:UILabel!
    var labelDescribe:UILabel!
    var labelScoreResult:UILabel!
    
    var ScoreResult : Float = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        //添加姓名标签
        let labelNameWidth:CGFloat = 60
        let labelNameHeight:CGFloat = 40
        let labelNameTopView:CGFloat = 80
        
        self.labelName = UILabel(frame: CGRect(x:0,y:labelNameTopView,width:(screen.size.width - labelNameWidth)/3,height:labelNameHeight))
        
        self.labelName.text = "姓 名："
        self.labelName.textAlignment = .left
        self.view.addSubview(labelName)
        
        //添加分数标签
        
        let labelScoreWidth:CGFloat = 60
        let labelScoreHeight:CGFloat = 40
        let labelScoreTopView:CGFloat = 160
        
       self.labelScore = UILabel(frame: CGRect(x:0,y:labelScoreTopView,width:(screen.size.width - labelScoreWidth)/3,height:labelScoreHeight))
        
        self.labelScore.text = "分 数:"
        self.labelScore.textAlignment = .left
        self.view.addSubview(labelScore)
        
        
        //添加分数结果标签
        let labelScoreResultWidth:CGFloat = 60
        let labelScoreResultHeight:CGFloat = 40
        let labelScoreResultTopView:CGFloat = 160
        
        self.labelScoreResult = UILabel(frame: CGRect(x:0,y:labelScoreResultTopView,width:(screen.size.width - labelScoreResultWidth)/2,height:labelScoreResultHeight))
        
        self.labelScoreResult.text = String(ScoreResult)
        self.labelScoreResult.textAlignment = .center
        self.view.addSubview(labelScoreResult)
        
        //添加描述标签
        
        let labelDescribeWidth:CGFloat = 60
        let labelDescribeHeight:CGFloat = 40
        let labelDescribeTopView:CGFloat = 220
        
        self.labelDescribe = UILabel(frame: CGRect(x:0,y:labelDescribeTopView,width:(screen.size.width - labelDescribeWidth)/3,height:labelDescribeHeight))
        
        self.labelDescribe.text = "描 述:"
        self.labelDescribe.textAlignment = .left
        self.view.addSubview(labelDescribe)
        
        //创建NavigtaionBar
        let navigationBarHeight:CGFloat = 44
        
        let navigationBar = UINavigationBar(frame: CGRect(x:0,y:20,width:screen.size.width,height:navigationBarHeight))
        let navigationItem = UINavigationItem(title: "人品计算器")
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        let shareButtonItem = UIBarButtonItem(title: "分享", style:.plain, target: self, action: #selector(ViewController.share(_:)))
        
        
      navigationItem.rightBarButtonItem = shareButtonItem
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let textFieldWidth:CGFloat = 223
        let textFieldHeight:CGFloat = 30
        let textFieldTopView:CGFloat = 125
        
        let textFieldFram = CGRect(x:(screen.size.width - textFieldWidth)/3,y:textFieldTopView,width:textFieldWidth,height:textFieldHeight)
        
        let textField = UITextField(frame: textFieldFram)
    
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.clearButtonMode = .whileEditing
        
        self.view.addSubview(textField)
    }

    @objc func share(_ sender:AnyObject)
    {
        print("share")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textView(_ textView:UITextView,shouldChangeTexInRange range:NSRange,replacementText text:String)->Bool{if(text == "\n"){return false}
        return true
    }
}

