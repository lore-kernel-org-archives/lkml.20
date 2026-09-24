Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C593C343A;
	Thu, 24 Sep 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260414; cv=fail; b=hfHC4EikKmo9nG4gjG1qKWwqPOYKGK0AZju0V9fRLJj4cLZeczz82bdpqefrG8yh6bGRK2JFK9izqEnUr67lXMt5eUSN+m3QLlaXchcfw4tdfQx5PpjoBk6WeQxydHfbnsGils5ihm79ym9yDKJc0Dgf0PROST7d7PwR/IHY2XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260414; c=relaxed/simple;
	bh=y+3rHzmYh0GDZsVxBTMoravISYBYiiTA7wJyS5BXEWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c5oqNUiAsyFusPFZgb6a3gd2Jv0SW9UHBHryLVzUAdgq3VC10dPdGno7DYuCJ+MmhkR7+2dxypHUBgwk7MOccCTBJAS1kWX/C45SCCjnpdrrhkOPZnAm8tOoas/fsXKDQ1zTVnLXEU/PQIjvUJj6E3WJy+9nBoJ0Rp8HIt/qdYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ifs/ArpV; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ifs/ArpV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHfqmYaNeFQQbbs4MYOypMjFna89IuZYVBNmP/0UOJj0eZNBczqb5Q1g6jGnxnQVjBzXkfw/uLDEy8wOAsKhgUqox+2/PKFUwTWImvqbq1r16RIXw19+QDJ3c7LXdNBigVHpY/kJaQ2bn5j2vjSJG0sAPmemDdZv7FjK3tf3oj+2HjiBUn26fQXcPRKqWsp6NeNsDZ2zBQO2ZT63+NaNO6LiJWOPb0z8bxScYj9wZZ6UcG8v0J+aDKKGjzvDdMxlfyr0d9ADPg2hCh4KaNz+Exmhd/pyJyJv0sD81enL5hTsKjX5XJAMpa0xn7/PK2hCvjuRPnx+XuoDQwaz3450ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo0R4NZ1yWStVtIgtbdqNjlyNVrNAeKgYlpdE89pKBQ=;
 b=Eb4rEDspjGMGWFDVu24MfaqY3vWh25/xL72/Je57k9EPdblz5MGdGpovTwBw3SqLnFbUMDfG1S/sEhUFDg1L8ryAELCsYe7vAGGbCPumEENWSOYZy3A2eJlSCTA5X/xhW5pHx0TzLbgqsCe2ty2xEH3qX/Kwpn9fqbvWkd1cn+nyWO1mGCWitAu4ENptin7mN/PLTOYLnBgRQ/5g4137BmAubFTueIvm2HIsti1nlV4xWVoJkBILOT08sWxE03umR53nveAbUaJc74r2kzXLX2h4MAVJryCzfLcB+urXLaDgdPY7KX/UU/AZ64LGaAWrRMWt7RU1lJN/QdP+e7VaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vo0R4NZ1yWStVtIgtbdqNjlyNVrNAeKgYlpdE89pKBQ=;
 b=Ifs/ArpV3XYk9djCXWBUNtKIZMPTOlAvNNd8rIHzRzeTkp0vuYJjr/r5F/sq3sl02PKKfExL9ORXciiPYWPRrBortHwmLyLD5vIoW4GjGks0HkM/11FcmKkhaNw4QkE+xlbsUFzYnmDVZwcHuHS2Hv8Scq60p/GkibV1PLWJa5+TDw0peRopOrUopFb9urTijoXvRtqQfQkNqUF1SXJuW+mv47U9jfJ7ZHRw5S9sWSw6RHYEsd32LZZYOz/vc+ltkxGqJlxseczkCjzLG02sGDyns5enXsV22pdpnG4zGXD+00kMjIUDIDmnmjoB8ufivSGFbjMS9DOg0oDYDn/hFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI7PR04MB897750.eurprd04.prod.outlook.com (2603:10a6:290:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:33:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 14:33:29 +0000
Date: Thu, 24 Sep 2026 09:33:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <arU0sLhGG__lh98n@SMW015318>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
 <20260924101308.GA45659@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924101308.GA45659@francesco-nb>
X-ClientProxiedBy: PH7P220CA0086.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI7PR04MB897750:EE_
X-MS-Office365-Filtering-Correlation-Id: 445cca01-5892-42fb-06cd-08df1a48ccfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|23010399003|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	iGzRTn0spV4CRqHwLz+INNLNfmhi9jcSoc2O/xT6+XSyEv7Nrx+WsB3Zy5qeBXOK4lW5u7WPyJdYhiQ9s0oK9+tFaA21Gg6WpMt4xGUhoY/ZoXlWYI5Nphw404WzpefqS+GjI4If1OTBCcLf1qbHpFZ9iUdGCSgw9rIhvOVT5JcW+upyAN01uxnIBlDnJeANrOO87WHfIip2dn526fPeaTaoDbE2TQkY0Mhg6e3vf26oET3uOwCHfUwuaS6Qkt6FJfzrRwp94Baj5M0JV6VvcwsofvMb5kEM14OyTRBU7Gxyt8Wt7W+oEmlLZRnSfs5FEJn3KZx8EAA5KORxo4/Hb7REFEckd1zEGj77vJDmTm4oTN6PEgvWvgYbNBDgTaibyHH27PVX4AlB/2OgF0S3RF0d/GwtNUhJ36NjDrqS23x4E36q92/GQO68xjjFHYeAlNg8/7dcClfv7pvpdX+cG/yxbAHbaXhrETuK7vbC8lwhMsIAdmZXeuTV+nnN+5cI/u+HuvHFi5bAb0fBaQa+6HgUVKsSeAtdjMf3mq67WLhbJdfSbUxUM2IJ29uuLcFNr/MEWaVw1kDjKIX04OGmiNoIe3Lc+9hYaBNS+F+e8ip3I5sxiyY2S5NyWWWzgxbT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?15aUAFXRj39Ke5zpFOkG3M0H+MjI3CTAmxn+4CYtcOjTVxK3GCOp5Yd2H3wn?=
 =?us-ascii?Q?elWnnIeN3+vrffaBZWd/LscL6CTaHkulzqkAIpeg20OSMoc9wgpPsUINlLM+?=
 =?us-ascii?Q?e1TBUBMA+VY/zl3W3/XSQtAyxJXsQvhkEh96YdQSVUNoEPRhPTntmi5S3bF6?=
 =?us-ascii?Q?xuiB37u3y3ur7mZIiSrETqq71bMUatjKpTRw1zqTeo3k2Yf1u19MHFl7dDON?=
 =?us-ascii?Q?jZZ5RAa1b/BYsp85fwO8B23WT1cOcUJRvigo6bFvS4MpuWt6TxvVjjw5VUBk?=
 =?us-ascii?Q?4Qy00VRmJhipODSlSh/GpElmdlKk6e5NP5+B8nV1NS1KApHGeTEQt59iR7B6?=
 =?us-ascii?Q?m0ED/tfUADBEdi3fWqJkopbleckwblEvYoMcOAUcDbflRRAeRDl9/6Yk1K7Q?=
 =?us-ascii?Q?hshLjp4fxwkEjLIWEPw9e13487JHxzftBv0tpTcEnOZmGVvNTaZjKw0aWnhE?=
 =?us-ascii?Q?cJD3jPcE0X6Lj/Ly5Y2Nq2fgoV+Rbk802mVQkBVSpnPf7mii+Wq1vFz4GOtp?=
 =?us-ascii?Q?qpIIfKl9Sw12lbR1ov3fXkCLKgK9wPFXeRuqIX+hhxm37HqjV4Hr8iEZ2Ecv?=
 =?us-ascii?Q?HPi5tMCSD7CbjuS4wH1qP4NShL4Rc6kjFIaABNbOh2lPrBmLgSYX1zTBeyPe?=
 =?us-ascii?Q?73r6GdgRM2eNR13bA0k+P4SzeTDI1LzmYz7LmZg+eFP6RZBeXsFnBPpMGJp0?=
 =?us-ascii?Q?18fpXESlMH4EX4WSHYfqYlkKwRchwvELr9uQpemw5Q4Fokg337mRWISg+XwY?=
 =?us-ascii?Q?LIvPQo9/E1XMshdNEXnK53ewWKPSW3LWR7FjdEeVEYvN4I8WG31uRRJZiEpH?=
 =?us-ascii?Q?vkTSaOqMXeup6SOTCafeonKXhXqU7iUaDNu4O+4OlXlFXlUrnrtZUu3C52w2?=
 =?us-ascii?Q?boNi+IjJHuy8DF6RqRQjm7ewWl3/PbfiCH8KfW9z69aHMgPzBS5lz2p6XFOu?=
 =?us-ascii?Q?ktsjhxMzTiiRMjJRewImaqLPj1NWypfpCQHlyvsw0OqtqDzeSMQh8SQuabQo?=
 =?us-ascii?Q?Rqn5muYGiQxZsFwsAylXxLrLmeXwL/juQ0/FOiuoj2Ne3LY2HtyNo143/P3f?=
 =?us-ascii?Q?dejVVrDQdvGoCrIuulOOYsSvOr066l/0dPkSdh+06ySVE0OFDYLfxZHtnD+R?=
 =?us-ascii?Q?jRQXWmPx3OtDrsV4J8z+/Dk1YtZ0A1OvC9N4/PlecPrgm7UCp+feC7M5OLWK?=
 =?us-ascii?Q?8UagHjOXxKADIq+RgR3SjOb+8s2ytAJNL4hVbX78CEBPz/ZJ3beo6cKDt64u?=
 =?us-ascii?Q?zlVaFDaF1sC8tayHU9IOgnnglVIJYj3GD2BXNOwhJs9kNwrNMahjBie6tr8+?=
 =?us-ascii?Q?7q7WW0aqO+VYi9wW0pJZVHsZGefl0Fcg5ivFRNDAS3kJB4jPEplkxJ0RjY60?=
 =?us-ascii?Q?rr484urxai5RoP3z8n1nWACSzNfDQYnJ5g/iZyL4YaJLnLG6qKtpMLFA5vHb?=
 =?us-ascii?Q?hVbdDOGth41WXnQAJ4OV1tZ+iswZktW3cwar7wP4u7H7zxypZe6Zc/MHS2Br?=
 =?us-ascii?Q?mxF4mzvZxgxQv/Qqff2gHTHB26vp0SRYzqkumhn/PEPI7/qoWUHiYCfQeETk?=
 =?us-ascii?Q?r2EROrPXbwLYkNDwO8HuDljseNBDAxHHaprNcnp16E3gpZf3plXFAMX8C/nF?=
 =?us-ascii?Q?HFNnSz2dgi7eCwWVW0gN7d2llxMRIMUtJyQyFb/WuO2sCsmBXsWZLgLGo9Ij?=
 =?us-ascii?Q?G+eh1oE7dHLtPyzFbAd9sbbZOdIQgTKFLpMM1aJZwLcHkJxud5a62ep4JyQ5?=
 =?us-ascii?Q?6VapsIfL0fJSZmZkH0xR98O/ZpuQtKd6Psellv0mJ9e8i0fXvi+P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445cca01-5892-42fb-06cd-08df1a48ccfb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:33:29.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoDGHmeSy9rZKsLQXPgeXUg0yL2i25SJRQvMifJI1JXlvZlG/tJzdnYG9/6pAq3fQGJIAVpq6ntZH53g2gqnFiVE2+S5k5FIhniVPC+RQFCFcnIqtyBtynJahgp4yvs4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB897750

On Thu, Sep 24, 2026 at 12:13:08PM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Wed, Sep 23, 2026 at 10:06:55AM -0500, Frank Li wrote:
> > On Wed, Sep 23, 2026 at 10:41:11AM +0200, Francesco Dolcini wrote:
> > > On Tue, Sep 22, 2026 at 01:31:51PM -0500, Frank Li wrote:
> > > > On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> > > > > On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > > > > > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > > > > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > > > > > and SMARC iMX95 SoMs.
> > > > > > >
> > > > > > > The series adds support for:
> > > > > > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > > > > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > > > > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > > > > > >
> > > > > > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > > > > > Firmware remains responsible for configuring the UART and its pads.
> > > > > > >
> > > > > > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > > > > > DTBs for the corresponding Development Boards.
> > > > > > >
> > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > ---
> > > > > > > Ernest Van Hoecke (4):
> > > > > > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > > > > > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > > > > > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> > > > > >
> > > > > > both reserved lpuart2, can you share one dtso?
> > > > >
> > > > > The comment in the DT file must be different because it's important to
> > > > > reference the actual board it applies to.
> > > > >
> > > > > So to fulfill this request we would need to add a common dtsi, include
> > > > > it from two different dtso files.
> > > >
> > > > No, direct use one dtso. see
> > > >
> > > > https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso
> > > >
> > > > And makefile to check how apply the same dtso for difference boards
> > >
> > > imx-pcie0-ep.dtso works as a single shared file because its content is
> > > generic, there is no board name anywhere in it, and nobody needs to
> > > apply that specific dtbo by hand to know what it is for.
> > >
> > > These overlays are different: they are meant to be picked up and applied
> > > directly by the end user, in addition to also being combined in-tree
> > > into a ready DTB. Put yourself in that user's shoes: they have a Verdin
> > > board, they want to free up UART_4 for their Cortex-M7 firmware, and
> > > they go looking in arch/arm64/boot/dts/freescale/ for the overlay that
> > > does that for their board. What they need at that point is a file name
> > > that says "this is for Verdin" and "this is the UART_4 one", and once
> > > they open it, a comment that confirms both: which board and which
> > > specific UART. That is the whole point of shipping the overlay
> > > separately from a combined DTB: it is meant to be readable and
> > > applicable on its own by someone who is not a DT expert.
> >
> > If someone is not DT expert, most likely direct use your prebuild dtbs,
> > not apply dtso theyself.
> >
> > >
> > > There is also a second, even more constrained user: the one who never
> > > looks at the kernel sources at all, and only gets the compiled .dtbo as
> > > deployed on their distribution, e.g. under /boot/overlays/ on the
> > > target, or the more generic paths used by distributions like Debian
> > > (/boot/firmware/overlays/) or Armbian (user_overlays= in
> > > armbianEnv.txt), picking it by name from an overlay list or a U-Boot
> > > env variable. Comments do not survive dtc compilation, so for that user
> > > the file name is the only information available, there is no comment to
> > > fall back on.
> > >
> > > A single dtso shared between Verdin and Aquila fails that on both
> > > counts: the name has to become something generic like
> > > imx95-verdin-aquila-uart4-mcu.dtso (immediately confusing: which board
> > > is it really for? can I use it on either?), and the comment inside can
> > > no longer say which board it targets either. That is worse for the
> > > person using it, for the sake of avoiding 2 lines of duplication:
> > >
> > >   &lpuart2 {
> > >   	status = "reserved";
> > >   };
> > >
> > > It also does not reduce the Makefile churn: we need the same number of
> > > Makefile lines/combos either way, one dtso reused for two boards or two
> > > dedicated ones. And this file will not change once merged, so there is
> > > no maintenance overhead from keeping it per board.
> > >
> > > We agree that avoiding duplication is generally the right call. When
> > > there is real, growing duplication across dtso files, the right fix is
> > > a shared dtsi included by the dtso files, not merging them into one. In
> > > this case the duplication is 2 lines that will not change, so it does
> > > not meet that bar either way.
> >
> > It is not exactly true. include dtsi only one method. Basic there are two
> > kind type overy all files
> >
> > - one is for addtional boards.
> > - change configuration.
> >
> > You provide difference configuration, basically it is developping boards.
> > The real productions is fixed.
> >
> > Your uboot scripts or other manually should hide complex. like PC grub
> > menu, just choose 1,2,3...
> >
> > If someone like advance, he need know more knowledge.
>
> I, myself, and us as Toradex, care way more of our users/developer than
> just pretending them to know more.
>
> > Makefile show how to apply dtso to correct dtb.  filename rule can't
> > resolve problems without know detail.
> >
> > The put lpuart2 as reserved also used by other boards, not only verdin
> > and aquila.
>
> And I also disagree on this.
>
> Having consistent and correct file names is important, we have the same
> naming scheme for SoM using non-NXP SoC, and there is a clear benefit
> from this for the users that has the information complete and correct
> just from the file name.
>
> With that said, considering our disagreement, let's try to get to a
> point:
>
>  1. is it a requirement to have this changed to have it merged?

Yes, I will stop pick up overlay files, if context is the same.

>  2. if the answer is yes, is imx95-verdin-aquila-uart4-mcu.dtso fine?

imx-uart<n>-mcu.dtso. similar case imx9-mqs.dtso.  Uart<n> is cross while
imx famililer.

Frank

>
> Thanks,
> Francesco
