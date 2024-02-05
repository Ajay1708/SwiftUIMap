//
//  LocationsListView.swift
//  SwiftUIMap
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var locationsVM: LocationsViewModel
    var body: some View {
        List(locationsVM.locations) { location in
            Button(
                action: {
                    locationsVM.showNextLocation(location: location)
                },
                label: {
                    listRowView(location: location)
                }
            )
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.3).ignoresSafeArea(.all)
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View{
        HStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(location.cityName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
    }
}
