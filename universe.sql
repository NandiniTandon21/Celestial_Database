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
    name character varying(20) NOT NULL,
    area_in_kpc integer,
    volume integer,
    age_in_billion_yrs numeric,
    type text,
    has_water boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    surface_gravity_cgs integer,
    solar_mass integer,
    age numeric,
    type text,
    visible_to_naked_eye boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky way', 827, NULL, 13.61, 'Barred Spiral', true, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 3997, NULL, 10, 'Spiral', true, 2);
INSERT INTO public.galaxy VALUES ('Centaurus A', 52, NULL, 0.7, 'Elliptical', true, 3);
INSERT INTO public.galaxy VALUES ('Sculptor', 405, NULL, 13.1, 'Spiral', true, 4);
INSERT INTO public.galaxy VALUES ('Cygnus A', NULL, NULL, 0.06, 'Elliptical', true, 5);
INSERT INTO public.galaxy VALUES ('Cigar', 2, NULL, 0.06, 'Starburst', true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon1', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (2, 2, 'moon2', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (3, 3, 'moon3', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (4, 4, 'moon4', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (5, 5, 'moon5', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (6, 6, 'moon6', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (7, 7, 'moon7', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (8, 8, 'moon8', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (9, 9, 'moon9', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (10, 10, 'moon10', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (11, 11, 'moon11', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (12, 12, 'moon12', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (13, 12, 'moon13', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (14, 12, 'moon14', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (15, 12, 'moon15', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (16, 12, 'moon16', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (17, 12, 'moon17', 500, 750, 1500.75, NULL, false);
INSERT INTO public.moon VALUES (18, 12, 'moon18', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (19, 12, 'moon19', 500, 750, 1500.75, NULL, true);
INSERT INTO public.moon VALUES (20, 12, 'moon20', 500, 750, 1500.75, NULL, true);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'NA');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'NA');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'NA');
INSERT INTO public.more_info VALUES (4, 4, 'info4', 'NA');
INSERT INTO public.more_info VALUES (5, 5, 'info5', 'NA');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'planet1', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (2, 2, 'planet2', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (3, 3, 'planet3', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (4, 4, 'planet4', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (5, 5, 'planet5', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (6, 6, 'planet6', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (7, 6, 'planet7', 500, 750, 1500.75, NULL, false);
INSERT INTO public.planet VALUES (8, 6, 'planet8', 500, 750, 1500.75, NULL, false);
INSERT INTO public.planet VALUES (9, 6, 'planet9', 500, 750, 1500.75, NULL, true);
INSERT INTO public.planet VALUES (10, 6, 'planet10', 500, 750, 1500.75, NULL, false);
INSERT INTO public.planet VALUES (11, 6, 'planet11', 500, 750, 1500.75, NULL, false);
INSERT INTO public.planet VALUES (12, 6, 'planet12', 500, 750, 1500.75, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'star1', 500, 750, 1500.75, NULL, true);
INSERT INTO public.star VALUES (2, 2, 'star2', 500, 750, 1500.75, NULL, true);
INSERT INTO public.star VALUES (3, 3, 'star3', 500, 750, 1500.75, NULL, true);
INSERT INTO public.star VALUES (4, 4, 'star4', 500, 750, 1500.75, NULL, true);
INSERT INTO public.star VALUES (5, 5, 'star5', 500, 750, 1500.75, NULL, true);
INSERT INTO public.star VALUES (6, 6, 'star6', 500, 750, 1500.75, NULL, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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

