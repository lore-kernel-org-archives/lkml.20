Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792594579;
	b=lyFjrFmhs3HiFSFUZ3pgu3Vt1hFtSRmVNGxF14J6Mch/aPvOG8lmB8PWhz7AJZK2ZiHc
	 oLE7ezgJamfBiWNz/Z92BmsuvcnvXE8XeRo3gvwLxSQqUGy59FXKqqrXYCmyKRx3NqmK8
	 mzf+2RNYG54OZnZRx1vGsnIhIViJMxBJYGhOj1jD+oKQiPQqH39tgS+TwjRXev/jczmrx
	 1RNo2xdJLMSRb1uZnVQD2BRvjFcmeLfn8MImAIdpIn+1VbiCP3to2wTBylC0/GnUxliep
	 uNM0y5eqs1TsEodSDfEzNLxJY4uaY3OSmIzSTOMAjuQdqobucPjselL2em7o0YOk6oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594579;
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
	bh=IdAL/YjEfxfTzIMDorklJXWKOEh6Ee/0BL1CYebq/G4=;
	b=PvZ1Q2yys6LIgTS7l1xQ1+AynCbHTta4l8TSZs9lTPgitCaJ3h4ZpgLPxXt2oEVDztYe
	 1oWynarcMf6HuAdFgfeMwUSQTyTu8OtaoxCmBTAAkzKn8DqV8qLn+qjtWS3OMNxuja+mH
	 aKjoaC/I6HB/amkBjKATVdGnEwMjKPw4R6NwgkPl1kbiwSr6CdtKPOxx0tdaoF5AOph/A
	 trHv/O6e01st0gWV71TCjZfVgPjnHYvW75iAaxLF3K4oe1on5J60N8TLbnC8tarChohPs
	 5vLf8anAPtF4tEnOLKXwQWnrhwwx8yfCO3nwGUZ+vlM5E7JnVs9KzkhKdaqhanbv49g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ap3yGvVY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.35
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F94606A31B;
	Wed, 21 Oct 2026 14:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F94606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ap3yGvVY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8ncPU2L1jGg9ROrdlTYv7b65oHBxx9WUGQADHUYw0b8KEfu8HNjtz5kD1/tE+o/Fdi6aD/cJiBHNpsnmXr7BRMvcKsZ7k7627txqLFX9xG73KH7Co8jz45u88cW/ijWkxKX1vOFapIPrDX6GhXH1BRiYkJ19yHBSx9baKYnlvQq+b5J3leybjJZrZTu03YiXglm8j33VpzxfhvodybGcJQyuesXPZNHmooer+RrR/YtDxcYn/U3QXmUPJRzOD+AW8tHL2Wu5m79HYHZMEgR8qij3O8o2BG/X+prMomLggbvWgvebdo4n8zB5r0xZCnaBOtZo3xkprXoSuIe0FJE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdAL/YjEfxfTzIMDorklJXWKOEh6Ee/0BL1CYebq/G4=;
 b=B1rKtu56XHCa4HTwQj3HRRpl10bixxYIPbPzh64ekeXm4EeYReOmFjVw9MRmYC/WQFK9wTnsyl10KbsFj1lcW0JxTU3Ncv3RvMQ7DD0otKNwADHhZvGCwYdIk+GNk335wEnjzqOR9nCNf7NWN0ztSvufkqDhVjVin+s+KtF3xoRnQttoclmPkd7oxsv1PAOPLKnHCQRsg2DOIFQ7+PDjI3rNOPZJnrPqKjzdhFqOlQtrrHjGCK3pnIZpPI60HEr9YEh2dQgXecoZwaRMFVyPYdEgHeZyfxZBEKYPtiA1l+i1ZjQ+Cm5YGM13/kbDDmr1RVYn4nrp0q9jlxnu/jDTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdAL/YjEfxfTzIMDorklJXWKOEh6Ee/0BL1CYebq/G4=;
 b=Ap3yGvVYFyRfg/JF0GF60b7knrGsTxTsDej3XO5s2tTpgPXHNK/xg37CQUOJv5b26YjGe7xJ18wpE6uwv+urerO3o8dyJhQvD6kpvYnS+zCbMSRI0Yq5FlNU1G8KD8OOvM2RqdHDYMkt2cs65RJdgKTUBcUT3a/Q/OF32bz7JN+WuUtqYZeCbPJ6ejuR24m/KUOKcULpxapX1lt07n2vjUyXyaqQ1pzgWU7ssALDBwxCSIOChpUoAzAvLoYOuD3tilGzRhljOfISCNR1HU26Lj3m5oMDItwMv/F7yMcSOQGjyC+YIbobdNY39JaLup2njxmXF+hmAG9J5sr8D7OU9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV4PR04MB11729.eurprd04.prod.outlook.com (2603:10a6:150:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 14:56:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:56:14 +0000
Date: Wed, 21 Oct 2026 09:56:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ernest.vanhoecke@toradex.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <atjShkhCdLzf921d@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t77enz5e4sywcigwdjwpes66jywhtsruzrtf7opde2umfuaock@3aouga4ng3gc>
X-ClientProxiedBy: SA1P222CA0170.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV4PR04MB11729:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c75ee4-87fa-4f73-6285-08df2f837407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|19092799006|366016|1800799024|4143699003|5023799004|11063799006|56012099006|261009223027099003|261009221227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	xt6NNfBSf2udV6nLj/Z2tkl2ESqfymIaVuL43+oKWLoT0589+0ztvNVdcN+obDc6nJCdwizqHlRGWUwZ4oolbANvtBHBmg10rMK9Kq7hIiW4NaYTeYxplejOMnRG1cVaO6ezSlECSh87nauE9ZcFubRS6SbD8+4GjwHfEvW7bAzU0fo9U6sq1viRVpP9ipiNF6hEwGg1ccOCh9XhpA/wbQBzLRhk6jG7XBq4dE8fwAduihfS783U6ypp3fnmjyEyvbkl1TAFxm87NTlECAZfl+XMv+7hSy/rbt5qGt8eSsitZ3afuNbUBl6ADt/wDJX7KQAr+yXdv2sVdu65uauj1C86mQ0cbrKCHiA6w+JYY9T+MqutvNCjnYHhMgkC4RN5slxfwMn7FB5csDWGShpPTOwNxcAM9CaMiL1KgbdFgflVZ5hpXUgGDnGWT1uKPGX1XM3J05eOMNf/zpnpHNRQjmYoVutf+Hse7Qeoz627JCcOqiFntsJYAoI7SfYyBWNWwF6/1UKYJPfMasYg2LpVAOyzgyKD0QtvFrU1d5RYYHQIgmldDxj6PURHylLRqBqYXKULSlCURafEVKkIOrf56J9e9ZVcXeNHD0mT9FLctGmUr8Ft1rdRJpWYOGSleJIm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(19092799006)(366016)(1800799024)(4143699003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gq1S5Aa49jOMb5EKtslEUanF/YdLJx5qXpaaHGIco1UApJ2mCH2Wn87pOvpj?=
 =?us-ascii?Q?wGB7i8hECTqDTQvhgV/beMhmCe6aMlcgusz7tF/MXkgGn86lfGsWGcsQSEk9?=
 =?us-ascii?Q?dZ8uB3xHiYqATW5TmYhiHKw40LllGQHfGjs4q/vx7CURaE2ddDN/JHcFSew6?=
 =?us-ascii?Q?RfcusYHuLcJn+cBWR/tfQI1bdIbFpI3I56/nNoJbAj2N2mc8WYcLpdGmq3WY?=
 =?us-ascii?Q?tIGZkSyrzYr8mmTGHQJzyRYZRaKtOscZSXmKyJXTv08vCGXjLUCy0Kk13PkG?=
 =?us-ascii?Q?+I/0IMkLXpof7Q1hrbLwFWLPq8G8lUMuw9XLHOEHktc5+5jRxBcjAAZGcjPE?=
 =?us-ascii?Q?6PYLIUcTaY7LVpUA7Wc3XRFShvh1PTfIrB2CJxP629qjRSTgN9gx1pQdKs42?=
 =?us-ascii?Q?+B+/FuTEE89LAUxB5Kb7imMqVxuu91c6Xb2PYETo1Kvr51CBO1+h7N4ct2kH?=
 =?us-ascii?Q?rgW2tZNE8X5nqyiyHqkyZmU2JyGRLitQGGj+vDC5oD4Wnh+ht+lVU7p0JV1B?=
 =?us-ascii?Q?LHPr/LA6c+1TBGbJR5iWYkRmp9KzWyVmouSKVpgXfSxaH8bsSEf+hpWgv3i5?=
 =?us-ascii?Q?xPvSqo5A0fik5jYVTmVq8cgNw7ODuhiEM9qAL5MntG2Pg7F08/3VUeodPLOk?=
 =?us-ascii?Q?cLQXEsp/oZkv8JRX8xeS0y+ucJEizcmV+T8vI28Rw8oD9lc8XsVWytReIoqj?=
 =?us-ascii?Q?O1nQeMEgiRFbhr2LrtPWbukCKsBm3VF6SnlD8Xtb9kYBX5poLWY9sbXmNSl+?=
 =?us-ascii?Q?vf+LcmDZgr5pidzi4E44sGGVjKhMi73lyDLnFIbU5/6NeiuTaUzpC27ZsN/l?=
 =?us-ascii?Q?h6CaJ7y38//OOOn2lqbCi9hlZhPQmluJs8k4oYs7CxfvQDlzqO6LoYDyM/7n?=
 =?us-ascii?Q?LTQLTiLAn2Rlzgv+PLLpV1DOaOZrzm2ZL4vGgdc3gfPffe1Pjd9Z6/s71zor?=
 =?us-ascii?Q?/qdkGbhWdbiJ4ekRkLYqSyR1K5QfcDTBNGHlhopNNdFkEzCuKmHiMUA/lJul?=
 =?us-ascii?Q?Y99vTQMkvn6WX9xT3SWCoBZH9mmx1bX0d20U2WxlmYdGIBibv5PP3vG+wBf7?=
 =?us-ascii?Q?n8nWLpXpohOCrEqAJHsU2HtaRr96mptBtbVwGuncvjlZcRl0/JtPKRzjAkUn?=
 =?us-ascii?Q?iUgpEmqW8bFGZjhG7qFajsCuwgbf4htxUXy+pczJVyrp6qkjQ6UQjXXFvD4V?=
 =?us-ascii?Q?VkrEqlctow6VodDRpJd5+EYat0pos/vF9gy6FQ6/eLCMC8B00fbTcNpj79DI?=
 =?us-ascii?Q?zelQrkLWzcSea2Vjvru/1bHD1BkUEBcy3RtiTiOazXTm2xQx6mspwp8Mhihr?=
 =?us-ascii?Q?v5j6ZBx/t7ygwK5JizdYtivsh0NSz+SEk7RefLUOA26DKnGYLKFV2gGlGCok?=
 =?us-ascii?Q?MkNpMQaSrlJLLwpLNV9HuCXOguv6TCzs1Zt2SkmjQly2ewIfzODrYexxDLzh?=
 =?us-ascii?Q?qSMZhOXBAclThyd58y32FePxS4pt4WdWyiYbMoHUYnNFsFxMBolFbWHDr0hf?=
 =?us-ascii?Q?FJxwHROqj3bBUDQ8+fsTi8dD/2GBy2liDrVb2NodPk82ImxbJwI0ymZzPCdR?=
 =?us-ascii?Q?I4vwCMVWwNOaILc2Tz4YFL5RE2vz+VfJqWlwWMCG7AEkHoUx/E1qU/xVD2Ec?=
 =?us-ascii?Q?jV2nFwEZyqYs15YIDXi89ZGNSN2pl8Yjf4h2dubLj1pdjMi4GCS65SvMMJpf?=
 =?us-ascii?Q?usygSZ3u/tjD7i1zpFlvI+4UFKGmzOxu1c7gwAnCP30SLRAYsHgkncXlHjBj?=
 =?us-ascii?Q?gusxgpYkxW0dNN5PMYCi/RMVwiuibbUf6/q20MhxZ9IRAIGJ78/6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c75ee4-87fa-4f73-6285-08df2f837407
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:56:14.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQOqSphsfaFb4Lwe6Ym10o8gO/iRuLzWJwGq+k/w0YcQDVZRiO3EPTLESepahJkvuZV1erFZGOI1UC6j/q7bhFhuS35BFqk8HllQHD3d+XCYdrDOpMCwQcEtKHzhpqOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11729

On Wed, Oct 21, 2026 at 07:39:36AM -0300, Leonardo Costa wrote:
> Hi Frank,
>
> On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> > On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > >
> > > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > > by an ILITEK ILI251x capacitive touch controller.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > ---
> > > >
> > > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > > >
> > > > why not share one dtso?
> > > >
> > > > Frank
> > >
> > > Hi Frank,
> > >
> > > There are two main differences:
> > >
> > > 1. The mezzanine one uses different backlight controll pins, so here we
> > > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > > in the one without the mezzanine.
> > >
> > > 2. The touchscreen GPIO and interrupt pins are also different with the
> > > mezzanine board.
> >
> >
> > And there are for imx8mm
> > https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> >
> > https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> >
> > Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> > work on optimization solution.
> >
> > If use nexus connectors, we can share one dtso now if there are not
> > clock settings.
> >
> > clock patches is close to pick up
> > https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-1-8785f9531cf0@bootlin.com/
> >
> > Frank
>
> We tried to make the change to have a single overlay for the boards with and
> without the Mezzanine. However, in the current state of nexus connectors, this
> can't be done cleanly yet. When trying to describe the hardware at the level it
> exists in, following DT guidelines, and using nexus connectors, we still need
> two separate overlays to enable the native LVDS with and without the Mezzanine,
> so we don't really reduce the maintenance effort.
>
> See the changes at the end of the email, this is the closest we got to a
> correct and clean implementation that would allow the usage of a single
> overlay.
>
> The root cause of the issue is that we need to claim pinctrl_i2s_2_d_in_gpio
> and pinctrl_i2s_2_sync_gpio for the touchscreen on the Mallow Carrier Board.
> Ideally, they would be defined in the nexus connector, as shown in the diff.
> However, after enabling the connectors in the overlay, the pinctrl groups
> remain unclaimed. The reason is that nexus connectors have no driver to claim
> the groups.
>
>     root@verdin-imx8mp-14777535:~# cat /sys/kernel/debug/pinctrl/30330000.pinctrl/pinmux-pins
>     ...
>     pin 112 (MX8MP_IOMUXC_SAI3_RXD): (MUX UNCLAIMED) (GPIO UNCLAIMED)
>     pin 113 (MX8MP_IOMUXC_SAI3_TXFS): (MUX UNCLAIMED) (GPIO UNCLAIMED)
>     ...
>
> There is nowhere else in the carrier dtsi's where the pinctrls belong.
>
> The pinctrl groups thus need to be added to the touchscreen node defined in the
> overlay. However, the pins on the Development Board (which uses the Mezzanine)
> are muxed by pinctrl_gpio2 and pinctrl_gpio3. These groups are in the SoM dtsi,
> and we cannot claim them in the overlay. Because of this, the Mezzanine needs
> a different overlay, which doesn't claim any pinctrl.

I met similar problem, see below.

>
> We like the idea of a single overlay for both carriers, but sadly the nexus
> connectors, as they currently are, are not ready to enable this. We therefore
> have to move forward normally and once connector support matures, we're happy
> to refactor this and try to reduce the amount of overlays for the Verdin iMX8MP
> and for other modules.
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> index 72a4f846d694..d73a7e9042ea 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
> @@ -4,6 +4,41 @@
>   */
>
>  / {
> +	lvds_connector: lvds-mezzanine-connector {
> +		compatible = "toradex,lvds-connector";
> +		#gpio-cells = <2>;
> +		/* LVDS_BKL_EN_CON - Verdin GPIO 4 (SODIMM 212) */
> +		gpio-map = <0 0 &gpio1 6 0>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +
> +		#pwm-cells = <3>;
> +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> +		pwm-map-mask = <0x0 0x0 0x0>;
> +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> +
> +		status = "disabled";
> +	};
> +
> +	touch_connector: touch-mezzanine-connector {
> +		compatible = "toradex,touch-connector";
> +		#gpio-cells = <2>;
> +		/* LVDS_TOUCH_RESET_CON# - Verdin GPIO_2 (SODIMM 208) */
> +		gpio-map = <0 0 &gpio1 1 0>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		/* LVDS_TOUCH_INT_CON# - Verdin GPIO_3 (SODIMM 210) */
> +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio1 5 IRQ_TYPE_EDGE_FALLING>,
> +				<0 IRQ_TYPE_EDGE_RISING &gpio1 5 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> +
> +		status = "disabled";
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X37";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> index 846b36706821..736f034c7550 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
> @@ -11,6 +11,46 @@
>  #include <dt-bindings/leds/common.h>
>
>  / {
> +	lvds_connector: lvds-connector {
> +		compatible = "toradex,lvds-connector";
> +
> +		#gpio-cells = <2>;
> +		/* LVDS_BKL_EN_CON - Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
> +		gpio-map = <0 0 &gpio5 1 0>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +
> +		#pwm-cells = <3>;
> +		/* LVDS_PWM_CON - Verdin PWM_2 (SODIMM 16) */
> +		pwm-map = <0 0 0 &pwm2 0 0 0>;
> +		pwm-map-mask = <0x0 0x0 0x0>;
> +		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
> +
> +		status = "disabled";
> +	};
> +
> +	touch_connector: touch-connector {
> +		compatible = "toradex,touch-connector";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
> +			    <&pinctrl_i2s_2_sync_gpio>;

Thank you try this method.  Can make a pre-defined label for it, such
such as touch_conn0_pinctrl_gpio0, touch_conn0_pinctrl_gpio1, ....

So touch overlay use this label directly, like other port, i2c ...

After nexus improve by support mapping pinctrl, only few line needs be
changes.

The bad things is that it need define NULL pintctrl for i2c gpio expander.

It is worth to try.

Frank

> +
> +		#gpio-cells = <2>;
> +		/* LVDS_TOUCH_RESET_CON# - Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
> +		gpio-map = <0 0 &gpio4 30 0>;
> +		gpio-map-mask = <0xffffffff 0x0>;
> +		gpio-map-pass-thru = <0x0 0xffffffff>;
> +
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		/* LVDS_TOUCH_INT_CON# - Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
> +		interrupt-map = <0 IRQ_TYPE_EDGE_FALLING &gpio4 31 IRQ_TYPE_EDGE_FALLING>,
> +				<0 IRQ_TYPE_EDGE_RISING &gpio4 31 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-map-mask = <0xffffffff 0xffffffff>;
> +
> +		status = "disabled";
> +	};
> +
>  	native-hdmi-connector {
>  		compatible = "hdmi-connector";
>  		label = "X14";
> @@ -159,6 +199,16 @@ &i2c5 {
>  	status = "okay";
>  };
>
> +&iomuxc {
> +	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
> +		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;   /* SODIMM 48 */
> +	};
> +
> +	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
> +		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;  /* SODIMM 44 */
> +	};
> +};
> +
>  &lcdif3 {
>  	status = "okay";
>  };
>
> ---
>
> Best regards,
> Leonardo
