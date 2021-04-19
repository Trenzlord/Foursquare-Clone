//
//  PlaceModel.swift
//  FoursquareAppClone
//
//  Created by Mert Kaan on 17.04.2021.
//

import Foundation
import UIKit

class PlaceModel {

    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placelatitude = ""
    var placelongitude = ""
    
    private init(){}
    
    
    
}
