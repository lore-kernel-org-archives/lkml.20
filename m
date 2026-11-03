Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793719597;
	b=AryukOn7xJvYZznF7Q0be1Ckv092oY4Rvh7dmBfJ1F9OGiq/cwFbki4FYtXyuaEZB+LT
	 5teVWifGEm0ohe0bFtbdM0yQPLRx+aPNYcZ78rWb0gM3QbqG/ZKUA9tUE+7cW+hiR79iO
	 mWe84cw/Gvti1z/LcwVYzEQ5lu2+na+KdpW2N+8zgxSAenUqsqThGyT0fOHQIe1OTTEaY
	 xrUhvBmgi1LGXlPGaemMV00vjHsSsfgyOXomo6eCrgu961gZrT7GQbfftv+kLJHGLkfeA
	 5vQz1Oc49I4a68+ggefpzGO/wZisUedMJe23UPnUvFkvulYvHI1L/wRbDACJF4jRGFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719597;
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
	bh=JDNrsBzQqCyzW0919/qDlxO2f9EkdQbznhXR4gEl/QM=;
	b=tQ8LXsWTBk5xmG384veNx0uOuKWbgR74POZjA1dEf8jRSrH0J1z0ywwJc4dcZ04y9AkQ
	 DiEQ/cADy+WvWDrEPhFZOU2jOBo1REOnQHU49vkiqlU2wdXtHp/Dr/QPjfB2jEZfrVhOq
	 8Sn4s3FKnsYORa5caPx5lOaEvFKy2P9nl8AnkLrXe+w/U8XI6waNTd2HCg7QPTsd26OON
	 9W/TCKgASFGwQRDAtNzM8T2wcz5yjxHHSFeSzbrS1RdZV5mCKou1QxihHetLH524tEAaJ
	 sbSXbquRKOZYhHJuGix0U23SQ78D+GtqWR5Mej+JX9SPMvk/n36JyiDT/mYqQkxTq2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tpNq81T4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.67
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684A606A324;
	Tue,  3 Nov 2026 15:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6684A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tpNq81T4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UH4QZS14EUTmH6nOME8VI/OLbvS+M/YQxGh7lfyM7jiLOlAETBYdv9wcJbDriRRBg2oXKNMBXSXX0Vu3xVQDqOaU+rx/dEryugnfdgiGTjYvrvVwf7c+i3yUjYxCGQ8saxZ3LCwAdLINMaAXe+UgbWhJV+Rh+rHM51QsAPrVp597w7ch9AUXJZlyI3YUYKJuVb/BPEfYKro9NZfrPrIrlphkgBqd8xNEMJ434ickBp6+Kt+CEGG4o7YGyHknhkukdf1zOff85K7kPfgE3yaIKCubrmol+8aMp+V+0xkCzumkrlmezW20zQZHpmTw6tudDOVsJe2ZRR9YtHSlSzwVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDNrsBzQqCyzW0919/qDlxO2f9EkdQbznhXR4gEl/QM=;
 b=I0XtN7oQVSbByN4ttFKOjnOMhxJyKK3l8oxkyeHlMk/aJcI6ofRINyyxQlxMa2z98PHi8OJgkgpIE4MtsQVSrqsdw0nJHsoQI55bMbq5iWmnEwjhKL9Vld3euYF9C/fpebfwzQ9GOXOWIHygxsdOIgnEIUXmYHC16VpSpWmnIO+rWqx/MtHoutRcCEz0SU9Kwdj1h+55HsU+AjP35Om2/txGxOXZ2ELM0gZF55hTYyLQoI58NOGVRyTutmzfoT6GwRCfMoCFHy7aXw4FGeywfLpZ++KiO+Dy/IogVKy2SaF7Mpt+hZYypo4P2oOIgJ0cq0JxOeL1m4TW9BqBIqiNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDNrsBzQqCyzW0919/qDlxO2f9EkdQbznhXR4gEl/QM=;
 b=tpNq81T43XKT8qtoqqW5/eiUntsa5uDzhG77URadPXq7DEE61ZkIIDM29TyLwWieBoaNsXN0OUZixAg9T16gZRubkKIX0WfpW4TZF+2W3XMvWpd8qsytld+blcC13mWHaCKpibu3ksY9pafR52qWaZm0dEwBBuc7WCxpJ7L5BbVyAxRRFm+KWxRVZZtr0wYMnxl3QbcU/BYkwfF+XwcqQyV4ztrzs8lnboOAQzuAe43n+Sm8bLERSMV0c8207XaM73lxrl1skcGbRV/Yg3hfC7JPzbBfWomF3cSDEVxL0EenjfQO1d0cfsYdxfyaqjQGzaQPsjpalTQAld+sGby7SQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9354.eurprd04.prod.outlook.com (2603:10a6:10:36c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:26:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:26:32 +0000
Date: Tue, 3 Nov 2026 09:26:22 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <aun9Hj1Ypc_xSYtL@SMW015318>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
 <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH3PEPF0000409C.namprd05.prod.outlook.com
 (2603:10b6:518:1::48) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d39792-8d0b-4fe1-add3-08df39bed6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|376014|1800799024|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|4143699003|22082099003|18002099003|261102123227099003|6133799003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ns/g7UevWG/KouBkeyEsnlxmHkr8RvPcuXfBM+cN+E2uL7OQ3pNj4G+y0fF8nNDFmtfZD21Eb6KNrf/IzOniOslUN+V4Du/VGMroAi33N0Kl6AIihmGrT0JCPE4iOBGbXV5KOPUrv509vbhEa08qpB0yF81H/7baF3f1OTsUPd9Vy8p3Gz6JrsG41ZiqSLr9U2j0oYlMXwB0PrMn3kDTvsSUf/HqUj0RfXZ01WbhKAellM6epJgzFVu6I7p+D6hyYpDQGQI/x9LE1rDM96jIM9pBKM7/j35a9R4EiEhxRbXa+5QJd4bsz8+KOfTB+qlYMdIDOLp32gek0yrNdMVCvPOW4XyADj/T2tUGRZRpx1r4NzgUWjZ2sTlZ/XIN2fAY0EvR5bdKk2OySDmsp1vpW8m40qLPwgN5u3s/DtYz3Cm/5MvWD9k39NrP9Nq3aMuoXh4T0j69Ctb0UcJU+/fi1RTM4CirNBF/RDWVXp+Hluh9S83AulOugy1+1BNIB5VOb4/sqJpEC67cFH/V+2F97gH1ZKHq3+mXX7RPak57CxQaht6I5/z1xJWIUjxQlhmbaBZs88g5XvlQcRQzzZecNHCc3cx/nFiZiYdbmQa068gNzWxS+M0CDNeu3JJwunTc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(376014)(1800799024)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(4143699003)(22082099003)(18002099003)(261102123227099003)(6133799003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rZdbvgEuWM6/QAtvNyiEpX5Jd8zBqY0TKIhivoHEBJynEZQoCq98W1uVthX9?=
 =?us-ascii?Q?UiDAWf1okgw4U236cjoBddpa43eie+vVj8eLZrURA42a/lIp7GFm8Ejv7gmn?=
 =?us-ascii?Q?ew2wiOcsB/LD8owCtMmWhD5TEY5/pFyw3QSvMV2bW3cEgdpwvKsH9gUvYY0W?=
 =?us-ascii?Q?Ib91RgDD5+wzwnSdhWdhn37uaUs94ljptYOiQpLRL9LD+11Z98Fq2dtv+kMe?=
 =?us-ascii?Q?qEqTTHfd1qInxj7WVY77SxhyrRKMVW1FZzNh1zYo2z0AdcMcnVly1c6z3PBf?=
 =?us-ascii?Q?fDSyHi5yJMC9XJ4TfmFrJo/MgNo67xTAJUJ12Z1dv4O2zW81mFPI6P6qmxDM?=
 =?us-ascii?Q?zqGijbfC4+PP9TpwYqjv4s6ArCEwnEZI4bSFQfSpD67A/TXN46z4TNfP7dww?=
 =?us-ascii?Q?xk0zKroggz3Kc7GNQSKGFI3RvbPwT9eBqog6jIjgG7KT2GQ2sS6WPELgaRyi?=
 =?us-ascii?Q?ly6rBFZLdfMuiHO1aes4QLbK8a7nArBPNsi7BVhy6ZNWgjT3ComaujPl3jY8?=
 =?us-ascii?Q?VMibzxckEjET+v0JoyHu3jpZb2pJLGfZY2vOySXih1R0ubLU991Sg1MfXLIi?=
 =?us-ascii?Q?mDnSnjeRH2FrlZvzxebt8t45aKqnDNY/lX0pb4WnF/N3MJe4h7kWaZm975zC?=
 =?us-ascii?Q?PIGWbSTJVIk4nU5riAgSYTKKhDQ/uCGXW83tCNOMoivAxfAR039QJhFZhn6/?=
 =?us-ascii?Q?O8ZcMFxN0A+hC/3xIsPg8RtsWjjdM9rBprcJD92W0buCmTY5cNvHq9Wdz/1Q?=
 =?us-ascii?Q?egB9bmoIMS3vmvPw8F02nVan5XE9UCEY2+cnfu8vyQL5ZwhCRSW+1h4nm9kl?=
 =?us-ascii?Q?LczBWuQhVa2rBjD4u+mBkID3kW1MOFImQ0PXDC6yFQojLfbwMFMsVbIGz3Fb?=
 =?us-ascii?Q?KOoTPE2Yh1ZkmsLTht+yojWtCSiF/139Ty5Scd6KgL6DBK5AWdXuDR9M61V7?=
 =?us-ascii?Q?0/yEl/DTSxt2GakSokA0Ydt7YFMElLPXGbObW6HrGGRG8DbkhyHba59VUK3z?=
 =?us-ascii?Q?nX3K0qRg+YhOyx+ygV+IJoeKyuz/F0tyTDDvlI0R6g7pU//bfgP94H+e9wT2?=
 =?us-ascii?Q?aUCczWov+PAJ4+D+xXMn5yc/+g1evPTgYgXEMaHHWqQgCcRh3+Mwa+yQGLEG?=
 =?us-ascii?Q?aooWoRgqgZi2QMcwgDMdFM8tZGN3iVjBmjVvoLLXAOXNYTlgzUF5YFIEbm00?=
 =?us-ascii?Q?i/M7g/9FRK30FWBQcWu5NmBnTMh5VXZRL83FS1ic4UOHJTt3QvRbsdG9ooh/?=
 =?us-ascii?Q?ZgFKnUxKZnRQrt356eSEs1nGQzK87QzwrC7SrZq0fO1WOEdFYVDdpYOxWz/w?=
 =?us-ascii?Q?gMglquiVplGcncXp6vE4WGa0deL0ChjkIeHX5X4P7N565vblPy8voqvEzBgi?=
 =?us-ascii?Q?uLwKxKyZFsA/ps+gkxoXyU9ca5yJkhKh6XXuDbvaH+s4AZucCCOzCDMY0cXT?=
 =?us-ascii?Q?asqvnpc5SIkTvcysdyq3XSAVUDW9KUFrZHiuJANRbXAE3De6SevqprkmsqMZ?=
 =?us-ascii?Q?yJ8Rp1Enfra9MWd7SJ/45FLgyEL2qIfQUfAx0qPJud4LUowY1Q985ApHl8xf?=
 =?us-ascii?Q?G/0czNrWKgX7eecBY2pXHguEPrXEQupdR4iXtiPD76pwqQIr0Bf80EUJH5sS?=
 =?us-ascii?Q?+GdxKNK8XAtPs7DxRbe3Qxh7f3BSj9Ey8CvxhCobn1te2ACUVOGtNMZII+AD?=
 =?us-ascii?Q?qjUt4mL4hXrr4iqtUGBq3Pffmlj/e4Bq9XfeIMMYJVl9Sx+iOOqf4ZeXDGa5?=
 =?us-ascii?Q?/z0y5AXjLeiEfvAkNWJtv8DGJmFjPiNRfJrFfuwONlPNyGVbLJcm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d39792-8d0b-4fe1-add3-08df39bed6a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:26:32.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cZJTEkJV6rMTEfoPdSIdVNZWNog3bi6qIVaH9wDnv15aOub6xqEkSWjFgjozU+ZtnNAEgCySb7Waln/j8d0DqO2in+15yX+x9g9hZ19HS8woNjSPnf7LknYbM9dOgfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9354

On Tue, Nov 03, 2026 at 04:04:30PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
>
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
>
> [1]https://www.nxp.com/part/IMX-AUD-IO
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,aud-io-slot.yaml   | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
>
> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> index 000000000000..fc3896d0fafa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP AUD-IO Slot
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +  - Chancel Liu <chancel.liu@nxp.com>
> +
> +description:
> +  The NXP AUD-IO slot represents a physically present I/O connector on
> +  the base board. It acts as a nexus that exposes a constrained set of
> +  I/O resources, such as GPIOs, clocks and interrupts, through fixed
> +  electrical wiring. All actual hardware providers reside on the base
> +  board. The connector node only defines index-based mappings to those
> +  providers. This connector type is present on i.MX95 19x19 EVK and
> +  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx952-evk-aud-io
> +          - const: fsl,imx95-19x19-evk-aud-io
> +      - const: fsl,imx95-19x19-evk-aud-io
> +
> +  gpio-controller: true

I remember Rob said needn't gpio-controller if gpio-map exist

> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 3
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xf
> +      - const: 0x0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0x0
> +      - const: 0x1

I think you should pass thru whole u32 0xffffffff in case GPIO add
new flags in future.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-map:
> +    minItems: 1
> +    maxItems: 2
> +
> +  '#address-cells':
> +    const: 0

There are not child node, why need #address-cells?

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-map:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-map-mask:
> +    items:
> +      - const: 0xf
> +      - const: 0x0
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
> +  - $ref: /schemas/clock/clock-nexus-node.yaml#
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    connector {
> +      compatible = "fsl,imx95-19x19-evk-aud-io";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-map = <0 0 &gpio1 8 1>;
> +      gpio-map-mask = <0xf 0x0>;
> +      gpio-map-pass-thru = <0x0 0x1>;
> +      #clock-cells = <1>;
> +      clock-map = <0 &clk 1>;
> +      #address-cells = <0>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupt-map-mask = <0xf 0x0>;
> +      interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
                                                          ^  missed count?

Frank

> +    };
> --
> 2.50.1
>
>
