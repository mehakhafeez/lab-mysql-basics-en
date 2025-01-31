-- Query 1: Get the id values of the first 5 clients from district_id with a value equals to 1.
SELECT client_id
FROM client
WHERE district_id = 1
ORDER BY client_id
LIMIT 5;

-- Query 2: Get an id value of the last client where the district_id equals to 72.
SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

-- Query 3: Get the 3 lowest amounts in the loan table.
SELECT amount
FROM loan
ORDER BY amount
LIMIT 3;

-- Query 4: What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT DISTINCT status
FROM loan
ORDER BY status;

-- Query 5: What is the loan_id of the highest payment received in the loan table?
SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

-- Query 6: What is the loan amount of the lowest 5 account_ids in the loan table?
SELECT account_id, amount
FROM loan
ORDER BY account_id
LIMIT 5;

-- Query 7: What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount
LIMIT 5;

-- Query 8: What are the unique values of k_symbol in the order table?
SELECT DISTINCT k_symbol
FROM `order`
ORDER BY k_symbol;

-- Query 9: What are the order_ids of the client with the account_id 34?
SELECT order_id
FROM `order`
WHERE account_id = 34;

-- Query 10: Which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

-- Query 11: What are the individual amounts that were sent to (account_to) id 30067122?
SELECT amount
FROM `order`
WHERE account_to = 30067122;

-- Query 12: Show the trans_id, date, type, and amount of the 10 first transactions from account_id 793 in chronological order, newest to oldest.
SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

-- Query 13: How many clients are from each district_id lower than 10?
SELECT district_id, COUNT(client_id) AS num_clients
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id;

-- Query 14: How many cards exist for each type? Rank starting with the most frequent type.
SELECT type, COUNT(card_id) AS num_cards
FROM card
GROUP BY type
ORDER BY num_cards DESC;

-- Query 15: Print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, SUM(amount) AS total_amount
FROM loan
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 10;

-- Query 16: Retrieve the number of loans issued for each day before 930907.
SELECT date, COUNT(loan_id) AS num_loans
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

-- Query 17: Count the number of loans issued for each unique loan duration in December 1997.
SELECT date, duration, COUNT(loan_id) AS num_loans
FROM loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date, duration;

-- Query 18: For account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming).
SELECT account_id, type, SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY type;