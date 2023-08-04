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

DROP DATABASE number_guess_game;
--
-- Name: number_guess_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess_game OWNER TO freecodecamp;

\connect number_guess_game

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    high_score integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_user_id_seq OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.games_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (110, 13, 46);
INSERT INTO public.games VALUES (111, 899, 47);
INSERT INTO public.games VALUES (112, 89, 47);
INSERT INTO public.games VALUES (113, 386, 48);
INSERT INTO public.games VALUES (114, 738, 48);
INSERT INTO public.games VALUES (115, 407, 47);
INSERT INTO public.games VALUES (116, 229, 47);
INSERT INTO public.games VALUES (117, 57, 47);
INSERT INTO public.games VALUES (118, 248, 49);
INSERT INTO public.games VALUES (119, 155, 49);
INSERT INTO public.games VALUES (120, 148, 50);
INSERT INTO public.games VALUES (121, 84, 50);
INSERT INTO public.games VALUES (122, 858, 49);
INSERT INTO public.games VALUES (123, 357, 49);
INSERT INTO public.games VALUES (124, 55, 49);
INSERT INTO public.games VALUES (125, 310, 51);
INSERT INTO public.games VALUES (126, 202, 51);
INSERT INTO public.games VALUES (127, 603, 52);
INSERT INTO public.games VALUES (128, 252, 52);
INSERT INTO public.games VALUES (129, 67, 51);
INSERT INTO public.games VALUES (130, 702, 51);
INSERT INTO public.games VALUES (131, 251, 51);
INSERT INTO public.games VALUES (132, 157, 53);
INSERT INTO public.games VALUES (133, 776, 53);
INSERT INTO public.games VALUES (134, 438, 54);
INSERT INTO public.games VALUES (135, 464, 54);
INSERT INTO public.games VALUES (136, 285, 53);
INSERT INTO public.games VALUES (137, 415, 53);
INSERT INTO public.games VALUES (138, 730, 53);
INSERT INTO public.games VALUES (139, 325, 55);
INSERT INTO public.games VALUES (140, 343, 55);
INSERT INTO public.games VALUES (141, 937, 56);
INSERT INTO public.games VALUES (142, 878, 56);
INSERT INTO public.games VALUES (143, 990, 55);
INSERT INTO public.games VALUES (144, 213, 55);
INSERT INTO public.games VALUES (145, 183, 55);
INSERT INTO public.games VALUES (146, 228, 57);
INSERT INTO public.games VALUES (147, 428, 57);
INSERT INTO public.games VALUES (148, 669, 58);
INSERT INTO public.games VALUES (149, 501, 58);
INSERT INTO public.games VALUES (150, 704, 57);
INSERT INTO public.games VALUES (151, 610, 57);
INSERT INTO public.games VALUES (152, 728, 57);
INSERT INTO public.games VALUES (153, 426, 59);
INSERT INTO public.games VALUES (154, 517, 59);
INSERT INTO public.games VALUES (155, 203, 60);
INSERT INTO public.games VALUES (156, 943, 60);
INSERT INTO public.games VALUES (157, 49, 59);
INSERT INTO public.games VALUES (158, 786, 59);
INSERT INTO public.games VALUES (159, 935, 59);
INSERT INTO public.games VALUES (160, 236, 61);
INSERT INTO public.games VALUES (161, 480, 61);
INSERT INTO public.games VALUES (162, 164, 62);
INSERT INTO public.games VALUES (163, 255, 62);
INSERT INTO public.games VALUES (164, 728, 61);
INSERT INTO public.games VALUES (165, 655, 61);
INSERT INTO public.games VALUES (166, 144, 61);
INSERT INTO public.games VALUES (167, 908, 63);
INSERT INTO public.games VALUES (168, 265, 63);
INSERT INTO public.games VALUES (169, 397, 64);
INSERT INTO public.games VALUES (170, 631, 64);
INSERT INTO public.games VALUES (171, 940, 63);
INSERT INTO public.games VALUES (172, 448, 63);
INSERT INTO public.games VALUES (173, 851, 63);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (46, 'Cloud', 13);
INSERT INTO public.users VALUES (48, 'user_1691121917731', 386);
INSERT INTO public.users VALUES (47, 'user_1691121917732', 229);
INSERT INTO public.users VALUES (49, 'user_1691121987355', 155);
INSERT INTO public.users VALUES (50, 'user_1691121987354', 148);
INSERT INTO public.users VALUES (51, 'user_1691122002116', 202);
INSERT INTO public.users VALUES (52, 'user_1691122002115', 252);
INSERT INTO public.users VALUES (53, 'user_1691122031240', 157);
INSERT INTO public.users VALUES (54, 'user_1691122031239', 438);
INSERT INTO public.users VALUES (56, 'user_1691122059556', 878);
INSERT INTO public.users VALUES (55, 'user_1691122059557', 183);
INSERT INTO public.users VALUES (57, 'user_1691122083046', 228);
INSERT INTO public.users VALUES (58, 'user_1691122083045', 501);
INSERT INTO public.users VALUES (59, 'user_1691122114552', 426);
INSERT INTO public.users VALUES (60, 'user_1691122114551', 203);
INSERT INTO public.users VALUES (62, 'user_1691122127773', 164);
INSERT INTO public.users VALUES (61, 'user_1691122127774', 144);
INSERT INTO public.users VALUES (63, 'user_1691122137863', 265);
INSERT INTO public.users VALUES (64, 'user_1691122137862', 397);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 173, true);


--
-- Name: games_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_user_id_seq', 64, true);


--
-- Name: users games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT games_pkey PRIMARY KEY (user_id);


--
-- Name: games games_pkey1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey1 PRIMARY KEY (game_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

