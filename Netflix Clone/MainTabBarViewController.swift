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
        
        setViewControllers([HomeVC, UpcomingVC, SearchVC, DownloadsVC], animated: true)
    }


}

