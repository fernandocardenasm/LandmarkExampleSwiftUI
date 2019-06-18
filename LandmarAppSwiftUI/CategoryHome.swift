//
//  CategoryHome.swift
//  LandmarAppSwiftUI
//
//  Created by Fernando Cardenas on 18.06.19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import SwiftUI

struct CategoryHome : View {
    var categories: [String: [Landmark]] {
        .init(grouping: landmarkData,
              by: { $0.category.rawValue })
    }

    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }

    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(categories.keys.sorted().identified(by: \.self)) { key in
                    CategoryRow(categoryName: key,
                                items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

                NavigationButton(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing:
                PresentationButton(
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .accessibility(label: Text("User Profile"))
                        .padding(),
                    destination: Text("User Profile")
                )
            )
        }
    }
}

struct CategoryRow : View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem : View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark
                .image(forSize: 155)
                .renderingMode(.original)
                .cornerRadius(5)
            Text(landmark.name)
                .color(.primary)
                .font(.caption)
        }.padding(.leading, 15)
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]

    var body: some View {
        landmarks[0]
            .image(forSize: 250)
            .resizable()
    }
}

#if DEBUG
//struct CategoryHome_Previews : PreviewProvider {
//    static var previews: some View {
//        CategoryHome()
//    }
//}
#endif
