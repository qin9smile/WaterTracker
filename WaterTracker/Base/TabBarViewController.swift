//
//  TabBarViewController.swift
//  WaterTracker
//
//  Created by 宇宙超级无敌可爱美少女 on 2018/8/10.
//  Copyright © 2018年 gago. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  let centerButton = UIButton(type: .custom)

  override func viewDidLoad() {
    super.viewDidLoad()

    delegate = self
    let color = UIColor.black.withAlphaComponent(0.87)
    let selectedColor = UIColor(red: 93.0 / 255.0, green: 195.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)

    tabBar.barTintColor = .white
    if #available(iOS 10.0, *) {
      tabBar.unselectedItemTintColor = color
    } else {
      tabBar.tintColor = color
    }

    UITabBar.appearance().backgroundColor = .white

    /// 删除top line
    UITabBar.appearance().shadowImage = UIImage()
    UITabBar.appearance().backgroundImage = UIImage()
    /// 文字颜色
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: color], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor], for: .selected)

    addSubViewController(viewController: PlantsViewController(), title: "My Plants", imageName: "plants")
    addSubViewController(viewController: NewViewController(), title: "Add New", imageName: "plus", isCenter: true)
    addSubViewController(viewController: ProfileViewController(), title: "My Profile", imageName: "profile")
  }

  private func addSubViewController(viewController: UIViewController, title: String, imageName: String, isCenter: Bool = false) {
    if isCenter {
      viewController.tabBarItem = UITabBarItem()
      viewController.tabBarItem.title = title
      _addToperButton(viewController: NewViewController(), title: "Add New", imageName: "plus")
    } else {
      viewController.tabBarItem.title = title
      viewController.tabBarItem.image = UIImage(named: imageName)
      if let selectedImage = UIImage(named: imageName + "_highlight") {
        viewController.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
      }
    }

    addChildViewController(viewController)
  }

  @objc private func _centerButtonDidClick(_ button: UIButton) {
    if let count = tabBar.items?.count {
      let index = Int(floor(Double(count / 2)))
      selectedIndex = index
      selectedViewController = viewControllers?[index]
      print(button.isSelected)
      button.isSelected = true
    }
  }

  private func _addToperButton(viewController: UIViewController, title: String, imageName: String) {
    let image = UIImage(named: imageName)!
    centerButton.frame = CGRect.init(x: 0, y: 0, width: image.size.width * 1.5, height: image.size.height * 1.5)
    centerButton.setBackgroundImage(image, for: .normal)
    if let selectedImage = UIImage(named: imageName + "_highlight") {
      centerButton.setBackgroundImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    let rectBoundTabbar = tabBar.bounds
    let midX = rectBoundTabbar.midX
    let midY = rectBoundTabbar.midY - 15.0
    centerButton.center = CGPoint(x: midX, y: midY)
    tabBar.addSubview(centerButton)
    tabBar.bringSubview(toFront: centerButton)

    centerButton.addTarget(self, action: #selector(self._centerButtonDidClick(_:)), for: .touchUpInside)
  }
}

extension TabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    let selectedIndex = tabBarController.selectedIndex
    if selectedIndex == 1 {
      centerButton.isSelected = true
    } else {
      centerButton.isSelected = false
    }
  }
}
