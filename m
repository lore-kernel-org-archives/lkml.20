Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793900106;
	b=NxP22GgqHLoRDCriu3iv01F4jSOiH6xaf5fqJgLY70HGjY1mxlYlfxmAIRAWZCQMEpZ6
	 yDqtZ1MqWXUAEdyUOHcjTVjamxdIxmizTIusfyOiAKtCqrLP6DlvHsloi1fsIps/KKGv6
	 cJevMxKPGe7lkvYZhVOCLg/gekvwDHzCAKJfnEEdb7TorbfnCNEYLGxTu5kDBMlSZwgPz
	 Rod3rYnED4t8u1N6/Aix3lZIEw96SHWP8ERm+cpsE/ucHz2fg2u2+SppsoQvhIGNqYs3x
	 AZ/7vf90R2KWDb9IKSs7HDCHGArtNNxdXjg2qvqK7vvSFNHCfL9LS+wI+z8dZO+B6GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900106;
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
	bh=1DgMHIR2mFjIjK/g5iY+FS6IE43xTl91T2FOHt27/Qg=;
	b=bv4cNDrqx445Ou1ay8+Y5JUCSPMT9sr70lekOYKvk9RClkxcQPxSPxrAHbyMLl/Zcnm7
	 0AziEqBT0mnvhLSdONJKetCBlqfYxwz8BYDl4zerSdDvsNXDry/tKFyOUxsu/s4IxlS3t
	 RxxdsLsO91WRaRUHR/Qj2Mp3ZxzS5i1hSHGC8JHdgLuF62yF+kH1m+i47DIXYEcq/zXoi
	 YlYGPMkEWeCM6R/s32UVj1KjuEZiC9oIVD3u9pzVOEzSCtRymU0xRgMCzoQ8j0TU9D9/6
	 ldMJ/ug0V7rr66L2LIZvjvfITi3V6mXAb4UjzSL6vm2IEiYPZ1FgSqW8FWVgvi3oJ8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=k69JB8DM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.39
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4A606A32E;
	Thu,  5 Nov 2026 17:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C4A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=k69JB8DM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRBjVH38HOcGQaOTY5Ei37AF72IN14sF6zNdAHeHxwo48bl4ZUVPpb9Xzr/b0C45oP01QlhdyFoQlnm/P3025QslcOM7xDu9sIytrhdC7xnia5kwv8qdmoyGbZmE1UtxTD+JRK4NmQE1QNKMr9vbo0Vm+vCgUiwlRL9mXJeI7epIU7IdOrmIIJk9mm9/28TVZceYamTKcRgUgQUuldV7fiAu0jtJJhZkBXtX7M0fbbXql0p2WEK2quvvkpL+HbrEnstVKS70yAZN3Dc7Fozkc5P0FigX6sLdwVGApVRzy9i//4k2FJmnea37Vi1kBIRfZHIv5UOQoKSmrrTHH10mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DgMHIR2mFjIjK/g5iY+FS6IE43xTl91T2FOHt27/Qg=;
 b=MJNchjXBorHTRkdsn1Jj3ytF5A1JTXXMbtr2roU4jYDaI02CCbaQUEKmpSfE+ggJU5ZWqkWIm89+oXheLRo0y/z+X/GmmWI6iIa49aA2dN7xtdJlCPO8+GfboIgs2uvSAe65x32pIoRuYnN9VTjJDfGvEFZDdJmbNyjZ1wP++GsmHrMn11tykahF5ZD+f7g6sIik1IOk/yYGm5zNh7IGWA92uhx3iEXbdFIrHIxeA9C86rpk8qu2aXxSD+WADwYH36WKeCBM3grF/+sTcZRnEb1XC5o3+u9t8rcQM+VqayPe+1jFofPbyJJtZQDdIOqwHYc9wkH17uj3TSwx0Vw/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DgMHIR2mFjIjK/g5iY+FS6IE43xTl91T2FOHt27/Qg=;
 b=k69JB8DM+rPTlDVtNUlO9s4+NVMOmxi90Fbj5DzzozbbnOnzgDXTLay4SXbg3qD1kj7lOrGtpBKgEq8YMH69xnBUZ2aglifXvsvOrbDwvKDTalxPZaEKNCX587/p9hg4Wf6wySL576Bc5jf8u+k5Hj0AV4rqUY2uE1k+Ez1hek2zaFsz6OqLFoKDgcd2TULlJxAhmwxYrKz2S6GM6il61jOapxxrcCDseVMHu92cQt1dgBcasy65PZ4oLL067TizyZABTlDMFs1X4uDAHCN3jGJU8JJ4ITeDadaXr21H1wmFmzI3hoAuGMy44cEXk3xs49I6TLt4XVa/+3tqP24c9Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8158.eurprd04.prod.outlook.com (2603:10a6:102:1c3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:35:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:35:01 +0000
Date: Thu, 5 Nov 2026 11:34:49 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auy-OW_td7N8oHK_@SMW015318>
References: <20261105101739.10614-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105101739.10614-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH8PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: faccd0dc-db34-4c0a-fb9b-08df3b631ef9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|18002099003|22082099003|10067099003|56012099006|11063799006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
 a7vvkPMAoUKkHMZhlKV63P2AavtpQrEYaPvHbXbD+5OrIcSWs5OAa7CYu9JiyfevQVqU28rJrK8xcGwmDHEQxA2hD6jDCelEmiqNLYVf9GKJEKImwuC/xeSj1qI/tjjWr0ZJXemlWZc4ocCCUQo86zWc6GFUA0vW3LEPyJE1+U4sNoOK5TW95LVpcr3Ucqbfaud6dYcKTx7oOYpEuWSoCshenb28MTXZTfVjPqzk5XO2ykehJDuSy7Uxk3mmfM7eCSWuh+Nb4Y0woPpCy0ApG8e9tRbEBO6jgWgWFNf2Ep393t9k+wChuwbDZTZ9n36+epWeoee9o4NeEOfdqhP3SUk9Y7PxV23DuLPYnNmlY7698DAMDuEhchRIRZtMhhY303/XEzleLVKqSYU63wiv4TglQXQ22S4FvyZuvgYNiZe7ZJJQinSbSW1/0tInfnKHwli7pBiavAIWwLLBbL2HLW57kwM+/vBQYt/l6acGScx3+Ve8yp/cEc84Hzn6qOKhMU7n6eG5E/RpL21t4rLVkshUf+3Xcq0hlZbsIqEhQk3aFUt+3SjUZCpctWDnVyTgx08jGtZdN4MgZZDTSd5G0cCEqNFWT9IHuMdQOcDslZe8ud1eBOuAePCtz7Q+/0Uzf6236kTqxRcZmThOGWhvuwcGlG0izR0jxKvm37rIRDk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3GPFtHYGLJxTOvWuLT3uOTFawrVmcC+dA4ZXhMWjhLFCEklXnop7qRdQpS0q?=
 =?us-ascii?Q?KLjiF76sbKmxKplB9ymU3NY9YL5jZB7KoufBfXN1grAFxWCti037mHch8tMi?=
 =?us-ascii?Q?REm/P1U1/s0XVmGGC5R88kk2/W6ugsXiKqL47w5HvHq61R0fggMAiDSDeGpz?=
 =?us-ascii?Q?feEW/GWyG4SALxYxpoNnBa667GBN2Xk55hCyeQJjxdByaXTeakOAhiaA8wRE?=
 =?us-ascii?Q?OjuDXykrw/M/ngvdvnShL5FqkrLAuHmyuvTmtlC6u8XI+9nlPpEdNN08CNG5?=
 =?us-ascii?Q?AaL+PdmTw5+TSX+1pNvp0D0JSObcQSPqomLDcZYTr3fQYUeUUnJOPYueTl0u?=
 =?us-ascii?Q?M4/x/v/p/esp4WKThEO/G2Hd8Xbwbznu9ii9hhhaelF7xwMu3SM4Ei1c1lGL?=
 =?us-ascii?Q?ghKBvi6yTm31FFIp6vBlA3S2gyEhlczApQ5C0H3C0GCDhxtNr94ZzX+c2SQI?=
 =?us-ascii?Q?ujV9S3mqhBwU23GManw0PQfo8Zwuz72PzXsrIJnf/WB1mPh0NlUjMQdhKam1?=
 =?us-ascii?Q?7yQwoQUl+3jv2pd+X7xy14InzE0dAHr2U82SxZFZ49ByWIXImpCPn0vmCThR?=
 =?us-ascii?Q?tj8JO+qICu5DdQf0IYf9Crxksin++rPpcmG0iFFDI9U9AH9/ZXwWP91xo431?=
 =?us-ascii?Q?8xtsYRlsyaYt+Knh9poDU/5mnIXEPv9W6JW15y8NcRTJJRvvpV1SFsguKgo7?=
 =?us-ascii?Q?VPo9rc6mmhFTrZ1vukjuwlYb9UCDpUwpemcunT9C16UQ+AAzEu0g2YGX30Qg?=
 =?us-ascii?Q?rNXrj4gBC4mZW5deJVEIjqErbva2Q/kzR0L/RBNwnvhHUspyTNtc2p0kKpKb?=
 =?us-ascii?Q?B8eOMHxvfWv+YT6/0Lrz5lrQYXMBYxP+jvB/Q9OWp15LTbmV6dKNFxZ2EOV5?=
 =?us-ascii?Q?0292fSxiHAK2Tq6P0PayetL7BJ/q4bVDvJOuMWQ8CttEp7ixT2KTY3qKRPBK?=
 =?us-ascii?Q?uorNDZtkGDQATr+3U3p9OEC9pWPbXMMSKcXKZfZMJGvWCIFZ4/L7mBoAa6Wt?=
 =?us-ascii?Q?EtXNw1vmL6BWohpX/zXv1RPBwedUdS2lvXUklD6LqfOhBWSeVfuAvqd/M5Av?=
 =?us-ascii?Q?QDjMkuX5XsVlwDddbmRZYbsPYb6iQosSRx85guOlJz7T6qZuiy4oRprbupBk?=
 =?us-ascii?Q?iHGqLlNqwNOQEUEbCylFkGdIqaSCdGD6ZlHLHDuFA2TR2Ised6RYN+yVv4nF?=
 =?us-ascii?Q?1RzLyZTKq/Mj3liFvkl54tsPs+UxCKPJeHFBStRl0BRl45TdUCh2EElN3A+z?=
 =?us-ascii?Q?tPTOR8E1/K6hPqygIL5SMHEc8yyfBJA3OsqaT1JYRyG2qtN2qdl+OkxjpmJF?=
 =?us-ascii?Q?rLJOCwjzTTdtHBuyMHRTN2npsJOK/HpEzxl0YEFh4n/pXdU+TPbDVH0gNxST?=
 =?us-ascii?Q?btVYwujELDnmaGzXC4m5vsafdgjcD+i8oJBIdg/Z936z8LFYscqGAOWMV9Sq?=
 =?us-ascii?Q?zCh8En5t51WqYfDhTZMuDI+6fGNnr8e9Gv1NakOJY+vB6F6XQVPEHhBkmWkN?=
 =?us-ascii?Q?MmLvGKNW9V1izNBd/ABBdygip59DtvXbvEyYJjs7wsz4/WjLS3S/R1Hg/Uyo?=
 =?us-ascii?Q?nIrxRZP6s3o8BFKkxbtcMjtprokUOSS0ZhepE3AfJVughMD9ziGpXKtxwfGa?=
 =?us-ascii?Q?AsgMElmx3JyZO0ZUI4p8T8Rg9dfbH2/Kpp0HhJnnLlMLdPZoAh623hXPHisr?=
 =?us-ascii?Q?CjQW7EHEvcV00Okcffo6ywomFPa/9ymVCq/mwbFMw0O+PQUujfRxfYdTDY/D?=
 =?us-ascii?Q?cIqwYquZNrhO6P8M2Hwz6guSMpGal5b8TCoN2DdL/i7cBySL63tP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faccd0dc-db34-4c0a-fb9b-08df3b631ef9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:35:01.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDk07I0zb4XFE0fDcs/PPAnoHH26VOkt7I72aB06Gkoor0w10PVBmMD9ZQPCiTg3ekTS0xUOJU9lTNhnfsKN3kzJRaWhA2Wstxotetk4mBxHQdtAOxiBkMVivKnQZzoZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8158

On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> The Ethernet LEDs are physically on the carrier boards, but the
> VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> include their LED nodes. Other carriers therefore inherit LED definitions
> that may not match their wiring.

what's impact?

Frank
