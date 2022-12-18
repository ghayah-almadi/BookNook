//
//  BooksModel.swift
//  BookNook
//
//  Created by Ghayah Almadi on 18/12/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Book: Identifiable {
    let id: String
    let author : String
    let coverimg : String
    let description : String
    let language : String
    let title : String
}

class BookModel : ObservableObject {
    
    @Published var booksArray = [Book]()
    
    func getDataFromDatabase(){
        let db = Firestore.firestore()
        db.collection("BookData").addSnapshotListener{(snap , err) in
            if err != nil{
                print("Error")
                return
            }
            guard let documents = snap?.documents else {
                print("No documents") // the printing is done here
                return
            }
            for i in documents {
                let id = i.documentID
                let data = i.data()
                let author = data["author"] as? String ?? ""
                let coverimg = data["coverimg"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let language = data["language"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                self.booksArray.append(Book(id: id, author: author, coverimg: coverimg, description: description, language: language, title: title))
            }
        }
    }
}
