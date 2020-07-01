import Foundation

class DataHelper {
    static func getContacts() -> ContactList {
        let friends =  [Contact(name: "Faustino Schirmer"),
                        Contact(name: "Sharon Shelor"),
                        Contact(name: "Shanda Sermons"),
                        Contact(name: "Argelia Knupp"),
                        Contact(name: "Denice Vowell"),
                        Contact(name: "Nilsa Connell"),
                        Contact(name: "Robbin Buscemi"),
                        Contact(name: "Skye Gadsden"),
                        Contact(name: "Arthur Cromwell"),
                        Contact(name: "Myrtle Radke"),
                        Contact(name: "Eliseo Mefford"),
                        Contact(name: "Chante Shrewsbury"),
                        Contact(name: "Thu Delvalle"),
                        Contact(name: "Nona Classen"),
                        Contact(name: "Vivien Wilkenson"),
                        Contact(name: "Frank Chavera"),
                        Contact(name: "Sarai Dodson"),
                        Contact(name: "Rosalie Wronski"),
                        Contact(name: "Ressie Criado"),
                        Contact(name: "Cortez Rundell"),
                        Contact(name: "Estella Rhymes"),
                        Contact(name: "Tori Blanton"),
                        Contact(name: "Orpha Hamaker"),
                        Contact(name: "Sherita Husain"),
                        Contact(name: "Sharyn Novak"),
                        Contact(name: "Regan World"),
                        Contact(name: "Terence Bethea"),
                        Contact(name: "Lauretta Tingey"),
                        Contact(name: "Azucena Drews"),
                        Contact(name: "Brandie Chavers")]

        let family = [Contact(name: "Mom"), Contact(name: "Dad"), Contact(name: "Brother"), Contact(name: "Sister")]
        let coworkers = [Contact(name: "James"), Contact(name: "Kyle"), Contact(name: "Bob"), Contact(name: "Kelly")]
        return ContactList(friends: friends, family: family, coworkers: coworkers)
    }
}
