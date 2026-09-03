Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFD3ED3C9;
	Thu,  3 Sep 2026 19:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462968; cv=fail; b=kUrcSU26HBVrG3kB3tbU8xnhCTp1+ovkdsdgTK+KT52RygVGw7+AJ8jol9ExMzbYi38J0e67cxK78xPeLpj0TaTqE7wgRe4ITrBpyN4pSgFKGocjzI8D9XMmB1QJT0a8sE3Q8Xp29m5SpnA91yzi4qGKkuhmKjl9qnGmLXM19FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462968; c=relaxed/simple;
	bh=8X6ifiqp18CWtVQemr/RM2SsA4o/uz63N+rqVQdLIaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dYkbw9H7VKoJ6ElFUbEJLCwFi19MVzG4e7OHK+CcL8KH2D62ic7M9fJk4aTsc5I4jQ6ZW/G/mSPB+kAQOx4RZduMJtqk9kT8RRPYnP7JEhlj4Qq5wpl0Fhi5vmAqrbEcWKZkgKT0E1pOhKwzOx2nvqPxXXoJi9iLIKYn6q/0VZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u7VnR3oY; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u7VnR3oY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXvkpHrqU7FLJl/4xPRxSVNXtJwJfnFmc5gxhk7zhKeEr9i9CZ7bFg32aQjhuTlXpwY2/hWM4TtV/Yd36p8sQPK0062oSG5Hpo2l6z8LcO1fI5GAYBeFGwuzuAVH/WWakx6279hb4OViH/gkrLyLk5yucquzRUaj3FZ4pJxwLaLGcNuxcwE3WySYReLNE+4cFlf5/1vVNbKt685FesapEUPvWgKFYii6ENXxDVPIl4TPM7BHv1O1CvUgraD0gk7xjSKXgm0lToPyqKdsqqMKZvCxqk5TqjwuZ4FHR30wSk20opLVBUtAesiD0cR4XwZCFPCSKvAdMtswnAX1O0Betw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERdfnvlsZ2uAY21MZPVAdb2tD859PLrPypLLWcPFIcs=;
 b=hIBhmlilOTdODZOk4P5d64Buvx30lXye39qDha4hm7Sot6I6qe7HPVlj5HamU+h6dWjnd77TXs6tbonX412UHjDwZvW172UOS0cKAA6MRJwIT0yNKPFVcfAEL04/9dyF4G7mgcmFmEXBEMuAXXG/+v+ZBbX518pC+c0dQm9xY2Bk0k2fDXKLsdcXQgQqCQrqCkCTox7diRojHk1SewzjSuO/jTkfqYup3VCMgdbBU7DsgDjg+aLVlFc/M5qfASOmzsElltB7/gdFpYpo6W4taY9oUHD9XT/QRrfnLgL0hFb5UzuHa63anDsRFP7e74+rDNkNS+qBhIqBEH+q8MnaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERdfnvlsZ2uAY21MZPVAdb2tD859PLrPypLLWcPFIcs=;
 b=u7VnR3oYxJX0UU3jn17i7wmt0HHxJ2jhF6SVTal1x+Dr6qQqLcoGmuCY9Y/ocxBJYhSjnnwAnpg0db5B/L7imzMMmPpANXhshROBFk/qvQppVnu0li0wQssrZge4DX24Md72MvdhS14FomAoRiE3uGu/8JipiIDeD5laAbvQybCaOv11rUdOAHlP6tpULXjxgEqoTopSte87pg6BOgY0rf9ydcbgw/EZCHW9fuDdtDT0CBJFa/lyeH21CbnC7NfYEho+fQT9b0NeZXzmHZQb1NDSBfA2l27X2FjiR5gzTv2AZVKmt7sNb+fLMDCqRN/jh6rO0Ek6cut1MSN+o2I8cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12111.eurprd04.prod.outlook.com (2603:10a6:10:63e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:15:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:15:47 +0000
Date: Thu, 3 Sep 2026 14:15:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <apnHWWJ5a-gAGQUq@SMW015318>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260903-succinct-military-macaw-9e6e71@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-succinct-military-macaw-9e6e71@quoll>
X-ClientProxiedBy: PH8PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: c0036c97-fc42-45c8-d527-08df09efc216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|4143699003|3023799007|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	BsbgfSDbCBWfsbh9f4ZREIObliWiyC+y4EsLeveu5mGSEk+psIHRWVJZlIdajHkS8RX6Ly6HOlhyMS/0zvmvl42HXUSbA0GgafmuLqiikevO5ITSI7PmE9p3406M5n38KXuqNeU1WjxPXfhn7Dao5r53fWNj16wFdOWNOgDRGFwFYINNDguQfgLHMbizx0UGhS+YKLyUfx69LXww6aK+58S7facpWD8Ta1xeOepxrFIAH7CFuyGtsudUFJlmz344yl0GAmEWKM1Xqr8B+t4b9J1yXVX4kFjf6SnLToCI/DzmK5fBWHS+j0JaWQFLPpuayDtqtIUfCA3EU+UVB6GdMGrDkei1iOX6bTI1ixLuT9fPFLjR6LtJ6vz3jWsFAxWLN3Q1X7xHeQzVkb55rcIEnRsgnfFViXTgezjzGQ7n5GFQ21YFSXVnmmNf7UNwrcM8pdUx2YXYYhVpB8158a3+sB5m7x1nFbu9JEfl7mZYJsbSMMBBOX/vAnE3Oexo0GutK78Pe0DVGt3w8jHbU3mcVdA7jxTTja6rpy/0VuBkxiTYzDTKAkHteALLhnR0FOU6wz/iEpECflAne7kMDli2JIQG+/yGPSdgvIZVG3+4h+MPqwRv199dEQY2e3nbg5mI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(4143699003)(3023799007)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVjRvOFQ51WSnGuqAJx5yQiFUPw82xtw7oePi6myI+H7SOSW521pU5zEOOCM?=
 =?us-ascii?Q?GM3HrKnWEz3rt1NV3lcpMgw/pjptkT3YQkUXeS9DnkJhrQUQFVpKWZQtrVIY?=
 =?us-ascii?Q?ridUpErxB3uuwP+YzvPV9VzyyWz9TWeLc/8vTnZGI4Bq/iFLcBJ6c1chRbCP?=
 =?us-ascii?Q?CqyausB3e3iwXB4xLyDMv/G1OBDNQJbcbcYudMA2oPVcqsbQFGEOwexjnVZC?=
 =?us-ascii?Q?7s8YPV1/a6ctijHvnhSq98neL3QfdZA5Q5L6bgQAFHM36+lZ76pD4ok3Xe1Y?=
 =?us-ascii?Q?dsOdzH8d812m5fK7qfxIy7KPgcL5KfDCuDItQ33GK3iX/MJ65+OHpwhGuufG?=
 =?us-ascii?Q?YZ0r1JifqlzOi29aJOG5SjjVQG+Rjfda1CjO7USBCfRp2/f9FMbqzSec8UmI?=
 =?us-ascii?Q?zG1Oqa4mAS0VuBA5PUbydUbzBvBpgPqb3kdr8msrjt/iNC7qL9rRWHksQZI5?=
 =?us-ascii?Q?4AlgqzWwG3xBdLO7VQzAsvWcAjTj6/MQOjmu9IIS1LcHaTu9oDV5OVD2BAzf?=
 =?us-ascii?Q?evg+aMUTBHXOAEBXjSO2kIYgpxnfGffji+iUW2YSOHbsDZDIDCZmx1Iu47/r?=
 =?us-ascii?Q?2M31M7B267eZZm+1VtWSNi4qu3rMzxwk9Y84STk1CoshlJ5ghLUMclSNyq1z?=
 =?us-ascii?Q?zylVE+8/XRJJByODtsKn1ZR1T6vN8nhhKzCrQXWxw1j73MTW0pyHqjm8HgCD?=
 =?us-ascii?Q?DhedTYp6xAw/RHrqR6rsarUZR9V+OPlezcuPm7WvFNoZA6I4Xd3RPtWNNZhb?=
 =?us-ascii?Q?w9/F7c8sbAkDAXuEcAa4gMRAW875pIMDE5A5obSxRzTg5ns10Y2o/X2YVnvY?=
 =?us-ascii?Q?WMKHMMgxebN3B1V6EDXd/MwM3pgVXXApL6AVm4BMFPHM/9P5AZW1o9St6t8/?=
 =?us-ascii?Q?/iepaQQSsGc/NHF242JHkzGHzYLv7FG5/KfeD9a3rg0ZR/nh95qsatse0zg4?=
 =?us-ascii?Q?f4DJiOHDwnDQKCVI7gh+koppYUlQ7ofN0QAEsZqIwRhOcGuYXW3SDcs+8rqv?=
 =?us-ascii?Q?8mTPodk1Zsme01Xpr4/FqZ58nCGm29pY2JdK2BCs069omwOAQyKsHgHxlV25?=
 =?us-ascii?Q?e7RTkycQUVsq88wkngY0n0vye/42T6JVY5qoA3SK+a6/ORz/s08NeMFqic/8?=
 =?us-ascii?Q?LExbFGdyqpI7fSZ8S5Zy3E8G3lHqIxjLku/GEMpeeFtHZ5OtLzhdW5YiHxl6?=
 =?us-ascii?Q?LiH3F5kBFeoQAhb6ufeNnXReNWTtdtKzyXBO0rj/vdCRJKoMcMzCAMepnFE9?=
 =?us-ascii?Q?QMqsSLDzpiuiQjUFdb8r4IJFGVWO3Qq1QFznQGRkk23GYyK1DyLpi2u9yiPA?=
 =?us-ascii?Q?CiQUVWUfkS0CyMTQIqJ/i2fqdkBJ3jffoQlMBB7SZ3YDBrnlygFcyCUiPFHF?=
 =?us-ascii?Q?VDW61dpQ7YmDSSxC6FvdXUOZTF8hDzO609U+fX5ltJjUq5n7/1jufuHD+5Wh?=
 =?us-ascii?Q?8GflUiQZtdCgMK21qGOgc8igdw++7SO/czt+vFsFlex4nDXbpFm5f6U9g7iJ?=
 =?us-ascii?Q?VPo2BBwnMa1L9wW4R9X8J6xzOsHGSpHp3qWP88L2I5lWmsri8sF+yzEoey35?=
 =?us-ascii?Q?R+DbefRm4HqeHijuR4aa+zKod/XceE3i+bnbp+pMQFXFtbyvA23PTVi5kgMP?=
 =?us-ascii?Q?nnLAhe0UE0fen83wm2ivcQV/4UUwylGVSfs+TWPAVngd33cM2qFevwpRbUi7?=
 =?us-ascii?Q?8UyIalrZWdFFDMz2zEaOjqm10rFkf9yvPsw7sBHxCrBRbHcTuZm7UNqr4PrZ?=
 =?us-ascii?Q?1FGSGgWQJTCghgKCfkSVwv4n8wskvHHmhUaT/I27IDTBy9vfkmAH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0036c97-fc42-45c8-d527-08df09efc216
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:15:47.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itpqslkZheUUqtPX5KDgNBd5vTyCQOuxx7T3O8qTL7dpRxyCSoVgPQdqggNy9r8ckXRgP3LhfMGGXD4kQRlpGYqE3X0mggovVZsxEhf9sf8YpQXA1YwlgKA2j1fXPo8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12111

On Thu, Sep 03, 2026 at 12:04:42PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 06:00:31PM +0100, Conor Dooley wrote:
> > On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > > years) check_dtbs warnings:
> > >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> > >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Previous try drop dlg,da9052 at
> > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > >
> > > but Krzy have concern about compablity.
> > >
> > > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > >
> > > Conor prefer update old dts.
> >
> > I don't think these devices are actually compatible, so this fallback
> > would be wrong.
> > The data comes from the match data, be that spi or i2c, and there's
> > explicitly different behaviour for the da9052 and da9053aa.
>
> Maybe I looked at wrong driver, where is the difference? I made a very
> quick glance and I found the only difference in da9052_i2c_fix():
>
>  59         switch (da9052->chip_id) {
>  60         case DA9052:
>  61         case DA9053_AA:
>  62         case DA9053_BA:
>  63         case DA9053_BB:
>
> No differences in "da9052-core.c" and SPI, while looking for these
> device type enum values.

It is mfd, probe child device, like da9052-regulator.c

DA9052 vs DA9053-AA Differences (from da9052-regulator.c)
1. BUCK4 Voltage Range (only regulator table difference)
		DA9052 BUCK4	DA9053-AA BUCK4
Min voltage	1800 mV		950 mV
Max voltage	3600 mV		2525 mV
Step size	50 mV		25 mV

DA9052 BUCK4 also has a non-linear voltage mapping above 3V (step increases
to 100 mV for selector >= 24). DA9053-AA BUCK4 has no such special mapping.

2. BUCK Current Limits
Level	DA9052 (all BUCKs)	DA9053-AA BUCK1		DA9053-AA BUCK2/3/4
0	700 mA			1600 mA			800 mA
1	800 mA			2000 mA			1000 mA
2	1000 mA			2400 mA			1200 mA
3	1200 mA			3000 mA			1500 mA

DA9053-AA BUCK1 supports up to 3A (vs 1.2A on DA9052).

Frank

>
> > I doubt the legacy platform ever worked properly, and this is what should
> > have been explained in the PR that Krzysztof denied not just blindly
> > citing a dtbs_check problem.
>
> Well, yeah, I wanted an accurate reason with actual analysis, not
> necessarily making devices compatible if they are not.
>
> >
> > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Best regards,
> Krzysztof
>
