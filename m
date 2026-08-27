Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705DC357D18;
	Thu, 27 Aug 2026 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859159; cv=fail; b=HZ3h7SWb4lTJrnj4788RwqjXgInXr6TiHOMItV3mFTRJvzt8MJNXjBUSSGbCsNTZAHC01DxMWJumIMjozuH5a6MYcBQyRLYrdFzv27EFo/n9GvxryWRmzvcBWzSc51BlNB4l4WVRGXAXSsN6G6pmyUgVsd83XxvOThPF21AQlZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859159; c=relaxed/simple;
	bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pdB7WDW4TrD4PP3yp3SX0Br1V1+u8g57Z9IS0YYaOWe6T2VBn8ksdUacW45TMLOzq9hCI1Zwb0USmDrEYJLh6XruLM7RwCgNKTPscE6cnMmRuFYD85df5f5jnO7k/dDUX8shL1vLDq/+13ODzgY1c9TNtWlR4Y8nxX1X3eSSCbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EBry+nJc; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EBry+nJc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVUmkvsqRc4bcQOqREJG3PnmLFqDiH/zrBmQijiP1zfKYFAs1VcpQzCYWK6k5hd5SfEUgOo4xFUEUdwHp7nL3XJp1/e3XG2adShVNTkYoum6d9fQfUtzW8tSl4hGW6B/RHa73eVR8daC09ttnjWNjPlZkIisOTp/S7WwPENjX3e4/BPJxuKQVbNUmKeVAE9BV3dE3yUCrtmDubsZoo6GJJ0ClVuQw5wWE26EpfStr9g93e4E6MnLoKI7N9DMposQSR1go+uU10N2mO9OATyvLPzxap+9mSMAYLM0ERTqXWhzo4H0KsZ9zfDrsDlObP0cZtkrXSep01a/o9srvsLt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=;
 b=oaesmBkH90NzhKidwaxxnMdQFr7MmENxaaUrlgRC7r1XIZSvWuGpg5ChsNKeELoc1NJD6zmJ4waAEBWn4G5gGhgLS/U4vjzkSHjlGajuq0GJJyMo/LwG9mi0p1VsH+HGI45n99rRRvu5HxOF8MnXDpyE80IpzXRs4AagGNtgFcWXm4qGG8AOBegjJR5Of6lAj0IplSqfgI0RmHfmzM4r3p6AaVSdoykgk52S3ZBoubiF2wW3sa1A3f3rNC6TMfhk8qmOJQ62D+wxoMRg5PKabnhX7jn7DkaJZzhU50MY3jzGw/Q5CbB5bexLGYTM13U/4OYoCBlXaYFrvVjmmji61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoGmjMqIx5Dwqr3SsHhNvw0fOhzhJL7KispYEos1YYw=;
 b=EBry+nJcTzdph6lohbyqfc3WXT9X3bordrJv2/UTEQAvM5cbiEYXTLSEZzQpuv1Ls2Hy0MAEWD3mvkRlc7feZHTlpqQJ7SoLWc12JgFsY0mbWAYgAUMkMGbxqb+MmT8W1UY8AO8iPmV5WAyeSqlA0cdlbDgexS1Awku0MEdVt6OcwNwr/ah73yOyBwMAtiAvOizXp2ihh9+j91EnftKPZ/mVP35u1FId+b0drEb8pAMUCoUZnKsA6cQ+dv/ctfw1Ojfgj0GpKD4pFKLbbR9F7QxAQSK2Ix2/BnjVHlRi9eEvokKrNmPXtyyr4uauhKYmVLj2tpqUCuNLetx4Iviudw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10779.eurprd04.prod.outlook.com (2603:10a6:150:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:32:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:32:31 +0000
Date: Thu, 27 Aug 2026 14:32:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v6 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <apCQw3St9NXgm260@SMW015318>
References: <cover.1787851637.git.stefano.r@variscite.com>
 <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11592f9d727337fedf02fdb107a24e935f3ebce4.1787851637.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10779:EE_
X-MS-Office365-Filtering-Correlation-Id: af4a1c1c-b660-402e-8145-08df0471ef8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 PZcJ1O2qH463JcBeDdeUiOfZdpCAUU9+bxMjQwptZYUgTyI9PaerbM5wX3Q4MHfs12GMEXWHtk3vQfVFFP6iHUOwfK2sfzciPqnCwW/ZRdRoNIhZ9tChILA+FqWVrQ6ri7xx9u6ot+6DDkYvxbgICUX2zqmOSa+Jvx0bSY1NKwYyLtUryBt5Y/jnOwc/jiEKfD+7szFd4jmUoAq/GStEHYPUFPeMx42PMD+c/DTjbfNkWXkbUkD855hiI55yRXiDGkr4g0F9efRQskkdi4qNTpw2R9o5fLprCZbZfhck3qfWxB1S6pecmw40apsDVt3ISSmXzoq4Px3pFx3WMBZQREwMk75NGGN/89rTlJZVEcXu8S+dZaWldlASIproiKYpNVFueGT8XghMU2RSMdaI9VwamwmgpgOZ3jfYmEGOfub/Jcsd4c2pozjxDviG8RiW8H+jPIyU4lSaVerRGFnWaiIA2xpyrxCkCD9gKGS4WjhWCwlXCzf1vxBq9iY3uQNnprnM3j3jE6N0Pr+Ef+U4JL3RuNDm6YzOJ627UXjq+NQtSYS/GXyL7xbr/V/6WemG9vOqbU1DtawO6DInaktUAk0ed7q09QE2GfxjeQ0D+hQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+qMQ80y1OLp+CmxiTH9xQXBxklXWFh8L4SYWCfqn4emRxmutB0Dj32awwH3b?=
 =?us-ascii?Q?VRlmWt71/asyk7BaCO1shRR8+Nrxen8lL/mPj6Wa/xdMKceD/zru4PRAHr7K?=
 =?us-ascii?Q?R80ZayTPpqNkEZtYFa6eGAyclfhUh0I1Ui405Mq4p95qrhoo4ZLwXx41Bxq5?=
 =?us-ascii?Q?yzjFk1sk/6fqsJxfnLgsxcPsMvE/Yrzna7VBkObBrCM+Huznjyfebn5DR32f?=
 =?us-ascii?Q?e/2IVruOlnO7TQEN5T3uAp2CJTSP9C285XcU1fS98wH+49iMl7UoQouL7/NQ?=
 =?us-ascii?Q?ErQ6EzTip4boMvrrzqALytgzaft9/4m0KMPcX7k/pzo5WwaQM2IzRa3mARES?=
 =?us-ascii?Q?zSitFZ1f4MWJ1U7p5wA8R8/KccKsUYXBOcFAB9XgF+zH/jatBFlw234iz5qs?=
 =?us-ascii?Q?VHw3lqB5dJdySXn1bTCeeDTMmw9servOEJi8E8ZYI/GDzJn1epmf0D7xjGFD?=
 =?us-ascii?Q?55LN4mYWH4kSuFDMfKyYxJZ2PyfUjkpo/0znigaOFvEPsaqowzCC0pL8lZtp?=
 =?us-ascii?Q?bwuQvLicnVX7ElpH+DhOCauu3agB8VWqNfwgs6LKW9f4oH/bqhuulimlh9BB?=
 =?us-ascii?Q?sEUnBln9mfsD+yNsXM83JnR6ODbQ7dHwIGorAFaPrpFq4CjPeaHE88PpgD62?=
 =?us-ascii?Q?BPqwADChH+DbU1W6rIXmoucfr0uj2hZZq4GjJqTCFAnKPuLclNx0PSv8qefE?=
 =?us-ascii?Q?kYIs6wehaXqQ8ku2lkjVUZIgXtXzM0tqejcsAH+9z5rEjJWme5ak85HwpPcL?=
 =?us-ascii?Q?sbaVW0QpDs1PkNCHbWSxaKUi6XHUAe4OHUO6uarDtxt60W9Tlr4BVRBC4DC1?=
 =?us-ascii?Q?EBY8A3GGtaz+k6mVhzttvZHtTMkgrQeyrbXM7kRh4l2pXoC+k0CSOVMiaYm2?=
 =?us-ascii?Q?ioGu6yzLX+oKH/DWVp27IzR6nIRYRupm7Yopzk2ftvJNdMlOmlJpmRZnfOmm?=
 =?us-ascii?Q?RQvF8D3FCIgpUIKsUcYgKHc2aLsy4+LteUtiFuClGaBUOQNVxa1kB7uRBUcQ?=
 =?us-ascii?Q?HJ5eIP9fZR4QMU2C5ZRJ2hAZNANGaJVxc+BOF9RMVR18GoqfZzqSkMMiTl8c?=
 =?us-ascii?Q?lj4ib4b2UFKR8hvJBOnHBkK0CNpWbfClD8+jB//297vysBskxEOzekgrzOL6?=
 =?us-ascii?Q?27f0R2zle1IzRx5b2KFN0Iwd4ts5XCzjtemJG7ACm8XQkcDb+dUPkg/MtqUE?=
 =?us-ascii?Q?an14KgXh8eCL87pBLrfZuagnrdn+mnk6mz5B0fdBhsiEf6iyA123pP7KuBBH?=
 =?us-ascii?Q?lZfaY0FhTU1L0+TTPEcX7totdx71GNxAV0Jk7KqvxwTSb1UaS1DdqfmAy8B4?=
 =?us-ascii?Q?LKcVKndia1md5AmgW6fwsLCiVw999VaqTTjq0m0dCVxbCJe0W5siJpyFXX30?=
 =?us-ascii?Q?geAs2UnDVfcTXZe04ART+uYKzbz0uicUHTQJ21/Pr/5NPvv6B9lPewFVkgLp?=
 =?us-ascii?Q?nWWOCLlnqWs7K8ik9SQdsbdD2UMX4h/3GQPZ3l4Z1vzdmvE93S7/Lhrpwke4?=
 =?us-ascii?Q?0ZDwhXLz666z4XibqnA1uZ7P6suH6aiLfAAwZ3yvzR/henZYNxVqGyWNAAYZ?=
 =?us-ascii?Q?yM9OvHOMO1gqF11Zc5eUUAoVNi2pDWqVWapZm2MmDToq2foIncbEFUlSWhm3?=
 =?us-ascii?Q?7nmZeig+Qf8rgkGRLXr970h5o7JVi3EkEiw2+lFkPbCw5O3sSdPrLOrsAyeb?=
 =?us-ascii?Q?M6UN5zGKBPIc7nk2/Z8TMWck/RDAfWOzMLyr3MHylR6F6nNSF0sSCCBGUXYm?=
 =?us-ascii?Q?BRgzY0lrSJwWWbMQVMHuz2tsUyfDCrKnfZ1i/POeTC5eptyL0GFE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4a1c1c-b660-402e-8145-08df0471ef8f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:32:31.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0FFcRLkbb/l58f6frwFqZoxb0gC755EciK8HsZrfMW/CnChU4mE+UZrzlS1RX/ygcOOQl+d9UPOccvQmYMOrTVuzy5eGF9Eu3jnFD3dsDriviZfK0ROYF7E0fhfvb8z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10779

On Thu, Aug 27, 2026 at 07:28:47PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite VAR-SOM-MX7 system on module.
>
> The module is based on the NXP i.MX7Dual SoC and is available in
> multiple configurations and hardware revisions.
>
> Add the common SoM description together with support for:
> - eMMC storage
> - NAND storage
> - WM8731 audio codec
> - VAR-SOM-MX7 V2 hardware revision
>
> Only SoM-specific peripherals are described here. Carrier board specific
> interfaces are provided by the respective carrier board device trees.
>
> Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> + *
...
> + */
> +
> +/delete-node/ &codec_wm8904;
> +/delete-node/ &wm8904;

Now, don't prefer delete-node in dts, which make maintaince difficult.

imx7d-var-som + wm8904
imx7d-var-som + wm8791

Seem to other, why not use dt overylay for difference audio codec

Frank
