//
//  TabBarController.swift
//  iOSNews
//
//  Created by Ricardo Duarte on 19/04/2019.
//  Copyright © 2019 Ricardo Duarte. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let topHeadlinesViewController =  UINavigationController(rootViewController: TopHeadlinesViewController())
        let everythingViewController = EverythingViewController()
        let sourcesViewController = SourcesViewController()
        let settingsViewController = SettingsViewController()
        
        topHeadlinesViewController.tabBarItem = UITabBarItem(title: TabBarTitles.topHeadlines, image: UIImage(named: "topHeadlines"), tag: 0)
        everythingViewController.tabBarItem = UITabBarItem(title: TabBarTitles.everything, image: UIImage(named: "everything"), tag: 1)
        sourcesViewController.tabBarItem = UITabBarItem(title: TabBarTitles.sources, image: UIImage(named: "sources"), tag: 2)
        settingsViewController.tabBarItem = UITabBarItem(title: TabBarTitles.settings, image: UIImage(named: "settings"), tag: 3)

        setViewControllers([topHeadlinesViewController,
                            everythingViewController,
                            sourcesViewController,
                            settingsViewController],
                           animated: true)
    }
}

extension TabBarController {
    private enum TabBarTitles {
        static let topHeadlines = "TopHeadlines"
        static let everything = "Everything"
        static let sources = "Sources"
        static let settings = "Settings"
    }
}
