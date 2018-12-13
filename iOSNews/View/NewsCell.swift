import Foundation
import UIKit

class NewsCell: UITableViewCell {
    //let imageLabel = UIImageView()
    var authorLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupCell()
        self.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10).isActive = true
        authorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        authorLabel.backgroundColor = .red
        authorLabel.text = "something"
        authorLabel.textAlignment = .center
    }
    
//    private func setupCell() {
//        setupImage()
//    }
//
//    override func awakeFromNib() {
//        setupCell()
//    }
//
//    private func setupImage() {
//
//        self.addSubview(imageLabel)
//        imageLabel.translatesAutoresizingMaskIntoConstraints = false
//        imageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//        imageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10).isActive = true
//        imageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
//        imageLabel.heightAnchor.constraint(equalToConstant: 20)
//
//        imageLabel.layer.cornerRadius = 20.0
//        imageLabel.layer.masksToBounds = true
//        imageLabel.contentMode = .scaleAspectFill
//        imageLabel.backgroundColor = .red
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init decoder")
    }
}
