Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6F84266AE;
	Mon, 31 Aug 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190317; cv=fail; b=PxJghKIDeu1PIQVZYl4tyBeY79D5o4OkLrUYJLsVBB99Vw8f+yY1DiFo3kLUk0rcHw04Z5e0sKM1Fq5RC65kmwYLq2xcj8CGpgjGO7WgAntapP6ZHTNn6KVkr9fubBPjNNzTUDTkM4N4j8vMJplNkUWrVRt2gdY+QklgK6TwiD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190317; c=relaxed/simple;
	bh=32pyok0gKcLi0MHDgKwbV9WRQhCC2e79RksvBq12PN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aDSxdxPSNLU0xxrmWzwl5lW78yDWTDnFuK2QguBKiumYMWzwDlCnBiO6MIK7CSk+L76cWgZrqFqiw9oILhSHC9J47/3IsaAwDMyRJuw66+wMJrcSbZs+RXh0aUOMrIxAeokUreNTfHkcnMCnxbX4RhAg4mS91s6AMJpb0fqNJwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kWdZ9hLB; arc=fail smtp.client-ip=52.101.72.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kWdZ9hLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnrjn9uALEZjYqaP0JResOK5C+7DcOARu6aLQbFasXbMa3farqiOvV5T7aDKtv1JKK0yZ5wxk3rgCGGGgiYPA+ewV3afxDtcT0xH3Xs6nKtZrdAPp02CTpRZdq7Dz3LitXlMlBci2wBlFpUzq4nTtp1P3ptQxTHIjR8/SXCPmsPi+Taa/D/YorurXpdF7k5JbqIi8ts4O2/D78kwJbB7OqRHfqa+lmcSVRM8JUU4UXLRvkjR7lL4B1EhInbBl10hHzXcik85xxLC19FqhMjWypgh7xn6HeAVqUh141a8cMJBytqVl/7pANDgaYzSaoOsyIr+EwpXkH0kQkI210PZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaS8NR1sJ4QHbvDwflhJNwrm+x82RTDg/5jni6SJKAA=;
 b=PO7KZ9aLuoZo6qoEVD/r6n5jC/ofkrFtnPJvCvQ1Z4671CH+VxijXMjeNvm1Bwr66SxKWcQr4OvdMNlvcmLLL66AKvdNCfbgWQVFcfuY1EgV6/YUKry1RpYENGb+71daO1xkWuihVnDIjDUiBpX6RC/7Af3KvfnrVzcYGj6mH18nHkskX87suvGwBwh/iZDCkIvRTPtQmMQ9hmRjwUZ/ZNrqrVLkTP6y4oYxOJ34xI4NcckJYVAg+eYuadA+1wmpu/0kiAP7DIJWHbTVeWkFKR8WuCOFeWQUYUvSQEG2DeOCrr3BoANYkAqTWk1EO/TUannGudM9s4X6Yx3OPWsXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaS8NR1sJ4QHbvDwflhJNwrm+x82RTDg/5jni6SJKAA=;
 b=kWdZ9hLB1nxsNKS+J28czb18MFBM1Uv4S0P4S0CEqZDw4zXSzNQZo+quB1T+M8tXaMVQXxkVECHTmdU9rwDTh0sGTAg1VIxcwDh1B3SAPtQFvqZvvhZt83YYhUyuZzImKf+j4vM7dHCn1xzFrV1VGbV+DfS+Fy/qz0ktqnpPR+CTjqNY/pdVY8Ee30Uq76nb8XpKDkRtfZN6n73xut9pvjrIuevMWtHk9t4mpIqeEwXbUCRVIoppf6e9KDXuf7SN6xry6Lqvw4F5pQm2rEeb8ipJzMSKSDXP0eswy7mo5ryCj+104VNvkYM7PtCqIynAe6fvltcLhZFxS17s/MoI7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10474.eurprd04.prod.outlook.com (2603:10a6:150:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:31:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:31:48 +0000
Date: Mon, 31 Aug 2026 10:31:38 -0500
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
Subject: Re: [PATCH v2 4/6] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Message-ID: <apWeWgaOf5pSSc05@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-4-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0161.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10474:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a1f9a8-0616-4a7f-322f-08df0774f87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1N0e1SfjZ5ZR2UfPRUwbnJmegT0tkE2u/3Cwsqv/XTZJKcWgh4kyH85W0IGfqi2sl3LuWLHmS2Z5lpa1fplfp+x6Lm6vYQhp9p7PZzwVJR5Sac6k8/MdsbtC4psIKTDPNPE6i2Ww3yNypUBs2G+t/hai6rqzh50zOk3RFiPPwXbhmtsK5ita4PvgcBAKyApMCnQEkml/WZ0rX5E84ToYBhqUE7ZeClk98TuLC9RYZL80YhMqBDA4Au18fotH381yOeCSjCt6foZJqOF9+cy+3/7pFUO/fO24HTBZce8W5NpcE3o9qD9L8F5BjZvkqBEm2oCsltE9ovIa00Aq8i0xB9SJQdxmHWXcrC8hfpPt6lT63dbNryYBX+RGxAxg9ZWOum1i1S0v82Z5FvII7df7vsmTwG/F3Josd8z9+NIlBReHQYSj7cE0TPtpwY5l3ADW4Zi73oUWgurG8fm2uyCx4L9HZwJferrVUdtdd1n2P/m8hs8VUCfY2CizQF63SVcWSx0GymmjAwBHpZ2/UWijXblTxpeVnf8vN1bVCYiJpd0snuMuUtzbp3G5YL/AmZdGP+XNFMLB9n/l6BlksqN+R3nfDMDc8rGboEO3zmps42k2JRPeUCIuCMuyPniHTm/f2V5KNH399pFbTnNwt/66pKZxtN5i3dy4O7O1IxcRZfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9MRSpQU5ucihk2lABVVkc4ZpA3BWX+2TN7uUdpj6qfFdEoQAgGjLx79XNzMo?=
 =?us-ascii?Q?XhcUmgL3RGf7OLnCkg1OBbM/81TtEqwhqxq7eQL9VgLbRnJ7eMfS6W4SjuPH?=
 =?us-ascii?Q?AfQ20mwKGHUZCoatotF6pO78j2Q9s3+g9iFOvmajgZgm0JKI0p6PoJLSEWjc?=
 =?us-ascii?Q?6lVtrtxg+IAcTTXn/odFZ0E2nCZc3OAxE5EiRnC4VTUXV1MXxVQQnp79Ceil?=
 =?us-ascii?Q?VOxt1vK9p6aXfvp4ddCevJpKRVL0AbEaj6a47LlLQrHmH7eGq4MiFsLCxeU8?=
 =?us-ascii?Q?zxSHZ0kv6CVwE+JEUu4uO9jgdXPSjcyUxDvRaS3TdDwD3pAUz/0zYJyjAHV+?=
 =?us-ascii?Q?aqo2Se/EdzBC9y7tNO7S1FFvuLQjVTkPN70zcQ0z4TvL+9wO9K8fHbQJ46QY?=
 =?us-ascii?Q?4OzGAChBISBuZ2u0uv9fLaVEPWiC8cMI8s1X6MN0TeQgMIvKwDa3x1e/ZN+f?=
 =?us-ascii?Q?+TyhNfc1Bo/EkfHe/thSTB2Bv4k4hkLZ7DYmsU7gOWU8sj8I9XlHeLch4x0U?=
 =?us-ascii?Q?yFv1Fj2H3R+FaH8CMWJXJG6S2wrNeuSIN9Wks2fGlW5IR/nIssmSoWgk6rZS?=
 =?us-ascii?Q?OSYr8jk0NS4f3A7GuiYsJgASwRWlP+hoFUoMQTQl298+hCirfq/QXr1PdFdJ?=
 =?us-ascii?Q?T6hgEQoUqFHOamTuFHoWlnPXfqC9TC06yl1nX+3ZYJUy5qyhRtSPfxBDuyTN?=
 =?us-ascii?Q?sANm8dEBrQcp71smPePZVPpZcIfmXfa7842P9UzxlLh+mcGmJCBekbnMvTmG?=
 =?us-ascii?Q?oOambizAgZcmYaIZPkKC3cOaBHEJXuQVS/wStUTtsKjffi1ptl6KJBlyCMDr?=
 =?us-ascii?Q?phJZ7F0jSDI2NPDr9m5WijzNcTPsVAp7hLJgAkKQzBUliUxG/0guJBH06hvX?=
 =?us-ascii?Q?/9M216ZWkKYFKE9XxQ00HEakQqaeIiFDx75ePgBzS7rd570lJfp1sNvEppUA?=
 =?us-ascii?Q?9muRkvn2NLGmIHhnyq3lukEtble+mRwceT2Ti5iDiUDGQthm0AF2YpOfPQHG?=
 =?us-ascii?Q?iePpJ7glitZ7YbFBD7x6rnJgsmtnialBcdgaTQ0HiM/G8xhu4bwLLoIHnW2F?=
 =?us-ascii?Q?RsGNkZ39OpDB9pJ+qlGBCDO8vlxShjpKKT0gBCA6rUYHLRkXq8VLXWkAQgcC?=
 =?us-ascii?Q?tIUOqTFyFwphC4Bje31RYe8w4PGSZA4UWXnQ0IUEEyG2XIB8m++477TQ7zGD?=
 =?us-ascii?Q?AYOTihpngBGsDm8cX4aUxf14NXTTJzSCBvbDI4BzT6uq1hboiS8qOo1N2kgl?=
 =?us-ascii?Q?j/8bnz41lmBycwIghh30my4McU3/wUxND25Szr+azWBVBmHEC+vq9v70YlBT?=
 =?us-ascii?Q?GJAUlgT4YBc7fuoawnrlbI4RTqQSzx/5Tm1vEgeuOPYK7tNkpp5Ew6ap94EA?=
 =?us-ascii?Q?6q6my9/CVDMuDZuTGdJhtDCGatqZW2BOA+VBsSmcrAuLxNqT+CIDxdpqz+To?=
 =?us-ascii?Q?tivGr4p/7ONPexJnB5tQ1Zm20Ex4ItRZP+rN3jgwhO8RsFw/MLv6LN2hzfHi?=
 =?us-ascii?Q?QMQa6Ri+u6MCJD9Oi4/f7LTzdOVcAdtGuQEiNWL7ItEz7s/xlnMFJiDDZ7y3?=
 =?us-ascii?Q?h0q9ywrfhor81kZNHbk650Tlf12ndyZFKjap+eOcLnX7yjO5UHSlOLAmRV4l?=
 =?us-ascii?Q?q8C6OJuXWRibfqyzkWj9pwhUYSm9+hCYFX/jvlrsN7e2eDN3DrGaq5r305v4?=
 =?us-ascii?Q?7yMeIkcZEwKbGrliCzCi3QqFLNkaP9TZEZ8ETZj1Fk/YWv8W/ZQI2RvokZXo?=
 =?us-ascii?Q?FJSLds1s904sKPP2u7DCxgkLCgXY++RUeQovkTrga1+eLhZ5vKyL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a1f9a8-0616-4a7f-322f-08df0774f87d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:31:48.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIyKaFYO3PhwNKPpaxn7B+WOAEhYatuztfJPiYC1CWUMqN4viWZ1Yhrs/cCrFSp90bo94lkOp4nhFSPVBNrmD5TA9kNYGpW+47ybr9Ye92nHnQlEF/XVttVY909IX5cu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10474

On Mon, Aug 31, 2026 at 11:36:59AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
> primarily addressing RAW data alignment. The core functionality
> remains identical, so the i.MX952 ISI uses a fallback compatible
> string to fsl,imx95-isi.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Use fallback compatible fsl,imx95-isi for imx952 (Frank, Conor Dooley)
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml        | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 279c9cd3034a..d0a99f00a45e 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -18,13 +18,17 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mn-isi
> -      - fsl,imx8mp-isi
> -      - fsl,imx8ulp-isi
> -      - fsl,imx91-isi
> -      - fsl,imx93-isi
> -      - fsl,imx95-isi
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mn-isi
> +          - fsl,imx8mp-isi
> +          - fsl,imx8ulp-isi
> +          - fsl,imx91-isi
> +          - fsl,imx93-isi
> +          - fsl,imx95-isi
> +      - items:
> +          - const: fsl,imx952-isi

Nit:
	If need spin, suggest
             -enum:
                -  fsl,imx952-isi

In case more compatible string, which need fallback to fsl,imx95-isi in
future. Anyways, it is also fine for now.

Reviewed-by: Frank Li <Frank.Li@nxp.com>


> +          - const: fsl,imx95-isi
>
>    reg:
>      maxItems: 1
>
> --
> 2.34.1
>
>
