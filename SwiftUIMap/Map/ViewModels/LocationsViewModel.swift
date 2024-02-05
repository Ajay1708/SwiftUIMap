//
//  LocationsViewModel.swift
//  SwiftUIMap
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import Foundation
import SwiftUI
import MapKit
@MainActor
class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var selectedLocation: Location {
        didSet {
            updateMapRegion(location: selectedLocation)
        }
    }
    @Published var showLocationsList: Bool = false
    @Published var sheetLocation: Location? = nil
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.selectedLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan
        )
    }
    
    func toggleLocationsList() {
        withAnimation {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            selectedLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == selectedLocation }) else {
            print("Unable to find index")
            return
        }
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            print("Invalid index")
            guard let location = locations.first else { return }
            showNextLocation(location: location)
            return
        }
        let location = locations[nextIndex]
        showNextLocation(location: location)
        
    }
}
