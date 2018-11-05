//
//  ViewController.swift
//  AlertViewActionSheet
//
//  Created by WangShuanghai on 2018/11/1.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!                   //定义一个label控件变量
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screen = UIScreen.main.bounds
        
        let buttonAlertView = UIButton(type: UIButton.ButtonType.system)
        buttonAlertView.setTitle("Test警告", for: UIControl.State())
        
        let buttonAlertViewWidth: CGFloat = 100
        let buttonAlertViewHeight: CGFloat = 30
        let buttonAlertViewTopView: CGFloat = 130
        
        //ok
        let buttonOk = UIButton(type:UIButton.ButtonType.system)
        buttonOk.setTitle("Ok", for: UIControl.State.normal)
        
        let buttonOkWidth:CGFloat = 60
        let buttonOkHeight: CGFloat = 20
        let buttonOKTopView: CGFloat = 90
        
        buttonOk.frame = CGRect(x:(screen.size.width - buttonOkWidth)/2,y:buttonOKTopView,width:buttonOkWidth,height:buttonOkHeight)
        
        buttonAlertView.frame = CGRect(x:(screen.size.width - buttonAlertViewWidth)/2,y:buttonAlertViewTopView,width: buttonAlertViewWidth,height: buttonAlertViewHeight)
        self.view.addSubview(buttonOk)
        
        //label
        let labelWidth:CGFloat = 90
        let labelHeight:CGFloat = 20
        let labelTopView:CGFloat = 190
        
        let labelFrame = CGRect(x:(screen.size.width - labelWidth)/2,y:labelTopView,width:labelWidth,height:labelHeight)
        
        label = UILabel(frame:labelFrame)
        label.textColor = UIColor.red
        label.text = "Hello"
        
        label.textAlignment = NSTextAlignment.center
        
         buttonOk.addTarget(self, action: #selector(onClick(_:)), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(label)
      
        //指定事件处理方法
        buttonAlertView.addTarget(self, action: #selector(testAlertView(_:)), for:.touchUpInside)
        self.view.addSubview(buttonAlertView)
        
        let buttonActionSheet = UIButton(type: UIButton.ButtonType.system)
        buttonActionSheet.setTitle("Test操作表", for: UIControl.State())
        
        let buttonActionSheetWidth: CGFloat = 100
        let buttonActionSheetHeight: CGFloat = 30
        let buttonActionSheetTopView: CGFloat = 260
        
        buttonActionSheet.frame = CGRect(x:(screen.size.width - buttonActionSheetWidth)/2,y:buttonActionSheetTopView,width: buttonActionSheetWidth,height: buttonActionSheetHeight)
        //指定事件处理方法
        
        buttonActionSheet.addTarget(self, action: #selector(testActionSheet(_:)), for:.touchUpInside)
        self.view.addSubview(buttonActionSheet)
    }
    //指定OK按钮事件
    @objc func onClick(_ sender: AnyObject)
    {
        self.label.textColor = UIColor.blue
        self.label.text = "来自火星的🥔"
        
    }
    
    @objc func testAlertView(_ sender: AnyObject){
        let alertController: UIAlertController = UIAlertController(title: "Alert",message: "Alert text goes here",preferredStyle: UIAlertController.Style.alert)
        
        let noAction = UIAlertAction(title: "No",style: .cancel){(alertAction) -> Void in print("Tap No Button")}
        
        let yesAction = UIAlertAction(title: "Yes",style: .default){(alertAction) -> Void in print("Tap Yes Button")}
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        //显示
        self.present(alertController,animated: true, completion: nil)
      
    }
    
    @objc func testActionSheet(_ sender: AnyObject){
        let actionSheetController = UIAlertController()
        let cancelAction = UIAlertAction(title: "取消",style: UIAlertAction.Style.cancel){(alertAction) -> Void in print("Tap 取消 Button")}
        let destructiveAction = UIAlertAction(title: "破坏性按钮",style: UIAlertAction.Style.destructive){(alertAction) -> Void in print("Tap 破坏性按钮 Button")}
        let ohterAction = UIAlertAction(title: "新浪微博",style: UIAlertAction.Style.default){(alertAction) -> Void in print("Tap 新浪微博 Button")}
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(ohterAction)
        
        //为iPad设备设置锚点
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView
        
        self.present(actionSheetController,animated: true,completion: nil)
    }
    
}

