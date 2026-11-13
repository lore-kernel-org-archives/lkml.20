Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605714;
	b=Q4FcBbR8vhBWXATvtu7cliY1bwoOkjO3YecLiSF2Kdw3IiWf8l9c8wT/DVPYQkfZAbf0
	 4uvM4ONB4J3UmCNuo9BTrDSrfMR/YZVvfBXxhNgnJ2l8KyfGETFr+0V26t84ckCfPgEit
	 jnPVGs09O6NcLlAOkQn9x6Byepd35HAYpCge1UePiyzGj7LU3QB1ZPs0DGJqr6U1w+QVF
	 c9coTgZzDQimSKFa9F9i1qULouLaP1krFVLd15oHxmTC/n3rSohIW35CoYyvqy+gkqnx2
	 H2XRflZGXBZq0NljPzTh7HbUUm833p5JdUNDHnx8Myy7nFqyBvTiKHN+CBzup9mOS/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605714;
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
	bh=7f51RrK0Xch1FALUh6yAPpbQcgw6QlPQ9vVQJyETQfk=;
	b=odXCgLy6754rBCL7Q3HQpzXOpEOt9ChYXzaAwj2Sz9ydVWltGgFEv3Ps71EkJX7pR4FJ
	 F9+bGLraTzUt3vQ3F9AwSmK2QFEo1XbQ5oCYz5rTNDcDQu3ksZsJqkYBZk2i2pNqvOQHr
	 /P+irZjz9+max2rU+4X3NF0gLVWUlNgJ3Ulaso0CtwSqPVJbx68iRYjO6SwKea9zLn7vl
	 TocBJOuIKdpALF58MCOCYsP/9dMSJpEBf+vxzdAlUi+m1OUwyVNu71XGKfNThhpwauTsy
	 lCMQyGLhXI/OIDU1rrfQrhUM7+u4afB2eTz5jnpNi1EBfv6O/+/erzHDXcPBx0cpZdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GDA5UbcD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.28
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF2B606A330;
	Fri, 13 Nov 2026 21:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF2B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GDA5UbcD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHMgNO1qEzNAuikJfoI0X0xUijrOxg8b8gGpx7eU61Oq6Kbi1UIBubYgdrIqv+oq4YIUWOmmjqGWW7/lYZ0ydomTzuQnOElZxO/dL7TOSXns4cjL3BhUnO/cVy0oBcKiqprnRUn7EQVwHHpbfS8pLiAnuN3gG3V9ZdTaaavHemFu4peUaL5/WLguHjmlfjdjcDQI4FWjLBmOvo8DDSwANRTEw6kNxgTHSqn4x3bNJfyAcvd5dcyTRrPLd2dbc+Bu8mx3rj0DyiVvCkibpf/oa9jMR6dzn27jFiSLweULcEWxM5Gw3DLqF5T2GS+8KW1ehFgzFdNAAIKIwffozTJ7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f51RrK0Xch1FALUh6yAPpbQcgw6QlPQ9vVQJyETQfk=;
 b=WvqCJ0eNV214ze0eyOEwdu7fqB7rruLx5IG4w+O8mMGuZep/evnWXeZcnv5hMP0oSnwWLt2oLCBL1Dj/aEknQhnj6AG3vc1/iJovuOrbLp0maYnZWOGAFi1zaa8XtaIuTLLsiG1TzTqPHmQkSJDBUce4yvkBCTYyUj03kBEwjLQSTrtPfdSTAqFoBxAudxR0mwQr+h4x0YUdXcDaGegpPy13VgOII1J1yUEmpT7scInihHplwPdh/FzgoEF0nhh8ckVGelmD9uvtekMtg882HGe+q4Hckfv5PZMjp1CVPD5vcNWVezUspPtOrOEpn53Q+WT6WVHkwpVMHwO/jHZLyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f51RrK0Xch1FALUh6yAPpbQcgw6QlPQ9vVQJyETQfk=;
 b=GDA5UbcDu/fXIrLN3tmF7nmd+qFB2Y/FFVYcZwNALlARsIBWJAgdw/cWZkfvsEO1CDzqCc5k5vJzgwF+IwXquJjlhBiguQJUTX+9nrpZQKa10FO5XRWUQLYjn87n7vugAgHkejSw61zkF2giybRhhnYwA+gvaOgiZfeYpaEPUG8OWSQd3NwtTghRweoN9HBVDB+Nzyk9oeZi5G+0vvtoq2YdrTo2EcDajn0CJCdW7keMIBgSi5Wywg9qpHeH8K9oaqxfwZDIGutM0SegYvIWe+XF3Uz3vpgkt+5cziTgMeML/FM3xlDNyikRZdIlRd4Bzz4FWjdirjipovr3+ixgMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA6PR04MB11946.eurprd04.prod.outlook.com (2603:10a6:102:513::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 21:35:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 21:35:10 +0000
Date: Fri, 13 Nov 2026 15:35:02 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI
 alias
Message-ID: <aveChu8WqYM2JZcN@SMW015318>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
 <20261113171927.GA762258@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113171927.GA762258@francesco-nb>
X-ClientProxiedBy: DS1P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:44b::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA6PR04MB11946:EE_
X-MS-Office365-Filtering-Correlation-Id: 8412f754-da13-41e9-f7fe-08df41cdfe60
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|23010399003|261026140227099003|11063799006|4143699003|261021121427099003|10067099003|261102123227099003|261022075727099003|261009223027099003|261021123027099003|56012099006|261022105027099003|261026121527099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lViNJ8vv9wsuvFjTv4MgoTBOkJBJw8ioEKsy+uf4no4BhYxovHjEYB9SNpAmT6kcw1wbUEbFGlh7DdniS0vxzttBlixxB5Z0EiVwCse8Z6RQmsKKK9x2qVhFN0AVbaxw/9v50fGfGAknbaGOUrU9fBCSRKwvtFQXw5mAYoJrZHn4rt7418BCRU2ylFq/x0xf6MRmjJ6rxTU8GgtNXTxIEDptWryfrJOjV15m7YQiVGtJ9H8vUuQpgtj2icoLzGlhYyW1onEViiKMvDlONT14seKXw5mLRcjuSTYOxwQoSJmxtHNmkMRW/cwGc6GTtXIFuvnCMP6a6zAZkbQAm1xMoBJ/Riy7wIAyByyv8recdeR+mF8aNZoD7qCpZGmGQIprSK40isszi2IFH35YqJ2xWLZQIQsWgpsned3HsvTBLKY3j87FvsvAuW2YS1o0pv/ievHfhdy66xFRSKabWyxkZoF+4dRqyzTCsC87W+bwo94MapTcEYKiMW6VWWyYCpaD7hd8RZy9Lis01DUQCvrsv8fF8kF/20sATHJeNz66ap95UDYJ3mlnXwlpb0ueLKy3GFORRtDA2XOx3o87JMzWUyg4BCRWtwshM2LM1CDOt9gt/qFhaCBYaY7b9pPSKA1ozpllLsBMFZkFFDpld7/L4Pkx6EBQOMTlfAZ3SQfPQOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(23010399003)(261026140227099003)(11063799006)(4143699003)(261021121427099003)(10067099003)(261102123227099003)(261022075727099003)(261009223027099003)(261021123027099003)(56012099006)(261022105027099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WLnHLNn5fuLksY+9ZhujwVxYssZs4+m3OJq2EmrhhbmXrpb3vC6vJ7mp+t4?=
 =?us-ascii?Q?rENabUTMDFv2g2gaX20D9qgp901i1aF9Y1qT/jubA7zgrHd9q3oaa7mng9zN?=
 =?us-ascii?Q?7opYQyWeI8NHKCf3MU+Wd3WjKC0qj8bPgM0tBKgdl4eZXUSqKGj8jTkJGiHC?=
 =?us-ascii?Q?vmJ19Hshvf8TWuJ7ExPjn3eONsLpYIIDwabKu6yIVs1l8/WNa1nBgQdNARZO?=
 =?us-ascii?Q?jzYbdqdqW+NK4E5P/miR6INDY5ilRGQjVXe+pDOsTTNiRW5OCAoc/ZbALshE?=
 =?us-ascii?Q?K/X82hwQvx5qNb1svUtmG3BwEcNPfSthl4wDLYPJ8ijLHvetW8KjvR58iHO2?=
 =?us-ascii?Q?YFQgi9QdolfV18IZoeVhEwsx7Se4lXCqWvz1zJIPyHIQ15qRNDZc+okiYkff?=
 =?us-ascii?Q?EsLFvtNX85+Pk68p8NmUbiWzf5j/Kf0wMpQMd8GK7LnVR8PwC94mCr+wyyzO?=
 =?us-ascii?Q?mWsQKFGwV1h8Szaclzd4Rr1a33wwnbzDt4OW10jzY9CXgjjmIKieD8lhKq7Q?=
 =?us-ascii?Q?qM8l3gICqutE+Hga0KdFGD2jToInK+KPUI3xvvQ69Xlf8JK6NYy7Vr9MQWsL?=
 =?us-ascii?Q?D5R8LLwhW105AnGLlyp+G0m2rWuXqaoLazqvsZOMPAkYBnOxFQgA3wVoSBY2?=
 =?us-ascii?Q?yt8axSzJoRMe8Yc/uMhrutpl4nVVVxb7M5SMedNvpaJbofNcf6ayof7Fh6mh?=
 =?us-ascii?Q?Cncb4Gm17XOoCT4YRVcZCNbeqZp3bZzAWCUvwVZv0boTxvrlxOUGQ67+Olfu?=
 =?us-ascii?Q?hzHeVb8YrH3BA5Vsy/5B5MwyOllbsh8TVs6AmWcaPXRNSmc1taEuhixIwbX+?=
 =?us-ascii?Q?tLe1cjXA6xxFnI1arJTWq5N/Ek3HKZPMV5ucLQ5bV4xZ6ZPibx3LXS2GipFE?=
 =?us-ascii?Q?TCUZ7vj/4GAyShljs8mInlLRvG513vGi1fyLSfZLzpSOGUI7NXjW8syajiAX?=
 =?us-ascii?Q?a0O4v3U5USvW/Sa6+r8xqJFYY8kM0r1a8v0F7+rewK1kfFE/vNMC7Q2L4c5W?=
 =?us-ascii?Q?iUAbwmVE8KquMps8hoRf+edx4DP7gNH/aGy/tbRjRfC5w/Bm/IWmSc6pl/2q?=
 =?us-ascii?Q?8M88E0k42eqGbaIHCx4AXbNxaPbW6vQFb4AEhyx4QrnSIiyFQyaBFNREPBQd?=
 =?us-ascii?Q?pHSyoEsrwxHXXlTa6G8Ufm12FT8tCsE2MQ7Li57zD7QDOOHbF9pPwphfaFCq?=
 =?us-ascii?Q?FhIP8B8qzSUAAlTZrZGyiWqZF00Vl6MTkRMBTEvF47NUKf51GRgXAdg1JoeV?=
 =?us-ascii?Q?56tLSp6ruB9yG1KgKstYkGwPXbRCAG9wMw1uK2SCzmyjuHLZ+hlP+f8lytru?=
 =?us-ascii?Q?hjw5PS92naS8fn4DhQkIdD6x8BrWoP1u+cHehlFngvTe5RVQ4JpCX+VqdasH?=
 =?us-ascii?Q?Y0NHw2O0MLmKtFb8mXIA9t+H3io0Wkb1V9w/s6i6NC+VHJHwZ7gSy5c942S1?=
 =?us-ascii?Q?4KP+ZK0KNrlTLB4qD6PQRwv/mS+QFtQabFLxMOvYFVIo/qJis6o9pC9dvhqd?=
 =?us-ascii?Q?e5oFXseMBoCdkWrrRf5o3aTmlUD91d9mDVvAx6T30lGSZSm/wKrjJcvZgGlS?=
 =?us-ascii?Q?mk1IdCE6PxDa+qjM6zeh96y620ffMyHgrkMZxu3QJPaRZo2yh+FS5t+40yFh?=
 =?us-ascii?Q?hr4PUPtuHqc5mPNJm3piFPVKSoAyiyw11NfV9XFJK62PEs2GDrW/s9WyYkck?=
 =?us-ascii?Q?TPvu8zzPQwg+hboSUiHpfkvDyuqNsbsvKv/9wjORZfnkQbg7FPyvhRcaUX5I?=
 =?us-ascii?Q?aqPO4l8yhxROVri5mjNF2oXwecOGcM8pxftwo7xSaF64orzkZaTx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8412f754-da13-41e9-f7fe-08df41cdfe60
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:35:10.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L16+iMJS2M4ww2OKDBz283B/z9aEaZ2jglMjajFRUH9YVJ7Vso0gLrJ4oplYa9zEUBKTpzAWW0eJGMU+A25AHaNUeO/u0AdW+pngrsVKQemerbjITAJEHnT3ucbebXoQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11946

On Fri, Nov 13, 2026 at 06:19:27PM +0100, Francesco Dolcini wrote:
> On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> > On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > > Hello Frank,
> > >
> > > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >
> > > > > The Verdin family pinout defines the SoM interfaces and their
> > > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > > implemented by ecspi2 on Verdin iMX8MM.
> > > > >
> > > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > > the spi2 alias inherited from the SoC.
> > > > >
> > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > index 1ac9d000d415..0369803a4d46 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > @@ -16,6 +16,8 @@ chosen {
> > > > >  	aliases {
> > > > >  		rtc0 = &rtc_i2c;
> > > > >  		rtc1 = &snvs_rtc;
> > > > > +		spi0 = &ecspi2;
> > > > > +		/delete-property/ spi1;
> > > >
> > > > Can you avoid delete property for new platform?
> > >
> > > Unfortunately this is needed.
> > >
> > > The included imx8mm.dtsi has
> > >
> > >   spi1 = &ecspi2;
> >
> > Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> > board feature, not soc features.
>
> Please see the linked thread [0][1]. It's not a viable option.

where [0] and [1]

>
> In addition, I can do this for my boards (Toradex), how do I know what I
> have to move for boards I do not know? I can't do that. The only way
> would be to duplicate the whole aliases on *every* board.

at imx9, already move aliase to each boards, dupicate it and just make
sure build finial results the same.

i.mx8 is still not too old yet.

Frank

>
> Unfortunately your proposal does not work.
>
> Francesco
>
