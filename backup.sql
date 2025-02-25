CREATE SCHEMA store;

CREATE TABLE public.customer (
    cpf character varying(30),
    email character varying(50) NOT NULL,
    name character varying(30)
);

ALTER TABLE public.customer OWNER TO postgres;

CREATE TABLE public.customer_order_1 (
    id integer NOT NULL,
    value integer,
    user_email_order character varying(30)
);

ALTER TABLE public.customer_order_1 OWNER TO postgres;

CREATE SEQUENCE public.customer_order_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.customer_order_1_id_seq OWNER TO postgres;

ALTER SEQUENCE public.customer_order_1_id_seq OWNED BY public.customer_order_1.id;

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.product_id_seq OWNER TO postgres;

CREATE TABLE public.product (
    name character varying(30) NOT NULL,
    value integer,
    id integer DEFAULT nextval('public.product_id_seq'::regclass) NOT NULL,
    amount integer,
    brand character varying(30)
);

ALTER TABLE public.product OWNER TO postgres;

CREATE TABLE public.product_1 (
    cod_product integer NOT NULL,
    name character varying(50) NOT NULL
);

ALTER TABLE public.product_1 OWNER TO postgres;

ALTER TABLE ONLY public.customer_order_1 ALTER COLUMN id SET DEFAULT nextval('public.customer_order_1_id_seq'::regclass);

COPY public.customer (cpf, email, name) FROM stdin;
010.538.555.78	csar.santos96@gmail.com	Cesar
435.321.239.20	daniel@gmail.com	Daniel
789.441.369.20	maria_clara@gmail.com	Maria
025.105.357.45	clarice_maia@gmail.com	Clarice
615.925.107.00	marcos@gmail.com	Marcos


COPY public.customer_order_1 (id, value, user_email_order) FROM stdin;
1	100	csar.santos96@gmail.com
2	10	marcos@gmail.com
3	1000	csar.santos96@gmail.com
4	1500	daniel@gmail.com

COPY public.product (name, value, id, amount, brand) FROM stdin;
Nike Air Jordan	1500	2	1000	Nike
Camisa Jogador Corinthians	975	3	1000	Nike
Camisa Jogador Corinthians 2	975	4	1000	Nike
Nike Air Force 1 	1000	1	100	Nike

COPY public.product_1 (cod_product, name) FROM stdin;

SELECT pg_catalog.setval('public.customer_order_1_id_seq', 4, true);

SELECT pg_catalog.setval('public.product_id_seq', 4, true);


ALTER TABLE ONLY public.product_1
    ADD CONSTRAINT name_unique UNIQUE (name);

ALTER TABLE ONLY public.product_1
    ADD CONSTRAINT product_1_cod_product_key UNIQUE (cod_product);

--
-- PostgreSQL database dump complete
--

