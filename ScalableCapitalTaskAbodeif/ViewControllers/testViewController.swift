//
//  testViewController.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/17/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
//import Alamofire
import gameballSDK
import Firebase

class testViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        baseFile.firebaseConfig()
//        baseFile.testAction()
        // Do any additional setup after loading the view.
        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
//            myDelegate.gameballApp = GameballApp.init(APIKey: "8fdfd2dffd-9mnvhu25d6c3d", playerId: "SomeGuid16")
//            myDelegate.gameballApp?.registerPlayer(withPlayerId: "SomeGuid16")
//            let x = myDelegate.gameballApp?.getFirebaseApp()
//            let app = x?["gameballSDK_FirebaseApp"] as? FirebaseApp
//            let options = app?.options
//            
//            print(app)
        }
        
//        gameballApp?.configureFireBase()
        
//        baseFile.firebaseConfig()
//        gameballApp.configureFirebase()
        
    }
    

    @IBAction func launchGameball(_ sender: Any) {
        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
//            myDelegate.gameballApp = GameballApp.init(APIKey: "8fdfd2dffd-9mnvhu25d6c3d", playerId: "SomeGuid16")
//            myDelegate.gameballApp?.registerPlayer(withPlayerId: "SomeGuid16")
//            let x = myDelegate.gameballApp?.getFirebaseApp()
//            let app = x?["gameballSDK_FirebaseApp"] as? FirebaseApp
//            let options = app?.options
            let vc = myDelegate.gameballApp?.launchGameball()
            self.present(vc!, animated: true, completion: nil)
//            print(app)
        }
        let vc2 = Test2ViewController()
        
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
