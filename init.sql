-- Crear Tablas Maestras
CREATE TABLE public.rol (
    id_rol SERIAL PRIMARY KEY,
    rol VARCHAR(15) NOT NULL
);

CREATE TABLE public.propietarios (
    idpropietario SERIAL PRIMARY KEY,
    folio VARCHAR(50),
    fecha_folio DATE,
    propietario VARCHAR(150),
    vialidad VARCHAR(150),
    colonia VARCHAR(150),
    congregacion INTEGER,
    region INTEGER,
    manzana INTEGER,
    lote INTEGER,
    nivel INTEGER,
    departamento INTEGER,
    inscripcion INTEGER,
    seccion VARCHAR(50),
    fecha_escritura DATE,
    estatus_area VARCHAR(50)
);

CREATE TABLE public.topografia (
    idtopografia SERIAL PRIMARY KEY,
    numero_oficial VARCHAR(80),
    paramento_total VARCHAR(150),
    uso_espacio VARCHAR(120),
    frente VARCHAR(120),
    restriccion VARCHAR(50),
    nombre_revisorr VARCHAR(100),
    revisado_con VARCHAR(120),
    fecha_captura DATE
);

-- Crear Tablas con Relaciones
CREATE TABLE public.usuarios (
    idusuario SERIAL PRIMARY KEY,
    nombre VARCHAR(120),
    apellidos VARCHAR(120),
    correo VARCHAR(120) UNIQUE,
    contrasenia VARCHAR(255), -- Aumentado para mayor seguridad (hashes)
    estado BOOLEAN DEFAULT TRUE,
    ultimo_login DATE,
    fecha_creacion DATE DEFAULT CURRENT_DATE,
    id_rol_fk INTEGER REFERENCES public.rol(id_rol)
);

CREATE TABLE public.costos (
    id_costos SERIAL PRIMARY KEY,
    tipo_uso VARCHAR(50),
    cantidad_frentes VARCHAR(50),
    monto_alineamiento NUMERIC(15,2),
    monto_oficial NUMERIC(15,2),
    total NUMERIC(15,2),
    fecha_oficio DATE,
    id_topografia_fk INTEGER REFERENCES public.topografia(idtopografia)
);

CREATE TABLE public.observaciones (
    idobservacion SERIAL PRIMARY KEY,
    observacion VARCHAR(200),
    fecha DATE,
    id_usuario_fk INTEGER REFERENCES public.usuarios(idusuario),
    id_propietario_fk INTEGER REFERENCES public.propietarios(idpropietario),
    id_topografia_fk INTEGER REFERENCES public.topografia(idtopografia)
);

CREATE TABLE public.estados (
    id_estado SERIAL PRIMARY KEY,
    estado_propiedades VARCHAR(50),
    estado_topografia VARCHAR(50),
    estado_costos VARCHAR(50),
    id_propiedades_fk INTEGER REFERENCES public.propietarios(idpropietario),
    id_topografia_fk INTEGER REFERENCES public.topografia(idtopografia),
    id_costos_fk INTEGER REFERENCES public.costos(id_costos)
);