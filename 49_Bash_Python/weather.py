#!/usr/bin/python3
import requests
import datetime


def render_results():
    city_name = "Hrodna"
    api_key = "a5b48507d119efe1742f21c89d8e0e92"
    data = get_weather_results(city_name, api_key)

    weather = {
        'temp': "{0:.0f}".format(data['main']['temp']),
        'location': data['name'],
        'wind': data['wind']['speed'],
        'feels_like': data['main']['feels_like'],
        'pressure': data['main']['pressure'],
        'humidity': data['main']['humidity'],
        'description': data['weather'][0]['description'],
        'update_time': datetime.datetime.now().strftime('%H:%M:%S'),
    }

    return weather


def get_weather_results(city_name, api_key):
    api_url = "https://api.openweathermap.org/data/2.5/weather?q={}&units=metric&appid={}".format(city_name, api_key)
    r = requests.get(api_url)
    return r.json()


print(render_results())
