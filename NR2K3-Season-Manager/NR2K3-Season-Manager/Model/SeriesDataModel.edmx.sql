
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server Compact Edition
-- --------------------------------------------------
-- Date Created: 03/02/2019 12:08:24
-- Generated from EDMX file: C:\Users\wesle\Documents\GitHub\NR2K3-Season-Manager\NR2K3-Season-Manager\NR2K3-Season-Manager\Data\SeriesDataModel.edmx
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- NOTE: if the table does not exist, an ignorable error will be reported.
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Drivers'
CREATE TABLE [Drivers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(4000)  NOT NULL,
    [LastName] nvarchar(4000)  NOT NULL,
    [Sponsor] nvarchar(4000)  NOT NULL,
    [CarNumber] tinyint  NOT NULL,
    [isRookie] bit  NOT NULL,
    [Team_Id] int  NOT NULL
);
GO

-- Creating table 'Teams'
CREATE TABLE [Teams] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TeamName] nvarchar(4000)  NOT NULL,
    [Manufacturer_Id] int  NOT NULL
);
GO

-- Creating table 'Manufacturers'
CREATE TABLE [Manufacturers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ManufacturerName] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'Series'
CREATE TABLE [Series] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SeriesName] nvarchar(4000)  NOT NULL,
    [SeriesLogo] nvarchar(4000)  NULL,
    [SanctioningLogo] nvarchar(4000)  NULL,
    [SeriesShort] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'Seasons'
CREATE TABLE [Seasons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SeasonNumber] tinyint  NOT NULL,
    [PointsSystemId] int  NOT NULL,
    [Roster] nvarchar(4000)  NOT NULL,
    [NR2K3Root] nvarchar(4000)  NOT NULL,
    [Series_Id] int  NOT NULL
);
GO

-- Creating table 'Races'
CREATE TABLE [Races] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IsExhibition] bit  NOT NULL,
    [RaceName] nvarchar(4000)  NULL,
    [TrackName] nvarchar(4000)  NOT NULL,
    [RaceDistance] smallint  NOT NULL,
    [PlayoffRoundId] int  NULL,
    [Season_Id] int  NOT NULL
);
GO

-- Creating table 'RaceResults'
CREATE TABLE [RaceResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartingPosition] tinyint  NOT NULL,
    [FinishingPosition] tinyint  NOT NULL,
    [LapsLed] smallint  NOT NULL,
    [TimeOffLeader] real  NOT NULL,
    [MostLapsLed] bit  NOT NULL,
    [DNF] bit  NOT NULL,
    [DNFReason] nvarchar(4000)  NULL
);
GO

-- Creating table 'QualifyingResults'
CREATE TABLE [QualifyingResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Time] real  NOT NULL
);
GO

-- Creating table 'WeekendResults'
CREATE TABLE [WeekendResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Race_Id] int  NOT NULL,
    [QualifyingResult_Id] int  NOT NULL,
    [RaceResult_Id] int  NOT NULL,
    [Driver_Id] int  NOT NULL
);
GO

-- Creating table 'StageResults'
CREATE TABLE [StageResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FinishingPosition] tinyint  NULL,
    [WeekendResult_Id] int  NOT NULL
);
GO

-- Creating table 'PracticeResults'
CREATE TABLE [PracticeResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IsHappyHour] bit  NOT NULL,
    [Time] real  NOT NULL,
    [WeekendResult_Id] int  NOT NULL
);
GO

-- Creating table 'PointsSystems'
CREATE TABLE [PointsSystems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LedLad] smallint  NOT NULL,
    [MostLapsLed] smallint  NOT NULL
);
GO

-- Creating table 'Positions'
CREATE TABLE [Positions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FinishingPosition] tinyint  NOT NULL,
    [Points] smallint  NOT NULL,
    [PointsSystemId] int  NOT NULL
);
GO

-- Creating table 'PlayoffRounds'
CREATE TABLE [PlayoffRounds] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PointsSystemId] int  NOT NULL
);
GO

-- Creating table 'Penalties'
CREATE TABLE [Penalties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Points] smallint  NOT NULL,
    [PointsResult_Id] int  NOT NULL
);
GO

-- Creating table 'PointsResults'
CREATE TABLE [PointsResults] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RacePointsEarned] smallint  NOT NULL,
    [RookiePointsEarned] smallint  NOT NULL,
    [TeamPointsEarned] smallint  NOT NULL,
    [ManufacturerPointsEarned] smallint  NOT NULL,
    [WeekendResult_Id] int  NOT NULL
);
GO

-- Creating table 'DriverSeason'
CREATE TABLE [DriverSeason] (
    [Drivers_Id] int  NOT NULL,
    [Seasons_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Drivers'
ALTER TABLE [Drivers]
ADD CONSTRAINT [PK_Drivers]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Teams'
ALTER TABLE [Teams]
ADD CONSTRAINT [PK_Teams]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Manufacturers'
ALTER TABLE [Manufacturers]
ADD CONSTRAINT [PK_Manufacturers]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Series'
ALTER TABLE [Series]
ADD CONSTRAINT [PK_Series]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Seasons'
ALTER TABLE [Seasons]
ADD CONSTRAINT [PK_Seasons]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Races'
ALTER TABLE [Races]
ADD CONSTRAINT [PK_Races]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'RaceResults'
ALTER TABLE [RaceResults]
ADD CONSTRAINT [PK_RaceResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'QualifyingResults'
ALTER TABLE [QualifyingResults]
ADD CONSTRAINT [PK_QualifyingResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'WeekendResults'
ALTER TABLE [WeekendResults]
ADD CONSTRAINT [PK_WeekendResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'StageResults'
ALTER TABLE [StageResults]
ADD CONSTRAINT [PK_StageResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'PracticeResults'
ALTER TABLE [PracticeResults]
ADD CONSTRAINT [PK_PracticeResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'PointsSystems'
ALTER TABLE [PointsSystems]
ADD CONSTRAINT [PK_PointsSystems]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Positions'
ALTER TABLE [Positions]
ADD CONSTRAINT [PK_Positions]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'PlayoffRounds'
ALTER TABLE [PlayoffRounds]
ADD CONSTRAINT [PK_PlayoffRounds]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'Penalties'
ALTER TABLE [Penalties]
ADD CONSTRAINT [PK_Penalties]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Id] in table 'PointsResults'
ALTER TABLE [PointsResults]
ADD CONSTRAINT [PK_PointsResults]
    PRIMARY KEY ([Id] );
GO

-- Creating primary key on [Drivers_Id], [Seasons_Id] in table 'DriverSeason'
ALTER TABLE [DriverSeason]
ADD CONSTRAINT [PK_DriverSeason]
    PRIMARY KEY ([Drivers_Id], [Seasons_Id] );
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Manufacturer_Id] in table 'Teams'
ALTER TABLE [Teams]
ADD CONSTRAINT [FK_ManufacturerTeam]
    FOREIGN KEY ([Manufacturer_Id])
    REFERENCES [Manufacturers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ManufacturerTeam'
CREATE INDEX [IX_FK_ManufacturerTeam]
ON [Teams]
    ([Manufacturer_Id]);
GO

-- Creating foreign key on [Team_Id] in table 'Drivers'
ALTER TABLE [Drivers]
ADD CONSTRAINT [FK_TeamDriver]
    FOREIGN KEY ([Team_Id])
    REFERENCES [Teams]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TeamDriver'
CREATE INDEX [IX_FK_TeamDriver]
ON [Drivers]
    ([Team_Id]);
GO

-- Creating foreign key on [Series_Id] in table 'Seasons'
ALTER TABLE [Seasons]
ADD CONSTRAINT [FK_SeasonSeries]
    FOREIGN KEY ([Series_Id])
    REFERENCES [Series]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SeasonSeries'
CREATE INDEX [IX_FK_SeasonSeries]
ON [Seasons]
    ([Series_Id]);
GO

-- Creating foreign key on [Season_Id] in table 'Races'
ALTER TABLE [Races]
ADD CONSTRAINT [FK_RaceSeason]
    FOREIGN KEY ([Season_Id])
    REFERENCES [Seasons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RaceSeason'
CREATE INDEX [IX_FK_RaceSeason]
ON [Races]
    ([Season_Id]);
GO

-- Creating foreign key on [Race_Id] in table 'WeekendResults'
ALTER TABLE [WeekendResults]
ADD CONSTRAINT [FK_WeekendResultRace]
    FOREIGN KEY ([Race_Id])
    REFERENCES [Races]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WeekendResultRace'
CREATE INDEX [IX_FK_WeekendResultRace]
ON [WeekendResults]
    ([Race_Id]);
GO

-- Creating foreign key on [QualifyingResult_Id] in table 'WeekendResults'
ALTER TABLE [WeekendResults]
ADD CONSTRAINT [FK_WeekendResultQualifyingResult]
    FOREIGN KEY ([QualifyingResult_Id])
    REFERENCES [QualifyingResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WeekendResultQualifyingResult'
CREATE INDEX [IX_FK_WeekendResultQualifyingResult]
ON [WeekendResults]
    ([QualifyingResult_Id]);
GO

-- Creating foreign key on [RaceResult_Id] in table 'WeekendResults'
ALTER TABLE [WeekendResults]
ADD CONSTRAINT [FK_WeekendResultRaceResult]
    FOREIGN KEY ([RaceResult_Id])
    REFERENCES [RaceResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WeekendResultRaceResult'
CREATE INDEX [IX_FK_WeekendResultRaceResult]
ON [WeekendResults]
    ([RaceResult_Id]);
GO

-- Creating foreign key on [Driver_Id] in table 'WeekendResults'
ALTER TABLE [WeekendResults]
ADD CONSTRAINT [FK_WeekendResultDriver]
    FOREIGN KEY ([Driver_Id])
    REFERENCES [Drivers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WeekendResultDriver'
CREATE INDEX [IX_FK_WeekendResultDriver]
ON [WeekendResults]
    ([Driver_Id]);
GO

-- Creating foreign key on [Drivers_Id] in table 'DriverSeason'
ALTER TABLE [DriverSeason]
ADD CONSTRAINT [FK_DriverSeason_Driver]
    FOREIGN KEY ([Drivers_Id])
    REFERENCES [Drivers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Seasons_Id] in table 'DriverSeason'
ALTER TABLE [DriverSeason]
ADD CONSTRAINT [FK_DriverSeason_Season]
    FOREIGN KEY ([Seasons_Id])
    REFERENCES [Seasons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DriverSeason_Season'
CREATE INDEX [IX_FK_DriverSeason_Season]
ON [DriverSeason]
    ([Seasons_Id]);
GO

-- Creating foreign key on [WeekendResult_Id] in table 'StageResults'
ALTER TABLE [StageResults]
ADD CONSTRAINT [FK_StageResultWeekendResult]
    FOREIGN KEY ([WeekendResult_Id])
    REFERENCES [WeekendResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StageResultWeekendResult'
CREATE INDEX [IX_FK_StageResultWeekendResult]
ON [StageResults]
    ([WeekendResult_Id]);
GO

-- Creating foreign key on [WeekendResult_Id] in table 'PracticeResults'
ALTER TABLE [PracticeResults]
ADD CONSTRAINT [FK_PracticeResultWeekendResult]
    FOREIGN KEY ([WeekendResult_Id])
    REFERENCES [WeekendResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PracticeResultWeekendResult'
CREATE INDEX [IX_FK_PracticeResultWeekendResult]
ON [PracticeResults]
    ([WeekendResult_Id]);
GO

-- Creating foreign key on [WeekendResult_Id] in table 'PointsResults'
ALTER TABLE [PointsResults]
ADD CONSTRAINT [FK_PointsResultWeekendResult]
    FOREIGN KEY ([WeekendResult_Id])
    REFERENCES [WeekendResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PointsResultWeekendResult'
CREATE INDEX [IX_FK_PointsResultWeekendResult]
ON [PointsResults]
    ([WeekendResult_Id]);
GO

-- Creating foreign key on [PointsResult_Id] in table 'Penalties'
ALTER TABLE [Penalties]
ADD CONSTRAINT [FK_PenaltyPointsResult]
    FOREIGN KEY ([PointsResult_Id])
    REFERENCES [PointsResults]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PenaltyPointsResult'
CREATE INDEX [IX_FK_PenaltyPointsResult]
ON [Penalties]
    ([PointsResult_Id]);
GO

-- Creating foreign key on [PlayoffRoundId] in table 'Races'
ALTER TABLE [Races]
ADD CONSTRAINT [FK_PlayoffRoundRace]
    FOREIGN KEY ([PlayoffRoundId])
    REFERENCES [PlayoffRounds]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayoffRoundRace'
CREATE INDEX [IX_FK_PlayoffRoundRace]
ON [Races]
    ([PlayoffRoundId]);
GO

-- Creating foreign key on [PointsSystemId] in table 'Positions'
ALTER TABLE [Positions]
ADD CONSTRAINT [FK_PointsSystemPosition]
    FOREIGN KEY ([PointsSystemId])
    REFERENCES [PointsSystems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PointsSystemPosition'
CREATE INDEX [IX_FK_PointsSystemPosition]
ON [Positions]
    ([PointsSystemId]);
GO

-- Creating foreign key on [PointsSystemId] in table 'PlayoffRounds'
ALTER TABLE [PlayoffRounds]
ADD CONSTRAINT [FK_PointsSystemPlayoffRound]
    FOREIGN KEY ([PointsSystemId])
    REFERENCES [PointsSystems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PointsSystemPlayoffRound'
CREATE INDEX [IX_FK_PointsSystemPlayoffRound]
ON [PlayoffRounds]
    ([PointsSystemId]);
GO

-- Creating foreign key on [PointsSystemId] in table 'Seasons'
ALTER TABLE [Seasons]
ADD CONSTRAINT [FK_PointsSystemSeason]
    FOREIGN KEY ([PointsSystemId])
    REFERENCES [PointsSystems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PointsSystemSeason'
CREATE INDEX [IX_FK_PointsSystemSeason]
ON [Seasons]
    ([PointsSystemId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------