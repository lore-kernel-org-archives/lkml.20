Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC8493656;
	Wed, 23 Sep 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173799; cv=fail; b=fTPKA144Tivbnh5KWA7GTkFh1T11fYWyJFF7eGMQPwU5QpkfJ+NhPR7HEiWKeldJRSBDgJkEdUgfXVKK7SVMg1EA31Cbm5bYMcDXrGd6P5SwGWuGKjslkx98vj0kuriWGV9bjhdPrsyncTIrqQxYLlIbrPeJaAJ+JzBVXQyvWVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173799; c=relaxed/simple;
	bh=sviNLgpq/N3byt76idbuBtIeLBte3smNtCiY39vXZMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tcXuxIDsXLjziDZW72Y3xvwCB+Fxdn6T+uFhd3ofubMKIgCnn/P9YtUwitY+f/xwpOTg/g4potaXeYJtbRYh0FjrfLdwWhTyjgrWFRNhBGdLkpmEQST3ODQrr3TrpMF5V6seEyPJ2G57I2rXAMIloV74dS8/ErHLG7HpjNFvXUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R9KR3wtq; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R9KR3wtq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjSFpi1xChEyJkdesCV6TQ5ZRua2QpSFLbSmy41gA7wWgOPgoIwI9UvaNHADEle8slnbk+kTr/sRJFUkBBaKiHXYG76o9fV1dfSB8OhliRbgCQTa49P3x90vugmAYKghUOVu2ByX1qLyM+IxLdwIE5iZTeCSqfUtnn6FmZ+3y2zI+ozTzZ6o7Mqy7h5mnEUFUH31D5XuMOJN2RPOE8stY+BisD9iQ2f3Re2xllKsIolX5hhzcJ0BmxuIMxB5orjTBxDMHwyaIrYxoWq1XxSCiBfqVV6g3ksjsxGaOKigdmozdWdUET8gkk/MoB8/Yqo6SuJTs2Gf9zRDtl5yRvIb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2o2r5Cp9tnxXwIsrRRMBz/IUuGsuEpfXEe4V/dJzyw=;
 b=PNw/pr+vACqWGl4vDEdfBV3q1pS1dPQ+eG+2oqk/1DoKunrPVvqbBSFblpBQPRRoSPBtUmdnFXJLR4Ig/00x75we5NfnXgW1oGsPHaIRZVJpWsOLxiAqrtyAUS8z/oFpQAA72brYt3ScsXkgSKmEikkQrhT9Ahy9l3LkItsGeidKns4IKnos0tGqAdo/ne3HTxVIU2YYq/kMNLwQyPnNhbgs+C9yfX/VTUtt3A5nP6NHCgSA5keqx04fvMkIF12HVuFf+7xCfpyuE6NkhswFFgQUew3/Hy46MfFk7yU8s9+xKGmtLx+L0iFpt1RtObqx0Lym4I+Ukez3vdSO7tNM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2o2r5Cp9tnxXwIsrRRMBz/IUuGsuEpfXEe4V/dJzyw=;
 b=R9KR3wtqtuC/pwBDEAKO0Ot2hNp0BwIQLmGl/P6+MDv6jehcaprUmhr3EKqwIeRYA7s36/UyD+FjhFep7LRpYrBdl5oy7U0b2bMlGqjXM3qBZj72/yYBVbJvTsTEDsLL3zXs7OagzfA6QZ08GbXwKy1safJVBpDwlzswEY8WJpx6YOhvga18/B1QncBTqEdidEtmu8lErK3yFalt7o+C5ZjJzgWp9+nz5HZrKSVh+MXxpH+ts/tpUMAzE881m6N70Alx6vTm2X8ao5njTMDKGRyQixllujZbmX7mss+9K0DysZXoNNLsTUIfOGJLUV8wNwfgn3kb5UrNvaE5cL3mMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11882.eurprd04.prod.outlook.com (2603:10a6:150:2f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:29:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 14:29:50 +0000
Date: Wed, 23 Sep 2026 09:29:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] media: verisilicon: Remove deprecated variant
Message-ID: <arPiVEc-SCYrtuNA@SMW015318>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
 <20260923090307.49959-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923090307.49959-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: PH7P220CA0125.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11882:EE_
X-MS-Office365-Filtering-Correlation-Id: a33d64ab-3d3d-494f-aaa6-08df197f201f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|19092799006|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	5FGPV0FGhJpCgl8z2nYON32R13g+bTSBFYuIpmvndepylM8K/TMhOWjjW0S5JIdnWL4X9caocRljzs1iu/vkEYIJPnJNOQeAmjduPNjXIz2j7Ll0hhDa8MXbSpQ0GJYjyJAqcBs0TNEbDc3v5M+z8gsan8LFUD3jGB6QeXjtnREykLycPjKMzCAMbD91nLiTL8RjctEwoej/ruHWtU+Rk7AhqTNBpctm+utSOhmxicy37fI1vB3Z1FS1lBBb7gwVyxaLpy2amG8beitH0A9QPPk+wEdrN+cKPylf16hCRaNPyV2aZZDo33/xRjduIDYWce0SmnxfeayPFKuRmQJiEQo5jASnJH0m3hJpD9k/j0UaHA7OgPo4exi0rhMugQTMu7sgt5nzyZPnzRgdcg5wWyE5rP8xk9rg9oTCrjrb2RKTC0OqWbR2QeyrTVFn1mZEaHDrJg7fPfyUdofve9RbaYRdN1+ipwK7XZz4AbWetQNOiAg+KjpeqnYpC2UzIIuNfehSdFtuawuJ2fKkjbC4w6S37coTMyc4yqAR7sGUIMArLZKsHSIiMu3CbeYxxEgimBdk2y6SythORnxK/+E+QM4/rEy38ZQSpecbnZJnyxpxFZ1LIOIMGGHUCuf/8YtYzmTQ458qboZ2mlSapdXatHCnH8Y6hbemTgv11WzCKpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(19092799006)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sp+RqVjO9NbPY7lyi1/r+h4hU+KOMYsGoLSm6EB4haPDJDj8oznAdeL9MuLs?=
 =?us-ascii?Q?uaDrfrniJQA6ddqNn4TUjI2Bu51lvhbde5MByrWgTaOoOkSnL6Tcwj71BNLa?=
 =?us-ascii?Q?8x0w31zrod+zzcIhUYKg1mQPkxFBDGh37ynTHSRNyx/gdo2+gLfmrFOOlLBZ?=
 =?us-ascii?Q?gknq/fXPYfcGKc2s9o4lDPRF5nKV+5FRUpWJexLMUBWlT89a3XvNvZbX1W83?=
 =?us-ascii?Q?3ow1AVkD24fHQkne+ic1cOPTLGQipAM2/MTMX7H7HyRokAjDsGYZgXE7ub6C?=
 =?us-ascii?Q?FbWXI0obDJzpSyFtxED6jx3mDFV/l/TwPOLdBZqzDGdxLGDDnESTefjtuuNp?=
 =?us-ascii?Q?AD9oU+7Z31XieUPuHHeHv5LpivFkyPnkDFsexnWHRsrv1iYYAz4ON1gq2+Ka?=
 =?us-ascii?Q?JVyWF29JZRyRHXeAHoslmwXTPKlfnJfo0V1B8FPd/rShWfQfIAHtbdPjOPre?=
 =?us-ascii?Q?VV/TbkKfUm+JvEtzwDas2h7ma3XAXphtBh/uc92C79pxDpXL7R4bzlaBPr0o?=
 =?us-ascii?Q?4IssWhvLS0zmsuPNCS6NPniPV6Wqs4xIg+ELeilt1X7FhFzr5wJHpwWubi/z?=
 =?us-ascii?Q?9/MBR4ZC67RCgPZ1V8po1p2NJed5C7rXFl/V7s2TrCJe8j6s4r7oxj/y/oD+?=
 =?us-ascii?Q?axL9VAc+XrHSo1BLnMRa5GNayJl6n+IC55jeHOZPw+lxwRLmSEM+YociMvQB?=
 =?us-ascii?Q?Ju1B7IfQg/E8HVWY2vX5HD+QwKvlnbByq1y8REkpuQfDf83NbT9pOriI7p/V?=
 =?us-ascii?Q?+gNxKvTLuQfIIUi+zlWwSW2eqxFcsTrUheMQNzbdXzUyRNo1MXTa/OYRmdPg?=
 =?us-ascii?Q?CBzNZTvZY5CqiA0uxcQ1ctyCUjjrB3f8FJc2fknOQJ78NE8Aid5Pa1C4CSZf?=
 =?us-ascii?Q?f4zGibzcU12maqjSKXkX1sox0u7UxFr9scmjOz3FPVrqOApBP94W5tuXSweJ?=
 =?us-ascii?Q?tPDrt3RlP8WyT7LStapZDrPZzxn111twooTpkgCntWNJ8HqjuEt9gocqSUuZ?=
 =?us-ascii?Q?YLHU5l8jqpYdzVY1Ty/1cPOs5AYSu+pJZ4PscQoFG+e4GVcc8ZjE7DD3aabB?=
 =?us-ascii?Q?eP4oDoHy3kZejJZ1MTl04sujLFjIIU6LW6wMU2P+j30k3DsXCGalbv+b4a5a?=
 =?us-ascii?Q?uKiSMDn5ZNpJkGZi0tsRSJOAYyFL4xSoHjysqEPfQAi7TgeRQKLUu+9tHqY5?=
 =?us-ascii?Q?jI33yBDbPnrIsDMSgI6CJmsaqnyq5d3rfe97q/ycO+6oTQ5lkOE9l1peQTAi?=
 =?us-ascii?Q?Cg8rzQLQziaM9JgbLoDgcjqXisseFcsBZhsLF88VMzB0WNqTruvuLHVhUi5w?=
 =?us-ascii?Q?lVjV1yDL75Zj0HLZtJEdZK9C+soeGRBIMiv0+iGrFnvjYXZ/Nt70cBsmDAfM?=
 =?us-ascii?Q?aANvSZfN7XhXDRcdcQpRzAIn6xxdVQhtIa0Tuc/4l7bvJMEXKGBPZ5zVQyUh?=
 =?us-ascii?Q?KdrnF7oBqdQ1gvkC4OPFul7Z986t/4E0Gect+pr/uL5OY6mW3lIlb2UQwrkP?=
 =?us-ascii?Q?Px5SKQRcMXKS4r2vHHYUrXv+LsoeW5D1RxLuZymL6qIP59dNhsDCWvR9abC0?=
 =?us-ascii?Q?m8SDfgJsJAobc+nhkaUise4kjN3ekZtSS2k+XvA+yyOOjLKunARXdDlgux2T?=
 =?us-ascii?Q?+S7LCsJIdqsIEsR4DFzrZWoQMbmA9ol4ns4Dyfxgxol9lcDac1U02YUGKUxX?=
 =?us-ascii?Q?HvHeC5+bXLrs0M1huUJRJbT6EmFNDEYXCFIma2BoY7z2r42GV0RP1LoW33EJ?=
 =?us-ascii?Q?OxabMyzeKSyWfhRfxsiBgILoIPCpy0XkWzr2nXf4hdaw56Qr2UOv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33d64ab-3d3d-494f-aaa6-08df197f201f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:29:50.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdcP40TQqU1v6g2kC97ETaySObTSmEI7C1BwYRR6oRKJLKZ4URQO1EMYfPNEA7jUo6WePp6Bj+QoTElRIeiPyCLAjgQs6zV+QZs/U5U6ZciiQdCDCGJbzrFqAaorvxzr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11882

On Wed, Sep 23, 2026 at 11:03:06AM +0200, Benjamin Gaignard wrote:

suggest subject:  Remove deprecated nxp,imx8mq-vpu nxp variant

> "nxp,imx8mq-vpu" is tagged as deprecated since:
> commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 and G2 nodes")
> merged since v5.17-rc1.
> There is more reference to it since that.
> Remove for driver and Documentation to clean up the code.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../bindings/media/nxp,imx8mq-vpu.yaml        |  2 -

I am not sure if it is okay to combine bindng doc into one patch.

Generally remove driver code, then remove binding doc.

>  .../media/platform/verisilicon/hantro_drv.c   |  1 -
>  .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
>  3 files changed, 63 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a5..504ea45355dbc 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -15,8 +15,6 @@ description:
>  properties:
>    compatible:
>      oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true
>        - const: nxp,imx8mq-vpu-g1
>        - const: nxp,imx8mq-vpu-g2
>        - const: nxp,imx8mm-vpu-g1

Rob bot suggest change to use
	enum
	  - nxp,imx8mq-vpu-g1
	  ...

Frank

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..70de47ddb023b 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] = {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
> -	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>  	{ .compatible = "nxp,imx8mq-vpu-g1", .data = &imx8mq_vpu_g1_variant },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },
>  #endif
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..3b63f626d33f2 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -42,38 +42,6 @@ static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>  	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
>  }
>
> -static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
> -{
> -	u32 val;
> -
> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -	val |= clock_bits;
> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -}
> -
> -static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> -{
> -	int ret;
> -
> -	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
> -	if (ret) {
> -		dev_err(vpu->dev, "Failed to enable clocks\n");
> -		return ret;
> -	}
> -
> -	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
> -	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
> -
> -	/* Set values of the fuse registers */
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> -
> -	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> -
> -	return 0;
> -}
> -
>  /*
>   * Supported formats.
>   */
> @@ -234,13 +202,6 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>  	},
>  };
>
> -static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
> -{
> -	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> -
> -	return 0;
> -}
> -
>  static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> @@ -319,30 +280,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] = {
>  	{ "g2", hantro_g2_irq },
>  };
>
> -static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] = { "g1" };
>  static const char * const imx8mq_g2_clk_names[] = { "g2" };
>
> -const struct hantro_variant imx8mq_vpu_variant = {
> -	.dec_fmts = imx8m_vpu_dec_fmts,
> -	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> -	.postproc_fmts = imx8m_vpu_postproc_fmts,
> -	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_ops = &hantro_g1_postproc_ops,
> -	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> -		 HANTRO_H264_DECODER,
> -	.codec_ops = imx8mq_vpu_codec_ops,
> -	.init = imx8mq_vpu_hw_init,
> -	.runtime_resume = imx8mq_runtime_resume,
> -	.irqs = imx8mq_irqs,
> -	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names = imx8mq_clk_names,
> -	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names = imx8mq_reg_names,
> -	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
> -};
> -
>  static const struct of_device_id imx8mq_vpu_shared_resources[] = {
>  	{ .compatible = "nxp,imx8mq-vpu-g1", },
>  	{ .compatible = "nxp,imx8mq-vpu-g2", },
> --
> 2.53.0
>
>
