import 'boxicons/css/boxicons.min.css';


function Header() {

    /* Toggle Mobile Menu */
    function toggleMenuMobile() {
        const menumobile = document.getElementById('mobilMenu');
        menumobile.classList.toggle('hidden');
    }

    return (
        <header className="flex justify-between items-center py-4 px-4 lg:px-20">

            <h1 className="text-3xl md:text-4xl lg:text-5xl font-light m-0"
                data-aos="fade-down"
                data-aos-easing="linear"
                data-aos-duration="500"> Deva2 </h1>


            <nav className="hidden md:flex items-center gap-12">
                <a href="#" className="text-base tracking-wider
                 transition-colors hover:text-gray-300 z-50"
                   data-aos="fade-down"
                   data-aos-easing="linear"
                   data-aos-duration="1000">
                    Company
                </a>
                <a href="#" className="text-base tracking-wider
                 transition-colors hover:text-gray-300 z-50"
                   data-aos="fade-down"
                   data-aos-easing="linear"
                   data-aos-duration="1500">
                    Features
                </a>
                <a href="#" className="text-base tracking-wider
                 transition-colors hover:text-gray-300 z-50"
                   data-aos="fade-down"
                   data-aos-easing="linear"
                   data-aos-duration="2000">
                    Ressources
                </a>
                <a href="#" className="text-base tracking-wider
                 transition-colors hover:text-gray-300 z-50"
                   data-aos="fade-down"
                   data-aos-easing="linear"
                   data-aos-duration="2500">
                    About us
                </a>
            </nav>

            <button className="hidden md:block bg-[#a7a7a7]
             text-black py-3 px-8 rounded-full border-none
             font-medium transition-all duration-500 hover:bg-white
             cursor-pointer z-50">
                Signin
            </button>

            {/* Mobile Menu button - Visible on Mobile */}
            <button className="md:hidden text-3xl p-2 z-50" onClick={toggleMenuMobile}>
                <i className='bx bx-menu'></i>
            </button>

            {/* Mobile Menu button - Hidden by default */}
            <div id="mobilMenu" className="hidden fixed top-16 bottom-0 right-0 left-0 p-5
             md:hidden z-40 bg-black opacity-70 backdrop-blur- md">
                <nav className="flex flex-col items-center gap-6">
                    <a href="#" className="text-base tracking-wider
                        transition-colors hover:text-gray-300 z-50">
                        Company
                    </a>
                    <a href="#" className="text-base tracking-wider
                        transition-colors hover:text-gray-300 z-50">
                        Features
                    </a>
                    <a href="#" className="text-base tracking-wider
                        transition-colors hover:text-gray-300 z-50">
                        Ressources
                    </a>
                    <a href="#" className="text-base tracking-wider
                        transition-colors hover:text-gray-300 z-50">
                        About us
                    </a></nav>
            </div>


        </header>)
}

export default Header;