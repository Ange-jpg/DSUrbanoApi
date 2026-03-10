BEGIN;

CREATE TABLE IF NOT EXISTS public.rol (
    id_rol integer NOT NULL,
    rol character varying(15) NOT NULL,
    PRIMARY KEY (id_rol)
);

CREATE TABLE IF NOT EXISTS public.cat_estado (
    id_estado integer NOT NULL,
    estado character varying(50) NOT NULL,
    PRIMARY KEY (id_estado)
);

CREATE TABLE IF NOT EXISTS public.cat_topologia (
    id_cat_topologia integer NOT NULL,
    cat_topologia character varying(50) NOT NULL,
    PRIMARY KEY (id_cat_topologia)
);

CREATE TABLE IF NOT EXISTS public.tipo_uso (
    id_tipo_uso integer NOT NULL,
    tipo_uso character varying(20) NOT NULL,
    PRIMARY KEY (id_tipo_uso)
);

-- 2. TABLAS PRINCIPALES
CREATE TABLE IF NOT EXISTS public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(120) NOT NULL,
    apellidos character varying(120) NOT NULL,
    correo character varying(120) NOT NULL,
    contrasenia character varying(13) NOT NULL,
    estado boolean NOT NULL,
    ultimo_login date,
    fecha_creacion date NOT NULL,
    id_rol_fk integer NOT NULL,
    PRIMARY KEY (id_usuario),
    CONSTRAINT fk_rol FOREIGN KEY (id_rol_fk) REFERENCES public.rol (id_rol)
);

CREATE TABLE IF NOT EXISTS public.propietarios (
    id_propietario integer NOT NULL,
    folio character varying(50) NOT NULL,
    fecha_folio date NOT NULL,
    propietario character varying(150) NOT NULL,
    vialidad character varying(150) NOT NULL,
    colonia character varying(150) NOT NULL,
    congregacion integer NOT NULL,
    region integer NOT NULL,
    manzana integer NOT NULL,
    lote integer NOT NULL,
    nivel integer NOT NULL,
    departamento integer NOT NULL,
    inscripcion integer NOT NULL,
    seccion character varying(50) NOT NULL,
    fecha_escritura date NOT NULL,
    id_estado_fk integer NOT NULL, -- Relación por ID
    PRIMARY KEY (id_propietario),
    CONSTRAINT fk_estado_propietario FOREIGN KEY (id_estado_fk) REFERENCES public.cat_estado (id_estado)
);


CREATE TABLE IF NOT EXISTS public.topografia (
    id_topografia integer NOT NULL,
    numero_oficial character varying(80) NOT NULL,
    paramento_total character varying(150) NOT NULL,
    uso_espacio character varying(120) NOT NULL,
    frente character varying(120) NOT NULL,
    restriccion character varying(50) NOT NULL,
    id_revisor_fk integer NOT NULL, -- Relación por ID con usuarios
    revisado_con character varying(120) NOT NULL,
    fecha_captura date NOT NULL,
    id_propietario_fk integer NOT NULL,
    id_cat_topologia_fk integer NOT NULL, -- Relación por ID con catálogo
    PRIMARY KEY (id_topografia),
    CONSTRAINT fk_revisor_topo FOREIGN KEY (id_revisor_fk) REFERENCES public.usuarios (id_usuario),
    CONSTRAINT fk_propietario_topo FOREIGN KEY (id_propietario_fk) REFERENCES public.propietarios (id_propietario),
    CONSTRAINT fk_cat_topologia FOREIGN KEY (id_cat_topologia_fk) REFERENCES public.cat_topologia (id_cat_topologia)
);

CREATE TABLE IF NOT EXISTS public.costos (
    id_costos integer NOT NULL,
    cantidad_frentes character varying(50) NOT NULL,
    monto_alineamiento double precision NOT NULL,
    monto_oficial double precision NOT NULL,
    total double precision NOT NULL,
    fecha_oficio date NOT NULL,
    id_topografia_fk integer NOT NULL,
    id_tipo_uso_fk integer NOT NULL, -- Relación por ID
    PRIMARY KEY (id_costos),
    CONSTRAINT fk_topo_costos FOREIGN KEY (id_topografia_fk) REFERENCES public.topografia (id_topografia),
    CONSTRAINT fk_tipo_uso_costos FOREIGN KEY (id_tipo_uso_fk) REFERENCES public.tipo_uso (id_tipo_uso)
);

CREATE TABLE IF NOT EXISTS public.observaciones (
    id_observacion integer NOT NULL,
    observacion character varying(200),
    fecha date,
    id_usuario_fk integer NOT NULL,
    id_propietario_fk integer NOT NULL,
    id_topografia_fk integer NOT NULL,
    PRIMARY KEY (id_observacion),
    CONSTRAINT fk_obs_usuario FOREIGN KEY (id_usuario_fk) REFERENCES public.usuarios (id_usuario),
    CONSTRAINT fk_obs_propietario FOREIGN KEY (id_propietario_fk) REFERENCES public.propietarios (id_propietario),
    CONSTRAINT fk_obs_topo FOREIGN KEY (id_topografia_fk) REFERENCES public.topografia (id_topografia)
);

COMMIT;