cd MolenGeek

echo -e '\033[34mDonner un nom au dossier\033[37m'
read nomDossier

mkdir $nomDossier
cd $nomDossier

echo -e '\033[34mDonner un nom au projet\033[37m'
read nomProjet

echo -e '\033[32mInstallation de React\033[37m'
npx create-react-app $nomProjet

cd $nomProjet

echo -e '\033[32mInstallation de Sass\033[37m'
npm install sass

echo -e '\033[32mInstallation de React-Rooter\033[37m'
npm install react-router-dom

echo -e '\033[32mInstallation de TailWind\033[37m'
npm install -D tailwindcss
npx tailwindcss init

echo -e '\033[33mSuppression des fichier inutile\033[37m'
rm public/favicon.ico
rm public/logo192.png
rm public/logo512.png
rm public/manifest.json
rm public/robots.txt
rm src/App.test.js
rm src/logo.svg
rm src/reportWebVitals.js
rm src/setupTests.js

echo -e '\033[33mCréation du dossier Components\033[37m'
mkdir src/components
touch src/App.scss

echo -e '\033[33mRemplacement dans les fichiers\033[37m'
cat <<EOT > public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOT

cat <<EOT > src/index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <App />
);
EOT

cat <<EOT > src/app.js
import './App.css';
import './App.scss';
import { useState, useEffect } from 'react'
import {
  createBrowserRouter, 
  createRoutesFromElements,
  Route,
  RouterProvider
} from 'react-router-dom'

//Import Components


const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<Navbar/>}>
    </Route>
  )
)

function App() {
  return (
    <RouterProvider router={router}/>
  );
}

export default App;
EOT

cat <<EOT > src/app.css
EOT

cat <<EOT > tailwind.config.js
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOT

cat <<EOT > src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT

code .
#npm start