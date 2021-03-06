//
//  AppDelegate.swift
//  WaterTracker
//
//  Created by 宇宙超级无敌可爱美少女 on 2018/8/10.
//  Copyright © 2018年 gago. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let _window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    _window.backgroundColor = .white
    _window.rootViewController = UINavigationController(rootViewController: TabBarViewController())
    window = _window
    _window.makeKeyAndVisible()
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
  }

  func applicationWillTerminate(_ application: UIApplication) {
  }
}
