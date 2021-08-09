--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-09 10:05:57

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
-- TOC entry 2 (class 3079 OID 16406)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 286 (class 1255 OID 16835)
-- Name: before_insert_decharge(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_decharge() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_decharge = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_decharge() OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 16825)
-- Name: before_insert_intervention(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_intervention() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_intervention = gen_random_uuid();
	NEW.probleme_resolu = false;
	NEW.done = false ;
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_intervention() OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 16827)
-- Name: before_insert_intervention_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_intervention_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_intervention_type = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_intervention_type() OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 16498)
-- Name: before_insert_lieu(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_lieu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_lieu = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_lieu() OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 16829)
-- Name: before_insert_materiel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_materiel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_materiel = gen_random_uuid();
-- 	NEW.num_materiel_type = ( SELECT num_materiel_type from materiel_type WHERE libelle_materiel_type = NEW.materiel_type );
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_materiel() OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 16833)
-- Name: before_insert_materiel_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_materiel_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_materiel_type = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_materiel_type() OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 16566)
-- Name: before_insert_notification(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_notification = gen_random_uuid();
	NEW.date_envoie = NOW();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_notification() OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 16561)
-- Name: before_insert_probleme(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_probleme() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_probleme() OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 16497)
-- Name: before_insert_probleme_statut(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_probleme_statut() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_statut = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_probleme_statut() OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 16903)
-- Name: before_insert_probleme_tech(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_probleme_tech() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_tech = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_probleme_tech() OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 16923)
-- Name: before_insert_probleme_tech_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_probleme_tech_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_tech_type = gen_random_uuid();
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_probleme_tech_type() OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 16479)
-- Name: before_insert_probleme_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_probleme_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_type = gen_random_uuid();
	
	return NEW;
end ;
$$;


ALTER FUNCTION public.before_insert_probleme_type() OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 16443)
-- Name: before_insert_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_user() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	select num_type_user 
	into NEW.num_type_user
	from type_user
	where type_user.code = NEW.type_user;
	NEW.num_user = gen_random_uuid();
	NEW.password = crypt(NEW.password,gen_salt('md5'));
	NEW.type_user = hmac(NEW.type_user::text , NEW.username::text , 'md5');
	
	RETURN NEW;

end;
$$;


ALTER FUNCTION public.before_insert_user() OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 16952)
-- Name: before_update_intervention(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_update_intervention() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	if NEW.date_debut < NEW.date_programme then
		NEW.date_debut = NEW.date_programme;
	end if;
	return new;
end;
$$;


ALTER FUNCTION public.before_update_intervention() OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 16502)
-- Name: deleteall(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deleteall() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
	delete from notification;
 	delete from app_user;
 	delete from type_user;
	delete from probleme;
	delete from lieu;
	delete from probleme_type;
	delete from probleme_statut;
	delete from intervention;
	delete from intervention_type;
end;
$$;


ALTER FUNCTION public.deleteall() OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 16837)
-- Name: deleteallintervention(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deleteallintervention() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
	delete from intervention;
end;
$$;


ALTER FUNCTION public.deleteallintervention() OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 16504)
-- Name: deleteallproblem(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deleteallproblem() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
/* deleting a problem requires to delete all its notifs */
	delete from notification;
 	--delete from app_user;
	delete from probleme;
	--delete from lieu;
	--delete from probleme_type;
	--delete from probleme_statut;
end;
$$;


ALTER FUNCTION public.deleteallproblem() OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 16503)
-- Name: deletealluser(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deletealluser() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
/* deleting a user requires to delete all its notifs , then some problem would have no notifs*/
	delete from notification;
 	delete from app_user;
	--delete from probleme;
	--delete from lieu;
	--delete from probleme_type;
	--delete from probleme_statut;
end;
$$;


ALTER FUNCTION public.deletealluser() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16395)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    num_user uuid NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    type_user character varying NOT NULL,
    num_type_user uuid
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE app_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.app_user IS 'for the user of the app : User , Tech_main , Dashboard';


--
-- TOC entry 216 (class 1259 OID 16799)
-- Name: decharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decharge (
    num_decharge uuid NOT NULL,
    num_intervention uuid,
    date_debut_decharge date NOT NULL,
    date_fin_decharge date
);


ALTER TABLE public.decharge OWNER TO postgres;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE decharge; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.decharge IS 'decharge de materiel ... materiel va au bureau dsist';


--
-- TOC entry 217 (class 1259 OID 16809)
-- Name: decharge_materiel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decharge_materiel (
    num_decharge uuid NOT NULL,
    num_materiel uuid NOT NULL,
    configuration_origine text
);


ALTER TABLE public.decharge_materiel OWNER TO postgres;

--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE decharge_materiel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.decharge_materiel IS 'relation ( decharge -- materiel )';


--
-- TOC entry 215 (class 1259 OID 16761)
-- Name: intervention; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intervention (
    num_intervention uuid NOT NULL,
    num_app_user_tech_main_creator uuid,
    num_probleme_constate uuid,
    num_materiel uuid,
    num_lieu_intervention uuid,
    num_intervention_type uuid,
    num_intervention_pere uuid,
    motif text,
    log text,
    date_programme timestamp with time zone NOT NULL,
    date_debut timestamp with time zone,
    date_fin timestamp with time zone,
    probleme_resolu boolean,
    done boolean NOT NULL
);


ALTER TABLE public.intervention OWNER TO postgres;

--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE intervention; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.intervention IS 'intervention du type intervention_type .... euh';


--
-- TOC entry 212 (class 1259 OID 16732)
-- Name: intervention_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intervention_type (
    num_intervention_type uuid NOT NULL,
    libelle_intervention_type text NOT NULL,
    code_intervention_type text
);


ALTER TABLE public.intervention_type OWNER TO postgres;

--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE intervention_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.intervention_type IS 'type d''intervention : installation , reponse a une notification , ...';


--
-- TOC entry 204 (class 1259 OID 16489)
-- Name: lieu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lieu (
    num_lieu uuid NOT NULL,
    libelle text NOT NULL
);


ALTER TABLE public.lieu OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16748)
-- Name: materiel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiel (
    num_materiel uuid NOT NULL,
    num_materiel_type uuid NOT NULL,
    libelle_materiel text NOT NULL
);


ALTER TABLE public.materiel OWNER TO postgres;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE materiel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.materiel IS 'gere les materiels ,
libelle , comme : switch budget , mira-pc ';


--
-- TOC entry 213 (class 1259 OID 16740)
-- Name: materiel_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materiel_type (
    num_materiel_type uuid NOT NULL,
    libelle_materiel_type text NOT NULL
);


ALTER TABLE public.materiel_type OWNER TO postgres;

--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE materiel_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.materiel_type IS 'gere type de materiels : Switch , Ordinateurs , telephone , ...';


--
-- TOC entry 207 (class 1259 OID 16541)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    num_notification uuid NOT NULL,
    num_app_user_user uuid NOT NULL,
    num_app_user_tech_main uuid,
    num_probleme uuid NOT NULL,
    date_envoie timestamp with time zone NOT NULL,
    date_reponse timestamp with time zone,
    num_intervention uuid
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE notification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.notification IS 'notification envoye par un utilisateur , concernant un probleme , repondu par un technicien';


--
-- TOC entry 206 (class 1259 OID 16518)
-- Name: probleme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme (
    num_probleme uuid NOT NULL,
    num_probleme_type uuid NOT NULL,
    num_lieu uuid NOT NULL,
    num_probleme_statut uuid NOT NULL,
    remarque text
);


ALTER TABLE public.probleme OWNER TO postgres;

--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE probleme; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme IS 'enregistre les probleme a partir des probleme types , lieu , statut';


--
-- TOC entry 203 (class 1259 OID 16481)
-- Name: probleme_statut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme_statut (
    num_probleme_statut uuid NOT NULL,
    libelle text NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.probleme_statut OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16905)
-- Name: probleme_tech; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme_tech (
    num_probleme_tech uuid NOT NULL,
    num_lieu_probleme_tech uuid,
    remarque text,
    num_probleme_tech_type uuid
);


ALTER TABLE public.probleme_tech OWNER TO postgres;

--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE probleme_tech; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme_tech IS 'occurence d''un type de probleme_tech, lieu ,remarque';


--
-- TOC entry 222 (class 1259 OID 16890)
-- Name: probleme_tech_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme_tech_type (
    num_probleme_tech_type uuid NOT NULL,
    libelle_probleme_tech_type text NOT NULL
);


ALTER TABLE public.probleme_tech_type OWNER TO postgres;

--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE probleme_tech_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme_tech_type IS 'probleme plus specifique , jargon du technicien , technique';


--
-- TOC entry 202 (class 1259 OID 16471)
-- Name: probleme_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme_type (
    num_probleme_type uuid NOT NULL,
    libelle text NOT NULL,
    code text NOT NULL
);


ALTER TABLE public.probleme_type OWNER TO postgres;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE probleme_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme_type IS 'type de probleme';


--
-- TOC entry 205 (class 1259 OID 16505)
-- Name: type_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_user (
    num_type_user uuid NOT NULL,
    code text NOT NULL,
    libelle text NOT NULL
);


ALTER TABLE public.type_user OWNER TO postgres;

--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE type_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_user IS 'pour les types d''utilisateur de l''application : USER , TECH_MAIN , DASH';


--
-- TOC entry 219 (class 1259 OID 16821)
-- Name: view_app_user_tech_main; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_app_user_tech_main AS
 SELECT app_user.num_user,
    app_user.username,
    app_user.password,
    app_user.type_user,
    app_user.num_type_user
   FROM public.app_user
  WHERE (app_user.num_type_user = ( SELECT type_user.num_type_user
           FROM public.type_user
          WHERE (type_user.code = 'TECH_MAIN'::text)));


ALTER TABLE public.view_app_user_tech_main OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16817)
-- Name: view_app_user_user; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_app_user_user AS
 SELECT app_user.num_user,
    app_user.username,
    app_user.password,
    app_user.type_user,
    app_user.num_type_user
   FROM public.app_user
  WHERE (app_user.num_type_user = ( SELECT type_user.num_type_user
           FROM public.type_user
          WHERE (type_user.code = 'USER'::text)));


ALTER TABLE public.view_app_user_user OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16933)
-- Name: view_intervention_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_intervention_full AS
 SELECT intervention.num_intervention_type,
    intervention.num_intervention,
    intervention.num_app_user_tech_main_creator,
    intervention.num_probleme_constate,
    intervention.num_materiel,
    intervention.num_lieu_intervention,
    intervention.num_intervention_pere,
    intervention.motif,
    intervention.log,
    intervention.date_programme,
    intervention.date_debut,
    intervention.date_fin,
    intervention.probleme_resolu,
    intervention.done,
    app_user.num_user,
    app_user.username AS tech_main_username,
    lieu.num_lieu,
    lieu.libelle AS libelle_lieu,
    intervention_type.libelle_intervention_type,
    intervention_type.code_intervention_type,
    ( SELECT decharge.num_decharge
           FROM public.decharge
          WHERE (decharge.num_intervention = intervention.num_intervention)) AS num_decharge,
    probleme_tech.num_probleme_tech,
    probleme_tech.remarque,
    probleme_tech_type.num_probleme_tech_type,
    probleme_tech_type.libelle_probleme_tech_type,
    ( SELECT lieu_1.libelle
           FROM public.lieu lieu_1
          WHERE (lieu_1.num_lieu = probleme_tech.num_lieu_probleme_tech)) AS lieu_probleme_tech,
    materiel.libelle_materiel,
    materiel_type.libelle_materiel_type
   FROM (((((((public.intervention
     JOIN public.app_user ON ((intervention.num_app_user_tech_main_creator = app_user.num_user)))
     JOIN public.lieu ON ((intervention.num_lieu_intervention = lieu.num_lieu)))
     JOIN public.intervention_type USING (num_intervention_type))
     LEFT JOIN public.materiel USING (num_materiel))
     LEFT JOIN public.materiel_type USING (num_materiel_type))
     LEFT JOIN public.probleme_tech ON ((intervention.num_probleme_constate = probleme_tech.num_probleme_tech)))
     LEFT JOIN public.probleme_tech_type USING (num_probleme_tech_type));


ALTER TABLE public.view_intervention_full OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16938)
-- Name: view_intervention_undone; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_intervention_undone AS
 SELECT intervention.num_intervention_type,
    intervention.num_intervention,
    intervention.num_app_user_tech_main_creator,
    intervention.num_probleme_constate,
    intervention.num_materiel,
    intervention.num_lieu_intervention,
    intervention.num_intervention_pere,
    intervention.motif,
    intervention.log,
    intervention.date_programme,
    intervention.date_debut,
    intervention.date_fin,
    intervention.probleme_resolu,
    intervention.done,
    app_user.num_user,
    app_user.username,
    lieu.num_lieu,
    lieu.libelle,
    intervention_type.libelle_intervention_type,
    intervention_type.code_intervention_type,
    probleme_tech.num_probleme_tech,
    probleme_tech_type.num_probleme_tech_type,
    probleme_tech_type.libelle_probleme_tech_type
   FROM (((((public.intervention
     JOIN public.app_user ON ((intervention.num_app_user_tech_main_creator = app_user.num_user)))
     JOIN public.lieu ON ((intervention.num_lieu_intervention = lieu.num_lieu)))
     JOIN public.intervention_type USING (num_intervention_type))
     LEFT JOIN public.probleme_tech ON ((intervention.num_probleme_constate = probleme_tech.num_probleme_tech)))
     LEFT JOIN public.probleme_tech_type USING (num_probleme_tech_type))
  WHERE ((intervention.done = false) AND (intervention.date_debut IS NULL) AND (intervention.date_fin IS NULL));


ALTER TABLE public.view_intervention_undone OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16886)
-- Name: view_materiel; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_materiel AS
 SELECT materiel.num_materiel_type,
    materiel.num_materiel,
    materiel.libelle_materiel,
    materiel_type.libelle_materiel_type
   FROM (public.materiel
     JOIN public.materiel_type USING (num_materiel_type));


ALTER TABLE public.view_materiel OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16718)
-- Name: view_notification_by_tech_main; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_by_tech_main AS
 SELECT notification.num_app_user_tech_main,
    app_user.username AS user_tech_main_username,
    type_user.libelle AS type_user,
    notification.num_notification,
    probleme_type.libelle AS probleme_type,
    lieu.num_lieu,
    lieu.libelle AS lieu,
    probleme_type.code,
    probleme_statut.libelle,
    probleme.remarque,
    notification.date_envoie,
    notification.date_reponse,
    notification.num_app_user_user,
    ( SELECT app_user_1.username
           FROM public.app_user app_user_1
          WHERE (app_user_1.num_user = notification.num_app_user_user)) AS user_sender_username,
    notification.num_intervention
   FROM ((((((public.notification
     JOIN public.app_user ON ((notification.num_app_user_tech_main = app_user.num_user)))
     JOIN public.type_user USING (num_type_user))
     JOIN public.probleme USING (num_probleme))
     JOIN public.lieu USING (num_lieu))
     JOIN public.probleme_type USING (num_probleme_type))
     JOIN public.probleme_statut USING (num_probleme_statut));


ALTER TABLE public.view_notification_by_tech_main OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16723)
-- Name: view_notification_by_user; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_by_user AS
 SELECT notification.num_app_user_user,
    app_user.username AS user_sender_username,
    type_user.libelle AS type_user,
    notification.num_notification,
    probleme_type.libelle AS probleme_type,
    lieu.num_lieu,
    lieu.libelle AS lieu,
    probleme_type.code,
    probleme_statut.code AS statut,
    probleme_statut.libelle AS statut_libelle,
    probleme.remarque,
    notification.date_envoie,
    notification.date_reponse,
    notification.num_app_user_tech_main,
    ( SELECT app_user_1.username
           FROM public.app_user app_user_1
          WHERE (app_user_1.num_user = notification.num_app_user_tech_main)) AS tech_main_username,
    notification.num_intervention
   FROM ((((((public.notification
     JOIN public.app_user ON ((notification.num_app_user_user = app_user.num_user)))
     JOIN public.type_user USING (num_type_user))
     JOIN public.probleme USING (num_probleme))
     JOIN public.lieu USING (num_lieu))
     JOIN public.probleme_type USING (num_probleme_type))
     JOIN public.probleme_statut USING (num_probleme_statut));


ALTER TABLE public.view_notification_by_user OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16860)
-- Name: view_notification_by_user_intervention; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_by_user_intervention AS
 SELECT notif.num_app_user_user,
    notif.user_sender_username,
    notif.type_user,
    notif.num_notification,
    notif.probleme_type,
    notif.num_lieu,
    notif.lieu,
    notif.code,
    notif.statut,
    notif.statut_libelle,
    notif.remarque,
    notif.date_envoie,
    notif.date_reponse,
    notif.num_app_user_tech_main,
    notif.tech_main_username,
    notif.num_intervention AS num_int_notif,
    inter.num_intervention,
    inter.num_app_user_tech_main_creator,
    inter.num_probleme_constate,
    inter.num_materiel,
    inter.num_lieu_intervention,
    inter.num_intervention_type,
    inter.num_intervention_pere,
    intervention_type.libelle_intervention_type,
    inter.motif,
    inter.log,
    inter.date_programme,
    inter.date_debut,
    inter.date_fin,
    inter.probleme_resolu,
    inter.done
   FROM ((public.view_notification_by_user notif
     JOIN public.intervention inter ON ((inter.num_intervention = notif.num_intervention)))
     JOIN public.intervention_type USING (num_intervention_type));


ALTER TABLE public.view_notification_by_user_intervention OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16659)
-- Name: view_notification_tech_main_probleme_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_tech_main_probleme_full AS
 SELECT notification.num_app_user_tech_main,
    app_user.username,
    app_user.num_type_user,
    type_user.libelle AS type_user,
    notification.num_notification,
    notification.num_app_user_user,
    notification.num_probleme,
    notification.date_envoie,
    notification.date_reponse,
    probleme.num_lieu,
    lieu.libelle AS lieu,
    probleme.num_probleme_type,
    probleme_type.libelle AS probleme_type,
    probleme_type.code,
    probleme.num_probleme_statut,
    probleme_statut.libelle,
    probleme.remarque
   FROM ((((((public.notification
     JOIN public.app_user ON ((notification.num_app_user_tech_main = app_user.num_user)))
     JOIN public.type_user USING (num_type_user))
     JOIN public.probleme USING (num_probleme))
     JOIN public.lieu USING (num_lieu))
     JOIN public.probleme_type USING (num_probleme_type))
     JOIN public.probleme_statut USING (num_probleme_statut));


ALTER TABLE public.view_notification_tech_main_probleme_full OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16675)
-- Name: view_notification_user_probleme_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_user_probleme_full AS
 SELECT app_user.num_user,
    app_user.username,
    app_user.num_type_user,
    type_user.libelle AS type_user,
    notification.num_notification,
    notification.num_app_user_tech_main,
    notification.num_probleme,
    notification.date_envoie,
    notification.date_reponse,
    probleme.num_lieu,
    lieu.libelle AS lieu,
    probleme.num_probleme_type,
    probleme_type.libelle AS probleme_type,
    probleme_type.code AS probleme_type_code,
    probleme.num_probleme_statut,
    probleme_statut.libelle AS probleme_statut_libelle,
    probleme_statut.code AS probleme_statut_code,
    probleme.remarque
   FROM ((((((public.notification
     JOIN public.app_user ON ((notification.num_app_user_user = app_user.num_user)))
     JOIN public.type_user USING (num_type_user))
     JOIN public.probleme USING (num_probleme))
     JOIN public.lieu USING (num_lieu))
     JOIN public.probleme_type USING (num_probleme_type))
     JOIN public.probleme_statut USING (num_probleme_statut));


ALTER TABLE public.view_notification_user_probleme_full OWNER TO postgres;

--
-- TOC entry 3214 (class 0 OID 16395)
-- Dependencies: 201
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (num_user, username, password, type_user, num_type_user) FROM stdin;
fec0af71-5541-40e1-93ad-033ad5fb2fa0	user	$1$oJi8IE7w$Bi202g/0yhBQ/mujY9T.s0	\\x2f48d53aa0d24e09d9caca94e022d34c	818dcd07-a26a-495a-8ab7-50daea67ac9c
68db45ca-29ad-483d-b8e5-52b629d24d80	tech_main	$1$P1DvmbUK$Z14wLKU7Twnzta0uC4WJd1	\\xfaba77f56c28e1853e127066541ef708	e0e8ccad-edee-48c9-bd24-076a685157bc
83a31293-3fbc-4e32-8814-0421fae2b491	user1	$1$8xrxAMro$rrWpyrCzXSyg8/CChqYUO/	\\xf617d6f9208f4152479668d23e585b4f	818dcd07-a26a-495a-8ab7-50daea67ac9c
237451bc-067e-4c61-ae8d-9c5fe93b49ce	tech1	$1$aVPtKOXU$QU3TcYHSNGDx/3saBaU4D0	\\xa0caf8f28dfcd05b1cd418d0dde1980d	e0e8ccad-edee-48c9-bd24-076a685157bc
\.


--
-- TOC entry 3225 (class 0 OID 16799)
-- Dependencies: 216
-- Data for Name: decharge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.decharge (num_decharge, num_intervention, date_debut_decharge, date_fin_decharge) FROM stdin;
bb7848e5-3516-45b0-9f00-6470ed43e2b8	\N	2021-07-29	2021-07-30
8dd413b4-98bb-4471-a56c-84012636b819	\N	2021-07-29	2021-07-30
d44b3f94-3948-4048-8ff8-7f5ad8c110fe	\N	2021-07-29	2021-07-30
ce4057ee-1113-4341-ae19-a5f8600ce2f2	\N	2021-07-29	2021-07-30
ab6218b4-306b-4cab-876c-7865df8f891f	\N	2021-07-29	2021-07-30
c2762733-14f9-47c3-8d38-55e23cda2a7b	\N	2021-07-29	2021-07-30
5d9f9689-4a06-4ad7-a668-c08dc3bbae7c	\N	2021-07-29	2021-07-30
713ee3cd-99ed-465f-9bbe-e550919bc026	\N	2021-07-29	2021-07-30
ee1061da-202c-4d1c-90b9-6311bfdd1dd9	\N	2021-07-29	2021-07-30
6d347aed-e3e8-4edd-9f2a-c80718e31575	\N	2021-07-29	2021-07-30
55ef6333-d6a6-4a16-84b6-ac7b856a0307	\N	2021-07-29	2021-07-30
2e4b37fe-c113-4f02-849d-8167303f27b6	\N	2021-07-29	2021-07-30
cb2f558d-97d5-41e5-8a0b-e4a9ce338a3a	\N	2021-07-29	2021-07-30
a1636d0b-c280-4022-8b75-bda6e8a3d12c	\N	2021-07-29	2021-07-30
5a866d52-17ae-492d-96ae-f2b4ab384f40	\N	2021-07-29	2021-07-30
3ae272f0-319b-404f-894a-46d9e906e382	830ce0b8-9051-4179-8382-1990619b64f5	2021-07-30	2021-08-02
b080b473-415e-4c97-a483-117cee37f878	e64afc79-c567-431a-bdf3-065215dec7e6	2021-08-02	2021-08-04
8c873b8d-77af-4d58-a374-375a5dd8e47c	\N	2021-08-02	2021-08-04
ad2028f7-c665-4f30-a1f7-072bf3ea6cc5	72d7f846-dd99-4960-a6c0-c3b1adbca795	2021-08-03	2021-08-07
4c618743-afe2-4a85-8b18-1995080d7287	8075f451-75fc-45ac-af09-6fb5e8fd92b0	2021-07-30	2021-08-07
\.


--
-- TOC entry 3226 (class 0 OID 16809)
-- Dependencies: 217
-- Data for Name: decharge_materiel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.decharge_materiel (num_decharge, num_materiel, configuration_origine) FROM stdin;
8dd413b4-98bb-4471-a56c-84012636b819	48aa0db2-7290-4fda-959f-c77fe815b6ac	
d44b3f94-3948-4048-8ff8-7f5ad8c110fe	7ebec45d-2197-4d91-87a7-7998845016cd	
d44b3f94-3948-4048-8ff8-7f5ad8c110fe	1187acbb-861b-421b-9070-6f0b1b34e8ac	
ce4057ee-1113-4341-ae19-a5f8600ce2f2	7ebec45d-2197-4d91-87a7-7998845016cd	
ce4057ee-1113-4341-ae19-a5f8600ce2f2	1187acbb-861b-421b-9070-6f0b1b34e8ac	
ab6218b4-306b-4cab-876c-7865df8f891f	7ebec45d-2197-4d91-87a7-7998845016cd	
ab6218b4-306b-4cab-876c-7865df8f891f	1187acbb-861b-421b-9070-6f0b1b34e8ac	
c2762733-14f9-47c3-8d38-55e23cda2a7b	7ebec45d-2197-4d91-87a7-7998845016cd	
c2762733-14f9-47c3-8d38-55e23cda2a7b	1187acbb-861b-421b-9070-6f0b1b34e8ac	
5d9f9689-4a06-4ad7-a668-c08dc3bbae7c	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 10
713ee3cd-99ed-465f-9bbe-e550919bc026	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 10
ee1061da-202c-4d1c-90b9-6311bfdd1dd9	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 10
6d347aed-e3e8-4edd-9f2a-c80718e31575	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 8.1
55ef6333-d6a6-4a16-84b6-ac7b856a0307	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 8.1
2e4b37fe-c113-4f02-849d-8167303f27b6	1187acbb-861b-421b-9070-6f0b1b34e8ac	simba
cb2f558d-97d5-41e5-8a0b-e4a9ce338a3a	1187acbb-861b-421b-9070-6f0b1b34e8ac	
a1636d0b-c280-4022-8b75-bda6e8a3d12c	48aa0db2-7290-4fda-959f-c77fe815b6ac	
5a866d52-17ae-492d-96ae-f2b4ab384f40	48aa0db2-7290-4fda-959f-c77fe815b6ac	
4c618743-afe2-4a85-8b18-1995080d7287	48aa0db2-7290-4fda-959f-c77fe815b6ac	reinstaller win 8.1 , office 2007, antivirus
3ae272f0-319b-404f-894a-46d9e906e382	7ebec45d-2197-4d91-87a7-7998845016cd	win 8.1 , office 16
b080b473-415e-4c97-a483-117cee37f878	7648255d-5019-418d-b552-70cc258e9e09	win 10 , office 16 
8c873b8d-77af-4d58-a374-375a5dd8e47c	7648255d-5019-418d-b552-70cc258e9e09	win 10 , office 16 
ad2028f7-c665-4f30-a1f7-072bf3ea6cc5	7ebec45d-2197-4d91-87a7-7998845016cd	win 10
\.


--
-- TOC entry 3224 (class 0 OID 16761)
-- Dependencies: 215
-- Data for Name: intervention; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intervention (num_intervention, num_app_user_tech_main_creator, num_probleme_constate, num_materiel, num_lieu_intervention, num_intervention_type, num_intervention_pere, motif, log, date_programme, date_debut, date_fin, probleme_resolu, done) FROM stdin;
9c273e08-6860-4864-9f18-ce9751fca289	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-07-19 07:11:38.37+00	2021-07-21 12:06:38.454+00	2021-07-21 12:09:33.932+00	\N	t
15adcc98-67fd-4df0-a4b0-6ac9f3de1235	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-19 07:11:03.322+00	2021-07-21 12:11:15.134+00	2021-07-21 12:11:53.391+00	t	t
3ebcb2c6-2e17-4fad-a020-43305ed5aabe	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-21 12:25:47.165+00	2021-07-21 12:26:12.997+00	2021-07-21 12:26:16.002+00	f	t
ae64b19a-e376-4f85-beb2-c79a47957fea	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-21 12:38:30.604+00	2021-07-22 06:39:11.768+00	2021-07-22 06:49:11.768+00	t	t
1fc4e247-76ed-4797-af42-c5a404e7d9c7	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- dsi	\N	2021-07-27 08:39:43.641+00	2021-07-27 05:55:11.374+00	2021-07-27 06:05:11.374+00	t	t
de1cefeb-824b-47f5-a309-af828fb70942	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-07-20 14:10:42.438+00	2021-07-21 11:31:22.655+00	2021-07-21 11:41:09.603+00	f	t
8eb04673-caff-4d51-9cfa-1ab533a2c6cc	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-20 14:09:24.596+00	2021-07-21 11:32:32.584+00	2021-07-21 11:42:31.586+00	f	t
b2768370-3953-4b8d-af1e-8784ad9f6a23	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-21 12:26:46.916+00	2021-07-22 06:51:47.962+00	2021-07-22 06:51:55.888+00	t	t
3b4364fa-bc56-475f-b211-ae426f92af8f	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-20 13:36:55.34+00	2021-07-21 11:50:35.554+00	2021-07-21 11:50:37.071+00	f	t
d6924ae1-1b7b-4c4e-8698-5178eda55a68	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - pas urgent	\N	2021-07-20 13:34:38.238+00	2021-07-21 12:01:40.692+00	2021-07-21 12:01:43.91+00	f	t
c150d823-8c9b-4057-b01a-b35c0fb0e519	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny imprimante - dsi - tres urgent	\N	2021-07-19 11:03:31.245+00	2021-07-27 07:14:27.309+00	2021-07-27 07:24:27.309+00	t	t
5c0426c0-a7f4-4ea9-a365-4eb4970e752c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-22 06:56:43.44+00	2021-07-22 06:57:27.317+00	2021-07-22 06:57:50.579+00	t	t
6275863b-dfb1-488a-9ef4-9fc29369cf82	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - pas urgent	\N	2021-07-22 20:04:35.704+00	2021-07-22 19:55:20.707+00	2021-07-22 20:05:20.707+00	t	t
9b09672e-5bfb-4db8-b302-43e7648c1c23	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-24 15:23:18.932+00	2021-07-24 15:14:50.085+00	2021-07-24 15:24:50.085+00	t	t
a9368d45-3496-4731-8750-1c9149d61526	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:28:35.32+00	2021-07-27 07:22:36.354+00	2021-07-27 07:32:36.354+00	t	t
62ba5752-b2c6-4c22-827d-7ee272387ec3	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:50:51.104+00	2021-07-27 07:33:21.451+00	2021-07-27 07:43:21.451+00	t	t
1929429d-3418-4cdb-8020-19f81665fa2f	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:50:51.104+00	2021-07-27 07:44:28.695+00	2021-07-27 07:44:31.447+00	f	t
65a858b0-2872-469c-ab3b-5dd010af5c9b	68db45ca-29ad-483d-b8e5-52b629d24d80	749dc6df-118c-4a38-8a27-f351f8839763	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:36:08.129+00	2021-07-27 07:36:50.57+00	2021-07-27 07:46:50.57+00	f	t
8bf30c9e-4887-4940-a558-6d882f098f13	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-07-26 06:56:37.527+00	2021-07-27 07:41:26.247+00	2021-07-27 07:51:28.062+00	t	t
4eae7aac-1cc1-4242-b4cd-e2b44e017f77	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-27 07:43:44.391+00	2021-07-27 07:53:44.391+00	t	t
edff0ade-0a86-463c-9d4d-8d86cf6132af	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-27 11:34:00.352+00	\N	\N	f	f
c0a4c98c-8423-441f-b7d3-8f893d7aac01	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-29 19:55:59.69+00	2021-07-29 20:05:59.69+00	t	t
db0f8f68-b4f5-446d-a94b-f91af24ef836	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	7648255d-5019-418d-b552-70cc258e9e09	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-29 19:57:21.745+00	2021-07-29 20:07:21.745+00	t	t
5092d094-a47c-495c-8a29-0349a2d0375e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - tres urgent	\N	2021-07-27 08:19:21.046+00	2021-07-30 11:50:51.869+00	2021-07-30 12:00:51.869+00	t	t
830ce0b8-9051-4179-8382-1990619b64f5	68db45ca-29ad-483d-b8e5-52b629d24d80	546d1c0e-6eb2-4ac4-af23-a2cf57a99fd2	7648255d-5019-418d-b552-70cc258e9e09	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 222	installer antivirus; redemarrer	2021-07-26 07:08:16.691+00	2021-07-30 20:11:02.666+00	2021-07-30 20:21:02.666+00	t	t
2f95c7cb-0854-4d24-9e7e-7a7c622bfdff	68db45ca-29ad-483d-b8e5-52b629d24d80	dce64402-b2e4-4404-b695-6f113806693c	7648255d-5019-418d-b552-70cc258e9e09	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 222	\N	2021-07-26 07:08:16.691+00	2021-07-30 08:43:45.894+00	2021-07-30 08:43:50.309+00	t	t
edf11ca9-db87-460d-9f3b-3d44297a6789	68db45ca-29ad-483d-b8e5-52b629d24d80	b6beac0a-08e7-4720-923a-41cf2d4f4357	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	reinitialiser box	2021-07-26 07:08:16.691+00	2021-07-30 08:11:47.934+00	2021-07-30 08:21:47.934+00	t	t
bf4a10d2-d6fc-4684-8f04-e0cc3f8e3d02	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 12:01:20.935+00	2021-07-30 12:01:20.935+00	2021-07-30 12:01:42.472+00	t	t
e64afc79-c567-431a-bdf3-065215dec7e6	68db45ca-29ad-483d-b8e5-52b629d24d80	98d3b852-d65a-4ec3-abe8-6a746e4a77e8	7648255d-5019-418d-b552-70cc258e9e09	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- dsi	\N	2021-07-26 07:34:57.512+00	2021-07-30 20:13:28.125+00	2021-07-30 20:23:28.125+00	t	t
59285a67-246a-4249-b769-a624f8d1da2c	68db45ca-29ad-483d-b8e5-52b629d24d80	ed051871-6799-4926-ba1f-569ef914f007	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-07-26 07:36:08.129+00	2021-07-30 20:20:35.653+00	2021-07-30 20:30:35.653+00	t	t
72d7f846-dd99-4960-a6c0-c3b1adbca795	68db45ca-29ad-483d-b8e5-52b629d24d80	df880bcf-0b60-45f3-bc80-571f4732f13e	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:36:08.129+00	2021-07-30 21:05:57.472+00	2021-07-30 21:16:07.723+00	t	t
8075f451-75fc-45ac-af09-6fb5e8fd92b0	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 11:44:47.363+00	2021-07-30 20:07:44.004+00	2021-07-30 20:17:44.004+00	t	t
f22cbe5a-53a0-4b61-b7b6-4840e9793a56	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-07-30 20:33:04.717+00	2021-07-30 20:33:38.019+00	2021-07-30 20:36:20.672+00	t	t
9e1c2728-7472-44df-9a2f-830ae097fd2d	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 222 - moyennement urgent	\N	2021-07-30 20:42:02.429+00	2021-07-30 20:42:02.429+00	2021-07-30 20:43:13.245+00	t	t
6e4d5814-65bc-46bf-ad8e-93e82762abdb	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-27 08:14:46.015+00	2021-07-30 20:42:10.731+00	2021-07-30 20:52:10.731+00	t	t
978cd4db-24fe-4228-9655-35707168ffe0	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-27 08:20:56.42+00	2021-07-30 20:43:55.43+00	2021-07-30 20:53:55.43+00	t	t
5b7719bb-c8b0-43a2-ae73-f8772e2add17	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - moyennement urgent	\N	2021-07-27 09:27:38.671+00	2021-07-30 20:56:51.487+00	2021-07-30 21:06:51.487+00	t	t
1ed1dab9-2a54-4599-84a6-7c3eeff38a9c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 222 - pas urgent	\N	2021-07-30 20:47:57.914+00	2021-07-30 20:47:57.914+00	2021-07-30 20:49:49.271+00	t	t
c998c1a7-da90-4173-81a1-f8c4c0db2811	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:07:18.307+00	2021-07-30 21:07:18.307+00	2021-07-30 21:07:34.178+00	t	t
ff398c4f-72c4-431a-8f21-a1ceaa4afc8d	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:07:51.512+00	2021-07-30 21:07:51.512+00	2021-07-30 21:08:06.793+00	t	t
6262f72c-7084-4e1c-afa5-e8c5cad50ac5	68db45ca-29ad-483d-b8e5-52b629d24d80	19ab927b-04cf-45ef-a762-defd3b87613f	7ebec45d-2197-4d91-87a7-7998845016cd	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	Resoudre probleme : plantage ordinateur -- 111	reinstallation	2021-07-26 07:36:08.129+00	2021-07-30 21:05:08.646+00	2021-07-30 21:15:37.598+00	t	t
26193970-e7c0-4119-971e-650c30d23f15	68db45ca-29ad-483d-b8e5-52b629d24d80	61c2bb22-0d0f-4c72-b873-6d35e809d988	1187acbb-861b-421b-9070-6f0b1b34e8ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	debranche cable;eteindre switch	2021-07-27 08:21:15.228+00	2021-07-30 21:07:31.335+00	2021-07-30 21:17:31.335+00	t	t
13057b2e-7d71-4b34-bfa7-53b7baa49603	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:19:43.093+00	2021-07-30 21:19:43.093+00	2021-07-30 21:20:19.303+00	t	t
62006feb-4c7b-4587-871c-83c347fb251b	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-30 20:59:05.19+00	2021-07-30 21:11:57.856+00	2021-07-30 21:21:57.856+00	f	t
154aaf87-9619-4d3d-ba7b-570c9513d3b8	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-03 12:41:57.381+00	2021-08-03 12:41:57.381+00	2021-08-03 12:42:49.374+00	t	t
0a1aa34a-1971-4718-bc95-87eca78bf0c3	68db45ca-29ad-483d-b8e5-52b629d24d80	caaa5cb2-bf3b-4ee9-9480-8e0d6f743300	7648255d-5019-418d-b552-70cc258e9e09	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-08-10 05:00:00+00	\N	\N	f	f
7fe48b7d-b125-4aaa-a521-de98b6fa2d8e	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-08-04 11:00:00+00	\N	\N	f	f
bf6529d7-2c88-4e96-b272-f4eaf7e4ace8	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:11.765+00	\N	\N	f	f
3d0ebb5e-a617-4e68-a49e-d953e10ce1af	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	\N	\N	f	f
e70a7b63-bf6a-4c40-93f4-c07ce52b9363	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	\N	\N	f	f
9c29c97f-7498-41ac-981b-928f3063854d	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	\N	\N	f	f
f8d1d361-bbe5-401b-9b60-965415950563	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:53.819+00	\N	\N	f	f
d657a107-5f43-4ba6-ad1d-01e6fda0cd3a	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-04 08:53:09.644+00	2021-08-04 08:53:09.644+00	2021-08-04 08:53:29.811+00	t	t
\.


--
-- TOC entry 3221 (class 0 OID 16732)
-- Dependencies: 212
-- Data for Name: intervention_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intervention_type (num_intervention_type, libelle_intervention_type, code_intervention_type) FROM stdin;
aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	reponse a une notification	REP_NOTIF
cf6266a8-22f0-43ee-89e0-8e9f38f22dde	installation	INST
\.


--
-- TOC entry 3217 (class 0 OID 16489)
-- Dependencies: 204
-- Data for Name: lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lieu (num_lieu, libelle) FROM stdin;
6b3b2f07-253a-4066-b5ca-96d93a149149	111
4d1287b6-5268-4cf7-a2f8-1deab7c474fc	222
62255b2b-1028-4817-848b-2be1c74bd2fb	dsi
\.


--
-- TOC entry 3223 (class 0 OID 16748)
-- Dependencies: 214
-- Data for Name: materiel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materiel (num_materiel, num_materiel_type, libelle_materiel) FROM stdin;
48aa0db2-7290-4fda-959f-c77fe815b6ac	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_1
7ebec45d-2197-4d91-87a7-7998845016cd	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_2
7648255d-5019-418d-b552-70cc258e9e09	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_3
1187acbb-861b-421b-9070-6f0b1b34e8ac	1c70ea9d-84ec-4929-9ca3-68aff3bd6027	switch1
\.


--
-- TOC entry 3222 (class 0 OID 16740)
-- Dependencies: 213
-- Data for Name: materiel_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materiel_type (num_materiel_type, libelle_materiel_type) FROM stdin;
d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordinateur
1c70ea9d-84ec-4929-9ca3-68aff3bd6027	switch
\.


--
-- TOC entry 3220 (class 0 OID 16541)
-- Dependencies: 207
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (num_notification, num_app_user_user, num_app_user_tech_main, num_probleme, date_envoie, date_reponse, num_intervention) FROM stdin;
e8382bf7-2fe2-4200-a33c-5d3d5a213056	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	740cdbf2-30c3-460d-8c41-4497bdca662e	2021-07-24 15:21:22.726088+00	2021-07-24 15:21:33.135+00	\N
7f4fbb08-e1ae-4bb2-88ae-04e8e0562f82	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	60642731-062d-4266-bd7f-d734062b6648	2021-07-24 15:23:12.4024+00	2021-07-24 15:23:18.932+00	9b09672e-5bfb-4db8-b302-43e7648c1c23
981c2575-133d-44d9-a003-fda6f11747e3	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5aab9e73-24f7-4990-a54b-d2f80fe58201	2021-08-03 12:41:30.842451+00	2021-08-03 12:41:57.381+00	154aaf87-9619-4d3d-ba7b-570c9513d3b8
691dfcf4-5005-4fb3-ac17-b3b48cfa686c	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	95dbd458-50c8-4e1c-bc34-7867b59ec6e3	2021-07-27 08:14:40.136891+00	2021-07-27 08:14:46.015+00	6e4d5814-65bc-46bf-ad8e-93e82762abdb
ba6981c3-2639-4d7c-a96a-9bcf27e5ce99	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4560ecdd-e943-4c14-9cce-0a0ce1be4a23	2021-07-27 08:18:52.719973+00	2021-07-27 08:19:21.046+00	5092d094-a47c-495c-8a29-0349a2d0375e
ceaab84c-70d0-43a1-ad90-8f8e6d75966b	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d20233e8-5c61-4183-8963-f050769f5ee0	2021-07-27 08:20:33.221724+00	2021-07-27 08:20:56.42+00	978cd4db-24fe-4228-9655-35707168ffe0
84420367-43cb-45ef-8a50-9c189d6143a5	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	ca349872-3feb-4007-90ef-7da9eec8dbd6	2021-08-04 08:53:02.556101+00	2021-08-04 08:53:09.644+00	d657a107-5f43-4ba6-ad1d-01e6fda0cd3a
2354a63b-016d-4c70-b3af-c18489e6eca4	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	09470faf-ba10-4a5d-9424-e29f49e8008b	2021-07-27 08:21:10.830082+00	2021-07-27 08:21:15.228+00	26193970-e7c0-4119-971e-650c30d23f15
e1871e7d-7241-42ae-82b2-383f964126e9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5bab551b-4e18-4f39-bc9b-3ffa04aa7873	2021-07-27 09:27:29.102439+00	2021-07-27 09:27:38.671+00	5b7719bb-c8b0-43a2-ae73-f8772e2add17
9bb6ba6a-e189-4c5f-a86e-88b72971f472	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	ec9c36d3-5b88-4442-95c3-2d0a948a9a4e	2021-07-27 11:33:36.527562+00	2021-07-27 11:34:00.352+00	edff0ade-0a86-463c-9d4d-8d86cf6132af
56542f2c-95d9-4439-ab8f-e71239691b20	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	48ad9835-dc29-4110-b7a6-5df84aa0cff2	2021-07-19 07:10:56.445266+00	2021-07-19 07:11:03.322+00	15adcc98-67fd-4df0-a4b0-6ac9f3de1235
5f3a797b-f710-478c-9f0a-b7a3653be186	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	f251dd8a-c623-445d-aaed-c74e09e7c648	2021-07-19 07:11:32.921432+00	2021-07-19 07:11:38.37+00	9c273e08-6860-4864-9f18-ce9751fca289
baf20cf3-8ca0-40fe-8ddd-d07f7cf0685e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	1ba0306a-c193-49a2-99e2-efc4f96a76e7	2021-07-30 11:44:42.431787+00	2021-07-30 11:44:47.363+00	8075f451-75fc-45ac-af09-6fb5e8fd92b0
c83aed53-9f28-403a-a4cf-0c25a550254c	83a31293-3fbc-4e32-8814-0421fae2b491	68db45ca-29ad-483d-b8e5-52b629d24d80	ba636bf0-4dc6-4946-970a-12305c922371	2021-07-19 11:03:22.393568+00	2021-07-19 11:03:31.245+00	c150d823-8c9b-4057-b01a-b35c0fb0e519
b06d0d48-316c-4b9d-9b49-09ee5a10a4d0	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4813e663-31cc-4af1-b2b8-c42ff8152aa8	2021-07-19 07:14:25.498573+00	2021-07-20 13:34:38.238+00	d6924ae1-1b7b-4c4e-8698-5178eda55a68
a19ec665-3014-4f29-acc9-56f168d74f77	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	6ddab0e1-056e-44fd-ad28-45b7e6e79827	2021-07-20 13:36:47.364173+00	2021-07-20 13:36:55.34+00	3b4364fa-bc56-475f-b211-ae426f92af8f
024455c0-3f21-4621-a699-54dc0a9c67da	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5a285ce6-0346-45ec-a0e5-b721481b47a1	2021-07-30 12:01:14.560563+00	2021-07-30 12:01:20.935+00	bf4a10d2-d6fc-4684-8f04-e0cc3f8e3d02
e9217fe1-c89b-4320-adac-a3b16ed0f18e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	dc11ac71-33ad-4e5f-ab25-b21eff4776b6	2021-07-20 13:37:52.888803+00	2021-07-20 14:09:24.596+00	8eb04673-caff-4d51-9cfa-1ab533a2c6cc
b9b46d2e-ad54-49f5-b9fe-d8669311bbe6	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	e1d27a4a-4fca-4454-b53c-33e3f5fec0a9	2021-07-30 20:32:57.456485+00	2021-07-30 20:33:04.717+00	f22cbe5a-53a0-4b61-b7b6-4840e9793a56
e385ea0b-ebe2-43c9-a94d-3185981b2ef0	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	75707518-c0b0-4fbb-ac0b-0334acb15ccc	2021-07-30 20:36:37.469414+00	2021-07-30 20:42:02.429+00	9e1c2728-7472-44df-9a2f-830ae097fd2d
bf65e21a-fa4c-4679-8eab-d6b7fa2beb9a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	320f60a1-fef2-447e-b073-2a91cc56eecb	2021-07-20 14:10:29.222967+00	2021-07-20 14:10:42.438+00	de1cefeb-824b-47f5-a309-af828fb70942
eac9e666-7c32-409e-badb-0b933a74b2f9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	a7963ecb-76bd-4541-b53d-1b3d9cd76812	2021-07-21 12:25:40.575682+00	2021-07-21 12:25:47.165+00	3ebcb2c6-2e17-4fad-a020-43305ed5aabe
91d56377-b383-4c2e-8d48-2c9b9a7dac75	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	652d9a0b-02e3-479e-b698-b01f06c0d7de	2021-07-30 20:47:27.27906+00	2021-07-30 20:47:57.914+00	1ed1dab9-2a54-4599-84a6-7c3eeff38a9c
347ea506-60ab-471f-beb7-d16022e77273	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	f398e4d7-ccfe-4902-8c60-ac0dd8ececcd	2021-07-21 12:26:39.542968+00	2021-07-21 12:26:46.916+00	b2768370-3953-4b8d-af1e-8784ad9f6a23
2baa0163-3feb-4471-827c-35c46d87f38a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	fed430f6-d539-4445-a57b-0a6d2b5e94c3	2021-07-21 12:38:21.832867+00	2021-07-21 12:38:30.604+00	ae64b19a-e376-4f85-beb2-c79a47957fea
0e0687df-fdf9-4007-806f-4d9f9b2ef48f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d0a415d2-b926-42c4-82fb-f7e0e4681219	2021-07-27 12:25:15.4017+00	2021-07-30 20:59:05.19+00	62006feb-4c7b-4587-871c-83c347fb251b
fcfe22eb-c9b4-459f-acf3-f951eb0de6ba	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4ed8d919-5af9-477f-ba05-caaa7964ecb8	2021-07-22 06:56:11.253584+00	2021-07-22 06:56:43.44+00	5c0426c0-a7f4-4ea9-a365-4eb4970e752c
5a7c172b-fa2e-4fbd-bb93-8eb2581ea184	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d283246d-b147-46f8-bc72-91f62c693e32	2021-07-22 20:04:27.576236+00	2021-07-22 20:04:35.704+00	6275863b-dfb1-488a-9ef4-9fc29369cf82
f751eeff-e763-4f0f-8369-5eaab4f86d0a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	92c4b044-1cc3-4aff-998a-14976e1c0cd0	2021-07-30 21:07:13.448525+00	2021-07-30 21:07:18.307+00	c998c1a7-da90-4173-81a1-f8c4c0db2811
2042dadc-2ec0-4705-852b-35f4ebcbab40	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	993038b9-ccdb-48dd-91fd-98145262df4b	2021-07-30 21:07:46.963454+00	2021-07-30 21:07:51.512+00	ff398c4f-72c4-431a-8f21-a1ceaa4afc8d
5d62e92c-da85-4611-be88-4fb737a1f7bb	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d30c010b-4c08-42dd-835b-d023aa372fa1	2021-07-30 21:19:34.653834+00	2021-07-30 21:19:43.093+00	13057b2e-7d71-4b34-bfa7-53b7baa49603
\.


--
-- TOC entry 3219 (class 0 OID 16518)
-- Dependencies: 206
-- Data for Name: probleme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme (num_probleme, num_probleme_type, num_lieu, num_probleme_statut, remarque) FROM stdin;
48ad9835-dc29-4110-b7a6-5df84aa0cff2	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f251dd8a-c623-445d-aaed-c74e09e7c648	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
4813e663-31cc-4af1-b2b8-c42ff8152aa8	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	fb
ba636bf0-4dc6-4946-970a-12305c922371	d8bf125f-5509-469f-8db3-f730fe588d98	62255b2b-1028-4817-848b-2be1c74bd2fb	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
6ddab0e1-056e-44fd-ad28-45b7e6e79827	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
dc11ac71-33ad-4e5f-ab25-b21eff4776b6	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	verifie bug
320f60a1-fef2-447e-b073-2a91cc56eecb	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
a7963ecb-76bd-4541-b53d-1b3d9cd76812	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	wifi
f398e4d7-ccfe-4902-8c60-ac0dd8ececcd	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
fed430f6-d539-4445-a57b-0a6d2b5e94c3	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
4ed8d919-5af9-477f-ba05-caaa7964ecb8	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
d283246d-b147-46f8-bc72-91f62c693e32	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	scan
740cdbf2-30c3-460d-8c41-4497bdca662e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
60642731-062d-4266-bd7f-d734062b6648	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
95dbd458-50c8-4e1c-bc34-7867b59ec6e3	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
4560ecdd-e943-4c14-9cce-0a0ce1be4a23	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	fb
d20233e8-5c61-4183-8963-f050769f5ee0	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
09470faf-ba10-4a5d-9424-e29f49e8008b	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5bab551b-4e18-4f39-bc9b-3ffa04aa7873	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	fb
ec9c36d3-5b88-4442-95c3-2d0a948a9a4e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
d0a415d2-b926-42c4-82fb-f7e0e4681219	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
1ba0306a-c193-49a2-99e2-efc4f96a76e7	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5a285ce6-0346-45ec-a0e5-b721481b47a1	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
e1d27a4a-4fca-4454-b53c-33e3f5fec0a9	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
75707518-c0b0-4fbb-ac0b-0334acb15ccc	d8bf125f-5509-469f-8db3-f730fe588d98	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
652d9a0b-02e3-479e-b698-b01f06c0d7de	c34a3289-ce18-4c94-bf6e-1c213a1b191a	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	92ac2859-b516-4f09-8ac1-ac4709a807de	telechargement
92c4b044-1cc3-4aff-998a-14976e1c0cd0	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
993038b9-ccdb-48dd-91fd-98145262df4b	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
d30c010b-4c08-42dd-835b-d023aa372fa1	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5aab9e73-24f7-4990-a54b-d2f80fe58201	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
ca349872-3feb-4007-90ef-7da9eec8dbd6	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
\.


--
-- TOC entry 3216 (class 0 OID 16481)
-- Dependencies: 203
-- Data for Name: probleme_statut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_statut (num_probleme_statut, libelle, code) FROM stdin;
0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	tres urgent	MAX
8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	moyennement urgent	MID
92ac2859-b516-4f09-8ac1-ac4709a807de	pas urgent	MIN
\.


--
-- TOC entry 3228 (class 0 OID 16905)
-- Dependencies: 223
-- Data for Name: probleme_tech; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_tech (num_probleme_tech, num_lieu_probleme_tech, remarque, num_probleme_tech_type) FROM stdin;
b4e6bd20-f1d1-423c-a0c3-baa9124b228c	\N	\N	adca18fe-cad7-47ad-8317-c301f45e0498
7dfc4289-8089-4a2c-9846-3ff0754cc4bb	\N	\N	adca18fe-cad7-47ad-8317-c301f45e0498
749dc6df-118c-4a38-8a27-f351f8839763	\N	\N	adca18fe-cad7-47ad-8317-c301f45e0498
ed051871-6799-4926-ba1f-569ef914f007	\N	\N	adca18fe-cad7-47ad-8317-c301f45e0498
84ce2e21-12e4-471b-ba14-142ffae70624	\N	\N	adca18fe-cad7-47ad-8317-c301f45e0498
546d1c0e-6eb2-4ac4-af23-a2cf57a99fd2	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	virus	adca18fe-cad7-47ad-8317-c301f45e0498
74948fa3-79d1-4bf1-b2dd-4e58900155d4	62255b2b-1028-4817-848b-2be1c74bd2fb	surcharge reseau	3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
aae8c02d-d416-4667-a1ad-1ff41401eff2	62255b2b-1028-4817-848b-2be1c74bd2fb	surcharge reseau	3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
6329ce6c-ea97-46c2-8a90-98c9faeebdd8	62255b2b-1028-4817-848b-2be1c74bd2fb		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
25504f5c-eb79-4cce-88b0-463384c68133	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
df35cfbd-37ff-4054-8316-ac32f2b61894	62255b2b-1028-4817-848b-2be1c74bd2fb		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
0664f073-3a8a-4ea7-bc6c-6b568db0f8dc	62255b2b-1028-4817-848b-2be1c74bd2fb		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
b6beac0a-08e7-4720-923a-41cf2d4f4357	62255b2b-1028-4817-848b-2be1c74bd2fb		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
dce64402-b2e4-4404-b695-6f113806693c	4d1287b6-5268-4cf7-a2f8-1deab7c474fc		adca18fe-cad7-47ad-8317-c301f45e0498
476fa01b-20da-403e-965b-f07a073f7e85	4d1287b6-5268-4cf7-a2f8-1deab7c474fc		adca18fe-cad7-47ad-8317-c301f45e0498
98d3b852-d65a-4ec3-abe8-6a746e4a77e8	4d1287b6-5268-4cf7-a2f8-1deab7c474fc		adca18fe-cad7-47ad-8317-c301f45e0498
f001316b-0fac-4a8b-90a1-2be06b49658d	62255b2b-1028-4817-848b-2be1c74bd2fb		adca18fe-cad7-47ad-8317-c301f45e0498
df880bcf-0b60-45f3-bc80-571f4732f13e	62255b2b-1028-4817-848b-2be1c74bd2fb		adca18fe-cad7-47ad-8317-c301f45e0498
19ab927b-04cf-45ef-a762-defd3b87613f	4d1287b6-5268-4cf7-a2f8-1deab7c474fc		adca18fe-cad7-47ad-8317-c301f45e0498
61c2bb22-0d0f-4c72-b873-6d35e809d988	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
caaa5cb2-bf3b-4ee9-9480-8e0d6f743300	6b3b2f07-253a-4066-b5ca-96d93a149149	\N	adca18fe-cad7-47ad-8317-c301f45e0498
c76acbcd-0e40-42c4-aeb1-e046aebae494	6b3b2f07-253a-4066-b5ca-96d93a149149	\N	adca18fe-cad7-47ad-8317-c301f45e0498
\.


--
-- TOC entry 3227 (class 0 OID 16890)
-- Dependencies: 222
-- Data for Name: probleme_tech_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_tech_type (num_probleme_tech_type, libelle_probleme_tech_type) FROM stdin;
3b426db1-7b60-4ba8-acf0-2eeafe63e3dc	probleme adresse IP
adca18fe-cad7-47ad-8317-c301f45e0498	plantage ordinateur
\.


--
-- TOC entry 3215 (class 0 OID 16471)
-- Dependencies: 202
-- Data for Name: probleme_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_type (num_probleme_type, libelle, code) FROM stdin;
93c67b22-5392-486e-8991-1d2d5cff0691	tsy mandeha ny connexion	no conn
d8bf125f-5509-469f-8db3-f730fe588d98	tsy mandeha ny imprimante	PRINT_PB
c34a3289-ce18-4c94-bf6e-1c213a1b191a	autre	OTH
\.


--
-- TOC entry 3218 (class 0 OID 16505)
-- Dependencies: 205
-- Data for Name: type_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_user (num_type_user, code, libelle) FROM stdin;
818dcd07-a26a-495a-8ab7-50daea67ac9c	USER	utilisateur
e0e8ccad-edee-48c9-bd24-076a685157bc	TECH_MAIN	technicien de maintenance
4e3cf446-f780-406b-91e8-7528ce4ce33e	DASH	dashboard
\.


--
-- TOC entry 3037 (class 2606 OID 16816)
-- Name: decharge_materiel PK_decharge_materiel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge_materiel
    ADD CONSTRAINT "PK_decharge_materiel" PRIMARY KEY (num_decharge, num_materiel);


--
-- TOC entry 3025 (class 2606 OID 16545)
-- Name: notification PK_notificaction; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "PK_notificaction" PRIMARY KEY (num_notification);


--
-- TOC entry 3023 (class 2606 OID 16525)
-- Name: probleme PK_probleme; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "PK_probleme" PRIMARY KEY (num_probleme);


--
-- TOC entry 3021 (class 2606 OID 16512)
-- Name: type_user PK_type_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_user
    ADD CONSTRAINT "PK_type_user" PRIMARY KEY (num_type_user);


--
-- TOC entry 3013 (class 2606 OID 16402)
-- Name: app_user PK_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "PK_user" PRIMARY KEY (num_user);


--
-- TOC entry 3035 (class 2606 OID 16803)
-- Name: decharge decharge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT decharge_pkey PRIMARY KEY (num_decharge);


--
-- TOC entry 3033 (class 2606 OID 16768)
-- Name: intervention intervention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT intervention_pkey PRIMARY KEY (num_intervention);


--
-- TOC entry 3027 (class 2606 OID 16739)
-- Name: intervention_type intervention_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention_type
    ADD CONSTRAINT intervention_type_pkey PRIMARY KEY (num_intervention_type);


--
-- TOC entry 3019 (class 2606 OID 16496)
-- Name: lieu lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pkey PRIMARY KEY (num_lieu);


--
-- TOC entry 3031 (class 2606 OID 16755)
-- Name: materiel materiel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_pkey PRIMARY KEY (num_materiel);


--
-- TOC entry 3029 (class 2606 OID 16747)
-- Name: materiel_type materiel_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel_type
    ADD CONSTRAINT materiel_type_pkey PRIMARY KEY (num_materiel_type);


--
-- TOC entry 3017 (class 2606 OID 16488)
-- Name: probleme_statut probleme_statut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_statut
    ADD CONSTRAINT probleme_statut_pkey PRIMARY KEY (num_probleme_statut);


--
-- TOC entry 3039 (class 2606 OID 16897)
-- Name: probleme_tech_type probleme_tech_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech_type
    ADD CONSTRAINT probleme_tech_pkey PRIMARY KEY (num_probleme_tech_type);


--
-- TOC entry 3041 (class 2606 OID 16912)
-- Name: probleme_tech probleme_tech_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT probleme_tech_pkey1 PRIMARY KEY (num_probleme_tech);


--
-- TOC entry 3015 (class 2606 OID 16478)
-- Name: probleme_type probleme_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_type
    ADD CONSTRAINT probleme_type_pkey PRIMARY KEY (num_probleme_type);


--
-- TOC entry 3071 (class 2620 OID 16836)
-- Name: decharge before_insert_decharge; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_decharge BEFORE INSERT ON public.decharge FOR EACH ROW EXECUTE FUNCTION public.before_insert_decharge();


--
-- TOC entry 3069 (class 2620 OID 16826)
-- Name: intervention before_insert_intervention; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_intervention BEFORE INSERT ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention();


--
-- TOC entry 3066 (class 2620 OID 16828)
-- Name: intervention_type before_insert_intervention_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_intervention_type BEFORE INSERT ON public.intervention_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention_type();


--
-- TOC entry 3063 (class 2620 OID 16501)
-- Name: lieu before_insert_lieu; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_lieu BEFORE INSERT ON public.lieu FOR EACH ROW EXECUTE FUNCTION public.before_insert_lieu();


--
-- TOC entry 3068 (class 2620 OID 16830)
-- Name: materiel before_insert_materiel; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_materiel BEFORE INSERT ON public.materiel FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel();


--
-- TOC entry 3067 (class 2620 OID 16834)
-- Name: materiel_type before_insert_materiel_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_materiel_type BEFORE INSERT ON public.materiel_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel_type();


--
-- TOC entry 3065 (class 2620 OID 16567)
-- Name: notification before_insert_notification; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_notification BEFORE INSERT ON public.notification FOR EACH ROW EXECUTE FUNCTION public.before_insert_notification();


--
-- TOC entry 3064 (class 2620 OID 16565)
-- Name: probleme before_insert_probleme; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme BEFORE INSERT ON public.probleme FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme();


--
-- TOC entry 3062 (class 2620 OID 16499)
-- Name: probleme_statut before_insert_probleme_statut; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_statut BEFORE INSERT ON public.probleme_statut FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_statut();


--
-- TOC entry 3073 (class 2620 OID 16925)
-- Name: probleme_tech before_insert_probleme_tech; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_tech BEFORE INSERT ON public.probleme_tech FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech();


--
-- TOC entry 3072 (class 2620 OID 16927)
-- Name: probleme_tech_type before_insert_probleme_tech_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_tech_type BEFORE INSERT ON public.probleme_tech_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech_type();


--
-- TOC entry 3060 (class 2620 OID 16444)
-- Name: app_user before_insert_user; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_user BEFORE INSERT ON public.app_user FOR EACH ROW EXECUTE FUNCTION public.before_insert_user();


--
-- TOC entry 3070 (class 2620 OID 16953)
-- Name: intervention before_update_intervention; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_update_intervention BEFORE UPDATE ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_update_intervention();


--
-- TOC entry 3061 (class 2620 OID 16480)
-- Name: probleme_type ini_new_probleme_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ini_new_probleme_type BEFORE INSERT ON public.probleme_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_type();


--
-- TOC entry 3042 (class 2606 OID 16513)
-- Name: app_user FK_app_user_type_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "FK_app_user_type_user" FOREIGN KEY (num_type_user) REFERENCES public.type_user(num_type_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3057 (class 2606 OID 16804)
-- Name: decharge FK_decharge_intervention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT "FK_decharge_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention);


--
-- TOC entry 3051 (class 2606 OID 16769)
-- Name: intervention FK_intervention_app_user_tech_main_creator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_app_user_tech_main_creator" FOREIGN KEY (num_app_user_tech_main_creator) REFERENCES public.app_user(num_user);


--
-- TOC entry 3055 (class 2606 OID 16794)
-- Name: intervention FK_intervention_intervention_pere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_pere" FOREIGN KEY (num_intervention_pere) REFERENCES public.intervention(num_intervention) NOT VALID;


--
-- TOC entry 3054 (class 2606 OID 16789)
-- Name: intervention FK_intervention_intervention_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_type" FOREIGN KEY (num_intervention_type) REFERENCES public.intervention_type(num_intervention_type);


--
-- TOC entry 3053 (class 2606 OID 16784)
-- Name: intervention FK_intervention_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_lieu" FOREIGN KEY (num_lieu_intervention) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3052 (class 2606 OID 16779)
-- Name: intervention FK_intervention_materiel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_materiel" FOREIGN KEY (num_materiel) REFERENCES public.materiel(num_materiel);


--
-- TOC entry 3056 (class 2606 OID 16918)
-- Name: intervention FK_intervention_probleme_tech; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_probleme_tech" FOREIGN KEY (num_probleme_constate) REFERENCES public.probleme_tech(num_probleme_tech) NOT VALID;


--
-- TOC entry 3050 (class 2606 OID 16756)
-- Name: materiel FK_materiel_material_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT "FK_materiel_material_type" FOREIGN KEY (num_materiel_type) REFERENCES public.materiel_type(num_materiel_type) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3047 (class 2606 OID 16551)
-- Name: notification FK_notification_app_user_tech_main; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_tech_main" FOREIGN KEY (num_app_user_tech_main) REFERENCES public.app_user(num_user);


--
-- TOC entry 3046 (class 2606 OID 16546)
-- Name: notification FK_notification_app_user_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_user" FOREIGN KEY (num_app_user_user) REFERENCES public.app_user(num_user);


--
-- TOC entry 3049 (class 2606 OID 16838)
-- Name: notification FK_notification_intervention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention) ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3048 (class 2606 OID 16556)
-- Name: notification FK_notification_probleme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_probleme" FOREIGN KEY (num_probleme) REFERENCES public.probleme(num_probleme);


--
-- TOC entry 3043 (class 2606 OID 16526)
-- Name: probleme FK_probleme_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_lieu" FOREIGN KEY (num_lieu) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3044 (class 2606 OID 16568)
-- Name: probleme FK_probleme_probleme_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_probleme_type" FOREIGN KEY (num_probleme_type) REFERENCES public.probleme_type(num_probleme_type);


--
-- TOC entry 3058 (class 2606 OID 16913)
-- Name: probleme_tech FK_probleme_tech_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_lieu" FOREIGN KEY (num_lieu_probleme_tech) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3059 (class 2606 OID 16928)
-- Name: probleme_tech FK_probleme_tech_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_type" FOREIGN KEY (num_probleme_tech_type) REFERENCES public.probleme_tech_type(num_probleme_tech_type) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3045 (class 2606 OID 16573)
-- Name: probleme FK_problemr_probleme_statut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_problemr_probleme_statut" FOREIGN KEY (num_probleme_statut) REFERENCES public.probleme_statut(num_probleme_statut);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO acim;


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE app_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.app_user TO acim;


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE decharge; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.decharge TO acim;


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE decharge_materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.decharge_materiel TO acim;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE intervention; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.intervention TO acim;


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE intervention_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.intervention_type TO acim;


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE lieu; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lieu TO acim;


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.materiel TO acim;


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE materiel_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.materiel_type TO acim;


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE notification; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notification TO acim;


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE probleme; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme TO acim;


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE probleme_statut; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_statut TO acim;


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE probleme_tech; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_tech TO acim;


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE probleme_tech_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_tech_type TO acim;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE probleme_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_type TO acim;


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE type_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.type_user TO acim;


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE view_app_user_tech_main; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_app_user_tech_main TO acim;


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE view_app_user_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_app_user_user TO acim;


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE view_intervention_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_full TO acim;


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE view_intervention_undone; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_undone TO acim;


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE view_materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_materiel TO acim;


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE view_notification_by_tech_main; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_tech_main TO acim;


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE view_notification_by_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_user TO acim;


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE view_notification_by_user_intervention; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_user_intervention TO acim;


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE view_notification_tech_main_probleme_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_tech_main_probleme_full TO acim;


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE view_notification_user_probleme_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_user_probleme_full TO acim;


-- Completed on 2021-08-09 10:05:57

--
-- PostgreSQL database dump complete
--

