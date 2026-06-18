import csv
import random
import panda as pd
from datetime import datetime, timedelta


NUM_ROWS = 200000

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
    "New York", "London", "Mumbai", "Lagos", "Toronto", "Berlin", "Beijing", "Sao Paulo", "Paris", "Rome",
    "Madrid", "Mexico City", "Jakarta", "Karachi", "Dhaka", "Tokyo", "Manila", "Hanoi", "Istanbul", "Tehran",
    "Bangkok", "Johannesburg", "Cairo", "Nairobi", "Buenos Aires", "Bogota", "Santiago", "Lima", "Caracas", "Warsaw",
    "Kyiv", "Amsterdam", "Brussels", "Stockholm", "Oslo", "Copenhagen", "Helsinki", "Zurich", "Vienna", "Athens",
    "Lisbon", "Prague", "Budapest", "Bucharest", "Sofia", "Belgrade", "Zagreb", "Bratislava", "Ljubljana", "Dublin",
    "Auckland", "Sydney", "Riyadh", "Dubai", "Doha", "Kuwait City", "Muscat", "Tel Aviv", "Amman", "Beirut",
    "Casablanca", "Algiers", "Tunis", "Tripoli", "Khartoum", "Addis Ababa", "Accra", "Kampala", "Dar es Salaam", "Harare",
    "Lusaka", "Gaborone", "Windhoek", "Maputo", "Antananarivo", "Luanda", "Yaounde", "Abidjan", "Dakar", "Bamako",
    "Niamey", "N'Djamena", "Ouagadougou", "Kigali", "Mogadishu", "Asmara", "Juba", "Kabul", "Kathmandu", "Colombo",
    "Yangon", "Phnom Penh", "Vientiane", "Kuala Lumpur", "Singapore", "Seoul", "Pyongyang", "Ulaanbaatar", "Astana", "Tashkent",
    "Ashgabat", "Bishkek", "Dushanbe", "Baku", "Yerevan", "Tbilisi", "Baghdad", "Damascus", "Sanaa", "La Paz",
    "Asuncion", "Montevideo", "Quito", "Guatemala City", "Havana", "Port-au-Prince", "Santo Domingo", "Tegucigalpa", "San Salvador", "Managua",
    "San Jose", "Panama City", "Kingston", "Port of Spain", "Reykjavik", "Luxembourg City", "Valletta", "Nicosia", "Tallinn", "Riga",
    "Vilnius", "Minsk", "Chisinau", "Tirana", "Skopje", "Sarajevo", "Podgorica", "Pristina",
    "Port Moresby", "Suva", "Honiara", "Port Vila", "Apia", "Nuku'alofa", "Tarawa", "Palikir", "Ngerulmud", "Majuro",
    "Thimphu", "Male", "Bandar Seri Begawan", "Dili", "Moroni", "Victoria", "Port Louis", "Praia", "Libreville", "Brazzaville",
    "Kinshasa", "Malabo", "Bangui", "Conakry", "Bissau", "Monrovia", "Freetown", "Porto-Novo", "Lome",
    "Maseru", "Mbabane", "Djibouti City", "Banjul", "Gitega", "Andorra la Vella", "Monaco", "San Marino", "Vaduz", "Vatican City"
]

ai_tools = [
    "GPT-4", "GPT-5", "Claude", "Gemini", "Grok", "LLaMA",
    "Mistral", "Cohere", "Falcon", "Qwen", "DeepSeek",
    "GitHub Copilot", "Codeium", "Tabnine", "Cursor AI",
    "DALL-E", "Midjourney", "Stable Diffusion",
    "Runway ML", "Synthesia", "HeyGen",
    "ElevenLabs", "Whisper", "Deepgram",
    "Power BI Copilot", "Tableau AI", "DataRobot",
    "AutoGPT", "LangChain", "Devin",
    "Jasper", "Copy.ai", "GrammarlyGO",
    "Canva AI", "Figma AI",
    "Notion AI", "Microsoft Copilot",
    "Khanmigo", "Duolingo Max",
    "IBM Watson", "AlphaFold",
    "BloombergGPT", "Kensho",
    "Tesla Optimus", "Boston Dynamics AI",
    "Hugging Face", "TensorFlow", "PyTorch",
    "Perplexity AI", "Elicit"
]

use_cases = [
    "Coding", "Content Writing", "Data Analysis", "Research",
    "Automation", "Design", "Video Creation", "Learning",
    "Customer Support", "Marketing", "Translation"
]

subscription_types = ["Free", "Pro", "Enterprise"]
device_types = ["Mobile", "Desktop", "Tablet"]
internet_quality = ["Poor", "Average", "Good", "Excellent"]


def random_date():
    start = datetime(2025, 1, 1)
    return start + timedelta(days=random.randint(0, 365))


def dirty_value(value):
    if random.random() < 0.12:  # ~12% dirty data
        return random.choice([
            None,
            "",
            str(value).lower(),
            str(value).upper(),
            f"{value} ",
            f" {value}",
            "N/A",
            "unknown"
        ])
    return value


with open("ai_usage_dataset_200k.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)

    writer.writerow([
        "user_id", "age", "user_type", "experience_level",
        "industry", "country", "city", "ai_tool",
        "usage_hours_per_week", "primary_use_case",
        "satisfaction_score", "success", "failure_reason",
        "subscription_type", "device_type", "internet_quality",
        "productivity_gain_pct", "date_recorded"
    ])

    for i in range(1, NUM_ROWS + 1):
        age = random.randint(16, 65)
        success = random.choice([True, False])

        row = [
            i,
            age,
            dirty_value(random.choice(user_types)),
            dirty_value(random.choice(experience_levels)),
            dirty_value(random.choice(industries)),
            dirty_value(random.choice(countries)),
            dirty_value(random.choice(cities)),
            dirty_value(random.choice(ai_tools)),
            round(random.uniform(1, 60), 2),
            dirty_value(random.choice(use_cases)),
            round(random.uniform(1, 5), 2),
            success,
            False if success else True,
            dirty_value(random.choice(subscription_types)),
            dirty_value(random.choice(device_types)),
            dirty_value(random.choice(internet_quality)),
            round(random.uniform(5, 150), 2),
            random_date().date()
        ]

        writer.writerow(row)

print("CSV file generated successfully!")
