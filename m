Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847709;
	b=iZo3GeXizGdARzbgmjyE2RTwzJP/+j+iGUZELf5o9/pJx963lyxhDafiBV7Wx0/pujps
	 xND3M/trOHyR+yCISy5ba1LanmrGgYB4bDneF53nJt+QEnlC82VR6oHtbl7IP2agTtsjg
	 aQ8K1vD2Tt+AOW2fcHLO0v/xVxeIbhoaSFT0osKSdSCforOzNiifmwn+YPbLUKo74oLdI
	 w5AnQUjT91tIMJQz3a4RgqcZ3Gd7LIEFzIQcptdDo+iY50KAFZvycflPNQydb7G/DOr6e
	 Yw3tQlIF/gOKBGwyj5zzDPlz4o91WHodj7but4IMJs7y31r90CSJwrtFBJ9qNDsz/hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847709;
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
	bh=d0trR2MDensqe4nOeWqsAxx+Mxe1ZjRmEJTTXJ4L3Hk=;
	b=j7VNcQ+49B5emG4BJ+uSLogVQiqaFi7Ww8eR6j56ef9BggLsndx0ryZcYv/hgSGxpr3n
	 8ZW1GUiwWZVMxKw32SkWr5EwVhj6etrYgSNud5A6WQs3IzAGYWcnrKI5iwTkBVSEGUG6M
	 uZvXA/jvpqPDA219wzG95ZDKw71SjE03qWpta3dImYxMf8rycovPo+3hXkzhQzK51Tc10
	 w43mJyPn2w+xrUb8PpUUiJq4YwHG4s4eTkiLAnEbLoPO2g+Y8sKstw6zOINIslMUmUDoD
	 g/l04T/PPL8RhLFIW1GtZvMEHwpLX0BfT0nPgTxaTwkLMxzGmvmh/HBM3EOYDksjlRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tm+SB1dR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.50
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C7606A33E;
	Mon, 16 Nov 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40C7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tm+SB1dR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVnVTYSPRXvKOOrLcVLNB7qai7nwGBLnXNm9soyXUh5Rzx8G0ZsnC612YLNCTz0zIFjxXl5hIePvuPEqHYB62juzJwKZ0SUcHfSWeK/USvZtKQwVrZ0ouE9t2I7lT58Q2UjX8a9w4mfWsnBX3zqV9P/4sfzePIg+RvinRcka6cn3bOgyKXAmsb1LkTAYkjeflZ7ySchr5gjFy0gqqBu53hEnBLElsbbElu+JNpKaeJ6FX65AoGdSa3PDaSqTU5c0V6gSRBonFRjYgkxIqJuLY0U6UE7KmiaEFLj/O4HUO3IJQe4HefVeDebyYOOayUJLtSuv3fU0GFlc8F2nyHMQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0trR2MDensqe4nOeWqsAxx+Mxe1ZjRmEJTTXJ4L3Hk=;
 b=iedJrSL9TgPX7g2eHusr0KfDxgcTzLGyQYEOAnexmX3IrU1HEBE7segJ1fNw8vdc7zIbVKA5QcvBYxUieFPXVde2JMC2dRR9OtsLxBhyEFeNLsev0D4fmD7dsOkl2QJd/XKiv/WVzBiiuFihqDCXmC+BlJDl7Mmp8tSmMwFALCB8LNvLCL/jT48Ijxmt2oMhW5UiFNJ5n+fiRtfpAMGSuEpLKCslKbyrVd4sqidT5I7vKAjM1xrg9T5ChGHXrTMGQPvk25gbGcc7sjXkRkd8fkafZ6aFXqGuLpnOsmP7PUw1lp41zlLAmoD1FS/Fs8efeIGZNtnmovJy1hOdwPmlwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0trR2MDensqe4nOeWqsAxx+Mxe1ZjRmEJTTXJ4L3Hk=;
 b=tm+SB1dRFI5g3Wxl7+rOgrjAKNbL09RivrFZFiX0hSHBah5yyOZ2CuVybVMpqakOQ+CLX1t1iRquJ4koKHmJnP+57I76/EbI8nY3lk1QMQren47jYFYcKJ9rZ5lwIvFaZT5NyXHyRHF16Di+YjYT8MhVQQZJc/qYhWQUmXdM1Ohj5n+ZFEflpxzLKXVth+2A4/J5tOiIqlixNVh+MB8KN0soE1wOljb4G31rWdG0h348VWSkvIAuBd9lGNKz094RpXCMoJ6/NtejlKNXsgyUthhB+FZ/nbAROkhvMq0VZuF1SbqeL7qCJ0lZNBV9Da15gHKGla3VOxMrHegXjxrvDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:48:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:48:24 +0000
Date: Mon, 16 Nov 2026 10:48:12 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Message-ID: <avszzLsgIQX9KK3v@SMW015318>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
 <20261116-isi_imx952-v5-7-46de1d24efd4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-isi_imx952-v5-7-46de1d24efd4@oss.nxp.com>
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 439f59a8-7595-435a-78b4-08df44016dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|7416014|1800799024|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|4143699003|261102123227099003|261026140227099003|261028144727099003|261021121427099003|261021135927099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	9hpE/5eF7KYfN/2/IPs3j0x4Xeo7sVtapsccoLisI3d4houud9Zxe/CRup/Ody9LZC8/J2WCC7PZVdHn8NvU9JRscrHnA6m7YM5hL5KU1B01vziKyj+3YpQJNRi8A6EcmZUZ2hBcI5XNn3zSKe+n2KMXH7dDqmCn5gb6LS2c9cSQRewVhUn4JEvyfjbvDY1wW+6ZVxko603OtYGn7rHCqmPj7Kg0OdC0I+SESrwNkuSDn/86Od1yAqLOf+nWOjtSoupowN7qTPoTrIgADHwBsLcSRWNaKe3kSnoVt9o21fEdMbhHaKPXzq/KMXUGQ2tqMoVHKhMXhTWohjOR3NTxygiKgl7/fEqu1Q/MIqZgcgCDcgtUtYtWQGaoHkDV1xGPOhqd21n/Fk4BOBmRdLRtk8DI61gYC4ZXc825gRA5H2p0imaZob54/xSr4tYeE2p6TSqt8/t91kJ2lt9AbceWD0gHIzLg91c4DeBgu+FMxjUTw2dcv0LN8Kl9ez8JjwGeQuuTeBv+pgWRiX7j4/hMfxloEABlO3CPPMgbQZgHC2ngaojmnMLTpdSIUr7xVEtB7khpaghOhZj3M64cduSpFlx41A53GCCEI8rMwXXGpjRfNwvDb9KgXHEzFNhBnlwcv81MRRDThewSRVNs68UVSk27z7BGaRGu3N2lPTSd7pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(7416014)(1800799024)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SIhVfww6ggrMSW31p6GEB5QCUALIYmYMMKVwsZtktTGEIi2RncMVdH7X0/8t?=
 =?us-ascii?Q?WkCSExBr5+yxmdcY+QKMZE4b/rKklJWbILrc1QArN0XXsCgBCvaNieD5onp2?=
 =?us-ascii?Q?08uqpxwM8EYX19PZxC7GanbkBfZgS/mSr4sGPAh1a6/ydq9JKJqyDZmd0JOf?=
 =?us-ascii?Q?j8AJUdlv3wOtr1Usl38f59KDZ4snVgVH7TcO4cFYj4rMDEb3vSSRRLbeQWOP?=
 =?us-ascii?Q?X3fHLgkd6yXtcBJVsxdPabMlru9TpuxWgJ5Acz+NP6C4RPShfd/VxL/z4P7d?=
 =?us-ascii?Q?XRHdltLM694A488SjSMVwAQwt2CxfrkmG3uhTNfbrR5UEStJq1f4QFuhappn?=
 =?us-ascii?Q?u+m4sPAB+PZQmN5/9FuwanOklYfuDVUinx33wV1xMdQOCWr8IjdnZxcJMbuH?=
 =?us-ascii?Q?6SsLIlxOgcKwjthcc2IkXDGfvnsUe8UQqUq6lrF+lImitiX5CMig2ooVfg8G?=
 =?us-ascii?Q?bP7DgjyyrSGTIfazly9dWZjXmMiLNePjdtkQDGyHLfHVpRios/uRLoSjfD1u?=
 =?us-ascii?Q?QL7u7M/Hiw4dL5XQOc3/QcwpPwoAupiBaNyc00VyvvQei/0QEjLvJjjr2sou?=
 =?us-ascii?Q?Kkn58T1eGHblzIEcd6FZY0yjVTSHhaDTb7GJ8FhbA1QGZ+YzUtQnp5iRRmhd?=
 =?us-ascii?Q?mgQU4tMIH0lawZf9GBlSFypMQGyUNU/ejss0t7jcZGuONFAVe8JcTCbN0B0l?=
 =?us-ascii?Q?RKbcIF3cYaDZDvJUrkE1Xxg1/oAQPbtkjt06CcN3m0bZJfHFMyYO/oHl6zIe?=
 =?us-ascii?Q?FQhjHJK/Y4qlxfK2lrhRI/qVPuAYB3728zmCOguL9QJB0IYGrLcp6jYPG/PT?=
 =?us-ascii?Q?tD+1wQESqD53ZSqG9Jo2eIxklWMKU+1TSq8l7Vle2++bF6bCApC3J5OQFfE0?=
 =?us-ascii?Q?YM4UI+5iqMPBgZDCVH0gP2v5NDlPwHkjkvKjNsroQ9XcH7a7EjBWrxAdgBXc?=
 =?us-ascii?Q?fhXYcsCa4bF8YRu+T2A1pA1Hdt+6qcwZCx+aiZ8rhZahpqIsf1bZNiQU1+6J?=
 =?us-ascii?Q?JiOOP4DYYVX3JBvTDXX72bm9sHHlC5H5HBc9UPfmxNIdU+tMYeoin4T/miiz?=
 =?us-ascii?Q?SChgVhZzNOQcW2W+hRa1v3p5bil5QRy0cS5ZUIQ4EkbZeqYhR9yDg8nCws/a?=
 =?us-ascii?Q?BS5OejyORPLvN1eo+wdbbjBuiMEPk2jBzQdIztunhyglkqpYru9Xi9XomZWF?=
 =?us-ascii?Q?O7NB47EerrWDpvVR/bEVQQuhQRz4YUy/53EafU7yYJZXjKvyBq8zQkYo3RO6?=
 =?us-ascii?Q?+gA04V0/fua28vawoDTALK4tRtU+5/VTfYHwVH2UNWaeNOFOHTu+X3H9tsos?=
 =?us-ascii?Q?39SLcN7bZEtwP/yXdFegYebyHueKljZN1/lNg11hGnIQNi6T1F8vdvqga5I/?=
 =?us-ascii?Q?W5y1aNzri9hgWqosIKuaYYr8TSxTWsEGvYFMYJ7CUjeXlZrWT9rSXKbF6Wdz?=
 =?us-ascii?Q?+Ofb9x/rB4UwIXkerTwh9GxKf4xGgd5JPpr09qR4fNJ3seabYNNFM660P7ae?=
 =?us-ascii?Q?HngpbHFf/pMHdlGSbPdgkQmbvwrTOWHbM1W2nYO5tviTh2HHVOz2+1Zn3n74?=
 =?us-ascii?Q?n0GWRGv57DdCNsu3PyYkda+nQhPg8fgzSJUGSUNQlUnk3z0umeIhmhBTbbM5?=
 =?us-ascii?Q?zOl/0fxnPlC7mLYZsd2XR6/ddAvg1nuOHNxUqUrurgAkXNC227mn0VQa1ty1?=
 =?us-ascii?Q?jDujcapjku3jOOgKGwA7s2OzGzylAQFHjP33jdNjQkYvhNtCQroI9lEYpAgt?=
 =?us-ascii?Q?gRRnuMcEreyLOBWullAaZ2dCL3pT9PPj6FuX1zPxOIvIDAykczLU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439f59a8-7595-435a-78b4-08df44016dce
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:48:23.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnpnA+IUGgj3Zl9FPWMGStGDosoLDTnkWzBhb2nsCzYLBzUSTPa5yDcOETQl7L3CTruVt6nvhydxUOolUIm340O6fncslaSMILHwmtVO2XRXaU4Lq2++E5h4PNjS+ZqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011

On Mon, Nov 16, 2026 at 11:28:25AM +0800, Guoniu Zhou wrote:
> The ISI receives RAW data from the Pixel Link, whose alignment is
> determined by the SoC integration. Before i.MX93, the Pixel Link
> provides LSB-aligned RAW data to the ISI. Starting with i.MX93, both
> LSB and MSB alignment are supported and can be selected via
> CHNL_CTRL_RAW_IN_MSB_ALIGN, with the default keeping LSB alignment
> for backward compatibility. From i.MX95 onwards, the CSI formatter
> replaces the gasket and only provides MSB-aligned RAW data.
>
> Set CHNL_CTRL_RAW_IN_MSB_ALIGN on i.MX95 so the ISI selects RAW
> samples from the high bits of the Pixel Link bus.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 20 ++++++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  1 +
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index cc52a90c2477..b3f32b9796d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -303,6 +303,22 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
>  	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
>  }
>
> +/*
> + * The ISI receives RAW data from the Pixel Link, whose alignment is
> + * determined by the SoC integration. It originally selected RAW samples
> + * from the low bits of the Pixel Link bus. Starting with i.MX93,
> + * CHNL_CTRL_RAW_IN_MSB_ALIGN was introduced to allow the ISI to select
> + * RAW samples from either the high or low bits, as both LSB and MSB
> + * alignment can be selected in the gasket.
> + *
> + * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
> + * must select RAW samples from the high bits of the Pixel Link bus.
> + */
> +static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
> +{
> +	return pdata->model == MXC_ISI_IMX95;
> +}
> +
>  static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  					enum mxc_isi_input_id input,
>  					unsigned int vc,
> @@ -357,6 +373,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
>
> +	/* Select MSB-aligned RAW data from the Pixel Link when needed. */
> +	if (isi_raw_in_msb(pipe->isi->pdata))
> +		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> +
>  	mxc_isi_write(pipe, CHNL_CTRL, val);
>
>  	mutex_unlock(&pipe->lock);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 5f66b7c9cd1c..35438abf3172 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -20,6 +20,7 @@
>  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
>  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
>  #define CHNL_CTRL_SW_RST					BIT(24)
> +#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
>   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
>
> --
> 2.34.1
>
>
