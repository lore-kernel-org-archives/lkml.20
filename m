Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73AC4F68A4;
	Fri,  2 Oct 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958532; cv=fail; b=qxYs34QWE35xNHZ17LFMc/cku+up1zEdU+/h+ytHp41yBVlyeCMxxvksBI0l7OcetlPKOhPie8IaWKrHHRlT4wEg9N0oHB5Z410fK4WC460qR70sD3iYFW/C8pCXlZMiK+jP8iWmKQ1s1MlEqGNBnGHAvBmS9YDVzZ7F1IZO2jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958532; c=relaxed/simple;
	bh=OdKxdQpxHglvit/TQS1phPQ6B8oXNyAuHF9GMaYcT1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kRBEXd4UkDcJh0NX0ar5sjEwnPgTsszngdwKDkOEyiq/4ZBp3ieE4Ei0/aDFq4D3zh86upgbeFHCipij8Tq8PRE/K6+SGbuGoyJz4lwNHEu1Og5TEKfEegbvU+JU+jBXudkIQwz6FHLNVynqQvm/tbK6go4mW8PfYEWEwWwlReM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZLZgHg19; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZLZgHg19"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6cLmAssuAw2nZL4VvZ6fG86twg/F29ew/m1wrMTrT54zTugCYk6BZvZmc22aiGQ9dkQ75rbPjFYTaeU9uBdYHYV6SM0j5FN5mXq0G2EXvbKf/TyiJAz/e+aqYusNYfdc6EMf11dEWq1qTJ55YPNh8zAOe880ZhYQaS8nRXE2ZC58T1QX8qu5vxTjwS8q15RlQ5x3fktYDO0o8X7lNWKNALUdJWU1w6IHOZAuibF/RfwSNqH0QtkL+KOBQbo9vvFZNIDLDW14cSoncDCjgapeWGoQhkHZQ4HHu5a73lHDskd0DjPadH7pYMIYBHDwHlKj2yLqZytucQvPrFgoQ/pqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/swNdk9x7O7ca/HkKG5fF48Ojf06PxFVooyPaqL/SMk=;
 b=xHihJ2YEjQDQtuv9N8HypUnTBumyyTQH3TXDc6lFgO6NITgljhVonF94UmvbdRUCfoVJVVlVOCA4ehFM2nAekISiwjoN5mKchH5hJTbF7e+ytgpBT66rAm7sAGvVENPQDFP/ZoOZzmPMkiR61ejIx1cSKs9qK45kzldNGj6SVo/OlcDurV+tcZ45zk1FiAvsHDzq5Y5A6F9HZUaRF4IR9fs5ifsTnthNz1aquz9EzywqgAvIUCSOkelbNO+ORpcdp9wIYL5sD5R0LKXSJMnBu4/13xVcgyDdo47gTA2eehyYysVoOLyzz+fQxNZwSPP1xPolrBqoubB3T5DUAbMU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/swNdk9x7O7ca/HkKG5fF48Ojf06PxFVooyPaqL/SMk=;
 b=ZLZgHg194RnZPqGNuwNJCVXUZBuDrSAJPDLpSiPpo6iBtLNSbBKoReeUg5yucLSHwJx1d9xgi/zG3luMzdJaDVUDYifIHlo1PkOSmd/bFJ2XK4mScaFhoBsTUab6WYWGVY/tt2maW4U2dxhjmh6TDctZ65UwUcwoZ2oCyrrp6+fQpmJgtAjou9hCmRV+3KCJYuHovYv0hniHSUpofvXjB8RuXiB3IP8ExGJYJ6hhQm0y07mjywn/ObFZrUj+WQxQNUFxQBXfVEC9M7gzGwICa6yHfZYS/o0O1oVaNtbzonYdd3Kxq0xfnHTiU0Orwpi3+GlcRc1UBzfqjADmeCSq4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11898.eurprd04.prod.outlook.com (2603:10a6:10:61e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 16:28:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 16:28:44 +0000
Date: Fri, 2 Oct 2026 11:28:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Leonardo Costa <leoreis.costa@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com, marex@nabladev.com,
	stefano.r@variscite.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <ar_bsQbD-IbvUf86@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
 <20261002081824.GA7222@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002081824.GA7222@francesco-nb>
X-ClientProxiedBy: PH0PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:510:5::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11898:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e078e57-f77d-430d-dd9d-08df20a23a11
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|13003099007|4143699003|3023799007|10067099003|56012099006|11063799006|8126099003;
X-Microsoft-Antispam-Message-Info:
	6Xu82ANqOKyYH+Qu8UbiesE5wWuBXU9shy3adnmSzdFlwtHEmnpzxAzXWAfziAtzCB2odDZErDKtjbzbRnawcfaXLWfx7wBrELPcl+/0ByHaL8VkoNO3QvTUo2P0kZYwhP0OoeKMMmEoJUipd4Jno9WBUXabSprhZ8SWcEkg9rk7ZCiCylyeANxq3Xod+Zt57wK3b2QbwqmpacyroJ6ItQmUTqe3IVSNH0OmFmgmjhG7sxRjA6rbXbmszum2sbKqz8lrXfyZ2iqPYBXsyTYR/WI3LIttEHKqruKuAgLbMuUD6pZJXz3+jqj9fTUOppRzq6AGN0+HMbAVWE/n9yMXB0BMLawRL06pnV0LNrOvEzcQELW90m//XwgzuYY8FPvPDhOBoumCpGTs+KIFgNtHD1JfDJ1Bxom+KLa7jnCJ9vtk0o/zWDB8uYjsCQrhCU/Tmtj2hK/SovdFS+TcrpidGxLrcwYB/pHgYbt218WQY9ewp68ewqSlkARGtFTGptZP8205tnkWfO2r2KP36IUhcGlTnpi/EFOM/mPtAt8TkOYY4TrvPwX34Oxx+s6HPz2ytym8/ImqzvfuYH03ayYXzY74TVd7tRxXn04hjkxmUE49aKoTBeWhoWSE0XloRnN6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(13003099007)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006)(8126099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DbMK0Nj4mrJfdDprPFavpVw7LwdKo5Eo8UE/nP2TAzDAeCTLeV0JW9Tz0xLc?=
 =?us-ascii?Q?cSBmxpUFVWvQqEgdlTbKiCL5L4tdl0OkY3F8xx3YzB6vzazKg6QN9YBT57cB?=
 =?us-ascii?Q?k/XLoeaZDSlAHn027Z/OQQ4EtbICtXSaf0mmYVh1Hs/eH7mJcPBKemWYFkMy?=
 =?us-ascii?Q?MBn1WuhSrIa9SusL4ojy+e0TQAnZ/bgX2ol0dPjmQxqDZiBP6eURueTazCrO?=
 =?us-ascii?Q?X6+irfg/CTtZp7QKIbA/ZrnY++/in8+nNEvjjABP1n26DptVtoKAAVbryeN7?=
 =?us-ascii?Q?9ztJ2p5iSd+ojS8xEd++ZUOsrDMATrbQSN+VIVIEQ3bF4agRyW6Onsa7bmvl?=
 =?us-ascii?Q?Is4ImKMZbwfqP6UumHN91ENHtMzNc9tGpxbnPiacpN5CxcDdY8LUOQa7jay+?=
 =?us-ascii?Q?g79tViE9BtXDg0/jMmdp5/oi/lWdT2oKC8M5H8WKGnU53NyAOgxrn90Vp7KZ?=
 =?us-ascii?Q?d/5u+Uy9Tw7OPmYQ68655uIsnQKYjXN3pG+sEUS/4T50tqTwhQljhrmdbBuw?=
 =?us-ascii?Q?Jk092L8pKG28QtIP0oQ+b8ss3A/QPMGufVaaP7ek6GexWOgRb0awbNpnDEFM?=
 =?us-ascii?Q?A/xERhe5vFN48okecKXgmVhfVv8baIIOBe+jR7+zb/+BCIkUeK1636r653oq?=
 =?us-ascii?Q?wNMxA6hhtlDQpapa+sFIY6WbHZWuxsVTE81YfYLUNe0zz0TKiWqvf7blyaf3?=
 =?us-ascii?Q?dnlGV1eq3/hPD9UP+9J8jYQAxEu9cC3jHlVyK2hbz3kcqhcYgQ4BrgWi9zI/?=
 =?us-ascii?Q?12PDe6sit0Swpp5ua2IiAOCrb9Y1yccSqJfla/TvFFJ4dCE+mUnL+drAVOfF?=
 =?us-ascii?Q?l+C6iFO5baHyL6EWAfXHNhjvtZEaO3Bk+v7j9U4ypAerUe+F4yuwaTQi36A1?=
 =?us-ascii?Q?OsAwOlPYu5C30l3fgew/QWXGc9knaxSK9YT4dFxaXGnWgX9HaLE5enigvK9u?=
 =?us-ascii?Q?Nio+sp/4GxrOfNjiO3xXzFIO6TtYN9Vhdin+jiRleSGdcjHd2z+XYarU3hbH?=
 =?us-ascii?Q?8PkXJSuCnog+bMeHrwFOoxvHFuCY7sF+4YEpQHrXJC4arh/j/2bcuN2tEpAl?=
 =?us-ascii?Q?10y+A5reBRBACGjYqv7tjXBpFvINFavGxUewVhyE1vIah6+4V2Uw4c3b8aVq?=
 =?us-ascii?Q?eeu1sSdM6u/nyukE7f+Y6BUsm+Rz84eBq2kNubEofCU2osRoqTSv0PLW9rIb?=
 =?us-ascii?Q?ZuHckr7WQP3xJL4qvKDIgrOl+afuawSO2DU3e0rgZ60GB4dX1EE/CoT176uV?=
 =?us-ascii?Q?rDxkfmzIAhjll7KI93/va8Kd2+7qqy2Ndh1AkydLEbwkNb6XiQtLAYhPWp+P?=
 =?us-ascii?Q?RNcfWGZrrxwfV4yUUm+lp8oLo2PspsrovbIxeIBOYTah+RkG2jn658rsNNlN?=
 =?us-ascii?Q?zU2ZrZGt8IMhNnLPpYNo9gwPsQ85IMp71UDtk2Jcvo6+IiTh6qiNtjDGEn6O?=
 =?us-ascii?Q?kxbyMwNzloHpniFWLYXHmo1Gfk0Hw7PkfAY9f+rp3YjGyqjdPL7azo6w33hp?=
 =?us-ascii?Q?lm/dBvQRPYMiMebZ2B0EgUhr5LD/Om8/j08Xe7A8kKQAhG5GfbNlKZbrXRPD?=
 =?us-ascii?Q?xSLhCge6imQPvgQehAR0/Av7jKZNzHYFHFZoPzdtijxf9Jg9jJ6Lv5SgZpdS?=
 =?us-ascii?Q?dRJgL0wRetqc335qW0bJ1uElzRx18hu85JjdwHNfLGmsAF51XsZU7utT8yaf?=
 =?us-ascii?Q?RCOLzFHOwiMD0cYnkZS/YNsWzbdiTU344zi8RML5MHcH+XaUwp7ggAQSMGon?=
 =?us-ascii?Q?KXv0ipCMk/z9SQsu+sQ9UoKU4tJ3EMiffmhDP3e84VBjMRSOpIBf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e078e57-f77d-430d-dd9d-08df20a23a11
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 16:28:44.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e63uVUqK7KShTaz8qSklH0lIAyE6y30vF0YVpy4k6ixleA4SxJLqkhW6x1Z8ixg+Ilswd5v2j9p+l6ID2f2iFNOu97tL69M2U32/9BhO7TLerxIxkNRxEGnyLasFioaW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11898

On Fri, Oct 02, 2026 at 10:18:24AM +0200, Francesco Dolcini wrote:
> Hello Frank,
> thanks for the review
>
> On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> > On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > >
> > > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > > LVDS connected via the Apalis iMX6 LDB.
> > >
> > > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > > touch input is provided by an Atmel MaxTouch capacitive touch
> > > controller.
> > >
> > > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > > external component that does not exist at the SoM level.
> > >
> > > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > > Board V1.2 device tree to provide a ready-to-use DTB.
> > >
> > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> > >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> > >  3 files changed, 59 insertions(+), 13 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> >
> > similar 7" case, add panel module name in file
> >
> > imx6q-apalis-lvds-panel-lt170410.dtso
>
> This does not work, sorry, the current name is the correct one, for
> various reasons:
>
>  - the product is a display made with a specific connector, touch
>    controller and display and more. The actual panel is just part of it
>  - the current name wholly describe the product, it's a public product
>    with an official name, all of that is clearly linked in the commit
>    message and comments. there is no ambiguity.
>  - the same toradex accessories are not module specific, they are used
>    across multiple families/carrier board. It is a whole ecosystem that is
>    building on top of standardized interfaces and connectors. The same
>    overlay file is available for multiple boards and in multiple SoC
>    vendor directory (as of now TI and NXP, soon we are going to have
>    also QCOM). Having a consistent naming scheme is important, we cannot
>    call the same things differently every time.
>  - there was a situation in which we did a new product revision of a
>    display, specifically the "Toradex Capacitive Touch Display 10.1"
>    LVDS" there are two versions. The official product name is the same,
>    apart an additional version number, one is version1, the other is
>    version2. They have differences, and it's not just the panel, more
>    stuff changed, so having the panel name in the filename will not
>    help. v2 support is already in [1], for reference.
>  - the toradex naming scheme is not encoding the actual part number used
>    in the product name, for example we have apalis imx6 v1.2 that uses a
>    different touch/adc than previous apalis imx v1.1. The product has a
>    different schematics, different BoM and so on

Do you have schematics number to identify it?

> , and there is no
>    reference of the difference touch/adc in the name. You can see this
>    information from the public documentation just looking at the
>    version. or you can check yourself comparing the two DTS in the linux
>    kernel tree.
>
> [1]
>  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
>  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso

V2 is okay, but "panel-cap-touch-10inch-lvds" is too common. This may
cause naming pollution if we implement shared one panel dtso for all boards.

>
>
> Frank: in general the names are clearly linked to the official product
> name, and this applies also to other patches in which you commented
> about the names, not planning to reply to every single one.
>
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > > new file mode 100644
> > > index 0000000000000..a84114e1d3fba
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > > @@ -0,0 +1,53 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Copyright (c) Toradex
> > > + *
> > > + * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
> > > + * on carrier boards with a Toradex standard LVDS display connector.
> > > + *
> > > + * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> > > + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > + * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&{/} {
> > > +	panel-lvds {
> > > +		compatible = "logictechno,lt170410-2whc";
> > > +		backlight = <&backlight>;
> > > +		power-supply = <&reg_3v3_sw>;
> >
> > use name reg_lvds_panel, it help improve reusablity.
>
> I disagree.
>
> The regulator should be the one that is physically used on
> the board. The DTS *must* describe the HW as accurately as possible, we
> are not supposed to invent non existing regulator and more in general
> non existing HW.

It reflact hardware, it connect by a connectors HEAD. In Connect HEADER,
VCC for panel is fixed naming, like vcc_lcd_xxxx. Difference mainboards
route it to difference supply.

Dtso file should use name in HEADER.  The main dts descript how connect
it to provider, currently use additional label for it.

>
> I see your need to avoid duplication, and I agree with it. But an
> accurate HW description and the user experience trumps this need.
> And I insist on the user experience, what we are doing is for someone to
> use, we should not make the life of people hard because we decide on
> non-descriptive or inaccurate names.

We take an iterative approach, learning and improving as we progress. New
issues are addressed step by step, and better solutions are adopted
whenever they are identified. Once a new approach proves to be more
effective, we gradually transition to it, especially for new drivers and
DTS changes.

Frank

>
>
> Francesco
>
