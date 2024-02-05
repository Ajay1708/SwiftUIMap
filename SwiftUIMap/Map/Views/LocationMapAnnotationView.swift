//
//  LocationMapAnnotationView.swift
//  SwiftUIMap
//
//  Created by Venkata Ajay Sai Nellori on 04/02/24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .font(.headline)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(.accent)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accent)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
