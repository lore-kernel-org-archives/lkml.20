Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581048821F;
	Tue, 15 Sep 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479931; cv=fail; b=eUUKF1Bz6ono3EfJb1eSzH8FIUFcNzCdpmrHcKbcnEJa9r5BAKEqF1CaN3dZfWYKBMmg9Rh0utXFI4hJjCpfIFL+7ffhXFkpV7sTZYMZZtTTMYeQWDa64QaoNLdOWK95sqjxVAsWuRV1kF5YQwRVRrw/4f8I6ad1Wb9oNbctRNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479931; c=relaxed/simple;
	bh=JCI0rvnTuBA0sjcT4bweG++8wso1dCD5ehbA/+WAbbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rnzBrOlBukZye2LHObYsOLBwVgqmbH216TlcwyvR8QELYDFXbVsEBXn3JTMj93pvfH5lEGHgTXml61rPGUjq5d6UQuHlRLmRfQWOBNaBGh/76D914euFtC3bhmXkbSXa6XoL2bYg1+pBQ08Ih78KH9ITW1YSJuu0zECK4ZUrXbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WRrgpfui; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WRrgpfui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+HwUJB8BD8Bm3ktJlcdIUWY6mWbd+n0fD3gkU4A1029ZpEzW4BHFolC+VxsAvwlwpgqNzzS2Z4oHUOWOAG8XxIauCXHo8c90TjgXAFr+cffL4A4PwtXxz4t3RVl5OpLDNnHn9H1+nLM8roo5mKKEkPbEu7E+TEnPtEm/mR3eYZmF42pmGNX5nzCnA2O3yAhNCX9cnm6uBnrb81FtHSOpcO1SNWJJG6RSY0g6N9p+NjJh5S9n/VpYtbpJ4f0+2Aq9nng8pknlm91WOR9Tajz02A0aXWqpu+TrQj01zh4aUCooyJhOAuzWBG3vEz2i6RLmsJsw0c9VM6r2q+5j2/Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1/hyQlWI/dFxiV3hpAXZPejQd9auwGzxAvCrheG6Y0=;
 b=iQF0asPHGkMn4GwyaeP5KDeR6d2F0LWruQmYbVsUFEIQFFs8oYFRD6W9Lgt3lE3E0++BkG6UN/ZKEFip9VpPizdXO9hCf1xCwHDV8T5gv5QjvYWZW4Nt2XQVDqYvTW2fgyNrmKlrsEBEXDmPjEQ5cZMliPNMh0OOygeng3RWZ2CQryllsXgMx64TutZXgpY/uos7SpPzSZdBWqa8eacbg01KadSDAxbpVSuMevaVOvUm9BYr/1VKiQOkXAHMRY8smNPSWbin52bjuSFrzlwuHhGDav28oGwIuq+QM4CwBI8SQPmcxPsQes937VDPgjrcz7UJ6zSWlFfSFAqzD7q7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1/hyQlWI/dFxiV3hpAXZPejQd9auwGzxAvCrheG6Y0=;
 b=WRrgpfuiToftxd4G36knTrFlU1AQy3mSQ524NLyI9xV7LvDGkx6jvhpABAtFLVc5eYJ+1yfKRYjaW2ljbaz0W6hfAPWFB5teiZBtFXj3p9SIOx8fOOKae0MC67FrCKd8kIdCqP89Rhcc7lV49jD1R4oT32oLhvMOPxxY0QqIgWI7+4wd8LEgl6Ije+IdeZXAkgoNZGnxfm3hOWXLQcvHhAGRupOFfhumMWgbNV4DgevNjG2G9MUmzsNQytqn39AMJD9c2i4Ps1vw+206RsUKlMbQ3bNZmlHCPtrLSd2tVUBs6FKRONr+rK8t7AvICIH8nkve6Xzdcypk1FnI757LSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 15 Sep
 2026 13:45:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 13:45:26 +0000
Date: Tue, 15 Sep 2026 08:45:16 -0500
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
Subject: Re: [PATCH v3 2/5] media: imx8-isi: Extend output format mask to 7
 bits
Message-ID: <aqlL7JBEGboebBiZ@SMW015318>
References: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
 <20260915-isi_imx952-v3-2-3d8ff1363dda@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-isi_imx952-v3-2-3d8ff1363dda@oss.nxp.com>
X-ClientProxiedBy: CY8PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:930:4b::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a15425e-467f-41ee-5fcd-08df132f9912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|1800799024|23010399003|376014|3023799007|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jmaSDknu77SqEraM0mvUZ5eovFjqDAix/JlqvjquYoZ1oD0Yv8bOJFCE4pa1dKHnzNCNe/xz7Xob0Wg+3VI37aOdtLqLOaxXghShXfSZvhC+/TygfIHpg2UhzT3cht+9QetLy3pvPCiJDqHhB4ET09xZyWzP/vC64vevkBN7QJhp8qtQ9ueU1ed4atTwoQihsLeeFFmmvYN314GSBMZGLsfnfn4O7fWq+vQ1yGED+Gwlkb2Ny453gNwyOVXyPFa+ZSB+WyORpiSbwpcyqxALq1qiLo5uFQoF/LRuL9fHKfV2hC4sbTdzJJbsPh95N379I9lyORnfa5pGrRyiks8a7jZClX/Nh3/NT2/lPCAsUNKA8Qeoh2MzRVU8rEzHYT0ezIwGC8LO3QcrEuKf/0D7EbIA4niI7xUTNVGPeyRP8Vbl3SZoarqsDL9erwcR9GuEPPvUe/9H3L12e2+mjZVKpt7aRLOUfF8pAoOMkU0POD2u+fBmMeONZiaT+I2yE3DRC3er2A5tRvcWbkNt2pBoJppp/VRv4eGxO4r4Uq8h8QcBxX9WtczrSqmM2OPKkuQxS5hxlryUd4vz/oPfPPLRhuZfulEBOn+X1yGokg3NSaBc104JVapMJIqzhHBY1Fp7Kx9djdINzsmr0U0cIvVa5i0tuQGHht5Fo455IvKi0zU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(1800799024)(23010399003)(376014)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s3VCNl2Uffn1GT1WJP//mjTC+glQMUI6ue+A6TTfMou9AJ7koIhbGPLPabw5?=
 =?us-ascii?Q?FpyTlQha5wXQGai8uFvaH+g4DFv1TkblJa0wokHwIcv8/Wgs2mrE83WvetMT?=
 =?us-ascii?Q?/HTGH//1bMBt4+CC5eMJfjoUNVZPBExi/AMRAFHdlWP6pAfSzlFuj2I2b8OC?=
 =?us-ascii?Q?JEATuDJdT+35bPF7fx5Nx1MGUu5t/+5mkfvJU9odMF0N2J8+3vDmuJ/fWTZv?=
 =?us-ascii?Q?d+egeFKU3/s6mDFwlVk6tJnCcz2JPu+w0mv/pka103Qa9n4nNIzDrsMP/P3f?=
 =?us-ascii?Q?e770xX4Ewmv1jIknX4Nw3aThJ8TyurzLp/6ucCq1eYyPtjq4OkdNBOr8Zo/M?=
 =?us-ascii?Q?OjWYXs0v1fbsBj93REtyedHx7PIm1A1GwuZok+NjImRhvoZ2P8gUG1WmO1in?=
 =?us-ascii?Q?z6k9os4vMzN2WXz6TLSjcxZau8w6Vtc4RHT/tZbuxHjFY9eWsDxVAidLPx/J?=
 =?us-ascii?Q?+844YtlYUcgr6UdH0kASC2+Hf2xSt6735M6of8m779YLaIto33kXu9FQRSKE?=
 =?us-ascii?Q?/PANc2A+xdquPVk2lA9B14bc6dhAiqJzFJSTAAGSLXO+LNlARmSCfFLjHDz4?=
 =?us-ascii?Q?0e8kEyaXo/8LKAG2FNfCTrIEILzFyvTWBt8sGNrYLMv8uijVopPNg5ugv5lf?=
 =?us-ascii?Q?ywfvOxMo5EdM1XBxjAyo7nyQVet1SaEEYLC8a9pcIuRDpa1/Yb3ut8YD8x8q?=
 =?us-ascii?Q?7YSV11t4dorzasacPwbhCRDjwjjZ29VErRIfTMv4Bn4qTCX5Wn9/5Ag/vMGU?=
 =?us-ascii?Q?JAlCa54OFzrfzyanQmr9mAZscmFi5sImtJA4iSH1hCleePnG3icpD7V4H96r?=
 =?us-ascii?Q?u0R7HkEVV4MxYNXJ4grLDcMZqHKBU7TegHzPzb5Ib/fCrGph7/KY+0Y68YrO?=
 =?us-ascii?Q?9+6VuIKNtPErWdhV8xGSSFmbMagm+GnJkfEvH/KRa0QCVQkj4jKk5uqMskJg?=
 =?us-ascii?Q?Bn3jkBjeBPQsAJEI/bAZNPknWVleZaeSnhK3qC5YGXyMo6wJbdTVn/Zl0IEo?=
 =?us-ascii?Q?GYRKTKi0i6Sg+xs2gllHjMwCHFPrbft9hNfnhvERQ/vxp8lq32nVHqZZC/AR?=
 =?us-ascii?Q?SxM1PWd/tXNlUSCYM5bSsNkubVyEL0FxYZmNGANFx+TMBpa0ha0gfPfalRsW?=
 =?us-ascii?Q?tsHKGfEAWfyMvBF2MZTK/XLWCjlegIEHJIU8BMKIA9iD8a+fot8cYTe1WqZm?=
 =?us-ascii?Q?cbt49h0KpTMQQAOqk6Lp46jMqKnJjSFMMk/nl2oYLFf05PvXK/aPzeqMm7XK?=
 =?us-ascii?Q?2uGjYxlQKA0Adio1dh+KkuC8xSzmbd2XX1hhIH2RZUefVC5PwznYcApjXsfX?=
 =?us-ascii?Q?NB9RkLgfnxCA5hM6v9f0btewK5YuEowrKqsLkA2ojpqInka+PMnzCZi4e6RB?=
 =?us-ascii?Q?Ot1twtkS18FHV0QVI5UXqS89KmM7k/QgjZkFT17Yycy/CkyReViG+DH9FlYm?=
 =?us-ascii?Q?hNXXKU7cBB0o9SKv0K61+FSX49ukO0OeMGvsJ5jDfhrmH9lmF3bbarF6diux?=
 =?us-ascii?Q?FQuqzVM+Yfwb7Ww73D855BhfklXixuKLQyGn7d/85OWhXiRoigt8FJlyqrEV?=
 =?us-ascii?Q?XbXKd6eu8EysyUafSG24PISnSg1qxw9fnjOJ09/t2uz9JLGnNz+G2OaSdPAN?=
 =?us-ascii?Q?ti704puEsJNHtPJTyHf4/ev54Z0Ws+0Ce2uO7jrSBWtK6eFTLtpLpROCMwHF?=
 =?us-ascii?Q?J76Vxdu4pIiZzNHR8nfkqha02zAH39D70goi2YFrq/KkEhaJZ/4whlF8ne7M?=
 =?us-ascii?Q?NNWYKGl3iBEQxElP4ZEwtRa1a2oueGvdNlytHM6fwvPXzd0tZKKm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a15425e-467f-41ee-5fcd-08df132f9912
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:45:26.6228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjNUDPlMwfP34f/5tYgVrlgmlLOMApg/kgYQZPp+8MXB6PnW/cCFNQymcX41iuXJa+OTYcwCiufxMhIPfxW+QCukereeQiOqiZ2Gddp12LubS4obyjuE0XBOTfAjPfQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

On Tue, Sep 15, 2026 at 06:51:49PM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02
>
> --
> 2.34.1
>
>
