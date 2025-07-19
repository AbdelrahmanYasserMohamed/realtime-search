# README
## 📌 Scope
Ruby on rails application for real-time-search ruby "3.2.2" , rails "7.0.8"


# 📝 FEATURES 
  
 - Live search tracking with analytics per user session (based on IP).
  
 - Tracks popular search queries over time.
  
 - Realtime search experience using Turbo Frames and Tailwind CSS.
 
 - PostgreSQL database for persistence.

 - Using RSpec to test different scenarios for search

 - Solve pyramid problem by efficiently tracking user search behavior to avoid duplicate or unnecessary records in the analytics

 # 🚀 Live Demo
 https://realtime-search-production.up.railway.app/

 ## ⚙️ Setup Instructions
```bash
git clone https://github.com/AbdelrahmanYasserMohamed/realtime-search.git

cd realtime-search

run `bundle install`

rails db:create 
rails db:migrate
rails db:seed

rails s
```

  
