import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let completeRecovered: Data = UserDefaults.standard.object(forKey: "complete") as? Data else {
            return true
        }
        guard let incompleteRecovered: Data = UserDefaults.standard.object(forKey: "incomplete") as? Data else {
            return true
        }
        let decoder = JSONDecoder()
        guard let completeList = try? decoder.decode([[String:String]].self, from: completeRecovered) else {
            return true
        }
        guard let incompleteList = try? decoder.decode([[String:String]].self, from: incompleteRecovered) else {
            return true
        }
        
        TaskLists.complete = completeList
        TaskLists.incomplete = incompleteList
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let encoder = JSONEncoder()
        guard let complete = try? encoder.encode(TaskLists.complete) else {
            return
        }
        guard let incomplete = try? encoder.encode(TaskLists.incomplete) else {
            return
        }
        let taskListString = String(data: incomplete, encoding: .utf8)!
        print(taskListString)
        UserDefaults.standard.set(complete, forKey: "complete")
        UserDefaults.standard.set(incomplete, forKey: "incomplete")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

