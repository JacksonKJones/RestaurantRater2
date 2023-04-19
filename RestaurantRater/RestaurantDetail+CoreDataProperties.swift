//
//  RestaurantDetail+CoreDataProperties.swift
//  RestaurantRater
//
//  Created by User 2 on 4/4/23.
//
//

import Foundation
import CoreData


extension RestaurantDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantDetail> {
        return NSFetchRequest<RestaurantDetail>(entityName: "RestaurantDetail")
    }

    @NSManaged public var dishName: String?
    @NSManaged public var dishType: String?
    @NSManaged public var dishRating: Int16
    @NSManaged public var restDetails: RestaurantOverview?

}




extension RestaurantDetail : Identifiable {

}
