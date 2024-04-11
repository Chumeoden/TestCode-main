USE [Training]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 4/12/2024 5:41:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](150) NULL,
	[ExtraCode] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[FullName] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Education] [varchar](150) NULL,
	[ProgramingLanguage] [varchar](50) NULL,
	[ToeicScore] [int] NULL,
	[Skills] [varchar](max) NULL,
	[IPCleant] [nvarchar](max) NULL,
	[LastLogin] [datetime] NULL,
	[LastLogout] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ('Active') FOR [Status]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[TrainerTopic]    Script Date: 4/12/2024 5:40:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TrainerTopic](
	[UserId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_Topics]
GO

ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_Topics1] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO

ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_Topics1]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[TraineeCourse]    Script Date: 4/12/2024 5:40:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TraineeCourse](
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TraineeCourse]  WITH CHECK ADD  CONSTRAINT [FK_TraineeCourse_Users] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TraineeCourse] CHECK CONSTRAINT [FK_TraineeCourse_Users]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[Topics]    Script Date: 4/12/2024 5:40:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Status] [varchar](50) NOT NULL,
	[Documents] [varchar](max) NOT NULL,
	[AttachFile] [varchar](max) NOT NULL,
	[TypeDocument] [varchar](max) NOT NULL,
	[PosterTopic] [varchar](max) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_TypeDocument]  DEFAULT ('Video') FOR [TypeDocument]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 4/12/2024 5:40:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Status] [varchar](20) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ('Active') FOR [Status]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[Courses]    Script Date: 4/12/2024 5:40:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NOT NULL,
	[LikeCourse] [int] NULL,
	[StarCourse] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_LikeCourse]  DEFAULT ((0)) FOR [LikeCourse]
GO

ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_StarCourse]  DEFAULT ((0)) FOR [StarCourse]
GO

ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_Status]  DEFAULT ('Active') FOR [Status]
GO


USE [Training]
GO

/****** Object:  Table [dbo].[Categories]    Script Date: 4/12/2024 5:40:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[PosterImage] [varchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


