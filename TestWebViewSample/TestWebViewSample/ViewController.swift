//
//  ViewController.swift
//  TestWebViewSample
//
//  Created by WangShuanghai on 2018/11/1.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController ,WKNavigationDelegate{

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screen = UIScreen.main.bounds
        //按钮栏
        //按钮栏宽
        let buttonBarWidth: CGFloat = 316
        let buttonBar = UIView(frame: CGRect(x:(screen.size.width - buttonBarWidth) / 2,y: 20,width: buttonBarWidth,height:30))
        self.view.addSubview(buttonBar)
        
        //1.添加LoadHTMLString按钮
        let buttonLoadHTMLString = UIButton(type:UIButton.ButtonType.system)
        buttonLoadHTMLString.setTitle("LoadHTMLString", for:  UIControl.State())
        buttonLoadHTMLString.frame = CGRect(x: 0,y:0,width:117,height:30)
        //指定事件处理方法
        buttonLoadHTMLString.addTarget(self,action:#selector(testLoadHTMLString(_:)),for: .touchUpInside)
        buttonBar.addSubview(buttonLoadHTMLString)
        
        //添加LoadData按钮
        let buttonLoadData = UIButton(type: UIButton.ButtonType.system)
        buttonLoadData.setTitle("LoadData", for: UIControl.State())
        buttonLoadData.frame = CGRect(x: 137,y: 0,width:67,height: 30)
        //指定事件处理方法
        buttonLoadData.addTarget(self, action: #selector(testLoadData(_:)), for: .touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        //添加LoadRequest按钮
        let buttonLoadRequest = UIButton(type: UIButton.ButtonType.system)
        buttonLoadRequest.setTitle("LoadRequest", for: UIControl.State())
        buttonLoadRequest.frame = CGRect(x: 224,y: 0,width: 92,height: 30)
        //指定事件处理方法
        buttonLoadRequest.addTarget(self, action: #selector(testLoadRequest(_:)), for:.touchUpInside)
        buttonBar.addSubview(buttonLoadRequest)
        
        //添加WKWebview
        self.webView = WKWebView(frame: CGRect(x: 0,y: 60,width: screen.size.width,height: screen.size.height - 80))
        self.view.addSubview(self.webView)
        
    }
    
   @objc func testLoadHTMLString(_ sender: AnyObject){
        let htmlPath = Bundle.main.path(forResource: "index",ofType: "html")
        let bundleUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
        do{
            let html = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
            self.webView.loadHTMLString(html as String, baseURL: bundleUrl)
            
            }
        catch let err as NSError{
                NSLog("加载失败error: %@",err.localizedDescription)
            
        }
    }

  @objc  func testLoadData(_ sender: AnyObject){
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
        let htmlData = try? Data(contentsOf: URL(fileURLWithPath: htmlPath!))
        
        self.webView.load(htmlData!,mimeType: "text/html",characterEncodingName:"UTF-8",baseURL:bundleUrl)
    }
    
  @objc  func testLoadRequest(_ sender: AnyObject){
    let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
        self.webView.navigationDelegate = self
    }
    
    //MARK: -- 实现WKNavigationDelegate委托协议
    //开始加载时调用
    func webView(_ webView: WKWebView,didStartProvisionalNavigation navigation: WKNavigation!){
        print("开始加载")
    }
    
    //内容返回时调用
    func webView(_ webView: WKWebView,didCommit navigation: WKNavigation!){
        print("内容开始返回")
    }
    
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!){
        print("加载完成")
    }
    
    func webView(_ webView: WKWebView,didFailProvisional navigation: WKNavigation!,withError error: NSError){
        print("加载失败error: ",error.localizedDescription)
    }

}

