//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 19/10/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let HomeVC = UINavigationController(rootViewController: HomeViewController())
        let UpcomingVC = UINavigationController(rootViewController: UpcomingViewController())
        let SearchVC = UINavigationController(rootViewController: SearchViewController())
        let DownloadsVC = UINavigationController(rootViewController: DownloadsViewController())
        
        //Icons found from SF Symbols
        HomeVC.tabBarItem.image = UIImage(systemName: "house")
        HomeVC.title = "Home"
        
        UpcomingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        UpcomingVC.title = "Coming Soon"
        
        SearchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        SearchVC.title = "Top Search"
        
        DownloadsVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        DownloadsVC.title = "Downloads"
        
        tabBar.tintColor = .label   //Colour used for text labels
        
        setViewControllers([HomeVC, UpcomingVC, SearchVC, DownloadsVC], animated: true)
    }


}

