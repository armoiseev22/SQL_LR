
BEGIN;

CREATE TABLE IF NOT EXISTS public."Flight_type"
(
    id_flight_type integer PRIMARY KEY,
    type_name character varying(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Aircraft_type"
(
    id_aircraft_type integer PRIMARY KEY,
    model character varying(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Crew"
(
    id_steward integer PRIMARY KEY,
    full_name character varying(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Passenger"
(
    id_passenger integer PRIMARY KEY,
    surname character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Flight"
(
    id_flight integer PRIMARY KEY,
    id_flight_type integer NOT NULL,
    id_aircraft_type integer NOT NULL,
    departure_city character varying(100) NOT NULL,
    arrival_city character varying(100) NOT NULL,
    departure_date date NOT NULL,
    flight_number character varying(10) NOT NULL,
    FOREIGN KEY (id_flight_type) REFERENCES public."Flight_type" (id_flight_type),
    FOREIGN KEY (id_aircraft_type) REFERENCES public."Aircraft_type" (id_aircraft_type)
);

CREATE TABLE IF NOT EXISTS public."Ticket"
(
    id_passenger integer NOT NULL,
    id_flight integer NOT NULL,
    id_ticket integer,
    seat_number character varying(4) NOT NULL,
    return_ticket boolean NOT NULL,
    PRIMARY KEY (id_passenger, id_flight, id_ticket),
    FOREIGN KEY (id_passenger) REFERENCES public."Passenger" (id_passenger),
    FOREIGN KEY (id_flight) REFERENCES public."Flight" (id_flight)
);

CREATE TABLE IF NOT EXISTS public."Crew_Flight"
(
    id_steward integer NOT NULL,
    id_flight integer NOT NULL,
    PRIMARY KEY (id_steward, id_flight),
    FOREIGN KEY (id_steward) REFERENCES public."Crew" (id_steward),
    FOREIGN KEY (id_flight) REFERENCES public."Flight" (id_flight)
);

END;
