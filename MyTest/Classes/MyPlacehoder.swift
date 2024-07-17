//
//  MyPlacehoder.swift
//  MyTest_Example
//
//  Created by edy on 2024/7/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

class MyPlacehoder: UIView {

    lazy var imageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.image = R.image(named: "image")
        return imageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "123"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(label)
        label.sizeToFit()
        imageView.frame = CGRect(x: 30, y: 40, width: 20, height: 20)
        imageView.backgroundColor = .black

     


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    



}
