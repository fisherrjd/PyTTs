import speech_recognition as sr

# obtain audio from the microphone
r = sr.Recognizer()
with sr.Microphone() as source:

    response = {
        "success": True,
        "error": None,
        "transcription": None
    }
    print("Say something!")
    audio = r.listen(source)
    response["transcription"] = r.recognize_google(audio, language='en-US')

    print(response)

