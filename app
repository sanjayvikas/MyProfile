from flask import Flask, request, render_template_string

app = Flask(__name__)

# HTML template for displaying submitted data
result_template = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 20px; }
        .result-container { max-width: 600px; margin: auto; }
    </style>
</head>
<body>
    <div class="container result-container">
        <h2 class="mb-4">Appointment Details</h2>
        <p><strong>Name:</strong> {{ name }}</p>
        <p><strong>Email:</strong> {{ email }}</p>
        <p><strong>Phone Number:</strong> {{ phone }}</p>
        <p><strong>Appointment Date:</strong> {{ appointmentDate }}</p>
        <p><strong>Location:</strong> {{ location }}</p>
        <p><strong>Message:</strong> {{ message }}</p>
        <a href="/" class="btn btn-primary">Back to Form</a>
    </div>
</body>
</html>
"""

@app.route('/')
def index():
    # Serve the form HTML
    return open('index-formval.html').read()

@app.route('/submit', methods=['POST'])
def submit():
    # Retrieve form data
    name = request.form.get('name')
    email = request.form.get('email')
    phone = request.form.get('phone')
    appointmentDate = request.form.get('appointmentDate')
    location = request.form.get('location')
    message = request.form.get('message')

    # Render the result template with form data
    return render_template_string(result_template, 
                                 name=name, 
                                 email=email, 
                                 phone=phone, 
                                 appointmentDate=appointmentDate, 
                                 location=location, 
                                 message=message)

if __name__ == '__main__':
    app.run(debug=True)