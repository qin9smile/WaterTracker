//
//  TabBarViewController.swift
//  WaterTracker
//
//  Created by 宇宙超级无敌可爱美少女 on 2018/8/10.
//  Copyright © 2018年 gago. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
      addSubViewController(viewController: PlantsViewController(), title: "My Plants", imageName: "plants")
      addSubViewController(viewController: ProfileViewController(), title: "My Profile", imageName: "profile")
      addSubViewController(viewController: NewViewController(), title: "Add New", imageName: "plus")
    }
  
  private func addSubViewController(viewController: UIViewController, title: String, imageName: String) {
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = UIImage(named: imageName)
    viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlight")
    viewControllers?.append(viewController)
  }
}
