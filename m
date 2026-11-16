Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849297;
	b=gp8UtjISAm6N9Xty4mv+DNjNw052CP86Vc7AVo94w6kllanneK0mboZPfmP4EW4Btrg6
	 05rYsiyqHoZBpmMY4rLU11bxkXaz3Gzv6AH+4bCuBjOHCOQUWZL3x9LeXXCjh4H3orFYr
	 3F4mkN7cmwPbtvy2W0/WRxuFTudI18eorc9R8EkVY2Vug0X/DXMJs4ZFSrqHkEPfOn3RU
	 /QmgkBA+NWSPLgbDu6kFALiMjQSiUUZUNMsmb0df6ALDNs55n3ZrPwPbM0Vnp8os5CUJH
	 8ZtKJMhuNVUtlb6ra5XxPQbMTLQ8dZ1TMW+DRD9QAkUBwbYbAawo4kpwAP68/hPkiLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849297;
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
	bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=;
	b=wutTNC2+bO7yDSh12afgE3Nqzd1PLgdRVq0Z0M9Wt64gyunzmDlCEFke9Fo6+BH2+TIn
	 dnfB5y3uuCi8yxvKuLS7+WpVQZuFzEBTA4Qh+rMDRIe7Z2TbCiXSAODjsjyoOiqfk3YsT
	 wrexeil+fKlR4Cxb8VMP1MGKwNGYzgaEWuJbPGwUY/xaZ04/jY2XKUAQsIHL1yhXgHn0G
	 Ixj7+smQco15XvUHGKTgj8CqCjgpJ0Ee18TnXV1daSZEMsGqcvQWPZH0YS1gqOa1jIsVg
	 8wPtf2ZBwXT3+FdIBFCeU8Sg/b0wLvSQh4UCab88AfUr6er9VhaN0t4JK1XAR6W8Nlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dK5iWi4N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.67
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB37606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB37606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dK5iWi4N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+fU/ImkHhs+nd1LEWMmirh5Dh9THvBJNToFdd4phNQhvxFKfcoZuUcSCOWBsxghovyHmm/B8A4TLWrnmgi9pTATby7+vuGEMRly3jaF77HTOqjd0PBzqiJznieVqqmE+HWHH15OAhPa7+IbUxorN8vH/nxSLDcs8lj/FXlFgZk+iq6624pZEe9H238EFgRF5kzi0gtbTndT1+1p0zjLBPPfujmMB0S8gPYr8qYRCwbpkyA9i8TfQcYUB9QzUrB78BKNS8eMW/0Snd5kk4J2rGvo1PyZz5rW4exe86dqta0Z8PQ7AQXrk1AFeC/ymYoLrN6bH1pHf2962hKtaSYYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=;
 b=DkmsduFKosm89LVDInFYkrRHccG/XYQQgbmfqBO7Zv/tfNvXRqQkNkEAfh0ef5gRqNMNU88AANEMPbVWuRDBevkp8wtyyDwoTJH6dqLyhO/iW0Ds1PveTpfv7SEaU7NhyD7SR0T9TOWzaGM4iEos3UXfzvAUcNBoWcnLc3QfxQ6h5FDcw1Z0+Ku4Re5qRa5SZs/d91poAe0yQc+2+/W5pprfQbTpiT3+8E2PIoR2+5NBxxqeVntMbyj1mOu77ad+xvJP6o8POAU36UtiS6pM96WRqDiucrpb8QNicqsp7G6/580LnZL8crBIiRE37zvwG13My7zcZJYS+ZEC+zFYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=;
 b=dK5iWi4NdgIHA5+hRWjpBqfMudusLBHXnXIZAbnnSfLivlfwLzHdGSTtBcRrHMZP2nlzIycJyFXwjHmypAWffxyiPBmQWdjIU0Gw9WfCYk0pVfn48puDgjFsfzZ7mlB6C4Tns3aFjz8wWgRIgM1bY+oWF+OiD4HZcjhSaamEa/7slfPZIgAJDDFCPNiMMM9YwA62wU8dqIn2aRgOeEwMopgjKivalZqb+GjzBxZdut5FaFzCotG4QSxp2w+9ClHz4w1hNof3eP1XSQzWxLgqEEHJT1HKNdizlPrtXl20JCcW2dLgutsZMJPTBJU9i8lFs4GKgEAyaZiFXDBijVri8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:14:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 17:14:53 +0000
Date: Mon, 16 Nov 2026 11:14:42 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] irqchip/imx-mu-msi: Fix MSI dispatch through the
 parent domain
Message-ID: <avs6Avu4PQrcysPl@SMW015318>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
 <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
X-ClientProxiedBy: PH7PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:510:339::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfe0ec1-0c44-4952-16f0-08df44052156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	DWD9oQtKYwuMJFFiBBkTsQagmOYZIDdJjNSXo/Gw2XKE6a3m1OouNPECJY8X2zrLKvYzPYCVFWDbTNOP61FQv8hrF82y++mleVnzD1LNtrxIeuWPFg1Ls3S1OjZ6aaaaTNbzHLZuDfQbgGoTRnQ18RBB4A6cS94QDvvh/qG3qnuwcEugV9b1/gWIygwJhmxdKWgaPnpIphTlulBftndPvFryO7OTxgfbR79As1zMY1LOQ6yg7Iw22LgnfMpcfgBdYP+6UqNXVrgzHOYQ1Q+6rIx+3UaH6y9yh2bHTohAJey1he3uH5+bitQxqeoEiv+yymxJz51pd8G7ZI8qHa5UCzMXEIFLTAt83JGlH/Hu9fTQBiDHIdrXWrFwYoibcuz1By/BWRHHyLwTo8k889FDUU8XjWVx0p0O7HmCX/6TEGP3p7Fa1u2NNWOXTB3QcGYxQ7NWo/IOCTB+P+itTPZ2TePugpwjTOS2sWqfdbl9JyUBioDPlushamCXWkDkPxhW4ev8hnbHVof9n99n2RZJkWDZI4keg51f+UTQU+MLRgv2e+Dd2mhGsdqwCQCCmfapX1i/ajjC1S1Co13ymHMrGtjkcOt7jo8c96ZkD8Rs1h1wiHlMK3xNWDL27wxpivSe+UPfUvBI1MkUemhlXdBq/cMZmb9lkYG2jUxTzt3Z5uA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1munswHk2QjsL+Psk+YnrryYquGa2LHxDr8m08+bFr5zoD+rOjPP0pF3mT7z?=
 =?us-ascii?Q?Kzz0umXtdrAG/dySBIx2+YBHr9bjzxFqG3sNsfIP6y9rS+7+7yfFDNN5ejFc?=
 =?us-ascii?Q?KRnyMBp7TPVgv79YFrWYIVydZc8n6AbDrSBLvPTn5Qydk7irXR+SD+Nt1tj1?=
 =?us-ascii?Q?tWIi28YLSuwdMoa4jb8NeWyjx/hYeA/i1z8ZrSGpkRqW4CfVokLa2fbwatCH?=
 =?us-ascii?Q?pR7SKhZcDxNuoypS1RTGpexf6ZmACynmXmAlWeA76Tj+bNYje0cLput2SFRn?=
 =?us-ascii?Q?OnaoNy9+gNID4rF97kmKfF/DmPD9gGMeekI7wtQvCaFWwUZTdvfof6+g+K+n?=
 =?us-ascii?Q?OtEt4JfuqV63hfoNUq0Xxahbbt0Oz4rbv8S2sRbIoXqROBFUMm6kKxeNR7nR?=
 =?us-ascii?Q?Fvy1Ib5K1yhz1phNRPCtRs4A/zb1hRNtQxW3NAfdxwNaxufuFEg6NeiURYDx?=
 =?us-ascii?Q?xwoqeniSFFK6P8FDtGfaNidrGnsHIMeLlGPaBVgSYIm1bR45nQ/Gb51WHlbj?=
 =?us-ascii?Q?d1L+oNVSkMicF3dm8yqHQ9sRZyTKw1qdylXm1b3IfwcGLRds/RBaHE+0HkKa?=
 =?us-ascii?Q?uwA3ZWSHT6MqOh/GL00UBV3YfGZLDWfx5ud86Ie+jlFMmln+mq4Mw59kioFu?=
 =?us-ascii?Q?dOfNyPekXGUJ2MoSSzYa9vvHOLM1fmozyKO0AvAjtC1cB6wfqz395Vj+Tk99?=
 =?us-ascii?Q?T4ct+3fg92pl3MWh8zZiE/MLdLaSRvTpUNngdFwJnf85JItLNLD2uQSOAIqY?=
 =?us-ascii?Q?0uoDmZyG3uKwNBDxWywctpVmpr4k4T99ZhYsItNb5kPc2YHmXj44b20wr+Fw?=
 =?us-ascii?Q?gae9ghaqj33mtldPBuj2C0LaRoo35g0VwquVlJGncACSzpxtV0DgafIBGSwp?=
 =?us-ascii?Q?kRNZFe9UMpLfKYGsLaFBWNrY+XStPjyLhgPgTiMhEFovP7Xt5mblVU6G4jFr?=
 =?us-ascii?Q?JfZUbH3FYJFQtPZ8lnFNyTlsO37MUuZ/8yyljVAjk4TCkAsnkw/6KyggjUN/?=
 =?us-ascii?Q?g1jUqBAg4ab/pC4j2meKVqurHI05jFUr10pa4bSQ89s6/Iq429sxfiduA3tk?=
 =?us-ascii?Q?A7OQqNhqdaKyafDEu/mxul12y022wP7Fhf8mftZbnaGON400PziCwmnFmfrS?=
 =?us-ascii?Q?+mCtHa4ZedL4Yqr52i9SrXU3Zk+MjymvGuml2dete+ma+mY+DNSBo7Xqgutx?=
 =?us-ascii?Q?XZw0tY7lfB8M8U6tJAuoaf4R/F4ovdB0z6WA+tEpbpKNZer5n0YUaNML/r8m?=
 =?us-ascii?Q?rZB4kMoyFHFUpcFrrjE26exQ52I04F3nEVfDmDiJYwdbOIedlkNqJC7MhaU2?=
 =?us-ascii?Q?7wxCJspQvjsbHU6/qih6j0Wc3NyjoVyqlgjS8ScI6kB6eTC3SNOSlxkJAL69?=
 =?us-ascii?Q?96We3lsPgZ8x2fsR4dhChOk2AUuYSCheVKwuuwTDf162ThlEXlfj953Nmekp?=
 =?us-ascii?Q?GuPn62saLp8dWfS0HdHOSnbpLLcDB86ExA8wrthQSDuM+oLpxRXB4snQumI9?=
 =?us-ascii?Q?bZJ6yMSAbJHQuaw3Kj2vTxEobKIdW+eDfUkoOduweonJFyOdyouvNP6N4WU9?=
 =?us-ascii?Q?vFjDH9EuJGMhQxGyiRS61YpOyDEP0xoWZqUHgXIfrKcNdLaEPd9iSAvYpCpG?=
 =?us-ascii?Q?VbQXCzrsViwrp02qEZGcA0+LEeu2dYXcigKty4rSC1WKbxBABucgylka/eEI?=
 =?us-ascii?Q?RCoxYQO8ptI0+HNl3dxRFkFbVH7D/3RLr0pg9fAENCOqpFdC2m7ujrjXvH2s?=
 =?us-ascii?Q?bXb36NkT9mDeaMYo6uVJ3DhQD9xS9rIqSheV7vzgT54xGX/UXUnN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfe0ec1-0c44-4952-16f0-08df44052156
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:14:53.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgyWZs7NVripzLXFebNSSw29ExFaT8WhF7FwtiGKva5O/yKjRuLyPZfhuxJrHp/8sNwdBBtfgGRAeCpD/iVHdggO+HRlyyE8Kak0z3FD8IpGS+sjn3/nO6umtlqmHeU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834

On Sun, Nov 15, 2026 at 10:11:25PM +0800, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Since commit 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
> the driver creates the MSI parent (nexus) domain in
> imx_mu_msi_domains_init(), but never stores it in msi_data->msi_domain.
> The chained interrupt handler therefore calls generic_handle_domain_irq()
> with a NULL domain, which resolves the hardware interrupt against
> irq_default_domain instead of the MU domain. Depending on the platform
> this dispatches an unrelated interrupt or drops the MSI completely.
>
> Save the nexus domain so that the handler resolves MU channel numbers
> through the domain whose reverse map was populated when the MSI was
> allocated.
>
> Fixes: 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-mu-msi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
> index 6d7baeeb2bc8..c42ea0797624 100644
> --- a/drivers/irqchip/irq-imx-mu-msi.c
> +++ b/drivers/irqchip/irq-imx-mu-msi.c
> @@ -238,6 +238,7 @@ static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *d
>  		return -ENOMEM;
>  	}
>  	parent->dev = parent->pm_dev = dev;
> +	msi_data->msi_domain = parent;
>  	return 0;
>  }
>
>
> --
> 2.56.0
>
>
