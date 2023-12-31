USE [master]
GO
/****** Object:  Database [icecrm]    Script Date: 4/26/2022 2:07:55 PM ******/
CREATE DATABASE [icecrm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'icecrm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\icecrm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'icecrm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\icecrm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [icecrm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [icecrm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [icecrm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [icecrm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [icecrm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [icecrm] SET ARITHABORT OFF 
GO
ALTER DATABASE [icecrm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [icecrm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [icecrm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [icecrm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [icecrm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [icecrm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [icecrm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [icecrm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [icecrm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [icecrm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [icecrm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [icecrm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [icecrm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [icecrm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [icecrm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [icecrm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [icecrm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [icecrm] SET RECOVERY FULL 
GO
ALTER DATABASE [icecrm] SET  MULTI_USER 
GO
ALTER DATABASE [icecrm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [icecrm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [icecrm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [icecrm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [icecrm] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'icecrm', N'ON'
GO
ALTER DATABASE [icecrm] SET QUERY_STORE = OFF
GO
USE [icecrm]
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 4/26/2022 2:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[adm_name] [varchar](10) NOT NULL,
	[adm_pwd] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_buy]    Script Date: 4/26/2022 2:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_buy](
	[buy_id] [int] IDENTITY(1,1) NOT NULL,
	[b_name] [varchar](36) NOT NULL,
	[b_contact] [varchar](11) NOT NULL,
	[b_add] [varchar](500) NOT NULL,
	[b_cost] [varchar](50) NOT NULL,
	[b_paying] [varchar](20) NOT NULL,
 CONSTRAINT [PK_buy] PRIMARY KEY CLUSTERED 
(
	[buy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_feedback]    Script Date: 4/26/2022 2:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_feedback](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](36) NOT NULL,
	[f_email] [varchar](128) NOT NULL,
	[f_icecream] [varchar](15) NOT NULL,
	[f_feedBack] [varchar](500) NOT NULL,
 CONSTRAINT [PK_feedback] PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 4/26/2022 2:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_name] [varchar](36) NOT NULL,
	[p_image] [varchar](500) NOT NULL,
	[p_desc] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 4/26/2022 2:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [varchar](50) NOT NULL,
	[u_email] [varchar](100) NOT NULL,
	[u_pwd] [varchar](16) NOT NULL,
	[u_subs] [varchar](16) NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_admin] ([adm_name], [adm_pwd]) VALUES (N'admin', N'admin')
INSERT [dbo].[tbl_admin] ([adm_name], [adm_pwd]) VALUES (N'umair', N'123')
GO
SET IDENTITY_INSERT [dbo].[tbl_buy] ON 

INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (6, N'Raheem', N'03312739193', N'andjnajdnqin', N'$100', N'bought')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (21, N'umair', N'0331565744', N'adddreeeesssssssssss', N'$100', N'downloaded')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (22, N'zubair', N'0331565744', N'my address', N'$100', N'downloaded')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (23, N'aaaaaaa', N'54545454', N'asdaaaaaaaaaaaaaaaaaa', N'$100', N'Credit-card')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (24, N'MUhammad Bilal', N'0310230', N'ljkdfdsl', N'$100', N'Credit-card')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (25, N'umair', N'132435', N'hsfhkshkhfdshf', N'$100', N'Credit-card')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (26, N'umair', N'12345678910', N'asasasasas', N'$100', N'Credit-card')
INSERT [dbo].[tbl_buy] ([buy_id], [b_name], [b_contact], [b_add], [b_cost], [b_paying]) VALUES (27, N'dgdgdg', N'03312634331', N'dgdgdgdg', N'$100', N'Credit-card')
SET IDENTITY_INSERT [dbo].[tbl_buy] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_feedback] ON 

INSERT [dbo].[tbl_feedback] ([f_id], [f_name], [f_email], [f_icecream], [f_feedBack]) VALUES (1, N'Raheem', N'ramzan@gmail.com', N'vanilla', N'good')
INSERT [dbo].[tbl_feedback] ([f_id], [f_name], [f_email], [f_icecream], [f_feedBack]) VALUES (2, N'umair', N'umair@gmail.com', N'chocolate', N'best ice cream recipe')
INSERT [dbo].[tbl_feedback] ([f_id], [f_name], [f_email], [f_icecream], [f_feedBack]) VALUES (3, N'umair', N'aaa@aa.aaa', N'aaaa', N'adadasdadasdas')
INSERT [dbo].[tbl_feedback] ([f_id], [f_name], [f_email], [f_icecream], [f_feedBack]) VALUES (4, N'sheheryar', N'sheheryar.hilal.2772@gmail.com', N'choclate', N'taste is over all good and maxi')
INSERT [dbo].[tbl_feedback] ([f_id], [f_name], [f_email], [f_icecream], [f_feedBack]) VALUES (5, N'Muhammad Bilal', N'bilal-bhatti12@hotmail.com', N'Stewberry ', N'Its Was Amazing Web Site Colour and Recepies Are Good')
SET IDENTITY_INSERT [dbo].[tbl_feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (17, N'CHOCALATE CHIP ICE CREAM', N'~/images/22 icecream.jpg', N'RECIPE 
? First take all the ingredients and keep them ready- 2 cups cream (25% to 50% 
fat), 3 tablespoons milk, 3 tablespoons cocoa powder, ½ cup condensed milk 
and ? cup tightly packed brown sugar. You can also use regular sugar or halfhalf of both regular sugar or brown sugar.
? Take milk in a pan or in mixing bowl and keep it on the stovetop. Heat the milk. 
No need to boil.
? Place the pan or bowl down. Add cocoa powder.
? Whisk till all the cocoa powder dissolves in the milk.
? Now add condensed milk.
? Now add condensed milk.
? Now add condensed milk.
? Mix again till the sugar has dissolved. If the sugar has not dissolved, then heat 
this mixture lightly on a low flame and stir continuously till all the sugar dissolves. 
Or you can add sugar first and then add condensed milk. Keep this mixture aside. 
Let this chocolate mixture cool at room temperature.
? Take chilled cream in a stand mixer and begin to whip it on high speed, till stiff 
peaks. You can also use an electric beater to whip.
? Whip till you get stiff peaks. The cream will increase in volume and when you turn 
the bowl down, the cream should not fall. Or when you take the whipped cream 
in a spatula or spoon and turn it down, the cream won’t fall.
? Then add the chocolate mixture.
? Now gently and with light hands, fold the chocolate mixture in the whipped 
cream. Do not mix, but fold it.
? The cream should not lose its peaks or volume and fall flat. So, fold gently and 
slowly.
? Add chocolate chips. fold in the chocolate chips.
? Now add the ice cream mixture in a container or box.
? You can decorate with some Choco chips if you want. Close the lid tightly and 
keep the container or box in the freezer. Freeze for 8 to 9 hours or overnight or 
till the ice cream is set.
? Before serving, remove the box from the freezer and let it sit at room 
temperature for a few minutes.
? Then scoop out ice cream with an ice cream scooper. If you are not able to scoop 
the ice cream easily, then let the ice cream be at room temperature for 5 to 6 
minutes. If it is too hot where you live, then a couple of minutes is fine.
? Serve Choco chip ice cream in bowls or cups. you can also drizzle some chocolate 
sauce on the Choco chips ice cream if you want.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (18, N'VANILA ICE CREAM', N'~/images/22 Vanilla.jpg', N'Before you begin, set the temperature in your fridge to its highest cold 
setting. Then in a small bowl, take 2 tablespoons milk and 1 to 1.5 
tablespoons corn starch. Substitutions for corn starch are arrowroot flour and 
rice flour. Mix to a smooth paste.
? Mix to a smooth paste.
? In a saucepan or pan, take 1.5 cups full cream milk or full-fat milk.
? Add ½ cup sugar.
? Keep this pan on the gas stove and begin to heat it. Stir so that the sugar 
dissolves.
? When the milk becomes slightly hot, add the corn starch paste gradually.
? Stir quickly so that lumps are not formed.
? Simmer on a low to medium flame, till the milk thickens. Keep stirring often 
when the milk is thickening so that the milk does not get browned or burnt 
from the base
? The custard sauce should coat the back of a spoon
? Take this custard sauce mixture in a bowl and allow it to become warm or 
cool down. Then keep covered in the freezer for 45 minutes to an hour.
? Remove from the fridge. Change the temperature setting of your fridge back 
to the earlier one
? With an electric beater, beat on a medium to high speed for 1 to 2 minutes. 
You can also beat in a blender or mixer jar.
? Beat the custard sauce very well.
? In another bowl, take 200 ml chilled fresh cream (about ¾ cup). You could use 
heavy whipping cream or 25% to 35% low fat cream. Even malai (cream that 
floats on top of milk can be used). Like always I used amul cream. Do 
remember that the cream or malai has to chilled.
? Now begin to whip the cream on medium to high speed
? Whip till you get soft peaks.
? Add 3 tsp pure vanilla extract. Here I used homemade vanilla extract. You can 
also add scraped seeds from 1 or 2 vanilla beans.
? Then add the beaten custard sauce to the whipped cream + vanilla mixture.
? Fold lightly & gently taking care that the ice cream mixture holds the volume 
and does not fall flat.
? Here’s the vanilla ice cream mixture ready to go in the freezer. Cover the bowl 
tightly with a lid or aluminum foil or cling film. Keep in the fridge.
? When the vanilla ice cream is semi-set after 4 to 5 hours, remove and whip 
again very well in the same bowl. I did not take pic of this step as I whipped 
the ice cream in the night. Again, cover tightly and keep the vanilla ice cream 
in the freezer till it’s completely set. Below is pic of vanilla ice cream after 
getting set. If you want, then for a more smoother texture, you can whip twice 
or thrice too.
? When the ice cream is well set, scoop and serve vanilla ice cream in bowls or 
plates. you can top the ice cream with any sauce (chocolate or caramel) or 
fruits or serve it plain. You can even garnish with chocolate sprinkles or 
chocolate chips.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (19, N'MANGO ICE CREAM', N'~/images/22 Mango-icecream.jpg', N'Rinse 3 medium-sized alphonso mangoes (560 grams) a couple of times in 
water and then wipe dry. You can use other varieties of sweet tasting 
mangoes.
? Then add the chopped mangoes in a blender or a bullet mixer. If mangoes are 
out season, add 1.5 to 2 cups of canned mango pulp.
? Also add 1 can of sweetened condensed milk (400 grams). You can use any 
brand of condensed milk.
? Blend till smooth and set aside.
? Do make sure that there are no small or finer chunks or pieces of mangoes in 
this mixture.
? In another large bowl, take 3.5 cups chilled whipping cream. You can even use 
heavy cream as well. I have used the Indian brand of Amul whipping cream. 
With an electric beater, begin to whip the cream.
? Whip till you get stiff peaks on medium-high to high speed. Do not overdo as 
the cream can curdle.
? Amul cream takes more time to whip, so take an average of 7 to 9 minutes for 
whipping it, till you get stiff peaks.
? Do make sure that the cream is chilled. In fact you can even keep the bowl in 
the refrigerator for a few hours.
? Then add the mango+condensed milk mixture. Love vanilla with mangoes? 
Add ½ teaspoon vanilla extract at this step
? On the lowest speed, using the electric blender, whip and mix gently until 
everything is combined well and the mixture is even. Do not over do this step 
of mixing.
? Level with a spatula.
? Cover the bowl with a tight lid or seal tightly with aluminium foil or cling 
wrap. Freeze for 6 to 7 hours or overnight.
? A photo below of the mango ice cream after being set.
? Before serving, keep the ice cream bowl at room temperature for some 
minutes or until you can easily scoop it out. With an ice cream scoop, remove 
the mango ice cream.
? Serve mango ice cream in ice cream cups or bowls.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (20, N'BANANA ICE CREAM', N'~/images/22 banana icecrm.jpg', N'Firstly, peel the skin and slice 3 banana.
? Transfer the sliced banana into a zip lock bag.
? Freeze for 3 hours or until it turns hard.
? Now transfer the frozen banana into mix or food processor.
? Pulse and blend into a thick paste without adding any water or milk.
? Now add 1 tsp vanilla extract and 3 tbsp honey.
? Blend again until it turns silky smooth texture.
? Transfer the mixture into an airtight container and freeze for 3 hours. you can 
also serve immediately, however, the ice cream will be soft.
? Finally, enjoy banana ice cream garnished with chocolate sauce and nuts.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (21, N'WALNUT ICE CREAM', N'~/images/22 wallnut.jpg', N'Drain walnuts and place in a blender with walnut milk, brown sugar, maple syrup, 
instant coffee, oil, vanilla and salt. Blend until very smooth. Cover and refrigerate 
until well-chilled.
? Place into the bowl of an ice cream maker and freeze until firm.
? Transfer to a 1-quart container and store in the freezer.
? Scoop into bowls and garnish with chopped walnuts.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (22, N'Butterscotch', N'~/images/22 Butterscotch.jpg', N'Take 10 to 12 cashews in a mortar-pestle. You can add any nuts of your choice 
like almonds, walnuts, pecans or roasted peanuts.
? With the pestle, crush the cashews to a coarse mixture. Keep aside. You can even 
chop the nuts. you can even chop the nuts or crush them in a food chopper or 
mixer-grinder.
? In a pan add 2 tablespoons butter. Keep the flame to a low.
? Add 4 tablespoons sugar when the butter begins to melt.
? Mix the sugar with the butter.
? On a low flame cook this butter and sugar mixture. Stir at intervals, But do not 
stir non-stop.
? The mixture will begin to change color. Continue to stir at intervals when the 
sugar starts changing color.
? A point will come when the color will become brown and all the sugar will melt.
? Check a few drops of the mixture in a bowl of water. It will harden and solidify. 
When you snap it, it will break easily. This is the hard ball consistency of the 
sugar.
? At this point, switch off the flame when you see all the sugar has melted and 
caramelized with a brown colored molten liquid.
? Then immediately add the crushed cashews.
? Mix quickly.
? Pour this praline mixture on a plate lined with parchment paper or butter paper. 
You can also use a plate on which some butter or oil (neutral tasting) has been 
spread.
? Let the praline harden and cool at room temperature.
? then break praline in small pieces.
? Place the praline pieces in a mortar-pestle. you can also use a mixer-grinder to 
crush praline.
? With the pestle, crush to a coarse mixture. Keep aside. Do not make a fine 
powder.
? In a large bowl or a stand mixer bowl, take 2.75 to 3 cups of chilled whipping 
cream (30% to 50% fat). Add 1 teaspoon vanilla extract or butterscotch essence.
? Whip till stiff peaks are formed. You can also whip till soft peaks. If using 25% fat 
cream, then you can whip till soft peaks.
? Now add 400 grams of chilled sweetened condensed milk (about 1.6 cups).
? Also add the crushed praline. Reserve 1 tablespoon of the praline mixture as a 
garnish.
? Fold gently but very well. Also, remember not to overfold as then the 
butterscotch ice cream mixture can fall flat.
? Remove the butterscotch ice cream mixture in a container or box and then cover 
it tightly. Freeze till the ice cream is set.
? Before serving, keep the butterscotch ice cream box or bowl for some minutes at 
room temperature. Then using a scoop, remove the ice cream. Serve 
butterscotch ice cream. you can sprinkle the reserved praline mixture on top 
while serving. You can also pour butterscotch sauce. Alternatively, chocolate 
chips or grated chocolate or candied fruits or even tutti frutti can be sprinkled 
from top if you want.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (23, N'Pistachio Ice Cream', N'~/images/22 Pistachio Ice Cream.jpg', N'Take ¼ cup of pistachios in a food chopper or grinder.
? grind the pista to a coarse powder.
? remove and keep aside.
? Now take another ¼ cup of pistachios in the food chopper or grinder.
? Just chop or grind them to small bits. Remove and keep aside.
? In a pan take, ½ cup chilled milk and ½ cup sugar.
? Mix very well till the sugar dissolves.
? Then add 2 to 2.25 cups chilled cream.
? With a wired whisk mix the cream with the milk.
? Add the coarsely ground pista powder.
? Add a few drops of natural green food color. This is optional and you can skip 
it. Mix.
? Now add this entire mixture in the ice cream maker. Please follow the 
manufacturer’s instructions before operating the ice cream maker. churn the 
mixture till the ice cream is frozen and set.
? Lastly add the chopped pistachio and fold in the ice cream.
? Now you can remove the pista ice cream and serve directly or remove it in a 
box or container to be served later. There will be a bit of pista ice cream stuck 
to the walls of the ice cream maker bowl and it is difficult to scrape it. So wait 
for some 20 to 30 minutes. Let the ice cream on the walls soften. Then you 
can remove it.
? I served pistachio ice cream after a few hours. Just scoop out the ice cream 
and serve immediately.
? Serve pistachio ice cream just plain or as an after meal dessert. You can 
garnish with some chopped pistachios before serving.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (24, N'STRAWBERRY ICE CREAM', N'~/images/22 Strawberry-ice-cream.jpg', N'In a blender add milk, cream, sugar and chopped strawberries.
? Blend everything to a smooth mixture.
? Pour in a container. Cover and keep in the freezer for the ice cream to set.
? When the ice cream is almost set, break into parts with a knife and add in the 
blender jar. You can see the ice crystals in the pic and we need to get rid of 
these.
? Blend till the whole mixture is smooth and slightly doubled up. You can see 
the texture of the ice cream below. Pour back in the same container and keep 
in the freezer for the ice cream to set.
? When fully set. Scoop out and Serve strawberry ice cream plain or topped 
with your favorite sauce.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (25, N'CHERRY ICE CREAM', N'~/images/22 CHERRY ICE CREAM.jpg', N'Roughly purée the thawed cherries with a blender. Don’t make them too smooth 
– they should still have a little texture.
? Next, mix it into the condensed milk, followed by folding in the whipped cream.
? Add the mixture to a freezer-safe container and freeze until it’s your desired 
consistency.
? Serve and enjoy!
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (26, N'BANANA COCALATE CHIP ICE CREAM', N'~/images/22 DARK BANANA COCALATE CHIP ICE CREAM.jpg', N'3 bananas, cut into coins and frozen
? ½ cup dark chocolate chips(90 g)
? 1 teaspoon vanilla
? ¼ cup milk(60 mL), of choice
? Cut bananas into coins and place in freezer in a sealable bag. Freeze overnight or 
until solid.
? Place all ingredients into a food processor or blender and blend until smooth.
? Pour contents into a loaf or small pan.
? Freeze one hour or until solid.
? Enjoy!
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (27, N'MIXED BERRY YOGURT ICE CREAM', N'~/images/22 MIXED BERRY YOGURT BAR ICE CREAM.jpg', N'¼ cup strawberry(40 g)
? ¼ cup blueberry(25 g)
? ¼ cup raspberry(30 g)
? ¼ cup blackberry(40 g)
? 2 cups greek yogurt(570 g)
? In a blender, mix fruit until consistency is smooth. Add in yogurt and blend 
until fully mixed.
? Pour mixture into a baking pan lined with parchment paper. Add desired 
amount of toppings.
? Freeze for 6 hours, or overnight, until frozen solid.
? Break yogurt bark into desired numbers of pieces.
? Serve cold, or store in a closed container in the freezer.
? Enjoy!
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (28, N'FRUIT AND NUT ICE CREAM', N'~/images/22 FRUIT AND NUT ICE CREAM.jpg', N'o 1/2 cup macadamia nuts, toasted
1/3 cup pistachio nuts
1 cup mixed glace fruit (pineapple, apricots, cherries, orange, ginger), 
roughly chopped
2L premium vanilla ice cream, softened slightly
Mint leaves, to decorate
? Combine nuts and fruit and sprinkle evenly into buttered 7 cup-capacity ring pan 
lined with an overhanging triple layer of plastic wrap. Top with the softened ice 
cream and smooth the surface. Cover with a double layer of plastic wrap and 
freeze for several hours or overnight until firm.
? Remove wreath from freezer about 5 minutes before serving. Loosen it in the 
pan, using the overhanging plastic to assist. Uncover wreath and turn onto a 
serving plate. Remove pan and plastic and top with mint. Serve cut into slices.
')
INSERT [dbo].[tbl_product] ([p_id], [p_name], [p_image], [p_desc]) VALUES (29, N'BLACK CURRENT ICE CREAM', N'~/images/22 BLACK CURRANT ICE CREAM.jpg', N'500g blackcurrants, fresh or frozen (400g defrosted if frozen)
? 1 lemon, zested and juiced
? 600ml double cream
? 397g can condensed milk
? STEP 1
? Place 400g of the blackcurrants in a large saucepan with the zest of 1 lemon and 
juice of ½, plus 4 tbsp water. Bring to the boil, then reduce to a simmer and cook 
for 6-8 mins until the fruit has broken down and the liquid has reduced and 
thickened slightly. Remove from the heat and allow to cool.
? STEP 2
? Pass the fruit through a sieve over a mixing bowl. Use the back of a spoon to 
press down on the fruit and squeeze out all the juice, then discard the remaining 
stalks and pulp from the sieve, and set aside the liquid.
? STEP 3
? Combine the double cream and condensed milk in a large mixing 
bowl. Whisk until thickened but not stiff, then add the fruit and stir to combine. 
Tip into a freezer-proof container, cover with a lid and freeze for at least 6 hrs. 
Remove from the freezer 30 mins before serving, then serve in bowls topped with 
the remaining blackcurrants')
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_pwd], [u_subs]) VALUES (1, N'Raheem', N'raheem@gmail.com', N'12345', N'Monthly')
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_pwd], [u_subs]) VALUES (2, N'Fawad', N'fawad@gmail.com', N'12345', N'Monthly')
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_pwd], [u_subs]) VALUES (3, N'test', N'test@gmail.com', N'test', N'Monthly')
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_pwd], [u_subs]) VALUES (4, N'test', N'umair@gmail.com', N'123', N'Annually')
INSERT [dbo].[tbl_user] ([u_id], [u_name], [u_email], [u_pwd], [u_subs]) VALUES (5, N'Muhammad Bilal', N'bilal-bhatti12@hotmail.com', N'Hil@l123', N'Monthly')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
GO
USE [master]
GO
ALTER DATABASE [icecrm] SET  READ_WRITE 
GO
