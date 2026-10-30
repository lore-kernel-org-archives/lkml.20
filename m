Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.69.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793347311;
	b=wA0vf3ssV0QRcP5Tm6zX39s/hu0sjvW1ZvgOarZEstpV7BQNQmaNO8RRevfqzNI4bEc9
	 TZ/EExyRq8e3rXZBlgGO6mdKmNmKqo8mZu9MuR4A+T8FSVV0UDNFqwzC7XtJDC2Fuwcmj
	 1WoEyXPW+ieIKc5U6JWk5s8W8WJQXmwXb+680H2rqorl0u/ueen28e/0eT/aCaiyGm9gO
	 1FlDtNiLz2lJN9P0eQXoG56X0CVxVHT0nyDtgMLnhcHHehQRok2j/CwcA7YXrImmTsV3O
	 mJ+ykss8LAwJ21O9l4t/+1bPRH48eCFLEBSll4ooJcA1c7qZGI69VaHlHGq1AhZy5kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347311;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=mL1gV1aKjLMAEs1MfZzAPrCjaCuiUlJKTgSxzYh+ZKU=;
	b=b7xn4ssO+bVSRtxujll9R6NN2wJeC0m3EWJI1tjp1pvZ4AIpK/4Ju3CyZF7raGeKMWG+
	 QeL/fSOb7VLVKAPSaMCXaJjWupege5IRXRsscohLtx7wdzyI6/Qb0qvCWPXAjCyooUq7Z
	 rMjqp5eb0q9h6+qgoyBPPZv6xX/KeSviVyL2Dmj1D53EgJ4JK9DoubVFHpA8OEgWJ4ff+
	 srs2/OWBT2hWYSqzFMtmVq/aGynix8x2RMCrh82Mc83EaxO3q90/1lkXkNx+pwfftLMZZ
	 b6t8nKszSfp7xNlTSSsLOBsP4NPuBPxhsRplA+MhMEFHKspd5Y4WQJwu1NB02L+zo3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DUjnjmz0;
	arc=fail smtp.remote-ip=52.101.69.17
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DUjnjmz0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACJ/x4vxMMFy25v/uiHPXRJToeDnHXKsANVbCTGLnnJpXEiIHjo+vGiTD7ghP2O5ZQLk1+gJ2blVgLcCOkQU/zYVTmGcMCXFQQ5zaar+35POSwwHUsBHCVpxfqrqDK2d0SvFn9To+nLd8tbVPJYhCuNzSmqfT1oz/Campc2rztI0SqnudQYCVfFRbweGbNt/0Z58j9f+t0ti1NoD+AkBt/rNy/fUaDc05pPIyaz84JBgGRg61drMR8XLXod7J0fu9Wrkzjp3D8xKsEoRExyExuIff9SYZNMhD+Ycq5hJQbVjXjXeMb8XS6/oi2u9vdAu/9Z6egYQeW2g/Fl2As1r4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL1gV1aKjLMAEs1MfZzAPrCjaCuiUlJKTgSxzYh+ZKU=;
 b=j/5qipl7Tf0p+stYmn6wRxw7k9qMkFGvl73kBKBdQ9Koq8PRYAPU+pg/UsxTMmXxH9R92ZsY/DWU9zsPYPD0QBhLTR7rDbuIswZ9NcPNLmCnIgjDToXyZ5U5t1RgoNQwQHum8WyJeiSWGbxwH6OT/bpLsmKctOVkFqMxQuQCKAXnVmiJFYv/JwlEmTdwQwBK2W+Gu+g/OP18EnobbkPf+oj7chY4jFtdGZM+aA9jLaMv6GQn5Y1rNlGqNRlQ03F0LAqwWtzfxle4/3madCpwnUxLdBArUg47FLyVJojafqlhuVDljAbd0BMGlsGdDMgczgjjWIZ5dzp0EwNt9sGv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL1gV1aKjLMAEs1MfZzAPrCjaCuiUlJKTgSxzYh+ZKU=;
 b=DUjnjmz0p7WqCPPVMTozSdgpNKgLhbwRAZW7QN84pbqeypXUy+G+O4IgNMpKJe2NHT9zqT0U2NJGC/ShpPm59fB7G50uDwgFpib4VJIadzRgypgezqx+0E6jmrTzUEnuHorLkBEhPDNFbWLQCr845qjy+zVg4p0DnKmcykcfyCeRs8p15t623/1D7vPK4tGqRsuUjj2wAEhuEhHQUvXfF5b5KoL1es9C5dUZwzxjNUHDpUnIqLAmavOuJdJHlmWDT+pIrxUbnJ5QLdgK3UIkdEQAVzdT/KSgJk413VBsBHwqbOcDzn5KERSQTCpEB44foAapZWgXljBds5U7EnvHag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by DB9PR04MB8445.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 08:01:47 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 08:01:47 +0000
Date: Fri, 30 Oct 2026 10:01:43 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mxsfb: Update MAINTAINERS entry
Message-ID: <auRN1oUwXKwH6AIv@vm>
References: <20261029180925.26792-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029180925.26792-1-marex@nabladev.com>
X-ClientProxiedBy: AS4P189CA0047.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::19) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e77c194-6447-49d2-197e-08df365c0b9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|19092799006|366016|11063799006|56012099006|261009223027099003|261026140227099003|261022105027099003|10067099003|261028144727099003|261021121427099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Yu2iQyjF3XJ11OkKk+gpPvp4dYj2eNNq86kQH8kGAdhh71rFs5vDr+AUxKY/lbCDznn08K05DtcLriGrio/Vwel8hWlGZ3fw9QkuxZTXyzwtcCWgayYDXPyoVpjB4ochrzXlaIKrTBXGWpxuf7WoRyL/sUM0dEKa8Xr2dWRfsuXYZk6WbrwLcmQyL2DFdAkcoBVJj1jjXFYBJSslvMY3cCSDbVqrlXN2fbQ/ddbyQZMAytWUhxPoan9ngDyEz3Y6xdvT0jE9dK1QsZoOkhfxuH2RjXXGSsmHMh1DJRv2Sbnju1ZZwaXugcivz55B1n2HgtkUg7A7xWdyUzl9OFtp1e/2HWURfUYCs7uhtsve95yuJtrpmDjQPvAicv4u14FWZECKfWNGoxvJK9+yQZsuO6jGv4OO58S36Rv4labDZWUdDKrinrVxILRf7r4YbRx1tetpJ7nudOhvoa2T0VjcQoeEvu1GSoez7GcLUxGpchQK1phVJlPUooQQSoYyKQbTPEyZS/aBdcezsl4zuqYDpehyTJu8zhtI6KnpJjNIlH7qpRyx7a+qIx2gfSMryq6BYeR1H57pEjXsMvR8Ep2HoSzddGKx2A4yehgsM8d7Gy5jzpuAT40L4GZuHET+yafLa3zhJ0bgymYP4QO7HdGUcFzH+WIixUESIIDfZR0PqGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(10067099003)(261028144727099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vk3lPvpPw/ZmEKwlhdjYATUej/Tlxk9pU1FC4DVf/AlbBOYGIBXgrn7Lp+Vt?=
 =?us-ascii?Q?q7UIGsRzOP5i4VniPCjoyterufzxgQK0tn5HVNrSF38m1foTXIMsCqkS80TL?=
 =?us-ascii?Q?L1ZtXAekRImGFF+xwq3wRmuNcEPjCN5VPZwPgIHsxoVoHbP6g+NpUe94ZZGk?=
 =?us-ascii?Q?WzJJfy0YgFxjkQ8T7kUS1IeUGvQhdTOyqXLfapDsXrxYqpK/FUaSjtBo3COO?=
 =?us-ascii?Q?HK4bWAYo/zCuo0D24OsrGKfICSukkvajdF5ai9sRvLfXTQd7y3xKWUPIhRlW?=
 =?us-ascii?Q?n1CNbMQ5gym+uSUHHL7WulxPIbTwuLnd7EQUY161AyaRhqYZOsEYG6HBPw6a?=
 =?us-ascii?Q?4fBBzl7tttd3JCLyMdmqQBQkE5xpBg5vx8+qASE34XfT2nLjVxHxO8NUUbUz?=
 =?us-ascii?Q?qZOuJ2h4O2J5qfsijSSckTGZO9oHPRGyuc9AghreRn6wsK6YARXgVbIm2kdu?=
 =?us-ascii?Q?RUMejwkbcSID6JRDsqI02Ubgi0+THkmxyIdB1qVScfV5ncDqnY+mkWHLo78n?=
 =?us-ascii?Q?dso5kYZcYV0ueQd3uGOigpXjueQPCKRjiJ0UGPN0fes07TBfPFz5zr/5WdAL?=
 =?us-ascii?Q?bfxvgBJuWWGIOMBqWFbaciof+dvc7MXRDL7ah/da0z78iPebr7es9lSDg3BI?=
 =?us-ascii?Q?AdHZ0LjIPq0JfalepYloqsleYyidM0upTwLb38tPHT5PcSShJGb++X9EjIEh?=
 =?us-ascii?Q?sIqTWzNZ4N7mjpiIW89F6HeKdXxCoP23HBjVh8L07TYUUU1ABDZXtgsdfzjW?=
 =?us-ascii?Q?S2RFKZr4bg29WH1UzW6vL/Z8hUZ6BOjhRazYXrAeui+cDX2fPoItreC49ah0?=
 =?us-ascii?Q?KFI5Ng5haAriT7YY7JnLXwZ/QP0bP23Bx9WcK4swomyp0qqPwYWEstMrRKQQ?=
 =?us-ascii?Q?78jVDhgT9VKDN7myqH1Wivj2IDhzdyscMbhlL/myDcXNrU/OVMp1R13gemre?=
 =?us-ascii?Q?N1sRMCv8nvlKTBvEWUYsGBXiEkAgwGTZIYq4syaclauTFTOOuNionIXnZYaB?=
 =?us-ascii?Q?D7mXjVHj6hlsFMqRcVPvWcSQ0MUhWr2SsYwJKsy6/f8b0AOfMHMZqMQ46DSR?=
 =?us-ascii?Q?rxaTxsblWdWOXTFkV1UXObAnGmEg9AVmEh80Iz1p85VJWci8ukj1D23Lw0ZL?=
 =?us-ascii?Q?gYcidYhSJCZj5FwxzMRRk5PHfSSXHDWsBuLTl+Y1wmmlJj/chRnYqFJ+7OML?=
 =?us-ascii?Q?QT0dqkdb5wuBifVXeWgKKV9IBKyAB0anYv36LCWZt9kcuo6p7OnJSzZuAewq?=
 =?us-ascii?Q?Zp6g3+ecarq20cxkhrQ6eljFSEvb4pnYrYQn9JC343UGGQqdNvg0V1Oh9hi9?=
 =?us-ascii?Q?hzKo6Q5nxCEUfOl3l7ABQDwVQLHD5YN3pHwn9Od+RZDs6Gig0CxtJCdIHexs?=
 =?us-ascii?Q?Pwf3vR9XifvW1it8pGB+4zMIPwNxTNLM7bqoTcOpNhikqCR31IxSluYyFRcH?=
 =?us-ascii?Q?svN+RJkvhT7SZws8SfDur1PtoN433vDnPGvVcWMdNp0wzC/Q7rIuL/H3cpJj?=
 =?us-ascii?Q?+HKL6BMyFHB7sw/tYoZE0Q2kkY6PLYy3y/aJG8tenBOwafgtr3aG1gHROjCL?=
 =?us-ascii?Q?xQsYzu8YkpjpAUHj/3bF9uqSkIqsCYlZsBKg+nUVXwYp/XYs7v7dvkUVapxF?=
 =?us-ascii?Q?xZt5X6nzvCoSfCK0EqwpK13WCsIMpMSaSgNq2p81z0Dl7MPB5/gCPLZtxsR+?=
 =?us-ascii?Q?DAxU6jJRtK/HggKFxfS9Ug376Td7NLAe35XHrEvHrp1P3XNcgUF8QYRWVs1b?=
 =?us-ascii?Q?SudZgovCbQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e77c194-6447-49d2-197e-08df365c0b9e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:01:47.1993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkcSy9a/QCQPxJFZQGr2VU6qHTBgPX+SG517s+xiLEizxNMcoOkJ+HdxnRtICzFVgo4DI0TgpZWKLpg0nxx/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

Hi Marek,

On Thu, Oct 29, 2026 at 07:08:55PM +0100, Marek Vasut wrote:
> Fill in updated email address, no functional change.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 75ef3d1aa9d6e..fa4dee57bcf8e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19168,7 +19168,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
>  F:	drivers/media/tuners/mxl5007t.*
>  
>  MXSFB DRM DRIVER
> -M:	Marek Vasut <marex@denx.de>
> +M:	Marek Vasut <marex@nabladev.com>
>  M:	Stefan Agner <stefan@agner.ch>
>  L:	dri-devel@lists.freedesktop.org

Could you please add imx@lists.linux.dev list as well, while at it?

-- 
Thanks,
Laurentiu
