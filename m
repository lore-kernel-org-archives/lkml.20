Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B92C11CF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741159; cv=fail; b=t8r97Mus9KI8PnQnwzm2u+5v0vG8DPLdVFet5jgN2WzbpocGB/V1sVemR6TVKPrZ96AywUMSIvnsr7h2Vm3XASUV60VgxUXb8jl80jxqVldoxVWFEuAS/xhlWzobrUa8DUmhWTpY91EMT0ubyP59EuvQMjvF84TNUnQ08OJkCjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741159; c=relaxed/simple;
	bh=AR+ISsGn65SX9HDpEqUQObpexjpzzOn8C3AMxbOGNCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L8K4CTjWwQ4IhZws7IYLjs0oCeRGUhQ9RYRcCZpxehjsqDlMb3zlhJ1YYcMKn7ikiwgauyno+GIzn+4Rdc+nMkq1YwpBym7KuXOu8JZdqE6wPb30769rUq98ECtUyiZvAX7EtCLLDJKWjNxlqHLtyN4K9qaxobcQ4h0LBYVT72k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FQB7Nqzg reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FQB7Nqzg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk7ipalRNsDqU2iL2Xpp4ImXKIw/ZQeXWdrgfTrI2lAb/AytAv6K5amSYMAC3HzT7EgIQJ9+Kd7vaLTG7XvQvwCdDpUBp+gAaOlU1uj/yXRaQSaqEkyehN8MVbGTZbIqUrMV7WzQUYOnTw3pYlT6ITiyqTht9GmKtpbpCvpXkl/t88EyVtX6Jrh5d7fULuzjhAHEjAiZuhxAF6xtpeVlThnsS4RkobJWHLzydImhV5JAxrUgV/IhEX5Rdp1yD6pwS4HxnKiWmyNP1joPNXe4whwXTeWw7HkLYJGiv6c6C3A3I+kfsBAWx9U40FZ1uIIOn7zqv2rH99sXbXEXWiAV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQdKeQfUo2jB+jZTDmP/eyM3NkDU+FPfRGitoJXHf/U=;
 b=XTpXejQggpUIzq6hlnM7bSypkIEWXXOJVvkqcDMRuj44MRH3wBkt8AN8dxFaTLMOkCgHJpJfya9fC6cTqB4JipVrQRolwt23I+zUPIkkC2U73TP+EOX/zZnnlT/Dj+4b9quTp1hl8BwjWaBEtygZVe+eUs8/lb7wKUNzW8qBnK/h8SUKYUf26MIHrI2wTdgaaOH+yFB+X0fPiOrkUArh7AdbdpK7po1zvuarZymk1y/iuTprglBf4pJjFztzSA8DoqJ982jjTdboc0fVVzHk+CTUWNlebJb0RMWbIEA14ejFX55Z0VBdklu7OcGeVVrLBFeymGdpvhQRgTGKZUq3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQdKeQfUo2jB+jZTDmP/eyM3NkDU+FPfRGitoJXHf/U=;
 b=FQB7Nqzg58R2iIa6v78fHc6QGRRP/jj5RI6UsmJkVezaVGdwLOFi4tHPMzHbn3OoD40WiZsU/yUA2ovD26wn0EICyrDVkw+EdjGbHsVwGmBKgXJj8mvyqhQKsyuMqk5HNuCAKXULGzgneRihVblymmUfW35nAfU29QOJuSGhNhEkCEdescAQxCF0XdJKnBDodNNTSr5R1X/jgQkcZwSHXPLCggpwspdvEoUYsEovg1eSj402/IKPKwolJ2Cs18j1bw8lXusJgReI8jgoeOc+0jC6nOhW0nptQLgKAkvdT8DRTr6fYhnpxZ6OQRKPtP9e4bWquD/mJrF1BBIxDKVaog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11994.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:19:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:19:14 +0000
Date: Fri, 18 Sep 2026 10:19:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: ele: Fix build regression
Message-ID: <aq1IWrx8R3_GzRSQ@lizhi-Precision-Tower-5810>
References: <20260917132214.730485-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917132214.730485-2-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11994:EE_
X-MS-Office365-Filtering-Correlation-Id: 059b9ebf-cca8-47ae-7850-08df158fd12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|10067099003|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jg/UdLdHqFRi4XKQQbmp7CiNpI3/pIpy59qkPCMXcnc5/W48hDmhec6kvdJScKyIyip4PSQVQK/Gq7l9h2ooa4cTvpBoXVVKG6kUmbjpzfs23gLvzINOhscXpFWAePsPxfm/clIWk7LaNACDKmnVIfBOA1MmB+2xNi1nxWM3C557OT/E6Khzj2tiDW2xFZQWPqj7gLbcFNHDfHG6vYnf2A7pOgqvIfvlN5lQfk9J3ugjf+FhOroT3GkyT/fVdvR9BAojkMX2kF/Wbc2TiU5h2pwgEcAeZ9mJhCZDgwwg5aJH3N51YbptVloR0xVQeGhAKLuXMnkbCVW6vyKfVoPr0MZ6v2slXY/SxX40+LOfvQeMOFhoEg2gdIR0s0z+DZWZmFuVuuxtDtuuuNGe3izYQzXucfOA+03ewTk7Z7TwK+mhFJ94oa53H/lR/4qkOzCCcAmNiD7VZ6h9g9/ML8tsAsMvIWaNWRGrFfA7xHd2G6wBN7CMqV7DKimMEycFW2/haggr0o2aAnof/NrA3QxPjq6+V5GT0kNeRPyEdrtcdeyiT8YzG0U+RBw8yG8yUmKdaDJSMTBKjsrMgFkXjjeszqgTSKHh1dMf0ZszZhzOmS6Ju/LTaw9sjPrAFn/JqI8bX2wnKxUvLLbL3AIU1dcW4ak7anxp7pTMFwAsji6tbq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(10067099003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?vBGCHyoBt7GXGnA3G/D7MS8CGYBop4GmWGU7XvBqdpvLo11qy6yVyFkMJc?=
 =?iso-8859-1?Q?/yzDXVybfBdkIsNUg/nlsucyDu0dlCE/Oz/FIW/HPaMazAFPn65Ox7DEtn?=
 =?iso-8859-1?Q?0m/fB3/9vrA9H/Kwg+/8W/0IvW3v6p5zhUL4ON5TEbP+Sxqdatd7sJqMsG?=
 =?iso-8859-1?Q?XMvUFc+cRHcxcHXAv/A0fbxkvgZ1blFtA0g/s30v19A/FOWUUb7J77FIdH?=
 =?iso-8859-1?Q?Wm599iQg6yvmwBnxrUkG5clAQkS0HzGu/Ek43toGGRCrernm+S6DiQ/IP/?=
 =?iso-8859-1?Q?XnsUJBpC3dZ06ZcED8sRauwl//IHKejrimN5RdCbYQExTnvrTv6V6wzY37?=
 =?iso-8859-1?Q?A2RT6csUo8nXQw/rJx2v+J6dEc3Y7gWKzpTgAt9Dbt1CIQLTGlom+/aa19?=
 =?iso-8859-1?Q?OlyqhrTroWDt0cVEzzuhOwMFeU7KCwW9sBFdi12nsKps6pWJqL7LdIbuIz?=
 =?iso-8859-1?Q?IR3tNRkU7QyDEKK9i+S63rfX2IygXdnrBGRtZKpdv70BgeWroAUTtfLkOV?=
 =?iso-8859-1?Q?JIE3IlhULgL0OHdTLyrR8DmeZEd+GODdThth7+BY0J1NHxfwhlm9S3418u?=
 =?iso-8859-1?Q?b7tnkc0IaZez1pQh8d2RahVM1FxjsC8Xn5UkVXhe8Ynt/IjhkYmALOz/bB?=
 =?iso-8859-1?Q?rIwnLMUiHHoEHgnpw21etIFQ/dRQkIy6qqq941aiXIJ4/m7zonYPQ/h7K7?=
 =?iso-8859-1?Q?ex2JpziCKi0xHxWlo8B2K0MLJ9j2sU/4V2ZgvQbwXd3IcqUKKo5cgum/AU?=
 =?iso-8859-1?Q?WKN1Ytp0Rh+6SXJPknYHY5MJulp546WmFnjBHvjutUx91Ve8JT+cwVmJFF?=
 =?iso-8859-1?Q?H8+9XeC4dp+wPnQbyEkRmUok8RDvfek+fw59zKmGSZMO/unl22IP7Bu1/S?=
 =?iso-8859-1?Q?gYx0vXKLi0CiUkAXoTlNyYF+wAGSiqQicDNlOPNTq2ESh7JcBsBaRxA+No?=
 =?iso-8859-1?Q?YUrShHUug9j50IKnxAyjFZD3WoYUaBN4YEb6Oblz4o2+7BKmQ07oc04Zgl?=
 =?iso-8859-1?Q?Gh+sA0WxurBK4AjExgGUX5+XwAmTP1NL8wky9axLReBe1iRzYnHYx/4rHK?=
 =?iso-8859-1?Q?IQr6rMhJkKrIE2AebegybCqsS5edRZykoD6obJAli2UlsuAixBmcYd2xdh?=
 =?iso-8859-1?Q?cwJcpEMK5R6RUNJj2uG/wbEi23DFXlygCOVtARQtIFlaxkRPLk+JOVty0O?=
 =?iso-8859-1?Q?JFxph9+FeGqZ4sQ6cl/cJxpCQZU8z6LRJu/hR0BsdYpzDgZTNiseBcXDKA?=
 =?iso-8859-1?Q?8EwiFRH+353De3sceT5KmUExwGTzOW4BJDFkeTlxQHIukKz/6YFsIWmcpF?=
 =?iso-8859-1?Q?4c3u7+JeqhbT67NfktyKzthBwZkRh/wvOw7Ek9hUcAcKFE/02ceUEaSx+a?=
 =?iso-8859-1?Q?GUTQOiKQTHWYf0BzEKmoSVZoBDQXuCx/8Vs5DfmZ4erRdSSjocWFvLI3X2?=
 =?iso-8859-1?Q?5K0ze35M6jmD16TjO1FeQndlI8Jt5PM0U9ZWnAC/2Yvhkl6dJzMYyzRwjO?=
 =?iso-8859-1?Q?t1YSdC7SPPUl/RxbzZ1jMcfr/3BkRLy1n4fovGb09Y2FF9+rY33KnRNb7U?=
 =?iso-8859-1?Q?Qv3OcE6sGJPZygBl5um/vBhpyKiUxpLYglvnMFEC3DvTEYt2oxmSyAvZ43?=
 =?iso-8859-1?Q?KAcY8FwKjdgj/Pxn+IUTWxqrypCDke5ZeMei7gRW/QHu0r3QZhpN9LPahc?=
 =?iso-8859-1?Q?oUW+q/3LZcXmu36ycAJ4REiO5kQJt501cvvB3tcGECyUpHgi9JS9z45Yft?=
 =?iso-8859-1?Q?sxu3QxD7thGKf6gpDz1k+65Y1V+5yhFCZL66ibM+YfRr5EbiAo6Tyr8jUN?=
 =?iso-8859-1?Q?4TmOD1mkPGJOM8wfeZdtCWS7g2bXnsWlw6xoVF28EZIAKpE7msgN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059b9ebf-cca8-47ae-7850-08df158fd12f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:19:14.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RbtSr3W5mzaATX6daZR7AwT/psgfn7C8U6nlJ3OJEDbSaWLLYYIkgASvIw4yzLUN+KlD7+6a53+jKLyDCo7Z6Gf2tnC0Owu88SSAajeL6KIyiXO3mkz/ui91Jw1+l2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11994

On Thu, Sep 17, 2026 at 03:22:14PM +0200, Uwe Kleine-König wrote:
> At least on alpha, arc, m68k, powerpc, parisc and sh the header defining
> kzalloc isn't transitively included in the driver yielding a build
> failure on these architectures. Fix it by including <linux/slab.h>
> explicitly.
>
> Fixes: 7560ad03bbf4 ("firmware: imx: adds miscdev")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

thanks, squash to 7560ad03bbf4

Frank

> Hello,
>
> the referenced commit currently lives in next only via
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
> . If that tree isn't stable, the Fixes: line might need adaption.
>
> Best regards
> Uwe
>
>  drivers/firmware/imx/ele_fw_api.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
> index 42cda7de66e2..a3a68234bcb1 100644
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -3,6 +3,8 @@
>   * Copyright 2026 NXP
>   */
>
> +#include <linux/slab.h>
> +
>  #include "se_ctrl.h"
>  #include "ele_common.h"
>  #include "ele_fw_api.h"
>
> base-commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f
> --
> 2.47.3
>
