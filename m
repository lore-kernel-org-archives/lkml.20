Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1348C3E8;
	Thu, 17 Sep 2026 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679972; cv=fail; b=dMplyhfYss1MyQAUxorNhbgQnuJ7f2/7xIRPBzVtqba6Oq2MLT3vu+4afB/qxATABwekUzmtJhsJMgbeQ9t5Uu7S9sF69BzPEzJqPG805KVcm7iCQRAJ4i+hits0Vci7pz/ne23+zBXBO//b6sA0iA+cw64acjGr93or5Zq6RUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679972; c=relaxed/simple;
	bh=IEm1IPJAFR06snsSRYn8Z8R0sUjEAGGQK3PAzongc6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OzspAeCt5J00SvQ6CvfmpK+pgvDJ29gzqBm/VYseEzfrm9GulwLNBXAd79QdQPIk6XUl40fc3TsGdUaQZW3HmlxwTaFtZCTXIHoARU6UWtg9cUVu0lzPWaedYbkOFbm6binwdCD/T1xEVZiP3OwXxf253Pliu9fuznGC+TM/JlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dUJphUo2; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dUJphUo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdFmj5zcHMCFC/5PQMPXlnfSDraS/YK3j4FOTEPZG/DCr0ZxSNb/B3n6+O7042A9BFlJW2e6PIJZwUKDMCoQeVv4xFvCm0P9giW6d0RzG7Kgem6VTHMkyf9q+0VLRQy2cccQG10ULw3pPa2TwGuTonk+QHV54w4+Gt90wzIeTMNmPQ0oVwTrS5ZdLjma7ZCAh5ZRlAYDPCi3I1BjbzPwkGODV4stdDXIBxoi4/+7rqnlOCwbWj9ss/fFcl+pQgU4Ol5jJwXLbZaBZWIwKfbm7h4lC90XV29giEr/oFXdVJ0AY609XlAC3gEvbG06nA4bEkYzlAnUlC4oJzLqd4VLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvCPnF2UYl/qN/WdjmxU+r8gRbh+iY+v3iXpHUQ63a8=;
 b=RbP28q84O3dZIFelX0wJl3fMyIefgmmmzIDPBv+V6AG/4ovrILnhGnNbhgVDvTZafSeXQ3W8uAxvH9BsKnBjqm6h0iAylcz43azzQaB6m0m+WHPL6/ow6vmrU7MmXB2S7Xxs79J0605kVl/i6ErVwWe70h629ULTmerZjrFEbIMaWWUDTxUVyGtxQez7EY8iRLjGqSiWJWi9qEiEnf72mstlNwMcBuoZt1Jr7ZjFcJUmwbVpfNTvKKjb8JWqrXg+EFDGpWuGi9NdYn76jUjSY274AqKBJ0fof2je8JV7oD0ClL8QN76ZPzRFbmnXOp7tlsk7199puxYll9hkOF7DHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvCPnF2UYl/qN/WdjmxU+r8gRbh+iY+v3iXpHUQ63a8=;
 b=dUJphUo2fpecUnAl9IGHqNx6tk4Zmec21bgs52IrHTX47tDHnuaNOnkmKA4/O0c7UeipRRnbYAzlWON5HwhngGDFARyfnBIfT5ZtCRuOTIm2fpZVFso+wnOGHXTo4TWclgyFQeHV+mS2eS64Z1AhvtiJA/gn6JUXCmVtdoZ5Y/Bj4L6GYuDTkoHDcKiOqGhOphPFaA+NFfWMcyvjL2IAc0hpth3nlBMd8kC5iPjMaL/jKXZI102Uu9b6Ugs8PqeJzJBAdrFhnLrx2bUxrpnPmAuN3/pUNY8Wmp9y8z3U9rGdgvnwkvFtF801JJrt9GEDq0R7I4SLHzNx59VVgkN2BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 21:19:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:19:25 +0000
Date: Thu, 17 Sep 2026 16:19:17 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Xu Rao <raoxu@uniontech.com>,
	Kees Cook <kees@kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] media: m2m-deinterlace: replace direct
 ->device_prep*() calls with standard DMA engine API
Message-ID: <aqxZVVcPnPw0vyof@SMW015318>
References: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
 <20260917202931.GA59058@killaraus.ideasonboard.com>
 <aqxOtZdsNR03qmqN@SMW015318>
 <20260917203725.GB59058@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917203725.GB59058@killaraus.ideasonboard.com>
X-ClientProxiedBy: CYZPR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:930:8b::26) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 391ba00d-7058-48c1-2407-08df15015969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|376014|1800799024|4143699003|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hQDQH5rmgmCDzKuFzTKqXCKCc07p8gFwuwcElcDY6KpLsHHXU1hBiz692CSN/wXxKunTpysiUUZjWcUphmIVnatsKu//7UexVpUCkmg7v10XJ8B4w+j5MQ5J6/ow9U1cBqJ/wpNjBemtQApjBc0GHaUJxzn8uxi1Nxb6jYTnf0CYbpz0VWCheFuKt6CyPtTQCzQH8YuXIzC3Vq9O/TXfuKFiccbpF7CyxHOwyunVSUCsTb4GF4apIm7lhJJ9bzBk6MM6mzAsNmNyjxCiKYCyYwsV4RPDHrD4vID5OPakl+HGC+KDx3Z4uB/wQkX9zKgmo2TUzgOIewie748ENh0jotBc1whKESPHzqWLdEf/+Np2EKlvEAsld2qZa6bab2c5oWN3F0n3zhCUs5Dyf6a70Su2n1dQCutCB2hDwIn+E5p5WLvAWdBmG/EMQrP0OuQHQ0dMdZ8Nid+SeTiQ7ZxYGCr8Pf0k24WeQXA3ypG7WZt1go0wrb6ThpSsOn0hpt2D9yu0ZQn69P80P4i5s1103v5xsx0cdoLTTjbTzuS7ZE2kxp/WX9br+h7ecZQy7awj9Ab+r5UShXD+e1ZmS8gAPg0bWzxlQgu2/kSvStZhASsjNlDsR7WPBlps2MULv3qpzIMCVF21eJWVoMDI9uwZK7+iehy7iqGd6XN+D/qAaF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0MdUrHDD88j/EDeCfy0eQVq7HJoU7KrmmRRzdnn5r4q8twmPhVYe5RGQGTIs?=
 =?us-ascii?Q?bHuPPs6Q/+K15+lFficPdfd2MfCYPRX582ogIbIeq0tpBqTrOIigklg/EF+k?=
 =?us-ascii?Q?DyPS8jp/c+h4CDekrS84DUAebiSDZJHHZXJgD4XoXhGwP/bJ7gv99dBpQSR8?=
 =?us-ascii?Q?fWmhl+EX0yq/zWXJQw2PEJQ7pFIudbwmOFDiMdIMUYgDqvDtfhipNrJSOkCg?=
 =?us-ascii?Q?OJu1gpd6ut5vqbdeXGfyjrAZ0li5ps0rNkXS5SrqAAkCQzIrAF5NuJOv0tAD?=
 =?us-ascii?Q?y2+tldlbOVvk9Snl4Mx47TPzJ4ToFxPcFmrQVlaCKQ08Ivao3CEgmCtaeLiJ?=
 =?us-ascii?Q?CRCdHSl9rWL1pHlX1vmn8QPmh4k2K0EXZk0IniMkMf157YJuxqZ6xl4E+/rE?=
 =?us-ascii?Q?vMSOoTEeehYw0BH6cyjpwSROtrouAL6GsMOYYHW6abcJolFDRNVPVXPyzjlB?=
 =?us-ascii?Q?JMUDHaeuynXVxfHL1H403/hUjQRE8MJL2t1+kwkXErkQpGkaX/0Yo1BZOeTn?=
 =?us-ascii?Q?2RZrA7odcLIps3XfrK9WJpTriub91r1kTiK5yK4KxRzDhyIBczX04dd2Tu4u?=
 =?us-ascii?Q?WzmwuOb+6aOmiSZk1baYy0EfPjiIiPQ7abONIRWqsb3sUpeP0+w+KoSMiXwN?=
 =?us-ascii?Q?oD0nbJg93PYNFf5X2sazhh50AjKAjWY0jM+WjWeYP/zkVfW5dB19Mx+iSla8?=
 =?us-ascii?Q?iICslUzIrLCVIj94VFa2mWn1gPnS2UqDI0H0lzAe5WBNpeHSXq1UDuwom335?=
 =?us-ascii?Q?lpsCYW4LjPHrLcruiyF/u6gyBNPflucbdnCzKsAx5ENdQUEalifasdUkmHgu?=
 =?us-ascii?Q?KEuA3fRzNbUTpxQStf+pqKISlpkLjol41Nx4ciEoJoDOPk+fJktgGma+Yzl3?=
 =?us-ascii?Q?1QSCVqGctqsbDjRdG1Gw1nc5XAdc5DdFMe+BhsKKckpv0Ce804aOJofSgfyy?=
 =?us-ascii?Q?WPj1HSGanSVAjIjY2rw2n4XZtSVzmbsUU8/rh5BRrPaIoTabaOFZX3wKjnXa?=
 =?us-ascii?Q?EsNKtWtbTRz8GH97l+RcFTrDLsQJd4nxSZWv5SdWKevMuTQhF9pFA8LIN76i?=
 =?us-ascii?Q?qptV7pg/tzgJTF1GPkuB0qFP8pIP/KNQVVZAyxgr/YepU36lYxxYSeEWMXGH?=
 =?us-ascii?Q?O9DPG29YBLVZ9CRk5bKyE19nvc3XbG69u/HOFSDResmC/YaW2WkKMboIzU1e?=
 =?us-ascii?Q?41tFt1Yo8v2MWv3AI7dtU+nmT+UA+bSKpSm8BkIvI4I7lpHMRp6YTKBZHOIw?=
 =?us-ascii?Q?/kJJvVoGq1dHyNQK5y2DO/7nZ+sKFxRyTvo8qnl2GUyw1Pnt6/jZ1MdsO4zb?=
 =?us-ascii?Q?kYfLTlSXimoxNz9MgFUUgOauKUMQ7bEjWvLj9NOadMeGSyEheG0DrCEQWUD5?=
 =?us-ascii?Q?JMX4lije3jouNRWn3AaCSgiIXnLQOGmh0FBtjcEUzFsAXegkmnKyTm8u7F7l?=
 =?us-ascii?Q?wveH12P1jg1wJv8mzwAT31AUg7kygEkcOuMN5BDAi5nUbqfbl78pfrjfyi0C?=
 =?us-ascii?Q?BgpqTJnWfXPvvZkOmIW/3hlCr3ZVtRik1Cl91ShVWay5smuT01q1635a9aMd?=
 =?us-ascii?Q?VMJGBfDvT+7wox7+FYgN6ARpK3T7LioTdyuHIkP4H9k/oKafm0h0ekz1GVd0?=
 =?us-ascii?Q?giu9gIPBQYOapmcxryDVvfPpwp65MEpTCs76RaOaiNNNStNGyzYBRK0tVndN?=
 =?us-ascii?Q?DUoSWAZXfgYORl+fWPJUzkirlciKtaBvhUUrvtSa8YcsbTLQuSXUJvhy20nJ?=
 =?us-ascii?Q?RFJbUqB2dClddy/aEkUfyvNWv+PH64uQh8tOePUjxyBTUY+6L/IK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391ba00d-7058-48c1-2407-08df15015969
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:19:25.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+tQwImsuzQCjTTjTytg1nh8aYr/lfHBlVgpz1Oi2h5HaVUC9//7mb91BVvJ73m3J4erSWv0PFeWOCtHF1CkOXp1L3dCGm0kUT91VAbgtnMwTYZ0EPIln9xUCRxicftS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

On Thu, Sep 17, 2026 at 11:37:25PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 17, 2026 at 03:33:57PM -0500, Frank Li wrote:
> > On Thu, Sep 17, 2026 at 11:29:31PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 17, 2026 at 03:04:16PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > From: Frank Li <Frank.Li@nxp.com>
> > > >
> > > > DMA engine consumers must not call the channel's device_prep_*() function
> > > > pointers directly. Use the standard dmaengine wrapper APIs instead.
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > I've checked the other DMA operations, and there are a few direct
> > > callers of .device_prep_dma_memcpy() and .device_prep_slave_sg(). The
> > > former should be easy to address, as the dmaengine_prep_dma_memcpy()
> > > wrapper is a drop-in replacement. The latter may be a bit more
> > > complicated.
> > >
> > > Any volunteer to send patches ? :-)
> >
> > I already sent out and try to cleanup all.
>
> Thank you. A patch for checkpatch.pl to warn about new callers may also
> be interesting.

Long term plan to move dmaengine callback to private header, build will
failure if consumer try to access dmaengine device.

Frank

>
> > > > ---
> > > >  drivers/media/platform/m2m-deinterlace.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> > > > index 9dcc4bd6cbdd5..57a91ff2269f2 100644
> > > > --- a/drivers/media/platform/m2m-deinterlace.c
> > > > +++ b/drivers/media/platform/m2m-deinterlace.c
> > > > @@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
> > > >  	ctx->xt->dst_sgl = true;
> > > >  	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> > > >
> > > > -	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
> > > > +	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
> > > >  	if (tx == NULL) {
> > > >  		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
> > > >  		return;
>
> --
> Regards,
>
> Laurent Pinchart
