--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    solar_mass_e_12 numeric(3,2),
    type text,
    presence_of_life boolean
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
    name character varying(30) NOT NULL,
    planet_id integer,
    mass text,
    surface_gravity text,
    eccentricity numeric
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_types_id integer,
    is_spherical boolean,
    surface_gravity_m_s_2 real,
    num_moons integer,
    num_confirmed_humans integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying,
    valid_examples boolean NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass text,
    luminosity text,
    age_in_million_years real
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1.15, 'Sb, Sbc, SB(rs)bc', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1.50, 'SA(s)b', true);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', NULL, '(R)SA(rs)ab', true);
INSERT INTO public.galaxy VALUES (4, 'Eye of Sauron', NULL, '(R)SAB(rs)ab', true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', NULL, 'SAB(rs)cd', true);
INSERT INTO public.galaxy VALUES (6, 'Sunflower Galaxy', NULL, 'SAbc', true);
INSERT INTO public.galaxy VALUES (7, 'Triangulum Galaxy', 0.05, 'SA(s)cd', true);
INSERT INTO public.galaxy VALUES (8, 'Malin 1', 9.99, 'SB0a', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, '7.342e22 kg', '1.622 m/s^2', 0.0549);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, '1.0659e16 kg', '.0057 m/s^2', 0.0151);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, '1.4762e15 kg', '.003 m/s^2', 0.00033);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, '1.4819e23 kg', '1.428 m/s^2', 0.0013);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, NULL, NULL, 0.0015);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, '2.08e18 kg', '.02 m/s^2', 0.00319);
INSERT INTO public.moon VALUES (7, 'Thebe', 5, NULL, '.04 m/s^2', 0.0175);
INSERT INTO public.moon VALUES (8, 'Io', 5, '8.931938e22 kg', '1.796 m/s^2', 0.0041);
INSERT INTO public.moon VALUES (9, 'Europa', 5, '4.799844e22 kg', '1.314 m/s^2', 0.009);
INSERT INTO public.moon VALUES (10, 'Callisto', 5, '1.075938e23 kg', '1.235 m/s^2', 0.0074);
INSERT INTO public.moon VALUES (11, 'Themisto', 5, NULL, NULL, 0.2522112);
INSERT INTO public.moon VALUES (12, 'Leda', 5, NULL, NULL, 0.1648788);
INSERT INTO public.moon VALUES (13, 'Carpo', 5, NULL, NULL, 0.430);
INSERT INTO public.moon VALUES (14, 'Titan', 6, '1.3452e23 kg', '1.352 m/s^2', 0.0288);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, '2.306e21 kg', '.264 m/s^2', 0.0012583);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, '1.805635e21 kg', '.223 m/s^2', 0.0276812);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, '6.4e13 kg', '.077 m/s^2', 0.0013);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, '1.251e21 kg', '.249 m/s^2', 0.0012);
INSERT INTO public.moon VALUES (19, 'Titania', 7, '3.4e21 kg', '.365 m/s^2', 0.0011);
INSERT INTO public.moon VALUES (20, 'Galatea', 8, '2.12e18 kg', '.018 m/s^2', 0.00022);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 9.806, 1, 8000000);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 1, true, 3.7, 0, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 1, true, 8.87, 0, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, true, 3.72, 2, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, true, 24.79, 80, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, true, 10.44, 83, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, true, 8.69, 27, 0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, true, 11.15, 14, 0);
INSERT INTO public.planet VALUES (9, '55 Cancri B', 9, 2, true, NULL, 0, 0);
INSERT INTO public.planet VALUES (10, '55 Cancri C', 9, 4, true, NULL, 0, 0);
INSERT INTO public.planet VALUES (11, '55 Cancri D', 9, 2, true, NULL, 0, 0);
INSERT INTO public.planet VALUES (12, '55 Cancri E', 9, 5, true, NULL, 0, 0);
INSERT INTO public.planet VALUES (13, '55 Cancri F', 9, 4, true, NULL, 0, 0);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', true);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', true);
INSERT INTO public.planet_types VALUES (3, 'Neptunian', true);
INSERT INTO public.planet_types VALUES (4, 'Likely Gas Giant', true);
INSERT INTO public.planet_types VALUES (5, 'Unknown', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, '1.9885e30 kg', '3.828e26 W', 4600);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, '3.8 M', '240 L', 60);
INSERT INTO public.star VALUES (3, 'Gamma Andromedae', 2, '23 M', '2000 L', 6.5);
INSERT INTO public.star VALUES (4, 'Beta Andromedae', 2, '2.49 M', '1995 L', NULL);
INSERT INTO public.star VALUES (5, 'Alpha Comae Berenices', 3, '1.237 M', '1.72 L', NULL);
INSERT INTO public.star VALUES (6, 'Cor Caroli', 6, '2.97 M', '101 L', 165);
INSERT INTO public.star VALUES (7, 'La Superba', 6, '1.2 M', '9400 L', NULL);
INSERT INTO public.star VALUES (8, 'Crab Pulsar', 1, NULL, '0.9 L', 0.000967);
INSERT INTO public.star VALUES (9, '55 Cancri A', 1, '0.95 M', '0.00788 L', 860);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 5, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet fk_planet_planettype; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_planettype FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

