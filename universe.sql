--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_moon_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_data (
    planet_id integer,
    planet_name character varying(50),
    planet_distance numeric,
    moon_id integer NOT NULL,
    moon_name character varying(50),
    moon_distance numeric,
    planet_moon_data_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.planet_moon_data OWNER TO freecodecamp;

--
-- Name: planet_moon_data_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_data_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_data_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_data_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_data_planet_moon_id_seq OWNED BY public.planet_moon_data.planet_moon_data_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_moon_data planet_moon_data_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_data ALTER COLUMN planet_moon_data_id SET DEFAULT nextval('public.planet_moon_data_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way is a barred spiral galaxy containing our Solar System', 'Milky Way', 13000, 0, false, true);
INSERT INTO public.galaxy VALUES (2, 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way', 'Andromeda', 10000, 2540000, false, true);
INSERT INTO public.galaxy VALUES (3, 'The Triangulum Galaxy is a smaller spiral galaxy that is a satellite of the Andromeda Galaxy', 'Triangulum', 5000, 3000000, false, true);
INSERT INTO public.galaxy VALUES (4, 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo', 'Sombrero', 9000, 28000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy in the constellation Canes Venatici', 'Whirlpool', 15000, 23000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'The Pinwheel Galaxy is a face-on spiral galaxy in the constellation Ursa Major', 'Pinwheel', 20000, 21000000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The largest moon of Saturn', 'Titan', 4500, 1.2, false, true, 13);
INSERT INTO public.moon VALUES (2, 'The largest moon of Jupiter', 'Ganymede', 4500, 5.2, false, true, 14);
INSERT INTO public.moon VALUES (3, 'The second largest moon of Jupiter', 'Callisto', 4500, 4.8, false, true, 14);
INSERT INTO public.moon VALUES (4, 'A moon of Saturn with a heavily cratered surface', 'Rhea', 4500, 3.8, false, true, 13);
INSERT INTO public.moon VALUES (5, 'A moon of Jupiter with an icy surface', 'Europa', 4500, 5.7, false, true, 14);
INSERT INTO public.moon VALUES (6, 'A moon of Jupiter with a thin atmosphere', 'Io', 4500, 5.9, false, true, 14);
INSERT INTO public.moon VALUES (7, 'A moon of Uranus with a bright surface', 'Ariel', 4500, 10.8, false, true, 15);
INSERT INTO public.moon VALUES (8, 'The second largest moon of Saturn', 'Iapetus', 4500, 6.7, false, true, 13);
INSERT INTO public.moon VALUES (9, 'A moon of Neptune with a highly eccentric orbit', 'Triton', 4500, 10.5, false, true, 16);
INSERT INTO public.moon VALUES (10, 'The smallest moon of Saturn', 'Mimas', 4500, 3.2, false, true, 13);
INSERT INTO public.moon VALUES (11, 'A moon of Uranus with a chaotic rotation', 'Miranda', 4500, 11.4, false, true, 15);
INSERT INTO public.moon VALUES (12, 'A moon of Saturn with a smooth surface', 'Dione', 4500, 3.5, false, true, 13);
INSERT INTO public.moon VALUES (13, 'A moon of Uranus with a dark surface', 'Umbriel', 4500, 10.2, false, true, 15);
INSERT INTO public.moon VALUES (14, 'A moon of Neptune with a captured orbit', 'Nereid', 4500, 12.5, false, true, 16);
INSERT INTO public.moon VALUES (15, 'The innermost moon of Saturn', 'Pan', 4500, 3.3, false, true, 13);
INSERT INTO public.moon VALUES (16, 'A moon of Uranus with a highly reflective surface', 'Titania', 4500, 10.4, false, true, 15);
INSERT INTO public.moon VALUES (17, 'A moon of Saturn with a fractured surface', 'Enceladus', 4500, 3.4, false, true, 13);
INSERT INTO public.moon VALUES (18, 'A moon of Neptune with an irregular shape', 'Proteus', 4500, 12.9, false, true, 16);
INSERT INTO public.moon VALUES (19, 'A moon of Uranus with a heavily cratered surface', 'Oberon', 4500, 10.6, false, true, 15);
INSERT INTO public.moon VALUES (20, 'A moon of Saturn with a dark surface', 'Phoebe', 4500, 12.9, false, true, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'A rocky planet in the habitable zone of its star', 'Earth', 4500, 1, true, true, 5);
INSERT INTO public.planet VALUES (14, 'A gas giant with a ring system', 'Saturn', 4500, 1.2, false, true, 5);
INSERT INTO public.planet VALUES (15, 'A hot and dry planet with extreme surface temperatures', 'Venus', 4500, 0.72, false, true, 6);
INSERT INTO public.planet VALUES (16, 'A cold and icy world with a thin atmosphere', 'Neptune', 4500, 4.4, false, true, 6);
INSERT INTO public.planet VALUES (17, 'A rocky planet with a thin atmosphere', 'Mars', 4500, 1.5, false, true, 7);
INSERT INTO public.planet VALUES (18, 'A gas giant with many moons', 'Jupiter', 4500, 5.2, false, true, 7);
INSERT INTO public.planet VALUES (19, 'A super-Earth with a dense atmosphere', 'Gliese 581c', 2000, 20.3, true, true, 8);
INSERT INTO public.planet VALUES (20, 'A volcanic planet with a toxic atmosphere', 'Kepler-10b', 2000, 564, false, true, 8);
INSERT INTO public.planet VALUES (21, 'A waterworld with vast oceans', 'GJ 1214 b', 5000, 42, true, true, 9);
INSERT INTO public.planet VALUES (22, 'A tidally locked planet with extreme temperature variations', 'TRAPPIST-1e', 1000, 39.6, true, true, 9);
INSERT INTO public.planet VALUES (23, 'A desert planet with sandstorms', 'HD 189733b', 5000, 63, false, true, 10);
INSERT INTO public.planet VALUES (24, 'A frozen world with methane lakes', 'Gliese 436 b', 5000, 33.1, false, true, 10);


--
-- Data for Name: planet_moon_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 1, 'Titan', 1.2, 1, NULL);
INSERT INTO public.planet_moon_data VALUES (14, 'Saturn', 1.2, 2, 'Ganymede', 5.2, 2, NULL);
INSERT INTO public.planet_moon_data VALUES (14, 'Saturn', 1.2, 3, 'Callisto', 4.8, 3, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 4, 'Rhea', 3.8, 4, NULL);
INSERT INTO public.planet_moon_data VALUES (14, 'Saturn', 1.2, 5, 'Europa', 5.7, 5, NULL);
INSERT INTO public.planet_moon_data VALUES (14, 'Saturn', 1.2, 6, 'Io', 5.9, 6, NULL);
INSERT INTO public.planet_moon_data VALUES (15, 'Venus', 0.72, 7, 'Ariel', 10.8, 7, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 8, 'Iapetus', 6.7, 8, NULL);
INSERT INTO public.planet_moon_data VALUES (16, 'Neptune', 4.4, 9, 'Triton', 10.5, 9, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 10, 'Mimas', 3.2, 10, NULL);
INSERT INTO public.planet_moon_data VALUES (15, 'Venus', 0.72, 11, 'Miranda', 11.4, 11, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 12, 'Dione', 3.5, 12, NULL);
INSERT INTO public.planet_moon_data VALUES (15, 'Venus', 0.72, 13, 'Umbriel', 10.2, 13, NULL);
INSERT INTO public.planet_moon_data VALUES (16, 'Neptune', 4.4, 14, 'Nereid', 12.5, 14, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 15, 'Pan', 3.3, 15, NULL);
INSERT INTO public.planet_moon_data VALUES (15, 'Venus', 0.72, 16, 'Titania', 10.4, 16, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 17, 'Enceladus', 3.4, 17, NULL);
INSERT INTO public.planet_moon_data VALUES (16, 'Neptune', 4.4, 18, 'Proteus', 12.9, 18, NULL);
INSERT INTO public.planet_moon_data VALUES (15, 'Venus', 0.72, 19, 'Oberon', 10.6, 19, NULL);
INSERT INTO public.planet_moon_data VALUES (13, 'Earth', 1, 20, 'Phoebe', 12.9, 20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'A yellow dwarf star similar to the Sun', 'Sun', 4600, 0, false, true, 1);
INSERT INTO public.star VALUES (6, 'A red giant star in the constellation Orion', 'Betelgeuse', 8000, 643, false, true, 1);
INSERT INTO public.star VALUES (7, 'A binary star system in the constellation Cygnus', 'Albireo', 100, 380, false, true, 2);
INSERT INTO public.star VALUES (8, 'A blue supergiant star in the constellation Carina', 'Eta Carinae', 200, 7500, false, true, 3);
INSERT INTO public.star VALUES (9, 'A neutron star in the Crab Nebula', 'Crab Pulsar', 0, 6500, false, true, 4);
INSERT INTO public.star VALUES (10, 'A yellow dwarf star in the constellation Centaurus', 'Alpha Centauri A', 6000, 4.37, false, true, 5);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 24, true);


--
-- Name: planet_moon_data_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_data_planet_moon_id_seq', 20, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon_data pk_planet_moon_data_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_data
    ADD CONSTRAINT pk_planet_moon_data_id PRIMARY KEY (planet_moon_data_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet_moon_data unique_planet_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_data
    ADD CONSTRAINT unique_planet_moon_id UNIQUE (planet_moon_data_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_id_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id_star_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id_moon_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id_planet_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

