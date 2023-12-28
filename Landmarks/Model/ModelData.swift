//
//  ModelData.swift
//  Landmarks
//
//  Created by 远路蒋 on 2023/12/22.
//

import Foundation


/// Use observation for storage, store the data using the Observable() macro
/// with observation, a view in swiftUI can support data changes without using property wrappers or binding
/// SwiftUI watches for any observable property changes that could affect a view
/// and display the correct version of the view after a change
@Observable
class ModelData {
    /// SwiftUI updates a view only when an Observable property changes and the view's body reads the property directly
    var landmarks: [Landmark] = load("landmarkData.json")
    
    var hikes: [Hike] = load("hikeData.json")
    
    var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks) { $0.category.rawValue }
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) 
    else {
        fatalError("Could't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Could't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
