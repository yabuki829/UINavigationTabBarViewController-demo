//
//  ThirdViewController.swift
//  NavigationTabBarViewControlelr
//
//  Created by 薮木翔大 on 2022/11/11.
//

import UIKit

class ThirdViewController: UIViewController {

    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Third"
        view.addSubview(label)
        label.center(inView: view)
        label.sizing(height: view.frame.height, width: view.frame.width)
    }


}
