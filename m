Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426224;
	b=zZ8Wm9m6lT46on1r6ZGAn4FQzrSir9iboMAl3p47wHjphGqH69+aJ2xFe5+ffwhxmy+C
	 PuvHf+wLi3aGhNwnFcucoWQwLd8TLpnEHP4KbC6bIpX5N0qCC9U5FRvoLZSoLzuOmbQNZ
	 2gQ9dkRYgwE04kjmkpdtDYEJBSCw+/Z4G4+smQWh/Acx+Q/LTsk333ZAJNrXjta73QhCE
	 6tQxvrnA2HfGHyN4FP59hRJnJKB8RHrozYRRAjL4iL09rYaoTWLC7YTrtjCZcUNTFV3Lj
	 dzk9F1KDPD4ieaPQfIZ0CBxRAjx44yo5BF9XTaFPAhxbrNm04BG9TRyvErozu20+tHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426224;
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
	bh=NDi6BW4cJXN/wl0WYQzA3wu3Z+i7GhRR1LYcoeK5tU4=;
	b=tt3ZqNQHSwJm408MBMVGF2VI7zKDFt8C8/iuOowFvRZwTGjsGxKVZ1HRHSqCUWFLcBjt
	 BoSKmDncEXCqDZnYJnaGcD/1AuVd6BEKSaMqJiEjtYB3dMgHEwiwOz8OX5n8ucBgknygk
	 Ee9tG9U0kQ2QJwVth78dqgHaNFjyZEdfPureYHEL35bO4Pv7DeR6ZrLWg+ylRQEJUPnz0
	 HCQBe7L+fBBz9+OBlwehQDo6FjMRcVB9CYmWBll5VclRigz7ISQA+YXownuZ+YDLCLEAM
	 ZwEjUAw4rjGiKXh7icgCv++yxr2+QiD/oHqTNDH6f4QiOc04K/ZHIonJshR5MJwvolw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AxRcSm+0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83672606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83672606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AxRcSm+0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oI2sDMbIDX8J0+nbEiFw7lSQq6RydZqtTqt3I+13nk5CUHB0s9N11ZIt+TfBDFc2Z1NrT74AH1EQ3UU6woN7wwmJx+7yFiYSyBHPcywfstezv0X2NfVAheh6CH50dDXg9RnZBgzzTHZjGBFXpKAiYUdc4CTyL2WzeZIxtj40JBCTUxy9kN4/mcbMDx0fWTSTrWIwS3Humbrce/CleBmNaA24iv6q6Gwtn0oczi1zRtzecBp6cHIGCOIjdxv/zxba6KmhwNwzbz2NW6i2ChGQ6h/EorHOnwgkv1Mf4RRG2qEkQT/xurp+3IafDcko8H52C324iC6rZ3ut/qJawMrNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDi6BW4cJXN/wl0WYQzA3wu3Z+i7GhRR1LYcoeK5tU4=;
 b=D51XX9OpodXcNgbMvXZ0R4sBfBjwKSLBThFhOjImDR+UmWGu4GPdJ2LX6xO3s8gyHjZeY2dJKXwKgijq0t6QM+awXM/Wqr95L0pC29rDtqps2NKX6w4q24zXMEEJi3jeXKHBazBkMOgvMwQOWw+1Jku81c1VluRGjv1EMADo7uMlbksph/JlV0kHDMBvoJmD8yfy2JALCKkcbWaiLXhplR6xM5nVtDjH5vccgPWZbJEVl9+MKkDbxLsIWeOcy99tIT2SKlSeoCcgz6kVBJGN/m5Cr1FHKaSyeeHEqbjyg725l7lNCkaJDOp7SqX75c1rNFLmOoKNURQSQ0W6kEqGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDi6BW4cJXN/wl0WYQzA3wu3Z+i7GhRR1LYcoeK5tU4=;
 b=AxRcSm+01R9pdGoS8Ub8XstW49keYdA/UTrDRd5Daq+inSOwQR5pJHHLcqWhEbFSBnRFXuawxpGFU3eyyCONrjWepFeOAKYXUMrMsMZ/8aI9F0YAPPE4YhWZ5xDesWsGmV0aMP0z7ZwAqyDXCPdvg2wmLCjiGOzKH+NvxvPvxxeDARVHG7sfKuhK4BB4it9wFE9loVPxN/NgtFQlGJ7WC1TE1Lraa7g7JO7YEPpyZ2OFPovSE8WJ9BPtFPcrFpGlIopm671rMROLcllWPRcQe+logykc5PfE9bVbhlUGxGG+k+gdltqfnWC9wVkAFb/6yH2ryeSJzHExkZcSv0XXAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8091.eurprd04.prod.outlook.com (2603:10a6:10:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:43:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:43:40 +0000
Date: Wed, 11 Nov 2026 14:43:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <avTFZYWpaVd6Nm6K@lizhi-Precision-Tower-5810>
References: <20261107-dont-use-autosuspend-i3c-v1-0-80a1546354ce@kernel.org>
 <20261107-dont-use-autosuspend-i3c-v1-2-80a1546354ce@kernel.org>
 <20261107133008.7d8f0bb0@systembl0wer>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107133008.7d8f0bb0@systembl0wer>
X-ClientProxiedBy: DS3P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 8434e695-c00c-477c-168c-08df402c164d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|11063799006|4143699003|56012099006|261026121527099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m4/tYvZqKN0vdXxPEglXNq5D535dzRYCltMi4XAOESz9RLrZ0yczLgAf79/oWU3Mky5Oe23IKfSQSAVpnXMBOLQuxI61XNbPW2PdQam95Cfc9DyoLNtEamuxB0nlJgNxNbxcAAIvv3+VuEuj5jNdWogSI+wzUrK7pbLUratN+v0ApueV1STeYd1jhTg+kzFwkg0WaxbwjSlDKZO/T5opvZj+WH8z/6TjUmdVYvy8R9B3j4//xOi2PT3n/u/TFLdJA02zHvmUoab4juHgRfsf6ss2x7zmJgW5YFXBn+DAGCyI2rGEZGvnkZd3KDkRoQvNIx+zKAmxvlY0ZynKkYWiO9tL2oOyMkboCjpdUHjRo6mnDBcT2Kl/KIUV89Msh8D6YZ9jTDjUCEA/GELW9geyQKg6GmvQ7qo/bdZFKnhB3dgPEkasMGkLCysFYt2TbzWz5V3535TcwIY7HfQuKfrw82vLCDwGrjSFjdbz3D80QA8S95b9sx/rnD6Wx1BIo6vFO4ICH4DY5IWcBXlucHqa5Xg3g2gK+tT7JXz0BYWh15hdvdHLHHLmmM1ykHdagqIc/CXCyoyi1+1iTNqLL1IqPlJkkPjPvyEmILI42M7P0rdYQi68hP6uYj6dN8vEGnYB/EFne8DIl/rPyoJ+GhRAZ+xoxO6QLz18GS8c/lX8WAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0KcVb5YfmmYZmtksc5fCDQU1oJ7CTjMJ/dymg/lNuP19SaFgWe846v0ii3+Q?=
 =?us-ascii?Q?E4drdfXXse81DAzL7KRHRHk+UONpK1AIDH012XMn3iCDcRcoOoji5X+KO6Zn?=
 =?us-ascii?Q?tycVZwaN1CPnZlF16nMmfMymJjGoJZv4h+IdVMpHmsE09/ItGOjJKxjE1OKw?=
 =?us-ascii?Q?4S9yP3x5KJQXBt5dQHRktVE5JJTSpt0fpx/QeTijwG76Z9UEbLzf0bSx2T7n?=
 =?us-ascii?Q?2tjq6w6spm1b+m9XY1gRiSyZ3m3CwN8znxlZke623VLh2kCcOjtuHuFccmMx?=
 =?us-ascii?Q?cv9YWgjnO2n7wt+hQxajdAppywG+F7uuvMg7mvDGYHa+QHdqXyYk6FxXHaCF?=
 =?us-ascii?Q?fmsLBnheJGjnDeWzd8gZzZG9jbdvAfQZ7/2OiW9OimRBVmmo89fQMsObCS0h?=
 =?us-ascii?Q?cMd7OV0mKb0nvc00aJZAQsxGD/ItNR8HZTIvWH6NhSGkiMv9KXe0k/030Hcs?=
 =?us-ascii?Q?u7Xkc2dwVv0QXD8ynTWONobghLcl0sllUFXP5qZnebKM8gO4XrgPszLFbCsy?=
 =?us-ascii?Q?X6iJF1TKDYaQXvij0hf1dKMPWJhSmG074DWb3NKPYUrr78YxpJign3KCTtRQ?=
 =?us-ascii?Q?RdQm3nvrMgOc22AEc3HIeiByzHO5muAeZlM6CJLruxOWdw6o9wUsmrmdrdXc?=
 =?us-ascii?Q?4XpBro1sAxg0pqtsrAGzgCdMXR7tQhXy1GDtvSWkrD04QModmWea0PmWEPEw?=
 =?us-ascii?Q?6K9aOWUYZAQrks2+mPgM8J8tphiUutsRel2jBgPVkrP4MeuFU3jAifrmqT1k?=
 =?us-ascii?Q?F3VDiB1f3UmtvsmnT+jb/GWk6JfN5wvOiT8IN9wq2hIYXRM6DUs5gSRAw29I?=
 =?us-ascii?Q?EuqYI+lLKCIggw3piWYoLRM+K7DS+L9VmnMPD+Emup15UPZuAF3Lzec6jdGp?=
 =?us-ascii?Q?QmU3ObFcP6F+fW6ibxG5O1hHdasASTO9WIkothnRYPr2ao7Dw9+ax9/g+qKM?=
 =?us-ascii?Q?48yDEmdtPwBKx/ly40f4gB8eRXO33xmvKa/BcqbkjgipqLsoABI+V4Wza1zo?=
 =?us-ascii?Q?tzhwkKCvbcTMKbB46+kA1Z1I4UoFYJBOY6/0YqXdylduuUIw/ADGvuucxcsD?=
 =?us-ascii?Q?kQaeC/Guh5MCDZAx08LxP6RRKgnTE93JuCuj2oLTqwDYCl4H5LiDhpMMjAUC?=
 =?us-ascii?Q?6qOc4f8xS0S5uo4NBbSJboxInpL9PLoRfazFtTR72V4/zeVEr/QPwf1p12MN?=
 =?us-ascii?Q?wEEDhyHg3LKkYu1xSXpj/yrimwfLgNMXX+8dLs6A0SJm1Uj9T9TS8v0LP197?=
 =?us-ascii?Q?h6ksp4AbzxbpHxND4qsELshWiXciCic2s15lx3DfPrXnyIejXsD+77KvbjW4?=
 =?us-ascii?Q?JmRAFCAVANchYPCjT/wZGC/CaEkgPRUrpIIQhOh/frbBHA11WM0xQ8KoKM9N?=
 =?us-ascii?Q?+0XZRe6C0xurc/AGFp4TujSrWU+l/nnWcWM3rNjkOoV6KdsQh4fIcD3Wr/p2?=
 =?us-ascii?Q?JluyP3pyG9Sma9gFqp0bG9y6gjzFvyyAzeO2tjG1L6hln2AewcMvs8g7S+ge?=
 =?us-ascii?Q?ZMyY42gkqXU9eDFvM2tOZBpedts5l/dkgU7YiMiV4UWiKg99vwKQz5yOKbZY?=
 =?us-ascii?Q?YeHPIwVTpzTVQ0UGFCfPn8ytlarZHl8k4SQHPhmGeDA/Jg/xdX8Tk5BXPulr?=
 =?us-ascii?Q?+b5MU7HtSlU0Pj3IhGeS15tlnqIQhomrhHjX2CL7FTg5FbP0SQj+hV09x3QY?=
 =?us-ascii?Q?m7x/cZAFsiuKvJzJdI+WwP7p3zoGG/GQLrrRFGqHU8KlILu2K/MZ5K0t6CMC?=
 =?us-ascii?Q?DXBEIqz5EKBdIsL7s6wWNTX8JlqABJdwHlRdC5aM2K5N1jeYjdKW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8434e695-c00c-477c-168c-08df402c164d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:43:40.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wI1xbs7Utba9KGT+IbDTg0T7TM/sAJKOtZzbipbCXoWT/jptOM9bVPg93+JwVHIAcPoK0zl/tHl6JDR4sddIRlC4OX3ppjeSaJQtXCSv+GT5bO13TGq/x1zJccjI7Ce1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8091

On Sat, Nov 07, 2026 at 01:30:08PM +0100, Joshua Crofts wrote:
> On Sat, 07 Nov 2026 12:06:24 +0100
> Joshua Crofts <crofts@kernel.org> wrote:
>
> > Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> > driver core is now responsible for undoing any
> > pm_runtime_use_autosuspend() calls on driver exit.
> >
> > Remove the redundant function calls.
> >
> > Signed-off-by: Joshua Crofts <crofts@kernel.org>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > index e700392f0801..9b845b2955be 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -2084,7 +2084,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
> >  	return 0;
> >
> >  rpm_disable:
> > -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> >  	pm_runtime_put_noidle(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  	pm_runtime_set_suspended(&pdev->dev);
> > @@ -2101,7 +2100,6 @@ static void svc_i3c_master_remove(struct platform_device *pdev)
> >
> >  	i3c_master_unregister(&master->base);
> >
> > -	pm_runtime_dont_use_autosuspend(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> >  }
> >
> >
>
> Okay, after reading Sashiko's review it seems that this patch won't
> be as straight forward as I thought. I'm thinking of manually
> suspending the device in the remove() function or just removing
> dont_use_autosuspend() from the probe error path. Any thoughts?

Just leave it as it now. I will fix it later.

Frank

>
> --
> Kind regards,
> Joshua Crofts
