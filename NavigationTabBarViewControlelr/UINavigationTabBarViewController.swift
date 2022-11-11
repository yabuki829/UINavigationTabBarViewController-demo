//
//  UINavigationTabBarViewController.swift
//  NavigationTabBarViewControlelr
//
//  Created by 薮木翔大 on 2022/11/11.
//

import Foundation
import UIKit


public struct TabColor {
    public var textColor:UIColor
    public var backgroundColor :UIColor
}

class UINavigationTabBarViewController:UIViewController, reloadDelegate{
    
    
    private var childrenViewController = [UIViewController]()
    public var titleList = [String]()
    private let buttonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize  = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    var contentCollectionViewCell = ContentCollectionViewCell()
    private let contentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize  = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    override func viewDidLoad() {
        
        configureCollectionView()
    }
    func viewControllers() -> [UIViewController] {
        return [UIViewController]()
    }
    
    func tabHeight() -> CGFloat {
        return 30
    }
  
    func configureCollectionView(){
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        
        view.addSubview(buttonCollectionView)
        view.addSubview(contentCollectionView)
        buttonCollectionView.constraints(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0,
                                         left: view.leftAnchor, paddingLeft: 0,
                                         right: view.rightAnchor, paddingRight: 0, height: tabHeight())
        
        contentCollectionView.constraints(top: buttonCollectionView.bottomAnchor, paddingTop: 0,
                                          left: view.leftAnchor, paddingLeft: 0,
                                          right: view.rightAnchor, paddingRight: 0,
                                          bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0)
        
        buttonCollectionView.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        contentCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
        
        
    }
    func reload(indexPath: IndexPath) {
        //リロードする
        print("Reload")
        contentCollectionViewCell.collectionView.scrollToItem(at:indexPath , at: .centeredHorizontally, animated: true)
    }
}


extension UINavigationTabBarViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.buttonCollectionView {
            //ボタンのリストを表示する
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as! ButtonCollectionViewCell
            cell.configure(titleList: self.titleList)
            cell.height = tabHeight()
            cell.delegate = self
            return cell
        }
        else  {
            
            contentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.identifier, for: indexPath) as! ContentCollectionViewCell
            contentCollectionViewCell.height = tabHeight()
            contentCollectionViewCell.configure(controllers: viewControllers())
            return contentCollectionViewCell
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.buttonCollectionView {
           
            return CGSize(width:view.frame.width, height: tabHeight())
        }
        let statusHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
        let tabbarHeight = tabBarController?.tabBar.frame.size.height ?? 0
        
        return CGSize(width:view.frame.width, height: view.frame.height - tabHeight()*2 - statusHeight - navigationBarHeight - tabbarHeight)
    }
    
    
}






