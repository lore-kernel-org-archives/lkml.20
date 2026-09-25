Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF403909B5;
	Fri, 25 Sep 2026 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348783; cv=fail; b=uM+cL1WMQ7FPEy4FJWa7c6tivKUvYyfmOB1kK4uLdRl3vEZBHLvEf3VLVikgigJG4hW4RizCt94VJwCTPrg8I7kbRtbNg0p8xRS358/+tHeu8UeTDDOtQUHQtKebG2m6ImLbUhLxXU7S/l+8CtoAYEWqlduUBuyQZSQSI3W3HCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348783; c=relaxed/simple;
	bh=0lTLEkpQFzj9/iX2zQmG+Pl5eo1ImEetJKAm47x6SmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TVF8U7vml6MFuANe/WoJRiSUsHroSss4ZToqyR8adqpNco2rO7oKkKzLrh2Wkbp8WCxF3p5s6qDrkkTZPP+Ff9bxHdRyylHs0CX15tp4dYtrwxlu6IYXuQGHBtzS/MO4VEeMDWPuHSs0sYDWywHOFJIcusEmzSkPCcnrukwCVnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d33yMXrb; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d33yMXrb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rab5uVJChRhWXDraaALVIyp+oUpOrv9gZoFatZ1NEZ7efBakgsQU1Un8BEBos/GF+zWcn/MPuBXlpZ4CtPrTGURy9R6wQBe4cLUYmZqWr4XUSLFfDZNPmOPUizekWV9ToO88K9rZGXLFoGVTvGpZkkGL+B20x4ldsfU/91WY7QAGftEHUhBREqHRucaiLTrnhTPa46hnecD452mC1c2xOTuJfdOD6cBTToLEX/aWYHe5zuOzuG6/gyJyVkUuE1sd0jTlyHUj0APBNVNtWB68jHzgtEOEudJK/R1p7d5NXnFYKE1vcPeeqGorgJ62+YAoew/yLfZBDz5I9cKvY9qUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDf4fRv22RPZqQV/m2PYAk90MFWNIhb7qs3TxYULo+Q=;
 b=c7z2EmD15m7QMydld5GiCAjZo1HAWEhQ/ptoSMCLSmoLV+ldB+B6+WMAQ5xwtgVkb0mdZvNs9QQH0LDPCXKHOCYaPQlFMofSdbOiww2zUxPD76eSbrJoP7u3NcQM+7cCb2XcroJJPH+414vmxrLoSA3EW1qOw47RSgQvJqKwJVBuodMPLi06u4ZVjURz7IL1/6ZRcLVk0NDAFIVx2MB4E64NrRdY+2CquJJVbIW68GCXrGKYKI8L6i2Kp0hKLKfIFsV6a9T2roJ4z/uXw5sdU2xjIvfyB0uKZjpnjyJZXLOLFSvH6kgZfTXi87L2ai5cyocUjgsQJSl46ph6dJX43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDf4fRv22RPZqQV/m2PYAk90MFWNIhb7qs3TxYULo+Q=;
 b=d33yMXrb5RWVwHIi9kGPYYPrlVfjeOVYIkBzdRawHLHscoTQhAfICsD32OLKqyuiLRc7WezEEty2IoSKxZ/DKebKmVXu6bJhG6RiVg46GDXWIo4ab3/9WCD26vo4QZXzgVf1l/V/tGI6sRRk/USE+dNFqxVAsYk0WXanLGYKfjOaweOGnmvYH5c79xiT6rSbLVB/OrUs1b0AcsND0LvL7m4JbBpXGw87Z6uzzBJLIoENuMhYVPKfy2OQfE1g7nMszFIjfeSOKCseeWkp36dkD8Sv9wYugg43M3APEjKbjAr0bsmSV3/3DucvqqDzCYHl7ZQYc2rRQqe59osNApoLWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:05:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:05:53 +0000
Date: Fri, 25 Sep 2026 10:05:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, conor@kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v4 3/3] media: verisilicon: Remove useless internal fields
Message-ID: <araNxsUtc_nfiSO_@SMW015318>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925085152.41852-4-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: CYXPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:930:cc::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e1e0ca-534b-4f7a-07be-08df1b167e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|23010399003|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LBU9G90VMK06yJrS8sLojx8kVVP9x3c+fmkEMLPevBQkphkwlfPitKAS/8NCmLxd8yY8aNo3S65KNu2QXiUZ00pAJBbiSqAU3dIVx0N0pmfLYiqkEaku7AePVUiio5g94WxZlqz/JuZpA7EEF/fpcejgwz9t+IDB5JGzSBiKoVXCcE4kASQQG8ZShKLbO1Wc36mUJuhhJoR+3mwcHj1v8kOuHdIoTq5gslE70BtuAx8nucmFtCdMkQ+S3OTGqy7mR7YGDA6n2kokWVaNxVbXtKIjY2u295VwM/pp4p+YPerMzDIhhBR7wxBDk0Yq5XUXVUnzB1EYK7oZoy5lt4LsY+0k1dgHS2S7ypHunZHy1AvkFG8rrbE9CvQSf7mJOXIgA7HaWzdzzZISKMce1sSo2dHxlRRTnYR97XSFAJzcIHfY0TzYFgOleCwx4FxgCLD9QcrCwr1MsKRYqXumDNr9SkxChUqvh7Jnnqor72+MsSla88v9QvVusjW+CSEPYyDpRHD583p7DQMlqsaNeEr5V5JRZAyBGDKu9+NhSkU2y4RljNT11ThqE5P7SW01r1RzZcF2IGoUgM3I9cHg7JXPyFBOVvSRe6ArMtPAxgNt4Kwk6xOt2VBFrt+Hrtf46uW8HPrUGdeesYwORQPNI8gIU7sJH6Osx3jkX0QtokO9mVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jtid8gVLnBOH7eIjS8sTV7FUxqt4al96l1wpmkOntH++lkaCfCdrx2Bqo2yp?=
 =?us-ascii?Q?wRxDnDGnPKXKDfqhbguvX+jYNPJ83++n/2EQjc7fsjzWxndT9xAFqlgluTmM?=
 =?us-ascii?Q?MoXq7TdPXROUzCGVzD74OGnQR74EfOr5Jcpc1j2f4KBNsarjSb25AtANeDlf?=
 =?us-ascii?Q?BueFYmnFEycBkiaPbiTx4VzNRFXSWEefzdLkTYG/4FkT8qEJYYA/oxEvj8FB?=
 =?us-ascii?Q?rFH5uvKJvMWdL9xpkKdm1P3+uUzF7HFteFHvjqDYZ07Vc+KWOP0NgLmW6w8C?=
 =?us-ascii?Q?WbmViPdwJQmnZsRJZeEGv9SS36Eb1CSZUIqatCMvqSemGdSATlnN+d7Tv8rU?=
 =?us-ascii?Q?0J9cNQMSuHpBVNAd6Scxs9hi7r90jXRwoIA/Hqky3MiJbyAGquGSwCGuVbWn?=
 =?us-ascii?Q?hJNZGpl1FpnjfBEhjHSa5NtYbwT3O5nik97fQUxKN8VRh+g3sonJ1SEV4N7u?=
 =?us-ascii?Q?5lhr2JWkcBonECN2rdBZZfaPoJN3dYgzkiISXOmExXGdzPGSK3tZNjPwmWwx?=
 =?us-ascii?Q?QqNOo5XjjTIKnCqMg0eFkyAzHgoM3aUsXA0QIYevXVx0qhmItTb8KEYP7y5q?=
 =?us-ascii?Q?utxYOQhM2NuId/w34CZ6y0MVc1Sl9uF69T9UMahCw7wd3CGOjV6WDyE8BTmK?=
 =?us-ascii?Q?Jz9XVULvfJnMk3p+cwM/KRM++GJSg42ufv0mDOq5fSfGfukwJn/TqVCHyayF?=
 =?us-ascii?Q?jD+ZY64egIg2uRmFuYepAi0vFD1veroc/hb57ss7xfAMqOUViv1e2c6NEhwb?=
 =?us-ascii?Q?ksQtK2SllFZu7LCbCItf7vSSHFmRz+md/4mTgfj4ph3iRmBXUnsydaX5gSky?=
 =?us-ascii?Q?eUZBObe2ugOguWVD0Bb6RoG2RN/potGpq1up/A26KGKeWSaUprvMBGG8kkNB?=
 =?us-ascii?Q?+l8ljk11VMw6hCGYulW3aA5W65r8GiK47ebqQKpGYQa4hAh8OxBbWjtYeBVM?=
 =?us-ascii?Q?8dwjYCzIdVrGL8eKNE7vltJEC00kHsmRTJwrYGmxglw6rACtg+o4SvdCFuBq?=
 =?us-ascii?Q?MoC+KHvNS/yFSu1sDLt80wi6bScwvUpwceQKYto1aK5ZsuhvK/mTFSWtHIMh?=
 =?us-ascii?Q?Quj2WmwRiCs36KZjvqfs4xVLkAqTq78vvzPFUWRYYlvrjWBU8drXYA1XIhne?=
 =?us-ascii?Q?5U+zcr9tbhOknxnB+aHaGaFSraUqh6Os4gtCKvglVBRTm/Wb2xI/SxYcu6Vq?=
 =?us-ascii?Q?InLBgMLs0q1sGR/pcdMe7BpOPk0i3McH9EWZfnAjGENtW5lEpZMoJgDY+Ptv?=
 =?us-ascii?Q?Bz/84azxPlgRBXe9MRdd4HYuaJYsJ/byhOjHsjtjE5fmL6699y6rhkKftMgh?=
 =?us-ascii?Q?KGcifqenzJo2NscNHcAJoqeFg1ubqcLjkfbygl5juwalEcuwbxmJzr++uRCs?=
 =?us-ascii?Q?v4BYTZjysR4eqyu35WZCeTO7dHucsGRGpTxWSPmzJWuiRzy1L5uwhVMgJQ19?=
 =?us-ascii?Q?s6I5PZS4nPs3H8lDbKMjIosBUjcp2pSXoe/1iD2p8MSMCBbdIiR7ggnqh+n0?=
 =?us-ascii?Q?5zVo76Satp4xlPqb6IEQscIrpfRU6UzK5dk1fbwTfBLQ+iicDpxLbepdLw+N?=
 =?us-ascii?Q?4sIj9QjV44Hkf43L+YXidv+E10p1tfNpa5hbYkZChV1otC551f0EgixxHkWh?=
 =?us-ascii?Q?53F6OBWBkgA8FihdhBj7xyPa/5vEZ1NF9iMPsVLEGXTpUfxE8fxdYOcX/1rp?=
 =?us-ascii?Q?/P6LADVN8JGDecVan8zdY/3v9+WzVUHMEjELt4v71mb9uy82+1d64f5LtOTT?=
 =?us-ascii?Q?h2oCSw0bzCROnS2YyxI5bpzBYb74pU6NRIgW95Cd3J//EnuFoKIO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e1e0ca-534b-4f7a-07be-08df1b167e26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:05:53.2231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIVLfYtG2gRzYMhWiMN8iaqswC1Kmb44KkjuafuiLX1FySszPO59vkNHxGuoi0gf8RVoK84WcQFw7tnPD/Rnb5DrRGclioMdFlL9GgaoL/VJ5AxI8TembcFzPi3kTmFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834

On Fri, Sep 25, 2026 at 10:51:52AM +0200, Benjamin Gaignard wrote:
> No more variants are using multiple registers regions so rename
> reg_bases to reg_base.

Nit: add empty line between paragraph

> Remove the useless fields and simplify driver code.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> changes in v4:
> - rework commits messages
> - add r-b tag
>
>  drivers/media/platform/verisilicon/hantro.h   |  9 ++-------
>  .../media/platform/verisilicon/hantro_drv.c   | 20 +++++--------------
>  2 files changed, 7 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 0353de154a1e..ca03bc690fbf 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -72,8 +72,6 @@ struct hantro_irq {
>   * @num_irqs:			number of irqs in the array
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
> - * @reg_names:			array of register range names
> - * @num_regs:			number of register range names in the array
>   * @double_buffer:		core needs double buffering
>   * @legacy_regs:		core uses legacy register set
>   * @late_postproc:		postproc must be set up at the end of the job
> @@ -97,8 +95,6 @@ struct hantro_variant {
>  	int num_irqs;
>  	const char * const *clk_names;
>  	int num_clocks;
> -	const char * const *reg_names;
> -	int num_regs;
>  	unsigned int double_buffer : 1;
>  	unsigned int legacy_regs : 1;
>  	unsigned int late_postproc : 1;
> @@ -184,7 +180,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   *			dev_ macros.
>   * @clocks:		Array of clock handles.
>   * @resets:		Array of reset handles.
> - * @reg_bases:		Mapped addresses of VPU registers.
> + * @reg_base:		Mapped address of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:		Mapped address of VPU control block.
> @@ -204,10 +200,9 @@ struct hantro_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	struct reset_control *resets;
> -	void __iomem **reg_bases;
> +	void __iomem *reg_base;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
>
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 12c804dcc669..6e3a24156a69 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
>  	struct hantro_dev *vpu;
> -	int num_bases;
>  	int i, ret;
>
>  	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> @@ -1128,21 +1127,12 @@ static int hantro_probe(struct platform_device *pdev)
>  	if (IS_ERR(vpu->resets))
>  		return PTR_ERR(vpu->resets);
>
> -	num_bases = vpu->variant->num_regs ?: 1;
> -	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
> -				      sizeof(*vpu->reg_bases), GFP_KERNEL);
> -	if (!vpu->reg_bases)
> -		return -ENOMEM;
> +	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(vpu->reg_base))
> +		return PTR_ERR(vpu->reg_base);
>
> -	for (i = 0; i < num_bases; i++) {
> -		vpu->reg_bases[i] = vpu->variant->reg_names ?
> -		      devm_platform_ioremap_resource_byname(pdev, vpu->variant->reg_names[i]) :
> -		      devm_platform_ioremap_resource(pdev, 0);
> -		if (IS_ERR(vpu->reg_bases[i]))
> -			return PTR_ERR(vpu->reg_bases[i]);
> -	}
> -	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
> -	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
> +	vpu->enc_base = vpu->reg_base + vpu->variant->enc_offset;
> +	vpu->dec_base = vpu->reg_base + vpu->variant->dec_offset;
>
>  	/**
>  	 * TODO: Eventually allow taking advantage of full 64-bit address space.
> --
> 2.53.0
>
>
