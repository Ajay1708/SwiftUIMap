//
//  Location.swift
//  SwiftUIMap
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import Foundation
import CoreLocation
struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        return name+cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
