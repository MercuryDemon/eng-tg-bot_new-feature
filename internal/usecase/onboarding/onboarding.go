package onboarding

import (
	"context"
	"fmt"

	"github.com/rs/zerolog"
)

type OnboardingUsecase struct {
	userRepo UserRepo
	logger   *zerolog.Logger
}

func NewUsecase(userRepo UserRepo, parentLogger *zerolog.Logger) *OnboardingUsecase {
	if parentLogger == nil {
		panic("logger cannot be nil")
	}

	logger := parentLogger.With().Str("component", "onboarding_usecase").Logger()

	return &OnboardingUsecase{
		userRepo: userRepo,
		logger:   &logger,
	}
}

func (u *OnboardingUsecase) Start(ctx context.Context, userID int64, username string) error {
	const op = "Start"

	// idempotence creation
	err := u.userRepo.CreateUser(ctx, userID, username)
	if err != nil {
		return fmt.Errorf("%s: %w", op, err)
	}

	u.logger.Debug().
		Int64("user_id", userID).
		Str("username", username).
		Msgf("%s succeeded", op)

	return nil
}

func (u *OnboardingUsecase) RemoveMe(ctx context.Context, userID int64) error {
	const op = "RemoveMe"

	// idempotence deletion
	err := u.userRepo.DeleteUser(ctx, userID)
	if err != nil {
		return fmt.Errorf("%s: %w", op, err)
	}

	u.logger.Debug().
		Int64("user_id", userID).
		Msgf("%s succeeded", op)

	return nil
}
