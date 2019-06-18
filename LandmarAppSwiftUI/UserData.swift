//
//  UserData.swift
//  LandmarAppSwiftUI
//
//  Created by Fernando Cardenas on 18.06.19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()

    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
}
