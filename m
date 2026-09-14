Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B393A5445;
	Mon, 14 Sep 2026 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413754; cv=fail; b=U44HeMxNmxrP1J7VT2QTVcUCSRbsXBTTTZRrjHoRwdGz41H0SLmG8x7TcQHC+IDUHPpBDGWIEk825Dbi5EJfPKbsSkqY8Jx/8Nqd/oGC7VblJg1SClRzD+hiz9c44Wn90qr8UezThWicoT2u/cT2Rlb+HxnyQ3R0zc5Yccdrxz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413754; c=relaxed/simple;
	bh=WpATlEV7yN6NBRbyAc+88/YLooSwdsaDVC9iJEEwjQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rJ2hU8oHOEPJQM/wEArJpy9ftrwrQlhVQrmJ3bPodnCgnRashPxXfEkVdr3De87ZlwPHuXdDxqh1QrWJQduq/cGBuqWv84PbBq51iurcFBFJrl8Bf3XJ4tH4VvtwhDu7S7FwS35jX3H5RIOpeX7S+ghFrVB92FjeoPt87Gc+Joo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ya3O+sOD; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ya3O+sOD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAV5hOZAigcaWFDsuOhXHrbjGnF0i9S5j6g3/ir+0AzqDoUTx+CIIvmz25+G0tX+Fslyyie5dRc53OwdKIA3zcupaGBs4UUWTGO8/+5ktORPrjBtjSol9OBzI1Jqg3OuMn8rGMj0u0pfesXzrZRk0LIcHbB3iZnjZ7HIjn2zhieAV8Jw9JEOJXbFh9247Is+vY8bzd64mDz0HXyaBHakYya3JBAEOmvp9DoUMn97czl9GGszbdTefAKye4LwUITsRvyUvIcFhUhRUABF45RREVaU8lGO5dGuvblXxuC3ZjOH9FVurErdrJ/L9GvelZuUGxI7q6lPWVJ7pUSl5w5qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnqEYIfx7OUR3wyiLSvfYuGSmf0sSrgIXcO7In7JX8Y=;
 b=IV/XvdJvjhGVpmzQyr0xL402GY6fVdcIF/Un6ZhaDZAHuwDefVsjZce5hSCQb4PO12KyFqFH1IHBWt1rgjtAQSZ0QcVIgWFLDGszOMESim1OppTCzc5VbKyzqkChfntKb3utGNzDvVGZAb8w9m8fMXh0YhOTILIfL1DWgj8tS97Z16sMKhmXBMcyFRQpFr7EuHinLpAhRCrrLusfud0hj07nQ3syhpL7qkIxBtYEEadnyhVPbeyCno3fH6CCkyhf0ZY4nVJx8WOTeUrO/9xJUnlF0CR0/8GXNTU8tmiCAEmpxdNMZr0/IR3blV/6OLY1q+6xXUqkEUkcuCMkcQQffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnqEYIfx7OUR3wyiLSvfYuGSmf0sSrgIXcO7In7JX8Y=;
 b=Ya3O+sODJrBJnl8u+kUiRGQPqhEYfTm089oRlKzuyP7UAPp14e1NnY6+FWxf2XRHOKw/vc926fsM2C227VHc71hH2zzMEceEmI4DWVRzy1PdHHXJP7eqbUQqsfUoR80EqU5DoLcrzSVswUWgLuA1PzpS/qtlJrzJ72IB8WrpWrefi18iDBAL7P0JtH8pgatsjhk62hnGzt6sMRgidlK7a3kmTBdIyqgfvsHinRMyR+oP4y1fXXBOujuCxZzM3fSNcoVucAfZLLj9TISgrMbzHzz5HcrWDjnQJCv0bEzHjlG0dZy5aVg7AjOHg2uWgbbOey/WDbAkRCfX9hAHT0Yo2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9377.eurprd04.prod.outlook.com (2603:10a6:10:36b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 19:22:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:22:26 +0000
Date: Mon, 14 Sep 2026 15:22:18 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Message-ID: <aqhJapJlWM5riB0y@lizhi-Precision-Tower-5810>
References: <20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com>
 <20260831-isi_imx952-v2-6-fafdb4b446d4@oss.nxp.com>
 <apWfk3ZjVZl7SKnB@SMW015318>
 <AMBPR04MB3355238DA1504F1525BCC43843FAA82@AMBPR04MB335523.eurprd04.prod.outlook.com>
 <apciK7Wvl9GfN47j@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apciK7Wvl9GfN47j@SMW015318>
X-ClientProxiedBy: CY5PR17CA0051.namprd17.prod.outlook.com
 (2603:10b6:930:12::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ba1fc1-305e-4b79-6ab6-08df129582d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	H0+anvtN+ULmBDkRzE192S68WQoFLFYR3W5CqFwIQpCAmCCJ6bXS3kOJ/QEHXDIIW1bsqEGBLaLLuq8PXM8sGM0gKMgmFr5cF6O1B+E3LhibUE9vrcXtn06QRn0eTR4KT1s/8cN49ibdxeRN6NteKWeZunm37Xt3hsexM16dr0tEm2mYE3QUEX+7H1ASc+motFBi+vebbG8qrPHEGA7+dNyF+aRu8KCCRZiJn45pdV0I4t/CC2Sw3uJRonIT2Zl8DrraCHw5PG4xOA6FJ/Iv/hLE5zYjSURs+q4WEfE/zGQ46TBFB69sJgoFvgc9KmckHZ7Im6Ek7BrXnH7u37Jz6TNQLwJuIAhDGJGAIt87tOJpVzmoe8U39km93iemEWfFFmaOKrpQxfYeipwUdPzVfWoyVWLRkQEVZOkjaiLqp2XogNLRxC48ZwYf8v1G+u09NnKYXn4rzuJa0xCvidGa2eNJp2vW6Wdo1PrBiGU3jTIZN0Ex+w13iwOi4BQYdxTQEXdvajge40e3+V4vS5Zqjc6iv03/parxlTXaBIDTDhO7D5Yl0VKNzRTOQMe8WNQ31j7MQp/oseMwJnAEppZLc2u1bahp/EoY2rneAAVh8HEdKf84h7+VO9QOzCjfqHCra6Jin4O/LirQMWgiJkWWYzmVENo+ErJTqk5y+CQVnk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WrN2c7/YdBqgLfZ0b+XsrHqvp6uIko5SHX+SPFcTCRZCtN1c8Y2zkAtjHMXp?=
 =?us-ascii?Q?GL64suFJqwSUulMUBejDiODD0CAgQ8hTC8oKIFgrpg9DmorzJqpI6XpVwfT5?=
 =?us-ascii?Q?vxFdSIhQk701yayICyVookCnDySwkoHi5NWHMtC/fGQjCSbmPdci0ecgjXJa?=
 =?us-ascii?Q?cm+cymQmlYEZ3IqBCoaYXNzKEX6idLCziSwImRp1dxLbHmZtncdHsqBPW4FO?=
 =?us-ascii?Q?So9TvTRpkeOyTFl0hlwbNiiIOu2o89HkpHP485oG97UZGk5pMLTYr6mvVV23?=
 =?us-ascii?Q?RMe9gR2GZeAdRc/KDhturMcxnWFuK4SIehVc+a1ruzpBscyQoh01vqXmTJpJ?=
 =?us-ascii?Q?L/7k9ty51WWQMugHbuddeSb8ZzwfUziuAlIeL5cth2sw4Qi+dmqVHAFx8T7b?=
 =?us-ascii?Q?KAbLfem+m7EF0EpsAD/NdoPoT+eqRDVSx6AFHPV1qJdgGFX01wJtZ5Q5tga8?=
 =?us-ascii?Q?JXxfUUwsv1bPOaDAXKgjfOwRQZB8TGk/hC0mq8XxYm18DHQTAyNAc8Ni49MX?=
 =?us-ascii?Q?VI0hE0H8avIdhTc664/Va9mY9f8Pxd44gCIzC6LQ7kNrOOrSBT4luCmRJISF?=
 =?us-ascii?Q?KCeCQJuS85OeTj4ACTZpc3Ztl1z9ugQVg0k9OYVmv/xHJTotE+6rNHi5tFyU?=
 =?us-ascii?Q?e/qtDcLceUqkCKGr/ptyggWbZAwwjHTb+Stq2/QNRao2iTV1Lri5R31Ofnfu?=
 =?us-ascii?Q?59zFlhTRTi1ZZgQvqiQj00xN9DDOag/GsJza4mD8MfsA7ZWV4HnYwUlgol9J?=
 =?us-ascii?Q?ONko0dW2fxmJCgtggZ4ZtkezlZLYmNbHdhArDohzuu4oAgjmcfcVZIfwvusj?=
 =?us-ascii?Q?801dLPCrInBpxUy6TBJZSGI2EEVyjy3Tz+XyKcDQRfgksRZWpyLZfNIeK1rz?=
 =?us-ascii?Q?t/csga0gGRzANoA2xtq2aj0ncF9Nzh7XvN523m6HFrYg829vlkfRDoLl0Pgk?=
 =?us-ascii?Q?1CwleEVfgVSTnF8LxEo1daC073yFzQGg1xa4xD1rmm7JEmqhMP+nAzorLOMD?=
 =?us-ascii?Q?W6MpUXjoczFm6PwRCi/YvVl8rCHoUsQtwYGqoHE2ksJR9zlKuJU/+eNBuhsK?=
 =?us-ascii?Q?kWvU3EybQSnnlMBtYAPi56Zmz/yg5rtKy+pFpVi9vq2Mr+fasC3qnugjg7WF?=
 =?us-ascii?Q?mCOmD4+ZoDJ9qEpc8vIyrg4dnwrTWNtAiweVhu03lrWpZ5Oia2UoLIhlVDb+?=
 =?us-ascii?Q?i62HKr4sPboNRzyI2VVSd/GgDt6Wv8MQ9fVMwNqC9GupADtMn+eyhEW9eJli?=
 =?us-ascii?Q?yESz4s1TUSsptWlhzz9VTIE3Jkd281HR2hwBd92PiH+A9LgVuEF+6eoBQ4fJ?=
 =?us-ascii?Q?Vxh7LUOmh5Xf2uCiPcIzp1aQ0Gzm/0C1t3WZUNUs4eBK5aXjJAPMnGLOpJ91?=
 =?us-ascii?Q?NWfnGMnksZLhn4xqteMaFfS3O/N7TemdeM8FYhT3EC3sutXVXIWLyimeYOu+?=
 =?us-ascii?Q?8hCoTRRwcealGDHGkQgyw58zi1K5kJKSPSwTCjGaPx0uFoV5XT9HfhD260LF?=
 =?us-ascii?Q?0/FBMhx/zJ66oSa3P3QWPZWZCrTYUgvAtMG7ckThDRy9M1Pr0Q+ElWTyxIqK?=
 =?us-ascii?Q?Z+ZIksNKLEXXggJN0Wh6AsViSfnUwsrs8HuBH8TkS8Mm60hTgp8XLYDHolpb?=
 =?us-ascii?Q?4ujCTocWjen492k2Iq0ucf1a0CunySRaNjBirVZroKfHglNiswE55MSKwPE7?=
 =?us-ascii?Q?fD5Ex1ILs/sjjiREXOjaytHxaMbBcGYz0Hhb3wYtoyCHtTio+ZKZD+mIAkZF?=
 =?us-ascii?Q?ms3p6MdEit8IhXycvo5aLUSaiOYBL67BH9X6rWj1Ugpfj9st/h15?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ba1fc1-305e-4b79-6ab6-08df129582d9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:22:26.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhbmQT2PzFycLCQMj0Hs3WuombaHyPH7Bt6MWDETF5WDvVBtP25uq8Be9EBiBrsPnj1lCtT/PREwexbrLAoSGN++0v1vZf2fDWqXYegzBdwyTLiXDHrbFhMcj76+o1e8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9377

On Tue, Sep 01, 2026 at 02:06:19PM -0500, Frank Li wrote:
> On Tue, Sep 01, 2026 at 06:16:36AM +0000, G.N. Zhou (OSS) wrote:
> > Hi Frank,
> >
> > Thanks for your review.
> >
> >
> > NXP Confidential
> > > -----Original Message-----
> > > From: Frank Li (OSS) <frank.li@oss.nxp.com>
> > > Sent: Monday, August 31, 2026 11:37 PM
> > > To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Frank Li
> > > <frank.li@nxp.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Sascha
> > > Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Rob
> > > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > Dooley <conor+dt@kernel.org>; Loic Poulain
> > > <loic.poulain@oss.qualcomm.com>; linux-media@vger.kernel.org;
> > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> > > kernel@vger.kernel.org; devicetree@vger.kernel.org
> > > Subject: Re: [PATCH v2 6/6] media: imx8-isi: Enable ISI RAW10/12/14 output
> > > LSB alignment
> > >
> > > On Mon, Aug 31, 2026 at 11:37:01AM +0800, Guoniu Zhou wrote:
> > > > V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
> > > > i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
> > > > works around this by using RAW16 format instead.
> > > >
> > > > The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
> > > > along with the input MSB alignment on platforms that support this
> > > > feature, so that RAW10/12/14 output formats can be used directly
> > > > without the RAW16 workaround.
> > > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > > ---
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39
> > > ++++++++++++++++++++-
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
> > > >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++----------
> > > -
> > > >  5 files changed, 63 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > index d492631dfb6d..0f776fc8fd7e 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > @@ -394,6 +394,7 @@ static const struct mxc_isi_plat_data
> > > mxc_imx952_data = {
> > > >     .format_mask            = GENMASK(30, 24),
> > > >     .buf_active_reverse     = true,
> > > >     .has_36bit_dma          = true,
> > > > +   .raw_out_lsb            = true,
> > >
> > > Sorry, I may miss this change before, if it is difference with imx95, needn't
> > > fallback to imx95. You just mention what's difference at binding doc.
> >
> > I think the fallback to imx95 can still be retained for imx952. Although there is
> > a raw_out_lsb difference, RAW10/12/14 will still work through the RAW16 path
> > when this feature is not enabled, so the behavior remains compatible with imx95.
> >
> > Therefore, I believe the fallback is still valid, while the raw_out_lsb difference can
> > be documented in the binding description.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Okay, make sense
>
> Frank
> >
> > Best Regards
> > G.N Zhou
> >
> > >
> > > Frank
> > >
> > > >  };
> > > >
> > > >  /*
> > > > ----------------------------------------------------------------------
> > > > ------- diff --git
> > > > a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > index 73f6ea7b0ea1..c352bcf8dc47 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > @@ -166,6 +166,7 @@ struct mxc_isi_plat_data {
> > > >     u32 format_mask;
> > > >     bool buf_active_reverse;
> > > >     bool has_36bit_dma;
> > > > +   bool raw_out_lsb;
> > > >  };
> > > >
> > > >  struct mxc_isi_dma_buffer {
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > index 2405f7d33d0a..4838b445f279 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > > > @@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct
> > > mxc_isi_pipe *pipe,
> > > >                                     unsigned int vc,
> > > >                                     bool bypass)
> > > >  {
> > > > +   const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > > >     u32 val;
> > > >
> > > >     mutex_lock(&pipe->lock);
> > > > @@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct
> > > mxc_isi_pipe *pipe,
> > > >                     val |= CHNL_CTRL_VC_ID_1(vc >> 2);
> > > >     }
> > > >
> > > > +   if (pdata->raw_out_lsb) {
> > > > +           /*
> > > > +            * Enable RAW10/12/14 output LSB alignment to match the
> > > > +            * V4L2 requirement that RAW formats are LSB-aligned.
> > > > +            */
> > > > +           val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> > > > +
> > > > +           /*
> > > > +            * Align the data selection from pixel link to MSB to
> > > > +            * avoid data shift since the data from PL is MSB.
> > > > +            */
> > > > +           val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> > > > +   }
> > > > +
> > > >     mxc_isi_write(pipe, CHNL_CTRL, val);
> > > >
> > > >     mutex_unlock(&pipe->lock);
> > > > @@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct
> > > mxc_isi_pipe *pipe,
> > > >                   CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
> > > >  }
> > > >
> > > > +static bool isi_out_raw(u32 format)
> > > > +{
> > > > +   return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
> > > > +          format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
> > > > +          format == CHNL_IMG_CTRL_FORMAT_RAW14; }
> > > > +
> > > >  void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
> > > >                                    const struct mxc_isi_format_info *info,
> > > >                                    struct v4l2_pix_format_mplane *format)  {
> > > >     const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
> > > > +   u32 fmt;
> > > >     u32 val;
> > > >
> > > >     /* set outbuf format */
> > > > @@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct
> > > > mxc_isi_pipe *pipe,
> > > >
> > > >     val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
> > > >     val &= ~pdata->format_mask;
> > > > -   val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
> > > > +
> > > > +   /*
> > > > +    * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
> > > > +    * by 6, 4 and 2 bits when using
> > > CHNL_IMG_CTRL_FORMAT_RAW10/12/14
> > > > +    * respectively, to align the bits to the left and pad with zeros in
> > > > +    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > > +    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left
> > > shift.
> > > > +    * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
> > > > +    * the above workaround.
> > > > +    */
> > > > +   fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
> > > > +         CHNL_IMG_CTRL_FORMAT_RAW16 :
> > > > +         info->isi_out_format;
> > > > +
> > > > +   val |= CHNL_IMG_CTRL_FORMAT(fmt);
> > > >     mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
> > > >
> > > >     /* line pitch */
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > index 35dec3a650ac..c9c22a3668f9 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > > @@ -20,6 +20,8 @@
> > > >  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN                               0
> > > >  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN                                1
> > > >  #define CHNL_CTRL_SW_RST                                   BIT(24)
> > > > +#define CHNL_CTRL_RAW_OUT_LSB_ALIGN
> > >       BIT(23) /* i.MX952 only */
> > > > +#define CHNL_CTRL_RAW_IN_MSB_ALIGN
> > >       BIT(22) /* i.MX{91,93,95,952} only */
> > > >  /*
> > > >   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> > > >   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
> > > @@
> > > > -88,6 +90,7 @@
> > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P                  0x3a
> > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12                   0x3d
> > > >  #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12                   0x3e
> > > > +#define CHNL_IMG_CTRL_FORMAT_RAW14                         0x41
> > >       /* i.MX{8ULP,91,93,95,952} only */
> > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)                             ((n) <<
> > > 16)
> > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK
> > >       GENMASK(23, 16)
> > > >  #define CHNL_IMG_CTRL_GBL_ALPHA_EN
> > >       BIT(15)
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > index f45c2aae59ce..9a6a8302774c 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > > > @@ -221,11 +221,11 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >     /*
> > > >      * RAW formats
> > > >      *
> > > > -    * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
> > > > -    * when using CHNL_IMG_CTRL_FORMAT_RAW10 or
> > > MXC_ISI_OUT_FMT_RAW12
> > > > -    * respectively, to align the bits to the left and pad with zeros in
> > > > -    * the LSBs. The corresponding V4L2 formats are however right-aligned,
> > > > -    * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left
> > > shift.
> > > > +    * The format entries use the native RAW10/12/14 ISI format codes.
> > > > +    * On platforms without hardware LSB alignment, the driver
> > > > +    * substitutes RAW16 at runtime in
> > > > +    * mxc_isi_channel_set_output_format() to avoid the left shift
> > > > +    * that the ISI applies to RAW10/12/14 output.
> > > >      */
> > > >     {
> > > >             .mbus_code      = MEDIA_BUS_FMT_Y8_1X8,
> > > > @@ -240,7 +240,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
> > > >             .fourcc         = V4L2_PIX_FMT_Y10,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -249,7 +249,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_Y12_1X12,
> > > >             .fourcc         = V4L2_PIX_FMT_Y12,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -258,7 +258,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_Y14_1X14,
> > > >             .fourcc         = V4L2_PIX_FMT_Y14,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -312,7 +312,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
> > > >             .fourcc         = V4L2_PIX_FMT_SBGGR10,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -321,7 +321,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG10_1X10,
> > > >             .fourcc         = V4L2_PIX_FMT_SGBRG10,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -330,7 +330,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > >             .fourcc         = V4L2_PIX_FMT_SGRBG10,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -339,7 +339,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
> > > >             .fourcc         = V4L2_PIX_FMT_SRGGB10,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW10,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -348,7 +348,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR12_1X12,
> > > >             .fourcc         = V4L2_PIX_FMT_SBGGR12,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -357,7 +357,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG12_1X12,
> > > >             .fourcc         = V4L2_PIX_FMT_SGBRG12,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -366,7 +366,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG12_1X12,
> > > >             .fourcc         = V4L2_PIX_FMT_SGRBG12,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -375,7 +375,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB12_1X12,
> > > >             .fourcc         = V4L2_PIX_FMT_SRGGB12,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW12,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -384,7 +384,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SBGGR14_1X14,
> > > >             .fourcc         = V4L2_PIX_FMT_SBGGR14,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -393,7 +393,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGBRG14_1X14,
> > > >             .fourcc         = V4L2_PIX_FMT_SGBRG14,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -402,7 +402,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SGRBG14_1X14,
> > > >             .fourcc         = V4L2_PIX_FMT_SGRBG14,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > > @@ -411,7 +411,7 @@ static const struct mxc_isi_format_info
> > > mxc_isi_formats[] = {
> > > >             .mbus_code      = MEDIA_BUS_FMT_SRGGB14_1X14,
> > > >             .fourcc         = V4L2_PIX_FMT_SRGGB14,
> > > >             .type           = MXC_ISI_VIDEO_CAP,
> > > > -           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW16,
> > > > +           .isi_out_format = CHNL_IMG_CTRL_FORMAT_RAW14,
> > > >             .mem_planes     = 1,
> > > >             .color_planes   = 1,
> > > >             .depth          = { 16 },
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
