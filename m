Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895894A4EF4;
	Thu, 17 Sep 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677252; cv=fail; b=KpfK/gA47sVtnxLRdB9WPBWfwbIVRpsCmtQUJEBJ5zGvbWeSPUnAHpTakiHgZfuP02J2N/9LfDtJLEm2pMvVOebMDHyqtg9b7nt9YR7Mat/mcDAeX1YcALJHkD/jS52mlO8razI5iouS0BLcOnGF8AxBFKgGkXr8Gv9XF+gu+eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677252; c=relaxed/simple;
	bh=Pyn0sRZgSkyw8tIPsg0sCIFxztpizLbsO8v/pEFLIyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Al7Xg06HaFDkN6zmMBHdpsVI1MGQE0VuGLNIf8s20UMejMVZx2O8EuThVEl+pJqd1DipKhAqbW6vIgZmZAi51eLVQQxZ3E7jxdrzpyKglwmCKXvZJvfvd9S+fybV885QoNYC5JmPJDX8pm8yOn4vOCZNKfgrhjioTs9Hi2CNuAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ouv089EF; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ouv089EF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWon0HAofk3nVAaUtHg35UcQ7ZAhbAgzGuNLfuTgiadoqw1V4nSL7Yvi3VAkQzzOC0hDG9lK71DFe3w96SEg0bxnSQmUpRo/F9OIeUcTSGwT/ubyI2l94/WOIcy0kA1GAWV2EtanTp6A2M2AInAMJY2h6FAczYqn5zKjJrWpP+BxEn5JBjRpJ75IGYxjE14TKKNcb2ZVzsa1BHYAvrathP4TYc1gYkvqU8+0JaOV9BwvzCGpP1OSjFvT7Wk9J9Mwl2Xp+kAfWa0n4ZiktlRIinuL3LZ+o+uVHJFcfUVdn+PRSix7BfhJmMiXNYopsefvnIiAJ/GLwejgcCrJnkq1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTHeo5pydEHbBnaxiPbiXcA0UoTvCNC3UWStanyKc2s=;
 b=VVQe98id1H431ZQcuD/qfzYzBvWrB2XaiO60GPAgT8BBNYZky6m/whMcm3Bwd8PDMNR+Bz/nJaFBENjU82itaDKRq8gG8Kt8pj0riw2kPoiZ2ECGOjeQPSygSuFJFuHqRBeEZiAcWezOk9R5A4iutCpOKOdCQf+eAXWz/auZL37f9bIrkitHzfgzL2Ay2KpNujLVb0YvwjIuWWtsNB/wMQzO1l2GWkkxXMAGYOZ2iVtaHI6579AtW7JDpuQnKSp+gUzURXqh3NLHg8GLpjXKvU/T05yEnYPzV1L7yiNEOCMPlvXHLzVxoSkkZJvr6Uyrjx5Wx60Pqhv5c+uyinq6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTHeo5pydEHbBnaxiPbiXcA0UoTvCNC3UWStanyKc2s=;
 b=ouv089EFxQia7W6wg4d6uJEw9nJjRaqBDCs9oeIAH4mWpuIhekwgiIrF3QKs3gRpNaClTBiZ/FoM4p4Dgy7kDYZjsSyQHlctpqstx3ipg9KAA/j3cB3MWdMmFPPYhC5RJpQ95MJcfNWGVofnYg86QAvRtsRCfUvlComtt9GyWlKCWzn8/zv3KF1lVXzQakFmAC8TDOiD1UrUHGmQqtJUVyu1UboUKgEoHnLJRfahm4GalMjQlQOGytKN1fJXL3U6bUDmpezdAlPEflg8upsbiWz316LOc81n94GqgWv4Jz6PrjoJrhtYblvCtINCVBmvqrop0NgAuW9+7kfrvTSung==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Thu, 17 Sep
 2026 20:34:05 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:34:05 +0000
Date: Thu, 17 Sep 2026 15:33:57 -0500
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
Message-ID: <aqxOtZdsNR03qmqN@SMW015318>
References: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
 <20260917202931.GA59058@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917202931.GA59058@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH7P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::35) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 40581666-384c-4c99-fdd3-08df14fb044e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|4143699003|22082099003|18002099003|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GfftV6bozLwxEAPE1wnOXlRYoqM/Ad5zDaP8WznGmRdpv2x368wspkcl0jWgYjtuP8gEQZXqvOXYhdeG3Inr0Wax6T+c7FO3KctelknZysf4++Zg+cWIsBRVHDlwitYWzhHKt2Rp5wyMAdw2Hp+gi7uFe/qQ/P542N8NpTflzntliYo4tHe+YO4Wovov+bhRH9fnTm+uViyNAqEVzJ4MjGi3OXuv8/zGe0Q1/ij2pjpa0fgJESbpSZhFucypX+tVAMtvT0R4No1eBHELnxeZBbPQ66RGQ0CqfxBKwQ+asW3gQLTjN2vXcsHYs5N7c1l7hKHHU0iP78WExx85yDyL2SpZUW9HReaOv3luUaXGEFe3a3CY+0Egx4/qlHAMHz49iZvaAoQnpc95LEPkc/z6rX25IeypSSVTk9eSQlakhgSt0whPrlz8mLeq8nIp086RZmJtCKnTlbXXexDneFZPbYPzIm7caBCBWacD26JPLeE1rW0BxF9ar7xjyfbYGvLmW0HPjEoiqTMWqKzDGNDa2tzV+s6WGS84uWfgfUNm3+RmeVrVBMT6UxMzfgNFRAAIIi6f2nl0XJRQc6xpUSq0TU4rNNthYvT4tKJvkJEjyRXSbBUPfOYjhqZhg4kMFW8mXMavzSYxFvIyMlRQiiil76UHgNXA4JfMbd1K0HCckP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(4143699003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rFmaNk+B8m1JC/ojrAaKzaHVVRI2BQZ76QaMyberkJQypVdBhYsIiowbOIYu?=
 =?us-ascii?Q?SFQgvLQ9HnEtcf5o2BNiPPFaoJTbNBSwnl+FmFL8FY3vMbZDsGru5CnX1E9Z?=
 =?us-ascii?Q?58O+ealT5cU+rj9MFIAd52uc8j5HHTYV3A44EQSkzyCGJgIdr0aN76wgg+tj?=
 =?us-ascii?Q?Tm8XBoWEd0rNsOLSO0ybEpCesYLwccSAtqKBfA46T0mBhJfmgkmNBsgB1SEi?=
 =?us-ascii?Q?TqIcAop1VhW+WetPZrLhFUSFWYQW9+2PIXLAMdnuPXqWlgNJg6tGKOvnZSMz?=
 =?us-ascii?Q?BQpN5v150C/lHOysElnklRSTd5N8lTRIINP/VSxyEk3sVYPZLoRXwZFCoXL2?=
 =?us-ascii?Q?gU29kfMp1dpLZ8yhXjK1eRpVaj1bh5trHD25h3uWbasJ/zNem3diSeV0Z6ks?=
 =?us-ascii?Q?VxspNE1EmywluCHDlC9rimFp0KLTg1Eq1+Y2xDGSq5Rwm6SreDhKpa0q1zcs?=
 =?us-ascii?Q?8hFn3EM2yMlzE+aD4zRUngHXDcUbHSee2EyCstS6L7gp4aj8oFgDSsSKBuSs?=
 =?us-ascii?Q?lxhnvb5IwN8l/9p+k3GfpsX7SezZJLUiK6a+GZjZzHNUdmS9S1o6NOkdv6ye?=
 =?us-ascii?Q?3+rDABcCC2ovYOVHEVpfxe8zNQBhRXlXoqCvxOXqoA3mJllSr+qQs2wYOb0M?=
 =?us-ascii?Q?cQj5d03gxO8gf7vmrpXWnmyG1GWZiYBlAFsrMBwi/sD+FnllkUU6RMSlYnKL?=
 =?us-ascii?Q?xrVgCim0waI6lfgL9eLczmoKZ6a30vmx5XLXG/mJVmRcCunEAmjthPyNbs8C?=
 =?us-ascii?Q?dW0eK7PCZtkxm7J658S7xCBNqxvhbe92q4f881lTr3S3sKgcCGD5jFXVNquZ?=
 =?us-ascii?Q?zo/V22Wmnk3M0pWvjoIs0I1MWW08TVtNGrKUD0cXQxmQ/66ody2Y3lDPQUo1?=
 =?us-ascii?Q?7MhiXEQRxN3Y2Q+yzIZBP/Ys1GaOOBDn0babQcyCK7/fDOG5J8lWI/lv92M9?=
 =?us-ascii?Q?Xo0dJgVwmtaE+Pk/3FDiY5vejUZ2nN3Ktog1T860bEK64O95H6hq2Lqq+kpR?=
 =?us-ascii?Q?JDo2gC6Yi5E51BTyduk/J8lPyo27biu62RITYYTa4lnvSC/C9/Jh7xZLdHsp?=
 =?us-ascii?Q?RQNAj6r21x+LR3labATclY2Ac7J+T8E8EeR0F0yhHZnbpXlLMfwdSZ0m0ud8?=
 =?us-ascii?Q?6EYbWUiNG8Q8ZWA39cG4v02yg/NPcbGXN+iAHtoEYwe4efBjXV9U6GKxzkmk?=
 =?us-ascii?Q?VLh9H52o0oHm7YAxHZfS8aH2c9GF6M+C4teZhZXBMySq7ZuL8xs1BBH4/Hzp?=
 =?us-ascii?Q?QA8upnVZMIpec/Bi4PKhmGLvGJqjEbFTbj+er/Yqk6mlVp9Gvg3hcLxV5w69?=
 =?us-ascii?Q?6fT5Sg1ZqX2/rx/LyDnMnaMoeAYxh98vT3MkF9Wd+vyXVYg92NwKufgC0rVf?=
 =?us-ascii?Q?gaMP66L8TFaYVzDqzGyRK0SfrT9tli45XiGeYzfBXiLG75ZYI3JIKCQVjNoW?=
 =?us-ascii?Q?o90nkqktkOLXmzi1aKU/g0O5qyP4zORWmG+0ON5Lw+Xqq5q7Y18TypLYt24u?=
 =?us-ascii?Q?bGoQVoR/hCoqjHEiB5Tgly/u9/exwgojYURtNmCgWQ6hjgM7aiQ75ay06LHq?=
 =?us-ascii?Q?b6VrB8C7Hezv+ijJThIeAS7dXAyOpPniYtl/7nPByKvbze7dZ4pSAc09uWhC?=
 =?us-ascii?Q?Ro4O/iQlF8h/px2MyVDI6Rtsmb6BISBYvZJTLnl2jTGsjhPBr7E5SVMskezJ?=
 =?us-ascii?Q?JkL6DNpG1Q/aGJpjBr4mB3qP/qldiSgpY8FaKYPgIcUM8H83VOO1xDh0V/JH?=
 =?us-ascii?Q?Rfs6MkCR+vi9o+gH0111aBNdmhosawvBCP3bN1In9HM2Yw1G78hI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40581666-384c-4c99-fdd3-08df14fb044e
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:34:05.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aVmCt5JFM0FUM64oRd+ZqzqMUD6CfJsrgGN+IFZ1+RY4v1lQ6anqcYp+3We9Pu4thgLLRzqf2Kj1UsKlw7oP0Ku8kLs8F/GtFWIDRX0MrtHmXoOCDuesbo3kyRL6eXE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

On Thu, Sep 17, 2026 at 11:29:31PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 17, 2026 at 03:04:16PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > DMA engine consumers must not call the channel's device_prep_*() function
> > pointers directly. Use the standard dmaengine wrapper APIs instead.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I've checked the other DMA operations, and there are a few direct
> callers of .device_prep_dma_memcpy() and .device_prep_slave_sg(). The
> former should be easy to address, as the dmaengine_prep_dma_memcpy()
> wrapper is a drop-in replacement. The latter may be a bit more
> complicated.
>
> Any volunteer to send patches ? :-)

I already sent out and try to cleanup all.

Frank

>
> > ---
> >  drivers/media/platform/m2m-deinterlace.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> > index 9dcc4bd6cbdd5..57a91ff2269f2 100644
> > --- a/drivers/media/platform/m2m-deinterlace.c
> > +++ b/drivers/media/platform/m2m-deinterlace.c
> > @@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
> >  	ctx->xt->dst_sgl = true;
> >  	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> >
> > -	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
> > +	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
> >  	if (tx == NULL) {
> >  		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
> >  		return;
>
> --
> Regards,
>
> Laurent Pinchart
