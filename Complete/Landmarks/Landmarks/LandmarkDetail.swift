//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Toni Tani on 13.1.2020.
//  Copyright © 2020 Toni Tani. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    @State private var showingAlert = false

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                    
                }
                Button(action: {
                self.showingAlert = true
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .font(.title)
                        Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                }.padding(8)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                    
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Are you sure you want to delete?"), message: Text("\(landmark.name)"), primaryButton: .default(Text("Yes")), secondaryButton:
                        .destructive(Text("No")))
                }
            }
                
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: landmark.name), displayMode: .inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
