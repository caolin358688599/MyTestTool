//
//  ViewController.swift
//  MyTest
//
//  Created by MOSIEX000079 on 07/16/2024.
//  Copyright (c) 2024 MOSIEX000079. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let placeHoder = MyPlacehoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "1234ii45"
        print(str.intValue)
        self.view.addSubview(placeHoder)
        placeHoder.backgroundColor = .yellow
        placeHoder.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

