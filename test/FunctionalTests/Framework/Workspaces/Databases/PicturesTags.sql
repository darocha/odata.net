/*---------------------------------------------------------------------
// <copyright file="PicturesTags.sql" company="Microsoft">
//      Copyright (C) Microsoft Corporation. All rights reserved. See License.txt in the project root for license information.
// </copyright>
//---------------------------------------------------------------------*/
ALTER DATABASE {0} SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC {0}.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE {0} SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE {0} SET ANSI_NULLS OFF 
GO
ALTER DATABASE {0} SET ANSI_PADDING OFF 
GO
ALTER DATABASE {0} SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE {0} SET ARITHABORT OFF 
GO
ALTER DATABASE {0} SET AUTO_CLOSE ON 
GO
ALTER DATABASE {0} SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE {0} SET AUTO_SHRINK OFF 
GO
ALTER DATABASE {0} SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE {0} SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE {0} SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE {0} SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE {0} SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE {0} SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE {0} SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE {0} SET  DISABLE_BROKER 
GO
ALTER DATABASE {0} SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE {0} SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE {0} SET TRUSTWORTHY OFF 
GO
ALTER DATABASE {0} SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE {0} SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE {0} SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE {0} SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE {0} SET RECOVERY FULL 
GO
ALTER DATABASE {0} SET  MULTI_USER 
GO
ALTER DATABASE {0} SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE {0} SET DB_CHAINING OFF 
GO
ALTER DATABASE {0} SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE {0} SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE {0}
GO
/****** Object:  Table [dbo].[DummyPictureNonMLEs]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DummyPictureNonMLEs](
	[Id] [int] NOT NULL,
	[DummyMessage] [nvarchar](50) NULL,
 CONSTRAINT [PK_DummyPictureNonMLEs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalPictures]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalPictures](
	[Id] [int] NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[ContentType] [nvarchar](50) NULL,
	[BlobETag] [nvarchar](50) NULL,
 CONSTRAINT [PK_ExternalPictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileStorage]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStorage](
	[Id] [int] NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[ContentType] [nvarchar](50) NULL,
	[ContentDisposition] [nvarchar](50) NULL,
 CONSTRAINT [PK_FileStorage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InternalPictures]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalPictures](
	[Id] [int] NOT NULL,
	[Exif] [nvarchar](50) NULL,
 CONSTRAINT [PK_InternalPictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogEntries]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Verb] [nvarchar](10) NOT NULL,
	[URI] [nvarchar](max) NOT NULL,
	[Operation] [int] NULL,
 CONSTRAINT [PK_LogEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogEntryHeaders]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntryHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Header] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[LogEntry] [int] NOT NULL,
 CONSTRAINT [PK_LogEntryHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PictureTag]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PictureTag](
	[PictureId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PictureTag] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestOperations]    Script Date: 6/29/2017 3:28:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestOperations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_TestOperations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[DummyPictureNonMLEs] ([Id], [DummyMessage]) VALUES (40, N'This entity does not have stream')
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (15, N'http://www.microsoft.com/cze', N'text/html', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (16, N'Pictures(16)/Tags', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (18, N'', N'', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (19, N'file:///c:/temp/a.xml', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (20, N'c:\temp\a.xml', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (21, N'\\sqlcl\teams\astoria\a.xml', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (22, N'nonsense://where.to.go?', N'texp/plain', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (23, N'/Pictures(16)/Tags', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (26, N'${AbsServiceFolder}/a.xml', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (31, N'${AbsServiceFolder}/PicturesTagsHelperService.svc/a.xml', N'text/html', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (34, N'${AbsServiceFolder}/PicturesTagsHelperService.svc/StatusCodeResponder/200', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (35, N'${AbsServiceFolder}/PicturesTagsHelperService.svc/StatusCodeResponder/403', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (37, N'${AbsServiceFolder}/PicturesTagsHelperService.svc/StatusCodeResponder/404', N'application.xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (38, N'${AbsServiceFolder}/PicturesTagsHelperService.svc/StatusCodeResponder/500', N'application/xml', NULL)
GO
INSERT [dbo].[ExternalPictures] ([Id], [URL], [ContentType], [BlobETag]) VALUES (41, N'http://www.microsoft.com', N'text/html', N'"BlobETagValue"')
GO
INSERT [dbo].[FileStorage] ([Id], [Location], [ContentType], [ContentDisposition]) VALUES (28, N'a.xml', N'application/xml', NULL)
GO
INSERT [dbo].[FileStorage] ([Id], [Location], [ContentType], [ContentDisposition]) VALUES (29, N'b.xml', N'application/xml', N'b.xml')
GO
INSERT [dbo].[FileStorage] ([Id], [Location], [ContentType], [ContentDisposition]) VALUES (39, N'empty.xml', N'application/xml', N'empty.xml')
GO
INSERT [dbo].[InternalPictures] ([Id], [Exif]) VALUES (28, NULL)
GO
INSERT [dbo].[InternalPictures] ([Id], [Exif]) VALUES (29, NULL)
GO
INSERT [dbo].[InternalPictures] ([Id], [Exif]) VALUES (39, NULL)
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (15, N'Valid, AbsoluteURI 1', N'May 30 2009  5:30PM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (16, N'Valid, RelativeURI 1', N'May 30 2009  5:30PM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (18, N'Valid, Defaults', N'May 30 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (19, N'Valid, Not Supported 1', N'Jun  1 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (20, N'Valid, Not Supported 2', N'Jun  1 2009  7:00PM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (21, N'Valid, Not Supported 3', N'Jun  1 2009  2:53PM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (22, N'InValid URI format', N'Jun  1 2009  6:20PM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (23, N'Valid, RelativeURI 2', N'Jun  1 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (26, N'Valid, AbsoluteURI 2', N'Jun  1 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (28, N'a.xml', N'Jun  2 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (29, N'b.xml', N'Jun  2 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (31, N'ContentType differs', N'Jun  1 2006 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (34, N'SC:200', N'Jun  5 2006 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (35, N'SC:403', N'Jun  6 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (37, N'SC:404', N'Jun  6 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (38, N'SC:500', N'Jun  6 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (39, N'empty.xml', N'Jun  5 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (40, N'Not MR', N'Jul  6 2009 12:00AM')
GO
INSERT [dbo].[Pictures] ([Id], [Name], [Date]) VALUES (41, N'BlobETag', N'Aug 13 2009 12:00AM')
GO
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
INSERT [dbo].[PictureTag] ([PictureId], [TagId]) VALUES (15, 67)
GO
INSERT [dbo].[PictureTag] ([PictureId], [TagId]) VALUES (16, 67)
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

GO
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (67, N'VALID')
GO
INSERT [dbo].[Tags] ([Id], [TagName]) VALUES (68, N'INVALID')
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
ALTER TABLE [dbo].[DummyPictureNonMLEs]  WITH CHECK ADD  CONSTRAINT [FK_DummyPictureNonMLEs_Pictures] FOREIGN KEY([Id])
REFERENCES [dbo].[Pictures] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DummyPictureNonMLEs] CHECK CONSTRAINT [FK_DummyPictureNonMLEs_Pictures]
GO
ALTER TABLE [dbo].[ExternalPictures]  WITH CHECK ADD  CONSTRAINT [FK_ExternalPictures_Pictures] FOREIGN KEY([Id])
REFERENCES [dbo].[Pictures] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExternalPictures] CHECK CONSTRAINT [FK_ExternalPictures_Pictures]
GO
ALTER TABLE [dbo].[FileStorage]  WITH CHECK ADD  CONSTRAINT [FK_FileStorage_InternalPictures] FOREIGN KEY([Id])
REFERENCES [dbo].[InternalPictures] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FileStorage] CHECK CONSTRAINT [FK_FileStorage_InternalPictures]
GO
ALTER TABLE [dbo].[InternalPictures]  WITH CHECK ADD  CONSTRAINT [FK_InternalPictures_Pictures] FOREIGN KEY([Id])
REFERENCES [dbo].[Pictures] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InternalPictures] CHECK CONSTRAINT [FK_InternalPictures_Pictures]
GO
ALTER TABLE [dbo].[LogEntries]  WITH CHECK ADD  CONSTRAINT [FK_LogEntry_TestOperation] FOREIGN KEY([Operation])
REFERENCES [dbo].[TestOperations] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntries] CHECK CONSTRAINT [FK_LogEntry_TestOperation]
GO
ALTER TABLE [dbo].[LogEntryHeaders]  WITH CHECK ADD  CONSTRAINT [FK_LogEntryHeaders_LogEntry1] FOREIGN KEY([LogEntry])
REFERENCES [dbo].[LogEntries] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogEntryHeaders] CHECK CONSTRAINT [FK_LogEntryHeaders_LogEntry1]
GO
ALTER TABLE [dbo].[PictureTag]  WITH CHECK ADD  CONSTRAINT [FK_PictureTag_Pictures] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PictureTag] CHECK CONSTRAINT [FK_PictureTag_Pictures]
GO
ALTER TABLE [dbo].[PictureTag]  WITH CHECK ADD  CONSTRAINT [FK_PictureTag_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PictureTag] CHECK CONSTRAINT [FK_PictureTag_Tags]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [CK_Pictures_Failure_TEST_TRAP] CHECK  ((NOT [Name] like '%FAIL%'))
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [CK_Pictures_Failure_TEST_TRAP]
GO
USE [master]
GO
ALTER DATABASE {0} SET  READ_WRITE 
GO
