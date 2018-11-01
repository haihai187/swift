//
//  ViewController.swift
//  SwitchSliderSegmentedControl
//
//  Created by WangShuanghai on 2018/10/31.
//  Copyright © 2018 双海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SliderValue: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        var witchSwitch = sender as! UISwitch
        var setting = witchSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    @IBOutlet var touchDown: UIView!
    
    @IBAction func touchDown(_ sender: Any) {
       let segmentedControl = sender as! UISegmentedControl
        print("选择的段: ",segmentedControl.selectedSegmentIndex)
        if(self.leftSwitch.isHidden == true)
        {
            self.rightSwitch.isHidden = false
            self.leftSwitch.isHidden = false
        }
        else
        {
            self.rightSwitch.isHidden = true
            self.leftSwitch.isHidden = true
        }
        
    
    }
    
    @IBAction func slidervalueChange(_ sender: Any) {
        var slider = sender as! UISlider
        let progressAsInt = Int(slider.value)
        let newText = String(progressAsInt)
        self.SliderValue.text = newText
    }
    
}

