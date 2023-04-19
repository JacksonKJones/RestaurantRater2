//
//  RestaurantOverview+CoreDataProperties.swift
//  RestaurantRater
//
//  Created by User 2 on 4/4/23.
//
//

import Foundation
import CoreData


extension RestaurantOverview {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantOverview> {
        return NSFetchRequest<RestaurantOverview>(entityName: "RestaurantOverview")
    }

    @NSManaged public var restaurantName: String?
    @NSManaged public var restaurantAddress: String?
    @NSManaged public var restaurant: NSSet?

}

// MARK: Generated accessors for restaurant
extension RestaurantOverview {

    @objc(addRestaurantObject:)
    @NSManaged public func addToRestaurant(_ value: RestaurantDetail)

    @objc(removeRestaurantObject:)
    @NSManaged public func removeFromRestaurant(_ value: RestaurantDetail)

    @objc(addRestaurant:)
    @NSManaged public func addToRestaurant(_ values: NSSet)

    @objc(removeRestaurant:)
    @NSManaged public func removeFromRestaurant(_ values: NSSet)

}

extension RestaurantOverview : Identifiable {

}
