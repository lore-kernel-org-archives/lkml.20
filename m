Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793707627;
	b=MRo9ZfZNQco42tzQBFhJn9pdD8wwEXszkBTc0k3zSTe1dRafHnBtCnlcv4BRUjCWMDdl
	 29lGOHG1H2P/OknxxCgjJ5k5MWQUXXnUQ3qEKbTLzQDNFmEMxY0BOiG8zj0eM4vMY1qvG
	 N/PWL/X+UbWSiGewYiuG8JXLFPNDqKfuRv6cayfQQ1qvBAl+D5q1JyOtFOXhF5FaFWHns
	 +mNGjfCvGbv0dCyqXFcZl0IMbMiHe1ZFd83vOZq7Qgpq3jKbIKHbe1RmWQOdypuxzOjfc
	 Bc+RVSgC3M0NbNtMXy2jR92cpui2H0zeosRMEs2TZPvKxI7ZlrLtp2EMu+mEHIPL8WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707627;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=yD8Sdm4SnB38xPtQvp5DQ0MKlLVNm2+ZTcC/POtVpUQ=;
	b=rW/jF8HHyti7WnBoW123wGTR41NInLI3nPvXKT0KQtmhBEX/klF18UpD5Yjf8iQSdljl
	 b7SpMRmGPiCb5nCk+pdyuEEnu3MLh1OPY8U7SAzrkHHNZQmhChtMvsEDs9aCl/FgdLRIl
	 WXvgZ2hPjmt2r50LUTHAxduRkHLhR23PLEv4EzwnLY7CdEJCzQKFah4l0Ljjt+bYthgUZ
	 uGt0WEmILHGkrT7UJnHjd9g+mdU7xeEbhDtbg52YA67TeQOqeUurMvrg03aKZ2c5eEY7K
	 A1gfhDjlPMxDdVHat+T6ON1BM4dMyzbXC5NDAncoK6lbQpNBatKwR6pljOYFLRDhWFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=PFsbPyV3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.56
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD4606A329;
	Tue,  3 Nov 2026 12:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DD4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=PFsbPyV3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESRW7fnxfm2oV06m6AwuD6Xi86vGfrak91nburzscIadjp2xEDxJy7MdBfCmuUlslA/RBInEMieOg0XdKgMjnjEYOIDLUq5lqR5OchYKfqAhvSyIRPuV0VXQ/5Cqqhfa7SCS47T6wRWp5PvD+mh0CxoJHNpjYQ2iGf4kmw9kAG8mRINDoBaVppXixyml2U7b+RPeDR2UfzW8EaN2b2v8BQ/tt+m+vc4cCzR4EDf47n0fKf+vBjqeUtonvQsOoJTC6lubVH4/z3wHGVlGXSE6pug+042Wm0Tc5PayiCUxl32TQUCyLSdO1gN0PZLNPQNCz6qF0YG6ERvL/ouBCBLCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD8Sdm4SnB38xPtQvp5DQ0MKlLVNm2+ZTcC/POtVpUQ=;
 b=m0rvTI79o7Cw5eYT2PlJCM7DanEY9YgVSETv4uwa16Z47uz4HFlGID3abUw952PQOEcgD2WkVUUhWQDqHCxnaLhx3arxmZPb7VoJ8pE5Q/qWh8RIxBK81ub7k0Sw4exLGJuLwjAB0K6zG7eY8VRLAr46AF3wxNycCFUPxntQMTtF/pO5GHKAJG5M+EQrCaYY4hvQI/qa0YNdduflUGh+PfsVvwfeLx13cH6STmE5ff0a1Axm1hgq6IpIiNvbTZGCqKqSOuJPP0qn8jwZL/h46zxfC7mt8dA8sJiUwq1FOWXBaMDwMpYWUdqEuE6LfVeR+3WeY6fYfayiUyyJZh+2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD8Sdm4SnB38xPtQvp5DQ0MKlLVNm2+ZTcC/POtVpUQ=;
 b=PFsbPyV30JMEaLryzjTkyGhGznIT9slKVakHhEDDqfmxTDSRIqHTrpYKi9Q6vYmxdMA1Mh1JW5ILqxW1vYPkrrmK8e77W3cL3BIyuOW5/WyQ0YDerh6M59idoSxgefj0SK9Lwv/LGh1puhk0Vmne+SaHFNmpQJC/z1D2PYn8YFU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY7PR01MB045388.jpnprd01.prod.outlook.com
 (2603:1096:403:405::18) by OS7PR01MB17900.jpnprd01.prod.outlook.com
 (2603:1096:604:441::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 12:07:02 +0000
Received: from TY7PR01MB045388.jpnprd01.prod.outlook.com
 ([fe80::efc7:876a:53ee:a019]) by TY7PR01MB045388.jpnprd01.prod.outlook.com
 ([fe80::efc7:876a:53ee:a019%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:06:57 +0000
Date: Tue, 3 Nov 2026 13:06:23 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Peter Rosin <peda@lysator.liu.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] reset: rzv2h-usb2phy: Add suspend/resume support
Message-ID: <aunOPzKeoIlrLTxm@tom-desktop>
References: <cover.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
 <da95bad94c99855b960b3566c07671f8c15d5dea.1791389435.git.tommaso.merciai.xr@bp.renesas.com>
 <9e0d2e4a1f551d2e016975b146b8303508a7a1fe.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0d2e4a1f551d2e016975b146b8303508a7a1fe.camel@pengutronix.de>
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To OS9PR01MB315839.jpnprd01.prod.outlook.com
 (2603:1096:604:511::20)
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
X-MS-TrafficTypeDiagnostic: TY7PR01MB045388:EE_|OS7PR01MB17900:EE_
X-MS-Office365-Filtering-Correlation-Id: 81aa437b-7aa5-4ab7-8030-08df39a2f4de
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|1800799024|366016|38350700014|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261102123227099003|261021121427099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	U05TGkZS6XH3dbyTHPsnLZb/fkl3cS9/JokiJLlzxmoSju3eudAxsXchZVOopBuVSdkgrrqEcpWvc1XmPG7ld3jD88DNQhVIBNd35gLye+S3piOixn2rR8t26gi5JBzYlgeUJz4w5s22svtZJYkZM/2SbgJo32plZJZKQLo5MQK0PcH16u3oSDoF7IVEzyWdFHRskG0EYQ/Wfh7b/7y2a0QAjdHwOf/MBpqIqIEtrPPa95cvJsdqSboQIqLz/Glo4Idhdsne7qYczBFpX2kb50iuoTpUDao3bTE/AR4JK+PeS0zEQbwIFjplxOMMEb+CZ7zkVpEQPgP/JN1ID1ZdRraN4evx3dYr/VEotXr7Bb8QksBpsDnImPppPd/egIjjdR3V7zYZEGBEPXm1uWppm946TrxEPID2EreE0QGh1T456VRBO48buguXQyaBd5ULlOuyCIGCDhLQQ4w2BTYsF7kr1881SflCyye9XpThu25SQgL9ovuTuvsgVJskiY4vuYKwEC3K3J6R0aiIPKrj9rlP/RvXstzyEzmpMMPyirrrZnNlvscCV8wXrzCIUnMt4/qQRJcghhX+dFu3QwmgHxsgDW17ldt2M/yTchYyMz5XC+qOix87OCWpdPJmLtlnacJ1jzKH1/iVHpvHALAWUXQ91wpTDSrWu2JSEgAf6s3fM5osm0KsyImBy06dxM/Toip1fK7v6AbvaiItnRFBB7Ug28JZNzhqBKBWhGCN0j0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB045388.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(1800799024)(366016)(38350700014)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261102123227099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvFXVubrLCmJvkMAhuKsWmbI4wfYu6RHfyR1donr94VgqP2w2R2U10UKZlzI?=
 =?us-ascii?Q?begV+pkOdTSj5jUxM4TTxa7X+HCACW4iMlkfmNZO/xOs+9kx6L/cE8V2eG5B?=
 =?us-ascii?Q?RxiEEYgnx9o6L4OcUiua6ltVZJfLtWI6aSVZO74Qxs1IYpgKrDACQT7pcUWz?=
 =?us-ascii?Q?gx95yH2/WjL5wCD75wG4JZpvSrAt8a1yfx/99KL4BZK48/yxFWUqZV5N7kyX?=
 =?us-ascii?Q?Wsz3Tk+hF3rP76HtsgJtugXexXtK0IohEFtD0C9sUYIxCxFMHuSZCJxhKnjB?=
 =?us-ascii?Q?+ioOXed+/wXZEni+VOn4kwY3dT30A8Gc4VczunZR1WAORcB+L7o6wFs6Gzjy?=
 =?us-ascii?Q?Gd9HUcWVbrl/osG1BC+sBofoi01Ey9MIx4ESILoo7Vu833eQquKZwA0OlFTn?=
 =?us-ascii?Q?DSRQsIcG/imAGyv226nIB3t5GAW7NQv6Ep4QJU9rXq6AcpIrLjto3bx4i9PG?=
 =?us-ascii?Q?EyMmAsdIE2/E8ZA+jxRoSQHOzjrVm27x2Och0nzmcDTSPCrd/9B3IbLcI635?=
 =?us-ascii?Q?M4sTGz7y+JYxxXvNrP1mClWUVqNU2gV1M0AdkfguUZiMJ5oyctYuFxWt/Ngt?=
 =?us-ascii?Q?My1O5lq+wEktCRBzOiZ3w+AYqyz9ZTOLaZB1yqN9arMc9PKDNUsk5Y4x++7n?=
 =?us-ascii?Q?HL1mNH4eCmyls0RJsdOQGo1Xi7lqDlEHvmvMZW4XCkOUTb3NGSxOp2cWyjjW?=
 =?us-ascii?Q?lcpt8OsbQOZFPXa2xrvOm5D0x1Re+xCZK8OPa4HDC8queZ6y/fvEy1J5y45A?=
 =?us-ascii?Q?B59C93hh4s1fmcMmE34vDXnaAaAw16tIAu2CE9Lnmpkg9uKAhM3mwDL6mnz0?=
 =?us-ascii?Q?/anTmPIAfbu8pOhYsH9cXbdOL8ZcBpHo9YP9GfiY714KzcrVsU8bKBA/VGYG?=
 =?us-ascii?Q?3Y3JUz+AY1L9AXaOqU++QkM32VAMJQJClIZvk9BHij8ihAoMGYlJIcTC3nw0?=
 =?us-ascii?Q?nENdE2Xp38GZShS4MJWEgeXR4/Z78bn/ovydsW+7cbmb5BTRAWQamno4nwrr?=
 =?us-ascii?Q?ac8LL+SQchJY5kCNh2EtanUbv6x/FqTZVPFPf0I4ScW+/o5qDBjKOsYGe+uS?=
 =?us-ascii?Q?uVYWZPORuQmfwT0NsAe6enL0YYgpopLvXeUjL5TuOEqx7fX9mh1MAooq0iYF?=
 =?us-ascii?Q?J0QCJwdz5IdsGhY+ItqMGaLcEpRqYBLxtda81ioc3uluuupwObJPz0YpWGkF?=
 =?us-ascii?Q?1AajaXf9VlxK95/xYUuNmXiWFZ5aEidVWLu3kvXHDk6huTiDiiPiBPJP2CyH?=
 =?us-ascii?Q?Mm0R/OBU/3m3FfasnacP1z+aB1IFjDJhtGcZ7AbswdRYDiSH+ZLCZgrHX3K+?=
 =?us-ascii?Q?vWp05tA+OrcF9lLu+XlNulkY4hCY6FMfbCiQlsCgZ/AcVyi1vJFWDSnlmtrK?=
 =?us-ascii?Q?adf+dndRo0eq72mVOKYRNjgbn+1o2d18TJbKsdTPB+NN6jJr6E71ShDh1d8z?=
 =?us-ascii?Q?m8doXmXm6KlMlyn/XOhL60I8mAFBF7HiQlFU0Tl2U5grHbLUpgG5ZX2EL8Mb?=
 =?us-ascii?Q?qg4c/ZWWrfWUmUwCoS8FRiIB7bMu2gPa0WYUHKfLYpt+HGJ8Pf1qlPg0zNPv?=
 =?us-ascii?Q?PssWFhtNf9dcqnx/tE9ZYtYQCARlc7Vc+OXtLGT03PjYSZn5LJ9GtYTd3ZAK?=
 =?us-ascii?Q?6AH0AgdRPeTwlvNxFQXvLAvVTjzrL/+3o0DgtgUQyHedC3dg/S5AwD13YBXl?=
 =?us-ascii?Q?Pyk8xhWw7mx1yVl7rJZEZxZrivEMyok73E0BWPsZAoYkU0TDAAOwDAgjKo7H?=
 =?us-ascii?Q?9A5CB7zx2nNVGEarqep6RCvX1v3vTYt5iOx5voO/rZHMMjWHNhHe?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aa437b-7aa5-4ab7-8030-08df39a2f4de
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB315839.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:06:56.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrOEJQIsmitayg4KGg4mwn9OKHfjxQPyZfzMqjFgnTFvmeqngMFlsG+NlVMMICFPfPsKebbn86QO1gneLKf//3sShe+uoO7rmSAZyPVrHfPjcC/SowGKsCwihVv2kWSM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17900

Hi Philipp,

On Tue, Nov 03, 2026 at 12:05:57PM +0100, Philipp Zabel wrote:
> On Do, 2026-10-08 at 09:44 +0200, Tommaso Merciai wrote:
> > The RZ/V2H(P) USB2PHY reset driver is also used on the RZ/G3E SoC,
> > where deep sleep turns off power to the USB2PHY block.
> > Part of the initialization sequence written at probe time is cleared,
> > leaving the PHY unprepared to receive assert and deassert requests.
> > 
> > Add suspend/resume support to assert the reset on suspend, and to
> > deassert it and rewrite the initialization sequence on resume.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Can I apply this independently from patch 2?

Yes please you can apply that.
Thank you.

Kind regards,
Tommaso

> 
> regards
> Philipp
