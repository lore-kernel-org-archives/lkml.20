Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514343;
	b=Ioc48EJEtphJygWJ19yPvlt2E2a6+0+molsXcHNKbD8Mqguc4pYNdqjI6SOTdGbTKnMB
	 iZJwlzyDhhBJ4l/CggvuAlupr9ahJamsRQgfCO7WIRoe1PpH7dDBCBW4BJgVjqqowal5c
	 e7gc/R7wQb+meaqMe+bvBuJdCgMROpZNhOawwIkb4C0QvJYM8wlMnCgqVvb5S9C0KUyAl
	 dYehqr/Hw4wRfMJvnpoIuepGsGzCMvpVlAOusUkm4qVpAQ7NazvPSraTGmiLM88Bko8LS
	 Pv1Ch9c3JgK6OJXQLg0/W2t4aNzGOn5JHkoeX6X3Jllwjzxx9h4Fq5kq1szUruiDqHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514343;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mqqUkrsSo19Dsa5xn/C5cv0OWJ853bYCNHZfKHN06S0=;
	b=dZLBT99oKFe6vt4rilB9zemMdsQ7z0xZC/eon9fU45MU8c0/GpyFdk2tjdiTr2XM8aiq
	 WiQjjH+MdX03mVnOvV3AyjvOL8jkLQ1NAFd1XSVt6/YKsclOc8AcImSwuGjrCXjR/ZYsa
	 n0WIzTugfBuI5GT7ljmVSfagNBBYWY8wb8QbJ3No11qY43cUCma5yDNA0pnZPXPv+OL3f
	 u0vWCPnyrRqOURngdT7/2ow2Pqy7wdVO3+KKNEPtZVojDNi56z8RHqX7435aLmdfTFLJj
	 N1BDKIL3Zb491F6sGx/IgXtF8JzXOLW96kl1rUuUeuH7F0fGSec1bbuxCdwM1S1jf5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hd3WVcl2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.5
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F278760A2629;
	Tue, 20 Oct 2026 16:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F278760A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hd3WVcl2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMfK83psMxnXinI7T3OUNgy6RxxP5b488ajf8cs2Ki/uyqRmVm7RJRgcCWQYUfCdcBk3/gaE7Wet5VlqJHLaUPVBot0ecA/aRw5WlvSyU/k5oGrglN+7m5oYwL6ckZdCgWeJKCGdSfOYvjQEj7oxxKmXOD5am4FRSTAMtbLe90vk1DC9JovRh/JUlXNQDV7rC74pMc7Uk/wPGqftrKXScplzXXIAuUEPoJkDOpwgOa3vPmN17HPJq/qqCYYagaxZ4nSQqh8ROFG0LhxVXaNeIDhcCJffeGIwgXACBF6jLrFc1JpJjp8MCDQdlIFzMQQcJmZJmIF15uGfw1x1JCI/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqqUkrsSo19Dsa5xn/C5cv0OWJ853bYCNHZfKHN06S0=;
 b=bSbp2zrPaSHzMmW2OxGQf5TWUJYeDWAjd8kAIWjmya377U+AEDsydTMq04raZLJMp/HhhfMXMYyTXczIyBXzcx+ldosQWs6nlpc37l2I9Yi2E3lA2Quk2cFy5cQ2xrsDI4aKU+SHrpOtqrXTMBpvAVe8j3gCerGYlc5ujZ8J0mgjZJTa7WTqGVZDA8+J1Ujc00WtP7Lx65i779kedU4HJnQ+WITS+3iYwXVwY/u3LwELJ0CamlN/ffcoirCOVsqeKMlY73jFWNIIWPRH6yfNj1A/Zjx49qNDSdHGpIZTEiRZI/iN5kCxLl3OJkivljNptg9vo5zdi1pO7Rb9CxyZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqqUkrsSo19Dsa5xn/C5cv0OWJ853bYCNHZfKHN06S0=;
 b=hd3WVcl22MzZMJl0gEDTvmkqKkFljhh4akpSenIm8z/5fptDzXpFagKUWZUlwJqgN9B4OpYvIe+JtkVxS9/yel9mKNaKP2l+RtSrKW7vgAiYsP/8yO0k9Wv068+WEgLX2/XsZK3ix7hKoH6g1RWZE+P9sTGWUZdWhrQ2dI/ZJ8EQ3SwY6EIb7VvIpAhp3i0LkzP9aATOz+eYFxJfqfWWDowIDE8ZEdkJ9XIDn1FFi7zpO3j4iXLTpi78rVPwsJHSsAaGIuEvzHUufJ6FyxNiWfBBEaFAFvgQiq9fEIXpcB9e25JoAbxPn/bWh0OfzHV53K71MwleF057hTf2nZp5vQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU0PR04MB9273.eurprd04.prod.outlook.com (2603:10a6:10:354::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 16:38:59 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:38:59 +0000
Date: Tue, 20 Oct 2026 12:38:51 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Leonardo Costa <leoreis.costa@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com, marex@nabladev.com,
	stefano.r@variscite.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <ateZGwrFGfD1j-i3@lizhi-Precision-Tower-5810>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
 <20261002081824.GA7222@francesco-nb>
 <ar_bsQbD-IbvUf86@SMW015318>
 <20261005075319.GA7692@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005075319.GA7692@francesco-nb>
X-ClientProxiedBy: DS1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU0PR04MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 28150ce6-9876-468f-5391-08df2ec8a428
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|1800799024|376014|366016|11063799006|5023799004|4143699003|56012099006|10067099003|261009223027099003|22082099003|18002099003|3023799007|8126099003;
X-Microsoft-Antispam-Message-Info:
	FqcfQM6ntAahdoaBJAqEyakw3UnX/sq1Qy0qidekK2rxhWrJL+hpOBHkZF2FTsmHLiPF6xW0TGDzLUnTlIqLUjhCUCwf15x1SruoGZNE7zP/ZVFXZhfv5tOotiQTpyBms90DaAi0WFX7u9A8Lb+B+IAWUqeDbGhp1YMQu/0gZ9xegSuknf9F11GEVBGdrQsmJb+l2cJVhHA4X4RYbBlfAVDBq0H977OGASdLoPM9FFfoZWi9pTvT+HG/HqeDIcT9/lP9f2F/XeigCf0vUwnsN7zmmdnHNa2/2c3GrD6FDnx3UuY+30P0p4JJ0pvjIMnK8N6H4LD99ZDkogh9Fdtjd9d5yEbkBaIEde+A6mNwMw7H3ak1h6u3WxtdjupXO7dknLxGyHmNweSdbsvpQGCTtgX6PdABQxq+A1jrfeJHDgzK5s0keOou5PJPS/CiFuGfo2onIAuboNr4GHueSjKH0s4H+wcjFVlJFY5r0rSRHSCeKxjJLUbrli5bK13C4EHl3sDSznnvU5toWlInrPIJq8TsnSfMG/GHfsIQlyBHc8nyN4C3+PRot791G/SYSZ4N2BwHSZdf1b5bbkutzTy7LYw/olwNnVYhxVgTNMhvH14TwMBNIc0FZ4KfExycKHxI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(1800799024)(376014)(366016)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(3023799007)(8126099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pD8/clzvpMjJsu/niAPwuaH55agSZDf2080uLT0muCX6HFYMjnZP3MUHsnba?=
 =?us-ascii?Q?1P7qzzRTMpFkcV1Rpn3ZRr2mGarc/UN/xxL+lbxnxkjOvas7gU88296/mGbR?=
 =?us-ascii?Q?I8ieF9XENQZ87no85Ao3JsmT62XP6zaZODYzZfoTONth5sUeqXYYwp3dmlbh?=
 =?us-ascii?Q?SPx0xe0aWZCWqJ3BfAbfzxZmbbdEFMbB167hIzLPIuC7NVUegdxbcuPwtYD7?=
 =?us-ascii?Q?63ICTBk4QjbTkgcgj2Or5qafCPU90sIFGGVvJikJwbRmBp/xYuaYwSBLw6Nr?=
 =?us-ascii?Q?NHvt81Zq6xu10oXZB49C+ueEYUqURzZZ/AXShHTNlOeKsKZ/HamzUsewbET9?=
 =?us-ascii?Q?ouEFQLhTkwfXFO6xSPzzZKT1b5ZYbh1/yMqR71jb7EZbFK1yaiZcRllGC74b?=
 =?us-ascii?Q?1yBwTQO0qHQtjNl+FVb3BCq0bnpUkVbzAbmizueP3O8DNRuYaUc/x63WLfXR?=
 =?us-ascii?Q?oYdDfif3Q8cmM94IfGA6XNvNj6/QtXTI04Kf1vDAeiO0ESqRFOpY1mm1u6hE?=
 =?us-ascii?Q?0sJ6o1ds3Z02r+MkhpTk06bpk+yXshqX18B0oZOvfnshuB6yqgPBBI23AGMZ?=
 =?us-ascii?Q?Nn4EEt3UCnRvwprkWA6C55NexUBOqNAfvSqcJVh5420S5n1eDDZrS+WLVdAV?=
 =?us-ascii?Q?TX61ramsAd87jYQCd+PMfvvmxHN6ukFjTgusUeFMemsgsB2olSyS7Hn9jYrp?=
 =?us-ascii?Q?94jZn7JuG2An8ZP7elWGffqPiU+2zfEywX/5UgqBpkLpB9lENIZiP60Mvkq9?=
 =?us-ascii?Q?y70kzTGwzJ1jWhjxvrOqSeTN78A+kRMF3OkuMv0Z2Rd2J90ZLtRPgs/3Coe/?=
 =?us-ascii?Q?NhdzaQsWH6PzUgfQqekDxNT/DH+6gLPZorTe0UG+fdvxM8OuY1CKMKhjBAzm?=
 =?us-ascii?Q?7SbWQhhV+UXhjT3nNvZTz9GjU8v0pdG4H5enqF59sCb+vXLwCkoRUKSwmOf0?=
 =?us-ascii?Q?5jQl3et8MDtyrrCdZR541uZi3wygBY2/5ybizVzeP2KLkAQAabv2h3OzkHVH?=
 =?us-ascii?Q?20tDm73NSimC6t5e3L2KFigNSqV9kBP3qW3caQ1TeaxUPAxCVewf+g6jAoPF?=
 =?us-ascii?Q?YsEebhY7B/fH7Gx6DJ8UiD22xghSFGrtMw/d2n07irZJcTbYp4KuGHjENuhh?=
 =?us-ascii?Q?jFk35T/3/dANu113emGKe6nawQkM9W17ej9CFA3V+ff7YkhpItsyfP0MYHLQ?=
 =?us-ascii?Q?g+yA0i9bDvaumf7dSfKE+lQcV37LbUn6RP7mCZ2osUOmEMlA1P8d+4APG/hU?=
 =?us-ascii?Q?Bs2deUXhAN1Sht2PhJ+cLmeqZ0JVYNWF9JFyEoof2NPki8o0pc+Q7Y9QEWfp?=
 =?us-ascii?Q?Yzjgswdf7M/JNVMxPiY1bDwmPNNCZDMl3K6scFtxz68XC8jWpYiM4j5SepH+?=
 =?us-ascii?Q?pD0rsuH3M7QLpZMfVkOo0DmViITPothyyFz3yAKcMMbxKphH0WCnxsla0TRP?=
 =?us-ascii?Q?0TG37WI+eKrpz8z/CBPsTMnFIuiPhqVrbvASil+ZH+g9x5zkPvF7s6V9nNNV?=
 =?us-ascii?Q?WQMtdb+4v61rMWCS90AOXFRLgT/SWkfNsRCI7ZgyBKF9SBtsOpn4spXjX9Lx?=
 =?us-ascii?Q?kdMrfxtqcrcUn7h2JobNFr1G0dwaMEGnPxjPVBOD/pS40BEqOgv/N85Mvh8r?=
 =?us-ascii?Q?NtkES33J+XMJGn5iBV9kiJ5y/RzpsPGKTPKcv1jMB6VPp7qUCBlN/n74TVs8?=
 =?us-ascii?Q?CnhOszaA90dCk34mz/qHVe62n+BZTvsGo3I2Tr1gbMsd+A1Owg1R5odEts3X?=
 =?us-ascii?Q?0uFN/NFlbNKi9MYmpxB3I/28xXHTlliHCs/uGO44kWYOboXUqynl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28150ce6-9876-468f-5391-08df2ec8a428
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:38:59.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxI3O/GF+AtD3LESAl6Cwh7weGqqS9cFlTQfoTxMIcJSFBavwfzo5aRFCrPGwj/b+L0/YjXqYfMDta8d5NQrD8loRyyC4lYdMuNe7tqiUa9td3pC/bOo7EDp3QYsUDHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9273

On Mon, Oct 05, 2026 at 09:53:19AM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Fri, Oct 02, 2026 at 11:28:33AM -0500, Frank Li wrote:
> > On Fri, Oct 02, 2026 at 10:18:24AM +0200, Francesco Dolcini wrote:
> > > On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> > > > On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > > >
> > > > > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > > > > LVDS connected via the Apalis iMX6 LDB.
> > > > >
> > > > > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > > > > touch input is provided by an Atmel MaxTouch capacitive touch
> > > > > controller.
> > > > >
> > > > > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > > > > external component that does not exist at the SoM level.
> > > > >
> > > > > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > > > > Board V1.2 device tree to provide a ready-to-use DTB.
> > > > >
> > > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > > ---
> > > > >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> > > > >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> > > > >  3 files changed, 59 insertions(+), 13 deletions(-)
> > > > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > > >
> > > > similar 7" case, add panel module name in file
> > > >
> > > > imx6q-apalis-lvds-panel-lt170410.dtso
> > >
> > > This does not work, sorry, the current name is the correct one, for
> > > various reasons:
> > >
> > >  - the product is a display made with a specific connector, touch
> > >    controller and display and more. The actual panel is just part of it
> > >  - the current name wholly describe the product, it's a public product
> > >    with an official name, all of that is clearly linked in the commit
> > >    message and comments. there is no ambiguity.
> > >  - the same toradex accessories are not module specific, they are used
> > >    across multiple families/carrier board. It is a whole ecosystem that is
> > >    building on top of standardized interfaces and connectors. The same
> > >    overlay file is available for multiple boards and in multiple SoC
> > >    vendor directory (as of now TI and NXP, soon we are going to have
> > >    also QCOM). Having a consistent naming scheme is important, we cannot
> > >    call the same things differently every time.
> > >  - there was a situation in which we did a new product revision of a
> > >    display, specifically the "Toradex Capacitive Touch Display 10.1"
> > >    LVDS" there are two versions. The official product name is the same,
> > >    apart an additional version number, one is version1, the other is
> > >    version2. They have differences, and it's not just the panel, more
> > >    stuff changed, so having the panel name in the filename will not
> > >    help. v2 support is already in [1], for reference.
> > >  - the toradex naming scheme is not encoding the actual part number used
> > >    in the product name, for example we have apalis imx6 v1.2 that uses a
> > >    different touch/adc than previous apalis imx v1.1. The product has a
> > >    different schematics, different BoM and so on
> >
> > Do you have schematics number to identify it?
>
> Why do you ask specifically about schematics? We have schematics and we
> have a way to identify a product to the related schematic. The way we
> identify schematics, whatever is a number, a string, or anything else
> seems not relevant to me.
>
> But yes, answering you question, we do have schematics and a unique
> way to identify them, and it's not using "numbers".
>
> What matters here, is that Toradex products have a unique number,
> and we have a way to trace product revisions.
>
> So, for each product we have
>
> <product name> <pid>
>
> and <pid> is 8 digits, the first 4 digits is the end customer product
> definition, and it matches with the product name, and the last 4 digits
> is the product revision.
>
> All of that is documented, see https://developer.toradex.com/hardware/hardware-resources/general-product-information/ordering-information-and-product-identification-pid-pid4-and-pid8/,
> and this is what is used for any kind of product traceability.
>
> Staying on our LVDS 10inch panel example
>
> Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12121000 | (version 1)
> Capacitive Touch Display 10.1" LVDS | PID4: 1212 | PID8: 12122000 | (version 2)

include  12121000 in your file names.

>
>
> > > , and there is no
> > >    reference of the difference touch/adc in the name. You can see this
> > >    information from the public documentation just looking at the
> > >    version. or you can check yourself comparing the two DTS in the linux
> > >    kernel tree.
> > >
> > > [1]
> > >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
> > >  arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
> >
> > V2 is okay, but "panel-cap-touch-10inch-lvds" is too common. This may
> > cause naming pollution if we implement shared one panel dtso for all boards.
>
> This is the product name, what is missing is the vendor. Given the
> vendor (Toradex), the product is unique.

Generally, it is not unique. We met similar problem. LCD panel is EOL.
Need reply with new one. i.MX production life is longer than other external
componenets. You are still work on i.mx6, even i.mx28 still have some
customer use it.

>
> We could rename all of our accessories dtbo adding a "tdx" prefix (when
> they are Toradex products, of course).
>
> So for example we could have
>
> k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds.dtso
> k3-am625-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso

tdx is good. The problem is that "panel-cap-touch-10inch-lvds" is too
generally.

>
> This way your concern on name pollution is solved using the vendor
> ("tdx") as prefix in the accessory name.

pollution is just one problem. We need identify it quickly. if you create
imx7-xxx-panel-cap-touch-10inch-lvds.dtso, it is hard to know if it is
similar existing imx6's panel-cap-touch-10inch-lvds. even it may use for
other imx8 imx9's productions.

>
> It's going to be a pain to rename this stuff, and it's going to have an
> impact on users (that as I keep writing and insisting are the one that
> matter). On the other hand, when we have a toradex product ("verdin", or
> "apalis", ...), having a matching Toradex accessory to me is the default
> and this info is not needed.


>
> When adding non-toradex accessory to a toradex board we make explicit
> the vendor of the accessory, see
>
> arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
>
> where we have the "rpi" prefix.

Ideally, rpi-display-2-7in.dtso should reused for all boards, which use
rpi defined connectors. Now exsiting these combinations reason is current
nexus node is not good enough. but we face to this directions.

And anyway, rpi-display-2-7in is not good name because rpi many produce
difference 2-7in panels in future.

Frank
>
> So, my proposal would be to accept that for dtbo, combined with Toradex
> board, the default is to be a Toradex accessory, therefore there is no
> need of any additional string in the name. The second option, would be
> to add a redundant "tdx" prefix. It will create a rename mess and it
> will have an impact to the user, but it will not be wrong.
>
> Your proposal, onthe other hand, is not working, and not matching the
> reality of the product described by the dtbo.
>
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +&{/} {
> > > > > +	panel-lvds {
> > > > > +		compatible = "logictechno,lt170410-2whc";
> > > > > +		backlight = <&backlight>;
> > > > > +		power-supply = <&reg_3v3_sw>;
> > > >
> > > > use name reg_lvds_panel, it help improve reusablity.
> > >
> > > I disagree.
> > >
> > > The regulator should be the one that is physically used on
> > > the board. The DTS *must* describe the HW as accurately as possible, we
> > > are not supposed to invent non existing regulator and more in general
> > > non existing HW.
> >
> > It reflact hardware, it connect by a connectors HEAD. In Connect HEADER,
> > VCC for panel is fixed naming, like vcc_lcd_xxxx. Difference mainboards
> > route it to difference supply.
> >
> > Dtso file should use name in HEADER.  The main dts descript how connect
> > it to provider, currently use additional label for it.
>
> The power supply it is not the pin number on the connector.
>
> The power supply is in the board.

In addon boards or mainboard? generally, there always power supply into
connector.

> We have board in which the power
> supply can be controlled by a gpio, board in which it is fixed, board in
> which this power supply is shared with other peripherals. So no, the
> power supply is not the pin number in the connector. What you write here
> is wrong.

It depend on where controller it, in addon boards or mainboards?

if in addon boards,  gpio should be in connectors.  if it is mainboars,
a power-supply wire should go through connectors, you use it as connector's
regulators.

Frank

>
> > > I see your need to avoid duplication, and I agree with it. But an
> > > accurate HW description and the user experience trumps this need.
> > > And I insist on the user experience, what we are doing is for someone to
> > > use, we should not make the life of people hard because we decide on
> > > non-descriptive or inaccurate names.
> >
> > We take an iterative approach, learning and improving as we progress. New
> > issues are addressed step by step, and better solutions are adopted
> > whenever they are identified. Once a new approach proves to be more
> > effective, we gradually transition to it, especially for new drivers and
> > DTS changes.
>
> Yes, of course. I agree. And this has nothing to do with that we are
> discussing here.
>
> Francesco
>
