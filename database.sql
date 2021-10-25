--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-10-25 12:28:23

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
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 296 (class 1255 OID 16835)
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
-- TOC entry 277 (class 1255 OID 16825)
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
-- TOC entry 294 (class 1255 OID 16827)
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
-- TOC entry 279 (class 1255 OID 16498)
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
-- TOC entry 300 (class 1255 OID 16829)
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
-- TOC entry 295 (class 1255 OID 16833)
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
-- TOC entry 299 (class 1255 OID 16985)
-- Name: before_insert_message(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_insert_message() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

	NEW.date_envoie = NOW();
	
	return NEW;
end;
$$;


ALTER FUNCTION public.before_insert_message() OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 16566)
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
-- TOC entry 274 (class 1255 OID 16561)
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
-- TOC entry 278 (class 1255 OID 16497)
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
-- TOC entry 276 (class 1255 OID 16903)
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
-- TOC entry 301 (class 1255 OID 16923)
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
-- TOC entry 273 (class 1255 OID 16479)
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
-- TOC entry 275 (class 1255 OID 16443)
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
-- TOC entry 302 (class 1255 OID 16952)
-- Name: before_update_intervention(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.before_update_intervention() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	return new;
end;
$$;


ALTER FUNCTION public.before_update_intervention() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 16980)
-- Name: app_user_recepteur_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_recepteur_message (
    num_app_user_recepteur uuid NOT NULL,
    num_message uuid NOT NULL,
    date_reception timestamp with time zone
);


ALTER TABLE public.app_user_recepteur_message OWNER TO postgres;

--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE app_user_recepteur_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.app_user_recepteur_message IS 'correspondance entre message et destinataire du message';


--
-- TOC entry 306 (class 1255 OID 25228)
-- Name: broadcast_message(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.broadcast_message(p_num_message uuid) RETURNS TABLE("like" public.app_user_recepteur_message)
    LANGUAGE plpgsql
    AS $$
declare 
	num_app_user uuid;
begin
	raise notice 'working';
	for num_app_user in select num_user from app_user loop
		raise notice '%', num_app_user;
		return query insert into app_user_recepteur_message (num_app_user_recepteur , num_message) VALUES( num_app_user,p_num_message ) returning *;
	end loop;
end;
$$;


ALTER FUNCTION public.broadcast_message(p_num_message uuid) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 25229)
-- Name: broadcast_message(uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.broadcast_message(num_app_user_envoyeur uuid, p_num_message uuid) RETURNS TABLE("like" public.app_user_recepteur_message)
    LANGUAGE plpgsql
    AS $$
declare 
	num_app_user uuid;
begin
	raise notice 'working';
	for num_app_user in select num_user from app_user loop
		raise notice '%', num_app_user;
		if ( num_app_user != num_app_user_envoyeur) then
			return query insert into app_user_recepteur_message (num_app_user_recepteur , num_message) VALUES( num_app_user,p_num_message ) returning *;
		end if;
	end loop;
end;
$$;


ALTER FUNCTION public.broadcast_message(num_app_user_envoyeur uuid, p_num_message uuid) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 16502)
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
-- TOC entry 297 (class 1255 OID 16837)
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
-- TOC entry 293 (class 1255 OID 16504)
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
-- TOC entry 292 (class 1255 OID 16503)
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
-- TOC entry 3313 (class 0 OID 0)
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
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE decharge; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.decharge IS 'decharge de materiel ... materiel va au bureau dsist';


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
    done boolean NOT NULL,
    commentaire text
);


ALTER TABLE public.intervention OWNER TO postgres;

--
-- TOC entry 3317 (class 0 OID 0)
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
-- TOC entry 3319 (class 0 OID 0)
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
    libelle_materiel text NOT NULL,
    num_lieu uuid
);


ALTER TABLE public.materiel OWNER TO postgres;

--
-- TOC entry 3322 (class 0 OID 0)
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
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE materiel_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.materiel_type IS 'gere type de materiels : Switch , Ordinateurs , telephone , ...';


--
-- TOC entry 222 (class 1259 OID 16905)
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
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE probleme_tech; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme_tech IS 'occurence d''un type de probleme_tech, lieu ,remarque';


--
-- TOC entry 221 (class 1259 OID 16890)
-- Name: probleme_tech_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.probleme_tech_type (
    num_probleme_tech_type uuid NOT NULL,
    libelle_probleme_tech_type text NOT NULL
);


ALTER TABLE public.probleme_tech_type OWNER TO postgres;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE probleme_tech_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.probleme_tech_type IS 'probleme plus specifique , jargon du technicien , technique';


--
-- TOC entry 223 (class 1259 OID 16933)
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
    materiel_type.libelle_materiel_type,
    intervention.commentaire
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
-- TOC entry 303 (class 1255 OID 17010)
-- Name: get_intervention_by_day(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_intervention_by_day(jour_j date) RETURNS TABLE("like" public.view_intervention_full)
    LANGUAGE plpgsql
    AS $$
declare 
	res record;
begin 
		return query select *
		from view_intervention_full 
		where date_programme >= jour_j - time '03:00' -- date are stored in UTC , UTC + 3 = local , jou_j is local , so -3 
		and date_programme <= jour_j + time '20:59'
		ORDER BY date_programme ASC;
end;
$$;


ALTER FUNCTION public.get_intervention_by_day(jour_j date) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 17003)
-- Name: get_intervention_by_interval(uuid, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_intervention_by_interval(num_app_user_tech_main uuid, start_date date, end_date date) RETURNS TABLE(jour date, nbintervs numeric)
    LANGUAGE plpgsql
    AS $$
declare 
	jour_j date;
begin
	for jour_j in ( select j::date from generate_series(start_date , end_date , '1 day'::interval ) as j) 
	loop
		jour = jour_j;
		select count(distinct num_intervention) 
		into nbIntervs
		from intervention
		where date_programme >= jour_j + time '00:00' - time '03:00' -- date is local time so we need to convert to UTC ( UTC = local -3)as db stores UTC
		and date_programme <= jour_j + time '23:59' - time '03:00';
-- 		select num_intervention , date_programme
-- 		into listIntervs
-- 		from intervention 
-- 		where date_programme >= jour_j + time '00:00' 
-- 		and date_programme <= jour_j + time '23:59';
-- 		raise notice 'jour : % -- %' , jour_j , listIntervs;
		return next;
	end loop;
end;
$$;


ALTER FUNCTION public.get_intervention_by_interval(num_app_user_tech_main uuid, start_date date, end_date date) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 25253)
-- Name: get_intervention_started_by_day(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_intervention_started_by_day(jour_j date) RETURNS TABLE("like" public.view_intervention_full)
    LANGUAGE plpgsql
    AS $$
declare 
	res record;
begin 
		return query select *
		from view_intervention_full 
		where date_debut >= jour_j - time '03:00' -- date are stored in UTC , UTC + 3 = local , jou_j is local , so -3 
		and date_debut <= jour_j + time '20:59'
		ORDER BY date_debut ASC;
end;
$$;


ALTER FUNCTION public.get_intervention_started_by_day(jour_j date) OWNER TO postgres;

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
-- TOC entry 3331 (class 0 OID 0)
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
-- TOC entry 3333 (class 0 OID 0)
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
-- TOC entry 3336 (class 0 OID 0)
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
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE type_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.type_user IS 'pour les types d''utilisateur de l''application : USER , TECH_MAIN , DASH';


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
-- TOC entry 231 (class 1259 OID 17016)
-- Name: view_notification_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_notification_full AS
 SELECT intervention.num_intervention_type,
    view_notification_by_user.num_intervention,
    view_notification_by_user.num_app_user_user,
    view_notification_by_user.user_sender_username,
    view_notification_by_user.type_user,
    view_notification_by_user.num_notification,
    view_notification_by_user.probleme_type,
    view_notification_by_user.num_lieu,
    view_notification_by_user.lieu,
    view_notification_by_user.code,
    view_notification_by_user.statut,
    view_notification_by_user.statut_libelle,
    view_notification_by_user.remarque,
    view_notification_by_user.date_envoie,
    view_notification_by_user.date_reponse,
    view_notification_by_user.num_app_user_tech_main,
    view_notification_by_user.tech_main_username,
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
    intervention_type.libelle_intervention_type,
    intervention_type.code_intervention_type
   FROM ((public.view_notification_by_user
     LEFT JOIN public.intervention USING (num_intervention))
     LEFT JOIN public.intervention_type USING (num_intervention_type));


ALTER TABLE public.view_notification_full OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 17021)
-- Name: get_notification_by_day(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_notification_by_day(jour_j date) RETURNS TABLE("like" public.view_notification_full)
    LANGUAGE plpgsql
    AS $$
begin
	return query select *
	from view_notification_full--doesnt take those without num_intervention
	where date_envoie >= jour_j - time '03:00' -- date are stored in UTC , UTC + 3 = local , jou_j is local , so -3 
	and date_envoie <= jour_j + time '20:59'
	ORDER BY date_programme ASC;
end;
$$;


ALTER FUNCTION public.get_notification_by_day(jour_j date) OWNER TO postgres;

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
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE decharge_materiel; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.decharge_materiel IS 'relation ( decharge -- materiel )';


--
-- TOC entry 226 (class 1259 OID 16967)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    num_message uuid NOT NULL,
    num_app_user_envoyeur uuid NOT NULL,
    date_envoie timestamp with time zone,
    contenu_message text,
    is_annonce boolean DEFAULT false
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.message IS 'message entre utilisateur , tech_main to tech_main , tech_main to user';


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN message.is_annonce; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.message.is_annonce IS 'say if it is an annonce';


--
-- TOC entry 234 (class 1259 OID 25222)
-- Name: view_annonce_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_annonce_full AS
 SELECT message.num_message,
    message.num_app_user_envoyeur,
    message.date_envoie,
    message.contenu_message,
    envoyeur.username AS envoyeur_username,
    message.is_annonce
   FROM (public.app_user envoyeur
     JOIN public.message ON ((message.num_app_user_envoyeur = envoyeur.num_user)))
  WHERE (message.is_annonce = true);


ALTER TABLE public.view_annonce_full OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25230)
-- Name: view_annonce_recepteur_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_annonce_recepteur_full AS
 SELECT message.num_message,
    message.num_app_user_envoyeur,
    message.date_envoie,
    message.contenu_message,
    envoyeur.username AS envoyeur_username,
    app_user_recepteur_message.num_app_user_recepteur,
    recepteur.username AS recepteur_username,
    app_user_recepteur_message.date_reception,
    message.is_annonce
   FROM (((public.app_user envoyeur
     JOIN public.message ON ((message.num_app_user_envoyeur = envoyeur.num_user)))
     JOIN public.app_user_recepteur_message USING (num_message))
     JOIN public.app_user recepteur ON ((app_user_recepteur_message.num_app_user_recepteur = recepteur.num_user)))
  WHERE (message.is_annonce = true);


ALTER TABLE public.view_annonce_recepteur_full OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17011)
-- Name: view_app_user_full; Type: VIEW; Schema: public; Owner: acim
--

CREATE VIEW public.view_app_user_full AS
 SELECT app_user.num_type_user,
    app_user.num_user,
    app_user.username,
    app_user.password,
    app_user.type_user,
    type_user.code,
    type_user.libelle
   FROM (public.app_user
     JOIN public.type_user USING (num_type_user));


ALTER TABLE public.view_app_user_full OWNER TO acim;

--
-- TOC entry 228 (class 1259 OID 16987)
-- Name: view_app_user_tech_main; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_app_user_tech_main AS
 SELECT app_user.num_user,
    app_user.username,
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
-- TOC entry 225 (class 1259 OID 16962)
-- Name: view_decharge_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_decharge_full AS
 SELECT materiel.num_materiel_type,
    decharge_materiel.num_materiel,
    decharge.num_decharge,
    decharge.date_debut_decharge,
    decharge.date_fin_decharge,
    decharge_materiel.configuration_origine,
    materiel.libelle_materiel,
    materiel_type.libelle_materiel_type,
    intervention.num_intervention,
    app_user.username
   FROM (((((public.decharge
     JOIN public.decharge_materiel USING (num_decharge))
     JOIN public.materiel USING (num_materiel))
     JOIN public.materiel_type USING (num_materiel_type))
     LEFT JOIN public.intervention USING (num_intervention))
     LEFT JOIN public.app_user ON ((app_user.num_user = intervention.num_app_user_tech_main_creator)));


ALTER TABLE public.view_decharge_full OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17027)
-- Name: view_intervention_done_today; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_intervention_done_today AS
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
    probleme_tech_type.libelle_probleme_tech_type,
    intervention.commentaire
   FROM (((((public.intervention
     JOIN public.app_user ON ((intervention.num_app_user_tech_main_creator = app_user.num_user)))
     JOIN public.lieu ON ((intervention.num_lieu_intervention = lieu.num_lieu)))
     JOIN public.intervention_type USING (num_intervention_type))
     LEFT JOIN public.probleme_tech ON ((intervention.num_probleme_constate = probleme_tech.num_probleme_tech)))
     LEFT JOIN public.probleme_tech_type USING (num_probleme_tech_type))
  WHERE ((intervention.date_fin >= ((now())::date - ('03:00:00'::time without time zone)::interval)) AND (intervention.date_fin <= ((now())::date + '20:59:00'::time without time zone)) AND (intervention.done = true));


ALTER TABLE public.view_intervention_done_today OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17022)
-- Name: view_intervention_started; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_intervention_started AS
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
    probleme_tech_type.libelle_probleme_tech_type,
    intervention.commentaire
   FROM (((((public.intervention
     JOIN public.app_user ON ((intervention.num_app_user_tech_main_creator = app_user.num_user)))
     JOIN public.lieu ON ((intervention.num_lieu_intervention = lieu.num_lieu)))
     JOIN public.intervention_type USING (num_intervention_type))
     LEFT JOIN public.probleme_tech ON ((intervention.num_probleme_constate = probleme_tech.num_probleme_tech)))
     LEFT JOIN public.probleme_tech_type USING (num_probleme_tech_type))
  WHERE ((intervention.done = false) AND (intervention.date_fin IS NULL) AND (intervention.date_debut IS NOT NULL));


ALTER TABLE public.view_intervention_started OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16938)
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
    probleme_tech_type.libelle_probleme_tech_type,
    intervention.commentaire
   FROM (((((public.intervention
     JOIN public.app_user ON ((intervention.num_app_user_tech_main_creator = app_user.num_user)))
     JOIN public.lieu ON ((intervention.num_lieu_intervention = lieu.num_lieu)))
     JOIN public.intervention_type USING (num_intervention_type))
     LEFT JOIN public.probleme_tech ON ((intervention.num_probleme_constate = probleme_tech.num_probleme_tech)))
     LEFT JOIN public.probleme_tech_type USING (num_probleme_tech_type))
  WHERE ((intervention.done = false) AND (intervention.date_fin IS NULL));


ALTER TABLE public.view_intervention_undone OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16886)
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
-- TOC entry 236 (class 1259 OID 25245)
-- Name: view_materiel_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_materiel_full AS
 SELECT materiel.num_materiel,
    materiel.num_materiel_type,
    materiel.libelle_materiel,
    materiel.num_lieu,
    materiel_type.libelle_materiel_type,
    lieu.libelle
   FROM ((public.materiel
     JOIN public.materiel_type ON ((materiel.num_materiel_type = materiel_type.num_materiel_type)))
     JOIN public.lieu ON ((materiel.num_lieu = lieu.num_lieu)));


ALTER TABLE public.view_materiel_full OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16991)
-- Name: view_message_full; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_message_full AS
 SELECT message.num_message,
    message.num_app_user_envoyeur,
    message.date_envoie,
    message.contenu_message,
    envoyeur.username AS envoyeur_username,
    app_user_recepteur_message.num_app_user_recepteur,
    recepteur.username AS recepteur_username,
    app_user_recepteur_message.date_reception,
    message.is_annonce
   FROM (((public.app_user envoyeur
     JOIN public.message ON ((message.num_app_user_envoyeur = envoyeur.num_user)))
     JOIN public.app_user_recepteur_message USING (num_message))
     JOIN public.app_user recepteur ON ((app_user_recepteur_message.num_app_user_recepteur = recepteur.num_user)))
  WHERE (message.is_annonce = false);


ALTER TABLE public.view_message_full OWNER TO postgres;

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
-- TOC entry 219 (class 1259 OID 16860)
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
    inter.done,
    intervention_type.code_intervention_type
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
-- TOC entry 3287 (class 0 OID 16395)
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
-- TOC entry 3303 (class 0 OID 16980)
-- Dependencies: 227
-- Data for Name: app_user_recepteur_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_recepteur_message (num_app_user_recepteur, num_message, date_reception) FROM stdin;
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d39db19b-f868-4376-a0a9-13e30b3faad3	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5d9ac45d-f18b-4037-9641-106daf30bf34	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	4ffc367c-6424-4372-ac25-665d768377d3	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5b069ebd-fffe-485e-bce0-76ac9456d42c	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	b167b1d1-db28-422f-a63f-19251751b811	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	0e24a6e1-1dfb-4ae1-bcc7-99b69413f1ce	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	4ae5c698-2eae-4a09-a409-430a0fa5105a	2021-08-21 14:42:35.853+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	f7ec2082-0185-4058-b6f1-09ae393fe14a	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	fc82da7d-b104-43e1-bcf9-7095f8c5bbef	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ede1ad34-5a79-4330-a7eb-37a16ba35e02	2021-08-21 14:45:10.777+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	dec5db1e-ad87-493c-be87-6d4a8a073283	2021-08-21 14:47:46.785+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	24d61b11-f755-4dbc-b142-e2055d3832af	2021-08-21 15:06:21.667+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	0b825302-1675-40bf-8098-b73e40f486d8	2021-08-21 15:07:34.357+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c2f97da0-9de6-4420-a247-4f31a82036ae	2021-08-21 15:08:22.943+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	977db994-c5a7-4a91-959b-173cb8658e4c	2021-08-21 15:09:24.401+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d911ad9f-8280-424c-99e6-3f793ec3ac25	2021-08-21 15:09:46.165+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	0ef3bb98-1026-4a36-9e2f-7845f0473256	2021-08-21 15:11:08.039+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5e09dfd2-512a-465b-bf4d-b7decf6a53e6	2021-08-21 15:11:52.619+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	adb286b9-17ff-400e-ac96-443ea1a6718c	2021-08-21 15:11:55.528+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	bfa1aa5d-f121-4c7d-bddc-6fd2a686f4e5	2021-08-21 15:11:57.187+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	62317c6d-4300-4358-994d-31755f65aac3	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	056401e9-273a-4759-bc5f-c029031b2e77	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	a7ce7e30-cbdd-40c4-9056-56be2f324642	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	75170a11-6712-497f-977e-bf605fca3891	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d406d654-30fe-4d87-8949-91b94372ec46	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	eb9e0f35-9e5b-4849-9498-b26f20249e67	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	b43bb244-f42b-4c05-8b9e-9048960c16a7	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d124bf08-3738-49e9-b486-00c708332066	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	a78ca851-a399-4b1d-81e7-7b357e611fdc	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	fedcf141-e630-44a6-bd6d-b1421d31afb0	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	644e771c-a48a-46c0-93d6-7d02a9527414	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	3f98b111-8709-407c-9888-799baec435a6	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	51b138a1-8e58-4401-b68f-f05e2d0b32d2	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	7dcd1d9c-74dc-4987-9673-ee0a8f726952	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	a68669d6-f7a9-451c-9e79-11e162f991ad	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	af6c9c44-9cf6-4208-8a43-5734021df680	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1564ad87-101f-443f-afe5-e766294aa8d4	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ca944963-5332-436e-8cdb-55cb13b27b9f	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ae092999-637c-4f5e-95db-730b11606e21	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	259420ca-6fd5-4520-a8b7-b58b149352aa	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	9f23e1a2-593e-4211-bdb8-f0937b317159	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	306ad541-3c76-4eab-a027-9a37a35ed01f	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	81144678-47c4-4041-9ab1-a53af438c287	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	546dcac7-0c58-4819-9ca9-636242b6fc5f	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c0112ad9-0999-4a86-a9ec-00fc908da13d	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	90ff29aa-5d64-4257-96d8-1a33f4c3b30d	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	79c7e3ae-1355-405a-ba7d-65759ee98db8	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	331afdb0-92d6-4102-8820-7c62a35a21f6	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	27dddac5-be2d-42a5-b015-23c126de2336	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	97ec8413-6efb-4f15-9464-79bc395ddf06	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	abc0f5e2-35d3-4e10-89e4-98b1281a898a	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d2874bb3-0977-4226-be45-eba3411fc3a5	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	9a2103b0-7080-4303-987b-95c46866dc21	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	78e3563e-114c-4444-98d4-8a441a9f9852	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	0d6ee8da-1f21-40d4-958d-18f44b4246b3	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ebf0cde0-618f-42be-87a6-6cbebe8cdd13	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	b76a5699-9d10-4510-a4a0-9fd68954272a	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	04e3acde-49ea-423e-bfc7-47e009d3ab15	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1427b956-d101-4592-b2cd-c4385776162a	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	3c353bd0-96dc-4a46-8e1c-cad2f25fd680	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	9c5513b0-5437-4201-803c-bcbd4bf2217f	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	438b69f5-cb25-4edd-8558-578a73db84e0	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	41c030bf-48bb-45a1-8bbe-2663f24dd49f	2021-08-21 15:12:29.326+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c74aea1e-3392-4ce6-bf1f-93824d34cd8e	2021-08-21 15:12:29.326+00
68db45ca-29ad-483d-b8e5-52b629d24d80	4767b3e1-7dff-4e76-aecb-c4b548bf0f7f	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	defa4d7b-973a-4a3a-b54c-5d6df861d928	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c3c00af9-a357-4b7d-b500-d3a7fd3c871e	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	5330ee33-88d1-418e-a3d7-ce1a8c644eb8	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	802482b2-2294-415c-8a72-300afd88a610	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c5863ecb-b634-45c9-8164-84343b488edc	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	e75b5feb-2c17-4da8-8225-d8d364b99d19	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	740e820a-89d9-42e7-b933-1f1dfcb723a4	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	e9d61fd2-57c7-4ae8-9025-6308d8dcdea7	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ded92a1f-34be-4b00-8655-4b5e8f79d543	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	1335c5a0-bd3c-4d9e-87f1-f18362494079	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	17353018-5138-4873-9b77-aa778429c8a4	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	7f874e4c-17b3-4b50-8e65-e75a5257126a	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	0c0cda22-665c-4367-89f7-e24b5ce2d2a6	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c94dee90-01f6-485e-94fb-baaf40f79f20	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	fc242c71-7e94-4b9e-a9fe-cbbffa6c232f	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c7867aa3-c79b-4122-8070-616086ad3593	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	e1078b42-113c-466a-940d-b3bbf30ed2ec	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	0b3bf6ce-cd60-4c32-92fc-b23881ee7d39	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	dd02f0a5-ac71-4fc7-bf91-c5f0179c46a4	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	08b7030f-0014-44f0-92a4-630daa05fada	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	335973d7-4ab8-44f2-be6e-96aaf702e88d	2021-08-21 15:16:21.154+00
68db45ca-29ad-483d-b8e5-52b629d24d80	2c1bf2e3-fef9-447d-9fb0-8f4a1ef92181	2021-08-21 15:18:40.142+00
68db45ca-29ad-483d-b8e5-52b629d24d80	57152ba4-80b2-4147-bb9b-6092297e833c	2021-08-21 15:25:25.111+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	36ea583c-7595-4f3e-ba13-e0038b898158	2021-08-21 15:26:36.059+00
68db45ca-29ad-483d-b8e5-52b629d24d80	d44312d8-7978-4572-974d-824e3708f789	2021-08-21 15:26:50.628+00
68db45ca-29ad-483d-b8e5-52b629d24d80	18e09b38-0ed1-40ae-8ecb-12ce3142cdf0	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	f70bef79-0bd2-407e-a755-6113e4622b0d	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	bebbebdf-50ea-4abd-ae71-2f1ebd7ee5ee	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	17a692e2-4a5c-4575-b7b3-fb57f0dda8d8	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	8b802803-a32a-4cc6-b256-1f9ee2c729d3	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c76c4154-38dd-49f1-aeff-6313c40bd17d	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	217417aa-0c8c-4272-854f-8d3a301e0ce2	2021-08-22 11:40:51.676+00
68db45ca-29ad-483d-b8e5-52b629d24d80	d84fc8ff-773b-4813-8ff0-1be0afeceb36	2021-08-22 11:40:51.676+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	47679768-e78c-44e9-ad00-d1349b89a3ab	2021-08-22 11:41:06.422+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	68c38a54-8847-4398-9b43-fc083135d3c7	2021-08-22 12:31:20.622+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1b009fe2-6879-4df7-bb85-74b1bcab5c35	2021-08-22 12:32:45.618+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	37d1d953-8936-4a5c-b3c7-2da9c8472fbc	2021-08-22 12:32:45.618+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	175e52a4-2fe6-48f1-a1d1-f115975e191e	2021-08-22 12:39:45.377+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1a94fef8-b182-47a6-9710-9fbaf0fa828e	2021-08-22 12:39:45.377+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5676c59f-b0f5-4222-b9d6-41d287acd77b	2021-08-22 12:39:45.377+00
68db45ca-29ad-483d-b8e5-52b629d24d80	a5dd1ec4-d831-4b81-93e5-1d9599bc5088	2021-08-22 12:40:17.483+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	29388d18-5078-4361-8cc8-ece14fab6540	2021-08-22 12:44:38.934+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	9df43c38-b860-40f4-8eb0-377e2a56ff52	2021-08-22 12:44:38.934+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	9b2eed0c-95b0-42f3-b3f1-0b39684b1d9f	2021-08-22 12:44:38.934+00
68db45ca-29ad-483d-b8e5-52b629d24d80	042f80d2-4055-497c-a551-2eabf1dd998f	2021-08-22 12:46:13.029+00
68db45ca-29ad-483d-b8e5-52b629d24d80	b9189585-8cf4-4b70-9c31-e07db68f66b1	2021-08-22 12:52:57.949+00
68db45ca-29ad-483d-b8e5-52b629d24d80	a3f1d0c7-ece9-486f-9787-6bb5157f875d	2021-08-22 12:55:12.834+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	bc16a549-d881-4288-80d6-c75824b36c2f	2021-08-22 12:55:30.679+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c0250e92-9a84-4651-912c-38900555109d	2021-08-22 12:55:41.455+00
68db45ca-29ad-483d-b8e5-52b629d24d80	cbaf3bbb-06f8-4c22-baf3-8d46df8b6327	2021-08-22 13:03:32.588+00
68db45ca-29ad-483d-b8e5-52b629d24d80	69bf6cd1-e868-4723-89f7-9089f577f853	2021-08-22 13:04:00.101+00
68db45ca-29ad-483d-b8e5-52b629d24d80	9e1bfbcd-7938-43e8-9ea1-16925a50f895	2021-08-22 13:04:03.303+00
68db45ca-29ad-483d-b8e5-52b629d24d80	adfb917d-f3e4-4752-95f2-709c12b6a25b	2021-08-23 11:07:08.98+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d1330881-c75f-4ace-8bd8-6abecacfb2d9	2021-08-23 11:08:18.229+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d1d11e19-b544-4db2-a558-e0bf0bc7517b	2021-08-23 11:11:03.664+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1793a5a5-f0f2-4d4b-b13c-8cb980073198	2021-08-23 11:11:03.664+00
68db45ca-29ad-483d-b8e5-52b629d24d80	9f916ff0-632b-46db-a633-717a324b764c	2021-08-23 11:11:20.052+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	19255020-4fac-4a92-9719-dac11d8eebf3	2021-08-23 11:11:27.256+00
68db45ca-29ad-483d-b8e5-52b629d24d80	4b555c25-711e-4e78-8f5b-0bfef4d9a9b6	2021-08-23 11:11:36.632+00
68db45ca-29ad-483d-b8e5-52b629d24d80	47ba502d-131a-4f22-8732-a771ee38d14d	2021-08-24 06:21:55.399+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	42cc8cd3-b5e9-48dc-9d11-2be81eecae2b	2021-08-24 06:22:10.609+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c6d19785-e0fd-4762-b4f6-9e3c0aa30f06	2021-08-31 10:58:31.143+00
68db45ca-29ad-483d-b8e5-52b629d24d80	d0d3a065-7b6e-4bba-bbda-ecab73e61e11	2021-08-31 10:58:38.964+00
83a31293-3fbc-4e32-8814-0421fae2b491	ccb32a42-7fff-49ab-9c17-3470223e86f8	\N
83a31293-3fbc-4e32-8814-0421fae2b491	4ea57329-066f-4340-aeef-20f1b5fac671	\N
83a31293-3fbc-4e32-8814-0421fae2b491	8c30b0b5-0381-4805-bc75-32783fecea10	\N
83a31293-3fbc-4e32-8814-0421fae2b491	6934c0da-d0df-444b-b911-3b4017a85442	\N
83a31293-3fbc-4e32-8814-0421fae2b491	8e283485-7d69-4f92-8fe3-b2a6e938757a	\N
83a31293-3fbc-4e32-8814-0421fae2b491	b0534c98-0f27-4731-909c-ea59c46b8b29	\N
83a31293-3fbc-4e32-8814-0421fae2b491	c55c1858-d3f0-46c4-8ec1-4f260a3152d7	\N
83a31293-3fbc-4e32-8814-0421fae2b491	30daaedb-f628-4df2-aaaa-ae781efcf823	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	6ab3f14d-67da-4c3a-b5a1-451643758788	2021-09-10 07:47:36.394+00
83a31293-3fbc-4e32-8814-0421fae2b491	39ee53f1-9ad9-487a-8af2-7e5637cf81f5	\N
83a31293-3fbc-4e32-8814-0421fae2b491	77b4aa6b-e7b9-4188-a60b-c4093f8a1d1d	\N
83a31293-3fbc-4e32-8814-0421fae2b491	1c33b91a-625b-43f8-9df2-f6bf2e414264	\N
83a31293-3fbc-4e32-8814-0421fae2b491	64aed876-31ab-4c3d-81db-5b077a878e13	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	c91e95b7-22b0-4324-9ad5-b63bb83995d7	2021-09-10 08:10:43.802+00
83a31293-3fbc-4e32-8814-0421fae2b491	b03f2ad9-5127-4042-8565-ed8e9e22a96c	\N
83a31293-3fbc-4e32-8814-0421fae2b491	7c3e5abf-60e2-498c-a594-e30dada39b9a	\N
83a31293-3fbc-4e32-8814-0421fae2b491	71714840-0312-4e94-a801-4f572b50dea3	\N
83a31293-3fbc-4e32-8814-0421fae2b491	c9b132ef-3ad4-4fd9-8ddb-c6626a931866	\N
83a31293-3fbc-4e32-8814-0421fae2b491	bb04895a-8e2e-4b19-a256-6e61d4e12662	\N
83a31293-3fbc-4e32-8814-0421fae2b491	2079bc94-f050-4b56-bfbc-59c7f8c603d0	\N
83a31293-3fbc-4e32-8814-0421fae2b491	ea01923a-3daf-4632-ab47-8b9b2613b1bf	\N
83a31293-3fbc-4e32-8814-0421fae2b491	a8293116-e50b-40a0-90f2-e71bd49aad2c	\N
83a31293-3fbc-4e32-8814-0421fae2b491	64dca7fa-eea9-46ad-8eea-58cfe98d6c96	\N
83a31293-3fbc-4e32-8814-0421fae2b491	91b21b40-a79d-4662-b870-57adf4b16f09	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	05d35cd3-1ae0-4def-a945-e5f727510a91	2021-09-10 08:44:32.576+00
83a31293-3fbc-4e32-8814-0421fae2b491	51ef977b-b584-41ec-ba0a-8371d2e1f0c5	\N
83a31293-3fbc-4e32-8814-0421fae2b491	e0e96d68-4e67-4342-b0ab-8494ddca9c5f	\N
83a31293-3fbc-4e32-8814-0421fae2b491	89be0bd3-bdff-45a8-bc4a-ffa1da4034a0	\N
83a31293-3fbc-4e32-8814-0421fae2b491	8956c76b-514c-4543-98e4-2cbaba2f3637	\N
83a31293-3fbc-4e32-8814-0421fae2b491	07953839-2e6e-467e-8e56-befd194f8afe	\N
83a31293-3fbc-4e32-8814-0421fae2b491	89b1f80f-f196-4427-9b60-3186978a30b4	\N
83a31293-3fbc-4e32-8814-0421fae2b491	fc610d4d-a7ac-4121-a918-a56fbbcb9fe9	\N
83a31293-3fbc-4e32-8814-0421fae2b491	ad4314fc-cb72-45bd-bd11-525e4544aa1f	\N
83a31293-3fbc-4e32-8814-0421fae2b491	1d9cf619-ffa3-4be2-9083-719c7bee2d5e	\N
83a31293-3fbc-4e32-8814-0421fae2b491	0efb7ea4-dde9-4c54-923a-b37edf16ed94	\N
83a31293-3fbc-4e32-8814-0421fae2b491	7fe26cf8-b6be-4c9c-b3cc-11de2e449a27	\N
83a31293-3fbc-4e32-8814-0421fae2b491	bd7736c7-d7fa-49e0-ab0a-dc20607348cd	\N
83a31293-3fbc-4e32-8814-0421fae2b491	5d7a2642-8184-4d23-9edb-b6414faabd07	\N
83a31293-3fbc-4e32-8814-0421fae2b491	e11eb931-3868-4ab7-8c36-b80574d6d3ef	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	39ee53f1-9ad9-487a-8af2-7e5637cf81f5	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	77b4aa6b-e7b9-4188-a60b-c4093f8a1d1d	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1c33b91a-625b-43f8-9df2-f6bf2e414264	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	64aed876-31ab-4c3d-81db-5b077a878e13	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	b03f2ad9-5127-4042-8565-ed8e9e22a96c	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	71714840-0312-4e94-a801-4f572b50dea3	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	91b21b40-a79d-4662-b870-57adf4b16f09	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	51ef977b-b584-41ec-ba0a-8371d2e1f0c5	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	e0e96d68-4e67-4342-b0ab-8494ddca9c5f	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	8956c76b-514c-4543-98e4-2cbaba2f3637	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	07953839-2e6e-467e-8e56-befd194f8afe	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5d7a2642-8184-4d23-9edb-b6414faabd07	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	e11eb931-3868-4ab7-8c36-b80574d6d3ef	2021-09-10 20:45:41.86+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ccb32a42-7fff-49ab-9c17-3470223e86f8	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	8c30b0b5-0381-4805-bc75-32783fecea10	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	6934c0da-d0df-444b-b911-3b4017a85442	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	8e283485-7d69-4f92-8fe3-b2a6e938757a	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	b0534c98-0f27-4731-909c-ea59c46b8b29	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c55c1858-d3f0-46c4-8ec1-4f260a3152d7	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	c9b132ef-3ad4-4fd9-8ddb-c6626a931866	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	bb04895a-8e2e-4b19-a256-6e61d4e12662	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	2079bc94-f050-4b56-bfbc-59c7f8c603d0	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ea01923a-3daf-4632-ab47-8b9b2613b1bf	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	64dca7fa-eea9-46ad-8eea-58cfe98d6c96	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	89b1f80f-f196-4427-9b60-3186978a30b4	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	fc610d4d-a7ac-4121-a918-a56fbbcb9fe9	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ad4314fc-cb72-45bd-bd11-525e4544aa1f	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	1d9cf619-ffa3-4be2-9083-719c7bee2d5e	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	7fe26cf8-b6be-4c9c-b3cc-11de2e449a27	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	bd7736c7-d7fa-49e0-ab0a-dc20607348cd	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	5d7a2642-8184-4d23-9edb-b6414faabd07	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	e11eb931-3868-4ab7-8c36-b80574d6d3ef	2021-09-10 20:58:24.31+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	ccb32a42-7fff-49ab-9c17-3470223e86f8	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	8c30b0b5-0381-4805-bc75-32783fecea10	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	6934c0da-d0df-444b-b911-3b4017a85442	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	8e283485-7d69-4f92-8fe3-b2a6e938757a	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	b0534c98-0f27-4731-909c-ea59c46b8b29	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	30daaedb-f628-4df2-aaaa-ae781efcf823	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	39ee53f1-9ad9-487a-8af2-7e5637cf81f5	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	77b4aa6b-e7b9-4188-a60b-c4093f8a1d1d	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	1c33b91a-625b-43f8-9df2-f6bf2e414264	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	64aed876-31ab-4c3d-81db-5b077a878e13	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	7c3e5abf-60e2-498c-a594-e30dada39b9a	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	71714840-0312-4e94-a801-4f572b50dea3	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	c9b132ef-3ad4-4fd9-8ddb-c6626a931866	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	bb04895a-8e2e-4b19-a256-6e61d4e12662	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	2079bc94-f050-4b56-bfbc-59c7f8c603d0	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	a8293116-e50b-40a0-90f2-e71bd49aad2c	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	64dca7fa-eea9-46ad-8eea-58cfe98d6c96	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	91b21b40-a79d-4662-b870-57adf4b16f09	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	51ef977b-b584-41ec-ba0a-8371d2e1f0c5	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	89be0bd3-bdff-45a8-bc4a-ffa1da4034a0	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	8956c76b-514c-4543-98e4-2cbaba2f3637	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	07953839-2e6e-467e-8e56-befd194f8afe	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	89b1f80f-f196-4427-9b60-3186978a30b4	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	fc610d4d-a7ac-4121-a918-a56fbbcb9fe9	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	1d9cf619-ffa3-4be2-9083-719c7bee2d5e	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	0efb7ea4-dde9-4c54-923a-b37edf16ed94	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	7fe26cf8-b6be-4c9c-b3cc-11de2e449a27	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	bd7736c7-d7fa-49e0-ab0a-dc20607348cd	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	5d7a2642-8184-4d23-9edb-b6414faabd07	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	ea4457bc-bc67-45d4-b38c-90046b06ad66	2021-09-14 11:15:26.783+00
83a31293-3fbc-4e32-8814-0421fae2b491	ea4457bc-bc67-45d4-b38c-90046b06ad66	\N
83a31293-3fbc-4e32-8814-0421fae2b491	5ed6e0d7-5a7f-40a3-845c-1bf2a8d18939	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	4a840801-fe6e-4a89-93b0-66a12ea57655	2021-09-10 20:35:27.277+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ccb32a42-7fff-49ab-9c17-3470223e86f8	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	7c3e5abf-60e2-498c-a594-e30dada39b9a	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	89be0bd3-bdff-45a8-bc4a-ffa1da4034a0	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ea4457bc-bc67-45d4-b38c-90046b06ad66	2021-09-10 20:45:41.86+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	5ed6e0d7-5a7f-40a3-845c-1bf2a8d18939	2021-09-10 20:45:41.86+00
83a31293-3fbc-4e32-8814-0421fae2b491	ea6f0604-c5ef-4517-9e87-4a558870916e	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	ea6f0604-c5ef-4517-9e87-4a558870916e	2021-09-10 20:58:07.235+00
68db45ca-29ad-483d-b8e5-52b629d24d80	4ea57329-066f-4340-aeef-20f1b5fac671	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	30daaedb-f628-4df2-aaaa-ae781efcf823	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	a8293116-e50b-40a0-90f2-e71bd49aad2c	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	0efb7ea4-dde9-4c54-923a-b37edf16ed94	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ea4457bc-bc67-45d4-b38c-90046b06ad66	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	5ed6e0d7-5a7f-40a3-845c-1bf2a8d18939	2021-09-10 20:58:24.31+00
68db45ca-29ad-483d-b8e5-52b629d24d80	ea6f0604-c5ef-4517-9e87-4a558870916e	2021-09-10 20:58:24.31+00
83a31293-3fbc-4e32-8814-0421fae2b491	6f4ca211-b218-4c1a-8ff8-61b6c7941ef3	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	6f4ca211-b218-4c1a-8ff8-61b6c7941ef3	2021-09-10 21:21:35.261+00
83a31293-3fbc-4e32-8814-0421fae2b491	d243132b-0b7d-496c-a85e-3851e074de21	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d243132b-0b7d-496c-a85e-3851e074de21	2021-09-10 21:22:24.912+00
68db45ca-29ad-483d-b8e5-52b629d24d80	6f4ca211-b218-4c1a-8ff8-61b6c7941ef3	2021-09-14 07:41:29.081+00
68db45ca-29ad-483d-b8e5-52b629d24d80	d243132b-0b7d-496c-a85e-3851e074de21	2021-09-14 07:41:29.081+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	4ea57329-066f-4340-aeef-20f1b5fac671	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	c55c1858-d3f0-46c4-8ec1-4f260a3152d7	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	b03f2ad9-5127-4042-8565-ed8e9e22a96c	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	ea01923a-3daf-4632-ab47-8b9b2613b1bf	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	e0e96d68-4e67-4342-b0ab-8494ddca9c5f	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	ad4314fc-cb72-45bd-bd11-525e4544aa1f	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	e11eb931-3868-4ab7-8c36-b80574d6d3ef	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	5ed6e0d7-5a7f-40a3-845c-1bf2a8d18939	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	ea6f0604-c5ef-4517-9e87-4a558870916e	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	6f4ca211-b218-4c1a-8ff8-61b6c7941ef3	2021-09-14 11:15:26.783+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	d243132b-0b7d-496c-a85e-3851e074de21	2021-09-14 11:15:26.783+00
83a31293-3fbc-4e32-8814-0421fae2b491	d4f8ba27-28ec-48ac-888f-4db149fd202b	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	d4f8ba27-28ec-48ac-888f-4db149fd202b	2021-09-14 12:00:49.098+00
83a31293-3fbc-4e32-8814-0421fae2b491	7e548389-fdda-4b5f-bdfb-37ee6392de96	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	7e548389-fdda-4b5f-bdfb-37ee6392de96	2021-09-14 12:07:13.71+00
68db45ca-29ad-483d-b8e5-52b629d24d80	d4f8ba27-28ec-48ac-888f-4db149fd202b	2021-09-14 12:10:51.381+00
68db45ca-29ad-483d-b8e5-52b629d24d80	7e548389-fdda-4b5f-bdfb-37ee6392de96	2021-09-14 12:10:51.381+00
83a31293-3fbc-4e32-8814-0421fae2b491	903b8705-c536-4b65-a62f-8764cb9a9cfa	\N
83a31293-3fbc-4e32-8814-0421fae2b491	dff87b18-35e8-49bc-9eb7-f6412ee529bb	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	903b8705-c536-4b65-a62f-8764cb9a9cfa	2021-09-14 12:16:21.742+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	dff87b18-35e8-49bc-9eb7-f6412ee529bb	2021-09-14 12:16:21.742+00
83a31293-3fbc-4e32-8814-0421fae2b491	f47bf0a6-7f2b-4aeb-ba29-44aa73eaa4e8	\N
83a31293-3fbc-4e32-8814-0421fae2b491	48b59661-3c0c-4173-a887-461a774ce7b8	\N
83a31293-3fbc-4e32-8814-0421fae2b491	f8bd75fe-251a-4693-bec9-c7982bddaa65	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	f47bf0a6-7f2b-4aeb-ba29-44aa73eaa4e8	2021-09-14 12:18:40.391+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	48b59661-3c0c-4173-a887-461a774ce7b8	2021-09-14 12:18:40.391+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	f8bd75fe-251a-4693-bec9-c7982bddaa65	2021-09-14 12:18:40.391+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	d4f8ba27-28ec-48ac-888f-4db149fd202b	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	7e548389-fdda-4b5f-bdfb-37ee6392de96	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	903b8705-c536-4b65-a62f-8764cb9a9cfa	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	dff87b18-35e8-49bc-9eb7-f6412ee529bb	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	f47bf0a6-7f2b-4aeb-ba29-44aa73eaa4e8	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	48b59661-3c0c-4173-a887-461a774ce7b8	2021-09-20 15:02:42.467+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	f8bd75fe-251a-4693-bec9-c7982bddaa65	2021-09-20 15:02:42.467+00
68db45ca-29ad-483d-b8e5-52b629d24d80	903b8705-c536-4b65-a62f-8764cb9a9cfa	2021-10-01 08:14:00.926+00
68db45ca-29ad-483d-b8e5-52b629d24d80	dff87b18-35e8-49bc-9eb7-f6412ee529bb	2021-10-01 08:14:00.926+00
68db45ca-29ad-483d-b8e5-52b629d24d80	f47bf0a6-7f2b-4aeb-ba29-44aa73eaa4e8	2021-10-01 08:14:00.926+00
68db45ca-29ad-483d-b8e5-52b629d24d80	48b59661-3c0c-4173-a887-461a774ce7b8	2021-10-01 08:14:00.926+00
68db45ca-29ad-483d-b8e5-52b629d24d80	f8bd75fe-251a-4693-bec9-c7982bddaa65	2021-10-01 08:14:00.926+00
83a31293-3fbc-4e32-8814-0421fae2b491	084dd9cc-b451-46b7-9b63-75b1bb66a977	\N
68db45ca-29ad-483d-b8e5-52b629d24d80	084dd9cc-b451-46b7-9b63-75b1bb66a977	2021-10-01 09:10:13.6+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	084dd9cc-b451-46b7-9b63-75b1bb66a977	2021-10-07 11:49:59.987+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	084dd9cc-b451-46b7-9b63-75b1bb66a977	2021-10-07 16:19:36.102+00
83a31293-3fbc-4e32-8814-0421fae2b491	e5b55dea-d63b-4d02-89af-1b011ff81c8e	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	e5b55dea-d63b-4d02-89af-1b011ff81c8e	2021-10-07 16:36:15.21+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	e5b55dea-d63b-4d02-89af-1b011ff81c8e	2021-10-08 06:52:37.103+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	4b608552-20d9-4589-b999-3f7db3bc42f6	\N
83a31293-3fbc-4e32-8814-0421fae2b491	4b608552-20d9-4589-b999-3f7db3bc42f6	\N
fec0af71-5541-40e1-93ad-033ad5fb2fa0	f9b8fa8b-5434-4702-907e-f11eaaf91722	\N
83a31293-3fbc-4e32-8814-0421fae2b491	f9b8fa8b-5434-4702-907e-f11eaaf91722	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	4b608552-20d9-4589-b999-3f7db3bc42f6	2021-10-08 07:11:15.122+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	f9b8fa8b-5434-4702-907e-f11eaaf91722	2021-10-08 07:11:15.122+00
68db45ca-29ad-483d-b8e5-52b629d24d80	8d6cee32-e7cb-4bd4-a170-53708fcc85ae	2021-10-25 09:17:33.335+00
fec0af71-5541-40e1-93ad-033ad5fb2fa0	1e118705-0930-4cfe-81e5-9b238cdfc1e3	\N
83a31293-3fbc-4e32-8814-0421fae2b491	1e118705-0930-4cfe-81e5-9b238cdfc1e3	\N
237451bc-067e-4c61-ae8d-9c5fe93b49ce	1e118705-0930-4cfe-81e5-9b238cdfc1e3	\N
68db45ca-29ad-483d-b8e5-52b629d24d80	e5b55dea-d63b-4d02-89af-1b011ff81c8e	2021-10-25 09:18:12.987+00
68db45ca-29ad-483d-b8e5-52b629d24d80	4b608552-20d9-4589-b999-3f7db3bc42f6	2021-10-25 09:18:12.987+00
68db45ca-29ad-483d-b8e5-52b629d24d80	f9b8fa8b-5434-4702-907e-f11eaaf91722	2021-10-25 09:18:12.987+00
68db45ca-29ad-483d-b8e5-52b629d24d80	1e118705-0930-4cfe-81e5-9b238cdfc1e3	2021-10-25 09:18:12.987+00
237451bc-067e-4c61-ae8d-9c5fe93b49ce	b38020d0-7777-4009-97d7-7853b9fa17be	2021-10-25 09:18:51.575+00
\.


--
-- TOC entry 3298 (class 0 OID 16799)
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
ab06c633-fc5e-42e9-a0c1-1087a132a15f	bf6529d7-2c88-4e96-b272-f4eaf7e4ace8	2021-08-12	2021-08-19
bab1a1e6-ed37-460d-b740-cafd095a0501	edff0ade-0a86-463c-9d4d-8d86cf6132af	2021-08-12	2021-08-13
71694118-72d7-4af1-91f8-644e4f28a3ac	\N	2021-08-13	2021-08-14
f45c41b8-c47d-465a-b887-0d6178273a92	\N	2021-08-16	2021-08-17
7fc034b3-fc51-452b-a21a-135c6808dcf6	\N	2021-08-16	2021-08-17
025a739f-5f93-4c97-8283-e0e4149e8556	bba2774e-9aa9-40c6-ac79-af4172a8bcc7	2021-08-16	2021-08-17
47ac3dfc-8385-4d3e-a10c-0f90968468f4	c07f7d51-c337-404d-ae77-4858f9ff23d2	2021-08-24	2021-08-24
9d3a8f07-a8c0-4494-b24c-afc9f35b741b	2cbae466-36ad-4391-aa48-b70b0ce9f3b2	2021-08-23	2021-08-24
4271bd44-16b2-4da4-a58e-dfd39ee0738b	1fc3d63d-3eb3-4c85-9b60-fe5311215ae7	2021-08-23	2021-08-24
a513e45f-fb2a-4826-851a-cff154f4fc86	c150d823-8c9b-4057-b01a-b35c0fb0e519	2021-08-23	2021-08-24
dbaa1b2d-6135-421f-ace8-a83dd2e3e62f	492a2c81-3ede-4a95-9964-d465da82578f	2021-08-24	2021-08-25
7d0136ca-f6b9-4242-968b-e84cb6cb410f	15adcc98-67fd-4df0-a4b0-6ac9f3de1235	2021-07-19	2021-07-21
ce356901-45d2-48d7-9577-8805f371b5e5	3d251eea-a701-4486-8f86-3c8927753672	2021-10-08	2021-10-09
9083ca04-dde9-4908-8551-e3b5c6dcda93	99cb2741-16f2-44d0-9a20-831b4fc3fc19	2021-10-25	2021-10-26
\.


--
-- TOC entry 3299 (class 0 OID 16809)
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
ab06c633-fc5e-42e9-a0c1-1087a132a15f	48aa0db2-7290-4fda-959f-c77fe815b6ac	win 7 , office 2010
ab06c633-fc5e-42e9-a0c1-1087a132a15f	7648255d-5019-418d-b552-70cc258e9e09	win 8.1 , office 2007
bab1a1e6-ed37-460d-b740-cafd095a0501	1187acbb-861b-421b-9070-6f0b1b34e8ac	DHCP 
71694118-72d7-4af1-91f8-644e4f28a3ac	48aa0db2-7290-4fda-959f-c77fe815b6ac	
f45c41b8-c47d-465a-b887-0d6178273a92	48aa0db2-7290-4fda-959f-c77fe815b6ac	
7fc034b3-fc51-452b-a21a-135c6808dcf6	48aa0db2-7290-4fda-959f-c77fe815b6ac	
025a739f-5f93-4c97-8283-e0e4149e8556	1187acbb-861b-421b-9070-6f0b1b34e8ac	endommagé
47ac3dfc-8385-4d3e-a10c-0f90968468f4	7ebec45d-2197-4d91-87a7-7998845016cd	
9d3a8f07-a8c0-4494-b24c-afc9f35b741b	48aa0db2-7290-4fda-959f-c77fe815b6ac	
4271bd44-16b2-4da4-a58e-dfd39ee0738b	1187acbb-861b-421b-9070-6f0b1b34e8ac	
a513e45f-fb2a-4826-851a-cff154f4fc86	48aa0db2-7290-4fda-959f-c77fe815b6ac	
a513e45f-fb2a-4826-851a-cff154f4fc86	7ebec45d-2197-4d91-87a7-7998845016cd	
a513e45f-fb2a-4826-851a-cff154f4fc86	7648255d-5019-418d-b552-70cc258e9e09	
a513e45f-fb2a-4826-851a-cff154f4fc86	1187acbb-861b-421b-9070-6f0b1b34e8ac	
dbaa1b2d-6135-421f-ace8-a83dd2e3e62f	48aa0db2-7290-4fda-959f-c77fe815b6ac	
7d0136ca-f6b9-4242-968b-e84cb6cb410f	48aa0db2-7290-4fda-959f-c77fe815b6ac	
7d0136ca-f6b9-4242-968b-e84cb6cb410f	7ebec45d-2197-4d91-87a7-7998845016cd	
7d0136ca-f6b9-4242-968b-e84cb6cb410f	7648255d-5019-418d-b552-70cc258e9e09	
7d0136ca-f6b9-4242-968b-e84cb6cb410f	1187acbb-861b-421b-9070-6f0b1b34e8ac	
ce356901-45d2-48d7-9577-8805f371b5e5	48aa0db2-7290-4fda-959f-c77fe815b6ac	
9083ca04-dde9-4908-8551-e3b5c6dcda93	48aa0db2-7290-4fda-959f-c77fe815b6ac	
\.


--
-- TOC entry 3297 (class 0 OID 16761)
-- Dependencies: 215
-- Data for Name: intervention; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intervention (num_intervention, num_app_user_tech_main_creator, num_probleme_constate, num_materiel, num_lieu_intervention, num_intervention_type, num_intervention_pere, motif, log, date_programme, date_debut, date_fin, probleme_resolu, done, commentaire) FROM stdin;
edff0ade-0a86-463c-9d4d-8d86cf6132af	237451bc-067e-4c61-ae8d-9c5fe93b49ce	76bc2601-991f-44d7-86a0-cf41b85a1d9e	1187acbb-861b-421b-9070-6f0b1b34e8ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	reconfigurer switch;	2021-07-27 11:34:00.352+00	2021-08-12 08:43:36.487+00	2021-08-20 09:42:51.814+00	t	t	\N
3ebcb2c6-2e17-4fad-a020-43305ed5aabe	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-21 12:25:47.165+00	2021-07-21 12:26:12.997+00	2021-07-21 12:26:16.002+00	f	t	\N
ae64b19a-e376-4f85-beb2-c79a47957fea	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-21 12:38:30.604+00	2021-07-22 06:39:11.768+00	2021-07-22 06:49:11.768+00	t	t	\N
1fc4e247-76ed-4797-af42-c5a404e7d9c7	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- dsi	\N	2021-07-27 08:39:43.641+00	2021-07-27 05:55:11.374+00	2021-07-27 06:05:11.374+00	t	t	\N
de1cefeb-824b-47f5-a309-af828fb70942	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-07-20 14:10:42.438+00	2021-07-21 11:31:22.655+00	2021-07-21 11:41:09.603+00	f	t	\N
8eb04673-caff-4d51-9cfa-1ab533a2c6cc	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-20 14:09:24.596+00	2021-07-21 11:32:32.584+00	2021-07-21 11:42:31.586+00	f	t	\N
b2768370-3953-4b8d-af1e-8784ad9f6a23	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-21 12:26:46.916+00	2021-07-22 06:51:47.962+00	2021-07-22 06:51:55.888+00	t	t	\N
3b4364fa-bc56-475f-b211-ae426f92af8f	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-20 13:36:55.34+00	2021-07-21 11:50:35.554+00	2021-07-21 11:50:37.071+00	f	t	\N
d6924ae1-1b7b-4c4e-8698-5178eda55a68	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - pas urgent	\N	2021-07-20 13:34:38.238+00	2021-07-21 12:01:40.692+00	2021-07-21 12:01:43.91+00	f	t	\N
15adcc98-67fd-4df0-a4b0-6ac9f3de1235	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-19 07:11:03.322+00	2021-07-21 12:11:15.134+00	2021-07-21 12:11:53.391+00	t	t	\N
5c0426c0-a7f4-4ea9-a365-4eb4970e752c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-22 06:56:43.44+00	2021-07-22 06:57:27.317+00	2021-07-22 06:57:50.579+00	t	t	\N
6275863b-dfb1-488a-9ef4-9fc29369cf82	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - pas urgent	\N	2021-07-22 20:04:35.704+00	2021-07-22 19:55:20.707+00	2021-07-22 20:05:20.707+00	t	t	\N
9b09672e-5bfb-4db8-b302-43e7648c1c23	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-24 15:23:18.932+00	2021-07-24 15:14:50.085+00	2021-07-24 15:24:50.085+00	t	t	\N
a9368d45-3496-4731-8750-1c9149d61526	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:28:35.32+00	2021-07-27 07:22:36.354+00	2021-07-27 07:32:36.354+00	t	t	\N
62ba5752-b2c6-4c22-827d-7ee272387ec3	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:50:51.104+00	2021-07-27 07:33:21.451+00	2021-07-27 07:43:21.451+00	t	t	\N
1929429d-3418-4cdb-8020-19f81665fa2f	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 06:50:51.104+00	2021-07-27 07:44:28.695+00	2021-07-27 07:44:31.447+00	f	t	\N
65a858b0-2872-469c-ab3b-5dd010af5c9b	68db45ca-29ad-483d-b8e5-52b629d24d80	749dc6df-118c-4a38-8a27-f351f8839763	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:36:08.129+00	2021-07-27 07:36:50.57+00	2021-07-27 07:46:50.57+00	f	t	\N
8bf30c9e-4887-4940-a558-6d882f098f13	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-07-26 06:56:37.527+00	2021-07-27 07:41:26.247+00	2021-07-27 07:51:28.062+00	t	t	\N
4eae7aac-1cc1-4242-b4cd-e2b44e017f77	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-27 07:43:44.391+00	2021-07-27 07:53:44.391+00	t	t	\N
c0a4c98c-8423-441f-b7d3-8f893d7aac01	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-29 19:55:59.69+00	2021-07-29 20:05:59.69+00	t	t	\N
db0f8f68-b4f5-446d-a94b-f91af24ef836	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	7648255d-5019-418d-b552-70cc258e9e09	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-07-26 07:05:37.38+00	2021-07-29 19:57:21.745+00	2021-07-29 20:07:21.745+00	t	t	\N
5092d094-a47c-495c-8a29-0349a2d0375e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - tres urgent	\N	2021-07-27 08:19:21.046+00	2021-07-30 11:50:51.869+00	2021-07-30 12:00:51.869+00	t	t	\N
830ce0b8-9051-4179-8382-1990619b64f5	68db45ca-29ad-483d-b8e5-52b629d24d80	546d1c0e-6eb2-4ac4-af23-a2cf57a99fd2	7648255d-5019-418d-b552-70cc258e9e09	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 222	installer antivirus; redemarrer	2021-07-26 07:08:16.691+00	2021-07-30 20:11:02.666+00	2021-07-30 20:21:02.666+00	t	t	\N
2f95c7cb-0854-4d24-9e7e-7a7c622bfdff	68db45ca-29ad-483d-b8e5-52b629d24d80	dce64402-b2e4-4404-b695-6f113806693c	7648255d-5019-418d-b552-70cc258e9e09	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 222	\N	2021-07-26 07:08:16.691+00	2021-07-30 08:43:45.894+00	2021-07-30 08:43:50.309+00	t	t	\N
edf11ca9-db87-460d-9f3b-3d44297a6789	68db45ca-29ad-483d-b8e5-52b629d24d80	b6beac0a-08e7-4720-923a-41cf2d4f4357	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	reinitialiser box	2021-07-26 07:08:16.691+00	2021-07-30 08:11:47.934+00	2021-07-30 08:21:47.934+00	t	t	\N
bf4a10d2-d6fc-4684-8f04-e0cc3f8e3d02	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 12:01:20.935+00	2021-07-30 12:01:20.935+00	2021-07-30 12:01:42.472+00	t	t	\N
e64afc79-c567-431a-bdf3-065215dec7e6	68db45ca-29ad-483d-b8e5-52b629d24d80	98d3b852-d65a-4ec3-abe8-6a746e4a77e8	7648255d-5019-418d-b552-70cc258e9e09	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- dsi	\N	2021-07-26 07:34:57.512+00	2021-07-30 20:13:28.125+00	2021-07-30 20:23:28.125+00	t	t	\N
59285a67-246a-4249-b769-a624f8d1da2c	68db45ca-29ad-483d-b8e5-52b629d24d80	ed051871-6799-4926-ba1f-569ef914f007	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-07-26 07:36:08.129+00	2021-07-30 20:20:35.653+00	2021-07-30 20:30:35.653+00	t	t	\N
72d7f846-dd99-4960-a6c0-c3b1adbca795	68db45ca-29ad-483d-b8e5-52b629d24d80	df880bcf-0b60-45f3-bc80-571f4732f13e	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-07-26 07:36:08.129+00	2021-07-30 21:05:57.472+00	2021-07-30 21:16:07.723+00	t	t	\N
8075f451-75fc-45ac-af09-6fb5e8fd92b0	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 11:44:47.363+00	2021-07-30 20:07:44.004+00	2021-07-30 20:17:44.004+00	t	t	\N
f22cbe5a-53a0-4b61-b7b6-4840e9793a56	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-07-30 20:33:04.717+00	2021-07-30 20:33:38.019+00	2021-07-30 20:36:20.672+00	t	t	\N
9e1c2728-7472-44df-9a2f-830ae097fd2d	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 222 - moyennement urgent	\N	2021-07-30 20:42:02.429+00	2021-07-30 20:42:02.429+00	2021-07-30 20:43:13.245+00	t	t	\N
6e4d5814-65bc-46bf-ad8e-93e82762abdb	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-27 08:14:46.015+00	2021-07-30 20:42:10.731+00	2021-07-30 20:52:10.731+00	t	t	\N
978cd4db-24fe-4228-9655-35707168ffe0	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-27 08:20:56.42+00	2021-07-30 20:43:55.43+00	2021-07-30 20:53:55.43+00	t	t	\N
5b7719bb-c8b0-43a2-ae73-f8772e2add17	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - moyennement urgent	\N	2021-07-27 09:27:38.671+00	2021-07-30 20:56:51.487+00	2021-07-30 21:06:51.487+00	t	t	\N
c150d823-8c9b-4057-b01a-b35c0fb0e519	68db45ca-29ad-483d-b8e5-52b629d24d80	340853e7-2186-4e37-8552-4716902fe18b	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny imprimante - dsi - tres urgent	\N	2021-07-19 11:03:31.245+00	2021-07-27 07:14:27.309+00	2021-07-27 07:24:27.309+00	t	t	\N
9c273e08-6860-4864-9f18-ce9751fca289	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-07-19 07:11:38.37+00	2021-07-21 12:06:38.454+00	2021-07-21 12:09:33.932+00	f	t	\N
1ed1dab9-2a54-4599-84a6-7c3eeff38a9c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 222 - pas urgent	\N	2021-07-30 20:47:57.914+00	2021-07-30 20:47:57.914+00	2021-07-30 20:49:49.271+00	t	t	\N
c998c1a7-da90-4173-81a1-f8c4c0db2811	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:07:18.307+00	2021-07-30 21:07:18.307+00	2021-07-30 21:07:34.178+00	t	t	\N
ff398c4f-72c4-431a-8f21-a1ceaa4afc8d	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:07:51.512+00	2021-07-30 21:07:51.512+00	2021-07-30 21:08:06.793+00	t	t	\N
c0324e16-7c57-4495-b986-90601e57df21	237451bc-067e-4c61-ae8d-9c5fe93b49ce	de54e287-47c1-48ce-8f23-4571a23db735	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	reinstaller pilote carte reseau	2021-08-20 11:54:07.506+00	2021-08-21 12:02:24.681+00	2021-08-21 12:12:24.681+00	f	t	\N
3b84549a-5dde-4375-9cb7-41a59cc6ac7c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	3a07a184-27f1-4ff0-88e5-4abdccc42c38	ND	\N	2021-08-17 10:00:00+00	2021-08-21 12:38:06.698+00	2021-08-21 12:48:06.698+00	t	t	\N
bba2774e-9aa9-40c6-ac79-af4172a8bcc7	68db45ca-29ad-483d-b8e5-52b629d24d80	c15f52be-ec88-4942-bb1f-2ede20f949c0	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	d6924ae1-1b7b-4c4e-8698-5178eda55a68	ND	\N	2021-08-16 19:05:32.664+00	2021-08-16 19:05:32.664+00	2021-08-16 19:06:00.296+00	f	t	\N
6262f72c-7084-4e1c-afa5-e8c5cad50ac5	68db45ca-29ad-483d-b8e5-52b629d24d80	19ab927b-04cf-45ef-a762-defd3b87613f	7ebec45d-2197-4d91-87a7-7998845016cd	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	Resoudre probleme : plantage ordinateur -- 111	reinstallation	2021-07-26 07:36:08.129+00	2021-07-30 21:05:08.646+00	2021-07-30 21:15:37.598+00	t	t	\N
d7728fd0-6512-4970-85ef-c865cec97934	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	bba2774e-9aa9-40c6-ac79-af4172a8bcc7	ND	\N	2021-08-27 05:00:00+00	\N	\N	f	f	\N
26193970-e7c0-4119-971e-650c30d23f15	68db45ca-29ad-483d-b8e5-52b629d24d80	61c2bb22-0d0f-4c72-b873-6d35e809d988	1187acbb-861b-421b-9070-6f0b1b34e8ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	debranche cable;eteindre switch	2021-07-27 08:21:15.228+00	2021-07-30 21:07:31.335+00	2021-07-30 21:17:31.335+00	t	t	\N
13057b2e-7d71-4b34-bfa7-53b7baa49603	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-07-30 21:19:43.093+00	2021-07-30 21:19:43.093+00	2021-07-30 21:20:19.303+00	t	t	\N
62006feb-4c7b-4587-871c-83c347fb251b	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-07-30 20:59:05.19+00	2021-07-30 21:11:57.856+00	2021-07-30 21:21:57.856+00	f	t	\N
154aaf87-9619-4d3d-ba7b-570c9513d3b8	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-03 12:41:57.381+00	2021-08-03 12:41:57.381+00	2021-08-03 12:42:49.374+00	t	t	\N
d657a107-5f43-4ba6-ad1d-01e6fda0cd3a	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-04 08:53:09.644+00	2021-08-04 08:53:09.644+00	2021-08-04 08:53:29.811+00	t	t	\N
bf6529d7-2c88-4e96-b272-f4eaf7e4ace8	68db45ca-29ad-483d-b8e5-52b629d24d80	4bcdac56-2b9c-4d97-a15f-86033e6ec682	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:11.765+00	2021-08-12 08:29:37.19+00	2021-08-12 08:39:37.19+00	f	t	\N
7d056629-ecaa-411e-bf3c-28bd66ddf662	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-13 06:11:12.146+00	2021-08-13 06:11:12.146+00	2021-08-13 06:11:37.935+00	t	t	\N
804b8190-beae-4632-b83b-26448d57fcf5	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-16 07:24:17.936+00	\N	\N	f	f	\N
3d85a9ef-fc44-4f35-8c9d-954c09b3c040	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-16 08:00:00+00	\N	\N	f	f	\N
3a07a184-27f1-4ff0-88e5-4abdccc42c38	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	9c273e08-6860-4864-9f18-ce9751fca289	ND	\N	2021-08-17 05:00:00+00	2021-08-17 05:00:00+00	2021-08-16 12:37:32.125+00	f	t	\N
94bb90a6-c2b4-474b-86a7-a24d108ac848	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	bba2774e-9aa9-40c6-ac79-af4172a8bcc7	ND	\N	2021-08-20 05:00:00+00	2021-08-20 05:00:00+00	2021-08-17 05:48:24.925+00	f	t	\N
94f78e88-8392-4525-b4eb-56ea6ea1c35d	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	94bb90a6-c2b4-474b-86a7-a24d108ac848	ND	\N	2021-08-21 05:00:00+00	\N	\N	f	f	\N
16ff5c5e-3842-4a1e-86a2-d2afb02b8b1d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-20 05:00:00.632+00	2021-08-20 09:34:02.502+00	2021-08-20 09:44:02.502+00	t	t	\N
0e0e905a-8f12-440e-addc-e3da75271388	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-20 08:00:00.354+00	2021-08-20 10:30:50.964+00	2021-08-20 10:40:50.964+00	f	t	\N
6a7b9926-76b7-4c1b-81a9-1bf5e07fe0b0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	a768355e-3cd2-497c-b579-d4e184b61298	0e0e905a-8f12-440e-addc-e3da75271388	ND	\N	2021-08-20 05:00:00.052+00	2021-08-20 10:39:35.099+00	2021-08-20 10:49:35.099+00	f	t	\N
35743e44-8c05-45e9-a02a-3b27cd5a88ec	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-21 13:03:34.945+00	2021-08-21 13:03:34.945+00	2021-08-21 13:04:00.48+00	t	t	\N
c07f7d51-c337-404d-ae77-4858f9ff23d2	237451bc-067e-4c61-ae8d-9c5fe93b49ce	643a229e-ad6b-4087-be70-a4d8e624f325	7ebec45d-2197-4d91-87a7-7998845016cd	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 222	\N	2021-08-24 05:00:00+00	2021-08-23 06:13:49.415+00	2021-08-23 06:23:49.415+00	t	t	\N
2cbae466-36ad-4391-aa48-b70b0ce9f3b2	237451bc-067e-4c61-ae8d-9c5fe93b49ce	296f4a1a-0aaf-4fb9-ac73-883ddba5e45b	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	Resoudre probleme : plantage ordinateur -- 111	sauvegarde donne;reinstallation	2021-08-26 05:00:00+00	2021-08-26 05:00:00+00	2021-08-23 06:03:39.499+00	t	t	\N
41fa4608-ea97-42f7-a399-7dd62194f9a5	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-20 05:00:00.281+00	2021-08-23 06:18:06.217+00	2021-08-23 06:28:06.217+00	f	t	\N
1fc3d63d-3eb3-4c85-9b60-fe5311215ae7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	79480380-65cb-41a8-a3ec-16299a266db2	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-23 10:36:52.081+00	2021-08-23 10:37:34.72+00	2021-08-23 10:37:40.735+00	t	t	\N
a4794380-66b6-4b86-ac49-f678be0dad22	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-08-23 10:59:52.358+00	2021-08-23 10:50:10.897+00	2021-08-23 11:00:10.897+00	f	t	\N
55d10d6d-da11-4557-baf3-54b22ab18fb1	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-20 09:11:38.95+00	2021-08-31 20:15:20.16+00	2021-08-31 20:25:20.16+00	f	t	\N
bf132203-d1b0-45e2-b1d5-8ff3b2e3074e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-24 06:00:00.076+00	\N	\N	f	f	\N
738bf9df-d237-4851-af97-78f55da87869	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	3d0ebb5e-a617-4e68-a49e-d953e10ce1af	ND	\N	2021-08-24 06:00:00.257+00	2021-08-24 05:26:44.817+00	2021-08-24 05:36:44.817+00	t	t	\N
3d0ebb5e-a617-4e68-a49e-d953e10ce1af	68db45ca-29ad-483d-b8e5-52b629d24d80	b4a0f9e7-79a1-4b47-9c62-27700f6d708b	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	2021-08-24 05:22:05.92+00	2021-08-24 05:36:58.531+00	t	t	\N
3c3fd182-bba5-4e57-817a-1d18b02e7568	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-23 08:00:00.44+00	2021-09-16 10:59:20.99+00	2021-09-16 11:09:20.99+00	t	t	\N
e70a7b63-bf6a-4c40-93f4-c07ce52b9363	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	2021-09-20 14:31:40.175+00	2021-09-20 14:41:40.175+00	t	t	\N
0a1aa34a-1971-4718-bc95-87eca78bf0c3	68db45ca-29ad-483d-b8e5-52b629d24d80	caaa5cb2-bf3b-4ee9-9480-8e0d6f743300	7648255d-5019-418d-b552-70cc258e9e09	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-08-10 05:00:00+00	2021-09-27 06:06:37.627+00	2021-09-27 06:16:37.627+00	t	t	\N
9c29c97f-7498-41ac-981b-928f3063854d	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:22.866+00	2021-09-20 14:43:02.623+00	2021-09-20 14:43:40.663+00	t	t	\N
f8d1d361-bbe5-401b-9b60-965415950563	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-04 08:45:53.819+00	2021-09-20 14:45:41.922+00	2021-09-20 14:45:56.786+00	t	t	\N
45fea0c1-d9a6-47f1-b94b-eba8e00b2247	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-20 09:12:47.752+00	2021-09-20 14:46:43.983+00	2021-09-26 16:43:44.481+00	f	t	\N
a98cb359-3692-4c86-90a0-92b48a8cb786	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-21 05:00:00+00	2021-10-14 06:25:42.027+00	2021-10-14 07:04:06.167+00	f	t	\N
f4363941-6517-45e8-b629-10baec64305a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-23 07:00:00+00	2021-10-14 06:38:47.451+00	2021-10-14 07:04:44.325+00	f	t	\N
43412bb9-3255-40bb-8784-5b300dfdde52	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	41fa4608-ea97-42f7-a399-7dd62194f9a5	ND	\N	2021-08-24 05:00:00+00	2021-10-14 06:43:53.995+00	2021-10-14 07:05:26.894+00	f	t	\N
ee204749-0c4d-479e-be91-5797f62a90cf	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-20 11:50:25.459+00	2021-09-27 06:29:09.571+00	2021-10-14 07:02:28.114+00	f	t	\N
942fb4e2-9dee-4497-b4ca-02d547b16fcf	68db45ca-29ad-483d-b8e5-52b629d24d80	44df0de9-cc3d-4b93-a19c-b6cca4fa75c8	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-08-24 06:00:00.128+00	2021-08-24 05:53:31.233+00	2021-08-24 06:03:31.233+00	f	t	\N
1bd4d366-6a86-4da0-91a3-0aa751ae7ffe	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-24 06:00:00+00	2021-08-24 06:04:04.675+00	2021-08-24 06:14:04.675+00	f	t	\N
7e708437-a582-4522-8453-0ed9305d108e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	1bd4d366-6a86-4da0-91a3-0aa751ae7ffe	ND	\N	2021-08-24 07:00:00.768+00	2021-08-24 06:05:52.662+00	2021-08-24 06:15:52.662+00	f	t	\N
4bd9dedb-2d4e-4294-87cf-e1ed597d76ab	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	7e708437-a582-4522-8453-0ed9305d108e	ND	\N	2021-08-25 07:00:00+00	\N	\N	f	f	\N
65f7749c-5454-4c25-9620-1f1e7a40028c	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , autre - 111 - pas urgent	\N	2021-08-24 06:17:56.051+00	2021-08-24 06:08:12.837+00	2021-08-24 06:18:12.837+00	t	t	\N
b59fff1b-5292-4ebf-8549-dca53994c356	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-09-16 05:00:00+00	2021-09-16 07:17:41.538+00	2021-09-17 11:16:50.542+00	t	t	routeur
492a2c81-3ede-4a95-9964-d465da82578f	237451bc-067e-4c61-ae8d-9c5fe93b49ce	5ec09807-a138-4b08-acd1-bfb1a1833ecf	48aa0db2-7290-4fda-959f-c77fe815b6ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	redemarrer PC	2021-08-24 12:18:26.048+00	2021-08-24 12:11:15.741+00	2021-08-24 12:21:15.741+00	f	t	\N
b09eb5a9-6408-43cd-a2fc-89380d38e4e7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-30 12:14:36.781+00	2021-08-30 12:17:36.677+00	2021-08-30 12:27:36.677+00	f	t	\N
4fdaf9cb-e097-4a49-ba18-562d039c126d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-08-30 05:00:00+00	2021-08-30 12:20:17.082+00	2021-08-30 12:30:17.082+00	t	t	\N
905459f0-db0c-4c4e-9a2a-c839c07cdfed	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny imprimante - 111 - moyennement urgent	\N	2021-08-31 07:58:56.455+00	2021-08-31 19:17:48.623+00	2021-08-31 19:27:48.623+00	t	t	\N
1ed1f784-ccbe-4480-9947-e8b0bc4c5186	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-09-01 11:00:00+00	2021-09-01 12:23:45.253+00	2021-09-01 12:33:45.253+00	t	t	\N
6cc549f8-441f-4dee-97fd-f2dbca548a2f	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-06 07:41:34.82+00	\N	\N	f	f	\N
c86f913f-f6c8-4ed6-a3e5-37fb9169611b	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-07-23 05:00:00+00	2021-09-06 12:28:18.66+00	2021-09-06 12:38:18.66+00	t	t	\N
58743746-39bf-40de-96da-286be279e40e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-09-07 08:00:00.802+00	\N	\N	f	f	\N
dd583ece-897c-4137-9878-b59abddb2a6e	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-07 13:00:51.196+00	\N	\N	f	f	\N
7ce19296-100a-4308-9082-891b21dc46d4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	1187acbb-861b-421b-9070-6f0b1b34e8ac	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	ND	\N	2021-09-15 18:00:00.528+00	2021-09-15 16:55:00.863+00	2021-09-15 17:05:00.863+00	t	t	\N
253d3f18-be3b-4746-b677-6d2cdc0b3f11	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-08-31 06:43:20.994+00	2021-08-31 19:05:35.652+00	2021-09-20 14:41:54.509+00	t	t	\N
7fe48b7d-b125-4aaa-a521-de98b6fa2d8e	68db45ca-29ad-483d-b8e5-52b629d24d80	c76acbcd-0e40-42c4-aeb1-e046aebae494	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	Resoudre probleme : plantage ordinateur -- 111	\N	2021-08-04 11:00:00+00	2021-09-26 16:32:40.159+00	2021-09-26 16:42:40.159+00	t	t	\N
340824e8-5bf2-48c8-bc87-f4acc05d2537	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-29 12:09:49.271+00	2021-09-29 12:00:37.398+00	2021-09-29 12:10:37.398+00	t	t	\N
ad7af6c6-dff5-4a7c-86e6-b4882a5d8f2a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-29 12:13:31.77+00	2021-09-29 12:04:32.426+00	2021-09-29 12:14:32.426+00	t	t	\N
c9cbaeef-0c02-4e94-992c-e121cc49cc33	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny imprimante - 111 - pas urgent	\N	2021-10-05 06:56:05.171+00	2021-10-05 06:49:36.852+00	2021-10-05 06:59:36.852+00	f	t	\N
65e56149-c55e-4bf9-83f4-3289f0fe6519	68db45ca-29ad-483d-b8e5-52b629d24d80	df6eb9c0-3378-49ac-8d75-ca54527592d6	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-10-05 07:06:39.607+00	2021-10-05 06:56:55.95+00	2021-10-05 07:06:55.95+00	t	t	\N
b6806e49-cab7-4dd9-905b-6a09214ed7c4	68db45ca-29ad-483d-b8e5-52b629d24d80	\N	7ebec45d-2197-4d91-87a7-7998845016cd	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-10-04 05:00:00+00	2021-10-05 07:59:39.45+00	2021-10-05 08:09:39.45+00	t	t	windows 10
e6b8f655-1dab-4f4d-ac38-097c0fd86ae7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-10-06 07:00:00.846+00	2021-10-06 09:32:33.172+00	2021-10-06 09:42:33.172+00	f	t	imprimante
a5cdbb41-1edc-4882-b3a6-6023d960891d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-07 16:17:58.771+00	2021-10-07 16:09:29.01+00	2021-10-07 16:19:29.01+00	t	t	\N
9adcc540-4e3f-4a47-ae67-0b87098d307a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	122b77f6-ccd7-4cc5-a014-74858ba0e7d4	\N	ND	\N	2021-10-07 07:00:00.616+00	2021-10-07 16:16:46.73+00	2021-10-07 16:26:46.73+00	t	t	Serveur
e9fc36fb-0b53-483a-8312-404b686955cb	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-10-08 05:00:00+00	2021-10-08 08:59:57.442+00	2021-10-08 09:09:57.442+00	t	t	windows 7
61c3ff04-734a-4ff7-8874-b2ca03453675	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	55d10d6d-da11-4557-baf3-54b22ab18fb1	ND	\N	2021-09-01 05:00:00+00	2021-10-14 07:10:12.474+00	2021-10-14 07:20:12.474+00	t	t	\N
b589eed5-f285-4a99-aa8a-fcc8a1835ba8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-08-27 08:43:24.884+00	2021-10-14 07:07:57.469+00	2021-10-14 07:26:37.026+00	f	t	\N
b6858aa7-23d2-4cea-ba55-354633e53ea7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	cf6266a8-22f0-43ee-89e0-8e9f38f22dde	\N	ND	\N	2021-09-17 05:00:00+00	2021-10-14 07:16:54.957+00	2021-10-14 07:26:54.957+00	f	t	
7e8e0739-3838-4f8e-bf98-be7c21e627fa	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-10-08 06:42:44.414+00	2021-10-20 16:29:26.55+00	2021-10-20 16:39:26.55+00	t	t	\N
5785df06-f838-4d2f-b41f-66ecbba351be	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-30 12:20:32.031+00	2021-10-14 07:11:32.966+00	2021-10-14 07:31:19.154+00	t	t	\N
7fa569e6-4464-410c-986d-8da00d39c5dd	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-08-31 08:22:20.724+00	2021-10-14 07:06:39.111+00	2021-10-14 07:16:39.111+00	f	t	\N
1f935d43-0715-4e49-ac45-26b90f5c13c8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	492a2c81-3ede-4a95-9964-d465da82578f	ND	\N	2021-08-25 13:00:00+00	2021-10-14 06:45:28.084+00	2021-10-14 07:18:39.898+00	f	t	\N
4c06194a-4ebd-4a3b-864b-39fc70900dbd	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-08-27 08:34:20.238+00	2021-10-14 06:49:45.249+00	2021-10-14 07:24:07.337+00	f	t	\N
635c0368-f40a-41b3-8284-adeedf08e035	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-10 14:22:57.405+00	2021-10-14 07:12:47.02+00	2021-10-14 07:23:44.687+00	t	t	\N
d1af50df-10f5-4373-80f2-55494a23071e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-27 08:48:48.416+00	2021-10-14 07:09:29.482+00	2021-10-14 07:28:13.141+00	f	t	\N
9af07285-112b-4d06-8bad-31f3ed7483f4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	122b77f6-ccd7-4cc5-a014-74858ba0e7d4	\N	ND	\N	2021-10-07 08:00:00+00	2021-10-15 08:57:28.353+00	2021-10-15 08:58:04.512+00	t	t	Serveur 2
abfa997b-4dbb-4fa7-8136-e1e7b5502d7a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-29 13:13:07.761+00	2021-10-14 07:31:32.162+00	2021-10-14 17:31:34.589+00	f	t	\N
7644aa4d-3a1d-409a-aa57-19616a76dbd5	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-30 11:46:49.655+00	2021-10-14 17:31:15.887+00	2021-10-15 08:57:50.44+00	f	t	\N
40438add-8045-4799-aab5-ddf625a26458	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-08 06:44:07.52+00	2021-10-21 07:31:12.299+00	2021-10-21 07:36:27.716+00	t	t	\N
249d139c-5c69-4a43-99eb-6222cf1a46d7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-08 07:56:23.832+00	\N	\N	f	f	\N
3d251eea-a701-4486-8f86-3c8927753672	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	122b77f6-ccd7-4cc5-a014-74858ba0e7d4	\N	ND	\N	2021-10-08 08:00:00.85+00	2021-10-08 07:03:44.438+00	2021-10-08 07:13:44.438+00	t	t	routeur , AP
68251ade-5ba9-49e2-997f-c2328b47a5a9	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 08:53:35.276+00	\N	\N	f	f	\N
d2687179-5582-4591-8e43-a8dcff96f90c	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 08:58:01.534+00	\N	\N	f	f	\N
2ee20446-1c68-4b75-96f2-36c71ad32b38	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , autre - 111 - tres urgent	\N	2021-10-12 08:58:41.699+00	\N	\N	f	f	\N
8ee0c06b-c012-48a2-8de2-919e8047e99b	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 08:59:51.679+00	\N	\N	f	f	\N
26be7518-8195-4a8d-94ac-54411dec3925	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 08:59:51.723+00	\N	\N	f	f	\N
9241c2cd-b328-4e45-8332-aee84d7012b3	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 08:59:51.742+00	\N	\N	f	f	\N
4f102ba0-2b26-407d-a9dc-7292504a4e83	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-12 09:00:49.677+00	\N	\N	f	f	\N
edbd33b9-d11e-409e-b971-dccd250a43c4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-13 05:45:16.873+00	\N	\N	f	f	\N
60e33233-d41e-4c99-8200-636e117c53f9	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-13 05:45:36.544+00	\N	\N	f	f	\N
3b0be3b4-6a58-42a3-94da-b52afd5e3189	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-13 05:48:41.317+00	\N	\N	f	f	\N
1fba885e-f096-4d8f-a7a1-591e68a22fde	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 06:32:02.404+00	\N	\N	f	f	\N
26deb718-11ae-4abb-aa08-7877cc2f75ca	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 07:32:25.65+00	\N	\N	f	f	\N
c52d09c4-005a-4e1d-97a6-1eb68d096ba5	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 07:33:17.555+00	\N	\N	f	f	\N
201651c3-ec9e-4650-a1b7-ce23d1bdf195	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 07:38:54.135+00	\N	\N	f	f	\N
115e4dc8-1db2-4450-b223-cbd5eb1dd95e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 08:25:11.059+00	\N	\N	f	f	\N
f79ab56d-8797-4769-8275-b4ef476737fe	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny imprimante - 111 - pas urgent	\N	2021-10-13 07:29:45.231+00	\N	\N	f	f	\N
555d5f80-d320-4f61-a539-b2ca7b80394f	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - dsi - pas urgent	\N	2021-10-13 07:40:23.37+00	\N	\N	f	f	\N
7c8654a3-9c27-4622-865c-7dc305b21270	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - dsi - pas urgent	\N	2021-10-13 07:40:23.862+00	\N	\N	f	f	\N
f33a9bba-32fa-4198-9301-5afa419bc3ef	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	62255b2b-1028-4817-848b-2be1c74bd2fb	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - dsi - pas urgent	\N	2021-10-13 07:40:24.279+00	\N	\N	f	f	\N
95067fec-2977-4b23-a7aa-e69493a3f472	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-13 09:32:17.958+00	\N	\N	f	f	\N
face10e6-58f2-4c55-ab45-63cb2a29fed1	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 09:32:36.629+00	\N	\N	f	f	\N
0e93f1e8-9baf-471e-bede-b315724df404	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 09:33:51.799+00	\N	\N	f	f	\N
fc75ff77-10bb-4fb6-bd91-0c8e45f057e1	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-13 09:36:05.082+00	\N	\N	f	f	\N
eb460324-82db-4a70-8d26-e96382ae57cb	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , autre - 111 - tres urgent	\N	2021-10-17 13:05:13.758+00	\N	\N	f	f	\N
cce075e4-9c12-4a74-b3e5-de1f5351f55d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-08-27 08:09:37.89+00	2021-10-14 06:47:51.444+00	2021-10-14 07:21:59.102+00	t	t	\N
7ef835a1-d2d1-4703-9340-9632a8922eec	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a un notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-09-10 14:24:39.996+00	2021-10-14 07:14:39.961+00	2021-10-14 07:24:44.797+00	t	t	\N
a3231665-40ef-4b21-8b7c-160412d759f3	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-15 08:56:32.604+00	2021-10-15 08:46:51.054+00	2021-10-15 08:56:51.054+00	t	t	\N
7849bf16-458c-4175-aa9d-44e0cc1831ef	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-16 12:21:39.814+00	\N	\N	f	f	\N
04011c6a-5d9f-407c-9cdf-c376be7d6a2a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-18 09:20:58.066+00	\N	\N	f	f	\N
76f322dd-46cc-43d6-bddf-c39f88efa996	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-18 09:28:26.415+00	\N	\N	f	f	\N
cd8acdb9-9662-4bfc-b5c5-465a70384b49	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-19 08:45:23.853+00	\N	\N	f	f	\N
295a424b-f1c7-4e51-ab92-377d88ca2ee8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-19 09:13:22.849+00	\N	\N	f	f	\N
a3049b3d-7772-4fc2-91b8-906a40d98ebb	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-19 09:16:54.343+00	\N	\N	f	f	\N
89ee5542-5549-439d-955c-5df047a3cc94	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny imprimante - 111 - pas urgent	\N	2021-10-08 07:54:24.396+00	2021-10-22 08:10:23.872+00	2021-10-22 08:20:23.872+00	t	t	\N
3b62a967-bbca-4189-be1e-7ada77c502bf	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-08 07:50:47.109+00	2021-10-22 07:17:24.959+00	2021-10-22 07:17:35.656+00	f	t	\N
45b90e74-d163-46cf-b0b6-281e9a022403	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-08 07:56:04.575+00	2021-10-22 09:09:51.028+00	2021-10-22 09:15:09.137+00	f	t	\N
119fd3d6-c8e3-4e34-8ce3-938809cdcd34	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-19 09:18:24.002+00	\N	\N	f	f	\N
a1bea9c8-03f5-4534-abb8-6f257cab8069	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-20 16:28:29.38+00	2021-10-20 16:21:38.957+00	2021-10-20 16:31:38.957+00	t	t	\N
e319b5e0-9f6b-4399-9218-2f81e9202896	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-20 09:24:01.202+00	2021-10-20 16:23:31.232+00	2021-10-20 16:33:31.232+00	t	t	\N
3a123c3d-c6f1-4ec6-a1b8-256b3167f854	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-20 16:36:21.674+00	2021-10-20 16:26:43.864+00	2021-10-20 16:36:43.864+00	t	t	\N
3bb336f0-591d-474e-8901-ac307763b0cb	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - pas urgent	\N	2021-10-21 07:25:13.743+00	2021-10-21 07:26:31.833+00	2021-10-21 07:30:59.931+00	t	t	\N
8715ab78-2240-4476-9abe-e9a5f6e75069	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-21 07:47:27.781+00	\N	\N	f	f	\N
1a197e2e-17c8-4f46-83b4-aab71067cb94	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-21 07:34:25.341+00	2021-10-21 07:38:06.114+00	2021-10-22 07:10:02.541+00	f	t	\N
8358d6e2-7108-4f04-8078-6664fc551ff0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-08 06:54:44.426+00	2021-10-22 07:15:33.435+00	2021-10-22 07:15:42.115+00	t	t	\N
886e2b38-8923-4b2a-8f94-19852a5d5ae5	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , autre - 111 - pas urgent	\N	2021-10-22 08:09:19.874+00	2021-10-22 08:05:10.906+00	2021-10-22 08:15:10.906+00	t	t	\N
e0fc802c-b26b-45d0-8cc7-db265b52ccb1	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-10-22 07:18:01.496+00	2021-10-22 08:06:41.476+00	2021-10-22 08:16:41.476+00	t	t	\N
f0ce4ae6-2a46-4df9-bf26-157235db276d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-21 07:52:37.22+00	2021-10-22 08:08:59.952+00	2021-10-22 08:18:59.952+00	t	t	\N
6c06a6d0-6a74-4aed-a994-f49977959685	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , autre - 111 - pas urgent	\N	2021-10-22 08:21:38.216+00	2021-10-22 08:10:56.967+00	2021-10-22 08:21:04.556+00	t	t	\N
1b990319-014c-45a0-91ef-85b895a04404	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny imprimante - 111 - tres urgent	\N	2021-10-22 08:19:43.547+00	2021-10-22 08:11:11.672+00	2021-10-22 08:21:11.672+00	t	t	\N
e4487d33-36ea-43c3-9973-f08d90e34473	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-22 08:21:42.591+00	2021-10-22 08:12:16.824+00	2021-10-22 08:22:16.824+00	t	t	\N
56ce53ad-b641-4d0a-b30b-96cde2bd206b	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user1 , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-22 08:21:56.008+00	2021-10-22 08:23:20.549+00	2021-10-22 09:15:26.974+00	f	t	\N
22fb8302-5f61-4b04-96a5-d2162a2c29a3	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-22 09:17:18.97+00	2021-10-22 09:13:41.49+00	2021-10-22 09:23:41.49+00	f	t	\N
0c58a5dc-370d-4218-914e-cdc8f5da4427	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - tres urgent	\N	2021-10-22 09:24:27.761+00	2021-10-22 09:14:47.801+00	2021-10-22 09:24:47.801+00	f	t	\N
09af2771-01f3-46f9-b1b0-885728c347bf	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	e91c30c7-8e08-4c47-84ba-705e9091ae8e	ND	\N	2021-10-22 12:00:00+00	2021-10-22 09:20:16.216+00	2021-10-22 09:32:45.336+00	t	t	
e91c30c7-8e08-4c47-84ba-705e9091ae8e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	0c58a5dc-370d-4218-914e-cdc8f5da4427	ND	\N	2021-10-22 10:00:00.199+00	2021-10-22 09:19:38.612+00	2021-10-22 09:35:59.018+00	t	t	
21287bc7-0bb7-4bac-9e56-77a922bb6a1d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	\N	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	\N	 reponse a une notification de user , tsy mandeha ny connexion - 111 - moyennement urgent	\N	2021-10-25 09:11:22.787+00	2021-10-25 09:01:42.144+00	2021-10-25 09:11:42.144+00	f	t	\N
99cb2741-16f2-44d0-9a20-831b4fc3fc19	237451bc-067e-4c61-ae8d-9c5fe93b49ce	d771003d-3fd3-4d84-a59a-c2551aacc5d2	\N	6b3b2f07-253a-4066-b5ca-96d93a149149	a768355e-3cd2-497c-b579-d4e184b61298	21287bc7-0bb7-4bac-9e56-77a922bb6a1d	Resoudre probleme : Matériel endomager -- 111	\N	2021-10-25 10:00:00.386+00	2021-10-25 09:05:28.957+00	2021-10-25 09:15:28.957+00	t	t	
\.


--
-- TOC entry 3294 (class 0 OID 16732)
-- Dependencies: 212
-- Data for Name: intervention_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intervention_type (num_intervention_type, libelle_intervention_type, code_intervention_type) FROM stdin;
aa7bba1c-3a84-4ab7-8347-61ee28cc4ab6	reponse a une notification	REP_NOTIF
cf6266a8-22f0-43ee-89e0-8e9f38f22dde	installation	INST
a768355e-3cd2-497c-b579-d4e184b61298	Suite d' une intervention	SUITE_INT
69d35de2-3fc5-4ef8-9b3e-3c139737dd87	Assistance	AST
122b77f6-ccd7-4cc5-a014-74858ba0e7d4	Configuration	CONFIG
\.


--
-- TOC entry 3290 (class 0 OID 16489)
-- Dependencies: 204
-- Data for Name: lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lieu (num_lieu, libelle) FROM stdin;
6b3b2f07-253a-4066-b5ca-96d93a149149	111
4d1287b6-5268-4cf7-a2f8-1deab7c474fc	222
62255b2b-1028-4817-848b-2be1c74bd2fb	dsi
\.


--
-- TOC entry 3296 (class 0 OID 16748)
-- Dependencies: 214
-- Data for Name: materiel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materiel (num_materiel, num_materiel_type, libelle_materiel, num_lieu) FROM stdin;
1187acbb-861b-421b-9070-6f0b1b34e8ac	1c70ea9d-84ec-4929-9ca3-68aff3bd6027	switch1	6b3b2f07-253a-4066-b5ca-96d93a149149
48aa0db2-7290-4fda-959f-c77fe815b6ac	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_1	6b3b2f07-253a-4066-b5ca-96d93a149149
7648255d-5019-418d-b552-70cc258e9e09	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_3	62255b2b-1028-4817-848b-2be1c74bd2fb
7ebec45d-2197-4d91-87a7-7998845016cd	d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordi_2	4d1287b6-5268-4cf7-a2f8-1deab7c474fc
\.


--
-- TOC entry 3295 (class 0 OID 16740)
-- Dependencies: 213
-- Data for Name: materiel_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materiel_type (num_materiel_type, libelle_materiel_type) FROM stdin;
d00fb4e6-5b9f-459a-864b-fd29ddd63734	ordinateur
1c70ea9d-84ec-4929-9ca3-68aff3bd6027	switch
\.


--
-- TOC entry 3302 (class 0 OID 16967)
-- Dependencies: 226
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (num_message, num_app_user_envoyeur, date_envoie, contenu_message, is_annonce) FROM stdin;
4ae5c698-2eae-4a09-a409-430a0fa5105a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:27:46.616101+00	hello	f
ede1ad34-5a79-4330-a7eb-37a16ba35e02	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:35:08.962089+00	hello	f
dec5db1e-ad87-493c-be87-6d4a8a073283	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:42:21.770159+00	hello	f
24d61b11-f755-4dbc-b142-e2055d3832af	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:45:48.392788+00	hello	f
0b825302-1675-40bf-8098-b73e40f486d8	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:47:53.464711+00	hello	f
c2f97da0-9de6-4420-a247-4f31a82036ae	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:48:18.927888+00	hello	f
977db994-c5a7-4a91-959b-173cb8658e4c	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:48:55.692924+00	hello	f
d911ad9f-8280-424c-99e6-3f793ec3ac25	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:50:46.181266+00	hello	f
0ef3bb98-1026-4a36-9e2f-7845f0473256	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:51:42.214684+00	hello	f
5e09dfd2-512a-465b-bf4d-b7decf6a53e6	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:54:06.211046+00	hello	f
adb286b9-17ff-400e-ac96-443ea1a6718c	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 19:56:22.0276+00	hello	f
bfa1aa5d-f121-4c7d-bddc-6fd2a686f4e5	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:00:49.224421+00	ehllo	f
62317c6d-4300-4358-994d-31755f65aac3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:02:09.416607+00	hello	f
056401e9-273a-4759-bc5f-c029031b2e77	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:02:37.687627+00	hello	f
a7ce7e30-cbdd-40c4-9056-56be2f324642	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:02:47.549713+00	hello	f
75170a11-6712-497f-977e-bf605fca3891	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:03:14.973147+00	hello	f
d406d654-30fe-4d87-8949-91b94372ec46	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:04:04.420528+00	heoll	f
d39db19b-f868-4376-a0a9-13e30b3faad3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:04:48.143737+00	hello	f
5d9ac45d-f18b-4037-9641-106daf30bf34	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:05:37.954816+00	hello	f
4ffc367c-6424-4372-ac25-665d768377d3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:07:09.706316+00	hello	f
5b069ebd-fffe-485e-bce0-76ac9456d42c	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:07:22.261789+00	hello	f
b167b1d1-db28-422f-a63f-19251751b811	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:07:28.622791+00	sup	f
0e24a6e1-1dfb-4ae1-bcc7-99b69413f1ce	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:08:38.370952+00	hello	f
4767b3e1-7dff-4e76-aecb-c4b548bf0f7f	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-18 20:08:44.399508+00	hi	f
f7ec2082-0185-4058-b6f1-09ae393fe14a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:09:00.796844+00	wassup	f
defa4d7b-973a-4a3a-b54c-5d6df861d928	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-18 20:09:05.276364+00	late	f
fc82da7d-b104-43e1-bcf9-7095f8c5bbef	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:09:11.281601+00	ok night	f
c3c00af9-a357-4b7d-b500-d3a7fd3c871e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-18 20:09:19.080564+00	night dude	f
eb9e0f35-9e5b-4849-9498-b26f20249e67	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:09:58.059572+00	hello	f
b43bb244-f42b-4c05-8b9e-9048960c16a7	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:10:25.991382+00	hello	f
5330ee33-88d1-418e-a3d7-ce1a8c644eb8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-18 20:10:29.094518+00	hi	f
d124bf08-3738-49e9-b486-00c708332066	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:10:33.119558+00	wassup	f
802482b2-2294-415c-8a72-300afd88a610	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-18 20:10:37.818188+00	let me sleep	f
a78ca851-a399-4b1d-81e7-7b357e611fdc	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-18 20:10:41.177677+00	ok	f
fedcf141-e630-44a6-bd6d-b1421d31afb0	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:36:03.67135+00	kaizaaa	f
2ca1efc4-c177-41fc-86a0-b1cffd0edff5	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:43:31.756704+00	hello	f
644e771c-a48a-46c0-93d6-7d02a9527414	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:43:31.756704+00	hello	f
3f98b111-8709-407c-9888-799baec435a6	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:54:43.089547+00	aizeee	f
51b138a1-8e58-4401-b68f-f05e2d0b32d2	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:59:13.998308+00	aizeee	f
7dcd1d9c-74dc-4987-9673-ee0a8f726952	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:59:24.210003+00	mbola ao ve ?	f
a68669d6-f7a9-451c-9e79-11e162f991ad	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 08:59:39.680055+00	sa ?	f
af6c9c44-9cf6-4208-8a43-5734021df680	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 09:00:42.484609+00	xDD	f
1564ad87-101f-443f-afe5-e766294aa8d4	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 09:00:46.89098+00	hello	f
ca944963-5332-436e-8cdb-55cb13b27b9f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 09:00:57.13695+00	hello	f
ae092999-637c-4f5e-95db-730b11606e21	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:06:42.658324+00	hi	f
259420ca-6fd5-4520-a8b7-b58b149352aa	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:08:35.853076+00	hello	f
9f23e1a2-593e-4211-bdb8-f0937b317159	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:08:38.360156+00	hi	f
306ad541-3c76-4eab-a027-9a37a35ed01f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:09:17.220711+00	hello	f
81144678-47c4-4041-9ab1-a53af438c287	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:24:26.640048+00	hellooooo	f
18e09b38-0ed1-40ae-8ecb-12ce3142cdf0	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 11:58:17.076842+00	note to self :	f
f70bef79-0bd2-407e-a755-6113e4622b0d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:04:16.534622+00	hello	f
bebbebdf-50ea-4abd-ae71-2f1ebd7ee5ee	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:07:43.222126+00	hi	f
17a692e2-4a5c-4575-b7b3-fb57f0dda8d8	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:10:55.871019+00	hello	f
8b802803-a32a-4cc6-b256-1f9ee2c729d3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:13:10.859464+00	hi	f
c76c4154-38dd-49f1-aeff-6313c40bd17d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:14:32.785839+00	ex	f
217417aa-0c8c-4272-854f-8d3a301e0ce2	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:16:09.04259+00	hello	f
d84fc8ff-773b-4813-8ff0-1be0afeceb36	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:16:13.088777+00	hi	f
c5863ecb-b634-45c9-8164-84343b488edc	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:18:01.593951+00	hi dude sup?	f
e75b5feb-2c17-4da8-8225-d8d364b99d19	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:18:18.551845+00	hi dude sup?	f
546dcac7-0c58-4819-9ca9-636242b6fc5f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:18:34.57152+00	sup dude?	f
740e820a-89d9-42e7-b933-1f1dfcb723a4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:18:59.352588+00	hi dude sup?	f
c0112ad9-0999-4a86-a9ec-00fc908da13d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:20:23.355535+00	sup dude?	f
e9d61fd2-57c7-4ae8-9025-6308d8dcdea7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:20:30.904386+00	hi dude sup?	f
90ff29aa-5d64-4257-96d8-1a33f4c3b30d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:21:04.693717+00	busy?	f
ded92a1f-34be-4b00-8655-4b5e8f79d543	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:21:33.032708+00	nope	f
1335c5a0-bd3c-4d9e-87f1-f18362494079	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:22:44.559019+00	xD	f
79c7e3ae-1355-405a-ba7d-65759ee98db8	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:22:52.863846+00	what's funny	f
17353018-5138-4873-9b77-aa778429c8a4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 12:23:04.261488+00	no donda yet	f
331afdb0-92d6-4102-8820-7c62a35a21f6	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 12:23:17.165069+00	xDD man ... let the man be	f
7f874e4c-17b3-4b50-8e65-e75a5257126a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 18:37:02.357297+00	I can't sleep 😂	f
47679768-e78c-44e9-ad00-d1349b89a3ab	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:14:52.821042+00	hi	f
0c0cda22-665c-4367-89f7-e24b5ce2d2a6	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:20:48.474601+00	hi 2	f
c94dee90-01f6-485e-94fb-baaf40f79f20	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:21:09.959863+00	hello 1	f
27dddac5-be2d-42a5-b015-23c126de2336	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 19:21:29.28629+00	ehello	f
fc242c71-7e94-4b9e-a9fe-cbbffa6c232f	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:32:36.097975+00	hello1	f
c7867aa3-c79b-4122-8070-616086ad3593	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:33:03.128595+00	hello2	f
e1078b42-113c-466a-940d-b3bbf30ed2ec	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:33:22.783798+00	bye	f
97ec8413-6efb-4f15-9464-79bc395ddf06	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 19:33:32.570912+00	bey tech1	f
abc0f5e2-35d3-4e10-89e4-98b1281a898a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-19 19:33:56.553299+00	bey tech1	f
0b3bf6ce-cd60-4c32-92fc-b23881ee7d39	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-19 19:34:18.424791+00	bey tech_main	f
d2874bb3-0977-4226-be45-eba3411fc3a5	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 10:54:16.766976+00	kaizee	f
9a2103b0-7080-4303-987b-95c46866dc21	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 10:55:48.787171+00	test	f
78e3563e-114c-4444-98d4-8a441a9f9852	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:04:15.151636+00	test1	f
0d6ee8da-1f21-40d4-958d-18f44b4246b3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:16:25.84787+00	test2	f
ebf0cde0-618f-42be-87a6-6cbebe8cdd13	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:36:59.784744+00	test3	f
b76a5699-9d10-4510-a4a0-9fd68954272a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:41:00.78314+00	test4	f
04e3acde-49ea-423e-bfc7-47e009d3ab15	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:41:54.970858+00	hello	f
1427b956-d101-4592-b2cd-c4385776162a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-20 11:48:22.995824+00	test5	f
dd02f0a5-ac71-4fc7-bf91-c5f0179c46a4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 13:05:24.784851+00	slt , afaka mandeha 222 ve?	f
3c353bd0-96dc-4a46-8e1c-cad2f25fd680	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 13:07:02.460664+00	fa ahoana	f
08b7030f-0014-44f0-92a4-630daa05fada	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 13:07:16.145585+00	misy blem	f
9c5513b0-5437-4201-803c-bcbd4bf2217f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 13:08:29.143921+00	blem inona?	f
438b69f5-cb25-4edd-8558-578a73db84e0	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 13:10:41.360962+00	aizee ?	f
335973d7-4ab8-44f2-be6e-96aaf702e88d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 13:11:08.257758+00	tena tsy aiko fa tsy mety connecte ilay pc	f
41c030bf-48bb-45a1-8bbe-2663f24dd49f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 13:11:26.460301+00	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	f
c74aea1e-3392-4ce6-bf1f-93824d34cd8e	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 13:15:47.888332+00	pc iza?	f
2c1bf2e3-fef9-447d-9fb0-8f4a1ef92181	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 15:18:36.772002+00	pc 1	f
57152ba4-80b2-4147-bb9b-6092297e833c	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 15:25:21.848136+00	pc 2 koa	f
36ea583c-7595-4f3e-ba13-e0038b898158	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-21 15:26:26.237209+00	ary pc 3?	f
d44312d8-7978-4572-974d-824e3708f789	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-21 15:26:47.080619+00	mety xDD	f
1b009fe2-6879-4df7-bb85-74b1bcab5c35	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 11:32:14.867866+00	bonjour	f
37d1d953-8936-4a5c-b3c7-2da9c8472fbc	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:24:39.87575+00	aize	f
68c38a54-8847-4398-9b43-fc083135d3c7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-22 12:27:27.933888+00	hi	f
175e52a4-2fe6-48f1-a1d1-f115975e191e	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:32:57.208685+00	aizeee	f
1a94fef8-b182-47a6-9710-9fbaf0fa828e	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:35:30.225288+00	hello	f
5676c59f-b0f5-4222-b9d6-41d287acd77b	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:38:07.784622+00	test1	f
a5dd1ec4-d831-4b81-93e5-1d9599bc5088	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-22 12:39:50.194431+00	salut	f
29388d18-5078-4361-8cc8-ece14fab6540	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:40:19.446134+00	salut	f
9df43c38-b860-40f4-8eb0-377e2a56ff52	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:41:47.694148+00	salut	f
9b2eed0c-95b0-42f3-b3f1-0b39684b1d9f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:44:32.280808+00	test2	f
a3f1d0c7-ece9-486f-9787-6bb5157f875d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-22 12:44:48.594275+00	test 3	f
042f80d2-4055-497c-a551-2eabf1dd998f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:45:03.773494+00	test 4	f
b9189585-8cf4-4b70-9c31-e07db68f66b1	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:46:16.762286+00	test 5	f
bc16a549-d881-4288-80d6-c75824b36c2f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:55:19.766087+00	test 4	f
c0250e92-9a84-4651-912c-38900555109d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 12:55:37.302464+00	test 5	f
cbaf3bbb-06f8-4c22-baf3-8d46df8b6327	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-22 12:56:00.384019+00	test 6	f
69bf6cd1-e868-4723-89f7-9089f577f853	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-22 13:03:38.898879+00	test 7	f
9e1bfbcd-7938-43e8-9ea1-16925a50f895	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-22 13:03:55.570877+00	test 8	f
adfb917d-f3e4-4752-95f2-709c12b6a25b	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-23 11:06:51.341519+00	bonjour	f
d1330881-c75f-4ace-8bd8-6abecacfb2d9	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-23 11:08:14.74916+00	Bonjour	f
d1d11e19-b544-4db2-a558-e0bf0bc7517b	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-23 11:08:26.604996+00	malaza?	f
1793a5a5-f0f2-4d4b-b13c-8cb980073198	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-23 11:11:00.02371+00	malazooo	f
9f916ff0-632b-46db-a633-717a324b764c	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-23 11:11:11.640859+00	tsisy , any ?	f
19255020-4fac-4a92-9719-dac11d8eebf3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-23 11:11:20.038059+00	tsisy koa , ok sur	f
4b555c25-711e-4e78-8f5b-0bfef4d9a9b6	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-23 11:11:33.933867+00	sur	f
47ba502d-131a-4f22-8732-a771ee38d14d	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-24 06:21:49.83079+00	bjr	f
42cc8cd3-b5e9-48dc-9d11-2be81eecae2b	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-24 06:22:03.131363+00	bjr	f
c6d19785-e0fd-4762-b4f6-9e3c0aa30f06	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-08-31 10:58:19.045133+00	bjr	f
d0d3a065-7b6e-4bba-bbda-ecab73e61e11	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-08-31 10:58:35.82428+00	bjr	f
4a840801-fe6e-4a89-93b0-66a12ea57655	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-07 10:57:30.62441+00	test annonce	t
ccb32a42-7fff-49ab-9c17-3470223e86f8	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-07 17:28:01.273321+00	TEST ANNONCE 2	t
4ea57329-066f-4340-aeef-20f1b5fac671	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-08 09:08:33.860126+00	Test annonce 3\n	t
8c30b0b5-0381-4805-bc75-32783fecea10	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 06:07:51.054679+00	Test annonce 4	t
6934c0da-d0df-444b-b911-3b4017a85442	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 06:10:08.099401+00	test annonce 5	t
8e283485-7d69-4f92-8fe3-b2a6e938757a	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 06:14:29.812344+00	test annonce 6\n	t
b0534c98-0f27-4731-909c-ea59c46b8b29	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 06:15:06.645265+00	test annonce 7\n	t
c55c1858-d3f0-46c4-8ec1-4f260a3152d7	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 07:21:47.207753+00	test annonce 8	t
30daaedb-f628-4df2-aaaa-ae781efcf823	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 07:26:30.916047+00	test annonce 9\n	t
6ab3f14d-67da-4c3a-b5a1-451643758788	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 07:47:28.51045+00	test	f
39ee53f1-9ad9-487a-8af2-7e5637cf81f5	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:01:02.995993+00	test annpnce 10	t
77b4aa6b-e7b9-4188-a60b-c4093f8a1d1d	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:06:16.279494+00	test 11	t
1c33b91a-625b-43f8-9df2-f6bf2e414264	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:06:43.531337+00	test 12	t
64aed876-31ab-4c3d-81db-5b077a878e13	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:10:00.830573+00	test 13\n	t
c91e95b7-22b0-4324-9ad5-b63bb83995d7	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:10:40.584958+00	test	f
b03f2ad9-5127-4042-8565-ed8e9e22a96c	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:11:43.123722+00	test 14	t
7c3e5abf-60e2-498c-a594-e30dada39b9a	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:11:55.334494+00	test 14	t
71714840-0312-4e94-a801-4f572b50dea3	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:14:24.266365+00	test 15	t
c9b132ef-3ad4-4fd9-8ddb-c6626a931866	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:17:09.462199+00	test 55	t
bb04895a-8e2e-4b19-a256-6e61d4e12662	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:18:57.021477+00	test 66	t
2079bc94-f050-4b56-bfbc-59c7f8c603d0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:21:20.896152+00	annonce 1	t
ea01923a-3daf-4632-ab47-8b9b2613b1bf	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:25:50.735789+00	annonce 1	t
a8293116-e50b-40a0-90f2-e71bd49aad2c	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:26:38.23795+00	annonce 1	t
64dca7fa-eea9-46ad-8eea-58cfe98d6c96	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 08:31:58.321077+00	annonce 4\n	t
91b21b40-a79d-4662-b870-57adf4b16f09	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:42:52.541171+00	annonce 5	t
05d35cd3-1ae0-4def-a945-e5f727510a91	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:44:28.88099+00	test	f
51ef977b-b584-41ec-ba0a-8371d2e1f0c5	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:44:49.867074+00	annonce 6	t
e0e96d68-4e67-4342-b0ab-8494ddca9c5f	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 08:49:39.710208+00	annonce 7	t
89be0bd3-bdff-45a8-bc4a-ffa1da4034a0	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 11:07:51.963625+00	annonce 5u	t
8956c76b-514c-4543-98e4-2cbaba2f3637	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 11:08:08.402857+00	annonce 5u	t
07953839-2e6e-467e-8e56-befd194f8afe	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-09-10 14:15:03.680208+00	installation 111	t
89b1f80f-f196-4427-9b60-3186978a30b4	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:26:20.473063+00	panne reseau	t
fc610d4d-a7ac-4121-a918-a56fbbcb9fe9	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:31:29.528822+00	panne reseau total\n	t
ad4314fc-cb72-45bd-bd11-525e4544aa1f	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:36:13.37882+00	panne courant serveur	t
1d9cf619-ffa3-4be2-9083-719c7bee2d5e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:38:22.229645+00	panne courant serveur	t
0efb7ea4-dde9-4c54-923a-b37edf16ed94	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:38:48.981067+00	panne courant serveur 2	t
7fe26cf8-b6be-4c9c-b3cc-11de2e449a27	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:40:39.595506+00	panne courant serveur 2	t
bd7736c7-d7fa-49e0-ab0a-dc20607348cd	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 14:44:44.33846+00	panne courant serveur 2	t
5d7a2642-8184-4d23-9edb-b6414faabd07	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 20:23:06.789049+00	panne connexion	t
e11eb931-3868-4ab7-8c36-b80574d6d3ef	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 20:24:43.878295+00	panne courant	t
ea4457bc-bc67-45d4-b38c-90046b06ad66	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 20:25:07.071075+00	panne courant	t
5ed6e0d7-5a7f-40a3-845c-1bf2a8d18939	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 20:26:39.326833+00	hello\n	t
ea6f0604-c5ef-4517-9e87-4a558870916e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 20:58:02.975337+00	test	t
6f4ca211-b218-4c1a-8ff8-61b6c7941ef3	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 21:21:33.488945+00	test 4	t
d243132b-0b7d-496c-a85e-3851e074de21	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-10 21:22:19.961668+00	test 4	t
d4f8ba27-28ec-48ac-888f-4db149fd202b	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:00:39.847636+00	annonce 45	t
7e548389-fdda-4b5f-bdfb-37ee6392de96	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:02:34.690736+00	annonce 45	t
903b8705-c536-4b65-a62f-8764cb9a9cfa	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:16:15.884398+00	annonce 45	t
dff87b18-35e8-49bc-9eb7-f6412ee529bb	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:16:18.359428+00	annonce 45	t
f47bf0a6-7f2b-4aeb-ba29-44aa73eaa4e8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:17:03.503509+00	annonce 45	t
48b59661-3c0c-4173-a887-461a774ce7b8	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:17:28.470342+00	annonce 45	t
f8bd75fe-251a-4693-bec9-c7982bddaa65	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-09-14 12:18:19.432294+00	annonce 45	t
084dd9cc-b451-46b7-9b63-75b1bb66a977	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-10-01 09:10:08.009796+00	de	t
e5b55dea-d63b-4d02-89af-1b011ff81c8e	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-10-07 16:35:59.81711+00	Panne de connexion à 10h	t
4b608552-20d9-4589-b999-3f7db3bc42f6	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-10-08 06:53:06.419789+00	salle 111 :installation switch à 14h\n	t
f9b8fa8b-5434-4702-907e-f11eaaf91722	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-10-08 06:54:10.440685+00	salle 111 :installation switch à 16h\n	t
8d6cee32-e7cb-4bd4-a170-53708fcc85ae	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-10-25 09:17:29.542165+00	hello	f
b38020d0-7777-4009-97d7-7853b9fa17be	68db45ca-29ad-483d-b8e5-52b629d24d80	2021-10-25 09:17:40.806029+00	salama	f
1e118705-0930-4cfe-81e5-9b238cdfc1e3	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2021-10-25 09:17:59.754201+00	Annonce\nHEllo	t
\.


--
-- TOC entry 3293 (class 0 OID 16541)
-- Dependencies: 207
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (num_notification, num_app_user_user, num_app_user_tech_main, num_probleme, date_envoie, date_reponse, num_intervention) FROM stdin;
e8382bf7-2fe2-4200-a33c-5d3d5a213056	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	740cdbf2-30c3-460d-8c41-4497bdca662e	2021-07-24 15:21:22.726088+00	2021-07-24 15:21:33.135+00	\N
7f4fbb08-e1ae-4bb2-88ae-04e8e0562f82	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	60642731-062d-4266-bd7f-d734062b6648	2021-07-24 15:23:12.4024+00	2021-07-24 15:23:18.932+00	9b09672e-5bfb-4db8-b302-43e7648c1c23
981c2575-133d-44d9-a003-fda6f11747e3	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5aab9e73-24f7-4990-a54b-d2f80fe58201	2021-08-03 12:41:30.842451+00	2021-08-03 12:41:57.381+00	154aaf87-9619-4d3d-ba7b-570c9513d3b8
691dfcf4-5005-4fb3-ac17-b3b48cfa686c	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	95dbd458-50c8-4e1c-bc34-7867b59ec6e3	2021-07-27 08:14:40.136891+00	2021-07-27 08:14:46.015+00	6e4d5814-65bc-46bf-ad8e-93e82762abdb
ba6981c3-2639-4d7c-a96a-9bcf27e5ce99	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4560ecdd-e943-4c14-9cce-0a0ce1be4a23	2021-07-27 08:18:52.719973+00	2021-07-27 08:19:21.046+00	5092d094-a47c-495c-8a29-0349a2d0375e
1f3da660-5c6f-4461-a9df-e180b56c4a46	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	32cb4852-10c0-4d99-8679-97895af69144	2021-08-24 12:24:28.351545+00	2021-08-27 07:09:37.89+00	cce075e4-9c12-4a74-b3e5-de1f5351f55d
ceaab84c-70d0-43a1-ad90-8f8e6d75966b	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d20233e8-5c61-4183-8963-f050769f5ee0	2021-07-27 08:20:33.221724+00	2021-07-27 08:20:56.42+00	978cd4db-24fe-4228-9655-35707168ffe0
84420367-43cb-45ef-8a50-9c189d6143a5	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	ca349872-3feb-4007-90ef-7da9eec8dbd6	2021-08-04 08:53:02.556101+00	2021-08-04 08:53:09.644+00	d657a107-5f43-4ba6-ad1d-01e6fda0cd3a
2354a63b-016d-4c70-b3af-c18489e6eca4	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	09470faf-ba10-4a5d-9424-e29f49e8008b	2021-07-27 08:21:10.830082+00	2021-07-27 08:21:15.228+00	26193970-e7c0-4119-971e-650c30d23f15
e1871e7d-7241-42ae-82b2-383f964126e9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5bab551b-4e18-4f39-bc9b-3ffa04aa7873	2021-07-27 09:27:29.102439+00	2021-07-27 09:27:38.671+00	5b7719bb-c8b0-43a2-ae73-f8772e2add17
9bb6ba6a-e189-4c5f-a86e-88b72971f472	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	ec9c36d3-5b88-4442-95c3-2d0a948a9a4e	2021-07-27 11:33:36.527562+00	2021-07-27 11:34:00.352+00	edff0ade-0a86-463c-9d4d-8d86cf6132af
56542f2c-95d9-4439-ab8f-e71239691b20	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	48ad9835-dc29-4110-b7a6-5df84aa0cff2	2021-07-19 07:10:56.445266+00	2021-07-19 07:11:03.322+00	15adcc98-67fd-4df0-a4b0-6ac9f3de1235
54df7b39-68cf-437a-826a-f3842dd132ff	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	baa6542f-5849-4d67-b516-00d98a4680ce	2021-08-13 06:11:04.902051+00	2021-08-13 06:11:12.146+00	7d056629-ecaa-411e-bf3c-28bd66ddf662
5f3a797b-f710-478c-9f0a-b7a3653be186	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	f251dd8a-c623-445d-aaed-c74e09e7c648	2021-07-19 07:11:32.921432+00	2021-07-19 07:11:38.37+00	9c273e08-6860-4864-9f18-ce9751fca289
baf20cf3-8ca0-40fe-8ddd-d07f7cf0685e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	1ba0306a-c193-49a2-99e2-efc4f96a76e7	2021-07-30 11:44:42.431787+00	2021-07-30 11:44:47.363+00	8075f451-75fc-45ac-af09-6fb5e8fd92b0
c83aed53-9f28-403a-a4cf-0c25a550254c	83a31293-3fbc-4e32-8814-0421fae2b491	68db45ca-29ad-483d-b8e5-52b629d24d80	ba636bf0-4dc6-4946-970a-12305c922371	2021-07-19 11:03:22.393568+00	2021-07-19 11:03:31.245+00	c150d823-8c9b-4057-b01a-b35c0fb0e519
b06d0d48-316c-4b9d-9b49-09ee5a10a4d0	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4813e663-31cc-4af1-b2b8-c42ff8152aa8	2021-07-19 07:14:25.498573+00	2021-07-20 13:34:38.238+00	d6924ae1-1b7b-4c4e-8698-5178eda55a68
a19ec665-3014-4f29-acc9-56f168d74f77	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	6ddab0e1-056e-44fd-ad28-45b7e6e79827	2021-07-20 13:36:47.364173+00	2021-07-20 13:36:55.34+00	3b4364fa-bc56-475f-b211-ae426f92af8f
024455c0-3f21-4621-a699-54dc0a9c67da	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	5a285ce6-0346-45ec-a0e5-b721481b47a1	2021-07-30 12:01:14.560563+00	2021-07-30 12:01:20.935+00	bf4a10d2-d6fc-4684-8f04-e0cc3f8e3d02
e9217fe1-c89b-4320-adac-a3b16ed0f18e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	dc11ac71-33ad-4e5f-ab25-b21eff4776b6	2021-07-20 13:37:52.888803+00	2021-07-20 14:09:24.596+00	8eb04673-caff-4d51-9cfa-1ab533a2c6cc
b9b46d2e-ad54-49f5-b9fe-d8669311bbe6	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	e1d27a4a-4fca-4454-b53c-33e3f5fec0a9	2021-07-30 20:32:57.456485+00	2021-07-30 20:33:04.717+00	f22cbe5a-53a0-4b61-b7b6-4840e9793a56
e4f07b52-0e08-4fad-bcd0-5c8202f627f5	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	9a113bd9-25c2-40f5-a9ee-5acf5a3439ac	2021-08-20 11:50:12.176176+00	2021-08-20 11:50:25.459+00	ee204749-0c4d-479e-be91-5797f62a90cf
e385ea0b-ebe2-43c9-a94d-3185981b2ef0	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	75707518-c0b0-4fbb-ac0b-0334acb15ccc	2021-07-30 20:36:37.469414+00	2021-07-30 20:42:02.429+00	9e1c2728-7472-44df-9a2f-830ae097fd2d
bf65e21a-fa4c-4679-8eab-d6b7fa2beb9a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	320f60a1-fef2-447e-b073-2a91cc56eecb	2021-07-20 14:10:29.222967+00	2021-07-20 14:10:42.438+00	de1cefeb-824b-47f5-a309-af828fb70942
eac9e666-7c32-409e-badb-0b933a74b2f9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	a7963ecb-76bd-4541-b53d-1b3d9cd76812	2021-07-21 12:25:40.575682+00	2021-07-21 12:25:47.165+00	3ebcb2c6-2e17-4fad-a020-43305ed5aabe
91d56377-b383-4c2e-8d48-2c9b9a7dac75	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	652d9a0b-02e3-479e-b698-b01f06c0d7de	2021-07-30 20:47:27.27906+00	2021-07-30 20:47:57.914+00	1ed1dab9-2a54-4599-84a6-7c3eeff38a9c
347ea506-60ab-471f-beb7-d16022e77273	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	f398e4d7-ccfe-4902-8c60-ac0dd8ececcd	2021-07-21 12:26:39.542968+00	2021-07-21 12:26:46.916+00	b2768370-3953-4b8d-af1e-8784ad9f6a23
cf64f6c4-c383-4a82-8b41-af82e4d1a775	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	6761e97e-3d2d-49bf-819d-349a0032721e	2021-08-27 07:34:03.441473+00	2021-08-27 07:34:20.238+00	4c06194a-4ebd-4a3b-864b-39fc70900dbd
2baa0163-3feb-4471-827c-35c46d87f38a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	fed430f6-d539-4445-a57b-0a6d2b5e94c3	2021-07-21 12:38:21.832867+00	2021-07-21 12:38:30.604+00	ae64b19a-e376-4f85-beb2-c79a47957fea
0e0687df-fdf9-4007-806f-4d9f9b2ef48f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d0a415d2-b926-42c4-82fb-f7e0e4681219	2021-07-27 12:25:15.4017+00	2021-07-30 20:59:05.19+00	62006feb-4c7b-4587-871c-83c347fb251b
fcfe22eb-c9b4-459f-acf3-f951eb0de6ba	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	4ed8d919-5af9-477f-ba05-caaa7964ecb8	2021-07-22 06:56:11.253584+00	2021-07-22 06:56:43.44+00	5c0426c0-a7f4-4ea9-a365-4eb4970e752c
5a7c172b-fa2e-4fbd-bb93-8eb2581ea184	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d283246d-b147-46f8-bc72-91f62c693e32	2021-07-22 20:04:27.576236+00	2021-07-22 20:04:35.704+00	6275863b-dfb1-488a-9ef4-9fc29369cf82
aede43b0-6a2a-4ddf-b0e7-ea6c3baf892f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	7043a73b-cba6-4fa7-9f3a-35fc50b75eff	2021-08-20 11:54:01.598495+00	2021-08-20 11:54:07.506+00	c0324e16-7c57-4495-b986-90601e57df21
f751eeff-e763-4f0f-8369-5eaab4f86d0a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	92c4b044-1cc3-4aff-998a-14976e1c0cd0	2021-07-30 21:07:13.448525+00	2021-07-30 21:07:18.307+00	c998c1a7-da90-4173-81a1-f8c4c0db2811
2042dadc-2ec0-4705-852b-35f4ebcbab40	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	993038b9-ccdb-48dd-91fd-98145262df4b	2021-07-30 21:07:46.963454+00	2021-07-30 21:07:51.512+00	ff398c4f-72c4-431a-8f21-a1ceaa4afc8d
5d62e92c-da85-4611-be88-4fb737a1f7bb	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	d30c010b-4c08-42dd-835b-d023aa372fa1	2021-07-30 21:19:34.653834+00	2021-07-30 21:19:43.093+00	13057b2e-7d71-4b34-bfa7-53b7baa49603
7af11c15-cb94-440b-8d54-2aaa573a9a6f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c11c39f2-3ba6-4a05-87c2-122a37c0e2d9	2021-08-21 13:03:28.500154+00	2021-08-21 13:03:34.945+00	35743e44-8c05-45e9-a02a-3b27cd5a88ec
f5deea12-b077-4105-9473-9d3827951e09	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	3c304535-447f-47ab-9058-0728ab5b775c	2021-08-31 06:07:28.233475+00	2021-08-31 06:43:20.994+00	253d3f18-be3b-4746-b677-6d2cdc0b3f11
743fec5c-6607-4136-9c9e-2bb7128751ce	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b1bc8076-7cb1-46f8-ba19-bcea8e552769	2021-08-23 10:36:44.225699+00	2021-08-23 10:36:52.081+00	1fc3d63d-3eb3-4c85-9b60-fe5311215ae7
36590711-7107-408f-b8ed-582907e1d540	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	334c99c1-abb4-4c5e-975a-c545b450b4f7	2021-08-27 07:43:08.328137+00	2021-08-27 07:43:24.884+00	b589eed5-f285-4a99-aa8a-fcc8a1835ba8
90c46ccb-d0f2-4bc3-8710-fa9f59510a33	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	ee95775a-640d-464e-8741-a3b182fa7274	2021-08-23 10:59:42.404668+00	2021-08-23 10:59:52.358+00	a4794380-66b6-4b86-ac49-f678be0dad22
7424ffac-73ab-4e3e-a5a0-44213e34c7d1	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	1b48c322-ec59-429e-bbd1-8acad707f4bd	2021-08-24 06:17:11.879109+00	2021-08-24 06:17:56.051+00	65f7749c-5454-4c25-9620-1f1e7a40028c
cdcfd361-1b8f-4cb5-a053-f76f85e8ce82	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	bd346b49-7833-426a-b32f-5c9086ededca	2021-08-24 12:18:13.48589+00	2021-08-24 12:18:26.048+00	492a2c81-3ede-4a95-9964-d465da82578f
3d4e035b-2f6c-4c6e-a6a9-1588417af99f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b13909be-b795-49c4-85ca-d3bb93dd5db2	2021-08-27 07:48:43.348116+00	2021-08-27 07:48:48.416+00	d1af50df-10f5-4373-80f2-55494a23071e
febb929b-0765-49ab-b765-760e314e967c	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	f16da4d8-a125-46f3-99a9-6ca0258aea03	2021-08-30 12:13:43.779983+00	2021-08-30 12:14:36.781+00	b09eb5a9-6408-43cd-a2fc-89380d38e4e7
a29247bc-9822-4eba-b5f2-2b8470f5a800	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	1234c0c9-d79f-45ce-913e-6bdb9a72155f	2021-09-06 06:41:25.960305+00	2021-09-06 06:41:34.82+00	6cc549f8-441f-4dee-97fd-f2dbca548a2f
8d0e8e0d-66bd-4b73-9e84-8afec08e2d60	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b65aabf5-676b-437a-8af9-964fade20852	2021-08-27 08:35:48.194374+00	2021-08-30 12:20:32.031+00	5785df06-f838-4d2f-b41f-66ecbba351be
c67c8538-71b0-4135-b236-f21d19c679bd	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	96cdf84b-a4bc-4e33-ac2e-f63d0299b95f	2021-08-31 06:56:36.608817+00	2021-08-31 06:58:56.455+00	905459f0-db0c-4c4e-9a2a-c839c07cdfed
abdd5a8d-cdb9-471f-8078-0601d4f39573	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	d42d9d6c-32af-4f9b-9e85-e618fba6f2b5	2021-08-31 07:05:01.267027+00	2021-08-31 08:22:20.724+00	7fa569e6-4464-410c-986d-8da00d39c5dd
7ee2fc85-183e-432c-bfa9-b80f175835be	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	1be624d4-9771-490c-a0bf-74c4725421af	2021-09-10 14:17:54.511775+00	2021-09-10 14:24:39.996+00	7ef835a1-d2d1-4703-9340-9632a8922eec
a3ee929f-7428-4e4d-ae56-8a74a874fe05	fec0af71-5541-40e1-93ad-033ad5fb2fa0	68db45ca-29ad-483d-b8e5-52b629d24d80	cc158574-d506-46f3-9594-797b82727b2e	2021-09-07 12:00:37.788572+00	2021-09-07 12:00:51.196+00	dd583ece-897c-4137-9878-b59abddb2a6e
cd479dc7-e226-4669-988d-2005149c9196	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	35f412f1-6df8-40e3-8396-9595cba14cad	2021-08-27 08:21:22.837395+00	2021-09-10 14:22:57.405+00	635c0368-f40a-41b3-8284-adeedf08e035
e8aef598-da83-4e37-a44a-dd51df6ec564	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c1ad4b7f-b841-4db8-94d8-2a785d366b62	2021-09-29 12:09:31.179037+00	2021-09-29 12:09:49.271+00	340824e8-5bf2-48c8-bc87-f4acc05d2537
c4017a62-dd84-424e-bf13-753ebf50213a	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	99128a75-c2b0-46e3-8387-3ec538ca2fc5	2021-08-31 06:55:30.891909+00	2021-09-29 12:13:07.761+00	abfa997b-4dbb-4fa7-8136-e1e7b5502d7a
e4bbbfe7-2361-493b-a26c-6f687c4ceea6	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2396e8eb-426a-4a3c-8389-ef389b67e1e3	2021-09-29 12:13:19.95486+00	2021-09-29 12:13:31.77+00	ad7af6c6-dff5-4a7c-86e6-b4882a5d8f2a
a2ce5980-58dd-465d-ab4b-cf1269ed1f97	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	fbabfef0-385b-4066-b7ee-061a8aeaf0bb	2021-09-30 11:45:48.543503+00	2021-09-30 11:46:49.655+00	7644aa4d-3a1d-409a-aa57-19616a76dbd5
1c0e880d-7e89-4ca6-9d6a-fc18769eb0bd	83a31293-3fbc-4e32-8814-0421fae2b491	68db45ca-29ad-483d-b8e5-52b629d24d80	02cfeda9-e402-4f47-9f13-e87749e044ff	2021-09-30 11:46:31.469029+00	2021-10-05 06:56:05.171+00	c9cbaeef-0c02-4e94-992c-e121cc49cc33
2d4f9a5f-7efc-4cb4-9dca-54abf59d8133	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c3cc67b1-dd30-490c-bd0d-03d76d46c843	2021-10-07 16:33:32.370322+00	2021-10-12 08:58:41.699+00	2ee20446-1c68-4b75-96f2-36c71ad32b38
7cdacd88-5fcf-432e-acc1-4e9676eea8b7	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	82540b0c-a1d9-4f33-ad0f-5e1809113e0f	2021-09-30 11:45:58.683825+00	2021-10-13 07:29:45.231+00	f79ab56d-8797-4769-8275-b4ef476737fe
d1e9350d-85fe-4479-88d0-e2aaded7104d	83a31293-3fbc-4e32-8814-0421fae2b491	68db45ca-29ad-483d-b8e5-52b629d24d80	f12fbb00-c2f3-46ce-af2b-ee4c6ca14917	2021-09-30 11:45:54.783584+00	2021-10-05 07:06:39.607+00	65e56149-c55e-4bf9-83f4-3289f0fe6519
2a7b0f41-6251-4e87-893d-7f7ffc704712	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c60ff981-ccf1-4b99-a6c1-f95185d0f146	2021-10-07 16:15:20.682026+00	2021-10-07 16:17:58.771+00	a5cdbb41-1edc-4882-b3a6-6023d960891d
339722cb-4125-46f8-8d16-f54e0d903f84	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	d11b5a64-7459-4a01-8f68-1c2b24d75607	2021-10-18 05:52:21.995723+00	\N	\N
bfe27bad-96d1-4e06-acf5-daeb56f663a7	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	f50b4061-83ec-4f6d-b756-d7d80333e67c	2021-10-08 06:38:32.800112+00	2021-10-08 06:42:44.414+00	7e8e0739-3838-4f8e-bf98-be7c21e627fa
0ad24948-b730-486d-b01b-f46163d6cd6c	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	f9c19510-2469-4b2f-ad40-129105c596a8	2021-10-18 05:58:34.201455+00	\N	\N
dd0cedea-db0a-4e79-98cd-ebe974a641da	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	9ec08e85-b834-426b-b296-0fcfa6755565	2021-10-08 06:38:15.765372+00	2021-10-08 06:44:07.52+00	40438add-8045-4799-aab5-ddf625a26458
5465fd74-148c-43ab-8c8a-1a38e68c81b9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	3030178b-8903-424d-a947-3710e87dcbeb	2021-10-08 06:46:58.918509+00	2021-10-08 06:50:47.109+00	3b62a967-bbca-4189-be1e-7ada77c502bf
3d74ab36-556b-4438-a7f3-c3012f0b90ca	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	f1d899db-c142-42e7-ad1a-82b6e53bbd93	2021-09-30 11:46:13.737927+00	2021-10-08 06:54:24.396+00	89ee5542-5549-439d-955c-5df047a3cc94
7ea3d3df-7d37-4201-9c48-24c31b511617	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	e6a431a4-a223-41e1-9e1e-c624310b0265	2021-10-08 06:25:56.599006+00	2021-10-08 06:54:44.426+00	8358d6e2-7108-4f04-8078-6664fc551ff0
e15a2406-c46e-476a-b8cf-fcdc0d93db10	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	34cc0e4e-3c0a-4839-a52b-7b70f0b00f7b	2021-10-08 06:33:48.204799+00	2021-10-08 06:56:04.575+00	45b90e74-d163-46cf-b0b6-281e9a022403
61d6ab40-5344-4d7d-bc67-4fa4f71c0aa2	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	34810d13-42df-4a17-8ca7-ca63db238159	2021-10-08 06:53:23.243798+00	2021-10-08 06:56:23.832+00	249d139c-5c69-4a43-99eb-6222cf1a46d7
27d59431-f25e-4e40-995d-be8008bf0f8e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	dc214383-7717-453a-aa9b-ebeed937f500	2021-10-13 07:40:08.906464+00	2021-10-13 07:40:24.279+00	f33a9bba-32fa-4198-9301-5afa419bc3ef
13ca5c83-24eb-496c-9b02-670995ee2b0e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	55338e40-9e16-4757-a886-f04798ff5868	2021-10-08 06:37:51.343589+00	2021-10-12 08:53:35.276+00	68251ade-5ba9-49e2-997f-c2328b47a5a9
e4f936d4-90ea-4ceb-a972-2be3b33c28f3	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	31f438d0-2fa6-4e2a-af24-6a8d2556c0df	2021-10-18 09:10:49.18498+00	2021-10-18 09:20:58.066+00	04011c6a-5d9f-407c-9cdf-c376be7d6a2a
d416fb14-6216-4820-ad80-fcc8b9d022b6	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	394fe2f9-fbb3-423f-8116-eea3faedf7ba	2021-10-08 06:31:46.742562+00	2021-10-12 08:58:01.534+00	d2687179-5582-4591-8e43-a8dcff96f90c
7e4fa138-2690-4dbd-bb56-c017668b89aa	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	7bce8722-1dce-49c9-8c92-07c8e7aa8bff	2021-10-13 05:43:06.600173+00	2021-10-13 09:32:17.958+00	95067fec-2977-4b23-a7aa-e69493a3f472
43515077-55bd-46e7-b0ef-572743208ceb	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	5c7578ef-579a-4a5d-857a-ffd7a66942a1	2021-10-20 09:24:57.204391+00	2021-10-21 07:47:27.781+00	8715ab78-2240-4476-9abe-e9a5f6e75069
5fd2b805-7237-4077-8c2a-7aeb3b3f4793	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	fc0e4ea2-42dc-4f6c-ba8b-f5b92a8fe39a	2021-10-13 07:30:56.144776+00	2021-10-13 09:32:36.629+00	face10e6-58f2-4c55-ab45-63cb2a29fed1
e8ea1e7a-a73a-4a4a-965f-a7a1854d1269	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b5745a46-48ff-430c-8cbc-b75d320c0105	2021-10-18 05:48:59.652838+00	2021-10-18 09:28:26.415+00	76f322dd-46cc-43d6-bddf-c39f88efa996
79b4b376-d669-49f3-8d73-86d9e26ad0a5	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	64846f0c-9a16-4b42-82d6-a13aa303150f	2021-10-13 07:29:26.165262+00	2021-10-13 09:33:51.799+00	0e93f1e8-9baf-471e-bede-b315724df404
afedd7bf-841f-4ea0-ab3e-d2f1572ac971	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b0d81259-1e91-445a-a046-6fa8cbdda780	2021-10-12 08:59:17.830665+00	2021-10-12 08:59:51.742+00	9241c2cd-b328-4e45-8332-aee84d7012b3
c776c1dd-8ed9-45fc-a3be-b8ead251b76e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	42d9a10c-4baa-4948-969c-befc8727edf2	2021-10-12 09:00:08.083721+00	2021-10-12 09:00:49.677+00	4f102ba0-2b26-407d-a9dc-7292504a4e83
93c2c599-fabc-4eff-a5c9-0b913c82c68f	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	698100ab-0243-4b1c-ab2a-3ada95e27a80	2021-10-20 09:23:32.514458+00	2021-10-20 09:24:01.202+00	e319b5e0-9f6b-4399-9218-2f81e9202896
99051466-0b90-4037-b129-365adad0b72f	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	2c922dbd-983c-403f-b6f3-d784e1e162da	2021-10-18 09:10:17.490807+00	2021-10-19 08:45:23.853+00	cd8acdb9-9662-4bfc-b5c5-465a70384b49
8abe4c7a-32ed-437e-a6dd-509fd18c2aa3	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	4b0ac357-a0a7-4018-80d4-0b8e086c3328	2021-10-13 09:34:25.366165+00	2021-10-13 09:36:05.082+00	fc75ff77-10bb-4fb6-bd91-0c8e45f057e1
562abf5a-b645-4c9f-8c96-3895f748626e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	85283ce2-4e3a-40c0-b4f1-941ffa4af65c	2021-10-13 05:42:30.929458+00	2021-10-13 05:45:36.544+00	60e33233-d41e-4c99-8200-636e117c53f9
af5f9fd6-d110-438b-ba57-7be1304f7962	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	27568fc8-40a2-4352-95b3-e7d9902edd61	2021-10-13 05:42:13.090633+00	2021-10-13 05:48:41.317+00	3b0be3b4-6a58-42a3-94da-b52afd5e3189
b88079f5-ab12-44a9-baf7-11147bfa51a8	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	168182a9-4b7c-4fc8-8119-c53b670b5d10	2021-10-13 05:58:07.221906+00	\N	\N
612dfac9-507c-4d05-9de2-9d3a3a1ef87d	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	f5fa90bf-eff5-4321-b4a5-873894e31ea3	2021-10-13 06:00:36.495974+00	\N	\N
23260232-555f-4492-a053-62c1251598b7	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	c08c565a-b509-4a43-b8a3-3ea38c623937	2021-10-13 06:01:43.415931+00	\N	\N
5d29125d-69ba-48e0-90ea-380d21503fd7	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	4c989b8d-f6be-40f6-b2cf-ed991b32d157	2021-10-13 07:28:59.337815+00	2021-10-15 08:56:32.604+00	a3231665-40ef-4b21-8b7c-160412d759f3
50bf3f52-5e93-43ea-9e8d-c8f1e1f3ba98	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	aa33bc0d-ae0c-4817-bf30-146c0d08dbf5	2021-10-13 06:31:48.408041+00	2021-10-13 06:32:02.404+00	1fba885e-f096-4d8f-a7a1-591e68a22fde
c5633ef2-1a42-4ef4-94d5-c4a01b6b6b0b	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	84400deb-4ec1-403e-8b37-a48bfca6b772	2021-10-13 06:31:46.330091+00	2021-10-13 06:32:25.65+00	26deb718-11ae-4abb-aa08-7877cc2f75ca
30e3ca13-5bd5-4eff-8703-7f565f38cf92	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	dfdd2965-c9d4-4b70-9d2a-132b99694763	2021-10-15 08:59:08.607126+00	\N	\N
5fce63a9-8394-4aea-9d5a-5cc7cd6e15ff	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	bb034e28-a388-4436-9108-9c4512c38f71	2021-10-13 06:32:14.456852+00	2021-10-13 06:33:17.555+00	c52d09c4-005a-4e1d-97a6-1eb68d096ba5
90738460-9f50-4851-80f3-e15f0770574c	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	c72fffcf-6e33-4589-96fe-c4bc373e6585	2021-10-15 08:59:18.375024+00	\N	\N
8030d654-3d12-456c-99f5-3fa3b84383fa	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c91282ee-170a-4df3-81d9-9d20f5650c56	2021-10-13 06:06:44.42244+00	2021-10-13 06:38:54.135+00	201651c3-ec9e-4650-a1b7-ce23d1bdf195
f33d015e-0939-4353-8f1f-e75349307297	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	cbaf669b-e237-4aa5-be4f-a5df9a5176c6	2021-10-15 09:00:04.3151+00	\N	\N
cc38b59d-1c00-4076-9282-7019ed6a2e2d	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	aa553e0a-8639-498a-bb2d-81299d27427d	2021-10-13 07:24:55.810633+00	2021-10-13 07:25:11.059+00	115e4dc8-1db2-4450-b223-cbd5eb1dd95e
aba57c97-a89b-48d9-b076-f9ed2c11d68f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	41e813c0-6863-4562-8ff7-85b90982e4dc	2021-10-15 09:01:06.393821+00	\N	\N
d513ab4d-bced-48b9-bb6c-23957b3016aa	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	33ad553f-0f7d-4993-acbf-bd0e88a0ff52	2021-10-15 09:03:17.745733+00	2021-10-16 12:21:39.814+00	7849bf16-458c-4175-aa9d-44e0cc1831ef
f1348641-9283-49c5-ab25-3b985a3da539	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	f518dcbe-7127-4a10-87ca-7403e3046162	2021-10-16 12:22:23.091929+00	\N	\N
6449c070-0b25-4cd7-8fe7-2af1fed7f760	83a31293-3fbc-4e32-8814-0421fae2b491	\N	e2a4c413-fe18-4c9a-8078-4a8bc6021db0	2021-10-17 12:55:21.161882+00	\N	\N
28b3d01f-c83a-42fd-ae98-58971f1e67c0	83a31293-3fbc-4e32-8814-0421fae2b491	\N	5ad08bab-32e0-4341-a55b-e941c2949f7b	2021-10-17 12:57:09.71349+00	\N	\N
d70ce1f7-a776-4975-9527-8ac11d2310fc	83a31293-3fbc-4e32-8814-0421fae2b491	\N	caca2831-8e84-4732-ab25-434eec21f125	2021-10-17 12:59:29.300585+00	\N	\N
4f873efa-244b-408e-bb40-3e458e44cff5	83a31293-3fbc-4e32-8814-0421fae2b491	\N	121e0ecc-8898-4744-a7a0-2bd0e7fd94f4	2021-10-17 13:01:21.446824+00	\N	\N
478ecfdc-3ae9-4b1d-bfb2-d4d75a595336	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b110668f-65b3-42a3-a946-c2766b977d68	2021-10-17 13:03:04.621746+00	2021-10-17 13:05:13.758+00	eb460324-82db-4a70-8d26-e96382ae57cb
d2856e01-9743-4886-b6c4-ae0a2465c2f3	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	29b9bad4-f7d6-4f66-bbdd-b26c70e8731f	2021-10-18 05:49:49.938726+00	\N	\N
c4e6a600-8cda-423d-b5fc-e61dac63697d	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	0e665d2b-b77d-46f5-aba6-004c9e99fae7	2021-10-18 05:50:40.747394+00	\N	\N
9a6a0f74-ea8c-42ba-9078-a8ccc1cac0f5	fec0af71-5541-40e1-93ad-033ad5fb2fa0	\N	c2c47178-f9f0-435c-a162-4d0a4f59017d	2021-10-18 05:51:20.338128+00	\N	\N
51195c55-9af5-4609-97db-b08289bc3f80	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	6a419ebf-77da-4324-9e23-afbc9ece6b3f	2021-10-19 09:12:11.12395+00	2021-10-19 09:13:22.849+00	295a424b-f1c7-4e51-ab92-377d88ca2ee8
876de3c7-1bad-47b2-96d6-efb3b6e75c18	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	8158fc58-d8e6-4687-9d98-fe29910551a8	2021-10-19 09:10:30.740305+00	2021-10-19 09:16:54.343+00	a3049b3d-7772-4fc2-91b8-906a40d98ebb
36b07bd2-cd28-4a06-ab49-0214515e184a	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	b8c42fc4-05e0-4c36-a3ff-e95f494ac19e	2021-10-19 09:10:24.732976+00	2021-10-19 09:18:24.002+00	119fd3d6-c8e3-4e34-8ce3-938809cdcd34
dbb50996-af42-43bc-8c0f-6b624ca559e4	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	5c16135c-0d99-48f4-9c75-589739d14639	2021-10-20 09:25:50.897452+00	2021-10-21 07:25:13.743+00	3bb336f0-591d-474e-8901-ac307763b0cb
48c5df7a-b97a-4029-a934-53ae019fea35	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	e1c944b4-1688-4719-826c-3bcb1f3b7fbf	2021-10-13 05:53:56.428377+00	2021-10-20 16:28:29.38+00	a1bea9c8-03f5-4534-abb8-6f257cab8069
5e9ae451-c821-48c7-83e6-ab3d73639004	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	e43d4f77-0f76-4808-9b76-ac56b6a43c16	2021-10-15 08:58:50.430875+00	2021-10-20 16:36:21.674+00	3a123c3d-c6f1-4ec6-a1b8-256b3167f854
d2079534-f0b8-45bf-b606-46f0d7116831	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	c03cd632-472f-4cfa-b135-3e9d7b873146	2021-10-20 09:25:10.418754+00	2021-10-21 07:34:25.341+00	1a197e2e-17c8-4f46-83b4-aab71067cb94
158ffb53-7df2-4507-aa98-972da962ce54	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	269635ff-79b5-488e-9029-cad56e896253	2021-10-20 09:24:13.882512+00	2021-10-21 07:52:37.22+00	f0ce4ae6-2a46-4df9-bf26-157235db276d
49824c3d-5fcb-48c6-bbcd-da4484abcbf9	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	9b93278d-e6c5-4032-b9d8-f902ef0e01ea	2021-10-22 06:58:39.968204+00	2021-10-22 07:18:01.496+00	e0fc802c-b26b-45d0-8cc7-db265b52ccb1
e3633708-cf21-4dd3-b1e9-624855a0df7e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	05291328-a65c-4781-b3a3-d8f4e5212255	2021-10-22 06:58:24.735774+00	2021-10-22 07:19:43.547+00	1b990319-014c-45a0-91ef-85b895a04404
e4d605df-b60a-4164-a3e2-99d21de1e79f	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	05923b0b-3607-4208-a201-afd1110eb7da	2021-10-22 07:21:24.5364+00	2021-10-22 07:21:38.216+00	6c06a6d0-6a74-4aed-a994-f49977959685
2698df66-6e10-4899-9ef4-8704828a275e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	5b883724-a085-4970-890a-78acaf649c87	2021-10-22 08:00:33.679824+00	2021-10-22 08:09:19.874+00	886e2b38-8923-4b2a-8f94-19852a5d5ae5
6a121191-1226-4e0a-8d4b-849f36baad12	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	6aa3e9ae-83b0-4271-a68a-060a1b23c4c1	2021-10-21 11:36:38.693549+00	2021-10-22 08:21:42.591+00	e4487d33-36ea-43c3-9973-f08d90e34473
5477a902-c599-464a-9c1f-3f635664e85f	83a31293-3fbc-4e32-8814-0421fae2b491	237451bc-067e-4c61-ae8d-9c5fe93b49ce	6ed84641-ee30-4557-8385-4c592cf512bc	2021-10-20 09:23:18.754554+00	2021-10-22 08:21:56.008+00	56ce53ad-b641-4d0a-b30b-96cde2bd206b
55462723-c036-4969-8d46-a2e2ecb8f22e	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	cd8145bf-7d01-4baa-85a6-8a22ea0675c7	2021-10-22 09:17:11.829087+00	2021-10-22 09:17:18.97+00	22fb8302-5f61-4b04-96a5-d2162a2c29a3
d211d352-e1ae-481d-bfd9-7280b06ef816	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	a51a63f2-8ba0-46d5-a478-c9137c38593e	2021-10-22 09:24:10.681672+00	2021-10-22 09:24:27.761+00	0c58a5dc-370d-4218-914e-cdc8f5da4427
baeaa8ce-ef7e-430c-b68d-e994ba5606e8	fec0af71-5541-40e1-93ad-033ad5fb2fa0	237451bc-067e-4c61-ae8d-9c5fe93b49ce	a6391011-8f53-49dc-8c9e-7e01db5f0b20	2021-10-25 09:11:17.690216+00	2021-10-25 09:11:22.787+00	21287bc7-0bb7-4bac-9e56-77a922bb6a1d
\.


--
-- TOC entry 3292 (class 0 OID 16518)
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
baa6542f-5849-4d67-b516-00d98a4680ce	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
9a113bd9-25c2-40f5-a9ee-5acf5a3439ac	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
7043a73b-cba6-4fa7-9f3a-35fc50b75eff	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c11c39f2-3ba6-4a05-87c2-122a37c0e2d9	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
b1bc8076-7cb1-46f8-ba19-bcea8e552769	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
ee95775a-640d-464e-8741-a3b182fa7274	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
1b48c322-ec59-429e-bbd1-8acad707f4bd	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	download
bd346b49-7833-426a-b32f-5c9086ededca	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
32cb4852-10c0-4d99-8679-97895af69144	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
6761e97e-3d2d-49bf-819d-349a0032721e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
334c99c1-abb4-4c5e-975a-c545b450b4f7	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
b13909be-b795-49c4-85ca-d3bb93dd5db2	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
35f412f1-6df8-40e3-8396-9595cba14cad	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
b65aabf5-676b-437a-8af9-964fade20852	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f16da4d8-a125-46f3-99a9-6ca0258aea03	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
3c304535-447f-47ab-9058-0728ab5b775c	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
99128a75-c2b0-46e3-8387-3ec538ca2fc5	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
96cdf84b-a4bc-4e33-ac2e-f63d0299b95f	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
d42d9d6c-32af-4f9b-9e85-e618fba6f2b5	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
1234c0c9-d79f-45ce-913e-6bdb9a72155f	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
cc158574-d506-46f3-9594-797b82727b2e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
1be624d4-9771-490c-a0bf-74c4725421af	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c1ad4b7f-b841-4db8-94d8-2a785d366b62	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
2396e8eb-426a-4a3c-8389-ef389b67e1e3	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
fbabfef0-385b-4066-b7ee-061a8aeaf0bb	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f12fbb00-c2f3-46ce-af2b-ee4c6ca14917	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
82540b0c-a1d9-4f33-ad0f-5e1809113e0f	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
f1d899db-c142-42e7-ad1a-82b6e53bbd93	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
02cfeda9-e402-4f47-9f13-e87749e044ff	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
c60ff981-ccf1-4b99-a6c1-f95185d0f146	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c3cc67b1-dd30-490c-bd0d-03d76d46c843	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	word
e6a431a4-a223-41e1-9e1e-c624310b0265	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
394fe2f9-fbb3-423f-8116-eea3faedf7ba	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
34cc0e4e-3c0a-4839-a52b-7b70f0b00f7b	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
55338e40-9e16-4757-a886-f04798ff5868	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
9ec08e85-b834-426b-b296-0fcfa6755565	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f50b4061-83ec-4f6d-b756-d7d80333e67c	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
3030178b-8903-424d-a947-3710e87dcbeb	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
34810d13-42df-4a17-8ca7-ca63db238159	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
b0d81259-1e91-445a-a046-6fa8cbdda780	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
42d9a10c-4baa-4948-969c-befc8727edf2	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
27568fc8-40a2-4352-95b3-e7d9902edd61	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
85283ce2-4e3a-40c0-b4f1-941ffa4af65c	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
7bce8722-1dce-49c9-8c92-07c8e7aa8bff	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
e1c944b4-1688-4719-826c-3bcb1f3b7fbf	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
168182a9-4b7c-4fc8-8119-c53b670b5d10	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	telechargement
f5fa90bf-eff5-4321-b4a5-873894e31ea3	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	telechargement
c08c565a-b509-4a43-b8a3-3ea38c623937	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	telechargement
c91282ee-170a-4df3-81d9-9d20f5650c56	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
84400deb-4ec1-403e-8b37-a48bfca6b772	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
aa33bc0d-ae0c-4817-bf30-146c0d08dbf5	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
bb034e28-a388-4436-9108-9c4512c38f71	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
aa553e0a-8639-498a-bb2d-81299d27427d	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
4c989b8d-f6be-40f6-b2cf-ed991b32d157	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
64846f0c-9a16-4b42-82d6-a13aa303150f	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
fc0e4ea2-42dc-4f6c-ba8b-f5b92a8fe39a	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
dc214383-7717-453a-aa9b-ebeed937f500	93c67b22-5392-486e-8991-1d2d5cff0691	62255b2b-1028-4817-848b-2be1c74bd2fb	92ac2859-b516-4f09-8ac1-ac4709a807de	
4b0ac357-a0a7-4018-80d4-0b8e086c3328	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
e43d4f77-0f76-4808-9b76-ac56b6a43c16	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
dfdd2965-c9d4-4b70-9d2a-132b99694763	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c72fffcf-6e33-4589-96fe-c4bc373e6585	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
cbaf669b-e237-4aa5-be4f-a5df9a5176c6	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
41e813c0-6863-4562-8ff7-85b90982e4dc	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
33ad553f-0f7d-4993-acbf-bd0e88a0ff52	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f518dcbe-7127-4a10-87ca-7403e3046162	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
e2a4c413-fe18-4c9a-8078-4a8bc6021db0	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5ad08bab-32e0-4341-a55b-e941c2949f7b	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	fb
caca2831-8e84-4732-ab25-434eec21f125	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	fb
121e0ecc-8898-4744-a7a0-2bd0e7fd94f4	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	fb
b110668f-65b3-42a3-a946-c2766b977d68	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	fb
b5745a46-48ff-430c-8cbc-b75d320c0105	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
29b9bad4-f7d6-4f66-bbdd-b26c70e8731f	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
0e665d2b-b77d-46f5-aba6-004c9e99fae7	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c2c47178-f9f0-435c-a162-4d0a4f59017d	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
d11b5a64-7459-4a01-8f68-1c2b24d75607	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
f9c19510-2469-4b2f-ad40-129105c596a8	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
2c922dbd-983c-403f-b6f3-d784e1e162da	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
31f438d0-2fa6-4e2a-af24-6a8d2556c0df	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
b8c42fc4-05e0-4c36-a3ff-e95f494ac19e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
8158fc58-d8e6-4687-9d98-fe29910551a8	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
6a419ebf-77da-4324-9e23-afbc9ece6b3f	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
6ed84641-ee30-4557-8385-4c592cf512bc	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
698100ab-0243-4b1c-ab2a-3ada95e27a80	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
269635ff-79b5-488e-9029-cad56e896253	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5c7578ef-579a-4a5d-857a-ffd7a66942a1	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
c03cd632-472f-4cfa-b135-3e9d7b873146	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
5c16135c-0d99-48f4-9c75-589739d14639	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	
6aa3e9ae-83b0-4271-a68a-060a1b23c4c1	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
05291328-a65c-4781-b3a3-d8f4e5212255	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
9b93278d-e6c5-4032-b9d8-f902ef0e01ea	d8bf125f-5509-469f-8db3-f730fe588d98	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
05923b0b-3607-4208-a201-afd1110eb7da	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	Facebook
5b883724-a085-4970-890a-78acaf649c87	c34a3289-ce18-4c94-bf6e-1c213a1b191a	6b3b2f07-253a-4066-b5ca-96d93a149149	92ac2859-b516-4f09-8ac1-ac4709a807de	Facebook
cd8145bf-7d01-4baa-85a6-8a22ea0675c7	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
a51a63f2-8ba0-46d5-a478-c9137c38593e	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	
a6391011-8f53-49dc-8c9e-7e01db5f0b20	93c67b22-5392-486e-8991-1d2d5cff0691	6b3b2f07-253a-4066-b5ca-96d93a149149	8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	
\.


--
-- TOC entry 3289 (class 0 OID 16481)
-- Dependencies: 203
-- Data for Name: probleme_statut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_statut (num_probleme_statut, libelle, code) FROM stdin;
0e5fdaf1-a3fc-4f88-b1d4-46c9731fdccb	tres urgent	MAX
8bf7f508-9b7c-4c6b-bbb5-d860d23e30a1	moyennement urgent	MID
92ac2859-b516-4f09-8ac1-ac4709a807de	pas urgent	MIN
\.


--
-- TOC entry 3301 (class 0 OID 16905)
-- Dependencies: 222
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
4bcdac56-2b9c-4d97-a15f-86033e6ec682	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
76bc2601-991f-44d7-86a0-cf41b85a1d9e	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
c15f52be-ec88-4942-bb1f-2ede20f949c0	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
50b7b6e9-c7c7-40f3-a7bb-cec305e105be	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
f59bc6ba-3f48-4f6b-94a5-5c5d6c35c82f	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
9d5c30c1-41c4-4e89-96a6-73878f460043	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
de54e287-47c1-48ce-8f23-4571a23db735	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
643a229e-ad6b-4087-be70-a4d8e624f325	4d1287b6-5268-4cf7-a2f8-1deab7c474fc	\N	adca18fe-cad7-47ad-8317-c301f45e0498
a6175bd0-b5ec-4121-96fe-35b0a52e45bb	6b3b2f07-253a-4066-b5ca-96d93a149149	\N	adca18fe-cad7-47ad-8317-c301f45e0498
6157649d-50d3-44f4-ac71-5885eaa78085	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
a258c99c-cd6f-4234-8503-319f63ee2095	4d1287b6-5268-4cf7-a2f8-1deab7c474fc		adca18fe-cad7-47ad-8317-c301f45e0498
296f4a1a-0aaf-4fb9-ac73-883ddba5e45b	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
412ef4f5-79d8-4c96-b3ab-016bac214ab1	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
79480380-65cb-41a8-a3ec-16299a266db2	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
340853e7-2186-4e37-8552-4716902fe18b	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
44df0de9-cc3d-4b93-a19c-b6cca4fa75c8	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
f8663c49-9cf6-4d85-a86b-7a3a4612e5c6	6b3b2f07-253a-4066-b5ca-96d93a149149		adca18fe-cad7-47ad-8317-c301f45e0498
b4a0f9e7-79a1-4b47-9c62-27700f6d708b	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
5ec09807-a138-4b08-acd1-bfb1a1833ecf	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
df6eb9c0-3378-49ac-8d75-ca54527592d6	6b3b2f07-253a-4066-b5ca-96d93a149149		3b426db1-7b60-4ba8-acf0-2eeafe63e3dc
d771003d-3fd3-4d84-a59a-c2551aacc5d2	6b3b2f07-253a-4066-b5ca-96d93a149149	\N	876fa019-baaf-4687-8f49-82635e0bc510
\.


--
-- TOC entry 3300 (class 0 OID 16890)
-- Dependencies: 221
-- Data for Name: probleme_tech_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_tech_type (num_probleme_tech_type, libelle_probleme_tech_type) FROM stdin;
3b426db1-7b60-4ba8-acf0-2eeafe63e3dc	probleme adresse IP
adca18fe-cad7-47ad-8317-c301f45e0498	plantage ordinateur
6ebd0693-2450-41f4-9bb4-afc2e700e6bd	changement mot de passe
435f0eb0-9a36-4be1-b62b-4063cf95d667	changement de réseau
876fa019-baaf-4687-8f49-82635e0bc510	Matériel endomager
5ccda088-4c2f-442b-b9cc-7763582f5476	panne electrique
10d54de1-2f06-4641-85c8-93a068da8935	probleme de configuration
100ea9e8-78f6-448c-9187-b75574c2ad6b	encre imprimante vide
\.


--
-- TOC entry 3288 (class 0 OID 16471)
-- Dependencies: 202
-- Data for Name: probleme_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.probleme_type (num_probleme_type, libelle, code) FROM stdin;
93c67b22-5392-486e-8991-1d2d5cff0691	tsy mandeha ny connexion	no conn
d8bf125f-5509-469f-8db3-f730fe588d98	tsy mandeha ny imprimante	PRINT_PB
c34a3289-ce18-4c94-bf6e-1c213a1b191a	autre	OTH
\.


--
-- TOC entry 3291 (class 0 OID 16505)
-- Dependencies: 205
-- Data for Name: type_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_user (num_type_user, code, libelle) FROM stdin;
818dcd07-a26a-495a-8ab7-50daea67ac9c	USER	utilisateur
e0e8ccad-edee-48c9-bd24-076a685157bc	TECH_MAIN	technicien de maintenance
4e3cf446-f780-406b-91e8-7528ce4ce33e	DASH	dashboard
\.


--
-- TOC entry 3102 (class 2606 OID 16984)
-- Name: app_user_recepteur_message PK_app_user_recpteur_message; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_recepteur_message
    ADD CONSTRAINT "PK_app_user_recpteur_message" PRIMARY KEY (num_app_user_recepteur, num_message);


--
-- TOC entry 3092 (class 2606 OID 16816)
-- Name: decharge_materiel PK_decharge_materiel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge_materiel
    ADD CONSTRAINT "PK_decharge_materiel" PRIMARY KEY (num_decharge, num_materiel);


--
-- TOC entry 3078 (class 2606 OID 16545)
-- Name: notification PK_notificaction; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "PK_notificaction" PRIMARY KEY (num_notification);


--
-- TOC entry 3076 (class 2606 OID 16525)
-- Name: probleme PK_probleme; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "PK_probleme" PRIMARY KEY (num_probleme);


--
-- TOC entry 3074 (class 2606 OID 16512)
-- Name: type_user PK_type_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_user
    ADD CONSTRAINT "PK_type_user" PRIMARY KEY (num_type_user);


--
-- TOC entry 3066 (class 2606 OID 16402)
-- Name: app_user PK_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "PK_user" PRIMARY KEY (num_user);


--
-- TOC entry 3094 (class 2606 OID 25257)
-- Name: probleme_tech_type UK_libelle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech_type
    ADD CONSTRAINT "UK_libelle" UNIQUE (libelle_probleme_tech_type);


--
-- TOC entry 3080 (class 2606 OID 25259)
-- Name: intervention_type UK_libelle_intervention_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention_type
    ADD CONSTRAINT "UK_libelle_intervention_type" UNIQUE (libelle_intervention_type);


--
-- TOC entry 3090 (class 2606 OID 16803)
-- Name: decharge decharge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT decharge_pkey PRIMARY KEY (num_decharge);


--
-- TOC entry 3088 (class 2606 OID 16768)
-- Name: intervention intervention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT intervention_pkey PRIMARY KEY (num_intervention);


--
-- TOC entry 3082 (class 2606 OID 16739)
-- Name: intervention_type intervention_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention_type
    ADD CONSTRAINT intervention_type_pkey PRIMARY KEY (num_intervention_type);


--
-- TOC entry 3072 (class 2606 OID 16496)
-- Name: lieu lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pkey PRIMARY KEY (num_lieu);


--
-- TOC entry 3086 (class 2606 OID 16755)
-- Name: materiel materiel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_pkey PRIMARY KEY (num_materiel);


--
-- TOC entry 3084 (class 2606 OID 16747)
-- Name: materiel_type materiel_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel_type
    ADD CONSTRAINT materiel_type_pkey PRIMARY KEY (num_materiel_type);


--
-- TOC entry 3100 (class 2606 OID 16974)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (num_message);


--
-- TOC entry 3070 (class 2606 OID 16488)
-- Name: probleme_statut probleme_statut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_statut
    ADD CONSTRAINT probleme_statut_pkey PRIMARY KEY (num_probleme_statut);


--
-- TOC entry 3096 (class 2606 OID 16897)
-- Name: probleme_tech_type probleme_tech_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech_type
    ADD CONSTRAINT probleme_tech_pkey PRIMARY KEY (num_probleme_tech_type);


--
-- TOC entry 3098 (class 2606 OID 16912)
-- Name: probleme_tech probleme_tech_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT probleme_tech_pkey1 PRIMARY KEY (num_probleme_tech);


--
-- TOC entry 3068 (class 2606 OID 16478)
-- Name: probleme_type probleme_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_type
    ADD CONSTRAINT probleme_type_pkey PRIMARY KEY (num_probleme_type);


--
-- TOC entry 3134 (class 2620 OID 16836)
-- Name: decharge before_insert_decharge; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_decharge BEFORE INSERT ON public.decharge FOR EACH ROW EXECUTE FUNCTION public.before_insert_decharge();


--
-- TOC entry 3132 (class 2620 OID 16826)
-- Name: intervention before_insert_intervention; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_intervention BEFORE INSERT ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention();


--
-- TOC entry 3129 (class 2620 OID 16828)
-- Name: intervention_type before_insert_intervention_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_intervention_type BEFORE INSERT ON public.intervention_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention_type();


--
-- TOC entry 3126 (class 2620 OID 16501)
-- Name: lieu before_insert_lieu; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_lieu BEFORE INSERT ON public.lieu FOR EACH ROW EXECUTE FUNCTION public.before_insert_lieu();


--
-- TOC entry 3131 (class 2620 OID 16830)
-- Name: materiel before_insert_materiel; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_materiel BEFORE INSERT ON public.materiel FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel();


--
-- TOC entry 3130 (class 2620 OID 16834)
-- Name: materiel_type before_insert_materiel_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_materiel_type BEFORE INSERT ON public.materiel_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel_type();


--
-- TOC entry 3137 (class 2620 OID 16986)
-- Name: message before_insert_message; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_message BEFORE INSERT ON public.message FOR EACH ROW EXECUTE FUNCTION public.before_insert_message();


--
-- TOC entry 3128 (class 2620 OID 16567)
-- Name: notification before_insert_notification; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_notification BEFORE INSERT ON public.notification FOR EACH ROW EXECUTE FUNCTION public.before_insert_notification();


--
-- TOC entry 3127 (class 2620 OID 16565)
-- Name: probleme before_insert_probleme; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme BEFORE INSERT ON public.probleme FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme();


--
-- TOC entry 3125 (class 2620 OID 16499)
-- Name: probleme_statut before_insert_probleme_statut; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_statut BEFORE INSERT ON public.probleme_statut FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_statut();


--
-- TOC entry 3136 (class 2620 OID 16925)
-- Name: probleme_tech before_insert_probleme_tech; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_tech BEFORE INSERT ON public.probleme_tech FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech();


--
-- TOC entry 3135 (class 2620 OID 16927)
-- Name: probleme_tech_type before_insert_probleme_tech_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_probleme_tech_type BEFORE INSERT ON public.probleme_tech_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech_type();


--
-- TOC entry 3123 (class 2620 OID 16444)
-- Name: app_user before_insert_user; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_insert_user BEFORE INSERT ON public.app_user FOR EACH ROW EXECUTE FUNCTION public.before_insert_user();


--
-- TOC entry 3133 (class 2620 OID 16953)
-- Name: intervention before_update_intervention; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER before_update_intervention BEFORE UPDATE ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_update_intervention();


--
-- TOC entry 3124 (class 2620 OID 16480)
-- Name: probleme_type ini_new_probleme_type; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ini_new_probleme_type BEFORE INSERT ON public.probleme_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_type();


--
-- TOC entry 3103 (class 2606 OID 16513)
-- Name: app_user FK_app_user_type_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "FK_app_user_type_user" FOREIGN KEY (num_type_user) REFERENCES public.type_user(num_type_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3119 (class 2606 OID 16804)
-- Name: decharge FK_decharge_intervention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT "FK_decharge_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention);


--
-- TOC entry 3113 (class 2606 OID 16769)
-- Name: intervention FK_intervention_app_user_tech_main_creator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_app_user_tech_main_creator" FOREIGN KEY (num_app_user_tech_main_creator) REFERENCES public.app_user(num_user);


--
-- TOC entry 3117 (class 2606 OID 16794)
-- Name: intervention FK_intervention_intervention_pere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_pere" FOREIGN KEY (num_intervention_pere) REFERENCES public.intervention(num_intervention) NOT VALID;


--
-- TOC entry 3116 (class 2606 OID 16789)
-- Name: intervention FK_intervention_intervention_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_type" FOREIGN KEY (num_intervention_type) REFERENCES public.intervention_type(num_intervention_type);


--
-- TOC entry 3115 (class 2606 OID 16784)
-- Name: intervention FK_intervention_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_lieu" FOREIGN KEY (num_lieu_intervention) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3114 (class 2606 OID 16779)
-- Name: intervention FK_intervention_materiel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_materiel" FOREIGN KEY (num_materiel) REFERENCES public.materiel(num_materiel);


--
-- TOC entry 3118 (class 2606 OID 16918)
-- Name: intervention FK_intervention_probleme_tech; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_probleme_tech" FOREIGN KEY (num_probleme_constate) REFERENCES public.probleme_tech(num_probleme_tech) NOT VALID;


--
-- TOC entry 3112 (class 2606 OID 25240)
-- Name: materiel FK_materiel_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT "FK_materiel_lieu" FOREIGN KEY (num_lieu) REFERENCES public.lieu(num_lieu) NOT VALID;


--
-- TOC entry 3111 (class 2606 OID 16756)
-- Name: materiel FK_materiel_material_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT "FK_materiel_material_type" FOREIGN KEY (num_materiel_type) REFERENCES public.materiel_type(num_materiel_type) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3122 (class 2606 OID 16975)
-- Name: message FK_message_app_user_envoyeur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT "FK_message_app_user_envoyeur" FOREIGN KEY (num_app_user_envoyeur) REFERENCES public.app_user(num_user);


--
-- TOC entry 3108 (class 2606 OID 16551)
-- Name: notification FK_notification_app_user_tech_main; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_tech_main" FOREIGN KEY (num_app_user_tech_main) REFERENCES public.app_user(num_user);


--
-- TOC entry 3107 (class 2606 OID 16546)
-- Name: notification FK_notification_app_user_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_user" FOREIGN KEY (num_app_user_user) REFERENCES public.app_user(num_user);


--
-- TOC entry 3110 (class 2606 OID 16838)
-- Name: notification FK_notification_intervention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention) ON DELETE SET NULL NOT VALID;


--
-- TOC entry 3109 (class 2606 OID 16556)
-- Name: notification FK_notification_probleme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_probleme" FOREIGN KEY (num_probleme) REFERENCES public.probleme(num_probleme);


--
-- TOC entry 3104 (class 2606 OID 16526)
-- Name: probleme FK_probleme_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_lieu" FOREIGN KEY (num_lieu) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3105 (class 2606 OID 16568)
-- Name: probleme FK_probleme_probleme_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_probleme_type" FOREIGN KEY (num_probleme_type) REFERENCES public.probleme_type(num_probleme_type);


--
-- TOC entry 3120 (class 2606 OID 16913)
-- Name: probleme_tech FK_probleme_tech_lieu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_lieu" FOREIGN KEY (num_lieu_probleme_tech) REFERENCES public.lieu(num_lieu);


--
-- TOC entry 3121 (class 2606 OID 16928)
-- Name: probleme_tech FK_probleme_tech_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_type" FOREIGN KEY (num_probleme_tech_type) REFERENCES public.probleme_tech_type(num_probleme_tech_type) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3106 (class 2606 OID 16573)
-- Name: probleme FK_problemr_probleme_statut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_problemr_probleme_statut" FOREIGN KEY (num_probleme_statut) REFERENCES public.probleme_statut(num_probleme_statut);


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO acim;


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE app_user_recepteur_message; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.app_user_recepteur_message TO acim;


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE app_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.app_user TO acim;


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE decharge; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.decharge TO acim;


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE intervention; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.intervention TO acim;


--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE intervention_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.intervention_type TO acim;


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE lieu; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lieu TO acim;


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.materiel TO acim;


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE materiel_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.materiel_type TO acim;


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE probleme_tech; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_tech TO acim;


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE probleme_tech_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_tech_type TO acim;


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE view_intervention_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_full TO acim;


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE notification; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notification TO acim;


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE probleme; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme TO acim;


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE probleme_statut; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_statut TO acim;


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE probleme_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.probleme_type TO acim;


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE type_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.type_user TO acim;


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE view_notification_by_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_user TO acim;


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE view_notification_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_full TO acim;


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE decharge_materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.decharge_materiel TO acim;


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE message; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.message TO acim;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE view_annonce_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_annonce_full TO acim;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE view_annonce_recepteur_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_annonce_recepteur_full TO acim;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE view_app_user_tech_main; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_app_user_tech_main TO acim;


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE view_app_user_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_app_user_user TO acim;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE view_decharge_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_decharge_full TO acim;


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE view_intervention_done_today; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_done_today TO acim;


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE view_intervention_started; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_started TO acim;


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE view_intervention_undone; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_intervention_undone TO acim;


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE view_materiel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_materiel TO acim;


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE view_materiel_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_materiel_full TO acim;


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE view_message_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_message_full TO acim;


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE view_notification_by_tech_main; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_tech_main TO acim;


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE view_notification_by_user_intervention; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_by_user_intervention TO acim;


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE view_notification_tech_main_probleme_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_tech_main_probleme_full TO acim;


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE view_notification_user_probleme_full; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.view_notification_user_probleme_full TO acim;


-- Completed on 2021-10-25 12:28:24

--
-- PostgreSQL database dump complete
--

