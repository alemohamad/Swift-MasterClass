//
//  GroceryStore.swift
//  GroceryStore
//
//  Created by Ale Mohamad on 10/01/2020.
//  Copyright © 2020 Cyril Garcia. All rights reserved.
//

import Foundation

protocol GroceryStoreDataSource {
    func maxNumberOfCustomersInStore() -> Int
}

protocol GroceryStoreDelegate {
    func totalCustomers(_ total: Int)
    func storeRevenue(_ total: Double)
}

class GroceryStore {
    var dataSource: GroceryStoreDataSource?
    var delegate: GroceryStoreDelegate?
    
    private var customers = [Customer]()
    private var customerCount = 0
    private var revenue: Double = 0
    
    func customerEnters(_ customer: Customer) -> Bool {
        if customers.contains(customer) {
            return false
        }
        
        if let max = dataSource?.maxNumberOfCustomersInStore(),
            max > customers.count {
            customers.append(customer)
            return true
        }
        
        return false
    }
    
    func customerLeaves(_ customer: Customer) {
        customers = customers.filter { $0 != customer }
    }
    
    func checkout(_ customer: Customer) {
        revenue += customer.pay()
        customerLeaves(customer)
    }
    
    func totalCustomerCount() {
        delegate?.totalCustomers(customers.count)
    }
    
    func totalRevenue() {
        delegate?.storeRevenue(revenue)
    }
}
