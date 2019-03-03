import Foundation
import UIKit

class NewsCell: UITableViewCell {
    var newsImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var authorLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    private func setupCell() {
        setupImage()
        setupLabels()
    }
    
    private func setupLabels() {
        setupTitleLabel()
        setupDecriptionLabel()
        setupAuthorLabel()
    }

    override func awakeFromNib() {
        setupCell()
    }

    private func setupImage() {

        self.addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.heightAnchor.constraint(equalToConstant: ImageViewConstants.height).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: ImageViewConstants.width).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ImageViewConstants.leftPadding).isActive = true
        newsImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: ImageViewConstants.topPadding).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: ImageViewConstants.bottomPadding).isActive = true
       

        newsImageView.layer.cornerRadius = ImageViewConstants.cornerRadius
        newsImageView.layer.masksToBounds = true
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.backgroundColor = .red
    }
    
    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: TitleConstants.height).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: TitleConstants.leftPadding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: TitleConstants.rightPadding).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: TitleConstants.topPadding).isActive = true
        titleLabel.backgroundColor = .blue
        titleLabel.text = "Title"
        titleLabel.textAlignment = .left
    }
    
    private func setupDecriptionLabel() {
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: DescriptionConstants.height).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: DescriptionConstants.leftPadding).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DescriptionConstants.rightPadding).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DescriptionConstants.topPadding).isActive = true
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .left
    }
    
    private func setupAuthorLabel() {
        self.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.heightAnchor.constraint(equalToConstant: AuthorConstants.height).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: AuthorConstants.leftPadding).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: AuthorConstants.rightPadding).isActive = true
        authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: AuthorConstants.topPadding).isActive = true
        authorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: AuthorConstants.bottomPadding).isActive = true
        authorLabel.text = "Author"
        authorLabel.textAlignment = .right
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("required init decoder")
    }
}

extension NewsCell {
    private enum ImageViewConstants {
        static let width: CGFloat = 100
        static let height: CGFloat = 100
        
        static let topPadding: CGFloat = 10
        static let bottomPadding: CGFloat = -10
        static let leftPadding: CGFloat = 10
        static let rightPadding: CGFloat = -10
        
        static let cornerRadius: CGFloat = 10
    }
    
    private enum TitleConstants {
        static let height: CGFloat = 30
        
        static let topPadding: CGFloat = 10
        static let bottomPadding: CGFloat = -5
        static let leftPadding: CGFloat = 10
        static let rightPadding: CGFloat = -10
        
        static let cornerRadius: CGFloat = 10
    }
    
    private enum DescriptionConstants {
        static let width: CGFloat = 100
        static let height: CGFloat = 30
        
        static let topPadding: CGFloat = 10
        static let bottomPadding: CGFloat = -10
        static let leftPadding: CGFloat = 10
        static let rightPadding: CGFloat = -10
        
        static let cornerRadius: CGFloat = 10
    }

    
    private enum AuthorConstants {
        static let width: CGFloat = 50
        static let height: CGFloat = 30
        
        static let topPadding: CGFloat = 10
        static let bottomPadding: CGFloat = -10
        static let leftPadding: CGFloat = 10
        static let rightPadding: CGFloat = -10
        
        static let cornerRadius: CGFloat = 10
    }
}

