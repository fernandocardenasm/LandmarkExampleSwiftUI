//
//  LandmarkRow.swift
//  LandmarAppSwiftUI
//
//  Created by Fernando Cardenas on 17.06.19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject var userData: UserData

    var body: some View {

        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites Only")
                }

                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkCell(landmark: landmark)
                        }
                    }
                }
                }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkCell : View {
    var landmark: Landmark

    var body: some View {

        HStack {
            landmark.image(forSize: 50)
            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
//struct LandmarkRow_Previews : PreviewProvider {
//    static var previews: some View {
//        LandmarkList(landmarks: landmarkData)
//    }
//}
#endif
