Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793708712;
	b=tYnmcAvRbz0eW+S4+VYDhilaQd9sZ1QGOVZILc9BzcnFjd8sgdBKO+3ZQ9xWpUUxm7FQ
	 lwJGyMNyw9f6nywNl0tkcuXZFk5SyLBxQ25XgYriVVTiWjEKe+sGyykCC+lqppiIP31C1
	 +4aau3tFmY3btUcP7jTHw6Rx6crOoSLR/KDZHyYcJj5q4uMGy9DtvZ3tUvx4lhwUiDv93
	 smkHgXWlWcPVurXtVBordHSsozl5oEenzTZT2uQG/RD+H2Qg/imHIZb2lGezbbuVCgWhQ
	 WZKgyD13GFXS7+n2Vt2E+159CPPy7DyEfXywf5EJNsjTtKjdBhwMt9v6X1Sfxvy7mZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708712;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
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
	bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=;
	b=Gw+7dYChIHt2B1dqS4OKiTYbriUpCMLKe9jT6BO2Uz95oWzduoWTHGtm2uOLNRY5gIpE
	 cnFkCG7oi2RpdkTokLF16snqKaNcoLOm8EgK+TAsidoPyc8iuUanRLd1J86jvh5zvnmP5
	 I8JhShULbgYH7l1jnLt0CQ4ea/DUo0dyXzj/hpfU16T6eDKQ5Y13V9K3EhnOR78Wt5kyA
	 lahZI3gL6LYLVzQn70tK3bTm76KWG5aMemULEXNat0YCuL9csVv3v5IeaaQLmrbfhnlDi
	 C5WSTvRcZ3PpNqLygABNoNmapoz0CfiAXDWwK+c8W6k54XXT+VOGqugVHoGJcqQGyzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WK8JvXXE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39528606A327;
	Tue,  3 Nov 2026 12:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39528606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WK8JvXXE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc4DE8ko/pjLwh/IzI8OWLXpFhjg1+Er9or11pMzSWNl6tGB3cf1YdKLoF7fX//CaA8XWwi//1n+7Fri8JTqwqaMnkMYMYk8k1vAPJFzoNJ85FYiw+GjCJnRgryn196dcSl020JU4Kwnn195sBsWdnFMELj/Tc588rm5nhzLLuqcX4142RSSrLUdVY6bitqjsCT1ZoL472EWqlHea+uPRU47/gGVbyx8262jsQaa9eDlQP9voyTuRGlZIDsTZsxpfyNu/C4k1jJv46otnfcD3V2Oa0f2q8kJ0JoG1a0lxCsrQTASOPypD1qMKJyO+P00aRSHhz5CqX6ZSYOU+vt9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=;
 b=v3gRLXg03Q0RPLyVvdY3MszXeQDNRyMtXVSDAaw1anw/qmJxHT8ErJFAWxp25yX4GBR/tsS9++xLa8Lkexe17wR+mKORP5sKS6JsA9KN5r8Pvc63PXZK0IwmMQxn0afAgEt406tCIYJgY4guUjw01j6ap0WQZTw8Sy8IdeiT0EZsxVZUdYzsgOm6X52dakX4+tPKXyg5NyLGhH49XZCZkEDd4fKxtUV1jsW6c8CwePaYDcK7tSlfnafZwNGzifoOmBJnSdnaAvdfQ6C4JJcbqhCjWqbhjnRyjzVvevv5qdx/zeyfnfR2YwunIXBwhl9cmIsk/Eo35wU8HroTpRB2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ta4dcBhs/BE0JAs8+0TDhtMOaA6e5pfXdxY5ldrMjk=;
 b=WK8JvXXEPFTQ4YaJfIorS0WZm8/GRvf9KO0JzuAjkaw7PHZ+QeKlQi0WbWBeak3G9JyEwzGq/5ZLDRUHDjXE0lXQq/h/0hS7n+mMueDsmWWfDbIRhJrQf8hNSdKoiu+eFjoxpAZNVdKSLoP67y5IJyg4F0D7afXA9cHapVJxpB7dGkp0bGNa7Op4bOoD7t1/XQ/xis9baMDKUvyryH36thnNsvwuPW8SaWQRrDz+6PcaY1Jg09jKNm3yu3t4Agvl2TS+RclwGaH+hIMlWG2hsx4vWyaa9e+HSRP81xkUQqMLZmVBuk7Z4DqYQ3YYB795ixIiKV2HRGAYebgpExzVjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by PA1PR04MB12223.eurprd04.prod.outlook.com
 (2603:10a6:102:55f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 12:25:07 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:25:07 +0000
Date: Tue, 3 Nov 2026 14:25:02 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR
 always enabled
Message-ID: <aunOT21BZmGkJQ25@vm>
References: <20261103105323.2394012-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103105323.2394012-1-francesco@dolcini.it>
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|PA1PR04MB12223:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d9d82d-d46b-4c43-f619-08df39a57eae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|1800799024|376014|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	foLfAuSP6jiQaXNiadCspgT5BbR45zK8DtdcX9Srp81gX1q+dIrBgFFUQPoaWcAirKswDJIijH+yoKtGky2wXSU5uswDjd5jTdr73VXCL39zixdm9gP9Q44XJmwYytn0o7/DMnfUXDtImQT7Dxv/cVmLsypvGNGvrMqTci7jEJNja35CKUpRhbvi1RZrqeyfRBvqct+OtWvdRqbEXRVmeZ2jHBHA2UBWQAZGmJ97ZvZIwPDPl8A5vWgPyAav0L5k9k6qyPSWMjt56LDXWUGCdgSBoh2FEHXUF3mTue9seLSBAXXmPL5eYzmECnneDdZxA/6vmpXUZEtexp16NJHbDVaXpBODW88tGQbbv++dPcCEY+4QbvZoxscNrzfmjuUk4oiQcYygQfpGL5YQgPo+s35qdpzA9NcILv7z36SWgxc74KvnlnUUTl7KnRx/Vk5NfUCJmCHuic5+gUo2OyxS7OyWoLA10datBePJZOYpx9MVhZS2Ah6wrUGs1ZRhCln8o/SmdMTlzObFGfb/9khTWlzJiGZvKp/nyGioHpQWo2cWPpIh4CrQ1xPloepKtWlXynFVbzfyVz9JxavVgX+1xAlmJEOcBjPCsbsTBQrqJzBvRTWJlEJZzx/12749/LwLEtgRSUTR4ccEtGRgyxSPQcCdVat9KZZfqRxzPjBSXDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(1800799024)(376014)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aWksfYNK9jcRaYcrFsntdQDxn4Bb4HP8hn5QYR5eWdcgJ3DHn0qCTNYDQjvr?=
 =?us-ascii?Q?9HQjqWnqHlgnuFUGG4ATXvTfnTIB7CGqBHT7CcBhU7nRTsCFquHbsZj/XnW1?=
 =?us-ascii?Q?YXLv1byOENRYwBN/P83Y1kabMZv5co6oPEGyrWMb4Ows5fHiNL2bY33WXwYq?=
 =?us-ascii?Q?ySpkhReWYpOL5SM7elphyTtLsSuRjA8Fdf/PughTpnMEsUDZr4umRw5PVH+9?=
 =?us-ascii?Q?vhvdjmc9t0WH7fdxqnBpQHubg6lXcp3Sq+2Q1ONf6Jna4KQb6WO1dl7zCCWu?=
 =?us-ascii?Q?or1rpPBXJWZrpJwNHJthv0vPEul/B0tQddMeqk+mbaiKTJwb//szuKlzVSF8?=
 =?us-ascii?Q?8WM6GC4uq+SqFddvgXcpN3KPW+wMSIvBekkF6NGeytwiLDG7F/J9LlI/Sh1g?=
 =?us-ascii?Q?uJlEIOornUi3v1ZRgoix5Fy+upoglcC1cWyv4OD7pCDluXz4JF9b9Yf9PJOr?=
 =?us-ascii?Q?nEkfZQO7mC9suHmhtY67mbqPb+4AqWpZ/MALwFdGsFf9VLRwXkHd3egiYsBe?=
 =?us-ascii?Q?FeRQNxs2AaClrriWV5Gh/S+JTnfpvKKdLMtpdLiIg02MeMbFea21pEaSk8lU?=
 =?us-ascii?Q?aTgdHWyXO+RxRgy7xHzfvMeW2hf/7G3nl3tnZLh71uwc1/O9gvnM/gvkR7LE?=
 =?us-ascii?Q?Dp5Y5cK0EKYjV7zjckZGiIEl2GbkEp/a8wGaTRPFldv2LMbJKQqgfS2NjGuN?=
 =?us-ascii?Q?rMCzOght4BbgOuMC99MyN8m1oNyHo2dVJGF/LaTd706fDyTLDm5DRNlGTeNU?=
 =?us-ascii?Q?PTZJQZNqPgYO7aHPeP2yHFBdg6jbBPI7sARKoR8rRfQP0BTyvfjZUoHEB7J1?=
 =?us-ascii?Q?15U+4LesOwcU2ObQTHzDDXNLRy+jzylmlenvRcKtid1yG9ym759wEdRSIupu?=
 =?us-ascii?Q?ZbvJhRFMKAgxyY55EEZI3ozAL4YvsjbRLdNOoCIfLlaFl/7xp8yyWRsgwfrF?=
 =?us-ascii?Q?zMOwXdLXbFgImONBMAkEF2dnt42RZ4MZS1eFd5k8/Xqa9hreTWhGJQ9fHgcT?=
 =?us-ascii?Q?3NF9YmOW7qq/LWF4Bujt73/LcKjC9soWpWZDSyJp9T7iaRZsUQRXG5SPcSgL?=
 =?us-ascii?Q?IXYOqmNVrCF9+5axtXl2VfcO6txdVNfepzp/mN8udFb1qfIIYr/F6ky0LfDS?=
 =?us-ascii?Q?uHYaZVh9SU2flgb19/FI6XK410tTRyJs4QaIPeDhak3tvOPi6+zGH19dgC9Y?=
 =?us-ascii?Q?9rfC51UW7rHTLabzvNp1NHdpQo90D/xCsX6pOAidnLPGAkFqHLo2qB4u24jA?=
 =?us-ascii?Q?LYWvdsZBwDIZCXtF/bnHB0irk5tWdE8VlpQyl+EpU3zQI/DTKW1g+norvE/0?=
 =?us-ascii?Q?moaL9xMxFdbFFig4HdM6aWdGEHf1u3ttgTkO8+DyaL+qQQh7i+SeOitxYzBT?=
 =?us-ascii?Q?IkTy3toejKWtza4SEPIVnU3ccBUm8EsASQM+ykeVakBfEwLfJOVhZjcfGSjP?=
 =?us-ascii?Q?fo9wL1QPDSLnJFiMKfUF9fyIUgLgyiCUjbKEaXLbBQ4DFE3/IRdsTuhsW5T6?=
 =?us-ascii?Q?ehaYy3dIfvECcNX9VvkmxnKHQMm1YKogpHmokkM3vZzrcqSM7JtGOJX9m0dU?=
 =?us-ascii?Q?oXbPqviXtoFKngVRaPTkDB8KagW8znfkHNQ4OpmoiT/IAwHyqOPj59gG5nj6?=
 =?us-ascii?Q?49MwqHbQdTL4xno6WZh2V6ZlKdIGrRxOPUs1jRLHj75/fUvKdYd0MYt5qMTe?=
 =?us-ascii?Q?Btss5/v+OWjvAt36pXUEF+aVdPt29CmA6BR9utbQfiFOY8AgKIFzB0V1H5+m?=
 =?us-ascii?Q?J6qJ3+ghZYOe4QhdpwrJxmM+83O4fOA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9d82d-d46b-4c43-f619-08df39a57eae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:25:07.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GzTteWx50zLt4J/Q1IybDD4OMeYPQMQAuKal8MAksrPXROR2P9ntFup71c5UHczFFZzyvHGwvbEdWiduI9RMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12223

Hi Francesco,

On Tue, Nov 03, 2026 at 11:53:14AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> DP_PWR on the DisplayPort connector powers active DP cables and
> adapters, which do not work without it. Keep it always enabled, and mark
> it boot-on so that the firmware, e.g. U-Boot, enables it at boot,

I believe this "mark it boot-on so that the firmware, e.g. U-Boot,
enables it at boot" sentence is a bit misleading. AFAIK, u-boot does not
parse the kernel dtb to see which regulators need to be enabled. The
'regulator-boot-on' property in kernel dtb regulator node simply
indicates that this regulator was left ON by the bootloader (see
Documentation/devicetree/bindings/regulator/regulator.yaml). If your
goal is to have the regulator enabled by u-boot, I believe you need to
add that in u-boot dtb as well.

Consider updating the commit messages on both patches accordingly.

-- 
Thanks,
Laurentiu
