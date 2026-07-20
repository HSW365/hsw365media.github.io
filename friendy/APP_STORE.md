# Friendy — App Store Submission Kit

Everything needed to submit Friendy to the Apple App Store. The web app in this
folder is the product; to ship it as a native iOS app, wrap it with Capacitor
(instructions at the bottom).

---

## 1. App Store Connect metadata

| Field | Value |
|---|---|
| **App name** (30 chars max) | `Friendy — Make Real Friends` |
| **Subtitle** (30 chars max) | `Meet friends who get you` |
| **Bundle ID** (suggested) | `io.queenee.friendy` |
| **Primary category** | Social Networking |
| **Secondary category** | Lifestyle |
| **Price** | Free |
| **Age rating** | 13+ (see §3) |
| **Copyright** | © 2026 QUEENEE.io |
| **Support URL** | `https://<your-pages-domain>/friendy/support.html` |
| **Marketing URL** | `https://<your-pages-domain>/friendy/` |
| **Privacy Policy URL** | `https://<your-pages-domain>/friendy/privacy.html` |

### Promotional text (170 chars max)
> Make real friends, the kind way. Match on shared interests, chat with zero pressure, and stay safe with one-tap block & report. No follower counts. No weirdness.

### Description
> **Your next good friend is already on Friendy.**
>
> Friendy is a kind, low-pressure place to meet friends who actually get you. Pick your interests, discover people who share them, and start easy conversations — no follower counts, no swiping games, no weirdness.
>
> **WHY YOU'LL LOVE IT**
> • Match on what you love — shared interests are highlighted on every profile, so you always have something to talk about
> • Easy, friendly chat with the people you connect with
> • Express yourself with a fun avatar and one-liner bio — no photos required
> • Private by design: your data stays on your device; no ads, no trackers
> • Works offline once installed
>
> **SAFETY FIRST**
> • Block anyone instantly — they're never notified
> • Report anything in one tap; every report is reviewed within 24 hours
> • Abusive language is filtered before it's ever sent
> • Delete your account and every trace of your data in two taps
>
> Friendy is for ages 13+. Free forever. Kind always.

### Keywords (100 chars max)
`friends,friendship,make friends,meet people,social,chat,new in town,platonic,besties,community`

### What's New (v1.0.0)
> Welcome to Friendy 1.0! 🎉 Discover people who share your interests, chat with new friends, and stay safe with built-in block, report, and message filtering.

---

## 2. Assets

| Asset | File | Status |
|---|---|---|
| App Store icon 1024×1024 (no alpha, no rounded corners) | `assets/icon-1024.png` | ✅ ready |
| iPhone home-screen icon 180×180 | `assets/icon-180.png` | ✅ ready |
| iPad Pro icon 167×167 | `assets/icon-167.png` | ✅ ready |
| iPad icon 152×152 | `assets/icon-152.png` | ✅ ready |
| iPhone spotlight 120×120 | `assets/icon-120.png` | ✅ ready |
| Vector master | `assets/icon.svg` | ✅ ready |
| Wordmark logo | `assets/logo.svg` | ✅ ready |

**Screenshots still required at upload time** (capture from the running app on
simulators; App Store Connect requirements as of 2026):

- 6.9" iPhone (e.g. 16 Pro Max): 1320 × 2868 px — 3 to 10 screenshots
- 6.5" iPhone (e.g. 11 Pro Max): 1284 × 2778 or 1242 × 2688 px
- 13" iPad Pro: 2064 × 2752 or 2048 × 2732 px (required if iPad is supported)

Suggested shots: Discover feed → profile card with matched interests → chat
thread → safety sheet (block/report) → profile screen.

---

## 3. Age rating questionnaire (expected answers)

Friendy contains user-to-user chat, so declare:

- Unrestricted web access: **No** (app content only)
- User-generated content / social features: **Yes** → results in **13+** minimum
- Profanity, violence, sexual content, gambling, drugs: **None** (filtered/prohibited)
- Kids Category: **No** — do not opt in

---

## 4. App Privacy ("nutrition label") answers

Friendy v1.0 stores everything on-device and transmits nothing.

- **Data collection: "Data Not Collected"** — the app collects no data off-device.
- No tracking, no third-party advertising, no analytics SDKs.
- If a future version adds server accounts, this section must be redone before release.

---

## 5. App Review Guidelines compliance checklist

| Guideline | Requirement | How Friendy complies |
|---|---|---|
| 1.2 User-Generated Content | Filter objectionable material | Outgoing messages pass a language filter (`BLOCKED_WORDS` in `app.html`) |
| 1.2 | Mechanism to report offensive content | 🚩 Report flow (with reasons) on every profile and chat, "reviewed within 24 hours" commitment |
| 1.2 | Ability to block abusive users | 🚫 One-tap block on every profile and chat; blocked list managed in Profile |
| 1.2 | Published contact info | Support email on support page and in policies |
| 1.1 Objectionable content | Zero-tolerance terms | Terms §4 states zero tolerance; users must agree at onboarding |
| 2.1 App Completeness | No placeholder content, fully functional | All tabs, flows, and links work; offline supported |
| 2.3 Accurate metadata | Description matches app | Metadata above describes shipped features only |
| 4.0 Design | Native-quality UX | iOS-style tab bar, sheets, safe-area support, standalone display |
| 5.1.1(v) Account deletion | In-app account deletion | Profile → "Delete my account & data" fully erases all data |
| 5.1.1 Data collection consent | Consent before collection | Onboarding requires explicit agreement to Terms + Privacy + Guidelines |
| 5.1.4 Kids | Age gating | Onboarding requires "I'm 13 or older" confirmation; 13+ rating |
| — | Privacy Policy URL | `privacy.html` (GDPR/CCPA aware) |
| — | Support URL | `support.html` with FAQ + contact |
| — | EULA / Terms | `terms.html` (or use Apple's standard EULA) |

### App Review notes (paste into "Notes for Review")
> Friendy is a local-first friendship app. All data (profile, friends, messages)
> is stored on-device only — there are no server accounts, so no demo login is
> needed. Suggested-friend profiles and chat replies in v1.0 are locally
> generated sample content used to demonstrate the experience. UGC safety tools
> (block, report, language filter) and full account deletion are implemented
> in-app: tap ⋯ on any profile/chat for block & report; Profile → "Delete my
> account & data" for deletion.

---

## 6. Wrapping the web app as a native iOS app (Capacitor)

Apple does not accept plain website wrappers (guideline 4.2), so keep the PWA
niceties (offline, standalone UI) and add at least one native capability
(e.g. push notifications or haptics) when wrapping:

```bash
npm init -y
npm install @capacitor/core @capacitor/cli @capacitor/ios
npx cap init Friendy io.queenee.friendy --web-dir .
npx cap add ios
npx cap open ios        # opens Xcode
```

In Xcode:
1. Set the App Icon from `assets/icon-1024.png` (Xcode 15+ single-size icon).
2. Set deployment target, signing team, and version `1.0.0 (1)`.
3. Add a native touch — e.g. `@capacitor/haptics` on the Add-Friend action and
   `@capacitor/push-notifications` for friend-message alerts.
4. Product → Archive → Distribute to App Store Connect.

Alternatively, distribute today with **zero App Store steps**: users can
"Add to Home Screen" from Safari — the manifest + service worker in this folder
already make that a full-screen, offline-capable install.

---

## 7. Pre-flight checklist

- [x] App icon 1024 (opaque, square) + all sizes
- [x] Landing page, privacy, terms, community guidelines, support pages
- [x] Onboarding with age gate (13+) and terms consent
- [x] Block / report / language filter (UGC 1.2)
- [x] In-app account & data deletion (5.1.1(v))
- [x] PWA: manifest, service worker, offline, apple-touch-icon
- [ ] Capture screenshots on simulators (see §2)
- [ ] Create app record in App Store Connect & paste metadata (§1)
- [ ] Complete age-rating questionnaire (§3) and privacy label (§4)
- [ ] Archive & upload build via Xcode, submit for review
