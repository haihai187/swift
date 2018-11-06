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
    var buttonStartCalc:UIButton!
    var labelDescribeResult:UILabel!
    
    var ScoreResult : Float = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreen.main.bounds
        
        //添加开始计算按钮
        let buttonStartCalcWidth:CGFloat = 100
        let buttonStartCalcHeight:CGFloat = 35
        let buttonStartCalcTopView:CGFloat = 165
        
        let buttonStartCalc = UIButton(type: UIButton.ButtonType.system)
        
        buttonStartCalc.setTitle("开始计算", for: UIControl.State.normal)
        buttonStartCalc.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        buttonStartCalc.backgroundColor = UIColor.lightGray
        buttonStartCalc.frame = CGRect(x:(screen.size.width - buttonStartCalcWidth)/2,y:buttonStartCalcTopView,width:buttonStartCalcWidth,height:buttonStartCalcHeight)
        
        buttonStartCalc.addTarget(self, action: #selector(onStartCalc(_:)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(buttonStartCalc)
        
        
        
        //添加姓名标签
        let labelNameWidth:CGFloat = 60
        let labelNameHeight:CGFloat = 40
        let labelNameTopView:CGFloat = 100
        
        self.labelName = UILabel(frame: CGRect(x:20,y:labelNameTopView,width:(screen.size.width - labelNameWidth)/3,height:labelNameHeight))
        
        self.labelName.text = "姓 名："
        self.labelName.textAlignment = .left
        self.view.addSubview(labelName)
        
        //添加分数标签
        
        let labelScoreWidth:CGFloat = 60
        let labelScoreHeight:CGFloat = 40
        let labelScoreTopView:CGFloat = 220
        
       self.labelScore = UILabel(frame: CGRect(x:20,y:labelScoreTopView,width:(screen.size.width - labelScoreWidth)/3,height:labelScoreHeight))
        
        self.labelScore.text = "分 数:"
        self.labelScore.textAlignment = .left
        self.view.addSubview(labelScore)
        
        
        //添加分数结果标签
        let labelScoreResultWidth:CGFloat = 60
        let labelScoreResultHeight:CGFloat = 40
        let labelScoreResultTopView:CGFloat = 220
        
        self.labelScoreResult = UILabel(frame: CGRect(x:20,y:labelScoreResultTopView,width:(screen.size.width - labelScoreResultWidth)/2,height:labelScoreResultHeight))
        
        self.labelScoreResult.text = String(ScoreResult)
        self.labelScoreResult.textAlignment = .center
        self.view.addSubview(labelScoreResult)
        
        //添加描述标签
        
        let labelDescribeWidth:CGFloat = 60
        let labelDescribeHeight:CGFloat = 40
        let labelDescribeTopView:CGFloat = 280
        
        self.labelDescribe = UILabel(frame: CGRect(x:20,y:labelDescribeTopView,width:(screen.size.width - labelDescribeWidth)/3,height:labelDescribeHeight))
        
        self.labelDescribe.text = "描 述:"
        self.labelDescribe.textAlignment = .left
        self.view.addSubview(labelDescribe)
        //添加描述结果Tabel
        let labelDescribeResultWidth:CGFloat = 230
        let labelDescribeResultHeight:CGFloat = 100
        let labelDescribeResultTopView:CGFloat = 320
        
        
        //创建NavigtaionBar
        let navigationBarHeight:CGFloat = 44
        
        let navigationBar = UINavigationBar(frame: CGRect(x:0,y:20,width:screen.size.width,height:navigationBarHeight))
        let navigationItem = UINavigationItem(title: "人品计算器")
        
        navigationBar.items = [navigationItem]
        self.view.addSubview(navigationBar)
        
        let shareButtonItem = UIBarButtonItem(title: "分享", style:.plain, target: self, action: #selector(ViewController.share(_:)))
        
        
      navigationItem.rightBarButtonItem = shareButtonItem
        
        // Do any additional setup after loading the view, typically from a nib.
        //创建textField
        
        let textFieldWidth:CGFloat = 220
        let textFieldHeight:CGFloat = 30
        let textFieldTopView:CGFloat = 105
        
        let textFieldFram = CGRect(x:(screen.size.width - textFieldWidth)/2,y:textFieldTopView,width:textFieldWidth,height:textFieldHeight)
        
        let textField = UITextField(frame: textFieldFram)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.delegate = self //委托协议/return
        
        textField.clearButtonMode = .whileEditing     //清除已经输入的文本
        textField.returnKeyType = UIReturnKeyType.go //设置键盘return类型
        textField.keyboardType = UIKeyboardType.default   //设置键盘类型
        
        self.view.addSubview(textField)
        
        //创建开始计算按钮
        
    }

    @objc func share(_ sender:AnyObject)
    {
        print("share")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("点击Go")
        textField.resignFirstResponder()
        return true
    }
    @objc func onStartCalc(_ sender:AnyObject)
    {
        print("开始计算")
        ScoreResult = 99.8
        
        self.labelScoreResult.text = String(ScoreResult)
    }

}

