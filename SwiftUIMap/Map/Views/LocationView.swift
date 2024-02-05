//
//  LocationView.swift
//  SwiftUILearning
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import SwiftUI
import MapKit
struct LocationView: View {
    @EnvironmentObject var locationsVM: LocationsViewModel
    @State var maxWidthForIpad: CGFloat = 700
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea(.all)
            VStack {
                header
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                locationPreviewStack
            }
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}

extension LocationView {
    private var header: some View {
        VStack {
            Button(action: {
                locationsVM.toggleLocationsList()
            }, label: {
                Text(locationsVM.selectedLocation.name + ", " + locationsVM.selectedLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .tint(.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .animation(.none, value: locationsVM.selectedLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .scaledToFit()
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .tint(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsVM.showLocationsList ? 180 : 0))
                    }
            })
            if locationsVM.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(
            color: .black.opacity(0.3),
            radius: 20,
            x: 0,
            y: 15
        )
        .padding()
        
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $locationsVM.mapRegion, annotationItems: locationsVM.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(locationsVM.selectedLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        locationsVM.showNextLocation(location: location)
                    }
            }
        })
    }
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(locationsVM.locations) { location in
                if location == locationsVM.selectedLocation {
                    LocationPreviewView(location: locationsVM.selectedLocation)
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity) // This modifier is for transition to start from the leading frame and end to the trailing frame of screen
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                        )
                }
            }
        }
        .sheet(item: $locationsVM.sheetLocation, content: { location in
            LocationDetailsView(location: location)
        })
    }
}
