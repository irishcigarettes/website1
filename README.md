# Nike Website Clone

A recreation of the Nike.com homepage with modern design and responsive layout.

## Features

- Responsive navigation with dropdown menus
- Hero sections with promotional content
- Product spotlight grid
- Sport category sections
- Modern, clean design matching Nike's aesthetic
- Mobile-friendly responsive design

## Setup & Run

### Option 1: Using PowerShell Server (Windows - Easiest)

1. Double-click `start-server.bat` OR run in PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File start-server.ps1
```

2. Open your browser and navigate to:
```
http://localhost:8000
```

The server will run until you press Ctrl+C in the terminal.

### Option 2: Using Node.js

1. Install dependencies:
```bash
npm install
```

2. Start the server:
```bash
npm start
```

3. Open your browser and navigate to:
```
http://localhost:3000
```

### Option 3: Using Python

If you have Python installed:

1. Navigate to the project directory
2. Run:
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

3. Open your browser and navigate to:
```
http://localhost:8000
```

### Option 4: Direct File Opening

Simply double-click `index.html` to open it in your browser (some features may be limited).

## Project Structure

```
website1/
├── index.html      # Main HTML structure
├── styles.css      # All styling
├── script.js       # Interactive functionality
├── server.js       # Node.js server
└── package.json    # Node.js dependencies
```

## Technologies Used

- HTML5
- CSS3 (Grid, Flexbox)
- Vanilla JavaScript
- Express.js (for local server)

## Notes

- This is a frontend recreation for educational purposes
- Product images are placeholder gradients
- All links are non-functional (for demo purposes)
