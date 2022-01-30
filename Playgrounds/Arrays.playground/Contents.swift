import UIKit

var myFavMovies = ["The Great Gatsby", "Soul Plane", "Demolition Man", 5, true] as [Any]

//as --> casting
//any --> any object

//index
myFavMovies[0]
myFavMovies[1]
myFavMovies[2]
myFavMovies[3]
myFavMovies[4]

var myStringArray = ["test6", "test2", "test3"]

myStringArray[0].uppercased()

myStringArray.count

myStringArray[myStringArray.count - 2]

myStringArray.last

myStringArray.sort()

//sets

var mySet : Set = [1,2,3,4,5,2,2,2]
var myStringSet : Set = ["a", "b", "c", "a", "a"]

var myInternetArray = [1,2,3,4,5,6,7,5,2,3,4,5]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)
print(mySet3)

//dictionary
//key-value pairing

var myFavDirectors = ["Pulp" : "Tarantino", "Lock Stock" : "Guy Ritchie"]

//add new element
myFavDirectors["Seven Sam"] = "Akira Kur"

