Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8762563FB1;
	Tue, 22 Sep 2026 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093587; cv=fail; b=ufS8ayXvCiF4JUXrEnCK/28SHsjTE5LLQRxUUFcmggxBrSTuf3/dV2hflvNN+z61P8rvyn90t4E6wwf63NSnv3VTJkyYdb5jFbku90VpO1e4jI2XdNPJ9qsp6/KCwnu4WlZS9Gz1lrrLFxi1/ppAavRanLJgmi2HuXL4QM3eX8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093587; c=relaxed/simple;
	bh=L9R0klHcQs8yMcrV9l/EbKYrM4lQByj1d5j2ETVGroo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gAPysVzwwhnhDgnzEHM3FCvkeq0xbmwpm+YZr0tk1yMEU4NEZXeftxLkBtPIi9l/xgMwoafEr+avWmMl6aglajtf2I6EiH5BLSqvwMyAeQK3Cvg02W/lZAe1MRL8waRR45QBywEhxJyVgQHNWfMYKv8Fe8Xloa7tAmqaesEC1Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TX4bSY2Y; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TX4bSY2Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir5XUJJL/BhazwPrSm7n6PLPrcMj7oSsjz/ev0TE2HJdnsv0nBUEupcyV9b/93z/mn2FW2ZGyL+rTljwABwkI+QFZdq22+4XSSz3f/KVo2wmH0maG7Zv2I4Co27+7A8nmjHu/fxhnySHUoVxvz5B2Wq6ce9vKSk70a7giLtGDOAMwqD44naBr8umXDsanatLZTPE+y195WJ/6eyrRpyHyVoxxvYObIZHHfkKD3NQ1nytoVvJoRGuhH+/bs8TcCumpDNObFUOFkpzTRkrMUxNp616L/9lKl3ECMu1N7FKE3PejDeDlN75V4WFo06bivkgbW7g9XLgWvKvPwAQDZMQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJncqEiCl5enPJ93v65cbFBNbTEhZ1r/UehOU2P90sA=;
 b=m/dojQ0Zo9zrey272NjY8zawS5CpAuPPnK1w3IrM7gbj8bUR2K2lg6vJpvEPonE+r8XUvVF4hgg27it+xizsD7sCRu+k7n73fYt11LkLP5BYuWjAogoon7vRaUSFdtYPZUkV7k64uVTxXl87fMn8dq5WWVqOiLDIvpi/h1VCJhvUjyxwJm9TRA7a7S+K07x6Q+Wbnprl+iG+PFwExVikIkP3XT0GjyB7YQ6Gl7G+QAfE+6MNh2O5MC9hd0zlPcrtWVkTZ+WBuahObJu3TVcqxCJjOEUXCvnPMnjKjEWMtPMznOvxLDy9uwPY+8Tf2QyslLC3tpsA5nTmkvG2814O2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJncqEiCl5enPJ93v65cbFBNbTEhZ1r/UehOU2P90sA=;
 b=TX4bSY2YUoi6WD1spSmqmsbbqNY4yzf4evTb3DJ/P2U99iYwdzy5DZ+6D7fll2uPF8Y5VY5m4jzJV7Mg/IsEqHT9uodn+HxV8Xa/6aBMyHlFQKMoXzPIEQVl2DX6ERPTK/ehngmbquA++T49SgS/X8C5MRznGTrPtYMm63iY619JZmSLh6OS8VPw3EIH9fCsyXkk5bAAvuTcuVvdjsizVE40S327iL2QBYEQiD452A8DcqrCkYafBMs2Ag6UnAj7DSj38rvHwoUlyeNUWNDW3Q6fTRdgEyB7edcs3UR56Uc6miOpAKpimgNRhdVKQH8HvIgLFT2jtTFqsLSXg6MqLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11758.eurprd04.prod.outlook.com (2603:10a6:150:2cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:12:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 16:12:55 +0000
Date: Tue, 22 Sep 2026 11:12:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>,
	"G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
	"Robby Cai (OSS)" <robby.cai@oss.nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <arKo_e-3vWC4aqKD@SMW015318>
References: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
 <arGNRTpmYwB2_gLk@kekkonen.localdomain>
 <hufoatx76dnto4w3f33lx3gr7efwgcmkj3x7nzofofpzm5f3hn@pvuswzm5ielf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hufoatx76dnto4w3f33lx3gr7efwgcmkj3x7nzofofpzm5f3hn@pvuswzm5ielf>
X-ClientProxiedBy: CYZPR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:930:a2::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11758:EE_
X-MS-Office365-Filtering-Correlation-Id: 71435737-7a5f-4e9f-1d54-08df18c45c05
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|7416014|1800799024|366016|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	cJkC8olUzJrTS4Beks+mH4IEdHMnrR7Mzg7Ejyt8wYsLztu/jjDBbkBQo7wkRgkbtSagx+ErvyVnpYXG/WBmE8FSBlgBU/qcOrVWc5zm6O+bTx2OvpgoQaYw1vzYKq1cq2u5ok6uTOT89Iz4KfoGhhqYWQdTEK5jM6YZvolFDi9Luwg1bPjMT8Vm+/77BE/Y3vfdo+ZxozGJ2uw/Kq8PW0JT3iVgGR9A2X0T35oRTb/i8WxJyTBFMd5dNUGa4buSKUJ2L6p7CjLq5WWOdfCKBkDf6KiNEag5pvyipIkGpqZ86b+JwzhaCvQVGUIYMicVOy+XBagdfjxKwnTwtXxCOh+hUHxi0SZow/i3vDySMPWKLQFCvPKxVIrPpgyqvhrlXYRf7E8cSGLnPAXP+egNLlsq1VBpgH+DVGCzLinsj2YlseggiNWe+j59ue7RLUptKT/Pdhv6qHB+WPCEMwJ/LVo41xUjwu2ycyGTxhcnIfFoeGFiV8bznTg4neluVI4NsqbnGXiBQsdblLOCEBHRa33h5byV+PsUEZF11YkZUbfLr8hDRrCceOpAUExfyL2lGexDQuqPDe81w8fwD9Uc4YwmSb9LR4tiyb2DACiGQ2WryQPLdlnz83wEs7gWLFkW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(7416014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jQyA2cGw9OX4zDnhktjMZohfpTsHvzgV86qS+iwRN/5la7LfDgZawpgIks/v?=
 =?us-ascii?Q?BorqLIGcLjAGxYP9KhauaxguGLglGZ58JTUWO+tujcHth+6+Z4u7xEUNPeI9?=
 =?us-ascii?Q?U4ED396aD/8gIHcivcnNVA4jY8pQNVfU8eExYAI6FOXbF3MTlDvFFPc0UxXu?=
 =?us-ascii?Q?teDPJ7HD5ODkPwnkNC7G46gImzy2UaPiDDzUpClYMjwa76BUH++rQWCgDM9l?=
 =?us-ascii?Q?Ijo2AMUm4v2imWaN7DMGxpqOyNvIqqjKIa4ZjyLAK/77ERuholIVSQgWsTAt?=
 =?us-ascii?Q?EMFi2TsghLcjgO+qh+HAwbfCEmlTi5Zb6OLFPQa56+FhVYPxuPpMLFUX2Bq9?=
 =?us-ascii?Q?hSrs5U5WrdBlVN6MT3PGY6xhb8sZ7BeE4NPk7VU7V4qeRiyoQW11hWHHRJBN?=
 =?us-ascii?Q?9YXjBIUJOVlUNlQJpbZ3z603J8Ul+X7f3t8HQHl6Rjbroh5E01f6wEBt7oKk?=
 =?us-ascii?Q?vBhNzu59vG7I2PS48aTrsdHdMcQcudgnEz2DRgrs8Usp5IkBGr0Jm0UokH8f?=
 =?us-ascii?Q?PEhmKQ+xzKnouxzhtqOMO265rNgrupFRCp7XLJJtSkJxaz4yNdvrRqnSI6dW?=
 =?us-ascii?Q?SJ6zlptpGU2cQNF24AGiBVt+ciWoCG64FU2AI0jOeylZ8GIy37nvyPe9MjFf?=
 =?us-ascii?Q?+WmpAAGXpvYxCaDq3SZorl0HLgabGDbQyBUrWZIHZ4RjK5jsJmniFbSy+UZp?=
 =?us-ascii?Q?5fmHiYtJ0yL/7hhTYlS4O2WYIxdm+XDyTflOScoRd+EreLlNptjXgmFj+G2q?=
 =?us-ascii?Q?UJ/Zhs1nUu/cZoAT5Cts4TwJt3BdwehRQM2pvkp1Hc90nCRgwPnMqiVT32Lc?=
 =?us-ascii?Q?69NQogKKGiZS0uxjuofkT/VYNuQM3xiSR2uGradhJRtyXvmDpFLb8q9MHTgc?=
 =?us-ascii?Q?LlutoGefXIeJWUQKQGURr55uwXm0jaJazsjIH4uGSwp9kep/kB41ZPRGfriw?=
 =?us-ascii?Q?Kn/NmrdMZ260eCJpJrwxbPOR8G1UBf3hHTvpuwhiCKSZi9i4dU7f8xySgzc7?=
 =?us-ascii?Q?TCRzdlr6qlJOEoiVZS56iOx7UZlzIFNuMhobgVJRcjDMGuhW1FClw+oFYVlx?=
 =?us-ascii?Q?r8Hj3G0ww848ZhEwApYcbnQWkEzPNy0b2AygHKVzzNbaHSvYJPGWY2hLYkfg?=
 =?us-ascii?Q?q1tzJzCVroVs3B3Igml/XXrwiD7aC/Sn5oUEzpNl9lm6aP2VhPVQqUM+yCTm?=
 =?us-ascii?Q?WwFOM+B44wUNOWE8kKB8tGidekhV52StU0fcJnRWrthoZ0L1bUIigBcGw3we?=
 =?us-ascii?Q?cS/1h+uxPAe/ONYULQJzWrbJmRvWd2aEbHhaDTNhGJPPxo6sP6UlH8sb9snU?=
 =?us-ascii?Q?P8mjQrVnlcbD+WBcPl01SBxaHNnwehVc1ondaj0ZkLJQFzQGT0esSWpBREoU?=
 =?us-ascii?Q?35e6zS48HBGE7iwgCyS2K+Uc5EoyuKiCEL2ZIfVc6l4/YHRiY1gF8BLXKqJZ?=
 =?us-ascii?Q?UP/nAznK9LKWvHhCaIH9+pG6gySR2tmsiCW4oID1Zi1WgpWrY4GC6raPHWLK?=
 =?us-ascii?Q?Bgqh3OcOzH4V3iweB0tW3lbBzFUoUJuXPJ/pMd5UWL2z0ZruzhnB10HEJEk3?=
 =?us-ascii?Q?DWUqOwYw7c/nnCAGm6e4FJ4xzGro3tP85wLYpvm0fknNHyG7b+67WphvlBhc?=
 =?us-ascii?Q?jOdKwquhW62TNJyq/ig6uI9xwA5yvuVUjZ4dQ3BH2/KfP0G21iNlIGu64oCn?=
 =?us-ascii?Q?rH51H7PRxY6ZIALQa7xA/vx55WS/iiaIgCq+WkRCeRdeqJI8b/7xyyapPShp?=
 =?us-ascii?Q?ThEVZPBy6gzMNEsYA+a/wqNTM1OxoLZDJwuiEu6o2vRfGvDpgN0O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71435737-7a5f-4e9f-1d54-08df18c45c05
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:12:54.9484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPhOtvEgEBI+dQ/i9suhZuuGjjnJ7WqtRnGv5PzlaiSFcQC9m8NRigE7azBw5ebvmDk31zB9g4Mdync38bM0WzkaR95a1jeojPP/O9nX6vsbzX3I2dM8I4n20F4xt4h5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11758

On Tue, Sep 22, 2026 at 09:32:41AM -0300, Leonardo Costa wrote:
> Hi Sakari,
>
> On Mon, Sep 21, 2026 at 11:02:13PM +0300, Sakari Ailus wrote:
> > Hi Leonardo,
> >
> > On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> > > Hi all,

Add G.N zhou and Cai Robby.

Frank

> > >
> > > Some time ago, we had sent a patch that implemented the .get_mbus_config
> > > function for the OV5640 camera. This change was necessary for the camera to
> > > work with the i.MX6 after the v5.18 release.
> > >
> > >     https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u
> > >
> > > The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
> > > implemented on drivers that don't have dynamic lane configuration. There were
> > > proposals of implementing it in other points of the camera pipeline, but no
> > > conclusion was reached.
> > >
> > > We are planning to send the overlays for this camera for the Apalis iMX6, but
> > > we verified that this patch is still needed for the camera to work on the
> > > current mainline. Below are the commands to configure the pipeline, which
> > > explicitly require a .get_mbus_config from the camera driver.
> > >
> > >     root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > >     root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > >     root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > >     root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > >     root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > >     [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> > >     [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
> > >     root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > >     Unable to setup formats: Inappropriate ioctl for device (25)
> > >     [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> > >     [   62.616204] ipu1_csi1: failed to get upstream media bus configuration
> > >
> > > I am not very familiar with this subsystem, and it's been years since this
> > > discussion took place, so I wanted to know what are your thoughts about this
> > > patch and what the correct approach would be here. Was there any change that
> > > would make this patch ok to be applied today? Do you think this still should
> > > be included somewhere else on the pipeline?
> >
> > My objection to the approach was about adding code that does very little or
> > nothing to potentially a rather large number of drivers.
> >
> > Since that we've gotten v4l2_get_active_data_lanes() that however seems to
> > be used by the imx-mipi-csis driver only. Could using that solve the
> > problem you have?
>
> Hmm, looking at the implementation of v4l2_get_active_data_lanes it
> seems to actually still use .get_mbus_config, and falls back to a
> maximum value passed as an argument.
>
> Furthermore, the error comes from imx-media-csi.c, and it doesn't seem
> to be reading the number of lanes in the config, but rather the type of
> the mbus (all the uses of the gotten mbus_cfg boil down to checking the
> value of mbus_cfg.type). The receiver (imx6-mipi-csi2.c) actually seems
> to get the number of lanes statically, and handle well the case where the
> camera doesn't implement .get_mbus_config.
>
> To test this, I hard-coded mbus_cfg->type = V4L2_MBUS_CSI2_DPHY inside
> csi_get_upstream_mbus_config(), and the test above worked with that. So
> as far as I understand it, imx-media-csi.c really only needs to know
> what the type of the bus is.
>
> The csi_get_upstream_mbus_config function already identifies whether
> it's connected directly to the receiver or the mux, see the switch
> statement below. If I understand correctly, in the case where it's
> connected to the receiver directly, this is already known to be CSI-2,
> so (I think) we can set the type value directly in this case.
>
> For the mux I am not entirely sure. From the "Figure 19-1. CSI2IPU
> gasket connectivity" figure in the IMX6DQRM TRM [1] (the same one Jacopo
> referenced on the other thread), the mux's possible inputs seem to be
> well defined to be either the receiver itself or the parallel interface.
> Given this, maybe we could similarly infer the bus type from the
> sd->grp_id gotten from the mux.
>
> static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> 					struct v4l2_mbus_config *mbus_cfg)
> {
>     ...
> 	switch (sd->grp_id) {
> 	case IMX_MEDIA_GRP_ID_CSI_MUX: // <------ Mux
> 		sd = imx_media_pipeline_subdev(&sd->entity,
> 					       IMX_MEDIA_GRP_ID_CSI2,
> 					       true);
>         ...
> 		break;
> 	case IMX_MEDIA_GRP_ID_CSI2: // <------- Receiver
> 		break;
> 	default:
> 		...
> 		break;
> 	}
> ...
> }
>
> [1] https://www.nxp.com/webapp/Download?colCode=IMX6DQRM
>
> What are your thoughts on this?
>
> Kind regards,
> Leonardo
