Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7951121F;
	Wed, 30 Sep 2026 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784703; cv=fail; b=FwJI2nol1D+wvfAnbaBrezltE//W8SgZUZagu/j8wvylg4a6D/XSoZvX2//QOFx/I0dJ1gdslJg169WY/ReOxtNdGXfu5wWIf/APFF6zHx7ud2JbJECxdcb3r6ubclJH0v97sAg7cEBKwcWB4mBcD1NZ47nR8YtTtcNhl/Pfj+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784703; c=relaxed/simple;
	bh=6Cjrv8WwfC3yMqjCHS4ssJdH5AouzlnvfHXs31fT4hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zcw11fmanPBFHKFNSZJjjF87kzvBc+51tPkR9L6B9jspCoGBvbkGzWYWAwl8upiQiWrqibgbUorZofh5qiZmA5WTykddnSOn9W7DhlWf4ensgzJZ2aioOU/QswVO6nsYUTpMEpzi9ZyVBQAWDnaDsVQAbwnrAKhTxDZ6Tl4rmd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IoL3rF2R; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IoL3rF2R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+Vld6ohc46Yr2BJ/+/p+9Vtm94KUu0A7Nlgfl/SS3sxAJS9sCdUqPCX0bjpzX9tQ998K8AYg8Uns1gc3pe+7SFIDwiBWhlIZwHA9UrPKk+N3oLNEQuVn2qdMJujW7kOB+eygyhD8jcvRHfqRJcacxw6AL1+MxKBBc87VE8XGJzmymtPRLtnGr2245+RpBBdecGnsFFnVL/QkiSWpvh5YVMbgV020sLC6WXjgKEurFLNEhXHESs/z/+uzUOlmNfVmtqEt/TZTkTBTcquPs9DrZbox7wKdBH3H6H8bjFX3hVGHz64MqglQFNJR+5/LAwUnHPLTvNfh11Hfsqcfn2jJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz8aPo+cZNYQ4rakJShAKnFh2GeGBD/synXyNHgppPg=;
 b=LIb6aguNsDPkEgYpCUHJvsMai91zqkPbSYQA40NNLwi16WzX5DMG1GLfdNd9Y4N0rKtsEZJ6YKiOM5wYJ3qn5jTYSfWORfXfKjXr0eQFj6zlTAG1RrPQiNzWKO0LHeA2Qc4TPZ8Dmv9RmJ322Z7bsPSUqUYYmMIPubraHo48OAEduY1YSx3Gk7NVF9fBIRqEW67XF+f3Gq8S87CT0B+2o7geYv9JdZD8JJSsU9KvPJlaVctvgPqh21VKUUylCwMNUHHOGQIB6nPC9TEqQO16zjTf3U/Rj+MlZYpZuLQjedM7p6SpOZcvcNEJCOTSGZzQXSZk6bpl3XzeEqaUJgstLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz8aPo+cZNYQ4rakJShAKnFh2GeGBD/synXyNHgppPg=;
 b=IoL3rF2RjEssl1KWOVc3tQMt8XBIweSAim5bfUu+IE0+63WvxwddE/e5emCNV9v+vGZFgKh03eyuB1B8G5I8FjKoTr8ZcnyRwwn3M1nHib55BeaEUXFYTfM0yqFA2Zlzca43E8fjETVDkOBYkq7oGkSRstPY2xUD6ufogoW3P/GmYlla/aHTEh5qs0DCA0GT0hPlh7BuD6ML40ir5nm07nj2wph/bk5x5zyPp02d5hIk34MvYNJHEHL9EauGqEB4ZxLyz27cxRdf2gp7AZpAeudFqEfcRNTEpG9hiyPi1Ce5JjMsShJjoEnxfadNOmq/trbMma1ZiCTW9efPUv671Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11650.eurprd04.prod.outlook.com (2603:10a6:20b:716::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:11:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:11:32 +0000
Date: Wed, 30 Sep 2026 11:11:21 -0500
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
Subject: Re: [PATCH v4 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Message-ID: <ar00qevdwDHYAEy9@SMW015318>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-7-e69f89c7c651@oss.nxp.com>
 <arvLxIDg9Z85BQL9@SMW015318>
 <AMBPR04MB33552339734BB7E14CCC940412FA8B2@AMBPR04MB335523.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AMBPR04MB33552339734BB7E14CCC940412FA8B2@AMBPR04MB335523.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd8da86-1827-4566-9083-08df1f0d7e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|7416014|23010399003|4143699003|11063799006|10067099003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UxA5ybqQZMUTCO+3rAuH0dOlDxB26xHF2ZroHAfvHsBQ88bXYyBMr8ie1x2j7G7Q3yqlxYTJP9mBjMWZmffcir7ZkbhrLgX8pMHyxKm8dhcEkz8V9wBOHbYk3Fl6y0I9WSQ/nptLkIsD096aC8RoeFcTZLyp514lj7Uysn+U0uycOIGdBr17d8ha5MGUmC20k/vSlCLPtRGviaH7Vjx0p0d9NRKu2oMhzPOrVAsiVvby19lS+0It9RybBhp8Mv8zBwedRp3Vm94Te7CV7zzJ+kz+BbKnM9Lb3Lg62XQsOvCXwJ9dBMpHfKPoLxa/yaUYsNKDz6exMA31lbFfZWPQdQfVCgSTb3qx8ylwicFkBwXfTRQGLuy1Bpfgfn4DXovggKATsVhDP2S/uIpD2+hAwKaO4OlMbdSeXf4vu4JkkVWbny/5CE9I6JBIIwiYsoaU/G87IyZIqBa6wdAgKU9kATpGSi0bU7VAYrzOEckxpkvtAwAo5DUshzdxGM1Pi8RuKHsJz7PE3OxCPtFDnXiB+zE3safoF18wC70mRl408tSnOWmawbzTAZKoKPupE2I1wxwHsNFouuuCUbxWMeGQ7mIpP3XZqTwDA4I+mJKAtfShD/KKtnMTXAZSvItgIpJ6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(7416014)(23010399003)(4143699003)(11063799006)(10067099003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cuiSfZ7u20A/Yk+taUtDgPp4d7IKNwFiW0JU5VBv4rBUNGPwe3KscyhGM0Ig?=
 =?us-ascii?Q?e/mxTA8GbITKcDztuWjE5tI8I63o+n5Eg1zMHVrK4yRI2l1y5gnQd+X9H8W2?=
 =?us-ascii?Q?X4YQ+wD+xVUl2Fw5Z/cjE9x7xvEVxDvRELvASv0iYwSeUDxXX3Vmeg4bnna9?=
 =?us-ascii?Q?Po6dSIcSv+pYs1EG755Zln5Ri8coXdD79Dda41iIu5BsevgZTiOjg529Qbml?=
 =?us-ascii?Q?+zAsuWwNCGJE+e4IiKymMc1dPevygjt0poWMmQU3ZLjmUqwszOwLGvtCDzoy?=
 =?us-ascii?Q?Sq6STZTNCXADAvCqWTnBmMU92BHSquTimwArAH0Ixw2zdEBdv9EbdnNoLJsp?=
 =?us-ascii?Q?KK0x2E6soN2tMLY1C0DtM0sXb54zf0GOnxxHZmDsd+UAVByjJVGlJl5ByBXn?=
 =?us-ascii?Q?WGhWkKapWcgbKzMU5TZ/7o+/yi6tJIlGSJtXIwt/MG7KmO3/oa8/ahs1i74q?=
 =?us-ascii?Q?zQzAFat5zkLhEF1NLveC4cc7CIqdxUUdfzn/HUPgNS/6+1a5tee8LkUDGpbC?=
 =?us-ascii?Q?oQIghA39oojUQTb0lsPvEQ5RfKJjq+MD4wR4eoq49dQTqsjt9NrmMAcHHoUL?=
 =?us-ascii?Q?Tuiq1B/4B27W8UkpJXBG7U8L9AYYY4j+bzhOF4ZSjzucyMUOioVOY6fbKKT4?=
 =?us-ascii?Q?ymUi9KzHrfp3xv6YcWN9UyhnxlxKoxMgtvR6FqQKq1l/Bfl7jlVh5+bEcCQK?=
 =?us-ascii?Q?0oMprvyguhzTVwJ4DGdmLcwvtUduRwpAjrydaY66jmS6rNkCQTY9Qr5apUcB?=
 =?us-ascii?Q?0fHnfyFUepECcJ8UqyQ6MurV8+gQQfxJsbI131M2X5QvbdGBMhiHxjiC8oND?=
 =?us-ascii?Q?QGmBLyfr08l9blqU/W7sCGTflB7gky56lkAPzoE2HwzzDbPDkRq+Jgn4reSW?=
 =?us-ascii?Q?3lBwZwLO+n4TACMb967lmpHDLx4Fh4tB/LnMaxIxJXIp17IcbeMUmUJzvqFe?=
 =?us-ascii?Q?YYaBmHOuhe9DsgYNjo0OpLfpVF2bNynfBjqCxfxAnBQBw4Z8PcmiINEAyQSa?=
 =?us-ascii?Q?0+hY5hvupsMMOoZeRo2n6nNpGXnPKtp6L/rT2sb7/CnTnV8FLSxMaSnIJouV?=
 =?us-ascii?Q?cl2ZFNBvpU/GdROFrPQRFjZ92pZfWMqURvh/T3h+wt9+Haroxtrp5DT0Rrci?=
 =?us-ascii?Q?O+shpvgcTPMw5WdA4i2TN9EwescSJjLDPWyr36kZClc5p1jkFiQnoFNakqH8?=
 =?us-ascii?Q?Oi+3G6r1lJwez8G5WMFVgozMUVApz3XljZ3i4EgCyFFvW5Z2lLeHczO3DEmd?=
 =?us-ascii?Q?UDCXTTJYRg5q9+O375366nQeaH3hp36r5W4kwDMu0/7/5ljVm6QSizJcBK/4?=
 =?us-ascii?Q?Moi2JQWpHGPfOOwoiIQyEwLImV0WwjP1KmMV0aocU3fxnl9AwCVbDLRkpPn2?=
 =?us-ascii?Q?09eB+cuILdBts4qvdzUXcXCtUycTJlDpYr87M/3OulpuNflcNRU5qWgIrSQy?=
 =?us-ascii?Q?iWuLGdw8ed4H/+9PEQiPjLxZiJZSUJUuNCse88f/96drSlfjZ8tlamqej6xD?=
 =?us-ascii?Q?/jeSJ7FG1q0isc9weEBHTEvDVXciTsu/mZjtDqBjfcW4TVN7LW0tcvulzN1A?=
 =?us-ascii?Q?G/tj0YVb5W+N73L7UB/YqSOiW4ARXcizljNkxK3oPhm/yiShdN8qKN5ST877?=
 =?us-ascii?Q?hHj4NeTE8EF50cHOtpa2Y3fY2WK/5C+1XvyQqXorF32AMra62xmVRCswxYxL?=
 =?us-ascii?Q?sTMIQEf6GVySO4/sMEF68jZyxGICkkAwUkx3v/kVZpE0yjTVdnq72SNTyxOa?=
 =?us-ascii?Q?ZnsgE07RIVPMZGzwBw4DX3y1GZDLNuk4whOIC9z0Mt+HLa5ZU1q3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd8da86-1827-4566-9083-08df1f0d7e46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:11:32.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImaELaktw+pCxn+u+YKmDThaDbagT0136TFzUxmqJUytbKHKBn1Aj9kRLg2pCuL9hYmDHm4eQ725/IVddZKJUYIhYYIrILZLkdlHkrJNC9HtIlYE3VWPXqD85AEsXIbR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

On Wed, Sep 30, 2026 at 02:39:29AM +0000, G.N. Zhou (OSS) wrote:
> Hi Frank,
>
> Thanks for your review.
>
>
> NXP Confidential

Please remove this tags before send

...
> > > + */
> > > +static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata) {
> > > +   return pdata->model == MXC_ISI_IMX95;
> >
> > Can you add bool in plat_data to avoid check model? In case future other chip
> > also use msb and complex check logic here.
>
> I used the model field here to be consistent with the approach suggested by Laurent
> during the v2 review.
>
> In v2, I used a Boolean(bool raw_out_lsb) in plat_data to determine whether the ISI RAW
> output should be LSB-aligned, and Laurent suggested using the model field instead. Based
> on that feedback, I followed the same approach here for the RAW input alignment.
>
> Please see the discussion here for more details:
> https://lore.kernel.org/all/20260915000520.GB2804748@killaraus.ideasonboard.com/

Laurent base on single SoC. But most likely it is not true in future.
Use model field is not extentable enough. Now can't prefer use mode at
most subsystem. I can reply original thread.

Frank

>
> Best Regards
> G.N Zhou
>
> >
> > Frank
> >
> > > +}
> > > +
> > >  static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
> > >                                     enum mxc_isi_input_id input,
> > >                                     unsigned int vc,
> > > @@ -357,6 +373,10 @@ static void mxc_isi_channel_set_control(struct
> > mxc_isi_pipe *pipe,
> > >                     val |= CHNL_CTRL_VC_ID_1(vc >> 2);
> > >     }
> > >
> > > +   /* Select MSB-aligned RAW data from the Pixel Link when needed. */
> > > +   if (isi_raw_in_msb(pipe->isi->pdata))
> > > +           val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
> > > +
> > >     mxc_isi_write(pipe, CHNL_CTRL, val);
> > >
> > >     mutex_unlock(&pipe->lock);
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > index 5f66b7c9cd1c..35438abf3172 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > > @@ -20,6 +20,7 @@
> > >  #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN                               0
> > >  #define CHNL_CTRL_CHAIN_BUF_2_CHAIN                                1
> > >  #define CHNL_CTRL_SW_RST                                   BIT(24)
> > > +#define CHNL_CTRL_RAW_IN_MSB_ALIGN
> >       BIT(22) /* i.MX{91,93,95} */
> > >  /*
> > >   * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
> > >   * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
> > >
> > > --
> > > 2.34.1
> > >
> > >
