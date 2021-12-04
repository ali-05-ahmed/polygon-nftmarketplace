import React from "react";
import usericon from "../assets/user.png";
import { Link } from "react-router-dom";

const Navbar = () => {
  return (
    <div className="navbar">
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          width: "100%",
          alignItems: "center",
        }}
      >
        <div style={{ display: "flex", width: "30%" }} className="linkbar">
          <Link to="/collections">
            <a>Collections</a>
          </Link>

          <Link to="/my-assets">
            <a>NFTs</a>
          </Link>
          <Link to="/create-item">
            <a>Create</a>
          </Link>
          <Link to="/creator-dashboard">
            <a>Dashboard</a>
          </Link>
        </div>
        <div style={{ width: "5%" }}>
          <img style={{ width: "45%" }} src={usericon} alt="" />
        </div>
      </div>
    </div>
  );
};

export default Navbar;
