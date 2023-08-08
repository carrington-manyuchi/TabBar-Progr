//
//  TabController.swift
//  TabBar-Progr
//
//  Created by DA MAC M1 157 on 2023/08/08.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        self.setViewControllers([], animated: true)
    }
    
    
    func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: self, action: nil)
        

        
        return nav
    }
}
