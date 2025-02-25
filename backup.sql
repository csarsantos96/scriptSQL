--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

--
-- Name: store; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA store;


ALTER SCHEMA store OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    cpf character varying(30),
    email character varying(50) NOT NULL,
    name character varying(30),
    customer_id integer DEFAULT nextval('public.customer_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_order_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_order_1 (
    id integer NOT NULL,
    value integer,
    user_email_order character varying(30)
);


ALTER TABLE public.customer_order_1 OWNER TO postgres;

--
-- Name: customer_order_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_order_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_order_1_id_seq OWNER TO postgres;

--
-- Name: customer_order_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_order_1_id_seq OWNED BY public.customer_order_1.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    name character varying(30) NOT NULL,
    value integer,
    id integer DEFAULT nextval('public.product_id_seq'::regclass) NOT NULL,
    amount integer,
    brand character varying(30)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_1 (
    cod_product integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.product_1 OWNER TO postgres;

--
-- Name: customer_order_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order_1 ALTER COLUMN id SET DEFAULT nextval('public.customer_order_1_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (cpf, email, name, customer_id) FROM stdin;
010.538.555.78	csar.santos96@gmail.com	Cesar	1
435.321.239.20	daniel@gmail.com	Daniel	2
789.441.369.20	maria_clara@gmail.com	Maria	3
025.105.357.45	clarice_maia@gmail.com	Clarice	4
615.925.107.00	marcos@gmail.com	Marcos	5
456.132.978.19	joao19@gmail.com	Joao Antonio	6
369.258.741.25	carlos.tiago@gmail.com	Carlos Tiago	7
9591.735.843.22	cris.ronaldo@gmail.com	Cristiano Ronaldo	8
\.


--
-- Data for Name: customer_order_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_order_1 (id, value, user_email_order) FROM stdin;
1	100	csar.santos96@gmail.com
2	10	marcos@gmail.com
3	1000	csar.santos96@gmail.com
4	1500	daniel@gmail.com
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (name, value, id, amount, brand) FROM stdin;
Nike Air Jordan	1500	2	1000	Nike
Camisa Jogador Corinthians	975	3	1000	Nike
Camisa Jogador Corinthians 2	975	4	1000	Nike
Nike Air Force 1 	1000	1	100	Nike
Camisa Scuderia Ferrari	499	5	2000	Puma
Camisa Manga Longa AC Milan	499	6	3000	Puma
Camisa Treino Portugal	299	7	1000	Puma
\.


--
-- Data for Name: product_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_1 (cod_product, name) FROM stdin;
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 8, true);


--
-- Name: customer_order_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_order_1_id_seq', 4, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 7, true);


--
-- Name: customer_order_1 customer_order_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order_1
    ADD CONSTRAINT customer_order_1_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: product_1 name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_1
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: product_1 product_1_cod_product_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_1
    ADD CONSTRAINT product_1_cod_product_key UNIQUE (cod_product);


--
-- Name: customer_order_1 fk_order_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_order_1
    ADD CONSTRAINT fk_order_customer FOREIGN KEY (id) REFERENCES public.customer(customer_id);


--
-- PostgreSQL database dump complete
--

