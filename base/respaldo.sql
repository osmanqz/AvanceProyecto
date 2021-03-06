PGDMP     '    '                v         	   Historial    9.5.13    9.5.13     X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            [           1262    16448 	   Historial    DATABASE     �   CREATE DATABASE "Historial" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Historial";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            \           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ]           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ^           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16457 
   asignatura    TABLE     �   CREATE TABLE public.asignatura (
    codigo character varying NOT NULL,
    nombre character varying,
    departamento character varying,
    uv integer
);
    DROP TABLE public.asignatura;
       public         postgres    false    6            �            1259    16449 
   estudiante    TABLE     �   CREATE TABLE public.estudiante (
    id character varying NOT NULL,
    nombre character varying,
    carrera character varying,
    centro character varying
);
    DROP TABLE public.estudiante;
       public         postgres    false    6            �            1259    16465    estudianteasignatura    TABLE     �   CREATE TABLE public.estudianteasignatura (
    id_estudiante character varying NOT NULL,
    id_codigo character varying NOT NULL,
    "aÑo" character varying,
    periodo character varying NOT NULL
);
 (   DROP TABLE public.estudianteasignatura;
       public         postgres    false    6            �            1259    16496    estudianteseccion    TABLE     �   CREATE TABLE public.estudianteseccion (
    id_estudiante character varying NOT NULL,
    id_seccion character varying NOT NULL,
    "aÑo" character varying,
    periodo character varying NOT NULL
);
 %   DROP TABLE public.estudianteseccion;
       public         postgres    false    6            �            1259    16483    seccion    TABLE     �   CREATE TABLE public.seccion (
    idseccion character varying NOT NULL,
    horainicio character varying,
    horafinal character varying,
    id_asignatura character varying
);
    DROP TABLE public.seccion;
       public         postgres    false    6            R          0    16457 
   asignatura 
   TABLE DATA               F   COPY public.asignatura (codigo, nombre, departamento, uv) FROM stdin;
    public       postgres    false    182   |!       Q          0    16449 
   estudiante 
   TABLE DATA               A   COPY public.estudiante (id, nombre, carrera, centro) FROM stdin;
    public       postgres    false    181   �!       S          0    16465    estudianteasignatura 
   TABLE DATA               Y   COPY public.estudianteasignatura (id_estudiante, id_codigo, "aÑo", periodo) FROM stdin;
    public       postgres    false    183   "       U          0    16496    estudianteseccion 
   TABLE DATA               W   COPY public.estudianteseccion (id_estudiante, id_seccion, "aÑo", periodo) FROM stdin;
    public       postgres    false    185   E"       T          0    16483    seccion 
   TABLE DATA               R   COPY public.seccion (idseccion, horainicio, horafinal, id_asignatura) FROM stdin;
    public       postgres    false    184   z"       �           2606    16464    asignatura_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (codigo);
 D   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_pkey;
       public         postgres    false    182    182            �           2606    16456    estudiante_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.estudiante DROP CONSTRAINT estudiante_pkey;
       public         postgres    false    181    181            �           2606    16472    estudianteasignatura_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estudianteasignatura
    ADD CONSTRAINT estudianteasignatura_pkey PRIMARY KEY (id_estudiante, id_codigo, periodo);
 X   ALTER TABLE ONLY public.estudianteasignatura DROP CONSTRAINT estudianteasignatura_pkey;
       public         postgres    false    183    183    183    183            �           2606    16503    estudianteseccion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estudianteseccion
    ADD CONSTRAINT estudianteseccion_pkey PRIMARY KEY (id_estudiante, id_seccion, periodo);
 R   ALTER TABLE ONLY public.estudianteseccion DROP CONSTRAINT estudianteseccion_pkey;
       public         postgres    false    185    185    185    185            �           2606    16490    seccion_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.seccion
    ADD CONSTRAINT seccion_pkey PRIMARY KEY (idseccion);
 >   ALTER TABLE ONLY public.seccion DROP CONSTRAINT seccion_pkey;
       public         postgres    false    184    184            �           2606    16478 #   estudianteasignatura_id_codigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudianteasignatura
    ADD CONSTRAINT estudianteasignatura_id_codigo_fkey FOREIGN KEY (id_codigo) REFERENCES public.asignatura(codigo);
 b   ALTER TABLE ONLY public.estudianteasignatura DROP CONSTRAINT estudianteasignatura_id_codigo_fkey;
       public       postgres    false    183    182    2003            �           2606    16473 '   estudianteasignatura_id_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudianteasignatura
    ADD CONSTRAINT estudianteasignatura_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiante(id);
 f   ALTER TABLE ONLY public.estudianteasignatura DROP CONSTRAINT estudianteasignatura_id_estudiante_fkey;
       public       postgres    false    183    2001    181            �           2606    16504 $   estudianteseccion_id_estudiante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudianteseccion
    ADD CONSTRAINT estudianteseccion_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiante(id);
 `   ALTER TABLE ONLY public.estudianteseccion DROP CONSTRAINT estudianteseccion_id_estudiante_fkey;
       public       postgres    false    181    2001    185            �           2606    16509 !   estudianteseccion_id_seccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estudianteseccion
    ADD CONSTRAINT estudianteseccion_id_seccion_fkey FOREIGN KEY (id_seccion) REFERENCES public.seccion(idseccion);
 ]   ALTER TABLE ONLY public.estudianteseccion DROP CONSTRAINT estudianteseccion_id_seccion_fkey;
       public       postgres    false    185    2007    184            �           2606    16491    seccion_id_asignatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.seccion
    ADD CONSTRAINT seccion_id_asignatura_fkey FOREIGN KEY (id_asignatura) REFERENCES public.asignatura(codigo);
 L   ALTER TABLE ONLY public.seccion DROP CONSTRAINT seccion_id_asignatura_fkey;
       public       postgres    false    182    184    2003            R   H   x���	�@����T 
Z���X�I�i�u8�ڷ��=1p1\#i>qC�q>6���ӒPs-ִ�j�|���s�      Q   -   x�32041400351��/�M�S,�,ʯR���t����� ���      S   $   x�32041400351��29�-8��b���� W\$      U   %   x�32041400351�4�40�420��4����� N�      T      x�3�40�4F@�3��Ѐ+F��� =�U     