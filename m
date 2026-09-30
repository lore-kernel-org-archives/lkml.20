Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2764B8298;
	Wed, 30 Sep 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785283; cv=fail; b=cUwpGAWDI6DrN72yDbqjhkXhUjiOiRJpQ0v1WLHTrwbB8AYf+KsfUph7KF/ntHyA/hnBCy/Cr4cxXTBIxCrdRJ2YWlzLuXj+EkAWci+SE41+sYgWGKMsfdRlNeX8qydcsYGBHGtLSOT1XaEVvNDb4/+/rJIiXStFby2jgFRq8wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785283; c=relaxed/simple;
	bh=Ntg44heRreXdYxUXN4+MutohPMnDwDJjtqp4ldcAUek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d2NX2pceCY70ux1DqaVwVV46n15XgrqOsAje4sTFZzW0PepJf2K3Mv3vI1ODxzCnSW89xZ5mIRVMCcJvAzTmEHYBiaGZNNkua+le9ANj5vsEHEcOze06aHq5Rhsqc44TIkRuv2fRMxF6uEkOPyS/wQFvZkvCKFRhA4173F0JWds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KjUAbHKM; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KjUAbHKM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/Ekekec1qbe4RMloJ9cqzwLZL44BZ4OLNhV/cckwjb+F6ps5HwtCeP/u4fbtnVncdFZnK5k5JSdSL1y/oB0iu44dOEBUMTfJrxS5hVbTl5+inrMhp4FTmqfGOxGsc0j+qy0YbEz3NiqNOIV6nWgWrJEY/PaZn/mCkzYFsbI+E1y0gamSoeeeW0gO2TFSco9xzOGewSgE6EkNt9e0tSSweZUU1mubDm+dtqQ+QN1KL+0okQ06vnaqxvCIkILj8sZikta+A9BrKVXFQ0J+duMsfWHGjclqTFcjqbIKJmZer6V8Xtz7DMVW876mEW/DM8N0SH/ZcEBdsXQL/I0JFvUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iskIw7S301v6TTGapwma4DAJyjd2ua9RbPKVQb0VhY=;
 b=XpctiRMbYC5ohdeHNmLHIsTKXBfkeYriGGgeYcrSOSe9XqWa1aKB3UCn6ZNMZ2uBDeIF5sUWs2L1HSJl7d6Ym6dkCfQRyWvbuLzQXs9yUsjPW2iKXK8CfXYST66IHNUBgNwx1PlslgMV0NiAwheKUZIuKSzyrzE4exsPKSUzl3XUkid3G+uI5IjHrsPSFTffeUsLvyDCRc+am44ifSvRXwHTfKP7wvuYJrbcmFZ4qkcgFP32J+wv2zsZ9Rpvjrb50g7bfmrrDvKWh2Hqqtiu/d9kE861dO2L1nmXWPqljttZLE56KHDEUif95hHwJtWHTHkTNsD9A+BEcGRnSqbXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iskIw7S301v6TTGapwma4DAJyjd2ua9RbPKVQb0VhY=;
 b=KjUAbHKMHBwvYj6NbxaY50FFFgMN5xKAuElbXyW6eGsUdeRdKecOA3br7iCFJNVMfsftwAt18VwGwU6e9nRU99F2iA+V59pVPRV4WkGY/QHIO6fbBzxgf5UF5osIyd44XOV7/rUSlUyego1tBJq1PcBzIeuts8CIh6Tp9Qgq+bt7rzE7dQ9Tjttc5l4AJhV6w3Y2LWQoIMRubfMFg99GAxj3XYdPClu6W5ZV8nBM0XqbTWWv9aRaZPiATDeZOMtJs+CHdkFDBrMaWsXYpogqqvCrdiW0IjE0gACCAtFXmW9oF9pXIgXmKiRpAlqt6Gys1Jve9Aijb+lEXKLxCM8UCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:21:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:21:14 +0000
Date: Wed, 30 Sep 2026 12:21:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
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
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <ar028ZyZg56Mk60M@lizhi-Precision-Tower-5810>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
 <20260915000520.GB2804748@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915000520.GB2804748@killaraus.ideasonboard.com>
X-ClientProxiedBy: CY5PR19CA0108.namprd19.prod.outlook.com
 (2603:10b6:930:83::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db4461e-7eab-4f41-98c6-08df1f0ed90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|22082099003|18002099003|4143699003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0mrxFG+656LPkKh6c5QnITh9Wcfo9IZ5Cld1cFRjWPX+3gpIHsvgwh4NE94oSUVq8rKZmZY8m+FTRwsqZd0Ko0NaChE7wljb8E9S/xiGEQb2kb0H5mDgY8TjLipXgUEnq/EqZw2r4VVaACy3QEyCF47LKprfQhDSNkVisezjozGs7ePipEdXAXNf/ALZqBQml1pip/6oR4nLFMJ2vgjOkAOnVYi6RP6id4Ll05M4EXbwD+UI2Vfdb0MvXHgGzK7n6xKpykl4cPpMtUP170uCFh3bbxQtSM7es5+qyduLZsMDfOoDa+H2LRepwDXE4TjuwfACGdtn8NtvQgJmWPko8x+WlYwtnE7d+b7HErTiWqKlUmaVvFb8FsPe5RoQBEgPaZkOJqmp8tJUu93hVUVpYhtXEooGov5V5XHBksucvK1YSnJaXYbJJCYJ3Haw2GUgKtdzU6mvMJYvks2tT9yCdh+ivvWvQYqr1Rh2/K//yYvy3gfQZgDhKfFs4mTnKwVeAABnzMpEn92WSJhQbS8h36WGV6psy2a1wkrgkcaDW7f6u3NJNfnF62Ye76mMPj7yvao9m9RnEIJMf23SRHxDqvOsxjoY1VqMRXCXiNZ0Ay9kL0GkLuUR/SY6DeF8cZ+qKaC0VKfohLVsJfN1oqvkMHL5oimHkvgw2q27+AQbzK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RqxIsr4DWXdbkRWVOT41NfYkUsHCwnXGg6M4OKHdBwtASnLBZJk1CkfYWdyL?=
 =?us-ascii?Q?CfzBHJdV9MmQ/HBpZzpMOElSyKt+NKNgIA87jnx+3gasA+3Q+WrrgKeS7oAf?=
 =?us-ascii?Q?FcpEJGgfk37BlzsM6eauT/z51wvKD64JeLbvd95F5sIS8Gcyf3v06jbMa4ey?=
 =?us-ascii?Q?/nAm32WcOEHIBLEco/ZkAJE2ZuerXnMZDph+qlA1GYYmSFpf7L44rIcLPhP3?=
 =?us-ascii?Q?haASFIsbolJn8yhvIASCAoTaJ0I7CX/9/4nKMSW4c7JjBunPCDd768iphUK2?=
 =?us-ascii?Q?zdnYHXt+Tuorhtothr5mK4trsBYfUuwtjMHi9mY85f0l7/1ytV4djct3lKZu?=
 =?us-ascii?Q?8tq9iAwHCk/TrTeQHeMwDoe84wU6PIwNG9/akXUpVjcF+p2lEcoSvaStH2pm?=
 =?us-ascii?Q?tZhxfoHHT3AfhIXX+kRKRFRrkO7gdfFNvD4zphhB3JL5uHCvH4S+a+toeGou?=
 =?us-ascii?Q?6G9X+4s0wA1qWYESbJEbk0hgNqpmxhAa47ITwsYnSu4lTlP/fZtX8L4kFKCb?=
 =?us-ascii?Q?Fq1++lA8Q5FdN9X3FpHCpkvAeZv2sNE++l9vBzgClWhhai+DjR7zrdy70C7J?=
 =?us-ascii?Q?kt/oee1CWWa4HmGWDznI10QHb8AWxKsx3e0MYZMLs+MEAQfv1+NkaxtP7lc1?=
 =?us-ascii?Q?py44RQBQpWyMcWJBfCczmmlQ/MTRR0nDgGj+dKngF/Zo+CS3YBeXyRq8G+dB?=
 =?us-ascii?Q?sUe6RrWAgJ9/BwLtQUsL3OPvSopX/2MRYhywr7Blqu65PBrRHal8OVC1VNwF?=
 =?us-ascii?Q?OFKGwe94Q0126m8Fo2fJN6+GEf+HL64EESVy8tjRwr+vUb4cmqx5+FOdqTlC?=
 =?us-ascii?Q?RwP8yXFsOV5WTMy8I39UmlSFw+e3LTnZWCYLAZlLA4C5Io9Gc8Dl/XFdvCxt?=
 =?us-ascii?Q?9FynH46kP8U7TXQoeAvBsdWwNZYECVmPuBYexMhLrRZ+UKmXrqvsgC2wpa0m?=
 =?us-ascii?Q?bVNHcmzwypeCebjO7fXpevyGgM1aAGbjvB+MmWxtGWenKfaAyRPSsdW6/SXu?=
 =?us-ascii?Q?t92z6fqOe7LajcB6mO4KzsJiZt6olYRnl1M05HoCf5sY9yiDfB0cXJSAWp93?=
 =?us-ascii?Q?VJTVIp7JIhgRuXJHtUELdWXYLpK/Xwp+l9p0d/CkGUeW7g5pb6RcOv3YLhn6?=
 =?us-ascii?Q?ZI7qH/cNUdYZiHtWdzR7dIjv9lLs3u3bHAsm/c+/y9nFKFpcMJ52U1+OZIXa?=
 =?us-ascii?Q?AqdG1r5ukY6x7hn5F590taiYOYfQqiGx8u2saJ4crL4J2oKasQ2s4jPlFB2i?=
 =?us-ascii?Q?dZuaLpeMzYS4DA+em7K1VshGh1ZcL8Tr64dx38zceFqYoFMQ7uTT8cnjbGnG?=
 =?us-ascii?Q?vKiXqRVJPQkBF/62ovp0mQQeJy+6XSFEyUtZTG3PlLfyH9P1M0Co/k9YpV+p?=
 =?us-ascii?Q?sDp4XwAmH1rT5qJjLoyl2NL51sUbkcgEs8BngvcITFx9uW/1nsi2DEZidV79?=
 =?us-ascii?Q?fwLpUMDn313pbaMGGytreM+Ow5kuQPgGCyp0Lh2/JkDocbSNo1xvMKqTxAe7?=
 =?us-ascii?Q?bhbyLrAld1hijSZWenKtAYOEo2YCikZoWZoxb5lopaV2po1idyEo9mrkINkQ?=
 =?us-ascii?Q?Ur+UjPE+xV+OGpgkWQ4NKM1cK9snmGseOpobYj/DLltMnsIyW46fCgizaQxR?=
 =?us-ascii?Q?RTWogkjONZyhadbqHVnBJ8GXU3F6+Q5dTSzm3sNUqNuVK+2RAzNEIDmT0bHT?=
 =?us-ascii?Q?oEVL2LLKX6QP7Sxf90r9jZzzVtP9QqAgZ4PbOIrawK5jYVaAeHAOmEPW4Ui3?=
 =?us-ascii?Q?/WtO3UMQE8Ji87AbxyX+d6LShWo+LNq++OaVr01ETY4x1LXgRSzK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db4461e-7eab-4f41-98c6-08df1f0ed90e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:21:14.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUlbkOkhDs/OQIYgJQ/Hej3OF4HAjfwGN/LpHZWNbIQWYk5OyN2zCAp9n+PzqQAvtUwd2dieFu0UAcqpqs+ZRFr3qrV8/+z2QtbONSF9PVeY2fCsYWSOahzjkXkq+xZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540

On Tue, Sep 15, 2026 at 03:05:20AM +0300, Laurent Pinchart wrote:
> On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> > V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
> > i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
> > works around this by using RAW16 format instead.
> >
> > The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
> > along with the input MSB alignment on platforms that support this
> > feature, so that RAW10/12/14 output formats can be used directly
> > without the RAW16 workaround.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
> >  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++-----------
> >  5 files changed, 63 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index d492631dfb6d..0f776fc8fd7e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
> >  	.format_mask		= GENMASK(30, 24),
> >  	.buf_active_reverse	= true,
> >  	.has_36bit_dma		= true,
> > +	.raw_out_lsb		= true,
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 73f6ea7b0ea1..c352bcf8dc47 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
> >  	u32 format_mask;
> >  	bool buf_active_reverse;
> >  	bool has_36bit_dma;
> > +	bool raw_out_lsb;
>
> As there's a single SoC that supports this, I would have used the model
> field instead of adding a new boolean.

Laurent:

Considerring more SoC will be add. use bool is more extentable and
managable. Make code clean and easier reader, and preferred by most
subsystem maintainer.

The another disvantge is model can't tell detail difference beween modules
without go through all if branch.

use each feature field can be easy identify soc difference by compare
plat_data.

Frank
