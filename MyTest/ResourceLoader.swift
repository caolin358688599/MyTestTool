//
//  ResourceLoader.swift
//  MyTest_Example
//
//  Created by edy on 2024/7/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

typealias R = ResourceLoader

/// 资源加载类
class ResourceLoader {
    private func placeHolder() {
        // 空函数，防止被swiftFormat自动将ResourceLoader修改为enum
    }

    /// 资源对应的Bundle
    static var resourceBundle: Bundle = {
        let bundle = Bundle(for: R.self)
        print(bundle)
        print(bundle)



        if let bundlePath = bundle.url(forResource: "MyTest_Example", withExtension: "bundle"),
           let bundle = Bundle(url: bundlePath) {
            return bundle
        }
        return Bundle.main
    }()

    /// 加载本地图片
    /// - Parameter named: 图片名称
    /// - Returns: 实例
    static func image(named name: String) -> UIImage? {
        UIImage(named: name, in: resourceBundle, compatibleWith: nil)
    }

    /// 加载字符串（国际化）
    /// - Parameter named: key的名字
    /// - Returns: 实例
    static func string(named name: String) -> String {
        NSLocalizedString(name, bundle: resourceBundle, comment: name)
    }

    /// 获取Storyboard
    /// - Parameter named: 名字
    /// - Returns: 实例
    static func storyboard(named name: String) -> UIStoryboard {
        UIStoryboard(name: name, bundle: resourceBundle)
    }

    /// 获取nib
    ///
    /// 一般用于tableView注册cell
    /// - Parameter name:nib名字
    /// - Returns:nib的实例
    static func nib(named name: String) -> UINib {
        return UINib(nibName: name, bundle: resourceBundle)
    }

    /// 从Storyboard中加载UIViewController
    /// - Parameters:
    ///   - storyboardName: Storyboard的文件名
    ///   - identifier: ViewController的标识符
    /// - Returns: UIViewController实例
    static func viewController(storyboardName: String, identifier: String) -> UIViewController {
        storyboard(named: storyboardName).instantiateViewController(withIdentifier: identifier)
    }

    /// 从xib加载UIViewController
    /// - Parameter vcType: ViewController的类型
    /// - Parameter named: xib文件名
    /// - Returns: UIViewController实例
    static func viewController(vcType: UIViewController.Type, nibName: String) -> UIViewController {
        return vcType.init(nibName: nibName, bundle: resourceBundle)
    }

    /// 从xib加载UIViewController
    /// - Parameters:
    ///   - vcType: ViewController的类型
    /// - Returns: UIViewController实例
    static func viewControllerFromXib(vcType: UIViewController.Type) -> UIViewController {
        return vcType.init(nibName: String(describing: vcType), bundle: resourceBundle)
    }

    /// 从Xib中加载View
    /// - Parameter nibName: xib文件名
    /// - Returns: UIView实例
    /// - Note: 默认获取xib中加载的第一个View。
    static func view(nibName: String) -> UIView? {
        resourceBundle.loadNibNamed(nibName, owner: nil, options: nil)?.first as? UIView
    }

    /// 从xib中加载View
    /// - Parameters:
    ///   - nibName: xib文件名
    ///   - tag: 目标view的tag
    /// - Returns: 实例
    static func view(nibName: String, tag: Int) -> UIView? {
        guard let viewAry = resourceBundle.loadNibNamed(nibName, owner: nil, options: nil) as? [UIView] else {
            return nil
        }
        return viewAry.first { view -> Bool in
            view.tag == tag
        }
    }

    /// 从xib中加载View
    /// - Parameters:
    ///   - nibName: xib文件名
    ///   - viewClass: 目标view的类型
    /// - Returns: 实例
    static func view(nibName: String, viewClass: UIView.Type) -> UIView? {
        guard let viewAry = resourceBundle.loadNibNamed(nibName, owner: nil, options: nil) as? [UIView] else {
            return nil
        }
        return viewAry.first { view -> Bool in
            type(of: view) == viewClass
        }
    }
}

