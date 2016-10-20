//
//  AppDelegate.swift
//  DarkSkyTester
//
//  Created by Pantelis Zirinis on 20/10/2016.
//  Copyright © 2016 Sergi Gracia. All rights reserved.
//

import Cocoa
import CoreLocation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let result = self.darkSky.current(latitude: coordinate.latitude, longitude: coordinate.longitude) { (result) in
            switch result {
            case .success(let newForecast):
                print(newForecast)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    lazy var darkSky: DarkSkyKit = {
        return DarkSkyKit("") // Please enter api key to run test
    }()

    let coordinate = CLLocationCoordinate2D(latitude: 37.8453, longitude: 23.7605)

}

