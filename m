Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794188369;
	b=vOhHzaTlKVHPnXzGe045vU+BqLQAhGzoBFLK/61rABI1fMsVXcbvL8ogMU3b+dbQl6Xl
	 1BJBHHuh6E+lJGb86ofBbBskberNsxtAUM5UZ3V8YLCR/iIhPa1YqyqnFaGngnIB+WMz0
	 LYwbbleGIoZn2DXe4Q8NR0uR6YwXXn52vK/DHbiLcAAbfLlZi3qCDIPrg1+L50Ukj+pDY
	 MrMnPGoLH4GGZwaOwTUcj9KCX2Sh4EQF03ArsdM1H9I9j2ZFfXWGWEVQje5RGCMJpjB2K
	 ionlY1D/+RzUPtKF41vKYZp1smU+KF50LM1vEj46WZGnonIoboS65xbz02OHdS+zGaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188369;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UK8FFw6cKcrOdzxm8cDlsKuP7lRmUbXTtYWqhin0FUg=;
	b=4NkrXzEicT4Q6WIROJxr2/+0KJu3v/NgLJKVGSsE8oS4zxhA+v2hD5E+ZVZLua7k2QIv
	 efHBsNe0U4plttS28XBooz7UvE+xdZmpC/72Tfpmg7wN2QcTPmmyNJYZ2hSMVgN+t8pS/
	 hhDGCy4AmsQTfS0SsOOLAN9jIJrtAoGHwa9JQu9F4/5yQw6eXaLk/tRH6dLG+2ILCqRgL
	 b5x0SlR2NeOsFivbxamUnQKxR8On41hBsTMBiT6F8w1FaK+5bYQqUkz0E99N7hn1e0zB0
	 PQLAeRdEMsBRfOS5qDRCrL+Eb2Am/YcklUQGXba5xhX8OAU0gfa1Vw0e6FZJJFeUgpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ckv6NKQK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.40
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55C606A31C;
	Mon,  9 Nov 2026 01:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A55C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ckv6NKQK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQi+QFxNRy38ZdvJVLzm4bG42PN21BGzdvDJXf/Liv6momyA8+N4EDuv01A4WvO5HhmL+n6OaT3RTRId5UiMFVB64oNwyXFwtwn9Ffsj8xp006u8cxTVQv9spq4KuOcULmSMjEOJGaZwI4R3kFFGP8AWkM4FliniHarlOFg4t/5qryCgBGIC1r7pdydrj229RaOHJdhdcqoqhnigPowSI/cos1s0zvdO0mLqGjvsZFH7mDURSgvTKpvYwsmRMnt1V/4XSu4CjciLoOYH4zpkFmc99xxqre3gkl4XRJVB+Fq0yhzPym+R3niETBz0raGBfzjMoFp5/wwoW2HZ9KVS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UK8FFw6cKcrOdzxm8cDlsKuP7lRmUbXTtYWqhin0FUg=;
 b=DCpta/1vYdiBxdXqIDgNmSGbQH4gSBDf0XYFWt9WMzjVOwrF5hc3DAQcIhxAwlGw0BALAmqa6C/LO0tqjs6enpMRFlnuLYpiP9DSpD4xs+LMJ61odPpACkFo/0RnVkOIEoNKdKgVoBVZ0GnwaMpz6v9y6U2hA5Marngy0/H6IQW7eu/qXkl1GiRcgxvO+W+8p8Cb1q3Rz8QAmC1H81rvy2bxvvYPAC3enrkXIx0GvoYw2mysIPc0RCIvsJpmSmcTkds7+jXwcBqxGl2fHrICpkH9/0hJzWwd9vP8nWKuyWYOCarw/SNpJ36wTrf7qVRS/KJivC8FQBA1S7jBDpn26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK8FFw6cKcrOdzxm8cDlsKuP7lRmUbXTtYWqhin0FUg=;
 b=Ckv6NKQKTWlXWZ0gr8mXisrV2lzalpdMkYP+yITUQeFbU5OrbQxr12FF/KYJc7nlrQHmXnhTJECOaxdgB1QxQ7pOZvJm3ydrnXXsmeptZAMhZrsXRtjZKqs95h6M9yTEFSgglAdZ70ZQhWoAl7SW/h6A1ZEV1RdSn8nGWRRK2iM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB17980.jpnprd01.prod.outlook.com (2603:1096:604:474::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 01:39:25 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 01:39:24 +0000
Message-ID: <87y0b2pyus.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Frank.Li@oss.nxp.com
Cc: Martin =?ISO-8859-2?Q?Povi=B9er?= <povik+lin@cutebit.org>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Shengjiu Wang
 <shengjiu.wang@gmail.com>,	Xiubo Li <Xiubo.Lee@gmail.com>,	Fabio Estevam
 <festevam@gmail.com>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Magnus Damm
 <magnus.damm@gmail.com>,	Sen Wang <sen@ti.com>,	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,	linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev,	vkoul@kernel.org,	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/4] ASoC: renesas: rcar: Use dmaengine_get_dma_device() instead of chan->device->dev
In-Reply-To: <20261106-dma_sound_cleanup-v1-3-5eb8a7b81e87@nxp.com>
References: <20261106-dma_sound_cleanup-v1-0-5eb8a7b81e87@nxp.com>
	<20261106-dma_sound_cleanup-v1-3-5eb8a7b81e87@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Nov 2026 01:39:23 +0000
X-ClientProxiedBy: OSTPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:604:220::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB17980:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d556a8-6ca7-448a-89ca-08df3e0248ec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|52116014|366016|38350700014|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qcgkK1A/WkrnLalyxKKgpYs1xlSc7iS74XzFDLq5pWLJWC/tjPvMtJkNkDoL5Q3VgJx3OIV6/wrC+u6XZjRtbeZ7bTmSj9t6Nue2QmbVBJ0ijlzDe70ad43PpdKzeYxTjtwTXxCktqGpnsO/J7uCnCG+d/DDgHA3Pk205h/JvRtOq5wR+5NTjJ2vG1OcC/iajHEWtY365RGKp6gifEHfygEXPXWf+PThpF679vInkiTW6wrN8gAf5HL/DkVx9wQx4fTrcLykN/AYtdvkrnBTNb3wz2jsG7VMLIn5JpW2d7HoamGbb+3oDLAYJDYbHmpD87Byp5shsmuRHoPu8i+B8B3jtIRPpOZ21w6qFVyFu5Zv4LgxcVySoTMstAzDS/R6YXaIrETXiUMJM0TFl84GM7ZOs9qmmVWHVowaOkL4EnOH/8ZKCrcrP+N/t1iRazJIlhIzQ3Oe85gaL6onzvYo1P7GmhAk5A/UlrzkpKsOonzk0cSIDL5UW7PMOmn80/sTs4hzb9rxLPXVrt+c62kSQWTJWzX/Blqv4/A0q40D1I1FnRiS8z7eCLgjh481V0Kcgxpx9/BX9U0GXPE4AfvBJ97ZZUobPqo0qa2H7Jv2HWQXD3HvS6MEfWaTc7Yq0K7Xx5rEI9f+aLYIwJwnhZfk60ZAbFMgCJWydbh/MEK3O6ypPSYdtKVupEJMSjt28X5Yedj1gAtv5KhYy5r5XSHCJ+QiR/Fr9acK424naNkzuXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(52116014)(366016)(38350700014)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjZ38FYQ5X4mm1gbEnCW2iXPXtreeX7sR2Jy9jr5hDuNY1S35oPTiLVgWBF8?=
 =?us-ascii?Q?Gs5KXX15afi+UlJJZfeAEkwLqtzSSv7U0zMcbQ7IapNSumBbcY71BftcIown?=
 =?us-ascii?Q?3O96pzfXp4T3pLDmxm01qZyABhhraE7DZ6ktws/PAOZlRUKr0RA4DFBejd/o?=
 =?us-ascii?Q?p722djVPogg4iAbSIGaD3r4GOq2rHqsBBrLm7OCJJ7+fEc/bg+JhT+pmXlKm?=
 =?us-ascii?Q?WOVi92vo2dIPDw8OBYxzJ52kA38dNczl7V2eFDkeiepHjI8jcqVF9FK2/nj4?=
 =?us-ascii?Q?cW3peZHa7xQZQ65d7KfFNzjx7qMSe4jYgUEFN3CCH3crMj7IY3IZBYh+JMO7?=
 =?us-ascii?Q?1w/+PWVBEZIKi04vTJkCZF5kUjDoDHMQzmfxg3471eQ1diSqxQIS/NgmzVoj?=
 =?us-ascii?Q?nRN75tUWyN3n/7IfH6VGdeJ9T/jwBWlUDUDQ57XWF8Npe1yeiYvZTpK92+1h?=
 =?us-ascii?Q?waN27jlB/IsO+cD7hmjRrPWWy+SCASLEg5cQtzaelt6o1twB4NczFTRn9Ky+?=
 =?us-ascii?Q?qCnMSK0wrLnZnyNu9EbeJpKCzKk2UgJvlpXXiDDG+xPHT6RixkkbcSmxmMJn?=
 =?us-ascii?Q?SwoUIaDTI7LY1lJ8TAN3jRlih2ja5coylo4FUhoECZJ+YGVbhiFSn0DpbZZQ?=
 =?us-ascii?Q?1ychgImulMH5agAr4SnYZXi8Xl01piASUE8DNxtm5f5osM46Sr6a+R0SbKFQ?=
 =?us-ascii?Q?PGZsGE+3PXMUnqqYKTiYsEJGINo+JFgLUioJ/Cc0KD4zIfi3C5Y0ZFR6ZUyv?=
 =?us-ascii?Q?mugKxwvmFv0igghuk7kAmBuCrpq9ouFWceeG2Dj7KPDu6ncc6CcIRxBHVz3f?=
 =?us-ascii?Q?EUDysOeAEJqyWvScSuqvlwayGPKdQsYouz9lDuS0DNza+Vv5ktdiUAVyoKe/?=
 =?us-ascii?Q?WQ3/Q0Ly4jX2kSCcVjAg2Bdhy+9i0U8dXy2M6duzRhnRLLxHVvugiH3EQ26b?=
 =?us-ascii?Q?ZzAL92B9Leu8NWMtsqgpG49cQuiC1TuzuzL68xqWJTxJYV0ICQrsgVeKlNaO?=
 =?us-ascii?Q?jzSkoc69wEFUKIKFTYbwm0hb7a64spsbQzNjeGY8y6KiooHAMm9HBiL2qce9?=
 =?us-ascii?Q?5AVkJ87cQ1xgb17JMwYxHtFkPPxjTVC1fVi4cgN3IIrn2wRc+P8r09KRQh8G?=
 =?us-ascii?Q?1nIyvE280N+wCbUstcw6mDQvl8ZvTMyGKtZVZgSXouTuqn7U8VbjE13KaBPL?=
 =?us-ascii?Q?0Zm0hpG2IMoxHdQAR1lQRSyaeopYJhHPVI+mwiKgLzCCQPImFRcCojn1Vnfd?=
 =?us-ascii?Q?lb0WuHmg4SzSnTgWXEN6VlGYyNmwhNk8bPcsc7LiP7YzseqTep1Jo6o+jZg7?=
 =?us-ascii?Q?FBX1fy+jZYhHoVD3tcisqZTE4oTZVq+kGTrqJXYef9XanUinJeZSdw/rXbML?=
 =?us-ascii?Q?adr88fFIkUCyLHPp3aOyqCEk4DC4B/FeCiiynXL2nWhRRXWcMXPFuXtUBiaN?=
 =?us-ascii?Q?FwShyyVaw2C9YrBQDAFiRLmnW1na3jBir74pWXiy+1bnZJvheC6Ene7gBGrv?=
 =?us-ascii?Q?o9M9vEScR41qoQwadyUFFyqKvptf2Syjd4YmljavdnTuFUHsA9x7kdron2nL?=
 =?us-ascii?Q?z1oWklt0LXNX/JL3tVFyh9Wsyv+2DPlSzaT27vFpzZmpylgEzE6SRK2z4D68?=
 =?us-ascii?Q?XhnwSVoL59b0IYL7bitTH92pKsaInpz71r81iYqgqbtFnXO2yB8k5UHTeZf3?=
 =?us-ascii?Q?ee6aohDIWLH5iiRXDJajajg52pyDDl9oU8f3V4UJqDM14I1kN3QiIP05PxCM?=
 =?us-ascii?Q?l47g3ugju1wCvBpHQMvhptlyDEtCQUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d556a8-6ca7-448a-89ca-08df3e0248ec
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 01:39:24.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktcFgn7IbTYBB2t3TuNy3hiCNxsaMx54oNsU+yfHoSoL5Zwx8Hn7+nyg180WsjDDWF+VsbjegUCagFV+ozrILOhBSyyq6pD4u0+z7juzNbKIRHUvlmIACFsR+4UMbIfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17980


Hi

> Replace open-coded chan->device->dev with the accessor
> dmaengine_get_dma_device() to avoid direct access to DMA engine
> internals.
> 
> Prepare to make struct dma_device private.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
