Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612653A89D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918259; cv=fail; b=feKb/COEUcvdDDxLf+aGPk2O5C98FI0POmrbMV5QoZnGqZhPARTosYXFL/vjlgqLMZoEIoh/Ef91YtX/CZ6sUeWCwNQ2/bZK1URRLOSdSDSxXC54rrJQRAUGI+/AMabfSL0Lc+alaJzdkYCuOaEUSWt9YTc2KIH4avk8Y/BTqgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918259; c=relaxed/simple;
	bh=oWnrYrZ/M5NwQfB934oI1VgLpcvOaYy5QhAW7SHVfys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBvhxFYaUNgoDvZPteKn/k3TD/VC5N9b6XF//IKSMZqn8gM9ms216ZEanJjzaTR6VMIocyqDGQbhA/4ymWJc0CNHE0naukY2F3o+ozm8TB97t7D0OseVYwWZtgLfoVEGU0caAK39TGoXWsoM+hNI7O/hBQIIr6QpdW7fZiwLgqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YJ4lsN76; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YJ4lsN76"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7OiaT5vzw+QatR1m9GdvQIx8gGX1rg8M4xFr6jgiRdz9ueDoe98R1a/zBaYhcO1vY87/CjUW6MeSpLGibG735sBZhf0SNPoSCni7b4EwCODUU+45i9Q/hjj5O3IP5j9N5uvPd5QY6RcykL5TTelfQdQZkyjocyHQccNHPOVRGjeN3Xh1sLf0ptI1P+QETILdyuKvLQ5AnPL1NbaKKXb2UGHX7e826jDrYM5aByVAiXTUJ1lllvwwEuWCC5KKzmUqDStmosFgRe097BWFfvTv+miRQJ8b6ZMUZZ1qNIchz51FkQCa/IuOQSNCGhgL6DL6zq/oQssiqj5uJv0GUiUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaEqmQjg+r6tl0AxMiMrnnds+8wI2TVLxekhjPOVAMg=;
 b=UIfF1G/RXl3CZ87X0nKjxEOsEfjphyIud8darMvSVcbuOKH/TTIIC3Pn4H3V+71+jIl2PwL4vq7DbsGvWnueM7hJK5EMngVXbNd0hrMQOWKFflptFW6mIajfCZKNcpn0tni5Xp24t1DlbZhfSBj8HIsuUt2BnTpTJjccOfORDPZodA/bTWv7HTH8FQuvSjsbxJ3Q5Y85SDEpXWkHAwiO7oXygxHPnpVWJ0PXwj9PkRFSK/NpF2phxtktJe9AwpCPJh/tqswh+cO+Hc5DtkUR0eU1udRU2v7VkF61TvVnvWsTkdIliyZjoacedRgoHIL7aVJj11CpZCwuipZBrzFuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaEqmQjg+r6tl0AxMiMrnnds+8wI2TVLxekhjPOVAMg=;
 b=YJ4lsN76WNxUsdCOHZdeHBvdOE9MrHtc/SN1vecVDil7QtycbK3NqE3sBSbS0PTuIb2/CZqnwjYRxB9z4bEsdXSCFusAE0yjyLcTL+joQl31XjMtUNdosIhwglaAHVYcYuyMVO0qgj+XGPWZk/Uqggmmlt3LVhthvYoTJdLmXvRfAIB9pzX7Mk62OZsjAcBJO+MuvvrZF5pdEXpmjE3/UGWrIK7C2SRh9GtkvA9WjU23mZLqeQIMQRNum90BAxY5YB6abdNOKwWtT8sKxUhrKVW4RoL0Vv7AyqSqv2LGr2x8f05eI+IuWl8TAEQmaGADz5xD4C9v2gWTaU1AIL03sg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB9013.eurprd04.prod.outlook.com (2603:10a6:20b:409::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 19:04:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 19:04:14 +0000
Date: Tue, 13 Oct 2026 15:04:07 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i3c: master: dw-i3c-master: HDR-BT support
Message-ID: <as6ApwxTzvpMunQc@lizhi-Precision-Tower-5810>
References: <20261013080413.7470-1-parame@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013080413.7470-1-parame@synopsys.com>
X-ClientProxiedBy: CY5PR15CA0150.namprd15.prod.outlook.com
 (2603:10b6:930:67::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: d5624043-e005-4968-01b3-08df295cc5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|261009220027099003|261009223327099003|261009221727099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	e9yQldWkE1L4i+iimdvHznb9EmNDLKx/FREreJQRf2GQEN+fZ64ysFIiCZcXqnCO3aq908C9HYHrt7lyocmmw4wd+ABoNI8+51lYOrtVfTAiAyYZ52ww5nKsEO82bByDPJIhG98B3wSb1kBb23EwZFS/c1RLZurOvjBxrDiPYXXQCxQLuroMD+9eUB5nepMJDjkUwbCbv1HoubSenCp085aUOLRtAt8yp1/dJwDwubo5qf7difEj/D99Vj3TN5SnEDzzeBZffZNotRHWbJD7WK6SDn5tUTgNEw65ZLVUNBkjAgQCBwFXRB8uk3Ix7HZoudUrYScf4+pxvEJYMyu+skmgQoT88f8+dpgLJcZdZcL8ivpiA7YfjyGbyxBeDKL4s0wd85P5LII7PJuoBkgu/Y0s6at2VVp9BbR2hoNDa/A4PmGHHbYMYGjn/4at21jiuo80DYUT3IMjs8XmPbb7oR2sONOTtHpWpVJXoLpj3BT71YRTM0UZAjNCDgdktXtZ/bfD0ltdIrGETLBNx3JFGIWB5cBCHQI6oDa6NQrpkw/HfNkeNFW2Gs5Z2isrQJp/9wiNFDNiOqLiIabF3TwHCyU1SW+gyNAzWo/OKVIIUTJDsUlCOdzPDbQCDPUIrS4L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(261009220027099003)(261009223327099003)(261009221727099003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qS38C/2ra0jo4gxib0UaP++OajvZ/EzSXCEWcw+ZTeLnP8RRwRAeZXW4wTsd?=
 =?us-ascii?Q?b5Ui0c3h3MA4fYyIiND87mQxXrihIwvQR7kq8PzNyCM7e1Ay9uWGT9YhM/uR?=
 =?us-ascii?Q?1HlkZYasV6wGzql87vngRPRMX1x3f5AI0CJupThnozm9pKM4ew0+Lq1mBN+F?=
 =?us-ascii?Q?yH22PG9GYwXX6LYT305bcYdnQ17E2lImAHyLdDeUOFzD6ttinAqpJ3hJvftQ?=
 =?us-ascii?Q?OHGt800ogMZgeaiyvOMtaaO/OLFsHztvs6GPlPg/jWUFAe1ot+rTZ5m+Dow0?=
 =?us-ascii?Q?abnSbzz11jnHomQwv2FJQ5TQ6xPtFj64vlC5iZ0n3HK+K4N7QOWxvRJuDpvI?=
 =?us-ascii?Q?fqwe1fqVDnmMuoyxm+wMDAehXFE6t/MjvaDMHT+/q+il0Df7kLoj7qvGN1I4?=
 =?us-ascii?Q?0f1aXLtczBNRd8IxKqZgxrgQZ+rsArJ3wOYOvESaqvGzFpLxDgwcmGu8pHq2?=
 =?us-ascii?Q?JF6lt8mqtbGmCYAyr8n+FB072XXt5dd1iT9B4AOoe4J43M/chDgrWgfdg9jg?=
 =?us-ascii?Q?HVF2VW8mELc6RrkGFA6PwWx2cKt51i9VJ6+5ACacKrhqvNqKZyZEx2KeARXu?=
 =?us-ascii?Q?E0vCsc+fhlJbQhss5YG8DUkdU9UNA/Qq3DeWG2V8Z5RR4lBAMr+cPCOixEuv?=
 =?us-ascii?Q?Uc4lOC69Q7ZGRysqZRPQacJnzMEK4gRWsD0lPKaw2YPDXb1zLsboLaTsL9q3?=
 =?us-ascii?Q?uRl9tCP9ZhDkaXjSOLN/bw1n+tGSzMzIeRe38bBG+R2qc4lEbvX2YUMCnOIp?=
 =?us-ascii?Q?5l0T4GE/lgoKDA5EZgbcvqIHyAdfazPdq31uoXc5wvcaR8pVVMzIzqHmIeG/?=
 =?us-ascii?Q?4mxVr19Kt3+BUH7A85oET7/BnWbr6bEi9VWx1Ayuk+JqO5NTj5DUkbUcaz5l?=
 =?us-ascii?Q?hVraP/EEN9MLW75IFlRRm2kIF1rpPGMVCvsMoJ3HYHt5DXkLEpOT9KaECw+P?=
 =?us-ascii?Q?U0s4bdFzHAyQhFVvOtQLTJMH/1annSC2zJP7eT0Z9siJo/apCh9+T2x0vXQp?=
 =?us-ascii?Q?Q9IDCDLCUD08xaPiHi20pdNP8E0EQjJc+L0I6xcF1Q1vHd1NHSlfqrYT5ChK?=
 =?us-ascii?Q?NWGVjb8zC2d14FVaGwj6qmLfTn3stVLWdLNKvDwQwhYqsic2nWCTN8nROcCy?=
 =?us-ascii?Q?vAhsvlT7aSe3FHAKoiv4LLWAjezHiKeR7A1DnraknxStw+lEkR2wCaF7J2dF?=
 =?us-ascii?Q?mRL6sPDheFDyMvIaLDKJk/XVloz7Gvf86iKeBMZP/V7Ns4GwMnRn76G6Z26b?=
 =?us-ascii?Q?VIEziRNdgVaLA3AjO2b+UgJWOvlFcad8Ip8Qdip/C9VBydAvt05tOOBIDNwH?=
 =?us-ascii?Q?tS/Tf2dsUjS5rrmzQant6RaIBpjGSH/GMqYPK42TbYC0TT40BeNUX9DQ7Uj7?=
 =?us-ascii?Q?97nGkYY22X7a1f0xBhoDRVrpM0khBhrtm3ZQOaKGNuE3LWejHVaCA6dcNJQZ?=
 =?us-ascii?Q?rej8FCeIe0lYyzOWnEoVA4TKi+Pho1Tr8R76fhmwR5YSdEwPqu3nKrYTK/Na?=
 =?us-ascii?Q?cJLf6sBC2sDmQ4Yskzbmw6GzRjKd5o6unENZtZy3X+h41cwWr8mTsTjrtOe1?=
 =?us-ascii?Q?TMjUJ/NJWuaKnRasQ9lSQqeW8z7ndT4DT9f/pKlMPK/1JcXSW7OxTcouCkae?=
 =?us-ascii?Q?mHgKXPIbghBckTWB47THIBzM0kKrO/ZTd9HxtnCfVnWlGBljaRJ1cNl2KYMY?=
 =?us-ascii?Q?ijBXm0rxwjg2f6BxO3rNR1Fk6JA+MiNGdVQhFAoKaekblASJB3dsLod7ucLu?=
 =?us-ascii?Q?rswF/4H2PR4AWfUZTMbFHRwmbNM7COJmh6SKHCWiSCZexJkBz0tF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5624043-e005-4968-01b3-08df295cc5af
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:04:14.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6Fq+UNXDpBZVWD3lSbrqbVQmiDx70/zbjkL98dwa82kpQU3H1DNTgEYRJkJy7c+vU0AIGqkKf7NQwH4QCdtYZSI/a2S+T7RxLSo4DJ6GdmApdw+jUiuVqEjZCj2iuwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9013

On Tue, Oct 13, 2026 at 01:34:11PM +0530, Dineshkumar Parameswaran wrote:
> Hello,
>
> This series adds HDR-BT (High Data Rate - Bulk Transport)
> support to the Synopsys DesignWare I3C master driver.
>
> The DesignWare controller provides hardware support for HDR-BT
> transfers, but the current driver only supports SDR transfers.
> This limitation prevents users from utilizing the higher
> throughput capabilities available on supported hardware.
>
> Patch Overview:
> 1. Add HDR-BT capability in the I3C framework.
> 2. Implement HDR-BT operation in the DesignWare master driver.
>
> Dineshkumar Parameswaran.

You just post i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
https://lore.kernel.org/linux-i3c/sashiko-outbox-169200@kernel.org/T/#me5d00e8b02fcad9a477e2969758ca9cfb1a051e0

what's relationship with this thread?

Frank

>
> Dineshkumar Parameswaran (2):
>   i3c: Add HDR_BT mode to the I3C framework
>   i3c: master: dw-i3c-master: add HDR-BT transfer support
>
>  drivers/i3c/master/dw-i3c-master.c | 146 +++++++++++++++++++++--------
>  include/linux/i3c/device.h         |   4 +-
>  2 files changed, 109 insertions(+), 41 deletions(-)
>
> --
> 2.34.1
>
