//
//  AppSettings.swift
//  PeerLabEvents
//
//  Created by adeveloper on 09.06.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Foundation


extension UserDefaults {
    var isDemoAdded: Bool {
        get { return bool(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
    
    var appName: String {
        get { return string(forKey: #function)! }
        set { set(newValue, forKey: #function) }
    }
}
