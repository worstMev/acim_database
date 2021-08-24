PGDMP     %                    y            acim    13.3    13.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    acim    DATABASE     d   CREATE DATABASE acim WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Madagascar.1252';
    DROP DATABASE acim;
                postgres    false            �           0    0    DATABASE acim    COMMENT     q   COMMENT ON DATABASE acim IS 'base de donnees pour Application de Coordination des interventions de maintenance';
                   postgres    false    3264            �           0    0    DATABASE acim    ACL     $   GRANT ALL ON DATABASE acim TO acim;
                   postgres    false    3264            �           0    0    SCHEMA public    ACL     $   GRANT ALL ON SCHEMA public TO acim;
                   postgres    false    4                        3079    16406    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            !           1255    16835    before_insert_decharge()    FUNCTION     �   CREATE FUNCTION public.before_insert_decharge() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_decharge = gen_random_uuid();
	return NEW;
end;
$$;
 /   DROP FUNCTION public.before_insert_decharge();
       public          postgres    false                       1255    16825    before_insert_intervention()    FUNCTION     �   CREATE FUNCTION public.before_insert_intervention() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_intervention = gen_random_uuid();
	NEW.probleme_resolu = false;
	NEW.done = false ;
	return NEW;
end;
$$;
 3   DROP FUNCTION public.before_insert_intervention();
       public          postgres    false                       1255    16827 !   before_insert_intervention_type()    FUNCTION     �   CREATE FUNCTION public.before_insert_intervention_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_intervention_type = gen_random_uuid();
	return NEW;
end;
$$;
 8   DROP FUNCTION public.before_insert_intervention_type();
       public          postgres    false                       1255    16498    before_insert_lieu()    FUNCTION     �   CREATE FUNCTION public.before_insert_lieu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_lieu = gen_random_uuid();
	return NEW;
end;
$$;
 +   DROP FUNCTION public.before_insert_lieu();
       public          postgres    false            %           1255    16829    before_insert_materiel()    FUNCTION       CREATE FUNCTION public.before_insert_materiel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_materiel = gen_random_uuid();
-- 	NEW.num_materiel_type = ( SELECT num_materiel_type from materiel_type WHERE libelle_materiel_type = NEW.materiel_type );
	return NEW;
end;
$$;
 /   DROP FUNCTION public.before_insert_materiel();
       public          postgres    false                        1255    16833    before_insert_materiel_type()    FUNCTION     �   CREATE FUNCTION public.before_insert_materiel_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_materiel_type = gen_random_uuid();
	return NEW;
end;
$$;
 4   DROP FUNCTION public.before_insert_materiel_type();
       public          postgres    false            $           1255    16985    before_insert_message()    FUNCTION     �   CREATE FUNCTION public.before_insert_message() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin

	NEW.date_envoie = NOW();
	
	return NEW;
end;
$$;
 .   DROP FUNCTION public.before_insert_message();
       public          postgres    false                       1255    16566    before_insert_notification()    FUNCTION     �   CREATE FUNCTION public.before_insert_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_notification = gen_random_uuid();
	NEW.date_envoie = NOW();
	return NEW;
end;
$$;
 3   DROP FUNCTION public.before_insert_notification();
       public          postgres    false                       1255    16561    before_insert_probleme()    FUNCTION     �   CREATE FUNCTION public.before_insert_probleme() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme = gen_random_uuid();
	return NEW;
end;
$$;
 /   DROP FUNCTION public.before_insert_probleme();
       public          postgres    false                       1255    16497    before_insert_probleme_statut()    FUNCTION     �   CREATE FUNCTION public.before_insert_probleme_statut() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_statut = gen_random_uuid();
	return NEW;
end;
$$;
 6   DROP FUNCTION public.before_insert_probleme_statut();
       public          postgres    false                       1255    16903    before_insert_probleme_tech()    FUNCTION     �   CREATE FUNCTION public.before_insert_probleme_tech() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_tech = gen_random_uuid();
	return NEW;
end;
$$;
 4   DROP FUNCTION public.before_insert_probleme_tech();
       public          postgres    false            &           1255    16923 "   before_insert_probleme_tech_type()    FUNCTION     �   CREATE FUNCTION public.before_insert_probleme_tech_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_tech_type = gen_random_uuid();
	return NEW;
end;
$$;
 9   DROP FUNCTION public.before_insert_probleme_tech_type();
       public          postgres    false            
           1255    16479    before_insert_probleme_type()    FUNCTION     �   CREATE FUNCTION public.before_insert_probleme_type() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	NEW.num_probleme_type = gen_random_uuid();
	
	return NEW;
end ;
$$;
 4   DROP FUNCTION public.before_insert_probleme_type();
       public          postgres    false                       1255    16443    before_insert_user()    FUNCTION     �  CREATE FUNCTION public.before_insert_user() RETURNS trigger
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
 +   DROP FUNCTION public.before_insert_user();
       public          postgres    false            '           1255    16952    before_update_intervention()    FUNCTION        CREATE FUNCTION public.before_update_intervention() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	return new;
end;
$$;
 3   DROP FUNCTION public.before_update_intervention();
       public          postgres    false            #           1255    16502    deleteall()    FUNCTION     I  CREATE FUNCTION public.deleteall() RETURNS void
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
 "   DROP FUNCTION public.deleteall();
       public          postgres    false            "           1255    16837    deleteallintervention()    FUNCTION     �   CREATE FUNCTION public.deleteallintervention() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
	delete from intervention;
end;
$$;
 .   DROP FUNCTION public.deleteallintervention();
       public          postgres    false                       1255    16504    deleteallproblem()    FUNCTION     ?  CREATE FUNCTION public.deleteallproblem() RETURNS void
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
 )   DROP FUNCTION public.deleteallproblem();
       public          postgres    false                       1255    16503    deletealluser()    FUNCTION     a  CREATE FUNCTION public.deletealluser() RETURNS void
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
 &   DROP FUNCTION public.deletealluser();
       public          postgres    false            �            1259    16761    intervention    TABLE     �  CREATE TABLE public.intervention (
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
     DROP TABLE public.intervention;
       public         heap    postgres    false            �           0    0    TABLE intervention    COMMENT     [   COMMENT ON TABLE public.intervention IS 'intervention du type intervention_type .... euh';
          public          postgres    false    215            �           0    0    TABLE intervention    ACL     0   GRANT ALL ON TABLE public.intervention TO acim;
          public          postgres    false    215            )           1255    17009    get_intervention_by_day(date)    FUNCTION     9  CREATE FUNCTION public.get_intervention_by_day(jour_j date) RETURNS TABLE("like" public.intervention)
    LANGUAGE plpgsql
    AS $$ 
declare 
	res record;
begin 
		return query select *
		from intervention 
		where date_programme >= jour_j + time '00:00' 
		and date_programme <= jour_j + time '23:59';
end;
$$;
 ;   DROP FUNCTION public.get_intervention_by_day(jour_j date);
       public          postgres    false    215    215            (           1255    17003 .   get_intervention_by_interval(uuid, date, date)    FUNCTION     '  CREATE FUNCTION public.get_intervention_by_interval(num_app_user_tech_main uuid, start_date date, end_date date) RETURNS TABLE(jour date, nbintervs numeric)
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
		where date_programme >= jour_j + time '00:00' 
		and date_programme <= jour_j + time '23:59';
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
 p   DROP FUNCTION public.get_intervention_by_interval(num_app_user_tech_main uuid, start_date date, end_date date);
       public          postgres    false            �            1259    16395    app_user    TABLE     �   CREATE TABLE public.app_user (
    num_user uuid NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    type_user character varying NOT NULL,
    num_type_user uuid
);
    DROP TABLE public.app_user;
       public         heap    postgres    false            �           0    0    TABLE app_user    COMMENT     ^   COMMENT ON TABLE public.app_user IS 'for the user of the app : User , Tech_main , Dashboard';
          public          postgres    false    201            �           0    0    TABLE app_user    ACL     ,   GRANT ALL ON TABLE public.app_user TO acim;
          public          postgres    false    201            �            1259    16980    app_user_recepteur_message    TABLE     �   CREATE TABLE public.app_user_recepteur_message (
    num_app_user_recepteur uuid NOT NULL,
    num_message uuid NOT NULL,
    date_reception timestamp with time zone
);
 .   DROP TABLE public.app_user_recepteur_message;
       public         heap    postgres    false            �           0    0     TABLE app_user_recepteur_message    COMMENT     q   COMMENT ON TABLE public.app_user_recepteur_message IS 'correspondance entre message et destinataire du message';
          public          postgres    false    227            �           0    0     TABLE app_user_recepteur_message    ACL     >   GRANT ALL ON TABLE public.app_user_recepteur_message TO acim;
          public          postgres    false    227            �            1259    16799    decharge    TABLE     �   CREATE TABLE public.decharge (
    num_decharge uuid NOT NULL,
    num_intervention uuid,
    date_debut_decharge date NOT NULL,
    date_fin_decharge date
);
    DROP TABLE public.decharge;
       public         heap    postgres    false            �           0    0    TABLE decharge    COMMENT     \   COMMENT ON TABLE public.decharge IS 'decharge de materiel ... materiel va au bureau dsist';
          public          postgres    false    216            �           0    0    TABLE decharge    ACL     ,   GRANT ALL ON TABLE public.decharge TO acim;
          public          postgres    false    216            �            1259    16809    decharge_materiel    TABLE     �   CREATE TABLE public.decharge_materiel (
    num_decharge uuid NOT NULL,
    num_materiel uuid NOT NULL,
    configuration_origine text
);
 %   DROP TABLE public.decharge_materiel;
       public         heap    postgres    false            �           0    0    TABLE decharge_materiel    COMMENT     R   COMMENT ON TABLE public.decharge_materiel IS 'relation ( decharge -- materiel )';
          public          postgres    false    217            �           0    0    TABLE decharge_materiel    ACL     5   GRANT ALL ON TABLE public.decharge_materiel TO acim;
          public          postgres    false    217            �            1259    16732    intervention_type    TABLE     �   CREATE TABLE public.intervention_type (
    num_intervention_type uuid NOT NULL,
    libelle_intervention_type text NOT NULL,
    code_intervention_type text
);
 %   DROP TABLE public.intervention_type;
       public         heap    postgres    false            �           0    0    TABLE intervention_type    COMMENT     w   COMMENT ON TABLE public.intervention_type IS 'type d''intervention : installation , reponse a une notification , ...';
          public          postgres    false    212            �           0    0    TABLE intervention_type    ACL     5   GRANT ALL ON TABLE public.intervention_type TO acim;
          public          postgres    false    212            �            1259    16489    lieu    TABLE     T   CREATE TABLE public.lieu (
    num_lieu uuid NOT NULL,
    libelle text NOT NULL
);
    DROP TABLE public.lieu;
       public         heap    postgres    false            �           0    0 
   TABLE lieu    ACL     (   GRANT ALL ON TABLE public.lieu TO acim;
          public          postgres    false    204            �            1259    16748    materiel    TABLE     �   CREATE TABLE public.materiel (
    num_materiel uuid NOT NULL,
    num_materiel_type uuid NOT NULL,
    libelle_materiel text NOT NULL
);
    DROP TABLE public.materiel;
       public         heap    postgres    false            �           0    0    TABLE materiel    COMMENT     g   COMMENT ON TABLE public.materiel IS 'gere les materiels ,
libelle , comme : switch budget , mira-pc ';
          public          postgres    false    214            �           0    0    TABLE materiel    ACL     ,   GRANT ALL ON TABLE public.materiel TO acim;
          public          postgres    false    214            �            1259    16740    materiel_type    TABLE     t   CREATE TABLE public.materiel_type (
    num_materiel_type uuid NOT NULL,
    libelle_materiel_type text NOT NULL
);
 !   DROP TABLE public.materiel_type;
       public         heap    postgres    false            �           0    0    TABLE materiel_type    COMMENT     l   COMMENT ON TABLE public.materiel_type IS 'gere type de materiels : Switch , Ordinateurs , telephone , ...';
          public          postgres    false    213            �           0    0    TABLE materiel_type    ACL     1   GRANT ALL ON TABLE public.materiel_type TO acim;
          public          postgres    false    213            �            1259    16967    message    TABLE     �   CREATE TABLE public.message (
    num_message uuid NOT NULL,
    num_app_user_envoyeur uuid NOT NULL,
    date_envoie timestamp with time zone,
    contenu_message text
);
    DROP TABLE public.message;
       public         heap    postgres    false            �           0    0    TABLE message    COMMENT     m   COMMENT ON TABLE public.message IS 'message entre utilisateur , tech_main to tech_main , tech_main to user';
          public          postgres    false    226            �           0    0    TABLE message    ACL     +   GRANT ALL ON TABLE public.message TO acim;
          public          postgres    false    226            �            1259    16541    notification    TABLE     (  CREATE TABLE public.notification (
    num_notification uuid NOT NULL,
    num_app_user_user uuid NOT NULL,
    num_app_user_tech_main uuid,
    num_probleme uuid NOT NULL,
    date_envoie timestamp with time zone NOT NULL,
    date_reponse timestamp with time zone,
    num_intervention uuid
);
     DROP TABLE public.notification;
       public         heap    postgres    false            �           0    0    TABLE notification    COMMENT     �   COMMENT ON TABLE public.notification IS 'notification envoye par un utilisateur , concernant un probleme , repondu par un technicien';
          public          postgres    false    207            �           0    0    TABLE notification    ACL     0   GRANT ALL ON TABLE public.notification TO acim;
          public          postgres    false    207            �            1259    16518    probleme    TABLE     �   CREATE TABLE public.probleme (
    num_probleme uuid NOT NULL,
    num_probleme_type uuid NOT NULL,
    num_lieu uuid NOT NULL,
    num_probleme_statut uuid NOT NULL,
    remarque text
);
    DROP TABLE public.probleme;
       public         heap    postgres    false            �           0    0    TABLE probleme    COMMENT     k   COMMENT ON TABLE public.probleme IS 'enregistre les probleme a partir des probleme types , lieu , statut';
          public          postgres    false    206            �           0    0    TABLE probleme    ACL     ,   GRANT ALL ON TABLE public.probleme TO acim;
          public          postgres    false    206            �            1259    16481    probleme_statut    TABLE     �   CREATE TABLE public.probleme_statut (
    num_probleme_statut uuid NOT NULL,
    libelle text NOT NULL,
    code text NOT NULL
);
 #   DROP TABLE public.probleme_statut;
       public         heap    postgres    false            �           0    0    TABLE probleme_statut    ACL     3   GRANT ALL ON TABLE public.probleme_statut TO acim;
          public          postgres    false    203            �            1259    16905    probleme_tech    TABLE     �   CREATE TABLE public.probleme_tech (
    num_probleme_tech uuid NOT NULL,
    num_lieu_probleme_tech uuid,
    remarque text,
    num_probleme_tech_type uuid
);
 !   DROP TABLE public.probleme_tech;
       public         heap    postgres    false            �           0    0    TABLE probleme_tech    COMMENT     b   COMMENT ON TABLE public.probleme_tech IS 'occurence d''un type de probleme_tech, lieu ,remarque';
          public          postgres    false    222            �           0    0    TABLE probleme_tech    ACL     1   GRANT ALL ON TABLE public.probleme_tech TO acim;
          public          postgres    false    222            �            1259    16890    probleme_tech_type    TABLE     �   CREATE TABLE public.probleme_tech_type (
    num_probleme_tech_type uuid NOT NULL,
    libelle_probleme_tech_type text NOT NULL
);
 &   DROP TABLE public.probleme_tech_type;
       public         heap    postgres    false            �           0    0    TABLE probleme_tech_type    COMMENT     m   COMMENT ON TABLE public.probleme_tech_type IS 'probleme plus specifique , jargon du technicien , technique';
          public          postgres    false    221            �           0    0    TABLE probleme_tech_type    ACL     6   GRANT ALL ON TABLE public.probleme_tech_type TO acim;
          public          postgres    false    221            �            1259    16471    probleme_type    TABLE     ~   CREATE TABLE public.probleme_type (
    num_probleme_type uuid NOT NULL,
    libelle text NOT NULL,
    code text NOT NULL
);
 !   DROP TABLE public.probleme_type;
       public         heap    postgres    false            �           0    0    TABLE probleme_type    COMMENT     =   COMMENT ON TABLE public.probleme_type IS 'type de probleme';
          public          postgres    false    202            �           0    0    TABLE probleme_type    ACL     1   GRANT ALL ON TABLE public.probleme_type TO acim;
          public          postgres    false    202            �            1259    16505 	   type_user    TABLE     v   CREATE TABLE public.type_user (
    num_type_user uuid NOT NULL,
    code text NOT NULL,
    libelle text NOT NULL
);
    DROP TABLE public.type_user;
       public         heap    postgres    false            �           0    0    TABLE type_user    COMMENT     r   COMMENT ON TABLE public.type_user IS 'pour les types d''utilisateur de l''application : USER , TECH_MAIN , DASH';
          public          postgres    false    205            �           0    0    TABLE type_user    ACL     -   GRANT ALL ON TABLE public.type_user TO acim;
          public          postgres    false    205            �            1259    16987    view_app_user_tech_main    VIEW     /  CREATE VIEW public.view_app_user_tech_main AS
 SELECT app_user.num_user,
    app_user.username,
    app_user.num_type_user
   FROM public.app_user
  WHERE (app_user.num_type_user = ( SELECT type_user.num_type_user
           FROM public.type_user
          WHERE (type_user.code = 'TECH_MAIN'::text)));
 *   DROP VIEW public.view_app_user_tech_main;
       public          postgres    false    201    201    201    205    205            �           0    0    TABLE view_app_user_tech_main    ACL     ;   GRANT ALL ON TABLE public.view_app_user_tech_main TO acim;
          public          postgres    false    228            �            1259    16817    view_app_user_user    VIEW     T  CREATE VIEW public.view_app_user_user AS
 SELECT app_user.num_user,
    app_user.username,
    app_user.password,
    app_user.type_user,
    app_user.num_type_user
   FROM public.app_user
  WHERE (app_user.num_type_user = ( SELECT type_user.num_type_user
           FROM public.type_user
          WHERE (type_user.code = 'USER'::text)));
 %   DROP VIEW public.view_app_user_user;
       public          postgres    false    201    201    201    201    205    205    201            �           0    0    TABLE view_app_user_user    ACL     6   GRANT ALL ON TABLE public.view_app_user_user TO acim;
          public          postgres    false    218            �            1259    16962    view_decharge_full    VIEW     �  CREATE VIEW public.view_decharge_full AS
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
 %   DROP VIEW public.view_decharge_full;
       public          postgres    false    216    217    217    217    216    216    216    215    215    214    214    214    213    213    201    201            �           0    0    TABLE view_decharge_full    ACL     6   GRANT ALL ON TABLE public.view_decharge_full TO acim;
          public          postgres    false    225            �            1259    16933    view_intervention_full    VIEW     N  CREATE VIEW public.view_intervention_full AS
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
 )   DROP VIEW public.view_intervention_full;
       public          postgres    false    222    213    213    214    212    204    204    201    214    221    221    222    222    212    222    201    215    215    215    215    215    215    215    215    215    215    215    215    215    215    216    216    214    212            �           0    0    TABLE view_intervention_full    ACL     :   GRANT ALL ON TABLE public.view_intervention_full TO acim;
          public          postgres    false    223            �            1259    16938    view_intervention_undone    VIEW     }  CREATE VIEW public.view_intervention_undone AS
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
  WHERE ((intervention.done = false) AND (intervention.date_fin IS NULL) AND (intervention.date_fin IS NULL));
 +   DROP VIEW public.view_intervention_undone;
       public          postgres    false    215    215    215    215    215    215    215    215    201    201    204    204    215    222    222    221    221    215    215    215    215    215    212    212    212            �           0    0    TABLE view_intervention_undone    ACL     <   GRANT ALL ON TABLE public.view_intervention_undone TO acim;
          public          postgres    false    224            �            1259    16886    view_materiel    VIEW     �   CREATE VIEW public.view_materiel AS
 SELECT materiel.num_materiel_type,
    materiel.num_materiel,
    materiel.libelle_materiel,
    materiel_type.libelle_materiel_type
   FROM (public.materiel
     JOIN public.materiel_type USING (num_materiel_type));
     DROP VIEW public.view_materiel;
       public          postgres    false    213    213    214    214    214            �           0    0    TABLE view_materiel    ACL     1   GRANT ALL ON TABLE public.view_materiel TO acim;
          public          postgres    false    220            �            1259    16991    view_message_full    VIEW     �  CREATE VIEW public.view_message_full AS
 SELECT message.num_message,
    message.num_app_user_envoyeur,
    message.date_envoie,
    message.contenu_message,
    envoyeur.username AS envoyeur_username,
    app_user_recepteur_message.num_app_user_recepteur,
    recepteur.username AS recepteur_username,
    app_user_recepteur_message.date_reception
   FROM (((public.app_user envoyeur
     JOIN public.message ON ((message.num_app_user_envoyeur = envoyeur.num_user)))
     JOIN public.app_user_recepteur_message USING (num_message))
     JOIN public.app_user recepteur ON ((app_user_recepteur_message.num_app_user_recepteur = recepteur.num_user)));
 $   DROP VIEW public.view_message_full;
       public          postgres    false    227    227    227    201    201    226    226    226    226            �           0    0    TABLE view_message_full    ACL     5   GRANT ALL ON TABLE public.view_message_full TO acim;
          public          postgres    false    229            �            1259    16718    view_notification_by_tech_main    VIEW     /  CREATE VIEW public.view_notification_by_tech_main AS
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
 1   DROP VIEW public.view_notification_by_tech_main;
       public          postgres    false    207    207    207    207    207    207    207    206    206    206    206    206    205    205    204    204    203    203    202    202    202    201    201    201            �           0    0 $   TABLE view_notification_by_tech_main    ACL     B   GRANT ALL ON TABLE public.view_notification_by_tech_main TO acim;
          public          postgres    false    210            �            1259    16723    view_notification_by_user    VIEW     [  CREATE VIEW public.view_notification_by_user AS
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
 ,   DROP VIEW public.view_notification_by_user;
       public          postgres    false    207    206    207    207    207    207    207    207    201    201    201    202    202    202    203    203    203    204    204    205    205    206    206    206    206            �           0    0    TABLE view_notification_by_user    ACL     =   GRANT ALL ON TABLE public.view_notification_by_user TO acim;
          public          postgres    false    211            �            1259    16860 &   view_notification_by_user_intervention    VIEW     w  CREATE VIEW public.view_notification_by_user_intervention AS
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
 9   DROP VIEW public.view_notification_by_user_intervention;
       public          postgres    false    215    211    211    211    211    211    211    211    211    211    211    211    211    211    211    215    215    215    215    215    215    215    215    215    215    215    215    215    212    212    212    211    211            �           0    0 ,   TABLE view_notification_by_user_intervention    ACL     J   GRANT ALL ON TABLE public.view_notification_by_user_intervention TO acim;
          public          postgres    false    219            �            1259    16659 )   view_notification_tech_main_probleme_full    VIEW     �  CREATE VIEW public.view_notification_tech_main_probleme_full AS
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
 <   DROP VIEW public.view_notification_tech_main_probleme_full;
       public          postgres    false    207    201    201    201    207    207    207    206    202    202    203    204    204    205    205    203    206    206    206    202    206    207    207            �           0    0 /   TABLE view_notification_tech_main_probleme_full    ACL     M   GRANT ALL ON TABLE public.view_notification_tech_main_probleme_full TO acim;
          public          postgres    false    208            �            1259    16675 $   view_notification_user_probleme_full    VIEW       CREATE VIEW public.view_notification_user_probleme_full AS
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
 7   DROP VIEW public.view_notification_user_probleme_full;
       public          postgres    false    204    207    207    207    207    207    207    206    206    201    201    201    202    202    202    203    203    203    206    206    206    205    205    204            �           0    0 *   TABLE view_notification_user_probleme_full    ACL     H   GRANT ALL ON TABLE public.view_notification_user_probleme_full TO acim;
          public          postgres    false    209            �          0    16395    app_user 
   TABLE DATA           Z   COPY public.app_user (num_user, username, password, type_user, num_type_user) FROM stdin;
    public          postgres    false    201   (      �          0    16980    app_user_recepteur_message 
   TABLE DATA           i   COPY public.app_user_recepteur_message (num_app_user_recepteur, num_message, date_reception) FROM stdin;
    public          postgres    false    227   �      �          0    16799    decharge 
   TABLE DATA           j   COPY public.decharge (num_decharge, num_intervention, date_debut_decharge, date_fin_decharge) FROM stdin;
    public          postgres    false    216   7      �          0    16809    decharge_materiel 
   TABLE DATA           ^   COPY public.decharge_materiel (num_decharge, num_materiel, configuration_origine) FROM stdin;
    public          postgres    false    217   )      �          0    16761    intervention 
   TABLE DATA             COPY public.intervention (num_intervention, num_app_user_tech_main_creator, num_probleme_constate, num_materiel, num_lieu_intervention, num_intervention_type, num_intervention_pere, motif, log, date_programme, date_debut, date_fin, probleme_resolu, done) FROM stdin;
    public          postgres    false    215   �      �          0    16732    intervention_type 
   TABLE DATA           u   COPY public.intervention_type (num_intervention_type, libelle_intervention_type, code_intervention_type) FROM stdin;
    public          postgres    false    212   �+      �          0    16489    lieu 
   TABLE DATA           1   COPY public.lieu (num_lieu, libelle) FROM stdin;
    public          postgres    false    204   r,      �          0    16748    materiel 
   TABLE DATA           U   COPY public.materiel (num_materiel, num_materiel_type, libelle_materiel) FROM stdin;
    public          postgres    false    214   �,      �          0    16740    materiel_type 
   TABLE DATA           Q   COPY public.materiel_type (num_materiel_type, libelle_materiel_type) FROM stdin;
    public          postgres    false    213   �-      �          0    16967    message 
   TABLE DATA           c   COPY public.message (num_message, num_app_user_envoyeur, date_envoie, contenu_message) FROM stdin;
    public          postgres    false    226   .      �          0    16541    notification 
   TABLE DATA           �   COPY public.notification (num_notification, num_app_user_user, num_app_user_tech_main, num_probleme, date_envoie, date_reponse, num_intervention) FROM stdin;
    public          postgres    false    207   �@      �          0    16518    probleme 
   TABLE DATA           l   COPY public.probleme (num_probleme, num_probleme_type, num_lieu, num_probleme_statut, remarque) FROM stdin;
    public          postgres    false    206   HN      �          0    16481    probleme_statut 
   TABLE DATA           M   COPY public.probleme_statut (num_probleme_statut, libelle, code) FROM stdin;
    public          postgres    false    203   
S      �          0    16905    probleme_tech 
   TABLE DATA           t   COPY public.probleme_tech (num_probleme_tech, num_lieu_probleme_tech, remarque, num_probleme_tech_type) FROM stdin;
    public          postgres    false    222   �S      �          0    16890    probleme_tech_type 
   TABLE DATA           `   COPY public.probleme_tech_type (num_probleme_tech_type, libelle_probleme_tech_type) FROM stdin;
    public          postgres    false    221   X      �          0    16471    probleme_type 
   TABLE DATA           I   COPY public.probleme_type (num_probleme_type, libelle, code) FROM stdin;
    public          postgres    false    202   �X      �          0    16505 	   type_user 
   TABLE DATA           A   COPY public.type_user (num_type_user, code, libelle) FROM stdin;
    public          postgres    false    205   FY      �           2606    16984 7   app_user_recepteur_message PK_app_user_recpteur_message 
   CONSTRAINT     �   ALTER TABLE ONLY public.app_user_recepteur_message
    ADD CONSTRAINT "PK_app_user_recpteur_message" PRIMARY KEY (num_app_user_recepteur, num_message);
 c   ALTER TABLE ONLY public.app_user_recepteur_message DROP CONSTRAINT "PK_app_user_recpteur_message";
       public            postgres    false    227    227            �           2606    16816 &   decharge_materiel PK_decharge_materiel 
   CONSTRAINT     ~   ALTER TABLE ONLY public.decharge_materiel
    ADD CONSTRAINT "PK_decharge_materiel" PRIMARY KEY (num_decharge, num_materiel);
 R   ALTER TABLE ONLY public.decharge_materiel DROP CONSTRAINT "PK_decharge_materiel";
       public            postgres    false    217    217            �           2606    16545    notification PK_notificaction 
   CONSTRAINT     k   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "PK_notificaction" PRIMARY KEY (num_notification);
 I   ALTER TABLE ONLY public.notification DROP CONSTRAINT "PK_notificaction";
       public            postgres    false    207            �           2606    16525    probleme PK_probleme 
   CONSTRAINT     ^   ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "PK_probleme" PRIMARY KEY (num_probleme);
 @   ALTER TABLE ONLY public.probleme DROP CONSTRAINT "PK_probleme";
       public            postgres    false    206            �           2606    16512    type_user PK_type_user 
   CONSTRAINT     a   ALTER TABLE ONLY public.type_user
    ADD CONSTRAINT "PK_type_user" PRIMARY KEY (num_type_user);
 B   ALTER TABLE ONLY public.type_user DROP CONSTRAINT "PK_type_user";
       public            postgres    false    205            �           2606    16402    app_user PK_user 
   CONSTRAINT     V   ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "PK_user" PRIMARY KEY (num_user);
 <   ALTER TABLE ONLY public.app_user DROP CONSTRAINT "PK_user";
       public            postgres    false    201            �           2606    16803    decharge decharge_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT decharge_pkey PRIMARY KEY (num_decharge);
 @   ALTER TABLE ONLY public.decharge DROP CONSTRAINT decharge_pkey;
       public            postgres    false    216            �           2606    16768    intervention intervention_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT intervention_pkey PRIMARY KEY (num_intervention);
 H   ALTER TABLE ONLY public.intervention DROP CONSTRAINT intervention_pkey;
       public            postgres    false    215            �           2606    16739 (   intervention_type intervention_type_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.intervention_type
    ADD CONSTRAINT intervention_type_pkey PRIMARY KEY (num_intervention_type);
 R   ALTER TABLE ONLY public.intervention_type DROP CONSTRAINT intervention_type_pkey;
       public            postgres    false    212            �           2606    16496    lieu lieu_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pkey PRIMARY KEY (num_lieu);
 8   ALTER TABLE ONLY public.lieu DROP CONSTRAINT lieu_pkey;
       public            postgres    false    204            �           2606    16755    materiel materiel_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT materiel_pkey PRIMARY KEY (num_materiel);
 @   ALTER TABLE ONLY public.materiel DROP CONSTRAINT materiel_pkey;
       public            postgres    false    214            �           2606    16747     materiel_type materiel_type_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.materiel_type
    ADD CONSTRAINT materiel_type_pkey PRIMARY KEY (num_materiel_type);
 J   ALTER TABLE ONLY public.materiel_type DROP CONSTRAINT materiel_type_pkey;
       public            postgres    false    213            �           2606    16974    message message_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (num_message);
 >   ALTER TABLE ONLY public.message DROP CONSTRAINT message_pkey;
       public            postgres    false    226            �           2606    16488 $   probleme_statut probleme_statut_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.probleme_statut
    ADD CONSTRAINT probleme_statut_pkey PRIMARY KEY (num_probleme_statut);
 N   ALTER TABLE ONLY public.probleme_statut DROP CONSTRAINT probleme_statut_pkey;
       public            postgres    false    203            �           2606    16897 %   probleme_tech_type probleme_tech_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.probleme_tech_type
    ADD CONSTRAINT probleme_tech_pkey PRIMARY KEY (num_probleme_tech_type);
 O   ALTER TABLE ONLY public.probleme_tech_type DROP CONSTRAINT probleme_tech_pkey;
       public            postgres    false    221            �           2606    16912 !   probleme_tech probleme_tech_pkey1 
   CONSTRAINT     n   ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT probleme_tech_pkey1 PRIMARY KEY (num_probleme_tech);
 K   ALTER TABLE ONLY public.probleme_tech DROP CONSTRAINT probleme_tech_pkey1;
       public            postgres    false    222            �           2606    16478     probleme_type probleme_type_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.probleme_type
    ADD CONSTRAINT probleme_type_pkey PRIMARY KEY (num_probleme_type);
 J   ALTER TABLE ONLY public.probleme_type DROP CONSTRAINT probleme_type_pkey;
       public            postgres    false    202                       2620    16836    decharge before_insert_decharge    TRIGGER     �   CREATE TRIGGER before_insert_decharge BEFORE INSERT ON public.decharge FOR EACH ROW EXECUTE FUNCTION public.before_insert_decharge();
 8   DROP TRIGGER before_insert_decharge ON public.decharge;
       public          postgres    false    216    289                       2620    16826 '   intervention before_insert_intervention    TRIGGER     �   CREATE TRIGGER before_insert_intervention BEFORE INSERT ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention();
 @   DROP TRIGGER before_insert_intervention ON public.intervention;
       public          postgres    false    270    215                       2620    16828 1   intervention_type before_insert_intervention_type    TRIGGER     �   CREATE TRIGGER before_insert_intervention_type BEFORE INSERT ON public.intervention_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_intervention_type();
 J   DROP TRIGGER before_insert_intervention_type ON public.intervention_type;
       public          postgres    false    212    287                       2620    16501    lieu before_insert_lieu    TRIGGER     z   CREATE TRIGGER before_insert_lieu BEFORE INSERT ON public.lieu FOR EACH ROW EXECUTE FUNCTION public.before_insert_lieu();
 0   DROP TRIGGER before_insert_lieu ON public.lieu;
       public          postgres    false    272    204                       2620    16830    materiel before_insert_materiel    TRIGGER     �   CREATE TRIGGER before_insert_materiel BEFORE INSERT ON public.materiel FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel();
 8   DROP TRIGGER before_insert_materiel ON public.materiel;
       public          postgres    false    293    214                       2620    16834 )   materiel_type before_insert_materiel_type    TRIGGER     �   CREATE TRIGGER before_insert_materiel_type BEFORE INSERT ON public.materiel_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_materiel_type();
 B   DROP TRIGGER before_insert_materiel_type ON public.materiel_type;
       public          postgres    false    213    288                       2620    16986    message before_insert_message    TRIGGER     �   CREATE TRIGGER before_insert_message BEFORE INSERT ON public.message FOR EACH ROW EXECUTE FUNCTION public.before_insert_message();
 6   DROP TRIGGER before_insert_message ON public.message;
       public          postgres    false    292    226                       2620    16567 '   notification before_insert_notification    TRIGGER     �   CREATE TRIGGER before_insert_notification BEFORE INSERT ON public.notification FOR EACH ROW EXECUTE FUNCTION public.before_insert_notification();
 @   DROP TRIGGER before_insert_notification ON public.notification;
       public          postgres    false    273    207                       2620    16565    probleme before_insert_probleme    TRIGGER     �   CREATE TRIGGER before_insert_probleme BEFORE INSERT ON public.probleme FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme();
 8   DROP TRIGGER before_insert_probleme ON public.probleme;
       public          postgres    false    267    206                       2620    16499 -   probleme_statut before_insert_probleme_statut    TRIGGER     �   CREATE TRIGGER before_insert_probleme_statut BEFORE INSERT ON public.probleme_statut FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_statut();
 F   DROP TRIGGER before_insert_probleme_statut ON public.probleme_statut;
       public          postgres    false    271    203                       2620    16925 )   probleme_tech before_insert_probleme_tech    TRIGGER     �   CREATE TRIGGER before_insert_probleme_tech BEFORE INSERT ON public.probleme_tech FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech();
 B   DROP TRIGGER before_insert_probleme_tech ON public.probleme_tech;
       public          postgres    false    269    222                       2620    16927 3   probleme_tech_type before_insert_probleme_tech_type    TRIGGER     �   CREATE TRIGGER before_insert_probleme_tech_type BEFORE INSERT ON public.probleme_tech_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_tech_type();
 L   DROP TRIGGER before_insert_probleme_tech_type ON public.probleme_tech_type;
       public          postgres    false    221    294                       2620    16444    app_user before_insert_user    TRIGGER     ~   CREATE TRIGGER before_insert_user BEFORE INSERT ON public.app_user FOR EACH ROW EXECUTE FUNCTION public.before_insert_user();
 4   DROP TRIGGER before_insert_user ON public.app_user;
       public          postgres    false    268    201                       2620    16953 '   intervention before_update_intervention    TRIGGER     �   CREATE TRIGGER before_update_intervention BEFORE UPDATE ON public.intervention FOR EACH ROW EXECUTE FUNCTION public.before_update_intervention();
 @   DROP TRIGGER before_update_intervention ON public.intervention;
       public          postgres    false    295    215                       2620    16480 #   probleme_type ini_new_probleme_type    TRIGGER     �   CREATE TRIGGER ini_new_probleme_type BEFORE INSERT ON public.probleme_type FOR EACH ROW EXECUTE FUNCTION public.before_insert_probleme_type();
 <   DROP TRIGGER ini_new_probleme_type ON public.probleme_type;
       public          postgres    false    266    202            �           2606    16513    app_user FK_app_user_type_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT "FK_app_user_type_user" FOREIGN KEY (num_type_user) REFERENCES public.type_user(num_type_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public.app_user DROP CONSTRAINT "FK_app_user_type_user";
       public          postgres    false    3041    205    201            	           2606    16804 !   decharge FK_decharge_intervention    FK CONSTRAINT     �   ALTER TABLE ONLY public.decharge
    ADD CONSTRAINT "FK_decharge_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention);
 M   ALTER TABLE ONLY public.decharge DROP CONSTRAINT "FK_decharge_intervention";
       public          postgres    false    215    216    3053                       2606    16769 7   intervention FK_intervention_app_user_tech_main_creator    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_app_user_tech_main_creator" FOREIGN KEY (num_app_user_tech_main_creator) REFERENCES public.app_user(num_user);
 c   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_app_user_tech_main_creator";
       public          postgres    false    201    215    3033                       2606    16794 .   intervention FK_intervention_intervention_pere    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_pere" FOREIGN KEY (num_intervention_pere) REFERENCES public.intervention(num_intervention) NOT VALID;
 Z   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_intervention_pere";
       public          postgres    false    215    3053    215                       2606    16789 .   intervention FK_intervention_intervention_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_intervention_type" FOREIGN KEY (num_intervention_type) REFERENCES public.intervention_type(num_intervention_type);
 Z   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_intervention_type";
       public          postgres    false    215    3047    212                       2606    16784 !   intervention FK_intervention_lieu    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_lieu" FOREIGN KEY (num_lieu_intervention) REFERENCES public.lieu(num_lieu);
 M   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_lieu";
       public          postgres    false    204    3039    215                       2606    16779 %   intervention FK_intervention_materiel    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_materiel" FOREIGN KEY (num_materiel) REFERENCES public.materiel(num_materiel);
 Q   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_materiel";
       public          postgres    false    214    215    3051                       2606    16918 *   intervention FK_intervention_probleme_tech    FK CONSTRAINT     �   ALTER TABLE ONLY public.intervention
    ADD CONSTRAINT "FK_intervention_probleme_tech" FOREIGN KEY (num_probleme_constate) REFERENCES public.probleme_tech(num_probleme_tech) NOT VALID;
 V   ALTER TABLE ONLY public.intervention DROP CONSTRAINT "FK_intervention_probleme_tech";
       public          postgres    false    3061    215    222                       2606    16756 "   materiel FK_materiel_material_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.materiel
    ADD CONSTRAINT "FK_materiel_material_type" FOREIGN KEY (num_materiel_type) REFERENCES public.materiel_type(num_materiel_type) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.materiel DROP CONSTRAINT "FK_materiel_material_type";
       public          postgres    false    214    213    3049                       2606    16975 $   message FK_message_app_user_envoyeur    FK CONSTRAINT     �   ALTER TABLE ONLY public.message
    ADD CONSTRAINT "FK_message_app_user_envoyeur" FOREIGN KEY (num_app_user_envoyeur) REFERENCES public.app_user(num_user);
 P   ALTER TABLE ONLY public.message DROP CONSTRAINT "FK_message_app_user_envoyeur";
       public          postgres    false    3033    201    226            �           2606    16551 /   notification FK_notification_app_user_tech_main    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_tech_main" FOREIGN KEY (num_app_user_tech_main) REFERENCES public.app_user(num_user);
 [   ALTER TABLE ONLY public.notification DROP CONSTRAINT "FK_notification_app_user_tech_main";
       public          postgres    false    207    201    3033            �           2606    16546 *   notification FK_notification_app_user_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_app_user_user" FOREIGN KEY (num_app_user_user) REFERENCES public.app_user(num_user);
 V   ALTER TABLE ONLY public.notification DROP CONSTRAINT "FK_notification_app_user_user";
       public          postgres    false    201    3033    207                       2606    16838 )   notification FK_notification_intervention    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_intervention" FOREIGN KEY (num_intervention) REFERENCES public.intervention(num_intervention) ON DELETE SET NULL NOT VALID;
 U   ALTER TABLE ONLY public.notification DROP CONSTRAINT "FK_notification_intervention";
       public          postgres    false    215    207    3053                        2606    16556 %   notification FK_notification_probleme    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_notification_probleme" FOREIGN KEY (num_probleme) REFERENCES public.probleme(num_probleme);
 Q   ALTER TABLE ONLY public.notification DROP CONSTRAINT "FK_notification_probleme";
       public          postgres    false    3043    207    206            �           2606    16526    probleme FK_probleme_lieu    FK CONSTRAINT     �   ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_lieu" FOREIGN KEY (num_lieu) REFERENCES public.lieu(num_lieu);
 E   ALTER TABLE ONLY public.probleme DROP CONSTRAINT "FK_probleme_lieu";
       public          postgres    false    206    3039    204            �           2606    16568 "   probleme FK_probleme_probleme_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_probleme_probleme_type" FOREIGN KEY (num_probleme_type) REFERENCES public.probleme_type(num_probleme_type);
 N   ALTER TABLE ONLY public.probleme DROP CONSTRAINT "FK_probleme_probleme_type";
       public          postgres    false    206    202    3035            
           2606    16913 #   probleme_tech FK_probleme_tech_lieu    FK CONSTRAINT     �   ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_lieu" FOREIGN KEY (num_lieu_probleme_tech) REFERENCES public.lieu(num_lieu);
 O   ALTER TABLE ONLY public.probleme_tech DROP CONSTRAINT "FK_probleme_tech_lieu";
       public          postgres    false    204    3039    222                       2606    16928 #   probleme_tech FK_probleme_tech_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.probleme_tech
    ADD CONSTRAINT "FK_probleme_tech_type" FOREIGN KEY (num_probleme_tech_type) REFERENCES public.probleme_tech_type(num_probleme_tech_type) ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.probleme_tech DROP CONSTRAINT "FK_probleme_tech_type";
       public          postgres    false    3059    222    221            �           2606    16573 $   probleme FK_problemr_probleme_statut    FK CONSTRAINT     �   ALTER TABLE ONLY public.probleme
    ADD CONSTRAINT "FK_problemr_probleme_statut" FOREIGN KEY (num_probleme_statut) REFERENCES public.probleme_statut(num_probleme_statut);
 P   ALTER TABLE ONLY public.probleme DROP CONSTRAINT "FK_problemr_probleme_statut";
       public          postgres    false    3037    203    206            �   �  x����n1���{u�����Q��6��6�B���8P��]�@��f� �k��|.�$���F	#Y��)��iK�B�9�oZվ�l��?��Hx��zr?�~/��j'����`��Hf0,C��z�ڤ攥��	�R���LL�S
i�0Gc	�bPg����:9�l����[ڼ^hwj�o�y�K��y����=���<�du���}�.�B�Y����Źx�KƔj g暚��5KH�ȡU��4BMZA�B���aQ�GT!�h�
S��ӧ��[�������������t�w�ݎ�S>�@b1ʂ����A�EM�Xc�������՞�ĘEH�p�U�xhl`�ϻ����k�;�H�/?>�Nc��	uf6|$�D`.5�F����3��2����h4�����      �   V  x��ZIn$9<w���&|%����p��ƨ� ��B#�C���T�0��E�9��(��ldNmՙb�^��b�?���=�k2-95j�X�R����?���$����)�P��!�S����6�g�\{2Ғ"'�<��V�b{�e�lb�I$�!�r�Yr�R~�I:�XO�7.��R�R�m�y�&�6H�\:ON�j"�S˺�8�ze�BK��"̍�4|��@a��0�͸�vM��7X5���L��n���o �4y�?��e�]����������7nmi�^l����Qe�2Sg:���\;R��]����m�5c�,y+g��R+�'-�so��u��C�R�e���c�Wj��d�#���л�6**U_A���T�"63w洋�&�w6IK�}jUi��E�)�����P��J�0/��}�Jh�^tm�y�W��T{�_���F)���LP1,�VnUHs{��O�G���S��4Py�Ip
)s��k���V(�b#�^�`tW`��h��Ϥ�����-�APx��Okk�(�`���V��&Cwy~�Ɗ=H�:/���$giɲ�Էa6�{��~���|���RX�Fw&f�i]�[.\ߨ �p�ש~�V�Kq#�`愆��Z�y�z��)��[8�ry�E��^�	?u��[���<�W$)����4H����Rn��2V�1I���K�乣�T�
[���PbA��0�����hZ��N���nI��C�5,Rp��]ְ��\Oz,��A���s;)y�ކ�_�nx1K� �<U�0V#����L�7Т�D�>���D4
UU�|�Z��U�i@~a�R�UR������o���c3����c�����%�<�)��m�l�q��UAȗΜ�$i�R��n�Q!�j9��`��֚
,dC����5���d��sWw��K&����9&���r�IѴ���d,�����@vA���X��Ǽ8�d��>��#�1���xܪ6��E��;���Š�/�����!��^�V�Y�Z��~w�f��c�!Zy�:fO�ѥ��o����=+��6�\���Lʜ)/�O��B�vD6Տ������o�v?��d�K/��c,��s
����'�r���Q�]���H0,	�d�n� ܚ�a/�w#�E�ҵm�:����<GCܥqh�2��>���oab��H�GO������Au6����Dk�g�r����Mu�Юt�Ā�B�g����R?a8;|�ZQ�j�����*KD�X	�U�]Mx��)s�6�W� ��+bO��%�%��A��Q�5�u�V6���P�>37��[�@X�������`�ȦQ���İY�.�lE��,���C����O>_.�����;��Q:�&�9��p�K=�A/�z;	�:�h�^�4�f^�aK�O�#�?q�f�;��Ik���(e�5�P��G_}A$'��1:��b��p=D��.Ȟ�����]d <�1���P0�,���EH�
ڿ�]���
�x��C��L0��K�0_��D���I�{�]�2+�hS��Y����8�9q$�c����l�!#�p�/ZX��c;"���rvuh��ڊ��m��Ag���A�~�}GKκ��0w�X[�WRE�m,p׆a��P���w���÷A^!UҐB��HL�5��a�#Z�]�uޟ���]��p��{M�6:��2�\��<������	wG���E���c�����@����~���(a˞:j���f��R��O#��YҀw����w#�1H%�*]� � �X�@(���Z[��|��BMP� >"U��WSCֺ�7>Y�;:�'��̆8'�Y�f�r~s�����`�UM�I�D��G/��-�}�$H���e[�cZS�y;�0��{����9�$4����:���cX�/��@vySƏAXՇC
;�5�#��ϻ�¨ܯ	�	1h��~W-�D��R�I��5)�n�Gv	˵����A��M?���D�{�qr����%-��	��]�χ1l"�PB Ϳ^ˆ�z���
F:�?�{ ��_�V�'|�P��[�r��G����i ,���p���z�*ҷ"��F�RaG�O�ܰ\�+�����s�n;���p�C�ní���k����dN�Mq�Ǝy�;8�#�Z��9����Fpg�����w���w����u�����ܰ�+��3z��,(�m�|�Ҵ����Fi�p}KZ�i􀉾���=֧4��P��f�䲪�kw��x0_��y5������e,�CC�Fp��E�e5����q��̔e�-����Q�X\Vw��-�G��
���E��򘻓���
���>���]�3
�t~�rݦ���&��`H�뼙�`�eY��%�� ����;9�8��D�0��?.k�Z�AQ7d�!��/����ݽl��H�_��Kt	���y�<�� B򎵠�Po���̩%��ef���Y�ʆBq�_dBÒ�D�b���l'���|dV0oş^�����C|G����^c��j� �2#�V�\aOΓ�BR�'��Z`⑊�+?)?L����:�6Ԥ�s�C6��kPEY���D��O9�aLa`��9�3�!��Xǯ6�"�Wy�?2_?Y���rT"4���?>�lp�Vd�q��/?R(���������5����$�~p`����5u������VTo�׭J��h��S��g��_��g��YJ�'�Ks�|N^Ð�T�+�P\t
чS�/ �.���w�	׈tDKqQc��m���F� �����[Qs�bT������,	�ƒ�yo�� ]֚4Rx?����������y?�}��䚹�}+}��I�QFj�|N,v�Q�@��Ar�H����c�� C-����:;��/ .�O�u����j�Si�J����9�׻������ly=�5��<�[��ѽ&���aNFq�"������� ���W�"�Z�s�s;�B��)~�$�s�.�`䝎��b�L<~e���ֳ�ߩ^���ȇ���.��@`��u����J�A�����
bO���u��H,��>&l��,г��'�QB������>��zw͍.F`�նs��q��B16�o�G~���}q]N �J���M���X;�wn}�6v��	�!r�� ���E�-T;GS�<����>���98����� {j��'�eZ�z!��ѣ��r��H���,�*lW����T`��X��S���Y!���������y�q��`�f̳�շ��<����wL�9�_P���Vَ��~�Ѣ�w�9<�[�� 3�2L�>[+EQ�Rx-�p�o�b}H>:5�w����R�	�qޠAN�:��-� r�p#��>������C�<      �   �  x�}UK�#6\�w!	t��`6������$5~���-������";i�A�7�,f��4ێǏ���;�����{Mt�؛�\h�q(��;d~��f[k� c|DU�W_7�W~�>i�=�DD���v�D��d��9z��$P��@�gm
G��ߊ�)����GsU�I�G)���M�]m����9�����Nk���q�����h��#4g^�ы��I�;O��p��3���E��]94yO*��^����U�gS��E��`�H�����{�P�v�z����A���>+���P�W���wqC��2\Y�����[���o'(>oJ[�j,]ߨE ��C�oo����+����1no$��l6T1p��mm+��Ѻ�y+&��))�i�ߙ�Gj�G(�;@f����L�@ܰ�_��w������tTw&�hi��+<9l�A�Ӈc�d��R�ћ���s|I�>�3N�n �
��AK��}�{#�����.~D9�1�[)��do�4�8�?�]�i� ^L��4�I��g����>��ΐpSZ���bK��� �z@ݽ��C���u����ug��Gt>��@�T�nK!��%ږ�z��6�N��j����r�C�'�WRy�#�Z��WA��K����<�����[��&1��K����ѹ1N�W���
����0>%g�K����ؓ7�bO�vL �c�ӫ ��w�x�A�l�E�E$��:��vuo�V��D��2������:�zM�W�Ѡ��4����x�l��%͵�>?�f�������0£z��A�W��C\���6��q��#���pw��Gͪ��w�/�缺� �����n�Rޙ�,�~��mac���ub	bz��p\�_�����\6V0��P�]��I���Lv���B�C/i���f�Tٱ00���C�ձ�۩66�E��w�w������x�|�a}���֝6��sm�.�C�=�� �C�      �   �  x��VK�7]O��`�D��:Yd�dCIdЀg�8ər�\,lg���)t�W���(ݛ�N��s�X���J�}*�'V3ܳ�����FK$\��n���̳�`���
Ͷ."���m(4x�1T�!������J��)��|�8iVv}�Z�����W��Ff���(�����X��4�^�gԲ��,�ho;4tP�:�:�U�^�V �,���К����yZ��3Vm�]Ű�cX�
u�:�������r#���{��1|�0�t��pИK�!@w�NQ��,	��c�h�޴������,��zο���`)
�Wj���#]Y��5���=�H=%>;ؒ��V�C,������!�$�ؠԥb�"��u���<�Z�Dk���n���p���嵪U;U�s�<��fX�ڔs[ψ��N��L{߭ e?�GI~=E�l�*�!��칂��l�f��h���[�����/o_��'�������9��V���^�������vU�"%j���Kt������W=4��>E���|�� P���<m�){��"�P�'鬥%z��)�<[�Tp��ԇ�x�o�o�.�:3\�"i5��V'����i,��v�UC`���(���խ���+����}�� ֣�s7�" �#T�Q�s�ɷ==E?.�w3sM�d�|�̴cFXG3L�3���O���f����DӲق W�Bgv����
��b���,_�`�f�v'��36�!�����"�2�
Pm��c�ġ�_X�I��-F�o����;:���_���g�������Uw���A�C�0����;x�j��ԕYpާf���FԖͥy�]Eh��g(o���Î]�;J��un-�/�΍�-�57Q��ji����GP���#�q�A��귏�u��3�&      �      x��\�r\7�]�_Q���#	��Y�bֽ����rPTO����-�,�.�+%��`�reU�� '��s�҇�%EC14�;u�z�mF|�>����(�P�Δ��ɍ�ȡRn�Bbm>Zgrv�u1)k�$W��p.Ii�B�!�_ي5q��j��J��5T?�ϡ�1�ʭ�{�Q��E)Rkq̈́��P��s��D7�O��x��\nƟ�?�C9|�>\���W��^}�>�q��q���p���序���_����z�G�b�9����n~׷7�y�ۧ|���]ݶ�z�wFY���@��.��Y�Y����.)\��P�S���/�_�[�#�^�����r2Qf7ԧ5�*�*-�Ї�/b��ޔB756�k��{��*�y���K�`t�`�Hڰ#���W����1>���a�V}��'�&`*�[C!X�K���	�ϗ$��|�����/9˶(.֮�O�XF��r1#\�Ll��4Ʌ$��Q�9���Q�2�%�����!C���\D��զg��� IS&E.diH�M�	E��Y��Vhx�T���5������>�G���c���5i����}�C�������8�y��>���ß������8|��W��v|�9s��a$�� �%�{D|ɬ@ �<�K{*R���ژQ���L6%���O����߹���ᯁ����mi�=8�t!a���'���~�|f���43�4��m�R�`Z�̝��,ƕ�!8���9����"���s�@V�NgA�i,�x�b�0� �2C��L;�D�����/���d�};�/9�M�ҽ�Y!���"��T�O��3�m��7�ڨ�O9�-��^^���b��)c��Sθ*p��( ����$�^�KLo��	0��ߠ\:�ş{Ai�x�y��(,�1n
�@�e��GA4	��/d/b���N�9�;bT<h���\zY��Mۅ%�Yo����: ���<�l>�����W`���ϛ+���Wu�����6*g�e�7�B�F�ԩHa���(~���k25X��L"��ڻ�%ϠH0¥KK��v!^C�l�s�?)��:�	�5��`�ָ���ѱ����?��Ѻ���O�=O�-��z�E��g�XV�r/:�`-we֔�����ҍ�nRF{=��Z6���٭ŅK��|A�N� Z��A�s�v;$:�#=�,��\�<�=����&�2 p�ēH�"W�8Uk|�8YS��{�Ζ�-�}�XE�}�R�bB2�x13��)�,1�dDI�M��yC#�1�l s"YӚ:�myhC�ۙ��=%<}Nӽ��M�7�!*�c��6�sq�!����#�V; wRJ��k����	`f�J4��)�V@�ѻ���u?�ow6NtW�{��S�.��B-Coy�_�8H&͔CW@�{��Ο�#C�O$G�p/Y!�"��4�U)"��T�̮LOc��?�)���ݰu����}�8"�5���a󏶂/�"��x�S��6�n3�BW���+�ƂH��/�>N����kU�`�����~��e�X�T��T��%��a�5�e8'��<h��労|g7�����a���4�ÄU�&K�yv�Oݨ;����Q��|�L��x	��#������돷��߱x�տ�n>}�[����f�<�ۤ����Wih��)�����ȟ�t���J�D:@�A�0R�E���s'��mD"�<p��Ȓ�`&N�B�����&���gp>�Έ��iSr콲��|$W`�v$�`M�H��()�ù�:\
vl���3{u�M�iR`��f\]_�^�߯�a����;��P�T�@�I���M��4�҄.hH�i�n�WJ��0��M:M�s��E���垕��lp��#�$�bj�����qM��H�S5�n@ds�����AEd����������;د��3(�u�)��?OEk��>1��x�E�o�ٔ�i��z�[�a0�3Q2 ��Z�*9�~E�Z��T��r�3Й��y�&2Gr\�K�+|���g0�
s�p.
�"�Y|��(��Wt"�+-��P]��;�BGjik��V|	1���d��$�#M��u���ʻ�Μ�>%��{d�����a22��tq��H�g_�n����뇻T�%Ę7�l-p,�>�L�NE
4|O�>�65:�:X
%�#�ίW�{�b��8�Q�KK�<��ߋBZ��7DQ�V|M��"����O�ib]� L�z�w�ş�#H�W��G`�+�-��%Q@|Z�C��992���:M�i�F�}�}g=��N�1%m[��������OE�VJj�:�́@�̑ـM[q1�9���w�b�r�ǼІ���J���j�և)oʐ`f�×�����
��!I/���l��<��𧢵�����I-W,��T��=p����ng~�|�x�	���Rq�g��p���z9p�W�&H��/��KmEx��R�	h��nT���h�tD�0,2��0E��d�8�يߛ��K����X��ac�Rg�B�3^ǖB�k�j���nj6�h�A��h�!g���J��	�������;ğ]�(�n�&~I��xy�䜚+bzQv���+��QSڝ���~4W�'�hv�!~Qhqr?���4��4:�6��'��Q��=�7�w#��F��ˢ�^��<t�����bm�2��2����L���	 h5R[��ݐ � ��Ы~@k�������O[��o�g�O��#��A���=���;_�u�3&w.r��� &��\���0�Ś�έ!ߖWC�+�A�ebW�&���7�Ƿ�6���vz�=_zX0�t.�S�Z�ŋ��R2VѢ)Z�,^ӗT�ީt���-%m�{S��Ə>��
lv�c׸�d��$�Y��:��뢨�|���>�	�i��C����f��u���,�����{H>�s�>�V�%�0/d�ш;6;C�{��(DAA8��[[բ�����tųF���ֶ2?htG
�f�H��xX���R�6�֏���Y��k��=����{;?>Ѽ����rеi�p\6Y���m��0�N͊��Z�7�[hV�ma�=�H6w�����^��\�i����:n����ǣ|O������i�'�%����#��ux- ì~���L�0I�H�P9��>��E
�փA6�5�(ҪpI��P�[�`��(	�B��f��N��/�E�ag9/���̣,�7<�?��$S)�娽î�`��Ŷ�.h y� n�b26��g$<f�_yM.O���J	T��I�K�?��ER�v�n+�p�:�@c��S���q�S��0����H� �L��C�<��JlK1��>r�q��α�&���uca���Q��"�Q��Ou~?"�ւ�9"C,,#�����$Ӭ����j�K"�=}�u�:��z61g�V��Ϡ]��z#�j&'%�i�Ɛ�vV��J�9���ʪ��Ej�;G&Ǚ-��=尤c�yXi����'��*���FDRg[��H�s�d���z֖%�{D>��:%l������#c�|�(S�6vFd��=Y	��4�S�����F-&��f=�Ώ����5U;e1w�p"Q�"���DT�Cb�ٌO�������^.����/������܍�'V��t�����ES;0�L�e����? Ƴ�˱��tO�j�KF?�+g`��u����54K��2>_Gڊ���|���]m����)����q�Jꑶ��>5�L�f���|��	iu�h3�����D����j��ҟy�%-Q�SD���H�B��rA�+!��8
~\�m���ݵWOq���e�nzq��|��0U�Kui֝퐗^�5�g:�q�g��Qrj5p6!�f���StF�R*�I�߲��߹�� YC�����g�z�9��~�|�V��CD�[�u�P��k=���9��0!��K��9b��2��5U�_|� N<���,�z��_�n��T��"�ٲ�e��Mv���fF� �)��u���;�|�$2�%���־
!��D��5$Z��U�:yX��V��.��=0 �  �J���Xh Q��@\����.v���a��+2Yg�m�Ȝ�l�����6Zo�s�<���J�m�~�9��sq��'�j`��yLͲ�ϲ�W'�skSX�ޥ�]��(+��h�͐�[k�%z�Tfg�ae��8�<���C1�̢�jQ��8��尧�':��}��7q�-�U��-!��s�?���Vw�O!*�Xt)�L����[wb�s�#^��R&2�������Zx׷��c����[��%t��_7{�i�!om�3/����|?�Hn�����U�B�Fz�PB�����wQ�?�9*�:��l(ݩH�r���p��^��p��	���J�-��Ow��d��;)Đ��d�h�Ui��Y�\�KB�~+l7�'=7�-������
��J��s	Lw�7����;VCO�l�G��aԠ�+�spp�;F\�y��v�B�q�V���� �����ù�B�ޘ�������%�Ş����AM���w%��
O�T5i)�pFIu�^����ӆ�w��Yq���YtvI���<v�D�5���m0��0A�<_#�V��/��N�Akp;&�*!ՙ�DnV憽�p��&s/p����q���Q+�T���:W�gÁ��2��RϏ�q�zy%-�m�©h��r���ws ;�P�Zt���[�ƋX;c�^�y}���;�C'�oB�i�3]̕`�CE	�W�y��$���vB��mGz�  ]��u���ȡ[zu�N���tЄ�T��ք�[z]���.��w-!���;��9ߠc�X��(|.r����7t ��pZ�� �Ú��j}x�8�K;�]�q��g���*�{dX#P�g�uz�A�2��aCz:���	L�M3�蜥K,?`�m2���	2���<E�*�ij�/�~�)d-l�m�w�~��������6#i/7���fo"u��\~���k�o      �   �   x�%�A
�0 ��+z�b�4�<�B/Ul�	�I6�T4�~E�3Cd��.�"Ԡ�[@�-��Yb_b������Wᶬ5���4��x�˸!i!H�v�3�� ��0I#7�<+�nw��E�5���A�(A;���A�ܡ������+�q���R����k��q�㴈�V�=      �   g   x��A� ��܅F�x�nDk����I��r,[�Tg�6Y�g_���Ѧ��!݂�4�`]�y��~f�R׳
 2��D�T|1�94���,��8Y��G�ED/���      �   �   x���An0ϛ�PA�R�
��{��V���/���#�m-�����?��gI̕�B<�{�ĵX|�M8ս�������z~P�;Y
:���.u7cA�Y/ {����oׁ�
B���.�}�� ��ʈ�� �Wa����eJŽ��x'�w�5`�:gDM����{��'�����?TV:      �   [   x��I�  ���KB)�/^
�ы&.���X�h0�&��E�25t�bf�J��l?��K/a�VI��tM�U�S3�L��?}�u�C�      �      x��[ˎ$Gr<���n{����W_�����NO7�����Q_��~Q� ���Z��1l6��2����<����cɎg�N�/�*�R�կȇ�Ṣi��q��i��Z��n��`��Ğ���(_�<qz�x���?y�ӧ���z�cR�.�d�]M�9I�b���3h�|���>�hc�0MWGNN�t�&��Ck�>	g9����tK�Sx@�'#5"�RNG)��>�!Y��Sh�I�M
�����9�gG1ͷ�G[��~i�#�BKOAn5�C�:��F����*#n���%T3{�u�B�O�����VR�ui��,�J(�Q��ryj?��-.�YR9Y���S��J�*e�"�K�Πo@�8Ƈ��%�!P�;Y%�2y��5,���O���Ƥ1?��T��quCsm)��P+� ��>�4����:��
�rң�z�|�Y��D�T�B|b�yNXm�5�՞�1��Xm�9.�ǣ���#j�ƌ��~2��B��a�����#�G|7�C��8�?�rS�ѧ�	Q=��8	��Bq�����ϔN�I�Ŝ"?���g�`�DԺ��7p!6$�0��8'�h�nAK"���%_���'��P�i}X�J.t
M�Ho%	��چ�8bP'~��Y�E�+ԊJ���x��_o���w�z}~�)h7 ��cF��誯(��6Y��$: ��0J��U@n��$W��%�� �DO�˒4�C��Z]bB��!mm�]�a���}nm�* �(�h��Xf�ږ�-$H�ޥBр�ǙdG�p���zh�A�� t\�,G����Z�s9	�|�̩l\���_���5N�i,D���;BWZ,J��句��*!��!j	+`�a�<-#go�kC|��+��X�b����B�	��p�,Ҵ�����
MR�����e��!��y�&H@�-.�L�S��Iz\HT'�RA_����7��1WՑ��8��/,��0�@��(�O�p�V#q�{�o�z�Q�Š�!�����l�Wy\��`D7F��"������|z�t��W @C5��<CjZCzN4O����g�0��]�oc^f+�/	�#P	��%�%ǅ�($ѹ����o>���)T��[�@�>��@��\���)4�On���� �1���U��!Ld$��Fr����JC�v������2,��K
�x�w����x�� J�FTB�e��̍3��R�.Wp�X���+��ɕ�	d��]�?Ϸ��y��<�P���0 ����4�Մ4#����J7J ����e��������Nȼ86gE�c5�\�+#�D�!}���^k�p�4P�[`;�3��4�k?��GU���$p�!&���-�R�ǝM�w�+d���Ǔ�����*��\N��=zy��r	�M����^@�ŰE[9� �P�p�@!h��rˇ�r��QY�Á��eo=w�4� �w�. �ej(���׼G��I8V8���b����z��׿���s� d+A�Ȱ�3A�Ѥ�\�,O�J�R�>l���؊�tpf�u�L��sUq!����珃������&�~���AlS���A-<
��Z�8��;V���˃�ﵨ�����^�t���B�ȡƩ����,�	b�`w`������tAZ� ��Lh�q�Q�W�D�ö�1d�>_8D	O�)�$
65�-����H�zT�P�p�A��#.�!L*�~�<�9��e\03%
�,�%$J�����u��t(J����0*�J�!�@Ҝ�Bm'�o��'�o՘@"	̬��6t� u�����V��X�8�`��9>�������Ƈ^�	i���OL�c�4 �l�CԲn����m^�^����>AB{IЇo���!Sl���*S�#�?�&��)ނ�#$؄lmc��)h��:9^�o�9�<�Dv�d������R��'�T!P4��Rҭ��c�M�+7(��BH �;�TQ�ybC�ޡ8DG���=�aG��& D������]�$��,SVpZp��a�t*b�O·��&����&ȁT��=c"/].�����<��*��ʏ���II���Z�QC;]��&ǵ�F�r��ma�Q��ZTw�b2��*��3�A�C�'O7pa	;�|�|�����L��'�c=�H@����ͨ��A�$(�[���Рq�
��)�LpXh}H��pAqṧ6�� ~���a�����̾�\�	C��Db���R��*C��}����q��q��&�ާ����Ջϣ��*	����K�˜`��S�゙a#m4����1�%O,��op����Y�Zx�j�-ӛ?ZE�vir���l�Ѳi���۷�?_��+��h��7��K씩�	u[Ќ���\�N��~y�u^H$�`�g�f���f[�-Sө�`��Q��ֿ�rI��)h��a�Ш�fs���.ؿS�P�o ���O��S}�ӷ�����;��@:Qv�̢g���`�jM	���|�,X,tI�}3���e����v���1삒}�6]�!�*�:Ũ ���||�ׯ��z�ݮf��>���,��I�vG�{�:H�MӇ�ZN�����A>��3*�uK�����}Xp���������XּtW�ͳH���X�q�b}��{�*��}��&��̄��Wr��b�H;:6�|Ӥ�Y؀/��@�z��9uх^V�L=
s����fZ�VBA
t�+]8������u*��.w,���L_���8���^�
X}�C�i�%��ղ�뭭Ucg���M�I����cFS9B���@tb�}��gA3?'6�!�r�ǗI>��n4cE�<�J�<���yBxlpl�M��q��y)i��PQq��!d�"�!P�ĩ�:1$_h��6�_�f�D�ں��e'a�رX��Tg3 �Ts�'���%��C�#��ƭؑ#zl�|�ա�%g�39�6������~����_��ˀ��>C:%;��؟
RkU�hu�'v��+6ϔb,����͙.D�4��i�p%�)D�j��яN�p�%�+��E��oo����cd�k��'���*��3-�����|C�F�E�<�u��Ku���M;4?ä)���k4=���Bؚi�]��3���pL�IS���\Z�5D�Q�zoc:��m�5��-a�Î���Me�0�x����l���b��&L��ֳ6:��X�n������cp�X�
���p�5��<��l,V����p����:�ڂڲ�*�P�� �4�NLW�jlʊ��ݬ}{~������z�S�2������!���QU#du�����Bzp8s�MƠ���ޯz��^�K��ܒ��a}P����f0F�>�:
�DpiykL_?�~m���?q
���7VCh���k�m���A�xG���I��[�������|A´XV@{�y�9��x3��\�@��<�����D_"쯈#�y�S8��2wF��<ϜǙ]�F�7�ٴ���|��7�l��������η�����2�ۼ~~�߯���R�vqkh��N/��c���=:��x%��Z�k������[i:A(�/mo�A��>�����M�]���N*�M���Grp'���悫Wx�����vb�t�t<Xa�]��&���.�(����oX)X�A"�c��*������6Ίw0�~y��������v��]��@�(
H%
m�0Z�񦼟�ԿX�]�^U�����`�ɕ��8F� ů���D��$�{���@���,������X��98�' TX#9ڕxk�6��ӆv����������\$�q\�N��ܷ	��
���W;xFlxlC{)���n�L.1w�5 _��I��a���=Z�	�~p t�J��VD�o��$;�`���.�f��͡E6�
��
�ҍ�s�Ǻ 7���]��J0�T�piu�U3.�.�h�9���S�,xJ�hi0r٦���iRj��2Z�u���î7+lͮn Hp���^x��M�/
>��qG���7*Va����oo3�aCo'xP�=��'�-=��64�v�F5���2�B� nټ�_��	���&L{\�r�� �  ���.��GVw��sߡכ�`^�Z��WM��TÎm[;�v
�t�H��G,�ցIr��v���@��L�h�~G��#ӽ��*�Ӽ����lDXRw��~_o�R���
�$Z>�U/��1�e3��b����Ӱ�1��o����d���.�n:-(俢��Pr=��n;�Z�$����p]X]���b(5��G�w'��U�rpj�'�&��Gc��u��4H)�aڍP�k��Z>E�!��I�/�� l<����e��A���J�T��	8d Z�\��	M��R�9�ع4��X8�����6�l��ӏ��K�	�y�v+Q�ɗNx������~q!@�+�}3�;8�x�J�"q����%�6{���8x����M1$-�����vk��5N�_�a�s4��o��m>�pv�ﵔ�k}��haW�"L}�[�&	�{+��$T�j�����G �����hg�Hzx�8�]2�(UA���GE�;��b����7s�0�/�a��
s������e+��M��#̶���;*c���#*�4�_�\�!��@(vE<!�v�Զ��A��(�����h�M�Ŵ+5GBk��qdPJ4����ў�W��6H�~�3����ذ���m��~ԦM9{�|4Ow(ަ�Ы��߰��v�\�*	��      �   _  x���Kr;EǮUx�� ��"z=�w�K�Ô-Ke<�/l�X�"���a��E��N��{�T���Ӛ��~�5|�98�\�+��m:��i��n�G*�G�Ie)���eΤ'�S�,�G�~̾ũ�b�ӕq�k�s��d�/�y�{��&reI���x�����������;��}q+��b��J�_>���Ev�֓|���%�C���3o7�F~�S��y���^�7հV��r�j�5eY���.�^\WO�te;�}��_��e�1�����li��c^��z��^WV�fb���bw�s�{Y~�Tx�� o���D��T�i���^
[�%��B�ⳅ����G��S{y��;:���V�FȜM�PvK%�V\m���u����p}ht��ܭ��8��.柾���=�L��/=�XM�7bӊ�J�.Y�C߮Ͳ��*���>���t�̡'=ǒ�k55W�ؒ��U�+���s�U#3:�]�j~��Wl�W��͘�Pk�o*����c:K�L_�k�:b��J��>cm�h����8\���8�VvYif�)�V<ٯr��F�I��+51D�|Nu�Z�5�?�#���^�t��1�eL����$R���SP�C*{/�(���H�`�mmN�<J�)p�G�K�����<���̳յ���Ϡ�S�雗�,�u�?V��}3Yn�g�> �t/�ϰ��h{�2�I;?M�sd���(8���-��b��������l�
%�%uǺ���?71��KY�oZ̪�wM���R�ʃ�ث氘jd�O��B�gy: C1�*!����)I�cl�u��gA\��vZ�#��\��1fJ��+ MZ�+�W�\)�������(��Pq���dI�3���7ĸ@\�`��(��,Ў��X4#P�O�!:c�V��<sU����c�:4ME03Rz�6�o5�V[\�k
�;�i�L2���߼���5��m,	��$U�ڕ���T�~X�([X2�8r�"��"�V���%Uh���9�Pp�e���.�؏�壦P��oj��W�\�����R�w9ns�Z\ʛ-̍�G��ڨ[�${?ϝ:�rմ|+�
T�~aŽ�����x�����h14ꃛ����)^Ջ�j@>V�c�]���"�e�i�<��FK�Ӝ�Ňmm��(�Cﮂ�s�L;`�e�ba���H�F���5��qy���l1?��rUA6��3ǚoq���a����$�~CX�la�&��?� %Dq4>��������c�Tl���ЛW���+p�N��l9��Q��3�O��� �}.��*3�֤��,Yp���������n��Y���(��r�u��@>��x�f�����g4[�}���50K>J�m	���I�~��PK�	� Q��Q���xO�IEZ�Ryj�����}�F0?����#���� ^Ն��/�ا�g,NC��^�V
p l���|-q]	��a�umׅ�3�]�Ik�:��]�{��XUj��n@����BgL� �|�I		��yO1O��f�l��D���_��l��>��E��.���+~�������8��]z;.��mz: m�3�$��2��@֣�r��sb���:r$��K���I:�>Kˠ�5h^*�G<�A�7ǋ�aI���^O8�A�w�S�Lg�S�����c()A��ǂ�Q�U�y^{Hkz���5Gm��±;]�bm�NN==71��T����b����6�ՉPX��6B;��J�u���Hc<:C��,�4@Mtq���x�T5���+�i�)�E��8�Qc��0���著�xR���OƌŞz|g���9�,�EF�}��ѝ��c��Ra�5�gK��'���GƘ�9�6
��I�����O�����Ć-4w"�CG�������0���ȉ�?����Ckv���|hw�,c���U�6~�RZE�K���[�\�)����Pi��`�گ��|r�O����x��?ϓb=�㹋	`_1���=�r�d����d�s��O�U߰7O����-A�6*̰���j���y7��W2<��o���Ϟ@C��ΫU�
�^�?M*���$"5��8�w{�.NT�N�.!�|�8Z�
sa��������69�^)'G�yeV��&�*E��8�x��:�9��'GH8l,v.������?V��=�������6�8���`�Z��QÄ���+��I��ď��6�i�Wހ$�Y�yY�kҎE�ah��y�gܒ��%���������f@�!�vX�Y���̅(Qt<\5������f���ɋ,bt~��-���8��\C���x~f�t��c>7�1�i�~���1Q�}]��f�E�s�m��ha��Ywj�!��pL�}�D��@F-l Z%��ye�kFe�F�d�Ƞ~�7�_�Ч����\E�<���U�W�w��J����Ҍ$�b�}B,�8��=ФT2�����lŧ��u�CԱ�2Olz0LQ�d`�d�����g��9>W���Ǉ��t�0뛷+�<�ĳ�Ӷq,�*�a�� �I���펙�q�:�qW���Re��eր�m�ts>�{�0H�Z��>�|�����KL�|�����z���(�q�-ojY�&��/�@�+����<BN��Wh#ۄ�Q'���By�%&yA�Qq=D�4m�j �5`���$z��!-�I4=���v�wDc���ٹ;�,��
B�����0�E�����ۤ��VKC;V��Ov��!w�i�[d�#�Ҹ���l�鳡�7Ls�վ�[�r�><ǹ�!fBq���B��ɇe������v+C]��cN�;�(�{r�+A]�Z�~tX=�CTiE u	��1�_攴O8>�-&Y���r��|�8ŉ�t'X���)#"]J<��6z}n�3#ţ�9�x���_i0kU��D���2�4�pn)e�����hOR�ʷ�/�G�F�.:���,'��p^2q��̇�$������1��:w��1%���_��I���2=�E���1x^�5�<)<���+�蛊Y��|�3�yg��'��]	egpLIO�\��GF���e�Kd3�DF�;-k�-�r�I�C�y���a�	PA�z�_��?�N4>7\�I��s�?�r���K-G]�L�0�~&,�-�˂�y���R��bP������0����������χ[��\��y��0ӧ��g�cS��K�~�������)�Cg\x��Am������/����bLc\���r��w�ېd�T_X�Z��L\O��tn�2�9�-ؐ���O5�0N0�1}v��V��������sС�6H�;�җ��D�Ľ�p ���҅�;w�8�]fx�Mu,�3q�
"'D�m�MR3�5�������*���ǿW-]��S$�9s��ν
��c�\�X熙�2�����(���      �   �  x��X[�7��9E.�@������p����vr��t���鑪�EVqe���:�`%���O��YbV�~h�1��zS&Y#i�V��w�eh}oΧL�ތ��A��H��fU?���l;��� 9k��-$#t�zv�?��{�{��F"}�Yn�)Y4gY���T�z/@>������VN���^�%���Q�����}Q��jg���&�x)E�E*�t�����j��@)[�ꊏ� (�� ƐY�V�;ǟn�?�d�S��Un��2�Y_䊹w������%ˉ=+����_�j�m^�R�xy������3GN]<oWՎZ-f��l��;d�U�y��9|��K�;�}>����ӳq9�X��W�L�2�)"o�>|��<�,R� -���c�Q6�l��x���p1�����mS��5���>~���i�R����iaZ1
�-��\�5h�B�P:Y�N��f��n�=%7��*u; 5�!��)̮�
���oF^�el|&�<�I�C�?~���?�>�SJlG���tՋ��6��l�2��'���B��ڨ�粏��֕��[��^�&�6�� �k��w��E��d�M�5�/��F$:���=Ÿ�ѥ_��\��W1���h@�8��	]��r;WEQ�c�8@�C�Ra�d=��JY�4��@u7��%(�c�R�v�$ҹ�;����m�F݁���c@�.��LM��[j�L��>�Zi��YR.k�z�X�0�V�{Ut���d�rt�D��_U���JC@��A�ob�ኤ�2Q�A%�&8�� ���U �f;�d@Z��9��2;�*�c(�+R!�4�\x��(ٕ�t�<�&=����u���d�_L���V�PpBSS����
ߥ����K�^�����}�����������+7�9�=VX0��@��«�Җ�d�_D�¯U�>r���HV�����0@�֝6,ҬM>�C/v3׼�-�$D�D��8~J�����B*n'AW��Z��ܦ��r���k��lta������6)Mop���n�6ߊ�����a���bS��A�"�fs
�k��wph�'z����5Uk4������EpMpV��{Q��~MUL�A��6h�J~i+{gd���9��ٍ�`	,�`J�/yE̲�Sn�gD�$d���/'�]/���@�w�r������o�>�� э�9      �   �   x�E�;�0 �990J��3"�t����v&
*e��d�<=��7�(t���}���|o"l�U_��z�e3���"�ғC�\����	fצ���7��G�E���|�u"�0U���]$���*�+M͓��|�׽����0�      �   a  x��WQnm7�NV�Pac�����`l����u�w'ҩE��c���K��]���BR[�s4Z�TY�Z|�����/���� ��Z�KJ?,�>�ΐj���K�M��ɣK����x2w�N*��y���4ksh�N����tL�oVE�%��<9�$��N<�8��B����n<�"5��`��x]t��CzVE�!�Y������]?d�jc)��F9�}�}|��!������c����yE��Ъ{��n�����Ck�}�E�+@ALlQ]���(���__��y~�:?���hK��U�e�v#�d��xm���t?\7m)J��|
nZ2���Y�O|mu�Ѡ�$iT�l2�E<ko{���X�o�0���qm�R+�}�j��i���$�Pj��{6Hb��6�%rmj#��\(N��ui������pW4�h��p��V�^]]m/N��&��u<؉�\�c��zI+�uKJ��M���pE�ܦZ:;i����Ϛ�Y��t�h���ځ
�"p�9Ǳ�&޴ݖ�J[�����1R�G| �M<�=.��;�Q��^niX� W���o�9xE�W��0�>pf�'J;o��kց�@�N��'/�CK�7��u���7/�jhGݭ㹧ٛ�%ܽ�je[�˙Ca��[sHk����d�X����Z����-��?r'ڛ�4�����F��ՓL���S�>���'늪\hN�'"8i�LKDoz��ZC$ӡm:a��Ts��}*�k�����PJ� 	�����S��W��>�A˱�
�KL�)ީG��G��f�����<�`��J�ٰe�w=�t9 ����S��Q0Լ��F�o�Ҽ�y�7��ºK.���l��'=�@�2�ڌ+t`��=���b�p⎧ū=����:o0�E������qx�ʩ׎��%06�c{Zg�Qe&ʌ>���|�M��x��ͯam{/��7�C�Nb��{��P�a��~�Z�Wy�'�u!,d�p'(�j�N�:�WE��3�^C���;�4��5
�B�\�{��#<�B�34^kkb��gi�K��T{u��j�$�D~�:����7Eq{�zY�p�9��w� co�c0�������������g=      �   o   x���� �s��ց��%�f^>��q&&���P㜴z�59�Eк��Dg
ڦc�u�:x����@|��3TJ�YZp��;]|��X�]x��C?.��y݌1^�#�      �   �   x�]λ
�@@�z�+�#�}9�Zi�AR
�OL���������\���R`5+0�23&�l,�u�by���k��Ե�S��3LU���(T���-�q\�R�P��-�%���0>�a�Ew=��{w�Q�1Č&��P�%�
�ǀ�^��2gq��R~u�7�      �   �   x��Mn�0е}
.0���g��(,���R5����� ܿ����
ɘ�✄Xj�L ����.�ݷ{����d�����b(��Tm�J��iH��;����r�r+�֛6�as��Wt�
1�5�L�bȕ�L%����i��\N{g�Շ<��|x����5�     