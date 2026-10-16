Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A73839B2;
	Fri, 16 Oct 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160301; cv=fail; b=tiHTRNZdG9l+vB4E3xFR/rLY8OcEHH7vuI+XCyWpBCZTJbPjmx0OIfJK3puAhjXl5O14yqjcGFBmjGLkPXmeZ/Lx15C/b2M59ebYUU45kcQtozU3fCIPpUs9UY/8gmE0pX0DFtC3jwfi7O6O2oalnS3uT26mBz5/KvTU9UEglHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160301; c=relaxed/simple;
	bh=o57fC+FcNxSf4CAEsb04nGAus4zZKXzJozyHyY3Zjjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b90RBIhxr/ShtlMTfaR4diMOrTjK6rReZ5QuG8Hc1MG+6zLtwA7vuTjfMIS73hqI2DBwcSQD6+rZVfReSFIQ4ieSsLnOUz1XJje/LuttZz9BhaY2j3roL0JzboPESrDKMd1m+WxmLqS/Gh6BRWtdcV3bit3gdSgltgtUiuHE8/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=smU5upkK; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="smU5upkK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7/3gNFtbEyVvR5wGrI/WJLW5SmKdTQRI6t6RVRSQicqzTwV9Cfx31mkB/NnIKRaJ5IDk6YSQIRicRh63d0v7ygcylPrPQ5vAA5IzN4TXZPrtQUlGWKuJXDSTIrp21kVGIcfRrzJg+ycTSfaCPcQw02vC61mRk3pFCdRb9i5Z3x/93cjqF06xQaNr3CgZF18IMZwlPtOF8Xw/fDevfaVYhjcSzMgu/9qT/0K383VXANSGG2vsjzABdd//kqUpIdOhbhV5BfBKbNiGVfDQP6FKR7wPemeVdZCwb1fTIRPyRYTSZj/36gJukGddGP7BesGKFNm+o0XlgKJ0T2SL+MIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KHyZja5uP6lklSHh29m0AbjdLpE25SIXYCjKqNrfbo=;
 b=nuSlxYlHGteasBtB6SpfgLLVC4DlPIKolUY9gYhBMEUeRr1dBeeUuuQmnHkJIzV4HPDwo2lNh2hw0Cb88+aGA4JReB99PCizNozEdzpz3DFjyaYIGPMRjXe8o3NbRCyORlM6tMpFTT1MsOjg4B+yAxY/OQoTyOZVhKWs2NU97l2BzXNldnflD4hNI9X5YdmEBo/24NHmqHiBNK6h/QTpt6OvFXVQnKs2m2Ps5n7JbTOk8x46c4OtyiKE2btIwAJLT6020sQHozb4Mn1XQ49JkLFf/G7RmDE29P/uy7PwBPu3BLfTHVZ/iAkkgFeb6uyzLk7NGtErpMpeq9jJDyJBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KHyZja5uP6lklSHh29m0AbjdLpE25SIXYCjKqNrfbo=;
 b=smU5upkKqE50tAr5xu8NCMWtZVIeAlJJw+iE4tHy6nOVG28gx+FoS04HQg4iDdGt0VHzDR/v2tl51Va+jmFF9815jlWIE8OwlXGuDLSEFDPmBiEnQUKRcMOBkYZ7HhTMu3GXZodxKrsnRQxfyYTlkrkbInW91AJZ4CETgRIQUGsvv/WQ6eCVUf3lRZ0OEuMDFRjSyMTWX+d8WOki8QcN5Lflq3t3wzzVfTZdukD+w5qgrbEhTjpwTwLPxhoqXJkc3sFu/54ZKVVxQ0H6zoBK+TVQAD52JxtLrQRgNOHK6b9q0b29jkhk6EsNKyXZIkZgIO0D5OXr3XryryAPNaP2fA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9369.eurprd04.prod.outlook.com (2603:10a6:10:358::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 14:18:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 14:18:16 +0000
Date: Fri, 16 Oct 2026 09:18:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <atIyHjPaKLlfdv5W@SMW015318>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <atBLglf0gSLS7XkW@raspi>
 <atD9yeOeHZiKzhZD@SMW015318>
 <atH5htXNBjFYq6wn@raspi>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atH5htXNBjFYq6wn@raspi>
X-ClientProxiedBy: PH7P220CA0126.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c8963c-46f0-44da-005f-08df2b9051c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|19092799006|56012099006|11063799006|5023799004|4143699003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pasIsfDvw4gdAGUVtr2AGoe3k291kWoQHpReHmvWTYZ7eMnIdR5BOwlFlSnuAuRnbx7uGX9CHgXCewwz1YNNfiu4rueEuUh6tvK3bo0TVndkM2k2ZBZfkq/CtcgcuXUbPn0UM8GOq98OO1BO0r0IFyFxQPW3UiwOCgrnCWDveszOR9GLvij46eAKyo0fBRNbZqxlGCXWj1OMS40FlQeYTFPwH/9ltyooNdS97xjY7GSZGbCKRFXpm0BZGXVd8knAPMCuTSzVCa81IlUqteZU14z0fLK4UnXMQVYNYWUbEObKytwCZVCHnlgflpnK6BGMo01W3Uok7Ih8wiCvTFs1TtxI47+hRz0zbYP+f0B8wTmRkCJ8LbDUtMDU1hWuKt5e68nnuToRvXGbqSAHXIq2npvIXRcrchhlX4jXtQ/mVvoVFMXdxxd5vdldCy9l9JLA9jdDLchMdupiw2le0blyLJHxxWDBGndIFYu2Xv9zK3xyReqi31nxYnDZ7vsLBHjjFpG0PIsTGJNHkAloDfT+8N0VJCuiw56oyyLrUfqUFSb24X6R9tVirniOSeclyhKMPurlzKKPIG2h3rP56JGL3+0CwSc/rZNys6SJgOsO/OPusGAvdJBJfEuzi1yaJOBjC4cC179OsyUvyw7K/zhihufYWxOW9fPDxOIEsfwqyN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(19092799006)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K0Z/NM2aY/ivoVzj/tQehnmyTjzZCwBG8hhCRHnc+UakfJt2LP+YbPydoy2G?=
 =?us-ascii?Q?2utfI/NxaCJ1aNpytw70rOnPqL+dkZ5xY94mo33w8t0Z58Y2nkXLHr3PVyz8?=
 =?us-ascii?Q?AJRCRHKybo0XBv5F2gYCDfti4FQIBCFYtdo9Yel93H661wVrepsEA/OhZcai?=
 =?us-ascii?Q?Crrz8KNrm4qQ4+ok8KMxSXoBq4ahbk5R5c82YfUmMzHz3f9FuuXuf5bwJ3gK?=
 =?us-ascii?Q?e/wh7Or5m5bF9DmShJ/LEYyhRrGQ6wCQgqEyXf9yWVeRNT11Ypa1451FoFQf?=
 =?us-ascii?Q?EVfBiobzamQekmvZJ3AbgntVNgNPk5eHq7GMvixTpZGiAPYEIRN1ye1SF5kh?=
 =?us-ascii?Q?JbHNdgPW5TcNU+FDA6rujFFabMwc6HEgnab9hws4aZ1YQe3OGoNP/jDGhdPa?=
 =?us-ascii?Q?SxkUZysLFaZyYSWkHAx7GiMLG8kQ8emjgJY4OAuEftE7WIq/x0tU6YoKGY6w?=
 =?us-ascii?Q?kd1LO6HHLBGx8skbM0J60A6ZUreofe8GiQosQJyuiNHguoCGu7Kdx3n8ot+t?=
 =?us-ascii?Q?2fAtMOzUNiQc5KY8RyDqa70FPAmQg2/at8UGjAj0WMMh+Tpkq+FLWJy55kfM?=
 =?us-ascii?Q?2rwXBgvCuS7QbvLrEgKX8mnJrfiHRdgrAt1NcQrY373YahHjyG/4783ML7pp?=
 =?us-ascii?Q?LBhrSnp5GnCduVlaRsop2UvIrEyM51+LkCAhtgdua88TzpLf1HvKd/w6hiHG?=
 =?us-ascii?Q?mgJjmX2uRRYJ99JX0+SuSMP9HI618Ph+wrqooxE/NlEbzBU0djCJZEv6xxK9?=
 =?us-ascii?Q?UweQYX2CRtpPDng/4ieMWJn46//KXz9TYZK//XjkYNF3SWjV9+KxgJc0mnDP?=
 =?us-ascii?Q?YJMMu8P4EX7WIYxDLbxLvB1Eb3dq3MLz7VVdEIeWqMLH8ZG/l9a7Sz4156+6?=
 =?us-ascii?Q?RWEDtoDQldcN5rSGlBwoaKXLK2gk3/0vJJ0yzu+6Zj1w8eDj/O/UWQEi54u4?=
 =?us-ascii?Q?HA7BT6aqxusQNVkS/XgCV5rFYcvZTfIvCIVqc/J2LxLbqKpNKfgFGDvk7lLR?=
 =?us-ascii?Q?rNVowW8ndz9wr5NSdOELv1PKXDRHUO8fBizUSfmyUT4IawYW095zvoQ7RU+4?=
 =?us-ascii?Q?lSnE96Zj+ybE5Br601S09l6WUCDG0QiuJnM5EVzUym4abfegFNP8nJgzdaY/?=
 =?us-ascii?Q?CR+xZg6PE2oczLgxi5w8AF5G3JkAepqsLmbWBvlY6K8R4ODaLVu9N2vni3IE?=
 =?us-ascii?Q?chdQhAJWEh9giiviY7q8QVvYMqvXgS5M2jTZinOur/CvvlUIx72dNsSU7H+S?=
 =?us-ascii?Q?1FmRY9NiA9DgVnIH9RBWqoOAyr8YI1jyZmwRjBQj7mW6WWQkX2ywHpHlI9bs?=
 =?us-ascii?Q?NmNMIZUhRcwf29ZxR0oZm/FMCbShJ42QbcA3Iv3EF3Byky0bNdNByQp2uqCk?=
 =?us-ascii?Q?v1J++yuevhE1VmRZ0EAaQUySYnKONB0DKM9A/xb+nUDvH+3JhRJvcVjFnYFp?=
 =?us-ascii?Q?RbhYt1dds9yt4lauCvkfzM1LtINt9dsSkgIYdiSIPs/JSZh/Axoc1iJtpeoF?=
 =?us-ascii?Q?TqIIipRclX7bMKRxpN50PBWr4XQWxszofSkFq4/pO2JYTnyKpmzGXKdU+S0O?=
 =?us-ascii?Q?CEy7oeuPjBkJmhPtQbDs6i9gwB39A3M43zEmT2HGg4gS3VST9M0i9DYtlKf7?=
 =?us-ascii?Q?PLszMq71BLxmvf8497MZ4b5FBUvaSQKsCiV7x1OhA2O6NHxEckosvQtXnOds?=
 =?us-ascii?Q?6TZRlV+DAHRVyWcjSeyS3IAEp1idrPAEyiVzSL5nzKJ2+1teD2gqY0QM2ZHo?=
 =?us-ascii?Q?xx/ihl9d1lSuEJ+Z71UmIg0H7ohQsPlrkU7WUQyR61c1fQIhjGb5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c8963c-46f0-44da-005f-08df2b9051c6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:18:16.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtnHWUT61yp9Tyjp76ZDe9Zs8ZZJYRvfchKJAIWjWKpS0TbPSBphkJQyACaJwZZaYMmCOh+WxoZzfxd0Twf9QBS6ibhgrxVwKKjmG/sMnGWuxQ+5SiPAaKXPZhgWJ1DR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9369

On Fri, Oct 16, 2026 at 06:16:38PM +0800, Liu Ying wrote:
> On Thu, Oct 15, 2026 at 11:22:33AM -0500, Frank Li wrote:
> > On Thu, Oct 15, 2026 at 11:41:54AM +0800, Liu Ying wrote:
> > > Hi Alexander,
> > >
> > > On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
> > >
> > > [...]
> > >
> > ...
> > > > +
> > > > +			dc0_framegen1: framegen@5618d400 {
> > > > +				reg = <0x5618d400 0x98>;
> > > > +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
> > > > +				interrupt-parent = <&dc0_intc>;
> > > > +				interrupts = <28>, <29>, <30>, <31>,
> > > > +					     <45>, <46>, <47>, <48>;
> > > > +				interrupt-names = "int0", "int1", "int2", "int3",
> > > > +						  "primsync_on", "primsync_off",
> > > > +						  "secsync_on", "secsync_off";
> > > > +			};
> > > > +
> > > > +			dc0_tcon1: tcon@5618e400 {
> > > > +				reg = <0x5618e400 0x588>;
> > > > +
> > > > +				port {
> > > > +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
> > > > +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
> > > > +					};
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +	};
> > >
> > > I'm thinking that it would be good to have a complete display controller
> > > DT node in the first place, including those prefetch engines attached to
> > > fetchunits through the fsl,prg property.
> >
> > what's current prefetch engines status?
>
> I need to address quite a few comments on v6.
> Some are difficult.

If needn't big change when add prefetch engines, should it be fine add this
part firstly? It'd better than nothings.

Frank

>
> > Is it possible merge at v7.5 ?
>
> Not sure.
>
> >
> > Frank
> >
> > >  In this way, display controller
> > > driver's life would be easier - all child/grandchild devices are always
> > > available.  I'm considering to adding a check to the Linux display controller
> > > driver to ensure the availability(at least for critical child/grandchild
> > > devices).
> > >
> > > --
> > > Regards,
> > > Liu Ying
> > >
>
> --
> Regards,
> Liu Ying
