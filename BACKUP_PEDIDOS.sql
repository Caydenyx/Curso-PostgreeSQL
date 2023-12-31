PGDMP          1                {            pedido    15.2    15.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    16400    pedido    DATABASE     }   CREATE DATABASE pedido WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE pedido;
                postgres    false            �           1247    33259    codigo    DOMAIN     6   CREATE DOMAIN public.codigo AS character varying(10);
    DROP DOMAIN public.codigo;
       public          postgres    false            �           1247    33273    data    DOMAIN     #   CREATE DOMAIN public.data AS date;
    DROP DOMAIN public.data;
       public          postgres    false            �           1247    33277 	   data_hora    DOMAIN     ?   CREATE DOMAIN public.data_hora AS timestamp without time zone;
    DROP DOMAIN public.data_hora;
       public          postgres    false            �           1247    33267 	   documento    DOMAIN     9   CREATE DOMAIN public.documento AS character varying(15);
    DROP DOMAIN public.documento;
       public          postgres    false            �           1247    33281    float_curto    DOMAIN     2   CREATE DOMAIN public.float_curto AS numeric(6,2);
     DROP DOMAIN public.float_curto;
       public          postgres    false            �           1247    33285    float_longo    DOMAIN     3   CREATE DOMAIN public.float_longo AS numeric(15,2);
     DROP DOMAIN public.float_longo;
       public          postgres    false            �           1247    33283    float_medio    DOMAIN     3   CREATE DOMAIN public.float_medio AS numeric(10,2);
     DROP DOMAIN public.float_medio;
       public          postgres    false            �           1247    33275    hora    DOMAIN     5   CREATE DOMAIN public.hora AS time without time zone;
    DROP DOMAIN public.hora;
       public          postgres    false            �           1247    33251    idcurto    DOMAIN     *   CREATE DOMAIN public.idcurto AS smallint;
    DROP DOMAIN public.idcurto;
       public          postgres    false            �           1247    33255    idlongo    DOMAIN     (   CREATE DOMAIN public.idlongo AS bigint;
    DROP DOMAIN public.idlongo;
       public          postgres    false            �           1247    33253    idmedio    DOMAIN     )   CREATE DOMAIN public.idmedio AS integer;
    DROP DOMAIN public.idmedio;
       public          postgres    false            �           1247    33279    moeda    DOMAIN     -   CREATE DOMAIN public.moeda AS numeric(10,2);
    DROP DOMAIN public.moeda;
       public          postgres    false            �           1247    33261 
   nome_curto    DOMAIN     :   CREATE DOMAIN public.nome_curto AS character varying(15);
    DROP DOMAIN public.nome_curto;
       public          postgres    false            �           1247    33265 
   nome_longo    DOMAIN     :   CREATE DOMAIN public.nome_longo AS character varying(70);
    DROP DOMAIN public.nome_longo;
       public          postgres    false            �           1247    33263 
   nome_medio    DOMAIN     :   CREATE DOMAIN public.nome_medio AS character varying(50);
    DROP DOMAIN public.nome_medio;
       public          postgres    false            �           1247    33287 
   quantidade    DOMAIN     -   CREATE DOMAIN public.quantidade AS smallint;
    DROP DOMAIN public.quantidade;
       public          postgres    false            �           1247    33257    sigla    DOMAIN     ,   CREATE DOMAIN public.sigla AS character(3);
    DROP DOMAIN public.sigla;
       public          postgres    false            �           1247    33271    texto    DOMAIN     $   CREATE DOMAIN public.texto AS text;
    DROP DOMAIN public.texto;
       public          postgres    false            �           1247    33269    tipo    DOMAIN     +   CREATE DOMAIN public.tipo AS character(1);
    DROP DOMAIN public.tipo;
       public          postgres    false                       1255    33205    bairro_log()    FUNCTION     �   CREATE FUNCTION public.bairro_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	insert into bairro_auditoria (idbairro, data_criacao) values (new.idbairro, current_timestamp);
	return new;
end;
$$;
 #   DROP FUNCTION public.bairro_log();
       public          postgres    false                       1255    33200     exclui_produto(double precision) 	   PROCEDURE     �   CREATE PROCEDURE public.exclui_produto(IN idpr double precision)
    LANGUAGE sql
    AS $$
	DELETE FROM PRODUTO WHERE IDPRODUTO = IDPR;
$$;
 @   DROP PROCEDURE public.exclui_produto(IN idpr double precision);
       public          postgres    false            �            1255    33182    formata_moeda(double precision)    FUNCTION     �   CREATE FUNCTION public.formata_moeda(valor double precision) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN CONCAT('R$', ROUND(CAST(valor AS numeric), 2));
END;
$_$;
 <   DROP FUNCTION public.formata_moeda(valor double precision);
       public          postgres    false            �            1255    33195    get_maior_valor()    FUNCTION     �   CREATE FUNCTION public.get_maior_valor() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	return (select idpedido from pedido where valor = (select max (valor) from pedido));
END;
$$;
 (   DROP FUNCTION public.get_maior_valor();
       public          postgres    false            �            1255    33186    get_nome_by_id(integer)    FUNCTION     �   CREATE FUNCTION public.get_nome_by_id(idc integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE r varchar(50);
BEGIN
    SELECT nome INTO r FROM cliente WHERE idcliente = idc;
    RETURN r;
END;
$$;
 2   DROP FUNCTION public.get_nome_by_id(idc integer);
       public          postgres    false            �            1255    33192    get_valor_pedido(integer)    FUNCTION     �   CREATE FUNCTION public.get_valor_pedido(idpdd integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT FORMATA_MOEDA(pdd.valor) FROM PEDIDO PDD WHERE PDD.IDPEDIDO = idpdd);
END
$$;
 6   DROP FUNCTION public.get_valor_pedido(idpdd integer);
       public          postgres    false                        1255    33196     insere_bairro(character varying) 	   PROCEDURE     �   CREATE PROCEDURE public.insere_bairro(IN nome_bairro character varying)
    LANGUAGE sql
    AS $$
	INSERT INTO BAIRRO (nome) values (nome_bairro);
$$;
 G   DROP PROCEDURE public.insere_bairro(IN nome_bairro character varying);
       public          postgres    false                       1255    33210    pedido_log()    FUNCTION     `  CREATE FUNCTION public.pedido_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO PEDIDOS_APAGADOS (IDPEDIDO, IDCLIENTE, IDTRANSPORTADORA, IDVENDEDOR, DATA_PEDIDO, VALOR, DATA_APAGADO) 
	VALUES (OLD.IDPEDIDO, OLD.IDCLIENTE, OLD.IDTRANSPORTADORA, OLD.IDVENDEDOR, OLD.DATA_PEDIDO, OLD.VALOR, CURRENT_TIMESTAMP);
	RETURN OLD;
END;
$$;
 #   DROP FUNCTION public.pedido_log();
       public          postgres    false                       1255    33198 +   reajusta_produto(integer, double precision) 	   PROCEDURE     �   CREATE PROCEDURE public.reajusta_produto(IN idp integer, IN percentual double precision)
    LANGUAGE sql
    AS $$
	update produto set valor = valor + ((valor * pErcentual) / 100) where idproduto = idp;
$$;
 X   DROP PROCEDURE public.reajusta_produto(IN idp integer, IN percentual double precision);
       public          postgres    false            �            1259    16446    bairro    TABLE     g   CREATE TABLE public.bairro (
    idbairro integer NOT NULL,
    nome character varying(30) NOT NULL
);
    DROP TABLE public.bairro;
       public         heap    postgres    false            "           0    0    TABLE bairro    ACL     P   GRANT SELECT,INSERT,DELETE ON TABLE public.bairro TO gerente WITH GRANT OPTION;
          public          postgres    false    218            �            1259    33201    bairro_auditoria    TABLE     t   CREATE TABLE public.bairro_auditoria (
    idbairro integer NOT NULL,
    data_criacao public.data_hora NOT NULL
);
 $   DROP TABLE public.bairro_auditoria;
       public         heap    postgres    false    991            �            1259    24811    bairro_id_seq    SEQUENCE     u   CREATE SEQUENCE public.bairro_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.bairro_id_seq;
       public          postgres    false    218            #           0    0    bairro_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.bairro_id_seq OWNED BY public.bairro.idbairro;
          public          postgres    false    236            $           0    0    SEQUENCE bairro_id_seq    ACL     7   GRANT ALL ON SEQUENCE public.bairro_id_seq TO gerente;
          public          postgres    false    236            �            1259    16401    cliente    TABLE     �  CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character(11),
    data_nascimento date,
    genero character(1),
    logradouro character varying(30),
    numero character varying(30),
    "observaçoes" text,
    rg character varying(15),
    idprofissao integer,
    idnacionalidade integer,
    idcomplemento integer,
    idbairro integer,
    idmunicipio integer
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            %           0    0    TABLE cliente    ACL     Q   GRANT SELECT,INSERT,DELETE ON TABLE public.cliente TO gerente WITH GRANT OPTION;
          public          postgres    false    214            �            1259    16439    complemento    TABLE     q   CREATE TABLE public.complemento (
    idcomplemento integer NOT NULL,
    nome character varying(30) NOT NULL
);
    DROP TABLE public.complemento;
       public         heap    postgres    false            &           0    0    TABLE complemento    ACL     U   GRANT SELECT,INSERT,DELETE ON TABLE public.complemento TO gerente WITH GRANT OPTION;
          public          postgres    false    217            �            1259    24676 	   municipio    TABLE     �   CREATE TABLE public.municipio (
    idmunicipio integer NOT NULL,
    nome character varying(30) NOT NULL,
    iduf integer NOT NULL
);
    DROP TABLE public.municipio;
       public         heap    postgres    false            '           0    0    TABLE municipio    ACL     S   GRANT SELECT,INSERT,DELETE ON TABLE public.municipio TO gerente WITH GRANT OPTION;
          public          postgres    false    220            �            1259    16432    nacionalidade    TABLE     u   CREATE TABLE public.nacionalidade (
    idnacionalidade integer NOT NULL,
    nome character varying(30) NOT NULL
);
 !   DROP TABLE public.nacionalidade;
       public         heap    postgres    false            (           0    0    TABLE nacionalidade    ACL     W   GRANT SELECT,INSERT,DELETE ON TABLE public.nacionalidade TO gerente WITH GRANT OPTION;
          public          postgres    false    216            �            1259    16425 	   profissao    TABLE     m   CREATE TABLE public.profissao (
    idprofissao integer NOT NULL,
    nome character varying(30) NOT NULL
);
    DROP TABLE public.profissao;
       public         heap    postgres    false            )           0    0    TABLE profissao    ACL     S   GRANT SELECT,INSERT,DELETE ON TABLE public.profissao TO gerente WITH GRANT OPTION;
          public          postgres    false    215            �            1259    24660    uf    TABLE     �   CREATE TABLE public.uf (
    iduf integer NOT NULL,
    nome character varying(30) NOT NULL,
    sigla character(2) NOT NULL
);
    DROP TABLE public.uf;
       public         heap    postgres    false            *           0    0    TABLE uf    ACL     L   GRANT SELECT,INSERT,DELETE ON TABLE public.uf TO gerente WITH GRANT OPTION;
          public          postgres    false    219            �            1259    24777    cliente_dados    VIEW     J  CREATE VIEW public.cliente_dados AS
 SELECT cliente.nome,
    profissao.nome AS profissao,
    nacionalidade.nome AS nacionalidade,
    complemento.nome AS complemento,
    municipio.nome AS municipio,
    uf.nome AS uf,
    bairro.nome AS bairro,
    cliente.cpf,
    cliente.rg,
    cliente.data_nascimento,
        CASE cliente.genero
            WHEN 'M'::bpchar THEN 'MASCULINO'::text
            WHEN 'F'::bpchar THEN 'FEMININO'::text
            ELSE NULL::text
        END AS genero,
    cliente.logradouro,
    cliente.numero,
    cliente."observaçoes" AS observacoes
   FROM ((((((public.cliente
     LEFT JOIN public.profissao ON ((cliente.idprofissao = profissao.idprofissao)))
     LEFT JOIN public.nacionalidade ON ((cliente.idnacionalidade = nacionalidade.idnacionalidade)))
     LEFT JOIN public.complemento ON ((cliente.idcomplemento = complemento.idcomplemento)))
     LEFT JOIN public.municipio ON ((cliente.idmunicipio = municipio.idmunicipio)))
     LEFT JOIN public.uf ON ((municipio.iduf = uf.iduf)))
     LEFT JOIN public.bairro ON ((cliente.idbairro = bairro.idbairro)));
     DROP VIEW public.cliente_dados;
       public          postgres    false    214    220    220    220    219    219    218    218    217    217    216    216    215    215    214    214    214    214    214    214    214    214    214    214    214    214            +           0    0    TABLE cliente_dados    ACL     :   GRANT SELECT ON TABLE public.cliente_dados TO estagiario;
          public          postgres    false    228            �            1259    24813    cliente_id_seq    SEQUENCE     x   CREATE SEQUENCE public.cliente_id_seq
    START WITH 18
    INCREMENT BY 1
    MINVALUE 18
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    214            ,           0    0    cliente_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.idcliente;
          public          postgres    false    237            -           0    0    SEQUENCE cliente_id_seq    ACL     8   GRANT ALL ON SEQUENCE public.cliente_id_seq TO gerente;
          public          postgres    false    237            �            1259    24768    cliente_profissao    VIEW     �   CREATE VIEW public.cliente_profissao AS
 SELECT cln.nome AS cliente,
    cln.cpf,
    prf.nome AS profissao
   FROM (public.cliente cln
     LEFT JOIN public.profissao prf ON ((cln.idprofissao = prf.idprofissao)));
 $   DROP VIEW public.cliente_profissao;
       public          postgres    false    215    215    214    214    214            �            1259    24815    complemento_id_seq    SEQUENCE     z   CREATE SEQUENCE public.complemento_id_seq
    START WITH 3
    INCREMENT BY 1
    MINVALUE 3
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.complemento_id_seq;
       public          postgres    false    217            .           0    0    complemento_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.complemento_id_seq OWNED BY public.complemento.idcomplemento;
          public          postgres    false    238            /           0    0    SEQUENCE complemento_id_seq    ACL     <   GRANT ALL ON SEQUENCE public.complemento_id_seq TO gerente;
          public          postgres    false    238            �            1259    33298    conta    TABLE     �   CREATE TABLE public.conta (
    idconta integer NOT NULL,
    cliente character varying(30) NOT NULL,
    saldo numeric DEFAULT 0 NOT NULL
);
    DROP TABLE public.conta;
       public         heap    postgres    false            �            1259    33297    conta_idconta_seq    SEQUENCE     �   CREATE SEQUENCE public.conta_idconta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.conta_idconta_seq;
       public          postgres    false    251            0           0    0    conta_idconta_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.conta_idconta_seq OWNED BY public.conta.idconta;
          public          postgres    false    250            �            1259    24729    pedido    TABLE        CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idcliente integer NOT NULL,
    idtransportadora integer,
    idvendedor integer NOT NULL,
    data_pedido date DEFAULT CURRENT_DATE NOT NULL,
    valor double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            1           0    0    TABLE pedido    ACL     �   GRANT SELECT,INSERT,DELETE ON TABLE public.pedido TO gerente WITH GRANT OPTION;
GRANT SELECT,INSERT ON TABLE public.pedido TO atendente WITH GRANT OPTION;
          public          postgres    false    225            �            1259    24707    transportadora    TABLE     �   CREATE TABLE public.transportadora (
    idtransportadora integer NOT NULL,
    idmunicipio integer,
    nome character varying(50) NOT NULL,
    logradouro character varying(50),
    numero character varying(10)
);
 "   DROP TABLE public.transportadora;
       public         heap    postgres    false            2           0    0    TABLE transportadora    ACL     X   GRANT SELECT,INSERT,DELETE ON TABLE public.transportadora TO gerente WITH GRANT OPTION;
          public          postgres    false    223            �            1259    24700    vendedor    TABLE     k   CREATE TABLE public.vendedor (
    idvendedor integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.vendedor;
       public         heap    postgres    false            3           0    0    TABLE vendedor    ACL     R   GRANT SELECT,INSERT,DELETE ON TABLE public.vendedor TO gerente WITH GRANT OPTION;
          public          postgres    false    222            �            1259    24794    dados_pedidos    VIEW     �  CREATE VIEW public.dados_pedidos AS
 SELECT pedido.data_pedido,
    pedido.valor,
    transportadora.nome AS trabsportadora,
    cliente.nome AS cliente,
    vendedor.nome AS vendedor
   FROM (((public.pedido
     LEFT JOIN public.transportadora ON ((pedido.idtransportadora = transportadora.idtransportadora)))
     LEFT JOIN public.cliente ON ((pedido.idcliente = cliente.idcliente)))
     LEFT JOIN public.vendedor ON ((pedido.idvendedor = vendedor.idvendedor)));
     DROP VIEW public.dados_pedidos;
       public          postgres    false    225    214    225    225    222    214    222    223    223    225    225            4           0    0    TABLE dados_pedidos    ACL     :   GRANT SELECT ON TABLE public.dados_pedidos TO estagiario;
          public          postgres    false    232            �            1259    24804    exemplo    TABLE     i   CREATE TABLE public.exemplo (
    idexemplo integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.exemplo;
       public         heap    postgres    false            �            1259    24803    exemplo_idexemplo_seq    SEQUENCE     �   CREATE SEQUENCE public.exemplo_idexemplo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.exemplo_idexemplo_seq;
       public          postgres    false    235            5           0    0    exemplo_idexemplo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.exemplo_idexemplo_seq OWNED BY public.exemplo.idexemplo;
          public          postgres    false    234            6           0    0    SEQUENCE exemplo_idexemplo_seq    ACL     ?   GRANT ALL ON SEQUENCE public.exemplo_idexemplo_seq TO gerente;
          public          postgres    false    234            �            1259    24693 
   fornecedor    TABLE     o   CREATE TABLE public.fornecedor (
    idfornecedor integer NOT NULL,
    nome character varying(50) NOT NULL
);
    DROP TABLE public.fornecedor;
       public         heap    postgres    false            7           0    0    TABLE fornecedor    ACL     T   GRANT SELECT,INSERT,DELETE ON TABLE public.fornecedor TO gerente WITH GRANT OPTION;
          public          postgres    false    221            �            1259    24817    fornecedor_id_seq    SEQUENCE     y   CREATE SEQUENCE public.fornecedor_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.fornecedor_id_seq;
       public          postgres    false    221            8           0    0    fornecedor_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.idfornecedor;
          public          postgres    false    239            9           0    0    SEQUENCE fornecedor_id_seq    ACL     ;   GRANT ALL ON SEQUENCE public.fornecedor_id_seq TO gerente;
          public          postgres    false    239            �            1259    24819    municipio_id_seq    SEQUENCE     z   CREATE SEQUENCE public.municipio_id_seq
    START WITH 10
    INCREMENT BY 1
    MINVALUE 10
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.municipio_id_seq;
       public          postgres    false    220            :           0    0    municipio_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.municipio_id_seq OWNED BY public.municipio.idmunicipio;
          public          postgres    false    240            ;           0    0    SEQUENCE municipio_id_seq    ACL     :   GRANT ALL ON SEQUENCE public.municipio_id_seq TO gerente;
          public          postgres    false    240            �            1259    24782    municipio_uf    VIEW     �   CREATE VIEW public.municipio_uf AS
 SELECT municipio.nome AS municipio,
    uf.nome AS un_federativa,
    uf.sigla
   FROM (public.municipio
     LEFT JOIN public.uf ON ((municipio.iduf = uf.iduf)));
    DROP VIEW public.municipio_uf;
       public          postgres    false    219    219    220    220    219            �            1259    24821    nacionalidade_id_seq    SEQUENCE     |   CREATE SEQUENCE public.nacionalidade_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.nacionalidade_id_seq;
       public          postgres    false    216            <           0    0    nacionalidade_id_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.nacionalidade_id_seq OWNED BY public.nacionalidade.idnacionalidade;
          public          postgres    false    241            =           0    0    SEQUENCE nacionalidade_id_seq    ACL     >   GRANT ALL ON SEQUENCE public.nacionalidade_id_seq TO gerente;
          public          postgres    false    241            �            1259    24823    pedido_id_seq    SEQUENCE     w   CREATE SEQUENCE public.pedido_id_seq
    START WITH 15
    INCREMENT BY 1
    MINVALUE 15
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pedido_id_seq;
       public          postgres    false    225            >           0    0    pedido_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    242            ?           0    0    SEQUENCE pedido_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.pedido_id_seq TO gerente;
GRANT ALL ON SEQUENCE public.pedido_id_seq TO atendente WITH GRANT OPTION;
          public          postgres    false    242            �            1259    24749    pedido_produto    TABLE     �   CREATE TABLE public.pedido_produto (
    idpedido integer NOT NULL,
    idproduto integer NOT NULL,
    quantidade integer DEFAULT 1 NOT NULL,
    valor_unitario double precision DEFAULT 0 NOT NULL
);
 "   DROP TABLE public.pedido_produto;
       public         heap    postgres    false            @           0    0    TABLE pedido_produto    ACL     �   GRANT SELECT,INSERT,DELETE ON TABLE public.pedido_produto TO gerente WITH GRANT OPTION;
GRANT SELECT,INSERT ON TABLE public.pedido_produto TO atendente WITH GRANT OPTION;
          public          postgres    false    226            �            1259    33207    pedidos_apagados    TABLE       CREATE TABLE public.pedidos_apagados (
    idpedido integer NOT NULL,
    idcliente integer NOT NULL,
    idtransportadora integer NOT NULL,
    idvendedor integer NOT NULL,
    data_pedido date NOT NULL,
    valor double precision NOT NULL,
    data_apagado date NOT NULL
);
 $   DROP TABLE public.pedidos_apagados;
       public         heap    postgres    false            A           0    0    TABLE pedidos_apagados    ACL     Z   GRANT SELECT,INSERT,DELETE ON TABLE public.pedidos_apagados TO gerente WITH GRANT OPTION;
          public          postgres    false    249            �            1259    24719    produto    TABLE     �   CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    idfornecedor integer NOT NULL,
    nome character varying(50) NOT NULL,
    valor double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            B           0    0    TABLE produto    ACL     Q   GRANT SELECT,INSERT,DELETE ON TABLE public.produto TO gerente WITH GRANT OPTION;
          public          postgres    false    224            �            1259    24786    produto_fornecedor    VIEW     �   CREATE VIEW public.produto_fornecedor AS
 SELECT produto.nome AS produto,
    produto.valor,
    fornecedor.nome AS fornecedor
   FROM (public.produto
     LEFT JOIN public.fornecedor ON ((produto.idfornecedor = fornecedor.idfornecedor)));
 %   DROP VIEW public.produto_fornecedor;
       public          postgres    false    224    224    221    221    224            �            1259    24838    produto_id_seq    SEQUENCE     v   CREATE SEQUENCE public.produto_id_seq
    START WITH 8
    INCREMENT BY 1
    MINVALUE 8
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produto_id_seq;
       public          postgres    false    224            C           0    0    produto_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.idproduto;
          public          postgres    false    247            D           0    0    SEQUENCE produto_id_seq    ACL     8   GRANT ALL ON SEQUENCE public.produto_id_seq TO gerente;
          public          postgres    false    247            �            1259    24799    produto_pedido    VIEW       CREATE VIEW public.produto_pedido AS
 SELECT produto.nome AS produto,
    pedido_produto.quantidade,
    produto.valor,
    pedido_produto.valor_unitario
   FROM (public.produto
     LEFT JOIN public.pedido_produto ON ((produto.idproduto = pedido_produto.idproduto)));
 !   DROP VIEW public.produto_pedido;
       public          postgres    false    226    226    226    224    224    224            �            1259    24826    profissao_id_seq    SEQUENCE     x   CREATE SEQUENCE public.profissao_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.profissao_id_seq;
       public          postgres    false    215            E           0    0    profissao_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.profissao_id_seq OWNED BY public.profissao.idprofissao;
          public          postgres    false    243            F           0    0    SEQUENCE profissao_id_seq    ACL     :   GRANT ALL ON SEQUENCE public.profissao_id_seq TO gerente;
          public          postgres    false    243            �            1259    24828    transportadora_id_seq    SEQUENCE     }   CREATE SEQUENCE public.transportadora_id_seq
    START WITH 3
    INCREMENT BY 1
    MINVALUE 3
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.transportadora_id_seq;
       public          postgres    false    223            G           0    0    transportadora_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.transportadora_id_seq OWNED BY public.transportadora.idtransportadora;
          public          postgres    false    244            H           0    0    SEQUENCE transportadora_id_seq    ACL     ?   GRANT ALL ON SEQUENCE public.transportadora_id_seq TO gerente;
          public          postgres    false    244            �            1259    24790    transportadora_uf    VIEW     y  CREATE VIEW public.transportadora_uf AS
 SELECT transportadora.nome AS transportadora,
    transportadora.logradouro,
    transportadora.numero,
    uf.nome AS "unidade_federacÃo",
    uf.sigla
   FROM ((public.transportadora
     LEFT JOIN public.municipio ON ((transportadora.idmunicipio = municipio.idmunicipio)))
     LEFT JOIN public.uf ON ((municipio.iduf = uf.iduf)));
 $   DROP VIEW public.transportadora_uf;
       public          postgres    false    220    219    219    219    223    223    223    223    220            �            1259    24830 	   uf_id_seq    SEQUENCE     q   CREATE SEQUENCE public.uf_id_seq
    START WITH 7
    INCREMENT BY 1
    MINVALUE 7
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.uf_id_seq;
       public          postgres    false    219            I           0    0 	   uf_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.uf_id_seq OWNED BY public.uf.iduf;
          public          postgres    false    245            J           0    0    SEQUENCE uf_id_seq    ACL     3   GRANT ALL ON SEQUENCE public.uf_id_seq TO gerente;
          public          postgres    false    245            �            1259    24832    vendedor_id_seq    SEQUENCE     w   CREATE SEQUENCE public.vendedor_id_seq
    START WITH 9
    INCREMENT BY 1
    MINVALUE 9
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vendedor_id_seq;
       public          postgres    false    222            K           0    0    vendedor_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.vendedor_id_seq OWNED BY public.vendedor.idvendedor;
          public          postgres    false    246            L           0    0    SEQUENCE vendedor_id_seq    ACL     9   GRANT ALL ON SEQUENCE public.vendedor_id_seq TO gerente;
          public          postgres    false    246                       2604    24812    bairro idbairro    DEFAULT     l   ALTER TABLE ONLY public.bairro ALTER COLUMN idbairro SET DEFAULT nextval('public.bairro_id_seq'::regclass);
 >   ALTER TABLE public.bairro ALTER COLUMN idbairro DROP DEFAULT;
       public          postgres    false    236    218                       2604    24814    cliente idcliente    DEFAULT     o   ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 @   ALTER TABLE public.cliente ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    237    214                       2604    24816    complemento idcomplemento    DEFAULT     {   ALTER TABLE ONLY public.complemento ALTER COLUMN idcomplemento SET DEFAULT nextval('public.complemento_id_seq'::regclass);
 H   ALTER TABLE public.complemento ALTER COLUMN idcomplemento DROP DEFAULT;
       public          postgres    false    238    217            "           2604    33301    conta idconta    DEFAULT     n   ALTER TABLE ONLY public.conta ALTER COLUMN idconta SET DEFAULT nextval('public.conta_idconta_seq'::regclass);
 <   ALTER TABLE public.conta ALTER COLUMN idconta DROP DEFAULT;
       public          postgres    false    251    250    251            !           2604    24807    exemplo idexemplo    DEFAULT     v   ALTER TABLE ONLY public.exemplo ALTER COLUMN idexemplo SET DEFAULT nextval('public.exemplo_idexemplo_seq'::regclass);
 @   ALTER TABLE public.exemplo ALTER COLUMN idexemplo DROP DEFAULT;
       public          postgres    false    235    234    235                       2604    24818    fornecedor idfornecedor    DEFAULT     x   ALTER TABLE ONLY public.fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);
 F   ALTER TABLE public.fornecedor ALTER COLUMN idfornecedor DROP DEFAULT;
       public          postgres    false    239    221                       2604    24820    municipio idmunicipio    DEFAULT     u   ALTER TABLE ONLY public.municipio ALTER COLUMN idmunicipio SET DEFAULT nextval('public.municipio_id_seq'::regclass);
 D   ALTER TABLE public.municipio ALTER COLUMN idmunicipio DROP DEFAULT;
       public          postgres    false    240    220                       2604    24822    nacionalidade idnacionalidade    DEFAULT     �   ALTER TABLE ONLY public.nacionalidade ALTER COLUMN idnacionalidade SET DEFAULT nextval('public.nacionalidade_id_seq'::regclass);
 L   ALTER TABLE public.nacionalidade ALTER COLUMN idnacionalidade DROP DEFAULT;
       public          postgres    false    241    216                       2604    24825    pedido idpedido    DEFAULT     l   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_id_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    242    225                       2604    24839    produto idproduto    DEFAULT     o   ALTER TABLE ONLY public.produto ALTER COLUMN idproduto SET DEFAULT nextval('public.produto_id_seq'::regclass);
 @   ALTER TABLE public.produto ALTER COLUMN idproduto DROP DEFAULT;
       public          postgres    false    247    224                       2604    24827    profissao idprofissao    DEFAULT     u   ALTER TABLE ONLY public.profissao ALTER COLUMN idprofissao SET DEFAULT nextval('public.profissao_id_seq'::regclass);
 D   ALTER TABLE public.profissao ALTER COLUMN idprofissao DROP DEFAULT;
       public          postgres    false    243    215                       2604    24829    transportadora idtransportadora    DEFAULT     �   ALTER TABLE ONLY public.transportadora ALTER COLUMN idtransportadora SET DEFAULT nextval('public.transportadora_id_seq'::regclass);
 N   ALTER TABLE public.transportadora ALTER COLUMN idtransportadora DROP DEFAULT;
       public          postgres    false    244    223                       2604    24831    uf iduf    DEFAULT     `   ALTER TABLE ONLY public.uf ALTER COLUMN iduf SET DEFAULT nextval('public.uf_id_seq'::regclass);
 6   ALTER TABLE public.uf ALTER COLUMN iduf DROP DEFAULT;
       public          postgres    false    245    219                       2604    24833    vendedor idvendedor    DEFAULT     r   ALTER TABLE ONLY public.vendedor ALTER COLUMN idvendedor SET DEFAULT nextval('public.vendedor_id_seq'::regclass);
 B   ALTER TABLE public.vendedor ALTER COLUMN idvendedor DROP DEFAULT;
       public          postgres    false    246    222                      0    16446    bairro 
   TABLE DATA           0   COPY public.bairro (idbairro, nome) FROM stdin;
    public          postgres    false    218   ��                 0    33201    bairro_auditoria 
   TABLE DATA           B   COPY public.bairro_auditoria (idbairro, data_criacao) FROM stdin;
    public          postgres    false    248    �       �          0    16401    cliente 
   TABLE DATA           �   COPY public.cliente (idcliente, nome, cpf, data_nascimento, genero, logradouro, numero, "observaçoes", rg, idprofissao, idnacionalidade, idcomplemento, idbairro, idmunicipio) FROM stdin;
    public          postgres    false    214   B�                  0    16439    complemento 
   TABLE DATA           :   COPY public.complemento (idcomplemento, nome) FROM stdin;
    public          postgres    false    217   a�                 0    33298    conta 
   TABLE DATA           8   COPY public.conta (idconta, cliente, saldo) FROM stdin;
    public          postgres    false    251   ��                 0    24804    exemplo 
   TABLE DATA           2   COPY public.exemplo (idexemplo, nome) FROM stdin;
    public          postgres    false    235   ��                 0    24693 
   fornecedor 
   TABLE DATA           8   COPY public.fornecedor (idfornecedor, nome) FROM stdin;
    public          postgres    false    221   �                 0    24676 	   municipio 
   TABLE DATA           <   COPY public.municipio (idmunicipio, nome, iduf) FROM stdin;
    public          postgres    false    220   _�       �          0    16432    nacionalidade 
   TABLE DATA           >   COPY public.nacionalidade (idnacionalidade, nome) FROM stdin;
    public          postgres    false    216   �                 0    24729    pedido 
   TABLE DATA           g   COPY public.pedido (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor) FROM stdin;
    public          postgres    false    225   _�       	          0    24749    pedido_produto 
   TABLE DATA           Y   COPY public.pedido_produto (idpedido, idproduto, quantidade, valor_unitario) FROM stdin;
    public          postgres    false    226   �                 0    33207    pedidos_apagados 
   TABLE DATA              COPY public.pedidos_apagados (idpedido, idcliente, idtransportadora, idvendedor, data_pedido, valor, data_apagado) FROM stdin;
    public          postgres    false    249   ��                 0    24719    produto 
   TABLE DATA           G   COPY public.produto (idproduto, idfornecedor, nome, valor) FROM stdin;
    public          postgres    false    224   ��       �          0    16425 	   profissao 
   TABLE DATA           6   COPY public.profissao (idprofissao, nome) FROM stdin;
    public          postgres    false    215   f�                 0    24707    transportadora 
   TABLE DATA           a   COPY public.transportadora (idtransportadora, idmunicipio, nome, logradouro, numero) FROM stdin;
    public          postgres    false    223   ��                 0    24660    uf 
   TABLE DATA           /   COPY public.uf (iduf, nome, sigla) FROM stdin;
    public          postgres    false    219   $�                 0    24700    vendedor 
   TABLE DATA           4   COPY public.vendedor (idvendedor, nome) FROM stdin;
    public          postgres    false    222   ��       M           0    0    bairro_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.bairro_id_seq', 16, true);
          public          postgres    false    236            N           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 19, true);
          public          postgres    false    237            O           0    0    complemento_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.complemento_id_seq', 3, true);
          public          postgres    false    238            P           0    0    conta_idconta_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.conta_idconta_seq', 2, true);
          public          postgres    false    250            Q           0    0    exemplo_idexemplo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.exemplo_idexemplo_seq', 5, true);
          public          postgres    false    234            R           0    0    fornecedor_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.fornecedor_id_seq', 4, true);
          public          postgres    false    239            S           0    0    municipio_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.municipio_id_seq', 11, true);
          public          postgres    false    240            T           0    0    nacionalidade_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.nacionalidade_id_seq', 5, true);
          public          postgres    false    241            U           0    0    pedido_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pedido_id_seq', 18, true);
          public          postgres    false    242            V           0    0    produto_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.produto_id_seq', 10, true);
          public          postgres    false    247            W           0    0    profissao_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profissao_id_seq', 6, true);
          public          postgres    false    243            X           0    0    transportadora_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.transportadora_id_seq', 3, true);
          public          postgres    false    244            Y           0    0 	   uf_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.uf_id_seq', 9, true);
          public          postgres    false    245            Z           0    0    vendedor_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.vendedor_id_seq', 9, true);
          public          postgres    false    246            4           2606    16450    bairro pk_brr_idbairro 
   CONSTRAINT     Z   ALTER TABLE ONLY public.bairro
    ADD CONSTRAINT pk_brr_idbairro PRIMARY KEY (idbairro);
 @   ALTER TABLE ONLY public.bairro DROP CONSTRAINT pk_brr_idbairro;
       public            postgres    false    218            &           2606    16407    cliente pk_cln_idcliente 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_cln_idcliente PRIMARY KEY (idcliente);
 B   ALTER TABLE ONLY public.cliente DROP CONSTRAINT pk_cln_idcliente;
       public            postgres    false    214            X           2606    33306    conta pk_cnt_idconta 
   CONSTRAINT     W   ALTER TABLE ONLY public.conta
    ADD CONSTRAINT pk_cnt_idconta PRIMARY KEY (idconta);
 >   ALTER TABLE ONLY public.conta DROP CONSTRAINT pk_cnt_idconta;
       public            postgres    false    251            0           2606    16443     complemento pk_cpl_idcomplemento 
   CONSTRAINT     i   ALTER TABLE ONLY public.complemento
    ADD CONSTRAINT pk_cpl_idcomplemento PRIMARY KEY (idcomplemento);
 J   ALTER TABLE ONLY public.complemento DROP CONSTRAINT pk_cpl_idcomplemento;
       public            postgres    false    217            V           2606    24809    exemplo pk_exemplo_idexemplo 
   CONSTRAINT     a   ALTER TABLE ONLY public.exemplo
    ADD CONSTRAINT pk_exemplo_idexemplo PRIMARY KEY (idexemplo);
 F   ALTER TABLE ONLY public.exemplo DROP CONSTRAINT pk_exemplo_idexemplo;
       public            postgres    false    235            B           2606    24697    fornecedor pk_frn_idfornecedor 
   CONSTRAINT     f   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT pk_frn_idfornecedor PRIMARY KEY (idfornecedor);
 H   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT pk_frn_idfornecedor;
       public            postgres    false    221            >           2606    24680    municipio pk_mnc_idmunicipio 
   CONSTRAINT     c   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT pk_mnc_idmunicipio PRIMARY KEY (idmunicipio);
 F   ALTER TABLE ONLY public.municipio DROP CONSTRAINT pk_mnc_idmunicipio;
       public            postgres    false    220            ,           2606    16436 $   nacionalidade pk_ncn_idnacionalidade 
   CONSTRAINT     o   ALTER TABLE ONLY public.nacionalidade
    ADD CONSTRAINT pk_ncn_idnacionalidade PRIMARY KEY (idnacionalidade);
 N   ALTER TABLE ONLY public.nacionalidade DROP CONSTRAINT pk_ncn_idnacionalidade;
       public            postgres    false    216            R           2606    24733    pedido pk_pdd_idpedido 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pk_pdd_idpedido PRIMARY KEY (idpedido);
 @   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pk_pdd_idpedido;
       public            postgres    false    225            T           2606    24753 %   pedido_produto pk_pdp_idpedidoproduto 
   CONSTRAINT     t   ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT pk_pdp_idpedidoproduto PRIMARY KEY (idpedido, idproduto);
 O   ALTER TABLE ONLY public.pedido_produto DROP CONSTRAINT pk_pdp_idpedidoproduto;
       public            postgres    false    226    226            O           2606    24723    produto pk_prd_idproduto 
   CONSTRAINT     ]   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT pk_prd_idproduto PRIMARY KEY (idproduto);
 B   ALTER TABLE ONLY public.produto DROP CONSTRAINT pk_prd_idproduto;
       public            postgres    false    224            (           2606    16429    profissao pk_prf_idprofissao 
   CONSTRAINT     c   ALTER TABLE ONLY public.profissao
    ADD CONSTRAINT pk_prf_idprofissao PRIMARY KEY (idprofissao);
 F   ALTER TABLE ONLY public.profissao DROP CONSTRAINT pk_prf_idprofissao;
       public            postgres    false    215            J           2606    24711 &   transportadora pk_trn_idtransportadora 
   CONSTRAINT     r   ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT pk_trn_idtransportadora PRIMARY KEY (idtransportadora);
 P   ALTER TABLE ONLY public.transportadora DROP CONSTRAINT pk_trn_idtransportadora;
       public            postgres    false    223            8           2606    24664    uf pk_ufd_idunidade_federacao 
   CONSTRAINT     ]   ALTER TABLE ONLY public.uf
    ADD CONSTRAINT pk_ufd_idunidade_federacao PRIMARY KEY (iduf);
 G   ALTER TABLE ONLY public.uf DROP CONSTRAINT pk_ufd_idunidade_federacao;
       public            postgres    false    219            F           2606    24704    vendedor pk_vnd_idvendedor 
   CONSTRAINT     `   ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT pk_vnd_idvendedor PRIMARY KEY (idvendedor);
 D   ALTER TABLE ONLY public.vendedor DROP CONSTRAINT pk_vnd_idvendedor;
       public            postgres    false    222            D           2606    24699    fornecedor uc_frn_nome 
   CONSTRAINT     Q   ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT uc_frn_nome UNIQUE (nome);
 @   ALTER TABLE ONLY public.fornecedor DROP CONSTRAINT uc_frn_nome;
       public            postgres    false    221            H           2606    24706    vendedor uc_vnd_nome 
   CONSTRAINT     O   ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT uc_vnd_nome UNIQUE (nome);
 >   ALTER TABLE ONLY public.vendedor DROP CONSTRAINT uc_vnd_nome;
       public            postgres    false    222            6           2606    16452    bairro un_brr_idbairro 
   CONSTRAINT     Q   ALTER TABLE ONLY public.bairro
    ADD CONSTRAINT un_brr_idbairro UNIQUE (nome);
 @   ALTER TABLE ONLY public.bairro DROP CONSTRAINT un_brr_idbairro;
       public            postgres    false    218            2           2606    16445    complemento un_cpl_nome 
   CONSTRAINT     R   ALTER TABLE ONLY public.complemento
    ADD CONSTRAINT un_cpl_nome UNIQUE (nome);
 A   ALTER TABLE ONLY public.complemento DROP CONSTRAINT un_cpl_nome;
       public            postgres    false    217            @           2606    24682    municipio un_mnc_nome 
   CONSTRAINT     P   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT un_mnc_nome UNIQUE (nome);
 ?   ALTER TABLE ONLY public.municipio DROP CONSTRAINT un_mnc_nome;
       public            postgres    false    220            .           2606    16438    nacionalidade un_ncn_nome 
   CONSTRAINT     T   ALTER TABLE ONLY public.nacionalidade
    ADD CONSTRAINT un_ncn_nome UNIQUE (nome);
 C   ALTER TABLE ONLY public.nacionalidade DROP CONSTRAINT un_ncn_nome;
       public            postgres    false    216            *           2606    16431    profissao un_prf_nome 
   CONSTRAINT     P   ALTER TABLE ONLY public.profissao
    ADD CONSTRAINT un_prf_nome UNIQUE (nome);
 ?   ALTER TABLE ONLY public.profissao DROP CONSTRAINT un_prf_nome;
       public            postgres    false    215            L           2606    24713    transportadora un_trn_nome 
   CONSTRAINT     U   ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT un_trn_nome UNIQUE (nome);
 D   ALTER TABLE ONLY public.transportadora DROP CONSTRAINT un_trn_nome;
       public            postgres    false    223            :           2606    24666    uf un_ufd_nome 
   CONSTRAINT     I   ALTER TABLE ONLY public.uf
    ADD CONSTRAINT un_ufd_nome UNIQUE (nome);
 8   ALTER TABLE ONLY public.uf DROP CONSTRAINT un_ufd_nome;
       public            postgres    false    219            <           2606    24668    uf un_ufd_sigla 
   CONSTRAINT     K   ALTER TABLE ONLY public.uf
    ADD CONSTRAINT un_ufd_sigla UNIQUE (sigla);
 9   ALTER TABLE ONLY public.uf DROP CONSTRAINT un_ufd_sigla;
       public            postgres    false    219            $           1259    24841    idx_cln_nome    INDEX     @   CREATE INDEX idx_cln_nome ON public.cliente USING btree (nome);
     DROP INDEX public.idx_cln_nome;
       public            postgres    false    214            P           1259    24842    idx_pdd_data_pedido    INDEX     M   CREATE INDEX idx_pdd_data_pedido ON public.pedido USING btree (data_pedido);
 '   DROP INDEX public.idx_pdd_data_pedido;
       public            postgres    false    225            M           1259    24843    idx_pdr_nome    INDEX     @   CREATE INDEX idx_pdr_nome ON public.produto USING btree (nome);
     DROP INDEX public.idx_pdr_nome;
       public            postgres    false    224            f           2620    33206    bairro log_bairro_trigger    TRIGGER     s   CREATE TRIGGER log_bairro_trigger AFTER INSERT ON public.bairro FOR EACH ROW EXECUTE FUNCTION public.bairro_log();
 2   DROP TRIGGER log_bairro_trigger ON public.bairro;
       public          postgres    false    218    259            g           2620    33211    pedido log_pedido_trigger    TRIGGER     t   CREATE TRIGGER log_pedido_trigger BEFORE DELETE ON public.pedido FOR EACH ROW EXECUTE FUNCTION public.pedido_log();
 2   DROP TRIGGER log_pedido_trigger ON public.pedido;
       public          postgres    false    260    225            Y           2606    24688    cliente fk_cliente_idmunicipio    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cliente_idmunicipio FOREIGN KEY (idmunicipio) REFERENCES public.municipio(idmunicipio);
 H   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_cliente_idmunicipio;
       public          postgres    false    214    3390    220            Z           2606    24655    cliente fk_cln_idbairro    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idbairro FOREIGN KEY (idbairro) REFERENCES public.bairro(idbairro);
 A   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_cln_idbairro;
       public          postgres    false    214    3380    218            [           2606    16463    cliente fk_cln_idcomplemento    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idcomplemento FOREIGN KEY (idcomplemento) REFERENCES public.complemento(idcomplemento);
 F   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_cln_idcomplemento;
       public          postgres    false    214    3376    217            \           2606    16458    cliente fk_cln_idnacionalidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idnacionalidade FOREIGN KEY (idnacionalidade) REFERENCES public.nacionalidade(idnacionalidade);
 H   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_cln_idnacionalidade;
       public          postgres    false    3372    216    214            ]           2606    16453    cliente fk_cln_idprofissao    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_cln_idprofissao FOREIGN KEY (idprofissao) REFERENCES public.profissao(idprofissao);
 D   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_cln_idprofissao;
       public          postgres    false    214    3368    215            ^           2606    24683    municipio fk_mnc_iduf    FK CONSTRAINT     p   ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT fk_mnc_iduf FOREIGN KEY (iduf) REFERENCES public.uf(iduf);
 ?   ALTER TABLE ONLY public.municipio DROP CONSTRAINT fk_mnc_iduf;
       public          postgres    false    220    3384    219            a           2606    24734    pedido fk_pdd_idcliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idcliente FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 A   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk_pdd_idcliente;
       public          postgres    false    225    3366    214            b           2606    24739    pedido fk_pdd_idtransportadora    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idtransportadora FOREIGN KEY (idtransportadora) REFERENCES public.transportadora(idtransportadora);
 H   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk_pdd_idtransportadora;
       public          postgres    false    3402    223    225            c           2606    24744    pedido fk_pdd_idvendedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pdd_idvendedor FOREIGN KEY (idvendedor) REFERENCES public.vendedor(idvendedor);
 B   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk_pdd_idvendedor;
       public          postgres    false    225    222    3398            d           2606    24754    pedido_produto fk_pdp_idpedido    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT fk_pdp_idpedido FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 H   ALTER TABLE ONLY public.pedido_produto DROP CONSTRAINT fk_pdp_idpedido;
       public          postgres    false    225    3410    226            e           2606    24759    pedido_produto fk_pdp_idproduto    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_produto
    ADD CONSTRAINT fk_pdp_idproduto FOREIGN KEY (idproduto) REFERENCES public.produto(idproduto);
 I   ALTER TABLE ONLY public.pedido_produto DROP CONSTRAINT fk_pdp_idproduto;
       public          postgres    false    224    226    3407            `           2606    24724    produto fk_prd_idfornecedor    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_prd_idfornecedor FOREIGN KEY (idfornecedor) REFERENCES public.fornecedor(idfornecedor);
 E   ALTER TABLE ONLY public.produto DROP CONSTRAINT fk_prd_idfornecedor;
       public          postgres    false    3394    221    224            _           2606    24714 !   transportadora fn_trn_idmunicipio    FK CONSTRAINT     �   ALTER TABLE ONLY public.transportadora
    ADD CONSTRAINT fn_trn_idmunicipio FOREIGN KEY (idmunicipio) REFERENCES public.municipio(idmunicipio);
 K   ALTER TABLE ONLY public.transportadora DROP CONSTRAINT fn_trn_idmunicipio;
       public          postgres    false    3390    220    223               p   x�3�t�LILIU��/K�2�tN�+)��2�>�8_! 5�1�N�+IT�/N�2�,I-.I5�2�0���9C\�C\���]]B��M B�\����iap��qqq �t �         2   x�34�4202�50�54S04�22�2��35�0���24�+k�O6F��� X9�      �     x�u�Mn�0���S�
4$%�KՎ���ME6l�,d	�����6��c�HAY2 �����]u~�S������4�i����?}���s�kPZ�{](��%�U��Z+��%d��e�Y�y���!Y�&��ǯer�ݕ��QQ:�r�i		��ߴAE��I��v]����U��R�$�w���k|s�����tluz
�`�u�%�r\	��]�+��ȲN�]�O�c��Žg)�����O�}�U�|���J.Z �����kL<KJC}�wv��ZLb��P�����P���PJ�1E�f��Z8�)�fc@�6IO�P�"D�\L�n$�(	EsBT�_7��`��I�h�
֡z%3-�k��1��"�	��"��n^��M�fȰ�$�Q#���dIB��Xu}ی��B�f�3B�PK��B��y,�d�Lxl�m@)5K�F8Xu�?�0�c#�v(l9�yt��
��c������]|�N������(e��d�3�Td����Oכ޻���/���           -   x�3�tN,N�2�t,H,*I�M�+��2�I-.Iv����� �m
Z         $   x�3�t��t�qU0�00�2��8́�=... �J         ,   x�3�t�H�-��W0�2������lc.8ۄ��6����� i��         A   x�3�tN,�s��-(-IL�/J-�2�tt�S@2�tr�S�=���43/��˄3�5�\�b���� =?         �   x�M�M
�@���)���O]J)��j�+7�	:0L ��<�\́v!d����=��$f�>},�R��[��?��z�+�sd�`Z��^%k����
%6p�b���a����.c*�,�]�2Ը���q�g-��!Ow�}�+D�v[8
      �   H   x�3�t*J,��I�,J�2��,I��L�K�2���/*I�u�M-�L��p:��^�e�Y�Z\R�Z����� �7�         �   x�]��� C��]Z9	)�7A�����C���1�ځr�% M�P��<��$��J�u��ޚ�W���n̦�9�ͧ���iɶ���ˈ��c�g_�N���-�{��'��; L 	 �[9=�r���nʦ��k7�X�����1?ت�i�2�@�SU��?7      	   d   x�M��� D�PL���K��#��`ƃo��bҤ
�h��d�J���vds�gss��%������"I�����#����G� 4����Jl*z_�� �f<         *   x�3�4C#]]CNS ��X��L�Ќ+F��� y         �   x�=�=
1��S��l�����M@��&&#6�Y/dm�r1G���^
l�b���������=	:FKF���h�n �h�@�Y�K��Kt⸵��yz�.q�J�nX��^��W7�U(����/��t��|��%�����*S      �   Q   x�3�t-.)MI�+I�2�t�KO��H�,��2�HM)3M8���s2�K�L9���R����8C\�C�]�b���� ȑo         M   x�3��t
V)J�+.�/*I-�*MTHI,V���M,�40�2�4���<�8E]�q���` r����qqq �         }   x��;
�0뷧��q e0F`(ڔi�B`� �
9�/�j�9A�lʃnZsQ�@g�Z�B������·le����Q���];�ĳ����������\q�;^�4�'��� �%�         b   x�3�t�K):��ˈ�1'��8?�˘�+�(b�阙S0��M,�L�2�.M�I��2��K����)K�K��I-.IU(N-,=�*/�:F��� ���     