#echo 'Donner un nom au dossier'
#read nomDossier

#if ! $nomDossier
#then 
#  cd MolenGeek/$nomDossier
#else 
#  mkdir MolenGeek/$nomDossier
#fi

echo 'Donner un nom au projet'
read nomProjet

echo 'Installation de React'
npx create-react-app $nomProjet

cd $nomProjet

echo 'Installation de Sass'
npm install sass

echo 'Installation de React-Rooter'
npm install react-router-dom

echo 'Installation de TailWind'
npm install -D tailwindcss
npx tailwindcss init

echo 'Suppression des fichier inutile'
rm public/favicon.ico
rm public/logo192.png
rm public/logo512.png
rm public/manifest.json
rm public/robots.txt
rm src/App.test.js
rm src/logo.svg
rm src/reportWebVitals.js
rm src/setupTests.js

echo 'Création du dossier Components'
mkdir src/components
touch src/App.scss

echo 'Remplacement dans les fichiers'
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
import { BrowserRouter } from 'react-router-dom';
import './index.css';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <BrowserRouter>
        <App />
    </BrowserRouter>
);
EOT

cat <<EOT > src/app.js
import './App.css';
import './App.scss';
import { useState, useEffect } from 'react'
import { Routes, Route} from 'react-router-dom';

//Import Components
//import { Home } from ./components/Home/Home

function App() {
  return (
    <div>
      <Routes>
        {/*<Route path='/' element={<Home/>}/>*/}
      </Routes>
    </div>
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