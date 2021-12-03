IF OBJECT_ID('DimVendeur') IS NOT NULL
DROP TABLE DimVendeur 
CREATE TABLE DimVendeur(IdVendeur BIGINT IDENTITY(1,1) CONSTRAINT PK_DimVendeur PRIMARY KEY(IdVendeur),
                        Vendeur VARCHAR(150),DS_IdVendeur VARCHAR(6000));

SET IDENTITY_INSERT dbo.DimVendeur ON;
INSERT INTO DimVendeur(IdVendeur,vendeur,DS_IdVendeur)
SELECT ROW_NUMBER() OVER(ORDER BY Vendeur ASC) IdVendeur,* FROM (
SELECT DISTINCT vendeur, ds_idvendeur FROM DS_VENTE) T

SELECT * FROM DimVendeur