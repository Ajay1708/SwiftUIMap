//
//  SwiftUIMapApp.swift
//  SwiftUIMap
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import SwiftUI

@main
struct SwiftUIMapApp: App {
    @StateObject var locationsVM: LocationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(locationsVM)
        }
    }
}
