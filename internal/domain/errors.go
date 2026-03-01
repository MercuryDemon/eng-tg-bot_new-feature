package domain

import "errors"

var (
	ErrDictionaryNotFound   = errors.New("dictionary not found")
	ErrSubscriptionNotFound = errors.New("subscription not found")
	ErrAlreadySubscribed    = errors.New("already subscribed")

	ErrInvalidDictionaryNumber = errors.New("invalid dictionary number")
	ErrNoWordsForLearning      = errors.New("no words for learning")
	ErrLearningNotStarted      = errors.New("learning not started")

	ErrReviewNotStarted     = errors.New("review not started")
	ErrNoWordsDueForReview  = errors.New("no words due for review")
	ErrEmptyReviewWordsList = errors.New("empty review words list")
	ErrReviewRoundFinished  = errors.New("review round finished")
	ErrInvalidReviewGrade   = errors.New("invalid review grade")
)
