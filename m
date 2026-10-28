Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198829;
	b=BQvGZ7sw1QlD8iXQTRB0lEjgHDFdSL5ukz3VuxYgbwxB1IWDdUMykAVHhdc6DIi2l9/G
	 QcU8cns0z9eyJiw/bXYLzuS2nxclQvUzCj+yRTO+81zXX/xNn93b7e/xfu9q3Q7QEa5kM
	 LxLcDQgMQjEPpNREvwTJsW/WvCtLbybUFnJv03dm8EmKZCeP/u9LYug21ptVVTO2iWom8
	 xUVDjhtXl5kAz2d7DJ2sbHElsIgdRkilQjAyW+EoS2QPgvF9cDQrCEh5NIp3iH1HNhDmH
	 nRUQRQbpTTjjzR8vQv6pZs3gjDHe+Jh/5hKDFrvF/2+HUMa+EBcZmPElaUVfUo8oA/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YnQpgqv+bMLUajh4jBwRU7UNKutTmSKWzKUiT159mpA=;
	b=a4mb5bgZPfH0QzxMZtZs0CU61POJm5zhh05hxjLn8+v/9GI+RmrwzBMq+lhyPCI537S1
	 oXfE1cDu7qRGh16INEltVeLRkFpc3y+fiJJl+mIvMrEbLgj2cmEZrk1nSUsThHnxbBfMD
	 aerpD4pZdzsdzG+A1nAkLnAFtbJX85vz6RPw0dCdHlZY8QsJWbQEwElxTgrp8rbY6nEeX
	 btBTRZAx71oCdOmgNnrplY+AIKwsuoruTqOf3sRbdOoUQqZrUCaY42FzswVPgv5/0g+Rd
	 dsxPIh7cAeOzBkhJ3KXGeEb06CHotlq7ARm5NCpXl6Lq9nebDyy/7O1vOH/JSJ+gmdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jvvN8tk0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.55
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28762606A31C;
	Wed, 28 Oct 2026 14:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28762606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jvvN8tk0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZS4LmBMxNRwT0A4CG6G+8r2GFEJ84MVv7tm3RZyrsmnW+tliQhu6wN7WJzhj1K4hMAIBjr79XassfzomyTjOT+9Pk2igZdlyTXUNzS1Mj3E62R5WosMKP3nzjUVYrto3Isf/Fboe8QLCHRAipkaTYFKgBkecsLP90CnpIIt3zvN3e4EiBTf281tG8iCXjEzVzMPU6zd8eo+T7fwpgxiZ22yJGmaNds0n0huxCxk1OH5VelZ2djygZ5zGnZ5bN+uwfvPG8DoYqY0Npgs24DC4pa1at1Vpq555mTcyGD2ggDQ+IUBVnq+kPaASI45ZVh7ZnJPr71CwVEejRq7eBSBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnQpgqv+bMLUajh4jBwRU7UNKutTmSKWzKUiT159mpA=;
 b=wReMaCQNpIyHfYERzPUIUrVodRJonj+IyzoxD9z3dlGHHuVDSu2WFu3AnGvFu4N+11JQZ2HgCKxG4DpaKo7VUjmtyFo3yTnEFfTt9YcyG46NON77dduCjMzo7HW3uTWksATZoXuDLpejw6Hs4J3kClV0Ku094LqlRBrNlwCIFicQWUUHXL7ZGBRXcwssr4hp+6oGZvyGTaxkvVm9YU4jn1ONbiX1mCi7LeQo55QIaRAfefWK1qR6FP4jP9cz8Ctlx8eXTu4DzJvbMzuOEvqQOw1Z74aKTTYdrU6MB5RqkXsesZLAM1T8rGiepI416NwoFrUSO/T1tBMx1lMkRNgkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnQpgqv+bMLUajh4jBwRU7UNKutTmSKWzKUiT159mpA=;
 b=jvvN8tk0iEO6y4OOzzbG49msvIJpYtDCgnTRWDXL8GSPx/du6DZbNtIxfg5JINK8mW0qx45+5NZm0o+2dlguaF5rSybOqwAQfmdqUj25eZDSsv6yCQG4V6aiS1L+aFgko1jWu2t1kTxijkejFUffJDSycfG310+1T2qC8tgpeJ45lz+E81Ipi2UMA1ahN4k9CQgNvwl01jhcCWYtzcKA59TKJ7c4dqmhtZicwjgflcyBKJQVi2/BuAPSm7ciNsTsyFfThk9n5Tqi5bRkYO7JWyFdQuGHsff88ffrnJHloLR1eQQYeGvb8JCGQ2LcLMROns9Ri4scgwh9KgezgtGMTA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB059377.eurprd04.prod.outlook.com (2603:10a6:150:808::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 14:47:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 14:47:05 +0000
Date: Wed, 28 Oct 2026 09:46:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <auIK38HPyv7PmDJF@SMW015318>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
X-ClientProxiedBy: DS1P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:8:44e::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB059377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b297fa7-3160-4377-43b3-08df350255a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261026140227099003|3023799007|10067099003|261021123027099003|261021121427099003|56012099006|11063799006|4143699003|261009223027099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	WK5bez78ljbAnmV16l0MwlBIcBDuX9YrlJpJpYbaYS55KOb/SwZkDCURC3bsXnTX/25+5edGo+Yu7J9/L/XI30lED1upowMmMETh6nzjyNgmTvMsLdguX6ibjTqFfF/wNxblRMYzwd1DYuLp5HDTXQ02DawP2JR8QtKsNd+bVivG3rE9S+0oqpva14qAXUOLNOzwI/0BbKxmkP6jOs/mGutxE6ZQpexHNef2+xvVwlVsGW95WcFZegQptZK2tv8C6e+dLT1kgXUZLok5ysS+LMhkabRouwoV9pasJyVuvm3znzglxhylstR7cXLlFCs3eBsAci766MD1Z89a/C9+1Dd9Rm5cfw3f1ZWsJaYbiSa4qZqcBllnhisSrvjiPsier84ti+CDu2DrBV+w4xA1PpDcR4QJCSCuytfVCI8nV3s/nqb07mULaTWcPvmKfyPA11dQcYHZioboxtqmHrsie+IkQUmBBFTPoBPPa6t1hczLtvTWhylnyM+EYbrgBnUie1w22/WoesTfu9xudAxiFxm7Ufbv1Mk9b6LiW8E1xm/PsUK4U9jHqYHy0kEIWkL1m6dpxP2Txz74uP+9X/e2EZJbBx+KMAYTUBXHAm2rYtUMpPDkn+asIBLArSInLcUtWqCm28yVQN4J5kyi2RjrAKXoIaaHWqMZOowb93o+Z+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261026140227099003)(3023799007)(10067099003)(261021123027099003)(261021121427099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bzGWDRab1dJ/Yom7oqpNz2haNmkPafBmNNeZnVkr9DKkVwmGr0mlHuSnf6cq?=
 =?us-ascii?Q?n6zGnnGF2Sf01sMCd344GSKssow0k4PQT3LYjxoAhuEbUS5J2wSJ//GG2XgF?=
 =?us-ascii?Q?yz/B7wEBtFNQ/unrE1PZlChQruKUk8XDz91wQ3exBs2UcUWkb4Fv4IUiiGTQ?=
 =?us-ascii?Q?NYBpYlZ+ufrlxyLv7P7TvnSKqDL1PMlmLiIwFheiFth5pKuFlfhK4EwE3yF3?=
 =?us-ascii?Q?SWiyMTjntOh/irWm+m7bf3Mjf3ZCok+Hxuteb5+YYfHGH0Y+1WHwHBVGvP9j?=
 =?us-ascii?Q?5XP3XrqCFVYEkGwc4c4eOKSV6BFAFN2TL3nv1/Dv1J6PA4dxJnGmsaCMlmYK?=
 =?us-ascii?Q?OPO/l/NuEwsg7fhQ8GCL/2X2rLQeKxObK991jhn9lKGWJ3YW0pbWmH/OSpme?=
 =?us-ascii?Q?z5lkxoc6UDzD365g7kwlL2Fx214tXkkruM+Q0y7rtHoNPydMx/rmC0+yQpdV?=
 =?us-ascii?Q?QxFHqnM5ZQi54A3LaixEApU45IfCGEetnMlIFNTrSa162g1douDWe6P+7JEq?=
 =?us-ascii?Q?qtcBkUtZwy/HC8gY59ioxkKfoyzIb5HvfkYToDAMjB5azdkYKbC1S2YLSm6C?=
 =?us-ascii?Q?eWMOVTqNYCky/ac/Kx7/wdAJJ5xwf3OoW1mHDDJ/sVEwNYZnMmpNbokjsZxM?=
 =?us-ascii?Q?W240XvcbbIMK8fYqljcR83NbEcyDpPkNmGWav21FcWW+cdK31r3UAD/2gTwS?=
 =?us-ascii?Q?sERBW0xnvrwQbH8tmz41ZjQIQeHTWQpwwXA8fqbvcge/Mm1HWyCcMZ2S35eL?=
 =?us-ascii?Q?VR7u0Fg2g8aUuyKlVnyPRr+WobNEO93RQEsq587FfdJB+SrDWUr7W/2b1G+l?=
 =?us-ascii?Q?++44WYKRWSvDXsAeA6pqhy7gqZs3/ny1ls3LgATVg120encq6dnJ4m+tjYIB?=
 =?us-ascii?Q?CHBGaaV2L3E4OHi7TUbxvB6JnDv0Iiz6wBdjZ2x2khrEOb7EPxksiWtFBGr9?=
 =?us-ascii?Q?nbdVgTrDN4cL+AOIvuK3vVOIMGXkz/jAItZQyiFFvbweVbHQzylbIodrsthk?=
 =?us-ascii?Q?/gmM/7FXgRnBuT3u5JsHEIs1bZMkvPlsV4xULxKI1BO+JEbeku9MmEtm2Kd8?=
 =?us-ascii?Q?rBClXjzVAwFiEod8wqazGmctTUiMv/E3zPGu6K2K8MULVqrvGILhZlXzLTc2?=
 =?us-ascii?Q?tb00pRsquHErqPh2I7flSplRYyikUJmpU30SpUC9sH6N8J5gIHk3U5zY9adp?=
 =?us-ascii?Q?FP4f+Cg9DwGUHim9/fog9l4FDlvKZCSQai532c2Ezeyvz63d6dLDBl6v8zhI?=
 =?us-ascii?Q?CBnStEl+hZ/LTNM7qlZ1++QF3OSouKT5//J3dy3VH5OFZPh74cF09rjgTtTE?=
 =?us-ascii?Q?2JRKNLVtabvbgg9a4KNuMAEpwZxJ+45CTh9H8OJQQAvzAJE9vcDOe7uiAEfx?=
 =?us-ascii?Q?u4vnsS9qXo/jZhMA+JHmlcH/+5EvzQfz0UrNrRQa7R7BAqX6RZMwpT1AG1VH?=
 =?us-ascii?Q?yRB3xRtqtkLNQNanFU1Y8caqzR3fAxSFhVDZM6ruY5NJxK5tKmnJPrmTn13u?=
 =?us-ascii?Q?guGE25e/zaXxqhwSPKsiu1ADwG6vJOZtOhOSVSuISsiCXylPFneMjqzRr3eJ?=
 =?us-ascii?Q?NyJ1PUduR+RbTxMQiXIed8rjV48D1QYKFGuSN0mQu4CGWQIEcvvr/XLAkdFk?=
 =?us-ascii?Q?6jlmJm017Xlu6WqdkZNrsqLxmN8b2Gz/cK+TI+wP2RZOJFEtSS1o1N+0oJq3?=
 =?us-ascii?Q?7dSk46+Uj4idN3Tz9WbAchvixzH/bQHBRts5n42BSC8jBjVkxRN5ClUn1k5F?=
 =?us-ascii?Q?0Wcm4hE4hD2LtEVgq2VSONyUFfPRF2wWmZOHrEhD/KpQgd0J8k3V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b297fa7-3160-4377-43b3-08df350255a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 14:47:05.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hoGA6u7QMGk325mGaQczYHC3k4CnHi7L+phkVEGOQGsnSR9A0j9PXFqRed/JaN4k4FFR2NZ2WKjDL/w0j2Y98vSOYc9ZVsaqMw42xrpH4os45kWFBAsaQncR6sMALsy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB059377

On Wed, Oct 28, 2026 at 11:10:07AM +0000, Diogo Ivo wrote:
> On 10/27/2026 2:27 PM, Frank Li wrote:
> > On Tue, Oct 27, 2026 at 10:34:54AM +0000, Diogo Ivo wrote:
> > > On 10/26/2026 8:33 PM, Frank Li wrote:
> > > > On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
> > > > > Hi Frank,
> > > > >
> > > > > On 10/20/2026 8:18 PM, Frank Li wrote:
> > > > > > On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
> > > > > > > The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
> > > > > > > the Renesas I3C controller is controlled through the SYS_I3C_CFG
> > > > > > > register of the system controller. Document the
> > > > > > > renesas,analog-noise-filter property, which references the system
> > > > > > > controller together with the offset of the SYS_I3C_CFG register and
> > > > > > > the state of the filter: 1 enables the filter and 0 bypasses it.
> > > > > > >
> > > > > > > The property is optional: device trees not providing it keep the
> > > > > > > filter at its reset value.
> > > > > > >
> > > > > > > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > > > > > > ---
> > > > > > >     .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
> > > > > > >     1 file changed, 19 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > > > index 08fcea89a015..381807844351 100644
> > > > > > > --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > > > @@ -96,6 +96,25 @@ properties:
> > > > > > >           - const: presetn
> > > > > > >           - const: tresetn
> > > > > > >
> > > > > > > +  renesas,analog-noise-filter:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > > >
> > > > > > I don't like this syscon property, look like it is one kind pad propterty.
> > > > > > Is it possible model as pinctrl?
> > > > >
> > > > > On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
> > > > > controller's address space but in the SYSC address space (hence the
> > > > > need for the sysc phandle).
> > > > >
> > > > > There are a few factors weighing against modeling this as pinctrl.
> > > > >
> > > > > The first is that the physical pads used by I3C are multiplexed between it
> > > > > and for example RIIC3, so we are not filtering the pad but the internal path
> > > > > of the I3C IP. The pinctrl does indeed have some controls for the pad's
> > > > > digital filters, that apply to whatever block is multiplexed to the pad.
> > > > >
> > > > > Besides this, even if it were moved to pinctrl we would still need the sysc
> > > > > reference, as the pfc driver would need a way to reference the sysc address
> > > > > space.
> > > >
> > > > System allows multi pinctrl devices. your syscon can work as pinctrl provider
> > > >
> > > > pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;
> > > >
> > > > The key problem is if model is resonable. Syscon is simple, but have not
> > > > good abstract.
> > >
> > > Doing this in pinctrl is feasible, especially since the pinctrl driver on
> > > G3L already has a reference to syscon for clone channels. The question
> > > really is if this is what makes the most sense, as again we are not really
> > > controlling an external pin but something inside the IP
> > > block,
> >
> > I don't think so. Generally, PAD some property, like pull up/down, driver
> > strength, some include glitch filter (capacitor or schmitter trigger),
> >
> > 'renesas,analog-noise-filter' like adjust some capacitor at PAD, only
> > controler signal (register) is not in your pinctrl region.
> >
> > There are not analog-noise in side SOC's digtial part (Or we can't care it).
> > Analog sigal generally existed in PHY and PAD.
>
> On the RZ/G3L the analog filter is located after the pinmux, at the input of
> each I2C/I3C block. Each I2C and I3C block in G3L has a single
> register bit that controls if the analog filter is enabled for that specific
> block (so we have SYS_I2C0_CFG, SYS_I2C1_CFG, ..., SYS_I3C_CFG)
> each with a single bit that controls if the filter is enabled or not.
>
> However, for the I2C blocks they can be multiplexed to dozens of pads, and
> these pads don't each contain an i2c analog filter. Rather, the signal
> passes first by the external pad and pinmux and then it reaches the intended
> I2C or I3C IP block, where the analog filter is then located. For example,
> the P2_0 and P2_1 pads can be multiplexed between I3C and RIIC3, and each of
> these blocks then has its filter at the input of the IP block, and a single
> bit in the SYS register controls the filter for SDA and SCL together.

The location in hardware is not important. What's most consider is choose/use
which software model to descript your hardware.

> Then,
> there is the problem that if we model this with pinctrl with a pad property
> then pinconf would not know which block's SYS register to write without
> coupling to pinmux. In this specific case of P2_0 and P2_1 pads without
> coupling pinconf and pinmux we could not determine whether we should write
> to SYS_I3C_CFG or SYS_I2C3_CFG.

coupling pinconf and pinmux is quite common. I remember pinctrl framework
already consider that.


>
> Then there is also the precedent of i2c-analog-filter being a controller
> node property rather than a pad/pinctrl property.
>
> For these reasons I believe that pinctrl is not the best way to model the
> I2C/I3C analog filters but please do let me know your thoughts.

But syscon is also not good, which basic have not any abstaction.

Frank
>
> Geert, DT maintainers, do you have any preferences on what the best way to
> model this is?
>
> Best regards,
> Diogo
>
>
> > Frank
> >
> > > so I'm still not fully convinced. Are there more opinions on this?
>
