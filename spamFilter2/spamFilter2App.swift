//
//  spamFilter2App.swift
//  spamFilter2
//
//  Created by 0110 on 11/21/24.
//

import SwiftUI

@main
struct spamFilter2App: App {
    init() {
        // Set defaults for Settings.bundle
        UserDefaults.standard.register(defaults: [
            "isFilterEnabled": true
        ])
        
        // Set defaults for shared container
        if let shared = UserDefaults(suiteName: "group.provenance-six.provenance") {
            shared.register(defaults: [
                "isFilterEnabled": true
            ])
            
            // Sync the current value from Settings to shared container
            let currentValue = UserDefaults.standard.bool(forKey: "isFilterEnabled")
            shared.set(currentValue, forKey: "isFilterEnabled")
            shared.synchronize()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
