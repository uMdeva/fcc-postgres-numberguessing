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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    guesses integer NOT NULL
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
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 554);
INSERT INTO public.games VALUES (2, 1, 179);
INSERT INTO public.games VALUES (3, 2, 205);
INSERT INTO public.games VALUES (4, 2, 169);
INSERT INTO public.games VALUES (5, 1, 775);
INSERT INTO public.games VALUES (6, 1, 939);
INSERT INTO public.games VALUES (7, 1, 125);
INSERT INTO public.games VALUES (8, 13, 352);
INSERT INTO public.games VALUES (9, 13, 572);
INSERT INTO public.games VALUES (10, 14, 869);
INSERT INTO public.games VALUES (11, 14, 949);
INSERT INTO public.games VALUES (12, 13, 978);
INSERT INTO public.games VALUES (13, 13, 658);
INSERT INTO public.games VALUES (14, 13, 516);
INSERT INTO public.games VALUES (15, 15, 967);
INSERT INTO public.games VALUES (16, 15, 718);
INSERT INTO public.games VALUES (17, 16, 907);
INSERT INTO public.games VALUES (18, 16, 584);
INSERT INTO public.games VALUES (19, 15, 146);
INSERT INTO public.games VALUES (20, 15, 814);
INSERT INTO public.games VALUES (21, 15, 737);
INSERT INTO public.games VALUES (22, 17, 490);
INSERT INTO public.games VALUES (23, 17, 860);
INSERT INTO public.games VALUES (24, 18, 809);
INSERT INTO public.games VALUES (25, 18, 612);
INSERT INTO public.games VALUES (26, 17, 265);
INSERT INTO public.games VALUES (27, 17, 554);
INSERT INTO public.games VALUES (28, 17, 855);
INSERT INTO public.games VALUES (29, 19, 46);
INSERT INTO public.games VALUES (30, 19, 147);
INSERT INTO public.games VALUES (31, 20, 377);
INSERT INTO public.games VALUES (32, 20, 809);
INSERT INTO public.games VALUES (33, 19, 563);
INSERT INTO public.games VALUES (34, 19, 272);
INSERT INTO public.games VALUES (35, 19, 316);
INSERT INTO public.games VALUES (36, 21, 284);
INSERT INTO public.games VALUES (37, 21, 280);
INSERT INTO public.games VALUES (38, 22, 269);
INSERT INTO public.games VALUES (39, 22, 189);
INSERT INTO public.games VALUES (40, 21, 488);
INSERT INTO public.games VALUES (41, 21, 256);
INSERT INTO public.games VALUES (42, 21, 128);
INSERT INTO public.games VALUES (43, 23, 301);
INSERT INTO public.games VALUES (44, 23, 379);
INSERT INTO public.games VALUES (45, 24, 369);
INSERT INTO public.games VALUES (46, 24, 958);
INSERT INTO public.games VALUES (47, 23, 692);
INSERT INTO public.games VALUES (48, 23, 869);
INSERT INTO public.games VALUES (49, 23, 732);
INSERT INTO public.games VALUES (50, 25, 688);
INSERT INTO public.games VALUES (51, 25, 166);
INSERT INTO public.games VALUES (52, 26, 116);
INSERT INTO public.games VALUES (53, 26, 132);
INSERT INTO public.games VALUES (54, 25, 696);
INSERT INTO public.games VALUES (55, 25, 362);
INSERT INTO public.games VALUES (56, 25, 819);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1720036015901', 2, 169);
INSERT INTO public.users VALUES (1, 'user_1720036015902', 5, 125);
INSERT INTO public.users VALUES (3, 'user_1721156693800', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1721156693799', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1721157331130', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1721157331129', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1721157569475', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1721157569474', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1721157742898', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1721157742897', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1721157799966', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1721157799965', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1721157872162', 2, 869);
INSERT INTO public.users VALUES (13, 'user_1721157872163', 5, 352);
INSERT INTO public.users VALUES (16, 'user_1721157930705', 2, 584);
INSERT INTO public.users VALUES (15, 'user_1721157930706', 5, 146);
INSERT INTO public.users VALUES (18, 'user_1721158497378', 2, 612);
INSERT INTO public.users VALUES (17, 'user_1721158497379', 5, 265);
INSERT INTO public.users VALUES (20, 'user_1721158645391', 2, 377);
INSERT INTO public.users VALUES (19, 'user_1721158645392', 5, 46);
INSERT INTO public.users VALUES (22, 'user_1721158974942', 2, 189);
INSERT INTO public.users VALUES (21, 'user_1721158974943', 5, 128);
INSERT INTO public.users VALUES (24, 'user_1721158983539', 2, 369);
INSERT INTO public.users VALUES (23, 'user_1721158983540', 5, 301);
INSERT INTO public.users VALUES (26, 'user_1721159233609', 2, 116);
INSERT INTO public.users VALUES (25, 'user_1721159233610', 5, 166);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 56, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

