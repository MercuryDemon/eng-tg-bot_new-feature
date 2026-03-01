package domain

import "time"

type DictionaryWordPreview struct {
	Spelling      string
	RUTranslation string
}

type LearningWord struct {
	ID            string
	DictionaryID  string
	Spelling      string
	Transcription string
	Audio         string
	RUTranslation string
}

type ReviewWord struct {
	ID            string
	DictionaryID  string
	Spelling      string
	Transcription string
	Audio         string
	RUTranslation string
	EF            float64
	IntervalDays  int
	Repetition    int
	NextReviewAt  *time.Time
}
