import "./App.css";
import Navbar from "./components/Navbar";
import { Routes, Route, Link, Outlet, useParams, useNavigate, HashRouter } from "react-router-dom";
import CreateItem from "./components/CreateItem"
import CreatorDashboard from "./components/CreatorDashboard"
import Home from "./components/Main"
import MyAssets from "./components/MyAssets"
import Collections from "./components/Collections";


const App = () => {

  return (
    <div className="App">
    <Navbar/>

    <Routes>
      <Route path="/" element={<Home />}/>
      <Route path="/create-item" element={<CreateItem />}/>
      <Route path="/creator-dashboard" element={<CreatorDashboard />}/>
      <Route path="/my-assets" element={<MyAssets />}/>
      <Route path="/collections" element={<Collections />}/>
      
    </Routes>
 
    </div>
  );
};


export default App;
