//
//  ViewController.swift
//  gradientSample
//
//  Created by shadowPriest on 15/6/4.
//  Copyright (c) 2015年 hxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var v = gradientSampleView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.v)
        self.v.frame = self.view.bounds
        v.backgroundColor = UIColor.whiteColor()   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

