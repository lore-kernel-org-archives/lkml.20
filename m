Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8581F3DA5B4;
	Tue, 15 Sep 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484688; cv=fail; b=icZX26XPsTqYZx9dAtSR1XL4zLMA0dxjur5Lsmu9m+EputqGilF1HJSEW4QKTwIrc2ZTn1zhnpPUWCijeIcnqgCs3PGgjQnh4ltpyVXKeEMCyOGk8Hj3omt1hvRzBsNaMa1filD7piesL+oKTqgHGZrO+DgUH7MAGY9z8meCBFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484688; c=relaxed/simple;
	bh=r0++iddJUhnrjoaXQvq8RpdJ8Z3EDD9x9/B6SG94eso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nnQijj8GioJI+ME1xUJFlwt7575DP8ZdXAt7QHcFobh+jRhfCdHipqww9gWWvwpWbDWiCZIoHYOIevUsk/fj5J16u6HG3OcjJbf5w7YVwyrcreKOEymgzNugtl7BT/v5UkQ7KKgcCgch3LAn63TzBk+9COWYD141hjkN7pA8mj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wN1GkU2c; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wN1GkU2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3/436DPcGO3YD8Q7Os+GWHGfNqzlZzA96ccg6G0cgQt+zOozTtv05IKxiUSYvAyaA6tlwMCfsnddiKbPiqKZnnaNH/DOKI0EShLwA5zHp1jivAYPgtWHeB07qMDXlfncUrBAOU2d3YklnLTj1MvOVcU/mrBX7B65jPS2o0B/HKLa0PE9T/GFFPG5kw0QU/WaxoKMNZDfJaVqnaIVJGh6DcTqyDiafBEatqfXYySYDzOciWRWMfIu0YN2kiP4CHoi+bL2/CNQSCPdp4h2IPjpQuauM+xhk8GoyxZIEYXhWbDxNNXhwWA1Q2KXsHyWClCIFvmzKzGIhDE06gmWLDyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0++iddJUhnrjoaXQvq8RpdJ8Z3EDD9x9/B6SG94eso=;
 b=b+VurByGzGN8+jn/KZ2BvX8Nzidk0/NfKNbLXK5Beknz12sAx8a/VlvfFuC4hi4YKCdVj+FAjCaqrbBGPLRAFZff8b3ggKyOpXig05PbNb3ETRmL3FIc+9sAAxEgsc3H1FPxWy0t4VNuCTIxs9hw3Z638cVXQmcYk8tCBSjeh0GlczGL+Ts+w8OQhOiUVLUzSM5b2xA8L7x9txmzzgqzNbQ8DosVmNutwUvupqrcsOiPp60AO3R1AspVnaxs/onvMxfse8Ns+WfUa3veCcP1oACTioHvSBpD1LtmWAk6MNmkVwXdys4jv+fbYX++PQPnzhtq1ISEekX8rm+DPivw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0++iddJUhnrjoaXQvq8RpdJ8Z3EDD9x9/B6SG94eso=;
 b=wN1GkU2cpFjdwPS91WZOVYRl69ayoviKkOXlhjHDV624vjgJMlTXtziB5mi0Bxl+thzsIUYQSFtz8z/Q9+uEPRv0sXqES2BLcL6QJlqcefsJzscnRVgYIufNPJaebaIY3Bwg0R3ypFHml3uOKWXWVgYHL/21jMsFwGw7aISXVntClrg3M37kwe122znlxf75+3d+uBfdc6sfQwt0Gr2Ru+2jYG/qpUwd++hPQ6oRSXHQRyE+NQtZQd1y3bEdEWBa8hJoPvNyBP47bGeCsCLuwkiigE8F1AfLPZ2Gskz0MoO/0klVOgIvKsyQ2MkRgj5mqXFD0e8KJcKooJpOyniszw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by ZR6PR04MB901289.eurprd04.prod.outlook.com (2603:10a6:910:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:04:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 15:04:43 +0000
Date: Tue, 15 Sep 2026 10:04:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <aqlegeEar-4x4A1P@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
 <20260915000520.GB2804748@killaraus.ideasonboard.com>
 <AMBPR04MB3355239002794E284C008FAFBFFABA2@AMBPR04MB335523.eurprd04.prod.outlook.com>
 <20260915122546.GD2796257@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915122546.GD2796257@killaraus.ideasonboard.com>
X-ClientProxiedBy: CY8PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:930:48::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|ZR6PR04MB901289:EE_
X-MS-Office365-Filtering-Correlation-Id: 16683fe9-b755-4063-67e7-08df133aac7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|19092799006|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9ZvKP3W8S2E3je4DcP0/tedkKfoYn0U8NsG1nszvwHif+Vb0URh8PSiMK9uoKfwVGoPIDTzB4mnEFgupplkxjeTRgyk6l/95fXF3tNNDqCYJKbu/wLhydZqKDagvjDxnVXQ+kRMsIcxppSU4rfD6g4Y1HXBi6SGpTKLC2/c8+30HYfyDaTEwjeE+DY5LAO0HrZtEl0XEvIHkac6fm+rgdQ+DFswjCAUJ6th4orw5LOVnlVh10RtsAkdbeHSix9XlLhugzcrLzmyBVBhoqWNI6xFzDd/5G81SBVjmNz7N0R3hKKrKGrWyypwSW9mqptVpdc1HV0kQFjYKY5DAsdqTDvx0KzkoFhP3gp8m7dvmw7Ymyt98ROZEL1CmhpppvdtgwF8Xkq1YWYBdJg8sg5N0K98dCKHNWqU1TBE24XyT5d98vzTb64VYZeBy/eAR44yhOcmLVLl6e3JFuQAjit3y74Y8388RI6RD5kyblQIn9QY9UYG6YrTDoqNwhI3Atq/QSddiEf/2xA1cS4d352EbOTp/iXX88xjMhAhhvHh00leKlmy35OuRV/i6gScI8SEzjEYv5+HKiDhIYwPOt0ciwGAyxEqwu026udbs7PaAAXcsa/a+bD1bxkyvWcP1k/eqioqCSpHuYSJe6TGa7r0vkIIr5IuzXnNhKa9GS1SxHQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SUISQVHhopWfbnCLZXuv57JBKe5OHiFeh7ff3Go5k36F+x9MQzAl+X1/LjAl?=
 =?us-ascii?Q?M2ZS2L8Y2QQuTMVLqnBS1ouT/JFm9+x4tDlCqxSXc1+axTyewpRpys9uPio+?=
 =?us-ascii?Q?dLmoSycvGMR3lCAoy5anKr8SrfR6ZbPKiAGEg0q5Do8nqflooqmoxY0kP8fb?=
 =?us-ascii?Q?hJcB7xgT5xh+mCAkTUfL7sEDs6JPcfFeOshq+r9zjsd7yL4ylgcEvYhjrmNl?=
 =?us-ascii?Q?Gpy5s1fU8nX7fq0t8wkP5B7PWXuy/K+X8NwqBemrhNBoO9eqS4PM5LyXixUF?=
 =?us-ascii?Q?h2MuKGHiJZs00JWo24nsH0bZLMBru1uf6ovr4z8/2LsFjIRWPRxzwBdsie/d?=
 =?us-ascii?Q?eIuiP6Ba7VSvGCmqg/qIsPjnxkptKhqHnMYLaIuAe2v/wBktrR8o7FfeouW9?=
 =?us-ascii?Q?gXNw/QsQ6p9W7nOl8lUKS/bu6ytpvMIMfJOq0P3GKF0wQ4K14XV4IQPvTuAG?=
 =?us-ascii?Q?ntctGwIcaRZytxIStoMj6gw9Spcigvt5U1/A68aQvLVqQxHJ58cyfbUInpj+?=
 =?us-ascii?Q?6Q0+byhAUYJCegp51xyVlrMZQpAXtaLN6L4Qoi57dyOmhuiK0DIk9WCWKF6q?=
 =?us-ascii?Q?TRmdwWNfnT8RFZ1zqckclxpwndtUxWPA7IuRe3HVDGAbxcviPjUpHQsIViUN?=
 =?us-ascii?Q?O9dxYAbAuX+iXR/d21lVqFdcbExJ34XgdIS6f8osD04516oUubcuBbkdNhnw?=
 =?us-ascii?Q?YMNRdBFeIMpuNAATrxVbUpeT0PkVpVulFBCll4uzllqueqYLlHlN8hl8IAOS?=
 =?us-ascii?Q?Chq0l616TF6h7ECworepm8G8xNjBx/BqADdfLQyEOkdJQk0qPINWmp0IXVAK?=
 =?us-ascii?Q?/NIfntrxhpSEGia235QxlEQCMp9tSQlTEBO7S2/i4Vb0V1w+YuP9iT+RqYND?=
 =?us-ascii?Q?Pd9rvdiwUWykk7Wnz5uLuzBFzniQ2S0LEOpBIzvte9v9X92NWyqIMv05bIrA?=
 =?us-ascii?Q?msw/wc56h9Nk48bl2T9v01miHgQqMzfAS0qJzstkHVRAMQF/OfLiMPhlbDy0?=
 =?us-ascii?Q?w5wITh1wdsVqqdG/Fv1kwZerbDFzX92mA9tSnNsyyQDfAcyRE7GRkM5kdabK?=
 =?us-ascii?Q?oKfQW2t0fO8ElAbqyAgWV15N8QIEbjW2YyKUVnCkFbz6NJBP4qV49pyJ0oKW?=
 =?us-ascii?Q?VMqRAm+ZJhDqFN+B8VL6XdYNxnF6IvJP07J6/XZiC3WRQ5MjCnd0ffeASLA/?=
 =?us-ascii?Q?KJYoSMjwOmjTsicBlsg9dqFreajOK1m1lQm7Yaic0WHX9WAUn1wD0OdTn9oW?=
 =?us-ascii?Q?tC6E8EhF+FnnpVSAnTiJ8Ax8sLnDRPVTsZU7A4KDJkrbA/dGA0DLetduw1mS?=
 =?us-ascii?Q?4oZZrvOvYAIrlVBiYBkVv+MVIMZQnFICXpHQeWTyX92txIrTou+tUSUMvrvX?=
 =?us-ascii?Q?jgaE5V0m1JYfLa3//VOSRUKK5aW+C+gdpWB0uM6JgZi7PMJaaLCwYyX9UYHX?=
 =?us-ascii?Q?haPDt7YEtV/+fp982hcX9GnyvEhIvzewACbmXGE3bcy1ib+dZtRay59yem/H?=
 =?us-ascii?Q?7D8RyFV5z/RTPE++DWd4IEN5YxLgJv730p4bwWyF9wovP5zj8+/fzi0TCqQD?=
 =?us-ascii?Q?q2EvIBoiKCOd7jM8+/+UgN3BllQcQQR9M+o8NgXUh2rkIhY7V7Y9yZ1gQm41?=
 =?us-ascii?Q?l9qEBmdMjG4Zku6Um9BWLzP7MWjNZ6qmc//JxHaO+5Y1uZ60rqaJWKNZM2j2?=
 =?us-ascii?Q?JKTfTzwyUCKssQ1dwgSqsQp6yAF+VmcFwvJJyOgWAeqmFQ+121L2xehk2Ttv?=
 =?us-ascii?Q?lFGf01uVfrlK0ZFPezbwUyU+WtQT4GyUDLcG4p6liifT3hz3VyRy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16683fe9-b755-4063-67e7-08df133aac7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:04:43.5687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLJAJYf6FY8mL+9S+PxEBT7uH+Ejbrl7k0F0a0/dQDX4vp02skXIx4NznOzvfZeQ3V1STPlNBKVx9dek+m+g7g3iBxbqnjLd5G0G4UW+pMeZ/ddqTeCr8zGZS5G1HMu9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB901289

On Tue, Sep 15, 2026 at 03:25:46PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 15, 2026 at 02:19:55AM +0000, G.N. Zhou (OSS) wrote:
> > Hi Laurent,
> >
> > Thanks for your review.
> >
> > NXP Confidential
>
> Really ? :-)

It is auto appended by outlook even use oss mail. We already reported this
problem.

Frank
