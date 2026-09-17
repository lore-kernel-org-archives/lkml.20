Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8B582BBB;
	Thu, 17 Sep 2026 14:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657134; cv=fail; b=QG0nu/WzuLPSpspWnDYvnMP+whqyEYK+s23G+b/uNBygiYGGAKr0Y5vYtOQAtZnZTlF2couSgb4giaUhM1S5ELM40BhJjJGU1fhg1yiO9cf3JQ8l8k26YvXVnC9NKwqwxiEmMJQXs/kF2fBtmQNwneIpFR4OPcUVzi9mEGOf7Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657134; c=relaxed/simple;
	bh=SSito7r2tn7sRs91ZYA5jnx6Ho+ag6gcqqr7SQZzoI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tX1rayM41cYL+n+rndhGCpZYqMFxsq8RQqwwRiZMACIcf+rUcdNTjxRspl2AEwfMg+B5c1xYSi724AZ0YALIA7Ymx3gWRTkj9/BIADJPaRM7sS8hpiOSlhutyRA8SQl/9LBngxTw/gC3U+lhZXjeHWbiYnmwK+3zIi+uRzay6+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=unhVZTxX; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="unhVZTxX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpJOOw9f9jD7f07mWlSscovPixSGIX5Lg7mXCMyFB/QPU0S3aBNvxLkazcEY0OR1UZalp1aSsk9XAR4WzXIUtRd/hoU3e4hFTdBcxg9GZsZrYNsegRA1S9w/L55OPCyQNhGsqXfBtgUOrdap8gNrD+tBlwAna+3qzsTdEdG87XyXqB1yRmhXbSogOlYuCGh6RrePmrT1bg7vUhQI8Ar8T1XN+hj7XIz1wEcfWCj6QoaH4JnJKz6lF+TwzAWdHymvsiM5satDeD5e/2Bg07eUIFaNYlYrx5RzJaMFbjDrd9EkDYAEXpe7zacbEDxP8fk+PTXOLWxxBttiukzgdPDJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QcrhQfTGeYWijL5LY/80xOhxvc13zHfVioEv/81duQ=;
 b=hJJwBA/3bgXNoUu4DfIRb+fqBcH1hYMrPNN8c4Qsxri6x7fB4SXXaJAjv0H2NPrGvUisKYB5Qv5Ql1aIEQtG9TfL326Q67pGzldsvvixmPQ16we1cDuXAkKmU4lJCjLX192mrB65y/56apW2bdaUjyY/CHiJA/8bgUU6i50vpCjgXdYNqo7VYfWBRcHf57cOsZi1s05HzsY/TL9Yo7aLm7efkyKfvH4FplWSx2t8DjhH2PRCSRQHPoTXERGtyrrGn000DPrfzfgPg38NuvEtfwo6gUI2hpLVrQWhCgNg63P2/E0F0ThHJ/zxzkmzUKpkupIXsftCdkv3/XE0uqYzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QcrhQfTGeYWijL5LY/80xOhxvc13zHfVioEv/81duQ=;
 b=unhVZTxXHBjF7Gb0l9+P7Ew3mmbXQBwZ8WHJUEcFLqDFN0lY2aVREuL2RiGMZowng1HSZOo9+VxSophpu/eQmwIqZ18IC92y2HrGGJmck0S6TSTsckzOt4jzZddE6fKs4+0DcMIdZKNRFa5pfZXAAek2K0h7PgQi6qECcxOQBSGhdOvGEyp2Hc6BIqCjToqx89xTGNDjPzJQD9VUMKQeFaVUQhlB7bMgnSvctv6ICFC0yFpa44hnzpBHpgztzDRL82+vEyIAi1CkxxnQtIAwdnQ8aTNhmMZtRy07cgulu/EMSBAx6PIOnMCrdmyJVHMdJHIEZ69J/9CAbBjyAbt8rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:58:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 14:58:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: update usbphynop2's power-domain to IMX_SC_R_USB_1_PHY
Date: Thu, 17 Sep 2026 10:58:02 -0400
Message-ID: <20260917145803.838836-2-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917145803.838836-1-Frank.Li@oss.nxp.com>
References: <20260917145803.838836-1-Frank.Li@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9992:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f7d58b-1f5a-42e4-90ed-08df14cc1f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|7416014|1800799024|56012099006|11063799006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+i32ZmV3ONhSYfxhht8JLLHgSnlBaFCZoPK7FPPWk3tIuOwKer3bGcyByOCt/Kjo0Ab1qpe8JcJcU4QQwvncAlvIYGjSvPtpSij3oC2/jPaBHJtqqiKiUkq2JM+8JNdKYmn8KoLM0FqiQFQ8hgUGkg4rxyHrmB5M1SDbV66N++qD3URZipXqQ5XmmXU4JY+gd/e8ZWvWpOHDA0SCuOqy0tskofE48+5OW8gW0PYmcxilcVuPWid9c42SvOriPeQhp3G4nOvF1LbmxInkxfguMUgFD1E3sgqWt8ONMQ/hwUoLghAF7Xj8+BSaiH/j9uMnJznxCOrKwcsRBwPMKqAp4eYAEl26wGL2XSO3UseWfSZzVOgyU8fahOPA5sCssoSaYfk2wuj643wV1eqQbuqyuF7DTbssW/4GaDLiBbqTVxl7DmKkWhF8gJzFg0O/Fb1/ByOFTVWMQXDMPRKHQEuESSWZvayiHATZuul5sBCC+XC1COhWYrfj26/BFikw7a/FPLj6PncD/4VHl7xJ9Gtf9WTvcL6i1a6HqUxV1yX/v1B68xP4lsLHuzPIPhBd8f4Xhfaxh4f+bUfAp54wrVv9oCSjHCzvuEzv4GofEwenaVJ4tmVWu+iS55KfAIzbbW9hrXDnzLdmdQ6dZwRR9qMI+6YftipxawT/5OrkgvjC4GF0CRk83Gj8qSTfMP9uecBuBioM6XPndUUd+zpsrlMCqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mkNCt7k7L63gBcPNfRugTpqX4ambeEyY3UmFQzOdtAGEdJGsTKEHffl3bEGf?=
 =?us-ascii?Q?J6Ib3zl4Msq6D88elyvurKAp5iSwhbTpI0gB0sNWNJ9b6HlJHTUzmCgBNpfP?=
 =?us-ascii?Q?eTiw6XYvzCPvzG7otfZlCR5Wd4ngU7QjUnsOBPesjRAQpboZnSgbpBjg0LcO?=
 =?us-ascii?Q?bovaR5rbf5NgdgeJGQ2cvrzp7Q+WB1o74wsU/WAfCv8HSqBgdo1D+jDN3TWl?=
 =?us-ascii?Q?8p4EdXyS/SvCZIadjem0EuUJjOd97o/+jAHc7vDcsoUIhHuB/CoZdHDp2ClA?=
 =?us-ascii?Q?7bHme9V4cgm4JMl4GXzmvGk08LjggzXdzWfpPCKXl58+0px9Rs6mhHipdZIw?=
 =?us-ascii?Q?M3qHTYKXQHt8eQZ8wH2DJVq0EcBQS7cLpnhVVT362NtQL4yGn+9b6PwLkMNw?=
 =?us-ascii?Q?vMSxavQpQ+0Q6/xdcsCIHncJPFYBJcDxf2vEMkYRCCRrN59ySWUYFnU7iwMA?=
 =?us-ascii?Q?kK3WVtM9MeMxGl/fTknhfQtJakomUQfDj3jwoq8ECOcZ96IxtJGUXkzABkyI?=
 =?us-ascii?Q?KeVZirk5MCgeo0YiwYYZigGypBB6maUv2BhixeurYhpQQewfgdsOcIdBwy6j?=
 =?us-ascii?Q?EuNSL+nnYSNJuhAnKfFJ0gRFJpoOze1OGxyEs06/Wc+S0kRaHPQh2ipJ5a+q?=
 =?us-ascii?Q?WuGnfbr0wzEZ6qmXSW24+5tTJFLg8FJCUzWTGSX7xmHsoCMfWpQS0mktLSlP?=
 =?us-ascii?Q?5oTlpybg5B41ls9ruqe6Lm5SEvGi4pr0U856pH4v9ozL85djjK83krKHPkPL?=
 =?us-ascii?Q?1Cuz3d9Mw3WbEJpS+wDqeXUNQv03Veg5HH9gJ0ByxwjbFy68SKbjm2OjI+U9?=
 =?us-ascii?Q?7bHhG3baR/QdrEw32srhp0r/4lF9Gvo7/EBOZ6RrMN90wy784vAOw2LF6rez?=
 =?us-ascii?Q?i3qgGSUOyGQxzMHssGHVVFZapHRJWeeZab/hqvttvJ7A9BMTz160HhK2Q7hA?=
 =?us-ascii?Q?n5A3+UvjjA70fxr1DGj6XlfctAxREDLllZl8r45D1LhEVfMmxoxkpAo2fToI?=
 =?us-ascii?Q?R5fL/bN6icckP6zvcN2xlWgaaSwnTBWN+NkPI7t73pRR4ocisDz57+3ai1/F?=
 =?us-ascii?Q?5a0la4oLSrmr1ZVD/ihDxX6AsswFCCUmSX9IT7FgFBjmq+WvMAt5fjw00x8M?=
 =?us-ascii?Q?Un5DLv24rBYBFv1qb12PWY/c6tv2d/p6K8KG3u7Ev0V2L8W7LwyRsalRoGG2?=
 =?us-ascii?Q?uoPHXMlgNzUTiRb1YYFjQz7gaz6D2n1y5GjU+o5J2aXrG8Bi5HK1vT5l7GuY?=
 =?us-ascii?Q?yLDZSyiDSl8JRVXqWpUvw1apnS889hdZgypTg1tBp2jkSlJpTzyBVUjnHwIF?=
 =?us-ascii?Q?hywwfjuhf1INbnljkgRGQittk/YTqlopZEEEyBmMXnYjuT5RX9hQ4xNn8k8k?=
 =?us-ascii?Q?/VmxTIv+Bqw3YH1+Q9ctXZgR51nzjQKoQgKryHCOskquWCd2sUqzPNj6Wmru?=
 =?us-ascii?Q?fsUVfFg5gAPWyIPR/Yis0zXXBa59cVeuXnlx2tf6tdp+RtXvr84+XST7XipI?=
 =?us-ascii?Q?z85hW4evTQBV51tUtRNMnPcF9e8irhwv1RiVF+AVj9h2TjRtuM05Hx3PaP33?=
 =?us-ascii?Q?h4xmcdcT98Nfh8B/iw1ESLoD2/ByeWHWloMd6M2SjtuMY8kIdeumXLWFke5q?=
 =?us-ascii?Q?IsbcriUJNRq6bsd+rY473XEZClGnRCMGPSIiR7qug6uUBi+yy9llhyROMMSs?=
 =?us-ascii?Q?QqIOcUS/pRcb460CP7fPer7fERQt3WI/A95blGT8oM20DfFflz4A0F069mbK?=
 =?us-ascii?Q?+OM845tSpPkiRFq5TtpoIAaqUZqd/5foiO6MD1aH9hc1MPtPSkpz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f7d58b-1f5a-42e4-90ed-08df14cc1f18
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:58:24.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtzzqJ34hBT0+Ce4U+cG2I6W6IxQP3fqGCDmh/YeGbup2Z16OEIn0T1JJ+v699+BpKOknOigbS02+6rPRK/10fNG7Ghlsw6SUb8Ip81auDlCDN8TwtKZ410RoQJhw161
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992

From: Frank Li <Frank.Li@nxp.com>

usbphynop2 is used by usbh1: usb@5b0e0000. Replace IMX_SC_R_USB_0_PHY with
IMX_SC_R_USB_1_PHY to fix typo.

Fixes: bc2f1c482286f ("arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index 61c73e701b10d..f25f62d51f69e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -10,7 +10,7 @@ usbphynop2: usbphynop2 {
 		clocks = <&usb2_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "main_clk";
 		#phy-cells = <0>;
-		power-domains = <&pd IMX_SC_R_USB_0_PHY>;
+		power-domains = <&pd IMX_SC_R_USB_1_PHY>;
 		status = "disabled";
 	};
 };
-- 
2.43.0

