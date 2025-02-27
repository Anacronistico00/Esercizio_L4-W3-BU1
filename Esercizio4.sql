CREATE DATABASE Esercizio4;

USE Esercizio4;

CREATE TABLE Impiegato (
	IDImpiegato INT IDENTITY(1,1) PRIMARY KEY,
	Cognome NVARCHAR(100) NOT NULL,
	Nome NVARCHAR(100) NOT NULL,
	CodiceFiscale NVARCHAR(16) NOT NULL,
	Eta INT NOT NULL,
	RedditoMensile DECIMAL(7,2) NOT NULL,
	DetrazioneFiscale BIT NOT NULL,
);

CREATE TABLE Impiego (
	IDImpiego INT IDENTITY(1, 1) PRIMARY KEY,
	TipoImpiego NVARCHAR(100) NOT NULL,
	Assunzione DATE NOT NULL,
	IDImpiegato INT IDENTITY(1,1) NOT NULL,
	CONSTRAINT FK_IDImpiegato FOREIGN KEY (IDImpiegato) REFERENCES Impiegato(IDImpiegato),
);


INSERT INTO Impiegato (Cognome, Nome, CodiceFiscale, Eta, RedditoMensile, DetrazioneFiscale)
VALUES 
('Rossi', 'Mario', 'RSSMRA80A01H501Z', 35, 2500.00, 1),
('Bianchi', 'Luigi', 'BNCLGU85T20A001Z', 45, 300.00, 1),
('Verdi', 'Giuseppe', 'VRDGSF70A10H501F', 50, 2800.00, 0),
('Neri', 'Giovanni', 'NRIGNN65A01H501M', 30, 2200.00, 0),
('Ferrari', 'Carlo', 'FRRCRL75B10H501D', 40, 3300.00, 1),
('Gialli', 'Andrea', 'GLLNDR80A10H501P', 28, 2400.00, 0),
('Luca', 'Corsi', 'LCCRNS82A10H501J', 32, 2700.00, 1),
('Moretti', 'Francesco', 'MRTFNC90T01H501P', 38, 500.00, 1),
('Fabbri', 'Alessandro', 'FBRLSS84A10H501P', 33, 2900.00, 0),
('Conti', 'Simone', 'CNTSMN78T01H501G', 25, 2300.00, 1),
('Martini', 'Stefano', 'MRTSFV85A01H501B', 42, 3200.00, 0),
('Ricci', 'Antonio', 'RCCNTN72A01H501R', 55, 699.00, 1),
('Giordano', 'Marco', 'GRDMRC88B01H501A', 48, 3100.00, 1),
('Costa', 'Claudia', 'CSTCLD95A10H501D', 29, 2400.00, 0),
('Santi', 'Barbara', 'STIBRB78A10H501S', 41, 3000.00, 1),
('Esposito', 'Fabio', 'ESPFBI65A01H501U', 36, 2800.00, 1),
('De Luca', 'Paolo', 'DLCPLR88T01H501Y', 27, 2600.00, 0),
('D’Angelo', 'Roberto', 'DGLRBT80A01H501M', 50, 700.00, 1),
('Belli', 'Francesca', 'BLLFNC70A01H501V', 34, 2900.00, 1),
('Marini', 'Giulia', 'MRNGLL95A01H501G', 31, 2600.00, 0);

INSERT INTO Impiego (TipoImpiego, Assunzione, IDImpiegato)
VALUES 
('Sviluppatore', '2015-01-15', 1),
('Senior', '2017-03-20', 2),
('Sviluppatore', '2019-06-25', 3),
('Sviluppatore', '2020-07-15', 4),
('Sviluppatore', '2016-05-18', 5),
('Tester', '2021-02-10', 6),
('Sviluppatore', '2018-09-30', 7),
('Tester', '2014-12-05', 8),
('Sviluppatore', '2020-08-20', 9),
('Sviluppatore', '2019-01-10', 10),
('Sviluppatore', '2015-11-30', 11),
('HR Manager', '2007-04-07', 12),
('Sviluppatore', '2013-02-17', 13),
('Sviluppatore', '2016-09-12', 14),
('Tester', '2020-06-18', 15),
('Full-time', '2014-05-30', 16),
('HR Manager', '2007-10-25', 17),
('Sviluppatore', '2018-03-05', 18),
('HR Manager', '2007-11-01', 19),
('Tester', '2019-08-23', 20);


--a. Visualizzare tutti gli impiegati oltre i 29 anni;
SELECT * FROM Impiegato
	WHERE Eta < 29;

--b. Visualizzare tutti gli impiegati con un reddito di almeno 800 euro mensili;  
SELECT * FROM Impiegato
	WHERE RedditoMensile >= 800;

--c. Visualizzare tutti gli impiegati che posseggono la detrazione fiscale;  
SELECT * FROM Impiegato
	WHERE DetrazioneFiscale = 1;

--d. Visualizzare tutti gli impiegati che non posseggono la detrazione fiscale;  
SELECT * FROM Impiegato
	WHERE DetrazioneFiscale = 0;

--e. Visualizzare tutti gli impiegati cui il cognome cominci con una lettera G e li visualizzi in ordine alfabetico; 
SELECT * FROM Impiegato
	WHERE Cognome LIKE 'G%'
	ORDER BY Cognome;

--f. Visualizzare il numero totale degli impiegati registrati nella base dati;  
SELECT COUNT(*) AS NumeroTotaleImpiegato
	FROM Impiegato;

--g. Visualizzare il totale dei redditi mensili di tutti gli impiegati;  
SELECT SUM(RedditoMensile) AS TotaleRedditiTotali
	FROM Impiegato;

--h. Visualizzare la media dei redditi mensili di tutti gli impiegati; 
SELECT AVG(RedditoMensile) AS MediaRedditiTotali
	FROM Impiegato;

--i. Visualizzare l’importo del reddito mensile maggiore;  
SELECT MAX(RedditoMensile) AS REdditoMensileMaggiore
	FROM Impiegato;

--j. Visualizzare l’importo del reddito mensile minore; 
SELECT MIN(RedditoMensile) AS REdditoMensileMaggiore
	FROM Impiegato;

--k. Visualizzare gli impiegati assunti dall’ 01/01/2007 all’ 01/01/2008;  
SELECT * FROM Impiegato
	INNER JOIN
	Impiego
	ON Impiegato.IDImpiegato = Impiego.IDImpiegato
	WHERE Impiego.Assunzione BETWEEN '2007-01-01' AND '2008-01-01';

--l. Tramite una query parametrica che identifichi il tipo di impiego, visualizzare tutti gli impiegati che corrispondono a quel tipo di impiego;
SELECT Impiegato.Cognome, Impiegato.Nome, Impiegato.CodiceFiscale, Impiego.TipoImpiego  
	FROM Impiegato
	INNER JOIN
	Impiego ON Impiegato.IDImpiegato = Impiego.IDImpiegato
	WHERE impiego.TipoImpiego = 'Sviluppatore';

--m. Visualizzare l’età media dei lavoratori all’interno dell’azienda.  
SELECT AVG(Eta) as EtaMedia
	FROM Impiegato;