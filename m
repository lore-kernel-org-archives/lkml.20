Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689516;
	b=H0PEyFmL5uNdUB1zo6O28Q/DxjTonjTOWxmZ2voGikDw+HjstGidXgDQRSeXg74b/HcP
	 /WUtEDEMWsAK8LTmpBvQausHR1FcfY6eqP88/VwP3Qhg3GPWPGttzGjc9d7SBoJGos5Bt
	 FB/mxP8apS3U7OTEB7CFHy7iBBLqIIi/wB8OqwQD3IsImX2JQpIApzJLmyop1E874Dm2u
	 lCJmqp64wBYS8udFXDE72RV6X0krhbG69OO3smemLR6s0Zr6xgvidiZiZi103lqfvJ6RT
	 1W9I7Y5qzPv/D3BlhyOEK1vuJGxuwY3wbX/uxhzcT5f8/6Cp5wdZ7WzyBAnmx0d3MuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689516;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
	b=KjQffLSv0RZXxdMQapwY9xTCTRUtXCSnI5+obnEv9czq5xb7cEeNsPZcA5DhILo48ogv
	 jY52OmcS7OwRsefBvlZhVzax1GgDQKGPnzqdbiwlBfeGUym366UFFgH5EM0IIp1W24dh7
	 ZstDxxzArL7d/WtzZBHOWr0lRTBQVR6yukSpSCPfGJkVBEAu3cOFJjETHH0S7/mESkwrj
	 5icK7YQhH+pKzi/PNgpbkkG7p6J9NjDVHiKhN+6uj3+VwxZMjNBT88I+l/Bo7UX8MM0Ad
	 PYLxY6IuLcPZx+L8pQLCg4QKSmfOVV/2EpNvK4uupLkqJRyG/IDhD/iQKDiCJViW4Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iGKOCH9R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28871606A332;
	Tue,  3 Nov 2026 07:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28871606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iGKOCH9R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm5F2lTVctJyAO48ssOi+RF1D4aA7jaSTZJ1hmrrDuO0q0rNGRWi841w8ZwsrtY3wHfDbbVTtnM2Eh9G7/QwAh7iLUA9MS+kANvIUkRNWupIW56e6v/OlItVtL8JMIzHCRbbcfwhcXvVhJzT2pgsSOe5uSBAt6/0/tuQisma9ySnHsURBE0J/pt1EP7bFYo3yFIxSISk2W+A29g+eysz/2gunf44QTsdIWhLk62SipiSizjXnwWNwl4N3qj9xrFyDqW8GnuE8/KZkOZVc9SxwT/B7tFOgBFPtl+PqxZT5c3w+pIImLrQVFjJTan0ZzFjYBMwvxNbPreqKL7mtZi/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=MVoomo3eMGuOm6wmiQ9WaTl51iCjFspQoSLgWZ2aPd7MIFQ4C0SJiLNZRUiLmYh/RE6xolFdCxRoVCOkERKVEbL4E/4F4guuRulBudFt73dW/gsiULrPhdD1RhQGhHeRPFGMkXx/dCpisYgmeox7CCNz3msnlxA953jrDlATjIvCiCAFhsoY4j3yeUTBZbP6Sl2rz3LEQQiJfR+nUKRoqV6o0ZvBmPyIo/UvkkYMFHIvY1UAQ0cxehrB3NjG9am2GcuWyHrPKIikPKbBIjcaF5AsuZtbhCJ3Bsy6vnxUtMEAh8PLG9hvS215MX+H0H2Q2WoU8nMeMFtAZJJlVMzgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYhCgpMj5R0+ZXu9d6uc+NzpcXPNcCCGom3lvzuvjyc=;
 b=iGKOCH9RGJwWCbnaCqADx+OK0o4GhtdUvDiyXJc6KEiGwqiVkmEJRwD4Qh/ARlPSQ4Wl7ozv8FlKlsBemvVslCk+Nlf/Jq9CF/7n2Gv6x1o3JVI82SqbhfXHzLv2raFfEfJXGXR0wnekXAaqAteEu1jr0iA+6i4bWzQHvldp4gwi98zS2j/1xaH7cUQyi+sZiCNvE5swo5bYRzFquovsZH2ckA6d8Ib3JPK/pebzfavAO6/jDDAGdEaDut+tzD0ZXoYEYZAy+dCAbJijxt2+oVQnpRo/79MUsmBknIUGzpEPdW1zIlXe/eMe5BbCRGhb78nAcsuB0NLbL6KWUllsiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by MRWPR04MB11518.eurprd04.prod.outlook.com
 (2603:10a6:501:74::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:05:13 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:05:13 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO add-on board
Date: Tue,  3 Nov 2026 16:04:33 +0900
Message-ID: <20261103070433.2307145-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0129.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|MRWPR04MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a920d5d-4ec8-4eb7-bf39-08df3978ce4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|19092799006|1800799024|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	HIIzkYV4DV615r0bcFoKSSGUfcoAZdr6T/Ee7Fih0CtQ+sipwWgXwAC5Xte+BSVDimXyX/znQ/CBAz5ajt+Fjh/6lNFPBk8AaRFoimFIlsKvNZfy+JyXGZ/TgsFb7Q+eX62jczEXbbr/HGYGc0JIKOVxIGIfFdlYrmyYe9BEMSFLD75CHfi6tCFUrDhFNP4GG2UFVjdJYf1HCjv2p/CY31g9ekngy3T4xauDHEozrHEtQNNpYo/RQlpAMYMVYsMU2lEx0gBpotV0fITXMQvOQ0BITvQMqUXonCzUjwfL7AyRnCWj//V7Xl5h7e7uCJK14BrQgDGaph7ce55lphAWDhyy2m+XQYIny5YSPLJ5Da4yD9FIC4IuzsnWjMXdR4tl/dE/TXRF8I8wVWKZRc4eHXa4nCJRKhbKGHqyM5OmbzfK/+wgQUFa5MvNHu8uWo20FjRVsLneGEWoHqVCv/1i76+5fBx5Gcoljc6t6MVrzRXenkq/Ps+S8ckFARL164ITGHMgNXbW+uNZeAfOyrz4dAVma4DuNhWlOmf2uq/LUegX5jrnxPzjt3hiRqI7AJigkSqfX4oqxXRPHR//d7vZKztSOotMseaI69DYp2iG5YuUWPM9NTXFck1/gdFVpMBekSwkXxXyK4IFPtxsCFk37GlHqGdUttuQM6/TpbW6BbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(19092799006)(1800799024)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8RUMeVn7VLhdgxaQlpEY6CPaQ2WGJEEEzAEcGzlpG5Lu59rajrwxAuX4y4qt?=
 =?us-ascii?Q?3j+ui2sR+hvjWCMtA6V3/f+BZ6bymJSxqdPCTQ9MWtvH0qdVmEGUm7fSG/Bk?=
 =?us-ascii?Q?xGKX8u571wA4pZk+pg13FkY9AMHB6S47EXkEnClAMF3HJqIaJcQP0btG9x1x?=
 =?us-ascii?Q?b7/tTTy3PJdJNuif4f7EVMRI15b+6WdwSnH+KTKxhy0JoDuWO8zZQB3BswV5?=
 =?us-ascii?Q?r8g0oc3pobY+qpepEafhaevJw3vCsuJx9tPRwUNYaugcqUXCTJD2nCKpC0vk?=
 =?us-ascii?Q?j83hyQGdjk4g8ixRQCqkGWdrCEpjr3KPRxPohzHOl8wHpZgRjZf42UZ1bOZW?=
 =?us-ascii?Q?9xL3KpcUuFMD/ZOjvKYSjEVciH+a22JsreB/wNAdlRcd12NLvzXCW4NJybgD?=
 =?us-ascii?Q?jn8hOcL60rkvdJxcizKBAm2dI9xYkwm2XS6CgRObPog3HJotBic99V3UOAuW?=
 =?us-ascii?Q?Tlzf6kmk3xJRmDm4TBAwkd0qa5MKVfUaw3OdL6wB9EStXb5sk1O4PgHVf1bB?=
 =?us-ascii?Q?+cBffLIkvNnXdcNEtY1LeufWwNrXzqQ5TGfh9gSJ3rnqNaAnuGeBA2eFfr2G?=
 =?us-ascii?Q?zxdyvHut7mMCQl9PU6RxnGBLFpw46szpx0y0uec86EMrD0fI2c9bhvqvAUlI?=
 =?us-ascii?Q?WWw3vMpSP7FqFO0UCbzdeZekWbW/eCuKch4QpX8JVoBwcj2r8L6jL5w5KETr?=
 =?us-ascii?Q?IdTY1IsXrUyat203yaNFvLvsQc/NRmFs7+g8s5OzdO441DE1jc48BHY2ytRx?=
 =?us-ascii?Q?EXbeKWp+RHKRTExcM1wdR7XkBRfRZ1N9Ozk0dShgfp8RpDTQMlydBUqQztTP?=
 =?us-ascii?Q?xZTjsuiktKKRPezM9ZEAAyHXQdyVk79T8PUaaITMj8bSHZxGbwm2D8qDNMEF?=
 =?us-ascii?Q?949fD3Yxut7DqdofjmuvQZPxccEdhBgjGnNf5G6LL3hgD/TNj+HWl8KLqaPu?=
 =?us-ascii?Q?UEYEEtpSxEOB4pqByGGAAafrRZQIbzhDosW9mFLrWie8q8f30XydWCyvCtNG?=
 =?us-ascii?Q?J9dqFB4U0gLf6Q3nDYWY7PqQHdkD6cU4JgB9bvZ4pP4ceOb7ZCxDeqrK7Kwl?=
 =?us-ascii?Q?slngEmnV0k78ACf88Yc1xcCcD0hdHvBklcA7YgWM8bYTbAMMuf5rlirq7ehW?=
 =?us-ascii?Q?bDeO0MaRbEKNmnzG/OFU22ZtnnN1YSZdzZ2q+1+QPm7JB1vsKy7UQf8zDSRT?=
 =?us-ascii?Q?8Vn/OvtytgkpN2DYGBiK+sDbuIt20gAgZvC/83gQQun+n02GrhhPLmWRDnoA?=
 =?us-ascii?Q?chJEFhk9cxB5SFsZ8Rp6Tmj12Nu4QLjnRYyoXAU/SoWPZfhB9K/OkUa4cTaa?=
 =?us-ascii?Q?HEIo1uDXT85Fzq+BZwdEsK71IeRmzv+hmMihQv7V3v7azijkeqlPR6/I8ZHE?=
 =?us-ascii?Q?o6c7bURYWIjzt7V4hyqDW+P0m+q100FDv2LZXHVaB0WWQGJPAv/9VImJ91tv?=
 =?us-ascii?Q?5ybJ40zkXluhX5MsAvnKSiRkfvAQvvNtValTo4HBfJxCSY1OM6OZGjFyODpr?=
 =?us-ascii?Q?LuCWlHivie5bAKgEb6lbC2IB+Wk3zEZTi1LKwCufWGnSv/qq4tXaeJ28yawk?=
 =?us-ascii?Q?WhkbkHf1iNRydJpcoWOGRy0/NJX0l0Olp10QFLq6TqLz4fe2nt7tyCNEVuNr?=
 =?us-ascii?Q?4uaXyVhC0ElmlW2kgMSP+7kXTCB0OdgIAKe6ewGiwvT3bi6ayhavAG2hysfu?=
 =?us-ascii?Q?apDPql/a0KxAAMpxp4Jdc6KNu226eorINF9pRXudpHwDBxIbZJkehwDVtdKk?=
 =?us-ascii?Q?ja/BubgwsMWsxTHj3MjbwbE76Oyl1vAM7rJqc7IRRkbQitDrRh7P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a920d5d-4ec8-4eb7-bf39-08df3978ce4e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:05:13.1532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9v6bkIwgXFdHTV8xh2mUHWa1uPqJv5hTdmyOtkMNj5ULhVAfBP+VBIvUqt0fbYAhs9vd0COQTmKxoKKVIfnBaqXycw0lNNff3Yag84mgSj6UuAc0riggbMALie2L9oT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11518

From: Chancel Liu <chancel.liu@nxp.com>

Add common DTS overlay for the IMX-AUD-IO add-on board[1] which
connects to the base board through a fsl,aud-io-slot connector.

This board features a CS42888 codec providing 2 microphone inputs, 2
line inputs and 6 channels audio output capability.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 57 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..aaf546cec0c8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -994,6 +994,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-mqs.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+imx95-19x19-evk-aud-io-dtbs += imx95-19x19-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-aud-io.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
@@ -1001,6 +1003,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
 imx952-evk-mqs-dtbs += imx952-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk-mqs.dtb
+imx952-evk-aud-io-dtbs += imx952-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-aud-io.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-frdm.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx-aud-io.dtso b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
new file mode 100644
index 000000000000..311b7f984576
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Device Tree for the IMX-AUD-IO add-on board[1].
+ * It connects to the base board through an AUD-IO slot.
+ *
+ * [1]https://www.nxp.com/part/IMX-AUD-IO
+ *
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	aud-io-sound-cs42888 {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-cs42888";
+
+		pri-dai-link {
+			link-name = "cs42888";
+			format = "i2s";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&audio_io_codec>;
+			};
+
+			cpu {
+				sound-dai = <&aud_io_cpu>;
+			};
+		};
+	};
+};
+
+&aud_io_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_io_codec: codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&aud_io_slot 0>;
+		clock-names = "mclk";
+		VA-supply = <&aud_io_reg_5v>;
+		VD-supply = <&aud_io_reg_3v3>;
+		VLS-supply = <&aud_io_reg_1v8>;
+		VLC-supply = <&aud_io_reg_1v8>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&aud_io_slot 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud_io_cpu {
+	status = "okay";
+};
-- 
2.50.1

