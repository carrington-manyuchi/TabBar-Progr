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
        self.setupTabs()
        
        
        // adding delegates
        self.delegate = self
        
        //self.tabBar.barTintColor = .systemGreen
        //self.tabBar.tintColor = .systemRed
        self.tabBar.unselectedItemTintColor = .blue
        
        
        // to start view on the third controller ie ExerciceVC
        self.selectedIndex = 2

        // Change background of tabs
        UITabBar.appearance().backgroundColor = .systemGray5
        UITabBar.appearance().tintColor = .systemGreen
        

        
    }
    
    
    // MARK: - Tabs Setup
    private func setupTabs() {
        
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeVC())
        let history = self.createNav(with: "History", and: UIImage(systemName: "clock"), vc: HistoryVC())
        let workout = self.createNav(with: "Workout", and: UIImage(systemName: "person"), vc: WorkoutVC())
        let exercise = self.createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: ExerciseVC())
        
        self.setViewControllers([home, history, workout, exercise  ], animated: true)
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


extension TabController: UITabBarControllerDelegate {
    
    // will not allow you to switch tabs
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    // did select with a view controller
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
        if self.selectedIndex == 1 {
            let alert = UIAlertController(title: "Notification", message: "You have selected the second Tab Bar Controller", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    
    // did select with a tab bar
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
        item.badgeValue = "2"
    }
}
