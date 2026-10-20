Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478637;
	b=o5Fk97A8PiIwsgu6wD4lTzOxi0k+WG8NwVho81l1cxvC7qMouLCbv5dGNSEe3NUZDf6J
	 cNj4HjL7odoxLLBcnNgD9rEDSkZzvYWfP96vnnefAkM8k2KWK2Gy20wuZau/nEbXvnp/R
	 dnatjHvGcb7vqP6hOmdyni/DyAdn3dF0MO+7sO7HTF2SuTTUzKruipo6Q/J2fb42lzkSV
	 iTHypslNqf1++hkU2j3c7bn+HZ9Ij4+EzzKPg+RAeQy0Gb9gCZ7x608HVRuTejLJBD1pR
	 XvDH9IYV5csGVBOQCLz0GjfirNoruN4D4yYDybLCxyoVb8w1kzSstWwd2U6KejgjqSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478637;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=xN/3Jdi8FY6RuKdOtlG51FEKkTBbYN1jM/uQXtbGoqk=;
	b=JpVmArk5cPewiLfi/xp+oNsyYVuTakxAHMvxilxtP8L6P8HcMUOssmWYSbV5JqRtIekY
	 VUntgrAHtdk+ba+xIQyXiK7BS+6a4MQUipYlwqk1qtTwC91LnHVQkH70O3VlYKkwttXir
	 zjd1FdsPFa74XESWx8+EDbVvAUmOpbVtPq3b761NC4SpG5zBs6Pmuyqhb9rIsocDAfSIU
	 i/kXfVN8foKd0jmuyIdmv3uj7QLXma5SrTn5SeIiuL/TW7Hix5UttJ9QkHGeZsP9akcmL
	 TbrvOgndOpI5uUAoj9Vc5ylraQIZcFHZDubzwCG8bY/1eNfuGsbLwvhgPUOksU0B5BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vfQuVgo6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.44
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF8606A322;
	Tue, 20 Oct 2026 06:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AF8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vfQuVgo6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyX9AwrNZSMzbtcuGiSG34hfcYb2DFI99tzFlZsW5GZrevgq62N3j2krwWqgl8Ie9GvosjAZYlOGR7JUdGjKXaptCzxJ3ge4CqRS5V9SdigebElYfWxw5q4BmdyRYJPQK4PIAp0cJeVx7NqZejS1KMlaqkUGaZ7Sp/M2ZzCRr3wkzPm7j+z5ircMNq9/yKVK+BJGhswB3CzCkEdndc5c2h/4oz9bztVAU8FPpvhHEVABH94ufiRe7vBlyYOWD+DKfEplnJRE59l+BTJ2AzqYvn3dcX2uYt/qny56XLWZ4jsbc/hxl8liLKp7PIAE0oW1TS1LJCeNLvjeuyJuGSctlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xN/3Jdi8FY6RuKdOtlG51FEKkTBbYN1jM/uQXtbGoqk=;
 b=w09VzdJVjxMMgo0YtvC5P420imBc/3yWmtfoocBfhwpH9UNR5Dzh+Kw5oq3C+pMP1q+By/tpEu3ItvFGWqLDUyTBLduiR/fe/q6+uEcFTcstWjHpUhmlLzMK+JeOgtvkMoOXJLBkBqrCWm3ndeBUDp89HgWkkqG5nebt6Th3qomu6JqbK15gzx2qsv7/imtr37FvQTWqUul8teVTqMnjgMACDsJjq6AHvAEjh5etJHVPeJ7ed59e7LYbOv7SICD1etGu6Zm+nVH48K9v/b+gUUrLDqyynuh+14s4OWRbfMRbfteBFZFzSJ7Fu3qtgx25jHNaGtFkf2FHPhvJKzEBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN/3Jdi8FY6RuKdOtlG51FEKkTBbYN1jM/uQXtbGoqk=;
 b=vfQuVgo6CKzCC8A0okZ4uJQ8ghnQB4hNE73wy8oBVQKZir3NFI7XDv/RVKJc4N4wREBt2aQzhZ0pvuwTuVHfQUlSVJO29E/XHbmDUT47eb28z4gz3mWx6zb/s7Pxciy8ldqtXKKrzpCIOaHGCE21OuYtTaLVVl9W+kMCGaaVml+OHwuN1oPDZQuvwERATLMBpD/5EH/omVVj6xbZbI5yrw6S1PsS9RiFUK9hWE6eRqIFq/gipTvkktU9yi3Cxa7Bmw63xfkVLh0NQnSk6D/NFM8D8nHQq5KysxotaReDPPAXNoN0Yd8V9ZfxuIamxkIUCvcIKLV1THIdrq7d/nwYjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 06:43:52 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 06:43:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Tue, 20 Oct 2026 14:41:04 +0800
Message-ID: <20261020064106.197223-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6ca695-5982-4abd-aade-08df2e7580d4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
 GQ6tqis8pb4d4tC8uy51B7NWonbX5l9wOFRlTiyL0hWxaZzgzjsQmGXPSJgxR61S8R9gmLlT+/qa2Cj5eu3ERCgBVUbpJQbEFfe1A5uw34YnQoO5mlVB2hBASwlgqbo0zsQa0tjTtH958rbv728dY5PXTUZqvFpW59U5EkKR5n9zkPMHIoOy7YQpnxvEfClGWBUbMN1fcYEfWqGS+IxKvk+bs7r5bhuTN7or8HQDM5tKMtEPYRhp/DS357/a0F3OtsRwu8v2+/VDZAJDGO0R0AsUtPxXsjnGCuZim7ytjVs2fP+qLGcAnJQFVH+mDP+t3bfcCgqbzY3rPQ9RsKfMRZsUCh1ZqIBc/yk4E1gqqjzsx0uAg1w4hxlW8Vg0G2m4cfmBFyLWm6h/Vy9aDxD2d7AFzqE0Za0uF+B3642GjmDAaJrtBL8D4PFkyx//e/tv+ONINMbSk8f7mC9AXeSIO7IoJt3xN6gPpakvCvLzFjL7pQdxmAUQECVqqQvz0S6OdU8K2g3YBSaOVhXeTTxdx+oAhKMreibauurmtfpsWqC3ipIEpY6y8YpiVKpWipNvQlpr3CYKn49jJWMyO/bTZls3xKTXhf9Y/+qh4X6KsWn65KGnSILpjF72qr5tH/+aRq53fsgA8gxGX4BTyeg+LmO6zfGOozOqaKw16sehK2s=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?hjLoUpaJuZNhYzt4pPzlUiWUqZQVheSirGwn7rAcV6bztYHv8Wqahws8v2o/?=
 =?us-ascii?Q?mvCZjMrE6HwxznUAgHJRAQDd9SYzKqT+ocM9baBLcnn/F29VbUiU/bfNEnmQ?=
 =?us-ascii?Q?5huN6LXqwH0a/PcHLWWhQY2QDnlPMxYQ4/LNw/mX/Evzf6doUgQgfr/XweO+?=
 =?us-ascii?Q?V1eGETGXAZ5b9EolC/ZtKfeuT9HtUCxE9uf1TUYtkEs82hSCTLg04HcLX2FH?=
 =?us-ascii?Q?Skzu8X4vD13Zocg36qt1YIusLH6g9JZSIFVxpeFZKugXo4SwyJTgetdqxMVm?=
 =?us-ascii?Q?jlXonvItVhV5BJDjXN5ZBNyJe/EPKgjXH9UiNdUSnPUTTDnMfTPzJKJYuXTz?=
 =?us-ascii?Q?1OZRL9tHnpYH5bdB4oZ/e+KQjXrl9cRN5Pi7c6AJPHlHT+HW8rfaSAILgziK?=
 =?us-ascii?Q?MOhYezpJO7+ouBedKNbJlLgY0FGA/oSwdods/wutyKHM9+UZTa0jwxYpljd9?=
 =?us-ascii?Q?sPocL/nheE2IYCBgbumNamORm2kZcCd1iBqg+G/r/2lka6LHDm9d7ONG5VSP?=
 =?us-ascii?Q?kNuhpJ8oLMi3XJoFHvOhkzRGzUE5o2m83Zy0CxfHkOlTpu2swKqpGz1yWJCv?=
 =?us-ascii?Q?6d7Y534PBrv4eJZGJlbiscpQLOucoY58e8pV6M48OTzwh88cQP6eQpVbKFpn?=
 =?us-ascii?Q?s1AN7Qd13oCdYV62J64+4/mvJ0afXXi5wsIqdEoKeFlM9p+xthRFxWSoo23r?=
 =?us-ascii?Q?YSH/WNEk4ApDG9FNDkEWk7Vx0cwBn2XvNqHAzYfEZD2bVjhzNvYsF6TPNmKf?=
 =?us-ascii?Q?v5tRsYktjqiZ0mlYzk7RfqawM6qURdYIVFPLtfpC+HnfGG2k049lkI3RZ5Hk?=
 =?us-ascii?Q?28O54NczNs8ctYRu1wZwvC9uICc3UPnLOlR1FpLBhE6fHA7cMvpF7mG0kUoN?=
 =?us-ascii?Q?RgpfpHXCTDkPA74BVPmrweQDiBVGLN8bylDqCBTGd7MJXexEarEsXxRTmhld?=
 =?us-ascii?Q?TNjVd3p51OOCN6rQONgxgMmMeZzcofe6dEDpLqofe+9mfqJJLgP6XHgKJEmJ?=
 =?us-ascii?Q?K/qE7BuZA3dH/LPGpwM7DUALeuqqeFeXAVZFP7Y/Wx5/qp9MlgSxlihXWE81?=
 =?us-ascii?Q?4zHXxvin8ac7s+aeoL8Pv9iPxn3YeQUhImNHZpwYVfq1peefDoL3++E0EKGj?=
 =?us-ascii?Q?bXG21xTPXxUBOQoX2IyuMc0HWmfGKZdWmr2EWGA3zFUD4K9OvKe3rdEfgq4t?=
 =?us-ascii?Q?NnHNFhO9U4LHuVcjc61tutVpDP5ycr0G6NExPHLhbIIhT1nXC+lGC8xrib6I?=
 =?us-ascii?Q?gcDw0LHlWD5k9I3mCaaz0u39B4r+9jeXY6n63Q1INzbspWV59PSxRnN/pwC8?=
 =?us-ascii?Q?ksA3REa0iUGPooFSrNzfCChlrF2ywQYe7mGxLpnXtFjeN01lT2/agBC0XKNS?=
 =?us-ascii?Q?+CVLoo+weQUEQFppeJ8rq+S69pw+Z22qKUkQ47BBFIF5tlDXSIdJR7LH6C+E?=
 =?us-ascii?Q?b27IdC9YuFW4vzdkeTfTe7ZH5Bi9I8TK70tutEfXP26EY+MWdCuNWDEzteJ7?=
 =?us-ascii?Q?pGH8/sXHCEEPe2rmiD+8Xf/zHniwIqIE6sHVYr7FajMWwvxUTt0j7O7BiStu?=
 =?us-ascii?Q?+rxiFssDonBj6OdKYM06YHCumj4ZFYr0N/01xoWxOJ+Cedzqe1Z2AYYVxtUI?=
 =?us-ascii?Q?qcwJhgTd4qPtxZ+nJ8V+jwjVKB54a2m0DOHS95C/jbxV91uT67OliE5AJ/nT?=
 =?us-ascii?Q?VoCzmJ3pDbiTDs6JIDYJPICaBQTzGobdd8pH1vZGH5MTPt8l+0ByAQe/L2nX?=
 =?us-ascii?Q?VhOv3tVfZWZL4aUwXW3LlrokR8Txu7pCh0+HhUnWvbz0Ez3Hisln?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6ca695-5982-4abd-aade-08df2e7580d4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:43:51.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8Er/KdVRbvNs6ZaegCL8M1G1nCdyb7E2rlaQkcQnSad23wMxZ8r5osczU2bAQR54uE2DCkDh+tiWGs+WqqywpaIiSRGE2IXbBmegZAZKymjCn6KTjvJRmckSrLxN7it
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

On Sun, 18 Oct 2026 14:32:23 +0200 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:

> The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> Symphony carrier boards, are missing the open-drain flag.
> 
> This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> match the I2C bus requirements and avoid the warning emitted when the
> I2C core enforces open-drain operation on SCL.
> 
> Stefano Radaelli (4):
>   arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
>   arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
>     drain
>   arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
>   arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
>     drain
> 
>  arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
>  arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
>  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
>  arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 

LGTM:

Reviewed-by: Peng Fan <peng.fan@nxp.com>

BTW: Do you need fixes tag?
