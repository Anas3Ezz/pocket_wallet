# Pocket Wallet: User Stories (Sprint 1-2)

## Assumptions

- Persona: anas, 28, freelancer. Gets paid by clients and sends money to family.
- Single currency (EGP) for now.
- Balance and transactions come from fake local data in Sprint 1. No pagination yet.
- "Counterparty" = the person or business on the other side of a transaction.
- Login: OTP is 6 digits, valid for 2 minutes. Resend allowed after 60 seconds, max 3 resends. Max 5 wrong attempts per code.
- PIN is 6 digits. Rejected as too easy: all-same digits, or ascending/descending sequences.
- A user isn't considered logged in until a PIN exists. If the app is killed during PIN creation, they restart from Login.
- Storage of the PIN is a Sprint 7 concern (secure storage).
- Recipient of a transfer is identified by phone number.
- Minimum transfer is 1.00 EGP, max 2 decimal places.
- PIN confirmation, double-tap protection and receipts for transfers: Sprint 6.
- Phone number is read-only in Profile.
- Supported languages: English, Arabic.

---

## Story 1: See my balance

As Sara, I want to see how much money I have right now and what happened recently, so that I know whether I can afford to pay someone.

**Acceptance criteria**

- Given I'm logged in, When I open the app, Then I see my balance formatted as money (e.g. "1,250.50 EGP"), never as a raw number.
- Given I have more than 5 transactions, When Home loads, Then I see only the 5 most recent, newest first.
- Given I have no transactions, When Home loads, Then I see my balance and an empty-state message instead of a blank list.

## Story 2: Log in with a code

As Sara, I want to log in with a code sent to my phone, so that I can reach my wallet without remembering a password.

**Acceptance criteria**

- Given I entered a correct, unexpired code, When I submit it, Then I'm signed in and continue to PIN creation (or Home if I have a PIN).
- Given I entered a wrong code, When I submit it, Then I see an "incorrect code" message and can try again.
- Given I've entered 5 wrong codes, When I submit the 5th, Then I can't try again until I request a new code.
- Given the code is older than 2 minutes, When I submit it, Then it's rejected and I'm told it expired.
- Given I'm on the code screen, When I wait, Then I see a countdown to expiry, and "Resend" is enabled after 60s, up to 3 times.

## Story 3: Create a PIN

As Sara, I want to set a PIN after my first login, so that only I can open my wallet on this phone.

**Acceptance criteria**

- Given I entered a valid PIN and the same PIN again, When I confirm, Then my PIN is saved and I'm taken to Home.
- Given I entered an easy-to-guess PIN (e.g. 111111 or 123456), When I continue, Then I'm told to choose another one.
- Given the confirmation doesn't match, When I submit it, Then I see a mismatch error and re-enter the confirmation.
- Given I quit the app before finishing, When I reopen it, Then I'm back at Login.

## Story 4: See my transaction history

As Sara, I want to see all my past transactions, so that I can check who I paid and who paid me.

**Acceptance criteria**

- Given I have transactions, When I open the list, Then they appear newest first.
- Given a transaction row, When I read it, Then I see the date/time, the amount, and the counterparty ("to" for money out, "from" for money in).
- Given money in and money out, When I look at the amounts, Then they're distinguishable by sign (+/-) and not by color alone.
- Given I have no transactions, When I open the list, Then I see an empty-state message.

## Story 5: Send money

As Sara, I want to send money to someone by their phone number, so that I can pay family or clients without cash.

**Acceptance criteria**

- Given a valid phone number and an amount between 1.00 EGP and my balance, When I confirm, Then the transfer is submitted.
- Given an amount above my balance, When I enter it, Then I see "not enough balance" and can't send.
- Given an amount under 1.00 EGP (0 or negative), When I enter it, Then I see a minimum-amount error and can't send.
- Given an invalid phone number, When I try to send, Then I see an error and nothing is submitted.

## Story 6: Manage my profile

As Sara, I want to see and update my profile and preferences, so that the app shows my name and speaks my language.

**Acceptance criteria**

- Given I'm logged in, When I open Profile, Then I see my name and phone number.
- Given I edit my name, When I save, Then the new name is shown and kept after restarting the app.
- Given I switch the language to Arabic, When I confirm, Then the app switches immediately to Arabic with RTL layout and stays that way after restart.
- Given I tap Log out and confirm, When it completes, Then I'm taken to Login and can't go back to Home.
