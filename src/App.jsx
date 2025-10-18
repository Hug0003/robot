import { useState } from 'react'
import Header from './components/Header.jsx'
import Hero from './components/Hero.jsx'
import AOS from 'aos';
import 'aos/dist/aos.css';
import {useEffect} from "react";

function App() {

    useEffect(() => {
        AOS.init({
            duration: 1500,
            once: true,

        });
    })

  return (

      <main>
          {/* gradient image */}
          <img className="absolute top-0 left-0 w-full h-full object-contain opacity-60 -z-10"
               src="/src/assets/gradient.png" alt="gradient"/>

          {/* Blur Effect */}
          <div className="h-0 w-[40rem] absolute top-[20%]
           right-[5%] shadow-[0_0_900px_20px_#e99b63]
           -rotate-[30deg] -z-10">

          </div>

          <Header/>
          <Hero/>

      </main>
  )
}

export default App
