//
//  ContentView.swift
//  spamFilter2
//
//  Created by 0110 on 11/21/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFilterEnabled")
    private var isFilterEnabled = true
    
    var body: some View {
        VStack {
            Image(systemName: "shield.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Toggle("Spam Filter", isOn: $isFilterEnabled)
                .padding()
                .onChange(of: isFilterEnabled) { oldValue, newValue in
                    if let shared = UserDefaults(suiteName: "group.provenance-six.provenance") {
                        shared.set(newValue, forKey: "isFilterEnabled")
                        shared.synchronize()
                    }
                }
            
            Text(isFilterEnabled ? "Spam Filter Active" : "Spam Filter Disabled")
        }
        .padding()
        .onAppear {
            print("Initial UserDefaults.shared value: \(UserDefaults.shared.bool(forKey: "isFilterEnabled"))")
        }
    }
}

#Preview {
    ContentView()
}
