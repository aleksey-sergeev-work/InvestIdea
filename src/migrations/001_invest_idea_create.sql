

CREATE TABLE growth_factors (
	id serial8 NOT NULL,
	description varchar NOT NULL,
	CONSTRAINT growth_factors_pk PRIMARY KEY (id)
);

CREATE TABLE securities (
	id serial8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT securities_pk PRIMARY KEY (id)
);

CREATE TABLE invest_ideas (
	id serial8 NOT NULL,
	"name" varchar NOT NULL,
	description varchar NOT NULL,
	buy_date date DEFAULT current_date NOT NULL,
	buy_rate decimal NOT NULL,
	sell_date date DEFAULT current_date NOT NULL,
	sell_rate decimal NOT NULL,
	expiration_date date DEFAULT now() NOT NULL,
	security_id int8 NOT NULL,
	CONSTRAINT invest_ideas_pk PRIMARY KEY (id),
	CONSTRAINT invest_ideas_securities_fk FOREIGN KEY (security_id) REFERENCES securities(id)
);

CREATE TABLE users (
	id serial8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (id),
	CONSTRAINT users_unique UNIQUE ("name")
);

CREATE TABLE invest_ideas_growth_factors (
	growth_factor_id bigint NOT NULL,
	invest_idea_id bigint NOT NULL,
	CONSTRAINT invest_ideas_growth_factors_invest_ideas_fk FOREIGN KEY (invest_idea_id) REFERENCES invest_ideas(id),
	CONSTRAINT invest_ideas_growth_factors_growth_factors_fk FOREIGN KEY (growth_factor_id) REFERENCES growth_factors(id)
);
