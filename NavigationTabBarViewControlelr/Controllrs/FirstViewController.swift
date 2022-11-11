//
//  FirstViewController.swift
//  NavigationTabBarViewControlelr
//
//  Created by 薮木翔大 on 2022/11/11.
//

import UIKit
import TabbarViewController

class FirstViewController: UITabbarViewController {
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //何番目にタブを置くのか と タブのタイトル
        setting(0, titleList: ["blue","red","green"])
        //選択した時の色
        selectedText.backgroundColor = .green
        //選択してない時の色
        selectedText.textColor = .black
    }
    //tabにViewを追加する
    override func addViews() -> [UIView] {
        let redview = UIView()
        let blueview = UIView()
        let greebview = UIView()
        blueview.backgroundColor = .blue
        redview.backgroundColor = .red
        greebview.backgroundColor = .green
        return [blueview,redview,greebview]
    }


    override func contentViewHeight() -> CGFloat {
        return  view.frame.height - 20
    }
    //tabの高さの設定
    override func tabHeight() -> CGFloat {
        return 20
    }
//    override func addContentViews() -> [TabContent] {
//        <#code#>
//    }
}

