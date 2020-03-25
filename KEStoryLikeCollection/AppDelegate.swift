//
//  AppDelegate.swift
//  KEStoryLikeCollection
//
//  Created by Kaan Esin on 24.03.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, KEStoryLikeViewControllerDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KEStoryLikeViewController") as? KEStoryLikeViewController {
            vc.delegate = self
            vc.itemArray = [(color: UIColor.red, title: "1 sdfasdf"),
                            (color: UIColor.yellow, title: "2 asdklfj asdfjk"),
                            (color: UIColor.green, title: "3 a23r"),
                            (color: UIColor.darkGray, title: "4 askdlfjlkajsdflkj"),
                            (color: UIColor.black, title: "5 sdfj"),
                            (color: UIColor.orange, title: "6 aşosdfkjv pwdfı"),
                            (color: UIColor.magenta, title: "7 dsnvm"),
                            (color: UIColor.purple, title: "8 230r9fjv sodfpoısdpfsdf"),
                            (color: UIColor.blue, title: "9 sakdf"),
                            (color: UIColor.cyan, title: "10 sdfasdf sdfasdf")]
            window?.rootViewController = UINavigationController(rootViewController: vc)
        }
        window?.makeKeyAndVisible()
        return true
    }

    func cellDidSelect(item: (color: UIColor, title: String), indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            if let navc = window?.rootViewController as? UINavigationController {
                vc.view.backgroundColor = item.color
                navc.present(vc, animated: true, completion: nil)
            }
        }
    }
}

