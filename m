Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794280492;
	b=vv+vG97ohLtMC7hTIIIDjXaezusR0CD1j+6H/z2hSv1iUYGkL+fzy1pmUVd6A7GW4GHZ
	 MVNqmpw3wehEemzUMmG/M/I1YZ80veJLm5HNg7stCUjHR46DPcpWxeo580pBzT8EcnpvO
	 kVJDA293IYB6v39qTiUjPHsrJ32F7+jE+81yA6z/Mfjz161Lubuq9WIZ3e19EDDC8crTk
	 MJuh5+uNznad+sBqPt0BLHC+JrEDEqlzYa5r4Gg2UKPadhUMZC7E9XQKJrQR+OmYpR8hB
	 Ean9nP4WELxrqBZ0olddY/79obSbsgasaL+W4Y93KNW08lHgdWQbiENuNlf5AIKbNAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280492;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
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
	bh=10bXjumd4aYRm5KnqRRDDbg7QCzoBbS3+a68vxw6Ngw=;
	b=zVLnY+R+KfomsVVJfYlxeXbgGSyMNKN5zroDSrCq/sqIeMOJsYNYdW7XO4jWSejViwdo
	 EVQ80tp/fXFv88BEA/fZOwvZ22q6FzmD/3zfYZi4Fn8x5L5f441jd0C8f/Q6TmEhkyTl/
	 XZeBgZuF77nPQOLCrgGpKY73cf9phjxLdOqpLrCBTdJz1Btu55FWJpXFVZu9LodZIK38u
	 +7/CkMJa9Z1hmLpshvcEPdaafrz+1VvjxhTOsT87K9jnCH9qEMbvs6T8qTWVtiiBB3UCG
	 JcmeE+LPidU9yCHbL9MlucPwn4s7VC511/Hd/6Dy06cvJGTSI7GbasnRDCGmg8/betg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=skiOgzVN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.17
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F5606A321;
	Tue, 10 Nov 2026 03:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=skiOgzVN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpNUvhwShOKRk4EbthCSRW/XO/5ejZAhN0aHZa/PY7MqDEAUvgNZ5vGtptcleqaLH7hmA6rrYZi7I5AqoCbt+Xl9/BxwCup9nMSxWE+PX5fFMtQmEeU7SHPMeQgT1oaO92YwqgvIZ1Zofb4ubQ65tIZgLWD5CZScNLsJDB2QI0eKiVI6pu5vAR8UrvaAQPzpoCwy9k009ldfJnqWiwfG8QZiRHGfiOQMhLZPOI1lcsRMmJ3KpBBsXi9x7md1cjGcgnLiQG8FIt/olljD5Bd3BJUjPMItbkwF8Nxtu+T/PgkIDwFAt6Zr42coYInq1iG7oRj1ycywiXVIbM6t6fC2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10bXjumd4aYRm5KnqRRDDbg7QCzoBbS3+a68vxw6Ngw=;
 b=MLvBi/doscYDH7hKNOpUmM15BFNBVq3CcFV8hG/1VVEajjAcgE18Utj6bRJ43208ddEYROTYSsG34TvJzDRWb2YoeRfcx/4JT5w0uGl37oysCOaMAuHDRaHVFoR4sPUPo7erhhTZvjhKvQtEMyVx5RMnmmg3Up2q68kipGMgTz73qZ2tHw9S2O6jVBO0IN8d5xg9NN5dtO3AdK3DXittdORgh8t8Ge2hrmcZI1+msRsTEDALeLDoiUzm6oMttEpL9y6gYjjp9OCJtP69DdhlcaP4E1BVSupL0eALHjmIaU2HFSkvTiArC02USmGXXz3dsqacGI9zHaCH0V0MFY/u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10bXjumd4aYRm5KnqRRDDbg7QCzoBbS3+a68vxw6Ngw=;
 b=skiOgzVNWs+S8a0SuNFQdSmEhtjCsZ+o+iTg/iZ+Qc2SqFfIBQtVi2l09Nu+qhWgvlEJIRdYPVftXp0jMYSAzR+Z8JEUAdchBBJcFySrx8yVFUL0pcgP1WiB1W/kBSrHYsx9uQ5zSfhphfmKVbQI+VeyDn6q93favhzZXEiDBbVUDoYWCfiIN4G9o3Brw61xkUAF0AqxmqTbmnIAKa6X8oPpikWRAd6wP5DgGpdWWcw4vusJIKasadDu2k0gBIijGNg9HPklPDvosWLANqsaJ4rQXMUqbSA7V8eoHTANxRxw6J4gwGq1ocTbBc6aZNs/iy2pG3c/oin/01YqqFyDXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 03:14:49 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 03:14:48 +0000
From: wei.fang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: wei.fang@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx943-evk: enable NETC switch
Date: Tue, 10 Nov 2026 11:19:18 +0800
Message-Id: <20261110031918.89948-2-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110031918.89948-1-wei.fang@oss.nxp.com>
References: <20261110031918.89948-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DU0PR04MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cabf13-da7f-42aa-c9d9-08df3ed8c726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|22082099003|18002099003|10067099003|11063799006|261009223027099003|261028144727099003|261102123227099003|261021123027099003|261022105027099003|56012099006|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	+pa196uIJtEhddzPdRkoaheHS6QWw6PKyK4a/xYn6za9dpb/6d/M0A08uOSohnK/lvCfyL3MeyopMoIH1avkn5MrHSbmtOUfO6BWqdQNUykVTWDtglinV0hMCPR2zRNKJ7Ll37x5ukfLzUaSCZVw5skt3p3GJ9GDJX+TCkJBtjGnV9Hz5he3KZ5cZCCu8hTATsO6eZkx1bcZ8CzfR2jxvd8vynZy6DBQPjAFrFusFbyfaH9wfCsPp8oLmdhex2I0Y86/WqgyM5WS2P0MfUa6TOCmwOfxMgtJ33ZeHZItMJ5s6TGUFVeR6KINeGeL4jqgXqkEYwar4o7VuBbxutYZxhfsbKUec7dVEXT5HoxsIlYrEwbOwCAePQugtwcvhmjonqn1g0XYMjP5cCVTqerfCqaQsWYCEbhWY5pQsCwb/zxfPZGGVugXCHA2dltDkXIxToH/v4vWSvUmrqGLaBa1hIPKDrYOP3EgnJ1Mi64CNzQzD0ujnzIwrG6Hgz8b8E7VxWWGg7kwied+Vl7HlcJl+FAPIJTXF+cysNZ4OrJip9NXjsTQXR5FhRmxI/tkQkWAQsHSqJ+QyqzboaKUPw8tYBhI47NjZSp8KxA8bWrk+LnSSelMuaOiFUPuvlTJCA8RGkeAmQOh+pPPcYJb63SwwW3nE1Xe1A9O4wH6Ld5YTyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(56012099006)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XtoSD4KMTQ7u3bXgmCCvcn4dgdRxCdOoP6PrT17JiwIj3s73JxX1OIVx2xqL?=
 =?us-ascii?Q?l9q6mSAqXy3eNrkyYdmPxaLEY7tTeGkNaEUc5CR1TajQLJ3Op1Zgai5B7Ica?=
 =?us-ascii?Q?ehGL9tU4IdsyunY1jpmS0B3YtZum7p6KA/2zYeea+inKwPD4lcaG8Cx9YhwH?=
 =?us-ascii?Q?Z3OCcBhAiUD0KydS3HXCsSHZ8lA7ObcfWYv6lKxfcmo1vjabwntj5bd+kmoF?=
 =?us-ascii?Q?i8DBix9dKrwG+Puxz7FS0Xxv0UwuHfdDd2O1eMqCZA1Q7amIEGt5q58EA5MI?=
 =?us-ascii?Q?sRPZjJQMzHVn/VhcuOXzdK4rJMmjhZa/wQ+KZVS9/UsGRv+1agewzOC/sJPz?=
 =?us-ascii?Q?wyZQ8IETclQDdvHBs5hOyAy7AlpgQdPpe1KDpyqZsFHyJYlEPjiGf4ggbPpL?=
 =?us-ascii?Q?5xbXvc87Xcg2erSK1ZLVDis4Ui7dcwtX3Mw5G0o77ypqXHgwtQDp2Gy+RDJ0?=
 =?us-ascii?Q?vn1tMIveBquwsvwlxGmbMjsM3dWD/Zbgh7ZGhL/pjC5hRevnyHtnbUaFPSA4?=
 =?us-ascii?Q?B/63R6+FMbc/hYih5K+Rzwth9w8MarT80O8B6cly5Qyur5gb3mD9gyCA3gFO?=
 =?us-ascii?Q?+umkGDeU1i24gng48uE3WspWAtvtLSuF33OWeoyI6xhPqfwd35G79mHDGnMg?=
 =?us-ascii?Q?3zNTQEhUFsuMOTmmQ3H8sPcYQYxXOURCfwHPWWjvEq+je6JiGvR/ZTJWGviP?=
 =?us-ascii?Q?YV7sITWCkzYxXcEZS9/24dON2tCQ/L5m0rwYW+mxCCYxDcm/c7dr4J73Qjk3?=
 =?us-ascii?Q?zwYLQNgLlmaEK3RV8OCQ5AZtzjc4vexW7COll7S4s2xgEENxacKRs0xV+Q/M?=
 =?us-ascii?Q?Spz+KfttSVdHU2iQDI/1QK7hAIuLUXcpwKmn38C4AiJ0qnTPHNjE5AWnk54n?=
 =?us-ascii?Q?FiYMB1zwkfdug4ERi84c4crnsMPyyV9FGxF5Re1bV/XgrbN1R7Dmmh4pn1TC?=
 =?us-ascii?Q?pM8heFU06McG8l5eEs2qZfmtmXh+z63dk+XK57BMp+/cln31LyXUETiptwis?=
 =?us-ascii?Q?oUXxnL5JicdvnH3Y2KHFzr7DSnkhCp6koCCLRY1KBggEykEals0P2RGB/PHh?=
 =?us-ascii?Q?JiSKe2oIamzHOVi9hImeLxJ9FSTtgJlbh9SfH/H5ptxGnsNGBNfmIBPYjywr?=
 =?us-ascii?Q?kIxiPC7+mlBUjm9YZqvHgtdIrCFh1gsqgTczvlvMT34PH10IpHm5AUHNX66p?=
 =?us-ascii?Q?Q6tYGVyMW7EwowhAwORL2f9Xsz5rncEV/FKQM+Rv8rDN6aUojl+CH2YSc7f/?=
 =?us-ascii?Q?kmpHaV8ge5buEmCkguHzB55YfUpQPOefS3iKpLPvXW/ytfwocK/K9G7BL3NR?=
 =?us-ascii?Q?nY9Ns/lWJPHjKJCr1Jvhd247SaJ1yk+Wvf75ax7sYA6XXO7MV6qDrJU4Cfpu?=
 =?us-ascii?Q?hTSCyRj8zEsBGlwrOrO2iitEaxYioBxzFPFytwMhhmhNVxVPg7Rqx8cfm2KG?=
 =?us-ascii?Q?CiHYl2H1VVXFt1BTMPuWzVGzVH/YbBQYju1snT/6NNMAjmmm/tElT39nqXgn?=
 =?us-ascii?Q?rFF8zDWvn7+qVURoo20leMe9AENjubv/rCxpImDyBc3/qmS5QZ632dBAifsu?=
 =?us-ascii?Q?VIVR5d883RDwZTEg2GSDzPbm/BgdJx9Ee6B/sdtErehvtjCMWsPCdl+ISkop?=
 =?us-ascii?Q?rz3fxuBFHbLrizJwn18a0lvK0mHHfngoxVgR7eW1Z/U+TPO+DRQwDpogrtlb?=
 =?us-ascii?Q?zhSMn1EBInPMQ+UOmVdsTTjcUUB/QZn12ws+I3QqPXCgwvTd/bKZn1s9MgNJ?=
 =?us-ascii?Q?8wCdCEVJD5tpuZ0lVujsA/TiwYYgzBZy/GapNTCc+zP8cC623VS2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cabf13-da7f-42aa-c9d9-08df3ed8c726
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 03:14:48.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQu2P5xNjYJ569gso3jNpBX4R8//xCQDo/F2dyKMBJovt2PoGBIsSbg2Mzsot7Iy+GnlRZA63EVkqrFSnALm/gkgXdJA5y7O2X1e6XQZoS0RQF/Pq1yYhobv+Ba7JQRM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

From: Wei Fang <wei.fang@nxp.com>

Enable the NETC switch on the i.MX943-EVK board. Configure swp0 and swp1
ports for MII mode and swp2 for RGMII mode. Add the necessary clock
assignments, PHY nodes and pinmux settings.

Note that switch port 2 and enetc 0 share a parallel interface, and they
cannot be enabled at the same time. Therefore, only switch port 2 is
enabled in imx943-evk.dts.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 101 ++++++++++++++++++-
 1 file changed, 99 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 39e819c536cc..1c98948d2fe7 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -790,11 +790,13 @@ &mu15 {
 };
 
 &netc_blk_ctrl {
-	assigned-clocks = <&scmi_clk IMX94_CLK_MAC4>,
+	assigned-clocks = <&scmi_clk IMX94_CLK_MAC2>,
+			  <&scmi_clk IMX94_CLK_MAC4>,
 			  <&scmi_clk IMX94_CLK_MAC5>;
 	assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD0>,
+				 <&scmi_clk IMX94_CLK_SYSPLL1_PFD0>,
 				 <&scmi_clk IMX94_CLK_SYSPLL1_PFD0>;
-	assigned-clock-rates = <250000000>, <250000000>;
+	assigned-clock-rates = <250000000>, <250000000>, <250000000>;
 	status = "okay";
 };
 
@@ -803,6 +805,19 @@ &netc_emdio {
 	pinctrl-0 = <&pinctrl_emdio>;
 	status = "okay";
 
+	ethphy0: ethernet-phy@2 {
+		reg = <0x2>;
+	};
+
+	ethphy1: ethernet-phy@3 {
+		reg = <0x3>;
+	};
+
+	ethphy2: ethernet-phy@5 {
+		reg = <0x5>;
+		realtek,clkout-disable;
+	};
+
 	ethphy3: ethernet-phy@6 {
 		reg = <0x6>;
 		realtek,clkout-disable;
@@ -814,6 +829,39 @@ ethphy4: ethernet-phy@7 {
 	};
 };
 
+&netc_switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_switch>;
+	status = "okay";
+};
+
+&netc_switch_port0 {
+	label = "swp0";
+	phy-handle = <&ethphy0>;
+	phy-mode = "mii";
+	status = "okay";
+};
+
+&netc_switch_port1 {
+	label = "swp1";
+	phy-handle = <&ethphy1>;
+	phy-mode = "mii";
+	status = "okay";
+};
+
+&netc_switch_port2 {
+	label = "swp2";
+	clocks = <&scmi_clk IMX94_CLK_MAC2>;
+	clock-names = "ref";
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&netc_switch_port3 {
+	status = "okay";
+};
+
 &netc_timer0 {
 	status = "okay";
 };
@@ -996,6 +1044,55 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
 		>;
 	};
 
+	pinctrl_switch: switchgrp {
+		fsl,pins = <
+			IMX94_PAD_ETH0_RX_CLK__NETC_PINMUX_ETH0_RX_CLK		0x58e
+			IMX94_PAD_ETH0_RX_DV__NETC_PINMUX_ETH0_RX_DV		0x50e
+			IMX94_PAD_ETH0_RX_ER__NETC_PINMUX_ETH0_RX_ER		0x50e
+			IMX94_PAD_ETH0_RXD0__NETC_PINMUX_ETH0_RXD0		0x50e
+			IMX94_PAD_ETH0_RXD1__NETC_PINMUX_ETH0_RXD1		0x50e
+			IMX94_PAD_ETH0_RXD2__NETC_PINMUX_ETH0_RXD2		0x50e
+			IMX94_PAD_ETH0_RXD3__NETC_PINMUX_ETH0_RXD3		0x50e
+			IMX94_PAD_ETH0_TX_CLK__NETC_PINMUX_ETH0_TX_CLK		0x58e
+			IMX94_PAD_ETH0_TX_EN__NETC_PINMUX_ETH0_TX_EN		0x50e
+			IMX94_PAD_ETH0_TX_ER__NETC_PINMUX_ETH0_TX_ER		0x50e
+			IMX94_PAD_ETH0_TXD0__NETC_PINMUX_ETH0_TXD0		0x50e
+			IMX94_PAD_ETH0_TXD1__NETC_PINMUX_ETH0_TXD1		0x50e
+			IMX94_PAD_ETH0_TXD2__NETC_PINMUX_ETH0_TXD2		0x50e
+			IMX94_PAD_ETH0_TXD3__NETC_PINMUX_ETH0_TXD3		0x50e
+			IMX94_PAD_ETH0_CRS__NETC_PINMUX_ETH0_CRS		0x50e
+			IMX94_PAD_ETH0_COL__NETC_PINMUX_ETH0_COL		0x50e
+			IMX94_PAD_ETH1_RX_CLK__NETC_PINMUX_ETH1_RX_CLK		0x58e
+			IMX94_PAD_ETH1_RX_DV__NETC_PINMUX_ETH1_RX_DV		0x50e
+			IMX94_PAD_ETH1_RX_ER__NETC_PINMUX_ETH1_RX_ER		0x50e
+			IMX94_PAD_ETH1_RXD0__NETC_PINMUX_ETH1_RXD0		0x50e
+			IMX94_PAD_ETH1_RXD1__NETC_PINMUX_ETH1_RXD1		0x50e
+			IMX94_PAD_ETH1_RXD2__NETC_PINMUX_ETH1_RXD2		0x50e
+			IMX94_PAD_ETH1_RXD3__NETC_PINMUX_ETH1_RXD3		0x50e
+			IMX94_PAD_ETH1_TX_CLK__NETC_PINMUX_ETH1_TX_CLK		0x58e
+			IMX94_PAD_ETH1_TX_EN__NETC_PINMUX_ETH1_TX_EN		0x50e
+			IMX94_PAD_ETH1_TX_ER__NETC_PINMUX_ETH1_TX_ER		0x50e
+			IMX94_PAD_ETH1_TXD0__NETC_PINMUX_ETH1_TXD0		0x50e
+			IMX94_PAD_ETH1_TXD1__NETC_PINMUX_ETH1_TXD1		0x50e
+			IMX94_PAD_ETH1_TXD2__NETC_PINMUX_ETH1_TXD2		0x50e
+			IMX94_PAD_ETH1_TXD3__NETC_PINMUX_ETH1_TXD3		0x50e
+			IMX94_PAD_ETH1_CRS__NETC_PINMUX_ETH1_CRS		0x50e
+			IMX94_PAD_ETH1_COL__NETC_PINMUX_ETH1_COL		0x50e
+			IMX94_PAD_ETH2_TXD3__NETC_PINMUX_ETH2_TXD3		0x50e
+			IMX94_PAD_ETH2_TXD2__NETC_PINMUX_ETH2_TXD2		0x50e
+			IMX94_PAD_ETH2_TXD1__NETC_PINMUX_ETH2_TXD1		0x50e
+			IMX94_PAD_ETH2_TXD0__NETC_PINMUX_ETH2_TXD0		0x50e
+			IMX94_PAD_ETH2_TX_CTL__NETC_PINMUX_ETH2_TX_CTL		0x51e
+			IMX94_PAD_ETH2_TX_CLK__NETC_PINMUX_ETH2_TX_CLK		0x59e
+			IMX94_PAD_ETH2_RX_CTL__NETC_PINMUX_ETH2_RX_CTL		0x51e
+			IMX94_PAD_ETH2_RX_CLK__NETC_PINMUX_ETH2_RX_CLK		0x59e
+			IMX94_PAD_ETH2_RXD0__NETC_PINMUX_ETH2_RXD0		0x51e
+			IMX94_PAD_ETH2_RXD1__NETC_PINMUX_ETH2_RXD1		0x51e
+			IMX94_PAD_ETH2_RXD2__NETC_PINMUX_ETH2_RXD2		0x51e
+			IMX94_PAD_ETH2_RXD3__NETC_PINMUX_ETH2_RXD3		0x51e
+		>;
+	};
+
 	pinctrl_typec: typecgrp {
 		fsl,pins = <
 			IMX94_PAD_GPIO_IO44__GPIO3_IO12		0x30e
-- 
2.34.1

