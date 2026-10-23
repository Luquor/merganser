-- Sample data for local development.
-- This file runs after 00-create-databases.sql.

INSERT INTO decks (name, description)
SELECT
    'World History',
    'Ten introductory questions about world history.'
WHERE NOT EXISTS (
    SELECT 1
    FROM decks
    WHERE name = 'World History'
);

SET @history_deck_id = (
    SELECT id
    FROM decks
    WHERE name = 'World History'
    ORDER BY id
    LIMIT 1
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Which battle in 1066 led to the Norman conquest of England?',
       'The Battle of Hastings.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Which battle in 1066 led to the Norman conquest of England?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Which civilization built Machu Picchu?',
       'The Inca civilization.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Which civilization built Machu Picchu?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'What was the Magna Carta?',
       'A 1215 English charter that limited the power of the monarch.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'What was the Magna Carta?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Who was the first emperor of a unified China?',
       'Qin Shi Huang.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Who was the first emperor of a unified China?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Which empire was ruled by Augustus?',
       'The Roman Empire.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Which empire was ruled by Augustus?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'What trade network connected China with the Mediterranean world?',
       'The Silk Road.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'What trade network connected China with the Mediterranean world?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'In which year did the French Revolution begin?',
       '1789.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'In which year did the French Revolution begin?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Who led the Indian independence movement using nonviolent resistance?',
       'Mahatma Gandhi.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Who led the Indian independence movement using nonviolent resistance?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Which treaty formally ended World War I between Germany and the Allied Powers?',
       'The Treaty of Versailles.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Which treaty formally ended World War I between Germany and the Allied Powers?'
);

INSERT INTO cards (deck_id, front, back)
SELECT @history_deck_id,
       'Which ancient civilization developed democracy in Athens?',
       'The ancient Greeks, especially the Athenians.'
WHERE NOT EXISTS (
    SELECT 1 FROM cards
    WHERE deck_id = @history_deck_id
      AND front = 'Which ancient civilization developed democracy in Athens?'
);
