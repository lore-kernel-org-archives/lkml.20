Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004628;
	b=feb0TEPbI/P2Zd6DVVr0/mVXezW5T+O8cQ48ZIu3TqSv+Igdb5JwEK4OenRsVUApAjx8
	 pyV1cFQcYzdS7f1CW75fL5EqD++vB+4IwnulaxC6rYutp/yijQiAi+Jgor99Ei/iy9XJM
	 jVa4rn25et8Ong5uhCIcgrHx/PCsoXujzPPr8c6CgfRNEstwI3rs/bP0obyX4TovU3J2x
	 mJZBaR8aWMpJCGr9yIEFi9z3sswcvGXLMk3yYjWLTZnq6bn8KMAaqysqlFuLEzdxfE5BT
	 1oKC0vFj+WSIRXXYtJYom/eUucw4n6ta+mMUP1uZ191/3gdR/A6PDkQJR9YiLzNC9Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004628;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=sEk2VBaznvhGmg4g3M3jT5cfRnUHKeukKWOZwf574Eg=;
	b=YRJpzvhGhcYuxv2lAejseIpLj+W2C77YhsCwhITp78ywNbdKIXEfP8sEPPYYW1s/LCh/
	 e0tIJByC2bTl2mDeU50ZroE+UtCZHHpMkLpQuhL9LGnHQvS8jxk2fS0R8T+Mj4UZbhXNz
	 HRi4JjXNvImzRVmEsuKrn+0D/OB2rh5OuaiiwrV8n7XOJ2kjI5ZJ9qxpTnWc5ZkxYqwzv
	 liDL2CfKS+FU1s3lQoOn0MieeSUj8Z2Zz9QeeVvEAuQ6a4HHwa7AlXOxrX8PM/pctyTQs
	 mr/MscAAhkfs2Ofe3ao8keqIkePPVt/p9CZVL7EOsScAmK+4z0cP7dlBzNUMJLdxkYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LgjDzaVx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.14
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4D8606A31B;
	Mon, 26 Oct 2026 08:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LgjDzaVx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjgQ5oO+S+ud1y8vjGGvXaj3syZrQsbIUCAlP+71o29PiU55qJ2hGIlmfz3rGxI7Gg1GHSZKNwns5YfC1kbl8OFon2uHF4AOx4ZzL40UCaHf5WvtsRtrnJx/HK6yJ53PSrAu4KozJlEVnjpWsS+QJk9dVXG3kLaB4dvG+UKB6UkogonrJsvD26ToQ37hkRseKiaTm8K5jMDpwTJJslxux6IQ+x9Jm1NK4q0bAYcQ17wp0Be9jQ4eizNkx90/oL2EnkXs/0yvKg0FkcIiGEDRFB/7FRdOx6yMK2QmflHAZwP9rMDw+h6l8zvysQFNN6WrErTYtNbjx1r9omLv9aChRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEk2VBaznvhGmg4g3M3jT5cfRnUHKeukKWOZwf574Eg=;
 b=rF6KNSkTha/SisKjDZUC8wFtCrIw/96OudK456dqFVykX3L3ihCU3lsx2BqY340TbhLVosBCcWHzQV2WZBnnk7QsVNZf2BTRptlVuf69rMcwOrRRBLuw+R1USsGSvnhB6rf+5ctl/6nkuWfJ0DE2H1McDyzje/HR91CdoQL+PAOQK0ORkF9UCGfa+/MYVR5yJ0DKPjjz1dxH6anBX/RtXfXSS4IsqOB3CZz6CNpiniYWrz6VV/4N2V5IOsjvn03k70mNWgFFNLS6k5EgrQ85nSFk6drXyZcIZukxed8eJGT3DTDwJWqX04OI6VOYMEut3UQyg/HU8/uQeR0VBNkKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEk2VBaznvhGmg4g3M3jT5cfRnUHKeukKWOZwf574Eg=;
 b=LgjDzaVxjeIuusgmQArmeKmBI/h36Fw8J3XeynCsWYbRPTa+TPAFlyUbRFt0hfxnxDAOleUAT62CgGUPeEJk7d9cXfokcZx/14713DT2uyGRvlYyA9Sk/wXn/UVP/fH4/PcEDEdftZWe124UDaOnbyPAkT5RU0XFv1mazvx3D5/LC0TYPRap9OOZjApKC0dzq0bSAu52py5bAQ2NkbYEZrcuuMi5D4p+YQVYSqQNBXbjQ9hQrKGLj0VtPDyybuVfqnvSssDF5fQMkUQ63j95SffHRCZRBuRU+ekTMtXKB2jhZWYYk4WbxKugAatgLOZ9PvsdhbryHap7hffugXYAUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by MIWPR04MB915355.eurprd04.prod.outlook.com (2603:10a6:290:ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 08:50:25 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 08:50:25 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
Date: Mon, 26 Oct 2026 16:53:52 +0800
Message-Id: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::13) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|MIWPR04MB915355:EE_
X-MS-Office365-Filtering-Correlation-Id: 13694b8b-2a89-4d99-fd3d-08df333e2d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|7416014|376014|261009223027099003|261022075727099003|261021121427099003|261022105027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|3023799007|18002099003|921020|11063799006;
X-Microsoft-Antispam-Message-Info:
	VwK2glhn0JGdg9lZ0pBpHqoxeH35P+8IcIo5ZBoE/qVp3ZWhmIunBzBtrksggH5YSv8DYkW3uqWeY8djTxTCeJ8iSNQDuBpYvqIcc/jXGwnOI32PmCpuFfK13cjd1poFAUtbiED7Q/vdAcFzwmBOkX9AnYK3fj8ObReLk+CRnsN4dHbERzjRPLX8NKp87vb/n2P4D6K8HU2Z6Dzi9urBP+Rznqy3AcNEyUOA5Gcg0GoQEDdImr8Lf8M02fRjMrmT+0KHXXUlKdx4+GiDFV4glhkRrp/jQbQXFoOS91Uq58Rl5QolCiRr/sxsZCoZEoIHTVAKSzulQ7/RqwtPk3kMlsevCdz8hySnrGY5l0NgVZZGNLFwcr6KcX97tPVRdgYZUbxT5dxJ2m3aU4gH+IMKlS9y1nvgPZNiqprW/z8ABmwtxmGupGhEWMubHif3QyhyJ/ptIXczL+d0Rp3KTQjcbrBT2jjXhBiu31HE2NO+4ZVSs0IlQYxQl5KwIuIoC0faDWPjIqSJBH//+Ox7ebFCExA6reD/Ww/p0xJTWdmbLRnvB2+HPuW8/JqqlDWYBybAt9SJpE3TVAtB97XQM2xtdJWhHXpruHn0Y+VaEf38anPIoX6/aiEm2XZbO1ADaVibJb8UhpgXN7VOkerAc2sucWn9qsPfcn3sGcjWev28IH/dSz4W7ue5Zlhkk7HRATCrcDWne7RoKlccXBjYAHTcbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(7416014)(376014)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(3023799007)(18002099003)(921020)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kgbe3jsKEXqZnk0EzzDJQ+dnIkqhxFdeV/4F82WY+65LXVdKDQIK4in6FCtz?=
 =?us-ascii?Q?7gnXfEodeNy+fzZwP5XmU3gFAHAKsj6g1yGE0pyJzV5h8uYT60b1pZVGETyL?=
 =?us-ascii?Q?8pArhaZtw0xRFnelikV3RcoW1ihBF0g6mhyZqpZo0ZfnZ8meN6TgklzYyUo1?=
 =?us-ascii?Q?wSDqIU81dMNllf7b7o8IaxcwS6Bq5e/uENwoq/+U3hz/oEOUTi14AoSDnaPt?=
 =?us-ascii?Q?4eArlBKRqHW4ENUrzDB5RFQcM8zhgsfjtXEtc+PmBAfosqVwLmFwMyGJZYBu?=
 =?us-ascii?Q?NJeKFdrB1uqR1pmEdk1Ow+TwjNUN34UHnOVjQwN3lB5Bd9U/EKw98ew8U/Sz?=
 =?us-ascii?Q?vguOiFDbu9LoHVUUb1E4D0XTqSzcec7m3ZGRb+gytdBUoplRDRNJrA90oEcs?=
 =?us-ascii?Q?xN1PvwPXRBixv1A2FxNCZ+ot0YxXrseFRgdcAgvN7j0ytXJCK92yyF3BGzdK?=
 =?us-ascii?Q?Yp0O5mUoWDbplUx89pKE6uv0cUKZ+SVRcTpbll6v83sO7JGHBSyFKT0GPm/N?=
 =?us-ascii?Q?yjCdNsui/TRC1VZW3dUMrUd6zDkd+uH92UTeXNRgq7NkZyg67W0YoJbu7B1n?=
 =?us-ascii?Q?sSpRwNZVPlrgilT0d6i1W05R7rr37Ra17NEQILoqcuCZtTdNS8Pl0+xpWts5?=
 =?us-ascii?Q?//WA6gd6RoTm7YEfC4pxTBVqoPFYLQKo8QcX7cdfplTwnvMX/Iocy4lMpkvt?=
 =?us-ascii?Q?KJTYbrDzwE1v3ER8tpqDJjLfXRQebyVD9dTGnYztVfQ3JjV457KUwQ2rIcOl?=
 =?us-ascii?Q?MzxpdbOrmrFY8HZMOoOE1JjBvnb6PGXdqP7l+JNvZ/N5PjQLXbXtKf2TrF9V?=
 =?us-ascii?Q?jZzqAJ8FBNfwQO/MFnMFDHJ/OtOCzYn3mWgxoGDM64KzPaufOivetyJ5voOa?=
 =?us-ascii?Q?+TkNxE9ryu0uM3H1SwQJsemiIqt9xBFyvrITp7vIYVA1QAODYF/j24FMofGh?=
 =?us-ascii?Q?vILh8OjpLJ9xOAC8N5lC58VfOPvK+lA0Z6l9T74EcpL6IpGHPTpAJY1Xyhyo?=
 =?us-ascii?Q?m43OCBKl8n1oKrLgI5fqT4prUjFHMknRZS3xlYsgehekVj0tZf26+FXHmQe4?=
 =?us-ascii?Q?79C1Fp4XibLWCwVSsfY3bDRobOe5KZ4lufOJwiYurgS6eEXSL6MktQR+fy6L?=
 =?us-ascii?Q?L0cGHbvwhwIfHAgt1SDE8AM0JB3Jd1ja00KZeLBOLsBkjqI4MkmyiDJkYJX9?=
 =?us-ascii?Q?Sfc0P/6lsgTFWd2HCjIWYD5BaAW61D1RKaWEIaHV09TYwev2AIwFDvZNopKk?=
 =?us-ascii?Q?YrVeC9Q8QqwIq1oM/7Oi6dYJflpo+ZDHPBcjQs86jHfgQKEyxa4YjWteZiXX?=
 =?us-ascii?Q?lBARBcr5Y6Th0NsIrBt3TZqXjLQBn4P7S9QF/usPWc0F5jPgHGa5FwoyLE2G?=
 =?us-ascii?Q?j6d73dTnjW8QqEpOVeGFxf2NUUUwZmFYpWtylZJFLfmcNTbY7K8HJN6cnhS1?=
 =?us-ascii?Q?iODFEo7LlsmnZJHe1SEX4QpfxAoZnmZJ/OF6OXEOdywoFFnbRDdx7opXSf7H?=
 =?us-ascii?Q?CKtNc5fQuBQLaYdUMOvRGjgxpjXdj9crJLIe4crE/5MWZJHQFJZgsheULqc8?=
 =?us-ascii?Q?sjB9bE2mSsu+qFlAYTrTDq1HPzOOb9tlvUc7z02xNA2MGPBtdCWBWmjGKaTb?=
 =?us-ascii?Q?Pu9+/dL9cdDIDmhbekBeg87WSCWHBmrOAglTVJU5W6a1OzveZ4VdWfmQx3aw?=
 =?us-ascii?Q?a5WWKfjcFxkNh/BeXmeZdnf8am4fIeo07ugoNnuduMPNeKFFRvFlgGmkUUM/?=
 =?us-ascii?Q?f2L6Gg+QFbEHml0n5C5YXZBG5uSFxvyOazAwGbZgThdJIuApwIOv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13694b8b-2a89-4d99-fd3d-08df333e2d22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 08:50:25.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhAa8HS4hl/GHE+e+YWeZrqaE0FPv24evwsD4IehXwmhZwF+rEMyIGUQePXCzLV9mPaiUqpOfKltbLljH/AUH9S/6+zUAGYE1b6VKxkNMoxQS/BGubKxKwy8/OgJMq1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB915355

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
index 7785eb1a68fc..750046e1a5c4 100644
--- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
@@ -222,6 +222,12 @@ cpu {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		label = "mqs-audio";
+		links = <&sai1_port1>;
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
@@ -390,6 +396,70 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX952_CLK_SAI1>;
+	clock-names = "mclk";
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		playback-only;
+
+		mqs1_endpoint: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_endpoint1>;
+		};
+	};
+};
+
+&sai1 {
+	clocks = <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+			playback-only;
+
+			sai1_endpoint1: endpoint {
+				bitclock-master;
+				dai-format = "left_j";
+				frame-master;
+				remote-endpoint = <&mqs1_endpoint>;
+				system-clock-direction-out;
+			};
+		};
+	};
+};
+
 &sai5 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -443,6 +513,13 @@ IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_LPSPI3_SCK		0x39e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO34__WAKEUPMIX_TOP_GPIO5_IO_14		0x31e
-- 
2.34.1

