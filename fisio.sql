CREATE TABLE "public.Paciente" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"cpf" char(11) NOT NULL,
	"Profissão" varchar(255) NOT NULL,
	"fone" varchar(20),
	"email" varchar(30),
	"data_nascimento" DATE NOT NULL,
	"senha" varchar(255),
	"vezes_semana" int NOT NULL,
	"cep" varchar(10) NOT NULL,
	"numero" int NOT NULL,
	"bairro" varchar(255) NOT NULL,
	"rua" varchar(255) NOT NULL,
	"cidade" varchar(255) NOT NULL,
	"tratamento" int NOT NULL,
	CONSTRAINT "Paciente_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ContasAPagar" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"valor" int NOT NULL,
	"data_vencimento" DATE NOT NULL,
	"ja_foi_paga" BOOLEAN NOT NULL,
	CONSTRAINT "ContasAPagar_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Pagamento" (
	"id" serial NOT NULL,
	"timestamp" TIMESTAMP NOT NULL,
	"valor" int NOT NULL,
	"mes_referencia" int NOT NULL,
	"paciente" int NOT NULL,
	CONSTRAINT "Pagamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tratamento" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"descricao" TEXT NOT NULL,
	CONSTRAINT "Tratamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Agendamento" (
	"id" serial NOT NULL,
	"data_agendamento" TIMESTAMP NOT NULL,
	"data_agendamento_foi_feito" TIMESTAMP NOT NULL,
	"paciente" int NOT NULL,
	"fisioterapeuta" int,
	CONSTRAINT "Agendamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Prontuario" (
	"id" serial,
	"historia_doenca" TEXT,
	"historia_doenca_pregressa" TEXT,
	"medicamentos" TEXT,
	"imagem" varchar(255) NOT NULL,
	"dores" TEXT,
	"observacoes" TEXT,
	"paciente" int NOT NULL,
	CONSTRAINT "Prontuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FormaDePagamento" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"descricao" TEXT NOT NULL,
	CONSTRAINT "FormaDePagamento_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Fisioterapeuta" (
	"id" serial NOT NULL,
	"nome" varchar(100) NOT NULL,
	"cpf" char(11) NOT NULL,
	"fone" varchar(20) NOT NULL,
	"email" varchar(30) NOT NULL,
	"senha" varchar(255) NOT NULL,
	"cep" varchar(10) NOT NULL,
	"numero" int NOT NULL,
	"bairro" varchar(255) NOT NULL,
	"rua" varchar(255) NOT NULL,
	"cidade" varchar(255) NOT NULL,
	CONSTRAINT "Fisioterapeuta_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Através" (
	"id_pagamento" int NOT NULL,
	"id_forma_pagamento" int NOT NULL
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Paciente" ADD CONSTRAINT "Paciente_fk0" FOREIGN KEY ("tratamento") REFERENCES "Tratamento"("id");


ALTER TABLE "Pagamento" ADD CONSTRAINT "Pagamento_fk0" FOREIGN KEY ("paciente") REFERENCES "Paciente"("id");


ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_fk0" FOREIGN KEY ("paciente") REFERENCES "Paciente"("id");
ALTER TABLE "Agendamento" ADD CONSTRAINT "Agendamento_fk1" FOREIGN KEY ("fisioterapeuta") REFERENCES "Fisioterapeuta"("id");

ALTER TABLE "Prontuario" ADD CONSTRAINT "Prontuario_fk0" FOREIGN KEY ("paciente") REFERENCES "Paciente"("id");



ALTER TABLE "Através" ADD CONSTRAINT "Através_fk0" FOREIGN KEY ("id_pagamento") REFERENCES "Pagamento"("id");
ALTER TABLE "Através" ADD CONSTRAINT "Através_fk1" FOREIGN KEY ("id_forma_pagamento") REFERENCES "FormaDePagamento"("id");










