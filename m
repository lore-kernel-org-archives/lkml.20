Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792700709;
	b=z1rkv+/CDNaxLAJ89JYL4q9lcIxDyf9O02YFqOzLnJbP6ECtSZF/O/+9rTECr0ARUlVs
	 97tQkNbYwR5JWSyEwTpmCyzAfavZIOzDjyJpgsjZ/6iUduz5/TEGNXUGIJ4CmimQy95/Q
	 kno2kE+uscUTCq3j2ixHGwCPSM9zN4/nlGN2HKIc+/I6l7YZuvV6Pdt872/a5Ousmgo2Y
	 nKGVnpXx9njjg3aRwyvPdsgVeIIlpk/vRezE2R3Bb4ZzuKCUpvbcMFh2nvckPh5Fvy31c
	 E+rN7xF6WdBwpbtPz6I+3PLZCvANd5K6XCy6z5aJbohOk9Cl+lRpxm7rEqao0nLqitQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700709;
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
	bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=;
	b=KfSGdWqP2eGHzZwUppbae1daihU/U5+PlwJ5tsPbHjM8zkS3M554Ke4zS/tJdRhUfBvs
	 ksRFelpq9ok9gN7W+vyBW+RtkXXtLGk9KtNSTqHbPcOELvWWqMg3rDhwRZCug7nL0NrW5
	 aHWabzTvQD6a+TVpSBfNxCTrLYmqTR0AarcvMMbziM/QjkrQ2BckEVIuAZ0iiR8XHvNOo
	 fjaunCkfCvNg3mObqMfMskSzX1iOm9Q4SLjUEzqhCCci/9xp3cbM9wfHsZn2F5sAaYU72
	 AI1Kk+pM02j5DjDY2TEGN6xfKAsD6S1qIr1YRBpxIFkQuPRX7e1y5F/Afpiq9FxwGkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z7r362V+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.20
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D5606A31F;
	Thu, 22 Oct 2026 20:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z7r362V+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS1zW3xRR5mOPphUOqabgn/ehfvX69BFL23Dqt9OF9SkuNIk+n4eocpamZlXHU6ZyZoX3cLD7sxLV3p/kabMirHV7mS6bpO4EjztMScxjFobpDW2ZsaZSx34wHPgUCrDir0PCvnPEfO6gn9iqKjlAX3pyCW6T+OhFNcTiLvc8d8BInqRGmI70VirvMdvyv2lpE+mGYjofa1UkiftT9a4e/9HJ9I2U5z36EoNkavVkirhINVunVukWQnnxRETGzuebeOkjtDKuenowZZqiDTpEjllmx9E4miXeP5OaikGqxrza0+DXmcJ2EzH0aQRaT02xyNg/J1OGsFXfhXHfDnIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=;
 b=wXkU7qzx4nPmiu61RtX0kuLOwy/V/Mh92KjFsd0KrY2EA0BvV0MTvRQMio/jGwCE2IMSdXp+oDSbCxT23w3tILjmAjW8QVOwGZsgkkls5+s93cVbGjif3w7fsNdL894sRqrhLa3ahbWqysgVmK86nEJe/xhHj8XYaRXyNUXcNXAa4Ml9aOzScw1rSdfEBMuI2obRLAfMvEFIBGVxUaoSwDuWG0PKbKvPSh3DY2RZ6ta3L7Zw9YkPuetuEsMaZu0POamRPwLjXgWXTGApaoyLhKYR2xPjX0VgzNaN3il4pa0LkGHEOsWmO96rlSu/d7qYyxmzXSefaZN2HT9i4+eiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=;
 b=Z7r362V+Dt0LQwWy5J/SKnBVgdIiUGEykOkygIWDC4TP7RfM8gMGozIGZ4lGf5aUY3F5dKFRJ8rklCH/Pcuaini0/Bco4JMhAOUXnBMfuRWeZ7teMOxcxxE+JzbLva5af5keZRuZbt64Pnt+dVagLVKgyUIVR+Ghrlfa6vnDwNxOo/2j9ItuA6NkK9KLMzu2GDwTRAwF3sUkrMlueFpARjijtDmhtXT2A8Na1biQYbOCLAjU9vH8kPH2C+gaDLvZSHYdNoUy0PRT/N+6bxEB9LejOBidCp75pDvzHdGD60/lcmF2fYKupF93mMRelNbYp6tY1hynpX4BHwJd2i4HoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:25:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:25:05 +0000
Date: Thu, 22 Oct 2026 16:24:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Message-ID: <atpxGZ_6ii-fax3l@lizhi-Precision-Tower-5810>
References: <20261005172622.135725-1-francesco@dolcini.it>
 <asPfQZURHvVzbgVU@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asPfQZURHvVzbgVU@francesco-nb>
X-ClientProxiedBy: DS7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::15)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a93b7ff-e98a-4cd1-e909-08df307a8f27
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021123027099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zOns8MYtADKXj5pqgvLufm8nvmtmBFnyE6zB4eOpf6aqLk9V6PPWip9s1X67c3Bl8bAGrW/f72l2CALEKCRL9QFybhyYWNi7DWq8Qt8Nqocnpgj1jYz+4gaADDMk7PF5sCjdtbfbhgrmTd1oFrH4//5SFen21i1L0m16R+J2H7qrq/eaIyINbbHbwnga9HhAaK6KQHSN87PRbHopP1LE71l1BAq7FzzKMI7LhnXxFEkRcDqksxQpEEatC1WgZdRkluGzgxbpk2WyCwHRMzcTH8yewc45KxEN8WGkOjepg3jbSwk6RI0QHQxbXVf/keLacchtIIbmYGmwfmD0QSaWNRW67WE7B2jJB2+OUMU24jsvgnuHu2uz8LFv8kJzxuemmYvHYuEQhETAh41xp66Glg1uUpJ4QQvcgZQy118vVbHz2a+XxvudD1p3+X88S01nZ/baqbsCWOugXuxisUI67Z9r/V3cwPwkBVltXD9cD6uX13/bqmsO61uU3SSUblCZrLMVRA7Yp0nr4f5Q1ASJv1h5OXgYOYdIZM5UW+lcY1rFcIqcmLEAtQC0LAjZc/PP2Y8Oc8r3YEP6KEDj88zAkq7C73DSgtnP2AcjdiXvupSu0kb2OQ4VeBL9lawmF/nbIiVCBwi+/UaobqJyfjcBtZK1HlXYSkC4297W7qJKAWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021123027099003)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mXV4NXs4xLV9eUpujSA0zkEVVW95FumLvo0P2n3wbdEM0SSGxlh0U7dilc6F?=
 =?us-ascii?Q?LI+Nn+uznm0p1TARHAqdA2GR2ssmmXd6LjY7m8ATqUtvEKUJ3Jp2HwB5sjUp?=
 =?us-ascii?Q?hcKXQS1/0M1gpap8h77jCNiMh5XLgPt6NLNHo0/uGalVs7sDeg0KlKQkG51P?=
 =?us-ascii?Q?qFPRWtMgLRZOa6xA5lFvrWbUb+nHnPbRxGiM+JaP7AkBzvAhl0IhVShbT2bz?=
 =?us-ascii?Q?kVpBlxtKp2o/aNSqFurLIwbHzPKXKhVj+RrAxvY3Pf14EEIy2DaCznPNde5R?=
 =?us-ascii?Q?1KHfIoEfapZ1QecPAMamjCRLo98z4S5z1Q2cVGpgq89piamBVrcw6xw1xGam?=
 =?us-ascii?Q?fPzY8qpHAqhAZGzSWLuvXVMKAt0QUp9z2gtOLp7LwqMoQlv7HW0sm0TzW4d6?=
 =?us-ascii?Q?Ux08fwLmWOfZ/FuGxQKglgOgJuTxdQnpY3PExnE0+FlnKIZSUjix2WVNSY9a?=
 =?us-ascii?Q?hOf977eSNsHQxJ8B25g9i/RBsN7AnzfF5v5cIhmM19cVM0OMA01mh/ASpcei?=
 =?us-ascii?Q?2QbdQwMiXRk/O2IzR+8+4uWHQYHaKDRFoxC8DPeKII67akotEHRqPOLM2Bpg?=
 =?us-ascii?Q?tKZCXnlZgMB0kxLoaqphlJsl6r5UkQH+SuqzU3F2OxCGLhTdjXUsTLQR6gvN?=
 =?us-ascii?Q?bWU2OMVeEZsUDn1OTLHijFc5DbC2K3Cu+G/wHm5ghuTHTqb7DxqHn5zEKYZo?=
 =?us-ascii?Q?0ouU3fqXTPVbBWfd4U0G/WbxOimHXrD/GKEVBq0XEgtq4vK+Zliyxc/kSSUW?=
 =?us-ascii?Q?4NDA5k2Yrotm+XndLfeQ/UKhPPtPnYmWEsIqvEmZIVlPs+qNRpvT23gfSyYF?=
 =?us-ascii?Q?jOcmNZ+IN239LHD4wlMyDLwBK/LGMetc5e8cnJEjsszCQt82DeZT9euOEiWb?=
 =?us-ascii?Q?BWv6eBh7YSjYC61iBMyb2fvV5gPQGuhzGu29ksB8yoiPFtQD/ugLCNJ8E3iL?=
 =?us-ascii?Q?swlEWlZTTHVqVXD3YI4ljlH4kMXrzWq5R5db7j6ZMkpdXgGye8LtbSELRfYv?=
 =?us-ascii?Q?V4/h7Q9jp4ZKi7zRgowD9dbH739mF3FWpSj6Ri0+W7wWcIymL0g91kj51eIs?=
 =?us-ascii?Q?gFNappoC0o8vqRYE5p9rxhjVq7f38hFrYou+fqujiqz76asjLMelEDD/3HoV?=
 =?us-ascii?Q?LtL2qAkBDf4z+DoTSwG+bncVPvQTcX4cIG/6vXkY49PNR+JTms5UKPKhMAY/?=
 =?us-ascii?Q?hUFi185lIzRwLY4leX+rIvuU2lC89n8axX3HoFgrcP08cy7C6GZGLYJpTFFB?=
 =?us-ascii?Q?ssx4dpygshEyQJL4qTL3uBJDxPUHG6FAiwoW/x++2owkODVONxcQRmLPZXbC?=
 =?us-ascii?Q?1OrIPT37zKhJBE/x9ARWZK5n3yWX4cSkMeECdj7kB8045r78bjHgD0EE6thZ?=
 =?us-ascii?Q?sVRpOqSCmLSASSg4VbH4FKjZzeI/bSX0+Eazm9M/sfAF6dqSqJyQwuqkVWS0?=
 =?us-ascii?Q?5oeaa92okYQZ3dg9Jwjr8sxpAjTLA4YrOIg4j0Jw8CCahCW+Q1wgylraPzZk?=
 =?us-ascii?Q?hga+ONgwMgOG+szSjpOBbWAovZ72kcELmyMrqlt9zrihBej19qGzrPTjePhs?=
 =?us-ascii?Q?HwI5X47tf4luFWHH81ZSlSC2doP6IENPHWIWDX+2ADqjMY45tOEYB72Gu3Qx?=
 =?us-ascii?Q?aq/rXaYGM2c1Cg4PNEBQm/NWLhIOX8J0w/44HxiqhzSviHLqcImQjegIoSOo?=
 =?us-ascii?Q?onXe3imVmiBebY2UlnMg/q2tF1V5U6ZZStqDRW9UtxMgR85mWVtboVEDgKBR?=
 =?us-ascii?Q?nbY74WYlrEwuVlisFjwmzBUUX1hncvuRvIt7riYcbRGGWhhiwM3H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93b7ff-e98a-4cd1-e909-08df307a8f27
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:25:05.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SZTOst9iybrhFGBX/mRAUe5ZxUQ8hfZZBzpXJ+/dTzepMxGmhrpTnhNpgGYcdVl+7Ti0XysYDTSSs6xgQIxPAeXnmIJreV5Jg8gVwWRhwK+XUnj9ApaLUy+VKPK6Z9z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

On Mon, Oct 05, 2026 at 07:32:49PM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Mon, Oct 05, 2026 at 07:26:21PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
> > GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
> > MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
> > 33.3.2.184-186).
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952-pinfunc.h | 6 ++++++
> >  arch/arm64/boot/dts/freescale/imx952.dtsi      | 4 ++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > index debe6ede2d70..72cfe7893af8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > +++ b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > @@ -307,6 +307,12 @@
> >  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPUART7_RX                0x00A4 0x02D4 0x05B0 0x02 0x01
> >  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPSPI4_SCK                0x00A4 0x02D4 0x0568 0x04 0x01
> >
> > +#define IMX952_PAD_GPIO_IO38__WAKEUPMIX_TOP_GPIO5_IO_18               0x00A8 0x02D8 0x0000 0x00 0x00
> > +
> > +#define IMX952_PAD_GPIO_IO39__WAKEUPMIX_TOP_GPIO5_IO_19               0x00AC 0x02DC 0x0000 0x00 0x00
> > +
> > +#define IMX952_PAD_GPIO_IO40__WAKEUPMIX_TOP_GPIO5_IO_20               0x00B0 0x02E0 0x0000 0x00 0x00
> > +
>
> Frank: the downstream kernel has different names, that seems not
> correct. A double check on why you have this wrong naming on your
> donwstream kernel is appreciated.

Add peng fan, this file should be generated from tools. It may use early
data base.

Frank

>
> Francesco
>
