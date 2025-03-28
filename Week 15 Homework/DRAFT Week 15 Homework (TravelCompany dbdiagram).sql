CREATE TABLE [Country] (
  [id] integer PRIMARY KEY,
  [name] text
)
GO

CREATE TABLE [HistoricalArea] (
  [id] integer PRIMARY KEY,
  [name] text
)
GO

CREATE TABLE [IndustrialRegion] (
  [id] integer PRIMARY KEY,
  [name] text
)
GO

CREATE TABLE [City] (
  [id] integer PRIMARY KEY,
  [name] text,
  [id_country] integer,
  [id_historical_area] integer,
  [id_industrial_region] integer
)
GO

CREATE TABLE [Resort] (
  [id] integer PRIMARY KEY,
  [name] text,
  [description] text,
  [rating] text,
  [climate] text,
  [time_zone] text,
  [photos] url,
  [seasonality] text,
  [cultural_features] text,
  [security_situation] text,
  [id_city] integer
)
GO

CREATE TABLE [Excursion] (
  [id] integer PRIMARY KEY,
  [name] text,
  [description] text,
  [type] text,
  [id_resort] enum
)
GO

CREATE TABLE [Hotel] (
  [id] integer PRIMARY KEY,
  [name] text,
  [stars] text,
  [free_rooms] text,
  [room_types] text,
  [address] text,
  [distance_to_key_objects] text,
  [infrastructure] text,
  [services] text,
  [meal_types] text,
  [languages] text,
  [photos] url,
  [rating] text,
  [room_prices] text,
  [id_resort] integer
)
GO

CREATE TABLE [VacationType] (
  [id] integer PRIMARY KEY,
  [name] enum
)
GO

CREATE TABLE [TransportType] (
  [id] integer PRIMARY KEY,
  [name] enum
)
GO

CREATE TABLE [TripDuration] (
  [id] integer PRIMARY KEY,
  [description] enum
)
GO

CREATE TABLE [Employee] (
  [id] integer PRIMARY KEY,
  [first_name] text,
  [last_name] text,
  [position] enum,
  [salary] text
)
GO

CREATE TABLE [Client] (
  [id] integer PRIMARY KEY,
  [first_name] text,
  [last_name] text,
  [middle_name] text,
  [age] text,
  [sex] enum,
  [profession] text,
  [departure_date] text,
  [trip_purpose] text,
  [id_resort] integer
)
GO

CREATE TABLE [Trip] (
  [id] integer PRIMARY KEY,
  [id_client] integer,
  [id_trip_duration] integer,
  [id_trip_cost] integer
)
GO

CREATE TABLE [TripCost] (
  [id] integer PRIMARY KEY,
  [accommodation] text,
  [meals] text,
  [transport] text,
  [excursions] text,
  [entertainment] text,
  [rental] text,
  [souvenirs] text,
  [insurance] text,
  [escort] text
)
GO

CREATE TABLE [TripVacationType] (
  [id_trip] integer,
  [id_vacation_type] integer
)
GO

CREATE TABLE [TripTransportType] (
  [id_trip] integer,
  [id_transport_type] integer
)
GO

ALTER TABLE [City] ADD FOREIGN KEY ([id_country]) REFERENCES [Country] ([id])
GO

ALTER TABLE [City] ADD FOREIGN KEY ([id_historical_area]) REFERENCES [HistoricalArea] ([id])
GO

ALTER TABLE [City] ADD FOREIGN KEY ([id_industrial_region]) REFERENCES [IndustrialRegion] ([id])
GO

ALTER TABLE [Resort] ADD FOREIGN KEY ([id_city]) REFERENCES [City] ([id])
GO

ALTER TABLE [Hotel] ADD FOREIGN KEY ([id_resort]) REFERENCES [Resort] ([id])
GO

ALTER TABLE [Client] ADD FOREIGN KEY ([id_resort]) REFERENCES [Resort] ([id])
GO

ALTER TABLE [Client] ADD FOREIGN KEY ([id]) REFERENCES [Trip] ([id_client])
GO

ALTER TABLE [Trip] ADD FOREIGN KEY ([id_trip_duration]) REFERENCES [TripDuration] ([id])
GO

ALTER TABLE [TripCost] ADD FOREIGN KEY ([id]) REFERENCES [Trip] ([id_trip_cost])
GO

ALTER TABLE [TripVacationType] ADD FOREIGN KEY ([id_trip]) REFERENCES [Trip] ([id])
GO

ALTER TABLE [VacationType] ADD FOREIGN KEY ([name]) REFERENCES [TripVacationType] ([id_vacation_type])
GO

ALTER TABLE [TripTransportType] ADD FOREIGN KEY ([id_trip]) REFERENCES [Trip] ([id])
GO

ALTER TABLE [TransportType] ADD FOREIGN KEY ([id]) REFERENCES [TripTransportType] ([id_transport_type])
GO

ALTER TABLE [Resort] ADD FOREIGN KEY ([id]) REFERENCES [Excursion] ([id_resort])
GO
