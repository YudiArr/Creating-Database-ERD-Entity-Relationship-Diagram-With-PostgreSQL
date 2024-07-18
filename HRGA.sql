PGDMP      .                |            HR    16.2    16.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16807    HR    DATABASE     ~   CREATE DATABASE "HR" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE "HR";
                postgres    false            �            1259    16808 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16813    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16818 	   employees    TABLE     �  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2) NOT NULL,
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16823    job_history    TABLE     �   CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer NOT NULL
);
    DROP TABLE public.job_history;
       public         heap    postgres    false            �            1259    16828    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(8,2),
    max_salary numeric(8,2)
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    16833 	   locations    TABLE       CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2) NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16838    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    postgres    false                      0    16808 	   countries 
   TABLE DATA           H   COPY public.countries (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    215   \(                 0    16813    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    216   x)                 0    16818 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    217   �*                 0    16823    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    218   c7                 0    16828    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    219   68                 0    16833 	   locations 
   TABLE DATA           o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public          postgres    false    220   �9                 0    16838    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    221   �<       h           2606    16812    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    215            j           2606    16817    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    216            l           2606    16822    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    217            n           2606    16827    job_history job_history_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date);
 F   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_pkey;
       public            postgres    false    218    218            p           2606    16832    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    219            r           2606    16837    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    220            t           2606    16842    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    221            u           2606    16843 "   countries countries_region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id) NOT VALID;
 L   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_region_id_fkey;
       public          postgres    false    215    4724    221            v           2606    16848 '   departments departments_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) NOT VALID;
 Q   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_manager_id_fkey;
       public          postgres    false    216    4716    217            w           2606    16853 #   employees employees_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) NOT VALID;
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_manager_id_fkey;
       public          postgres    false    217    4716    217            x           2606    16868 *   job_history job_history_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id) NOT VALID;
 T   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_department_id_fkey;
       public          postgres    false    218    4714    216            y           2606    16863 (   job_history job_history_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) NOT VALID;
 R   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_employee_id_fkey;
       public          postgres    false    4716    218    217            z           2606    16858 #   job_history job_history_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) NOT VALID;
 M   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_job_id_fkey;
       public          postgres    false    219    218    4720            {           2606    16873 #   locations locations_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) NOT VALID;
 M   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_country_id_fkey;
       public          postgres    false    4712    215    220                 x�5�An�@E�N�	*�r�$���QE�8ĄQ�I4D���Pua��򷟝 ����6���Ho�P�`��fVz�<͆�,�ٙa��	Yj��@r1�Ĕ�mc�����w�=����5�7�B�Jc[�a��ߥ������X9�'�L�����j���Z�.T�!m��;z�.�Qތ���6�)�(�_��I
�O��ǜ��G��L��o�O����X���}�a��l�%��P�V� �="ײ��s���k�5\�����kUd�         ^  x�]QAn�0<;��*�$�-jK�
8rq��X;rl��n��[2�;���=�g�L���;&9gb�y&9�T�ѸD�ξR�G�,Dq.8[��r�Z�<��2a�@��l{4M�-H�)�r��cg��H����3B�$^���()��Iڞs�z��� �����8�4�U
���O�R�8��Pm
7�_� �[��x,򝺎LA��������"@m�Hw!U���5�|�b��a �������:v�tL��L�=�WI�;�@�{��@g[7��XP��65�i�+1�j��'��lSC{qL��/�\��WH̼����OL��!�������?eY��h��         m  x�}�ko�H�_O?�~�D�//�61�,���j��4ac�8Pa�n����a���l�UW����~�g�5��]���ɶ�_H���5�u�^7�{�v\���{�9w�K��}�İ4M����g����]�IR�5#���tb-I��2i&�<��w�g�;��N(��,���?dU�2V�x��&2��o�i��n�������eK�kݜ�	I���k��䣯!�BT������3��8�,��SI���tddI^� ����� G�=�&+��c����Ɋ�"Jd���ݰG���Q9��"{ֱ��o�����8qޝf�q��sɪb�Ƹi˺� �8͂��6�l/���	f�aIX��N�-����}!�:�d�dZ��֝�a�=D���9j:fx>����3y��Y=�cL�a��r��BM���t�l�SM�'(��2��d��b�d�g� A�/o,˟*ֶ�D�2�YF'�)MM&����]�?v���оA'lv�lG%+��	�512ӻ�4I|�.d���A�}���iYՍ�H��dAw�$c?N��;YetXr��"O�3������p�Ҥ&�l�I���!t���2ec_���q�m��O,0����Jl����4ZQe�9 �kB�咼zagR4�+v!y�."��,K��UYޜ������۵m�:� ���v�E�-��9�'[�I����m[^�v�ƻ Q�tD�S���hhdǺ�T�"�eu���c�9ql�[���t�M�#/x"=5�6�`�?�7��VP^�!����!0-M0�c�({Ζ]�>�N�o��!��8�L��A�\3�X��Pl�gl����1�� �F�tM�̱�0�l˟0�w͵}i �����)X�`�<�����9�&��b0 ߡ�7	�d�c�o}���#J^��!H�� J��^_+XYW$�E�mGѰĤ��l$��{��'�w��i�ʾN,s���%��9��Ŏ����;�m�`�Y �a�G�l�W}0�
�u��t$^@���Ȳ�"��M
�)�t΂	�k>N%��kU_0� ~�t�9re�N�����������]��#˝L3���-9�RlHzF��M�i2r����>}�1�&�
�4��Ƚ����%�J���eA}=�'Y�R��(,� �'�g��=��4�&Y�%ٮ�`B�c�@��O
K �0g���_Q���(.��3l!��@�de}y-�ƞU/$���1Z�>NB�7�.iL���0^�?PW�]u���A��A>�M*.�4��)yِM�D�Ga�̝A,;�ӕ�R��m@%��ݔ>K�=G餀�*1c���"���1���SWrLY=� �kہ$A9QZ�P�IQ!�F����`�f�9�3�:n4� ��Tby�5�%X���Μ��젤��}��?�lM��i��'�,��^v�\@��Mv�s���� �`�Z(7}���4��������!�*`�ڮ�n��iV$�B��
*�(��:�B�7%*xgP�]N�>�m�Ah "��!���`��!6�[`�?e���Z���-��;�^��"����C|^=���M�O�3��o�{-�I�-N�m��wc5.��H@�1
��5�����Ce_�������5��Y�G�l'��#uq�-J<K����1P��eOXE������D5��!��>����z�H����i�h&�Amu��Z-n��|�(R������G��&s�Zx�]WJ�On���#�x2�׵oqm���ɳ��C��p���P���a�Q����X]
���7���l�[�ĳ�6�4�tz������^I~=Ù��q�UA�2Ѝ��DZ�2v�����2xT2d�D����%j�e"h��~�@��oUw"q���P!�r����W{Ot47pf�dմ��&ͨj�#q���d�@���l��_X�0>�j�A�H~Fi7RmL^�E�<��˩ߗ�(er8J���קt���PS<O���/��(TØ�Fӟg\����J���^��� T��C�!7��k�Pm��O1H�U��2ː���n�@+\a����?��T�#���X�p����~&��Q��8��MO=(�#�̊8��rS꾾���j����ðmaJ��^��捄�8Mw
ӓ*�5o	>�z����������R<��Sh�L��;�`:y�@����w����lJ���u-��р[}��%��/$X�r���ִT~�-��K���|{}��ɷ(j�h~�f]I� Z`��w��]H����+f���Ya~��'���Mx�:H6E�&s�3���Ǟ���@�rijbx�A�8��5N�9Ԟ�g���[@�R��W0^.h�&�`8��9u��S�=�Ճ��B_��0�;8�`�s�)Rn�)Ww�Z�>�8��|Pc-7i�䷂j�slZ��uwo��A���o�GS��rY�4O��K�7|	��\�+��!�AA�㱅!o�"e��N�/��'nl��ёʼ�c^��B�L��Z�>��n@��A�D2ʟ�\�4�B��$��[N���$9͖�8�m͇k��9�;�W~�����p�-�W���2��{�A��
�ob+|��_�]l���z�S>5�֜��Ɔ��ξ�UC�.�(i���2&�6�AW�(▧+���2<�v�c���-e$��_<8��z��W"7�u� �����	��`>����NЪ|:k>��0�Ͻ��g_/�}�����(6�2n�'U+xn�7���a(���f�6C}����d�V� 4?(t��A�ȓbf*-`�s���~V�=-\c�n��Q2�i�'SC�lrd�S���ܤ�~]�0�����LAr�����#;_N����C��u}���'�r�]�R��*��lP�~�X�!X�:ʴ9�_��.���L��e�$A,�L��(�?��>�/gv�e�eY����΂��:���P l�����K|���'l����y��/M�8A�u���iV�> m�5. w[�~1��2:����{�~�O�wG�o��+n"�-��J�ۃ�ى���,�Gc\��I�d�,�z��8g!�"a�A�2|4X�`�6��/���T�*@.���[�߳^^pH�a�^�q���8���Q�G�%�*���ެ�ZA�ͬ��o��2������˿zzd         �   x�m�K
�0D��]T$�c{i�J�I�+����'�����cf,&��@b�B�C�(%<�8/S5&N��H�3τb!414��7`>��u*-RzU
ݲC��I4"I�,��>.����<���d
�u�ͳ]z�%��4>�^QB�뭮g{��V�1��>E���НQa��U]�C��e��#f���9U�{ߌ1�,J�         W  x�}�ݎ�0���S�FP6z��o\�)�	�b��P�}�a*�q���33g�Nc�ga�4�$uI�<�����š���=eJ+S�T��T"{���Q5|R�(�uu�� ���U.8�+-4x�B��,��k0���A��o�;I�J�n#�&�|P�!����!�֐U?�Jz��F4�D"��a���lxw��b\� (�	"��v`�z�}�ɪ"��ҫE��g|��,�������]�h�'ׇ�$�j�����--tQ��犫��v����ePod����뺫PW���IwR �	�d'Ekm��5��2��59��}W��˴��w�o��Y�}�q� �|��           x�MS�r�8<��ݪ(��(M�I���e;I�2&'""p��e�����^�=���QRJP��ѢX�Ec��HiVv������R5�4J���H4�1|O}DP��sx$gk��׌�R�j��=��q ��{<��)���:���>Sy�d���_�gu�a��9|������I��T~.�������ǳ�5���h����{z��L-&�W.R�>����0F�ˉ!*t�s@W۾��B�/�ű�r, �>��"pM#��ap���G��I\S��<�7�6��4+eT�1vO���!z7Vi*sv��P\�l�B�l[�.z�sY�/2e��F�ҿ��oRg߫'a��Z�e�߇#_���>���Liq��`��+-�
J����d�z�i5�d�!����˿an�����ϰ�$�oc@�b�I��UGl�+E�F*�΍c{�S�{O�Q�NP�[w�B.Z��!���K�
7��>�9��d:a���F!i�?��5,��n2�F��C�w8�梁>�}K����~Ֆ\M���a~�0��s�2) ���ɱ� v�f��,�69$�q�o8Dj��Tu{B[�"�1|�d�V<�lޝJ|�"|��tJ�n@�#Y�9G5
�/� �{R̤�#����[�˴#'vC�Ӟ7;���
��=�"�����t��fy��f���}O�h���CpP^���{KI}h8��%<F���kS���P��s{��z��s^\�v=S�1F�R&װ�w[{����,״ы��P��l�e??fY��Y�         ?   x�3�t--�/H�2�t�M-�LN,�2�t,�L�2���LI�IUpM,.QH�KQpL)������ �~�     