import numpy as np
import pandas as pd

NUM_ROWS = 200000

# --- these are the data columns we are using ---

user_types = [
    "Student", "Junior Dev", "Senior Developer", "Data Analyst",
    "ML Engineer", "Business Owner", "Teacher", "Researcher",
    "Content Creator", "Marketer", "Doctor", "Lawyer",
    "Freelancer", "Startup Founder", "Government Worker",
    "Cybersecurity Analyst", "Designer", "Product Manager",
    "DevOps Engineer", "Non-Tech User"
]

experience_levels = ["Beginner", "Intermediate", "Advanced", "Expert"]

industries = [
    "Tech", "Finance", "Healthcare", "Education", "Retail",
    "Manufacturing", "Government", "Media", "Legal",
    "Energy", "Agriculture", "Transportation"
]

countries = [
    "USA", "UK", "India", "Nigeria", "Canada", "Germany", "China", "Brazil", "France", "Italy",
    "Spain", "Mexico", "Indonesia", "Pakistan", "Bangladesh", "Japan", "Philippines", "Vietnam", "Turkey", "Iran",
    "Thailand", "South Africa", "Egypt", "Kenya", "Argentina", "Colombia", "Chile", "Peru", "Venezuela", "Poland",
    "Ukraine", "Netherlands", "Belgium", "Sweden", "Norway", "Denmark", "Finland", "Switzerland", "Austria", "Greece",
    "Portugal", "Czech Republic", "Hungary", "Romania", "Bulgaria", "Serbia", "Croatia", "Slovakia", "Slovenia", "Ireland",
    "New Zealand", "Australia", "Saudi Arabia", "UAE", "Qatar", "Kuwait", "Oman", "Israel", "Jordan", "Lebanon",
    "Morocco", "Algeria", "Tunisia", "Libya", "Sudan", "Ethiopia", "Ghana", "Uganda", "Tanzania", "Zimbabwe",
    "Zambia", "Botswana", "Namibia", "Mozambique", "Madagascar", "Angola", "Cameroon", "Ivory Coast", "Senegal", "Mali",
    "Niger", "Chad", "Burkina Faso", "Rwanda", "Somalia", "Eritrea", "South Sudan", "Afghanistan", "Nepal", "Sri Lanka",
    "Myanmar", "Cambodia", "Laos", "Malaysia", "Singapore", "South Korea", "North Korea", "Mongolia", "Kazakhstan", "Uzbekistan",
    "Turkmenistan", "Kyrgyzstan", "Tajikistan", "Azerbaijan", "Armenia", "Georgia", "Iraq", "Syria", "Yemen", "Bolivia",
    "Paraguay", "Uruguay", "Ecuador", "Guatemala", "Cuba", "Haiti", "Dominican Republic", "Honduras", "El Salvador", "Nicaragua",
    "Costa Rica", "Panama", "Jamaica", "Trinidad and Tobago", "Iceland", "Luxembourg", "Malta", "Cyprus", "Estonia", "Latvia",
    "Lithuania", "Belarus", "Moldova", "Albania", "North Macedonia", "Bosnia and Herzegovina", "Montenegro", "Kosovo",
    "Papua New Guinea", "Fiji", "Solomon Islands", "Vanuatu", "Samoa", "Tonga", "Kiribati", "Micronesia", "Palau", "Marshall Islands",
    "Bhutan", "Maldives", "Brunei", "Timor-Leste", "Comoros", "Seychelles", "Mauritius", "Cape Verde", "Gabon", "Congo",
    "DR Congo", "Equatorial Guinea", "Central African Republic", "Guinea", "Guinea-Bissau", "Liberia", "Sierra Leone", "Benin", "Togo",
    "Lesotho", "Eswatini", "Djibouti", "Gambia", "Burundi", "Andorra", "Monaco", "San Marino", "Liechtenstein", "Vatican City"
]

cities = [
    "New York", "London", "Mumbai", "Lagos", "Toronto", "Berlin", "Beijing", "Sao Paulo", "Paris", "Rome", "Madrid", "Mexico City", "Jakarta", "Karachi", "Dhaka", "Tokyo", "Manila", "Hanoi", "Istanbul", "Tehran", "Bangkok", "Johannesburg", "Cairo", "Nairobi", "Buenos Aires", "Bogota", "Santiago", "Lima", "Caracas", "Warsaw", "Kyiv", "Amsterdam", "Brussels", "Stockholm", "Oslo", "Copenhagen", "Helsinki", "Zurich", "Vienna""Athens", "Lisbon", "Prague", "Budapest", "Bucharest", "Sofia", "Belgrade", "Zagreb", "Bratislava", "Ljubljana", "Dublin", "Auckland", "Sydney", "Riyadh", "Dubai", "Doha", "Kuwait City", "Muscat", "Tel Aviv", "Amman", "Beirut", "Casablanca", "Algiers", "Tunis", "Tripoli", "Khartoum", "Addis Ababa", "Accra", "Kampala", "Dar es Salaam", "Harare", "Lusaka", "Gaborone", "Windhoek", "Maputo", "Antananarivo", "Luanda", "Yaounde", "Abidjan", "Dakar", "Bamako", "Niamey", "N'Djamena", "Ouagadougou", "Kigali", "Mogadishu", "Asmara", "Juba", "Kabul", "Kathmandu", "Colombo", "Yangon", "Phnom Penh", "Vientiane", "Kuala Lumpur", "Singapore", "Seoul", "Pyongyang", "Ulaanbaatar", "Astana", "Tashkent", "Ashgabat", "Bishkek", "Dushanbe", "Baku", "Yerevan", "Tbilisi", "Baghdad", "Damascus", "Sanaa", "La Paz", "Asuncion", "Montevideo", "Quito", "Guatemala City", "Havana", "Port-au-Prince", "Santo Domingo", "Tegucigalpa", "San Salvador", "Managua", "San Jose", "Panama City", "Kingston", "Port of Spain", "Reykjavik", "Luxembourg City", "Valletta", "Nicosia", "Tallinn", "Riga", "Vilnius", "Minsk", "Chisinau", "Tirana", "Skopje", "Sarajevo", "Podgorica", "Pristina", "Port Moresby", "Suva", "Honiara", "Port Vila", "Apia", "Nuku'alofa", "Tarawa", "Palikir", "Ngerulmud", "Majuro", "Thimphu", "Male", "Bandar Seri Begawan", "Dili", "Moroni", "Victoria", "Port Louis", "Praia", "Libreville", "Brazzaville", "Kinshasa", "Malabo", "Bangui", "Conakry", "Bissau", "Monrovia", "Freetown", "Porto-Novo", "Lome", "Maseru", "Mbabane", "Djibouti City", "Banjul", "Gitega", "Andorra la Vella", "Monaco", "San Marino", "Vaduz", "Vatican City"]

ai_tools = ["GPT-4", "GPT-5", "Claude", "Gemini", "Grok", "LLaMA", "Mistral", "Cohere", "Falcon", "Qwen", "DeepSeek", "GitHub Copilot", "Codeium", "Tabnine", "Cursor AI", "DALL-E", "Midjourney", "Stable Diffusion", "Runway ML", "Synthesia", "HeyGen", "ElevenLabs", "Whisper", "Deepgram", "Power BI Copilot", "Tableau AI", "DataRobot", "AutoGPT", "LangChain", "Devin", "Jasper", "Copy.ai", "GrammarlyGO", "Canva AI", "Figma AI", "Notion AI", "Microsoft Copilot", "Khanmigo", "Duolingo Max", "IBM Watson", "AlphaFold", "BloombergGPT", "Kensho", "Tesla Optimus", "Boston Dynamics AI", "Hugging Face", "TensorFlow", "PyTorch", "Perplexity AI", "Elicit"
            ]

use_cases = [
    "Coding", "Content Writing", "Data Analysis", "Research",
    "Automation", "Design", "Video Creation", "Learning",
    "Customer Support", "Marketing", "Translation"
]

subscription_types = ["Free", "Pro", "Enterprise"]

device_types = ["Mobile", "Desktop", "Tablet"]
internet_quality = ["Poor", "Average", "Good", "Excellent"]


# Convert lists to numpy arrays for speed
user_types_arr = np.array(user_types)
exp_arr = np.array(experience_levels)
ind_arr = np.array(industries)
country_arr = np.array(countries)
city_arr = np.array(cities)
tools_arr = np.array(ai_tools)
use_arr = np.array(use_cases)
sub_arr = np.array(subscription_types)
device_arr = np.array(device_types)
net_arr = np.array(internet_quality)

# --- Generate columns using ---
user_id = np.arange(1, NUM_ROWS + 1)
age = np.random.randint(16, 70, NUM_ROWS)
user_type = np.random.choice(user_types_arr, NUM_ROWS)
experience = np.random.choice(exp_arr, NUM_ROWS)
industry = np.random.choice(ind_arr, NUM_ROWS)
country = np.random.choice(country_arr, NUM_ROWS)
city = np.random.choice(city_arr, NUM_ROWS)
ai_tool = np.random.choice(tools_arr, NUM_ROWS)
usage_hours = np.round(np.random.uniform(1, 60, NUM_ROWS), 2)
use_case = np.random.choice(use_arr, NUM_ROWS)
satisfaction = np.round(np.random.uniform(1, 5, NUM_ROWS), 2)
success = np.random.choice([True, False], NUM_ROWS)
failure_reasons = np.array([
    "Low accuracy", "Slow response", "Wrong output",
    "Connection issues", "Tool limitation"
])

failure_reason = np.where(
    success,
    None,
    np.random.choice(failure_reasons, NUM_ROWS)
)

subscription = np.random.choice(sub_arr, NUM_ROWS)
device = np.random.choice(device_arr, NUM_ROWS)
internet = np.random.choice(net_arr, NUM_ROWS)
productivity = np.round(np.random.uniform(5, 150, NUM_ROWS), 2)

#  dates
start = np.datetime64('2025-01-01')
dates = start + np.random.randint(0, 365, NUM_ROWS).astype('timedelta64[D]')

# ---  DataFrame ---
df = pd.DataFrame({
    "user_id": user_id,
    "age": age,
    "user_type": user_type,
    "experience_level": experience,
    "industry": industry,
    "country": country,
    "city": city,
    "ai_tool": ai_tool,
    "usage_hours_per_week": usage_hours,
    "primary_use_case": use_case,
    "satisfaction_score": satisfaction,
    "success": success,
    "failure_reason": failure_reason,
    "subscription_type": subscription,
    "device_type": device,
    "internet_quality": internet,
    "productivity_gain_pct": productivity,
    "date_recorded": dates
})
# --- Save ---
df.to_csv("ai_usage_.csv", index=False)
df.to_excel("ai_usage.xlsx", index=False, engine="openpyxl")

print("CSV and Excel generated successfully")
