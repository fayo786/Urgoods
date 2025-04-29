
-- Customer Side
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactDetailsPhone VARCHAR(20),
    Address TEXT
);

-- ////////////////////////////////////////
-- Employees
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    TypeOfEmployee VARCHAR(50),
    Name VARCHAR(100),
    DateHired DATE,
    ContactDetails TEXT
);

CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    EmployeeID INT,
    Name VARCHAR(100),
    ContactDetails TEXT,
    Address TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE  or  replace TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    CustomerServiceID INT NOT NULL ,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

ALTER TABLE Invoice
ADD COLUMN CustomerServiceID INT;
ALTER TABLE Invoice
ADD CONSTRAINT fk_invoice_customerserviceid
FOREIGN KEY (CustomerServiceID) REFERENCES CustomerService(CustomerServiceID);

ALTER TABLE Invoice ADD FOREIGN KEY (CustomerServiceID) REFERENCES CustomerService(CustomerServiceID) ;

CREATE TABLE CustomerService (
    CustomerServiceID INT PRIMARY KEY,
    InvoiceID INT,
    Name VARCHAR(100),
    ContactDetails TEXT,
    DateHired DATE,
    ManagerID INT,
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Product_Category VARCHAR(50),
    Product_Description TEXT,
    Product_Price DECIMAL(10,2),
    Product_QuantityInStock INT,
    RestockDate DATE,
    SupplierInfo TEXT
);

CREATE TABLE InvoiceDetails (
    InvoiceID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (InvoiceID, ProductID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE CostShipping (
    CostShippingID INT,
    InvoiceID INT,
    Address TEXT,
    ArrivalDate DATE,
    PRIMARY KEY (CostShippingID, InvoiceID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);


-- ///////////////////////////////////////////////////////////
-- Store increment
CREATE TABLE StoreInvoice (
    StoreInvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    PurchaseQuantity INT NOT NULL CHECK (PurchaseQuantity > 0),
    ItemType VARCHAR(50) NOT NULL,
    StoreInvoiceDate DATE NOT NULL,
    ProductVendorID INT NOT NULL,
    StoreShippingID INT NOT NULL,
    ManagerID INT NOT NULL,
    FOREIGN KEY (ProductVendorID) REFERENCES ProductVendor(ProductVendorID),
    FOREIGN KEY (StoreShippingID) REFERENCES StoreShipping(StoreShippingID),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

CREATE TABLE StoreInvoiceDetails (
    DetailID INT PRIMARY KEY AUTO_INCREMENT,
    StoreInvoiceID INT NOT NULL,
    ProductID INT NOT NULL,
    PurchaseQuantity INT NOT NULL CHECK (PurchaseQuantity > 0),
    FOREIGN KEY (StoreInvoiceID) REFERENCES StoreInvoice(StoreInvoiceID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE StoreShipping (
    StoreShippingID INT PRIMARY KEY,
    StoreInvoiceID INT,
    ArrivalDate DATE,
    FOREIGN KEY (StoreInvoiceID) REFERENCES StoreInvoice(StoreInvoiceID)
);

CREATE TABLE StoreShippingDetails (
    StoreShippingDetailID INT PRIMARY KEY,
    StoreShippingID INT,
    Address TEXT,
    FOREIGN KEY (StoreShippingID) REFERENCES StoreShipping(StoreShippingID)
);

CREATE TABLE ProductVendor (
    ProductVendorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);
-- Products subtypes
CREATE TABLE Straws (
    ProductID INT PRIMARY KEY,
    Straw_Brand VARCHAR(50),
    Straw_Material VARCHAR(50),
    Straw_Recyclable BOOLEAN,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Knifes (
    ProductID INT PRIMARY KEY,
    Knife_Brand VARCHAR(50),
    Knife_Material VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Pan (
    ProductID INT PRIMARY KEY,
    Pan_Brand VARCHAR(50),
    Pan_Material VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- /////////////////////////////////
-- First 5 sample data
