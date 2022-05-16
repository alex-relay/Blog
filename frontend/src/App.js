import React, { useEffect, useState } from "react";
import logo from "./logo.svg";
import Articles from "./components/Article";
import "./App.css";

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("/api/version1/articles")
      .then((response) => response.json())
      .then((data) => {
        setData(data);
      });
  }, []);

  return (
    <div>
      <Articles articles={data} />
    </div>
  );
}

export default App;
