//
//  LandmarkRow.swift
//  LandmarAppSwiftUI
//
//  Created by Fernando Cardenas on 17.06.19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    var landmarks: [Landmark]

    var body: some View {

        NavigationView {
            List {
                ForEach(landmarks) { landmark in
                    // Observation: Maybe it is better to place the navigationButton in the List, not on the Cell.
                    LandmarkCell(landmark: landmark)
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkCell : View {
    var landmark: Landmark

    var body: some View {
        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
            HStack {
                landmark.image(forSize: 50)
                Text(landmark.name)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmarks: landmarkData)
    }
}
#endif
