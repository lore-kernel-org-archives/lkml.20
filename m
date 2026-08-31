Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74C46EF73;
	Mon, 31 Aug 2026 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190389; cv=fail; b=Pem2txopeToqrvQ7SQOR6053GejKJM+eFpeZTNoRBQWTNSwNkhX6XdKHxHgwSeV5vAXc1yxdEbQT6FsYSfIgYhhUvYjAW+UOoFtWLrVTzvExf6EsIVRJH5snvIf+4Bi52mTYkkmZZFBn9AWeIy4fL3DpMn08qLZZBBF/+VJuNHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190389; c=relaxed/simple;
	bh=lKyZqMQOdoLG2Mh43EBYYYFjXByxMTagW/j83S3Am8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=efcux/dDkVvePaqf/SPyiZoebIlZ12UkZ2gOb8QxYLPoeSsGQCUUJzJ7+fFrRgpXFRUoNtj3lfwf8BtoJHY/Td4IaLYgd8zoZwjl8mdXuJiwFzc5JW2NFS6SDHaepwKKhNJeg9+Odrv79fTXSev4iUqFmVVJ7Lm42gACnmut82o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M7ub6rKr; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M7ub6rKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWdTPzZ40sQxLMlm9jpirElBbyA4pzWbhlMCYzI6iaaTjDS9Kq3j1fk1LyCNJ8HkG5ocGj1snfmaToenOm6O7f89B2AE/+qQtiPALI7dyQZ0LRNF18vHiAXQuIAfSlXjMvtZExgCe3EwjMAALmt8aKOvoJhemiInk+XeeMdYKXojnQe5UGXiyiFWFW0/SCEXmhCSxfItzD0YTEQRu5EakZOnmDRkL9P+3ypvXN6TZYH7NF/mczc7t/noSPdCWN2spqYQWNLmJWjPY8Qmh3zFMyLLS4QZ0I4+ay6Nd7b+FMvMw8wbwRJrI7UOFX+pq1/mgWQUp+qB/WyHKPLz/xAXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcbM4KiYKzMqpIgGXHUsy4Y4+Lba+isvDaMSWr/F/KY=;
 b=H9U77AQL1O3ib/2wmi0zYmXHKcsNIzGa4W5fDzXo7FFpNhNpjjCgzJ52Kfj9OJy9qA+xbnsAccW1cgg/Lka4OJwMBMfjl3ZoBirmx+3eb809BrS7QfGF6SzG9MWJVOTEToR4qhu1yyNv10qMfOHruRi7fIjVVwwAfGMRF3CaH6rZ5hnuPD+/UIj3ZoXUh4o8RnWKwtluFGtnqIISngvq6nG0EwzH8YgI7ysDfasaOpq5XMmYy/dK+QZHVissLWYjNfQIwMKA3hwT6fcSHx1DTHujDgpXrFxYUAFPc85M3Gsacis6pz5N8+HWvFUouOjcyLiR4DCWpizyrdcugpx7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcbM4KiYKzMqpIgGXHUsy4Y4+Lba+isvDaMSWr/F/KY=;
 b=M7ub6rKrAeSZvlSrM/Vuhj7ap+Klgp8JUShup3eIssp3l37qUY8aNAL1DC70o00EeVc54z+SYnifwFNTubWAl0wCh8ZMQiv+EakFwEhMejDS7wYeaDjD4UBNVzeMuUXhLg2t5xscayR1Hfn8I4Tq5jw7wZiUH02l1vhGSreoJczjK2+rgzhMIqTexCtspC5mP+jOkCGv4PsiZ7lxfGJkIgghRiOoYD0hSHj93xiV/mj+3SRJtPtUyoXVqCIqck3mQzVr7+MH8XG876mWhzm8wOXAzs5g1LQbsJMsKpKi/2paakKsnvuyhoihn3UY3nsNrhycfJHy1haJWPo2OBDoXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:33:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:33:05 +0000
Date: Mon, 31 Aug 2026 10:32:54 -0500
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
Subject: Re: [PATCH v2 5/6] media: nxp: imx8-isi: Add i.MX952 ISI support
Message-ID: <apWepjTUoZO2gwn0@SMW015318>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-isi_imx952-v2-5-fafdb4b446d4@oss.nxp.com>
X-ClientProxiedBy: CY5PR19CA0043.namprd19.prod.outlook.com
 (2603:10b6:930:1a::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b46409-c9bc-4421-5256-08df0775265a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|19092799006|10067099003|22082099003|4143699003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gUGzi8ztVHww47voHs5yGIbhzpJMt1jg826hE4j+mRcweZFBou98S8rSRFVPwHzyw0SYoOvbCHW80j1NzM+QMLLd7G/5tfg8puIEQyHy2BmJyIZyTCWp8xUvqSJv/mebwd1C/NKCn9cDnMqwXNpSGfoQJeHBtINdjuXQl/g8mCp3IBxafgnEWO1rqvWtBUgQaUpVgwKXh6n4tJhd9lv+D6gDk3zFb6P2/xunmvInwEqAmsltkt2kC9mY6R6S5RFuKQomQu/oEzwyF2V5MatvlXTmNw6xH7KpTX/kMIX4ZW//O3kuZV/LGKQg5H1A7xjSXNOMVY28ej88ZJ3Iv+doRsea7cU3fQUODj9TmY9lOBap7H9TdWVrK/3+lhcrkeZ6zqHxDnoGEo7BG4/Ao8+wpio4uxR1Tq2hjMB4u1kNLh4PoU/+6F9hboueTjmegWnO/Avs5oAdZZOdafW2naVWn+PUt3Ur+1oZ9uyKDSPCLvvu0pFdhMLOqf9pM0kXNldkGQYVa4KJuRB3fCJTLErU/dwJSP0M6YVzqH4p+Mf1DgChTvGO6y63qsSWMsC2kU/UU2ohKq75vwurCLMSt7AoDC7UFeazDOyiCgFzVHlZx7003FDGE6x7iztHNhotZtE/Cm6k+JlKiB9MwcHXCbOTAEdR02vmc+d9+gN7+eb9Tec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(19092799006)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tNunQUfzWIZp+vSDaV8yLgk2+ByhEizAeLivJ67D60phyN/aDeQNHnwuLHqC?=
 =?us-ascii?Q?Ey6fXcDxPhsNR+r8ejqmetl0BjNMAqyjX4zmzLl8WlKastIfEGJxNIx8NvUl?=
 =?us-ascii?Q?eTuGBee5bXGx9ewLqG650D+yuuUv4z6fqmmIEi+ts/xR9rfmFSGNETsgUlNg?=
 =?us-ascii?Q?VLCgtNnfm/8+kWh/Gx2K2GS61kUbcXGLH7I5xrw12JLbGJDHA0siOFwtE/Hw?=
 =?us-ascii?Q?4oOrjZyWQDikwayMXso6r2f7uZY6uwYPZ97t1B0Z5ZVop7RYqB90Mbofj91D?=
 =?us-ascii?Q?IVry1l4OAzYTaTbGVs8pftcKZ6oOyw/k3pWr0Vkm7yKAdI6CjVuzeggUl5G1?=
 =?us-ascii?Q?Hx+WoVukMLcIILbtcOK0Jwzs7tdJ4oNwKbPK5Y22HsAp5Z6lg8KdGxm/BrUC?=
 =?us-ascii?Q?i+KNFjydpP43ebwrrM9256gudY8LTI5uhfWoP+kUSUsy3fVR0usV64xrMY5W?=
 =?us-ascii?Q?eTp00O+p83S5hNVcDShkdHTcxmxEbuUAHPgNE5+SGCFhpYXcSCpxvQTrEScj?=
 =?us-ascii?Q?YQg/cDk95H1n5UF6EgtJ4b729iUr85sFAQMddMG09v3Fm/DNAxwOYpuOZ3qb?=
 =?us-ascii?Q?yL9rL0vmCsJB/Rl33PAEgZHfWGVhMgZBdYD3INSqeImG6aNFbd4hbcZ0Mt/D?=
 =?us-ascii?Q?bzNrN6YhpQHEJN7nXnTHnICgvhngu/fSUHQAHKGI4j31isBnfGQsYgm3Px7o?=
 =?us-ascii?Q?ESNK8JcN8ABP0BsWO1+P73wBIG1fhAnVwi8Dr7SeClaOYUjhFkrYUactIMoA?=
 =?us-ascii?Q?uj9o19twZAJyD6AcTgWJuFCb41+ATro0GB49Kt7zLyS6abf0hEX+O+rXluEm?=
 =?us-ascii?Q?Va1WEywqY0xmkryoETDw+/BQe8bZesHSk/HZcTHlIf3E621ynYF0Hq368sWP?=
 =?us-ascii?Q?OYI/3T1PrKxQ3mf2zWwMATcZwxvCqzjagx4qHoyZm/QqMj5grtXxzQScOfSw?=
 =?us-ascii?Q?jX42XtSMEKDVK2BmERTeM7Sz7tuU8WNe18gV2NwKbJyQy3CNh0k85DBucBSJ?=
 =?us-ascii?Q?LZpWbi/XTMY1rW8EzLJHTW9sWdUrCFREbecDBNDXO9UYTViu1Hg8RnvhyvQW?=
 =?us-ascii?Q?1PyEQq62riDonW5RFNFTIZcGZ+yAdyOoCRSYph/IPQrp/GzQBZAkztA02jXZ?=
 =?us-ascii?Q?iFY6rkmlMQWm+GeT7RNOOQ2Qkskp8nq/nvD9gm4LLLNPNHHG050j5TjyvtzD?=
 =?us-ascii?Q?b52hWeDcY3pow/lQ9mRQh80IZ9isqjfXnIJZKOEUhSpECDWvGSUqHw3J3I4d?=
 =?us-ascii?Q?ixbaj6VhYIJYzAVM9kkqtm4Q2rvh6hR1xZdwD2BtlPwLLkokgUMZfIEDGq9Y?=
 =?us-ascii?Q?7m4NOjxg9YN920rW/ncwZdW2TLsJYJcCP/nSLMluigiJ2QDFGJzfZoS0ENTI?=
 =?us-ascii?Q?M5g3jhDhnW67HxiUbADVKeFpLxFQD1aTFjodemAxS2P8SL09ckoSZnScFQdt?=
 =?us-ascii?Q?1vwH052binX4AMw05dqUt96rDoKf8K6HRYJz/YP7f58GkoR95mBxffczpkgW?=
 =?us-ascii?Q?MgSElx9so2A07b9ZZQT3VsQYAt8MUgY3QD7uHeEsvUiXwJh0gL4nP5C3J/fm?=
 =?us-ascii?Q?8NpC5n7xOWG6TxzQNO5Ua36WNX/fKALIAL66EiB+6LjZ5A01vdVWGO3n0Y8X?=
 =?us-ascii?Q?ZLCVtxn6olukpqv4NPjExtuV+AZPmceddUncCoDyVELfuQw1lgviUET/ADDE?=
 =?us-ascii?Q?4U9HvN5eIOYFO919RH5mIwp8DsjycAHA5hE8DnIqqclG4e0x9Ew5mBdWg63Z?=
 =?us-ascii?Q?bsjwSoBI9C9GTWaDDJaYwACLphuEFa928F9BOShro2ufRiloAr+L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b46409-c9bc-4421-5256-08df0775265a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:33:04.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fzY+VeAmWDx7Jt/ecEhRcIS8glDhtOCe/FA6xiHeBSWpwICRrCgZo3bZ6dSX4wak/lj6Yw1XA2M90jC9f83FgcrC43fQH1FUOGXwvwjlzGSUUIsFdS5jhD9DiP+qarw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778

On Mon, Aug 31, 2026 at 11:37:00AM +0800, Guoniu Zhou wrote:
> The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
> revision. It can process up to 8 image sources simultaneously and
> obtain image data from up to 4 pixel link sources.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

If fallback to imx95, needn't this patch at all.

Frank

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 +++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index e627054bbc8e..d492631dfb6d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -384,6 +384,18 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
>  	.has_36bit_dma		= true,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx952_data = {
> +	.num_ports		= 4,
> +	.num_channels		= 8,
> +	.num_vc			= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.format_mask		= GENMASK(30, 24),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= true,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
> @@ -574,6 +586,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
>  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
>  	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
> +	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index 7c4e736f4651..35dec3a650ac 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -22,7 +22,7 @@
>  #define CHNL_CTRL_SW_RST					BIT(24)
>  /*
>   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> - * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> + * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
>   */
>  #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
>  #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
>
> --
> 2.34.1
>
>
