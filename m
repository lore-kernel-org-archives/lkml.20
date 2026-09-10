Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3634BE457;
	Thu, 10 Sep 2026 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057000; cv=fail; b=dB8zU46+VEMeiFsTuyxUVAYtwpBHXgFRIo2xJb9B6UWJMmBBK5Uymk14gXcJqGsvJO4LeLEurQOrhoyWs37JwIWZ8EWlmQGLiKEosDVgt+L8/vYP/IYw8T4UWRQgB5r7qwy+EhQcLxKkiYZBKPyaX1kYIqY5aGuWGmJm5SttBbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057000; c=relaxed/simple;
	bh=SQAdWzYS5OVb9CY/KCfdYr8ky77O4mtQIdOHeQCWSdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PeEQbbE7uJtq0KX7VgrQHVxT7EwkvhfPa6r6CB1oogHi6l5ZAJDoqLf3h/IELl35eDceHTCEPyKVWoSRP+uDDMJtUVcVUI2XMmgDBte/Qk+GJHyB6tObgzppW95PV48l9ERg6qYEdhPwmCf1fOKaxIvQg/yZDBn0guZzLrDcDdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HTVvvHKo; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HTVvvHKo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPKM9u8efmayRk7M/2ONBqRAuftPgai61JiripcVmYIxD5hqDJOaM+hebbTJYeutGp0+FMN8tRTYwHHXvBHZJVWi+Q2B4HNMAS9BeQW8RCYsOjYoGrmGcHrWNRrpKS2mqtH5dKIA4KfClJ6JxM167L3hKrn62xVKNbgWw/KWP6CqY+BMW+nAESPOHKmfOYyC48HSgWi8e5RSLoPH/2ZB4RT87AyduZKR6j0plmO79DHIl72Q5luv90UL7ol8u+0ATjDaVvdug+RjpFlvzx5vvQXMDbHT3sVI2+GYVwYQ3c4bdztdIjGf0ZVmomHn5jhhranvPO0go9sOUmrHMNIvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQAdWzYS5OVb9CY/KCfdYr8ky77O4mtQIdOHeQCWSdw=;
 b=YV3uvErBandP+VVazjD7MuIq8z/BUdnct06bWlDsbGs+yQErtv4pJJ3DTCTBhvuy64/INqxeo0f08xvUHLnz8UgxKG2YD4Wi2q4nu4swiFtLgZHGt1vkv+RcfOYc09+XJqTu1A0sym9tRKdVG/vC7AS1SgvNkyaufNQuQR0Yd+tdR7YnbnD7aWN6K9ndVt/iD7gL/wJWaGdoLIhnvfx92pEln/YYyo1YsYdkOCholdnD927Grf7IBX3L/O0xpGeqhNp4ayzFRozouPn+rDHucrFMZJtRGVw87Ie2ZeX5Hzj0fD+x+ivWLops1tKzcaxgt7n5CdyJaLDT9hzkQiIRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQAdWzYS5OVb9CY/KCfdYr8ky77O4mtQIdOHeQCWSdw=;
 b=HTVvvHKoO7oe9SP98m1etnpyGwmlXrVQsWVTUn2nSB6ssbmM3uo1RKxDau+cL4Pt8ql66yD0F5q94wxvuI18dDMz/2YPMlzXFa0Dnss9zQZyadjesFkNFU+x3qzCOLnnfzQUKi4ciSl1s1VT7TlRWmk1wLgblLAPrBIYTNJLpKpKxg7Qpi98Gf4XO8Vzsa2AlgQ9/uWRR86prBE0uEwoJ+gozR832uHa6/REX+TZnizPKz+VZRNXw+DcrIQ4417g9Yjugl8pxw7sGgH9zJctJR5NSIfOfEdiJc0MHvJuHTQ9aHnXWZT/SktGVllcpzSvtRaZ5wWFHt3/0iB/pmH/pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB451729.eurprd04.prod.outlook.com (2603:10a6:20b:798::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:16:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:16:34 +0000
Date: Thu, 10 Sep 2026 12:16:24 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Message-ID: <aqLX2DhQFnY3FAFz@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
 <aqHES02SJkIGZWDc@lizhi-Precision-Tower-5810>
 <SL2P216MB24417ACC2BD099E4A5EE1399FBBF2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SL2P216MB24417ACC2BD099E4A5EE1399FBBF2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
X-ClientProxiedBy: CY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:930::27)
 To GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB451729:EE_
X-MS-Office365-Filtering-Correlation-Id: 08718576-b375-40fd-2b59-08df0f56e225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|6133799003|10067099003|5023799004|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3yrbk1g8Ac/lKM3d3aN8n2IpsgLuRLgVCD9mJo22eP/II471uhguawDteLFnsilx73sfHrVPSIa8a9HwyNQZGHWWIt/GIxoHa4ycI05WQ+dqUUKyjTzNLQSVHPNWpMcKjvKK9QzqewlGI4K2Bbfl1UYU62ZgRu0DftSSwf6gxuMf4Gydm1M4vhjNmUGPljvtUxrXQFR/5dIUs5Rr4ae4CAvT8Z8N3/wxo1g4Dcz6UiW9nj4J0xCSnW6zmz3OP9Pv3JyeVslHw0y0k6ZoaxIea7cE8sLIrlq+14IYyj/PbvnlYviqj5BZk6E9nLIjTPbH4OSx6izVbT5Kdmufb3wvBIEUUbgosDrzCveE7cfl+KNeD+Xrz/0fmdRAzGRd1wfvcVYoFNfbhl6Xyr+d3jNwfZMocmeNjmp0xW0GJh0T2p8T90Rs8YjESexOlNJPxDFM3wlkgEeNz2+R4TQvLFKc0LPdesPKbAqj0ci6jeEV7I1ZMCncF7T3BeX588dzvN4wAXwisU9HAbOuoCX81N2wmLrBysLNfRd7xJ0Ts3NOQSYdJ/kZK5odIXtACojpl+fWPMYDzk2V6c475qPPaSYFSvzdqWqflrM4tx9YG6I54I9oTSCtVmEHJnUmBA0zDYOsILeZjqUn13t/Vh7JonYlD4XF3VmNFzpsOJsmAD1Y8bo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4aSeeU5NSjpp7XVEflA/LhSKN+9f39Gmx7hpKZULBGh61weASZLEkslBhRNF?=
 =?us-ascii?Q?exXWBz7SoAtbxpuSIjxDQP/Jbv6Z9kyOlSHoE3HCAK9PDcu9fFaQkOqqIzm5?=
 =?us-ascii?Q?i1t68XZo6on2HkL8e7qCSaKsjpO9aCIsn2s1bjaMLEIm0XWFp1PZ/X0N14QU?=
 =?us-ascii?Q?jSFId3X8VaJ8BFrgJgedBSzorYVJa6RnQVbOSju8HKf3+Jxb20ty24DfLS4q?=
 =?us-ascii?Q?kV2gwbbgpHN01fKQKVvOi0Wo5JdLEqbkwn5rU2tmPaaZh8tB2RH47IfxEwKJ?=
 =?us-ascii?Q?1rjNUcyLOH0QKH7zFGWkKA+f2ofAMuXkOBxZGkg6O9abIGjFMDkZGkdlzXgb?=
 =?us-ascii?Q?QQmir+5X+jZ+S7uz7ozRQOW3YyrgUuG/hhYxia+ELo8MiUMh2fOKP6IukWII?=
 =?us-ascii?Q?pWSh9hAZd8OBCCOB0k6LPLjmiLFQgWpTgyk+mO+BF5fzrPuiJe9Ui96qSge6?=
 =?us-ascii?Q?lXvQt4KuPzgmH8Dye80hhSCtBeQt4wdgLlClq/GpbUElkx/TCHXMXcbDRuqY?=
 =?us-ascii?Q?BMvluW9tyhT7LKK219aVKb1RoRq9hAE7bqyKVQXJ1ntSIpYVZvOPAbG6wSPU?=
 =?us-ascii?Q?C3aJH2qLZEgGslIWRV3PJIbMvsw30Fd5WWiC73rKjTz52Tm5ggoF61O+IFv8?=
 =?us-ascii?Q?llMRKxPecBWGn+r0Ed5pt33H+zoX4Lapn1pI+xMrfowUx5PUGsU9k/BS3cEk?=
 =?us-ascii?Q?owaJF4YR/H5uWnXsAUTHo8ytnLRd1s788vKVcSTDmEWkzh5/7UbnkPss9QRV?=
 =?us-ascii?Q?A6TaDo1hRpZMhxYNC7Lt4+TrdgZ7tdjSi+DnIpz0zIJ99XPqbVz1PbqaLRaU?=
 =?us-ascii?Q?C6F0BH+E6r9a2+P9404tP5LyNoQT75/2X/oVKOgm4XCsU2UvMQ+17xYGgppz?=
 =?us-ascii?Q?zWqk/ofIArXXXulEeXkAwLeldYXQBnBsa6Tc3PoSLowMCYSGu80jM9tA5w0p?=
 =?us-ascii?Q?YV2x0JDyhjOQ0qQZAed8kTAjNeYrf4QhuJj94/5VRedOLBQhU/CD+sS/C11g?=
 =?us-ascii?Q?vrY6MZS1/hx+HktXNlj0NjN1E4+xl72VE8tQ+YwWV6onF1EiYiYGbtzPszax?=
 =?us-ascii?Q?vYgPIrmFwGu8frumHhxt/aMgaEdnYUq5t4AVoiZdnVEd+3IKHNKa++9kVPc4?=
 =?us-ascii?Q?X2k0QOgErqStG7+gnG9us/MHLHiky0TlCa7KZb6VohrrU4gKMMnBCaqlF0+d?=
 =?us-ascii?Q?QgRBgrQ6BlLDETJLPBMa7Og/3g7zG7ihYK6FiQoqoH6OaeJu91x82HfKGQp1?=
 =?us-ascii?Q?G1JVuOEAfH2qXDWbF7EO518M7B/DqHl2QOQqpAExlLNpcUJn26sux42tgCgL?=
 =?us-ascii?Q?rOR4Cp88Nbcs5StO9RAWC0v/q7L+nX0nZM+qkHBdOtkmOCNdhSn9IZiT+IPH?=
 =?us-ascii?Q?0oybtf2zRoSoOaYXhb4RnEA1Ckam8kjNRgUF9W4udf9MQUAO9DssK1ppsI8j?=
 =?us-ascii?Q?insoglAuQi7jWT5uTCdfyQJS4TFqO4hJIIqLw1YY3pN71PCELQkshKA9Z57M?=
 =?us-ascii?Q?cEVqA27xzeoGRR40JZSgqoDGIUgNpb0QN5a4ajTbAcDH1f7zwiQAhtP3UdYK?=
 =?us-ascii?Q?quHoQ4XWa9jbWM0onOi/5xH816KuuMtrywpofGGsJxUS3ajCan8LzvBSieAN?=
 =?us-ascii?Q?F6sMwLtjyfof/GeszfZmxUw1oarOM6viDbKe8A8iQPOYoKy/c0fbg4Mlo9eB?=
 =?us-ascii?Q?I99HCE+FQZv/+8krHsDqYGzF0+SMTo+315aLZkbjq0ea2JWZ1HuvKn96Xckz?=
 =?us-ascii?Q?Uka+jtDJazW/Kj0Gl0R26k1U5BnENNPqSNx0iK10o951EUpmbYc3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08718576-b375-40fd-2b59-08df0f56e225
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:16:34.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnI2hjQDu3NeafvrR06y2w3EkV/0VKsCQt7YCJ8SGANMGvGeg73Oeqq0qKkyGSU2L5tXEaf+10gQnb5f5SgJ7ATdF6vYvJdg7XmFQRohD6ygZMqHtg9zMaHRb5Ba5AIj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB451729

On Thu, Sep 10, 2026 at 04:38:27AM +0000, Nas Chung wrote:
> Hi, Frank.
>
> >-----Original Message-----
> >From: Frank Li <Frank.li@oss.nxp.com>
> >Sent: Thursday, September 10, 2026 5:41 AM
> >To: Nas Chung <nas.chung@chipsnmedia.com>
> >Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
> >krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.com;
> >linux-arm-kernel@lists.infradead.org; jackson.lee
> ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
> >marek.vasut@mailbox.org; Ming Qian <ming.qian@oss.nxp.com>
> >Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
> >capabilities
> >
> >On Fri, Sep 04, 2026 at 03:46:32PM +0900, Nas Chung wrote:
> >
> >media: chips-media: wave6: Add trace and debugfs
>
> I'll address this in v8.
>
> >
> >> Add debugfs entries and trace events to provide detailed
> >> debugging information.
> >
> >Nit: need extra space line here.
>
> OK.
>
> >
> >> These enhancements help diagnose issues and improve debugging
> >
> >Remove "These enhancements".
>
> I'll remove it.
>
> ...
>
> >
> >> +
> >> +#ifndef __WAVE6_VPU_DBG_H__
> >> +#define __WAVE6_VPU_DBG_H__
> >> +
> >> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
> >> +void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
> >
> >You add this patch 6. but call this funcation at patch 4.
> >
> >You need make sure each patch can build without break bisect.
>
> You are right that patch 4 calls what patch 6 declares.
>
> But the build does not break: wave6/Kconfig and wave6/Makefile are added in
> patch 8, so nothing under wave6/ is compiled in patches 3-7. I built every
> commit individually.

Still not good yet, you can add call wave6_vpu_create_dbgfs_file() at
patch 6, instead of patch4.

You need make sure your code is built and passed at every patch. You
can add library/makefile firstly, then enable it gradulately. But need make
sure pass build test, some kernel CI tools build each patch and easy to
locate the problem, if build failure at last patch, which cause some
difficult to locate the real patch, which cause problem.

Frank

>
> Thanks.
> Nas.
>
> >
> >Frank
> >
> >> +
> >> +#endif /* __WAVE6_VPU_DBG_H__ */
> >> --
> >> 2.31.1
> >>
