//
//  ViewController.swift
//  NavigationTabBarViewControlelr
//
//  Created by 薮木翔大 on 2022/11/11.
//

import UIKit

class ViewController: UINavigationTabBarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleList = ["first","second","third"]
    }
    override func viewControllers() -> [UIViewController] {
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        firstVC.view.backgroundColor = .red
        secondVC.view.backgroundColor = .blue
        thirdVC.view.backgroundColor = .green
        return  [firstVC,secondVC,thirdVC]
    }
    override func tabHeight() -> CGFloat {
        return 30
    }

}



