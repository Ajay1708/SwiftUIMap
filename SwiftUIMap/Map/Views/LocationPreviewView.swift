//
//  LocationPreviewView.swift
//  SwiftUILearning
//
//  Created by Venkata Ajay Sai Nellori on 03/02/24.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject var locationsVM: LocationsViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment:.leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack {
                learnMoreButton
                nextButton
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea(.all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
            .padding()
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2).bold()
                .foregroundStyle(.primary)
            Text(location.cityName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var learnMoreButton: some View {
        Button(
            action: {
                locationsVM.sheetLocation = location
            },
            label: {
                Text("Learn more")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(width: 125, height: 30)
            }
        )
        .buttonStyle(.borderedProminent)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var nextButton: some View {
        Button(
            action: {
                locationsVM.nextButtonPressed()
            },
            label: {
                Text("Next")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .frame(width: 125, height: 30)
            }
        )
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
