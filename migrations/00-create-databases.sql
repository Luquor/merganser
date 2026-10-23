-- Initial Merganser schema.
-- This file is executed against MYSQL_DATABASE by the MySQL image when
-- it is mounted at /docker-entrypoint-initdb.d.

CREATE TABLE IF NOT EXISTS decks (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
        ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id)
) ENGINE=InnoDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS cards (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    deck_id BIGINT UNSIGNED NOT NULL,
    front TEXT NOT NULL,
    back TEXT NOT NULL,
    due_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    interval_days INT UNSIGNED NOT NULL DEFAULT 0,
    ease_factor DECIMAL(4, 2) NOT NULL DEFAULT 2.50,
    repetitions INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    updated_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
        ON UPDATE CURRENT_TIMESTAMP(6),
    PRIMARY KEY (id),
    KEY ix_cards_deck_due_at (deck_id, due_at),
    CONSTRAINT fk_cards_deck
        FOREIGN KEY (deck_id) REFERENCES decks (id)
        ON DELETE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
