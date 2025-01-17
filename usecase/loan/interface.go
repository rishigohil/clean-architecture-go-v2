package loan

import (
	"github.com/rishigohil/clean-architecture-go-v2/entity"
)

//UseCase use case interface
type UseCase interface {
	Borrow(u *entity.User, b *entity.Book) error
	Return(b *entity.Book) error
}
