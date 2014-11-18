DROP TABLE IF EXISTS v_budove;
DROP TABLE IF EXISTS budova;
DROP TABLE IF EXISTS na_podlazi;
DROP TABLE IF EXISTS podlazie;
DROP TABLE IF EXISTS hrana;
DROP TABLE IF EXISTS uzol;

CREATE TABLE uzol (
  id VARCHAR(80) NOT NULL PRIMARY KEY COMMENT 'Sluzi zaroven ako nazov, napr. M-VII, F1-246, A, WC,...',
  typ VARCHAR(80) DEFAULT NULL COMMENT 'Napr. dvere, chodba, wc-muzi, poslucharen, atd.',
  suradnice VARCHAR(1000) DEFAULT NULL COMMENT 'x1,y1,x2,y2,x3,y3,... vrcholy polygonu reprezentujuceho miestnost, resp. suradnice dveri na mape.',
  info VARCHAR(5000) DEFAULT NULL COMMENT 'Informacie o miestnosti v HTLM formate.'
) COMMENT='Miestnosti, chodby a dvere.';

CREATE TABLE hrana (
  z_uzlu VARCHAR(80) NOT NULL,
  do_uzlu VARCHAR(80) NOT NULL,
  KEY fk_z_uzlu (z_uzlu),
  KEY fk_do_uzlu (do_uzlu),
  CONSTRAINT fk_z_uzlu
    FOREIGN KEY (z_uzlu)
    REFERENCES uzol (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_do_uzlu
    FOREIGN KEY (do_uzlu)
    REFERENCES uzol (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) COMMENT='Prechody medzi uzlami.';

CREATE TABLE podlazie (
  id VARCHAR(80) NOT NULL PRIMARY KEY,
  nazov VARCHAR(80) NOT NULL COMMENT 'Napr. -1, P, 1, strecha, atd.',
  suradnice VARCHAR(1000) DEFAULT NULL COMMENT 'x1,y1,x2,y2,x3,y3,... vrcholy polygonu reprezentujuceho podlazie na mape.'
) COMMENT='Jednotlive podlazia roznych budov.';

CREATE TABLE na_podlazi (
  podlazie VARCHAR(80) NOT NULL,
  uzol VARCHAR(80) NOT NULL,
  CONSTRAINT fk_podlazie
    FOREIGN KEY (podlazie)
    REFERENCES podlazie (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_uzol
    FOREIGN KEY (uzol)
    REFERENCES uzol (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) COMMENT='Ktore uzly (miestnosti, chodby...) sa nachadzaju na ktorom podlazi.';

CREATE TABLE budova (
  id VARCHAR(80) NOT NULL PRIMARY KEY COMMENT 'Sluzi aj ako nazov, napr. F1, F2, M, I, atd.',
  suradnice VARCHAR(1000) DEFAULT NULL COMMENT 'x1,y1,x2,y2,x3,y3,... vrcholy polygonu reprezentujuceho budovu na mape.'
) COMMENT='Tabulka budov na mape';

CREATE TABLE v_budove (
  budova VARCHAR(80) NOT NULL,
  podlazie VARCHAR(80) NOT NULL,
  CONSTRAINT fk_budova
    FOREIGN KEY (budova)
    REFERENCES budova (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_podlazie_v_budove
    FOREIGN KEY (podlazie)
    REFERENCES podlazie (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) COMMENT='Ktore podlazia sa nachadzaju v ktorej budove.';
