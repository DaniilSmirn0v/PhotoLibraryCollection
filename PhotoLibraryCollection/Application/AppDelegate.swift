//
//  AppDelegate.swift
//  PhotoLibraryCollection
//
//  Created by Даниил Смирнов on 06.06.2022.
//

import UIKit

@main


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mediaVC = MediaViewController()
        let mediaNavigationController = UINavigationController(rootViewController: mediaVC)
        mediaVC.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), tag: 0)
        
        let forUsVC = ForUsViewController()
        let forUsNavigationController = UINavigationController(rootViewController: forUsVC)
        forUsVC.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), tag: 1)
        
        let albumVC = AlbumViewController()
        let albumNavigationController = UINavigationController(rootViewController: albumVC)
        albumVC.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        
        let searchVC = SearchViewController()
        let serchNavigationController = UINavigationController(rootViewController: searchVC)
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = .gray
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.barTintColor = .black
        tabBarVC.setViewControllers( [
            mediaNavigationController,
            forUsNavigationController,
            albumNavigationController,
            serchNavigationController
        ], animated: true)
        
        tabBarVC.selectedViewController = albumNavigationController
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        return true
    }
    
}

