import { Route, Routes } from "react-router-dom";
import Home from "./pages/Home";
import Orders from "./pages/Orders";
import Profile from "./pages/Profile";

// functional component
function App() {
  return (
    <>
      <Routes>
        <Route path="/home" element={<Home/>}></Route>
        <Route path="/Profile" element={<Profile/>}></Route>
        <Route path="/Orders" element={<Orders/>}></Route>
        
      </Routes>
    </>
  );
}

export default App;
