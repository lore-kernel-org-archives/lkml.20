Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70017493D4E;
	Thu, 10 Sep 2026 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055099; cv=fail; b=Q+VF56/u/+p9AheOr6uqgVzOXVI+cd0nozZYfnjH6Wtpq22T8zHJs+ganeQ3HbB6OR98SZgiEP8gy2AvSBvuDuEvPukE57JB7NZyVrME/OqF2bf13dR6vL58zTVaPeTEFnpOuJmWt3D+jT6GtiIPR4DP5LXci8CrTyJ6PwIudj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055099; c=relaxed/simple;
	bh=o9qTIltlVOkJ24xFygXrcilKChh4pJtSbD/E6pLZMy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UAdA4GcSfqSYkXnKC59R0sDszg4W7dysQomHGp97PY+rQtWv2wk2LZTOrsP/wqMNygAegicbMgRtRYPrYTthElN4EfdHeBNJCS2qzDt4rJn0J7cZAr+g+hAGR4AjYt9pilBRKuzOAOLS6Nofn5R49sdS4wgidNKSjQMvAJn3TWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RJBGusEV; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RJBGusEV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyH8CP1MVAN/JJ0xD+jjG7PH0E0IQL7l+8nT7UlrjmNqN3PheJeU8zJcodkh7b3uRCP9kgoltZGtVH5yEu7VLChfG1t6duS8R09r9bjaG8C03EEqq38KLhQruzDYmpeXRj3pDDvO+i5y9VQbrrB8XjRnemV9ffx0dm5Ovro/kglpDVxte7hzpANM9OMa8/tljfDPHGHr37nYRbDp6NsljEDP5k0EX+St/P3bV9kwgQVFbQlyQ2ApaABKWI2CPcPsMxGnCB3H0YI/hU96Qje5A4qfsnuthSh0o6nGyRNDkUsSp11+yNyc7nlMV8jz7PUJC0mwg5eTUgnZ7VCqvZ44Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRK/rzqGR2ymF9gYV8aJYeyhOyiqtSL9Ji4ympNlQ4s=;
 b=fIDq7W+qHYcn91ILGPHetUfg6GaLrWe4MWEStAOZ/XlK9y1AkPoYn115vD5CNKWUmNvU5BmINU2Hz1fNrY8Kp6teETffQ2YJ8xZMcExnv056HMzxBj5DB9Iik9E616KATRq4ofoRnE4r6GTbtzf1ZRYOY4Uc0xLo4ts6Yg3WIV5djkyx/KOcOutR3HnR5Z/Dc7bqwjMu1x6DXa8OY/aKa0h8pyFozA6pl1ocsoPB3Aq3q1NtBpqbNC0F3sb/uI7/FDV8lNP6DRQTfUVzNRUWY/1jA+tXiifm47Rkp/rb76HkaWbGVliMnOhyBzMkYtFzVZdazSA0TvdeyX6mhzx88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRK/rzqGR2ymF9gYV8aJYeyhOyiqtSL9Ji4ympNlQ4s=;
 b=RJBGusEVZzd67k4PNuvOed2Z516jxZaQPO26IO/1fg1AwIVMuoVVjL1otayrEJ7W+LgiAz2DmpqbePeNDS0B8z4PwKWpQDqTZ/w7G+orsqq1pvV2mduL1rrhXQrMPSNufhyV/BDMfw4ax+pSUIYe9QNvsx8FFmt9NkzZhUKMOjSZX69sAKVoV6QGAX1iRzYW8NkxV9ovjlRhkRm9SQLSjUkVHBVYMxVe1AoR8TnI6J/ulHNQp/cuL265vv6uq+Mi34QoF87IEwUbxTe9H4BpDRpZs8oegSsyPtiUXun6gorqobMMVvFmhLIHjHXLQh+gTBGDAe7Iz3aRNZrLJujNAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 10 Sep
 2026 15:44:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 15:44:50 +0000
Date: Thu, 10 Sep 2026 10:44:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aqLQaHndX4t1kKLG@SMW015318>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
 <aqGHlWpQjpHEft3j@SMW015318>
 <aqKWTT47S_zPzvbN@squawk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqKWTT47S_zPzvbN@squawk>
X-ClientProxiedBy: PH7P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 154fa25c-357c-4588-9891-08df0f5272dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|11063799006|5023799004|56012099006|4143699003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZnZ3Dxm7KW2LISDJtxVTIbmHyEKRIGRjQOCcaTFrvXZThz8JVxsmODFkhQPNkvgn8oG1Bm3viOxUoua1g4q8lNfzO+1YFTy2dmkBY0Qh4y1THXmDhVK+LZ8hYM5dJ9mdyykREZ0ejxK8vVNJW37+fiwcSkpv8/+P7vsLhape6Dt24PtrtexzA1Ej5zGT6OTcMc77btzlEb54dJQf/gw+Eb64W1T+C9cvVz47crUTYB1PMhXhgiRodupQxYZCWGMjMHzQmV16LJ9RJmqEWLDpD6Ne4h9Hu01TiE3K0Cz1pprkIQIMIpQuZRyRDT16CU0ng/Rpy/3KV5IxWEw3vpKGFiwAO8wpi91h8KjlfByAudWT1jI9jtoD7kbSxbWy9MU1EuvIXrGZDMcGrFbRhwFGksqHn1UKradg9709Tcm21gIP1ldEYbZ8bxkpI9CCv95VbgO1art5ZiqoFNXxexWCsZHf9/Tomph4oqPAE83O4e8w+lfbljbJTITcKitzHeyOlwLdoHqkV7mGBCmAI3KAeATl1PY00pGggz/vBPbsgdue4/z1qS0PauKab5gzXrjN73KbTAoJ9PzV/HpLdESl6mUbI5F8eUKK4ojkQSTSJ4ix7iForlSpM3l0SqSVU0XPyuvwb8T0NpWRxYY8tONZYW/EMdWvRdX5GoToot45J0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vyu9nWcLwOJMOgOFj8WgIMDZ9603/3aAzf8Y8zVZM5iPMnk2tZPaiGhiEUsQ?=
 =?us-ascii?Q?pW9wTIbYE8i9Fy0S15FWn91aHG1xHlUQjnYOemYDQXbgdUU3wRPO21UqDGIr?=
 =?us-ascii?Q?pf1jZswBMkgqP3uuQ0CjyrkaCnuLhZfvgcR3Xv505m7W55qgyV/ewQwaVVOq?=
 =?us-ascii?Q?noK/8jJ1KQoRx7qozlO1CeUVTszG3ShgUzfvJ8yU2ChB00beXIok15mflgh6?=
 =?us-ascii?Q?aI+YJCPdLwpyisXWtJcty/u3kX1PGeRObPFkU9xZvXbm0HppjZtWHg1hPZDR?=
 =?us-ascii?Q?wlxZac2gp9rLvsWMf6qBC0GgOEqfbH+YlHw0airkTUcO7nMvo/IRWy1iSDy+?=
 =?us-ascii?Q?1dn2ANnzF+KdKQgJLCf+EEu7HeYU3SKikM0yvYkrv/ce8swLm4W/2GvbdoU8?=
 =?us-ascii?Q?LZlOfUOxrYfZYyvQCBERlmXHk94kF/rJwILG89UnN41mHGq46DmEG4zmGX9R?=
 =?us-ascii?Q?vYdS9wLN0FREkJSFzXsNIoM+rz4nYBtkC7l7//8boA45zc07wlcfuplE783o?=
 =?us-ascii?Q?CT8r5yYEPD2aNywotlllmm8DtYQn6df2luMZ0Pj0zk2Rbdh1+mrwjFxEz48m?=
 =?us-ascii?Q?Eo8gPgvtl7WW24T18EN7I8UZCOtU5hQJOgfInUJ99OQCUsJXrBAs3hg89T1b?=
 =?us-ascii?Q?/TsViLo/ELIfqroQcqoyrwkB4dFY01dSV2hn+pVYOb874mYuhiua7pa12jeB?=
 =?us-ascii?Q?HQFTAfStDbefB6zSHlavCoDnJfwRvnihprju/bbLMh8KncmdlkaXM/KGqM5c?=
 =?us-ascii?Q?PzS3gFVAjZMEUYdbmXefnu1NpwjIvsKoNK6uW4wZ+XVHN4AzNkuZlghI2n8m?=
 =?us-ascii?Q?iH+UI3q++uh4gbPJYkmIG797RNcJvALSGMg2zOwkizn9q+GuOnFoG87+nOYk?=
 =?us-ascii?Q?EkSGg6qLscb7JcG25/nYkA9hbc1uIIcS12Davh3b5uA/xLcMzXOp+pxUu3BV?=
 =?us-ascii?Q?wGgmfe1Uq+qjqc9FZmdUi919xQ8iSedaQ/2C1TXb7pf+anrJ9kFS1ENNqVIC?=
 =?us-ascii?Q?wkulcXNliliD6OUnf3oSjhjJ3xiPUkG0Hi0Y1ba9To8R/hJuKiI7YRlkzguQ?=
 =?us-ascii?Q?kIPIPnKf2K9XhwRLC6uRHftFwXIiXsZv3xwIx3sVvHPQq85qPDOCHSzRj4oO?=
 =?us-ascii?Q?mS0q5g1VRcvKLDSlW6aUjv+T5R8xEs7ain6rb117XzLAPPxGzEAJndQ6a9dK?=
 =?us-ascii?Q?OQSgwroG6/E76fWvSpnm86IM5C0XLi5DFjdv164te1LsQukCgmFJoNYwZkJF?=
 =?us-ascii?Q?kMCNlY9Zghnusgnvm64mcIfVZ9YifO3lPEDFBvzkNJHHSEdXSr10GCrSRjS4?=
 =?us-ascii?Q?dfYu5+VWujFqTZidEJUwTLguoCwA0q7lGU+k2qGcXUzt40H3SAjyO8lYlufJ?=
 =?us-ascii?Q?4SyuBZ6BYFkctTD62CSGu0/Q7Oy+JiO5u/zQFKKJgcLwwvmVAZAIAwSlsnJZ?=
 =?us-ascii?Q?mFTwJTNNoBR+87HeX457o2/4Kx0/Tprx12wJHRcd6gPXSW+QHIgDuy05f+6E?=
 =?us-ascii?Q?9Xi+HB3DdjTKtn5AwFIxvUBSXMOZVfB4BzaS5l7gCLfsnGuthMEYrQH7Y2se?=
 =?us-ascii?Q?YTcoL3D0Grzi5rWdHSjYgchKeMGUIfGkYuZST+M0C7XFPTtGWK5RlQH6oJxI?=
 =?us-ascii?Q?/MkYGObSkeDJ0b4ha7ilDbY95XXgNVxHe1JchTW3aGQMBQpGrmpv0lnJMaFQ?=
 =?us-ascii?Q?9XUjCrUjfHFMeLzi7LOe/HF4n/9PYq+kU0wH9gV4ilQ8x9VNe1BRsQ+ruLOz?=
 =?us-ascii?Q?+I142bVaOi31JX4ZZfGFx1fwTUoM8esgWg/H2lvwzHd5ewSsEs3o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154fa25c-357c-4588-9891-08df0f5272dd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:44:50.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzYEWIPsuuNPUFJzNOjc7AVB0lNLYU5Kg6ncrTvSNgywuX/uoU3Cbbe2VswqHykfX2vJs3WbCLJ+/xdhfji0tfJf0Bfr+fsDf0UrksJiBUe79U1PxDK3mirjlTax2ifT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

On Thu, Sep 10, 2026 at 12:36:45PM +0100, Conor Dooley wrote:
> On Wed, Sep 09, 2026 at 11:21:41AM -0500, Frank Li wrote:
> > On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> > > On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > > IP. Describe them with two boolean properties.
> > > >
> > > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > > capable design is always IBI capable as well. Both events are reported
> > > > through the controller interrupt, which is therefore required whenever
> > > > the capability is present.
> > > >
> > > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > > ---
> > > > Changes in V3:
> > > > - Move in-band-interrupt-capable and hot-join-capable into the common
> > > >   i3c.yaml schema and drop the xlnx, prefix.
> > > > - Keep dependencies in the AMD binding.
> > > > - Update the commit description accordingly.
> > > > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> > > >   binding [1].
> > > >   That Acked-by is not carried here: the names lost the vendor prefix
> > > >   and the definitions moved to i3c.yaml after Frank Li's comment.
> > > >   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
> > >
> > > I disagree with Frank. These properties make sense for Xilinx because it
> > > is an FPGA IP and synthesis options impact this. For other devices, this
> > > should be determined from the compatible.
> > > Please revert to how things were done in v2, especially as no rationale
> > > was provided for why these should be common.
> >
> > It is common problems, when IP intergrate by SOC, which may defeature some
> > part, It is not appeared now just because IBI and HJ have not enabled
> > widely.
> >
> > IBI and HJ is optional features of I3C. Ideally it should be indicated by
> > some registers. But not all vendor implement provide this CAP registers.
> >
> > IBI and HJ depend on some slow clocks, which monitor SDA line change.
> > Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
> > use seperate IRQ line, but these irq line may not connect of difference
> > instances.
>
> All of this should be able to be dealt with by appropriate use of
> specific compatibles.

I understand compatible can cover most cases. Need variance for property.

>
> > like previous SPI vendor customized property, we takes efforts to convert
> > to common one and also meet back compatiblity problem at convert. I don't
> > want to do it again. This kind property is most likely as below.
>
> What SPI controller specific properties are you talking about here?
> There are relatively few properties in spi-controller.yaml, and none of
> them deal with these kinds of capabilities.

num-cs vs fsl,espi-num-chipselects. Total number CS of IP is fixed, but
some instances have not route all CS to pad.

>
> >
> > default: 	decide by comaptible string or hardware cap
> > force-disabled: force disable for some reason, like, miss connect irq line
> > or missed some clock, or IP bugs, or board desgin's some level shift chip
> > broken IBI/HJ timing requirements.
>
> Of these, only the last would be a valid reason for having a property
> for it. Missing interrupts, clocks or IP bugs should all be dealt with
> using device specific compatibles.
> If board wiring causes the breakage, the property may be more
> appropriate at the i3c device level rather than the controller given
> that wiring to some devices on the bus may not have the problems?

I3C.yaml is for both master controller and devices now. I3C is bus, which
connect many devices, if wiring issue, whole bus can't support IBI. And
if any broken devices happen at address arbitation, whole bus can't support
IBI.

at beging, I suggest 3 state,

[default, enable, disable], but now I think IBI_broken, HJ_broken is more
reasonable to disable it, default value should be set by compatible
string or DCR of I3C regiser.

And some I3C device may be failure to work with IBI even DCR of I3C register
show it support IBI.

I don't want to appear two similar property between vendor and common, like
num-cs vs fsl,espi-num-chipselects.

such as IBI-broken can be used for controller and devices case.

> That said, I think that problem should be dealt with when it arises,
> rather than starting a trend of adding capabilities properties at the
> controller level when I am not convinced that there's going to be other
> users in the same vein.

Understand, I3C is realtive new protocal. 'IBI-broken' is more easy
understand,  logically equial to in-band-interrupt-capable.

Frank

>
> Thanks,
> Conor.
>
>
> >
> > Frank
> >
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > > >
> > > > Changes in V2:
> > > > - Rename the properties to "xlnx,in-band-interrupt-capable" and
> > > >   "xlnx,hot-join-capable", and expand their descriptions.
> > > > - Express the interrupt requirement with dependencies: instead of an
> > > >   allOf/if-then clause.
> > > > ---
> > > >  Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++++
> > > >  .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
> > > >  2 files changed, 21 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > > index e25fa72fd7857..7430394cc6b9b 100644
> > > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > > @@ -61,6 +61,21 @@ properties:
> > > >        Indicates that the system is accessible via this bus as an endpoint for
> > > >        MCTP over I3C transport.
> > > >
> > > > +  in-band-interrupt-capable:
> > > > +    type: boolean
> > > > +    description:
> > > > +      The controller supports In-Band Interrupts. A target can request
> > > > +      attention on SDA/SCL by driving its dynamic address during bus
> > > > +      arbitration, instead of using a dedicated side-band interrupt line.
> > > > +
> > > > +  hot-join-capable:
> > > > +    type: boolean
> > > > +    description:
> > > > +      The controller supports Hot-Join. A target attached or powered up
> > > > +      after the bus is already running can announce itself using the
> > > > +      reserved Hot-Join address so the controller can assign it a dynamic
> > > > +      address.
> > > > +
> > > >  required:
> > > >    - "#address-cells"
> > > >    - "#size-cells"
> > > > diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > > index 2caa245a86568..9480de3fe8e1d 100644
> > > > --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > > +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > > @@ -37,6 +37,10 @@ required:
> > > >    - reg
> > > >    - clocks
> > > >
> > > > +dependentRequired:
> > > > +  hot-join-capable: [ in-band-interrupt-capable ]
> > > > +  in-band-interrupt-capable: [ interrupts ]
> > > > +
> > > >  allOf:
> > > >    - $ref: i3c.yaml#
> > > >
> > > > @@ -54,5 +58,7 @@ examples:
> > > >          interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > > >          #address-cells = <3>;
> > > >          #size-cells = <0>;
> > > > +        hot-join-capable;
> > > > +        in-band-interrupt-capable;
> > > >      };
> > > >  ...
> > > > --
> > > > 2.34.1
> > > >
> >
> >


