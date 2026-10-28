Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793157162;
	b=JLQbkiNLjDVMtHDQ0TKFKXcDiaRbUM5h1WjArjPjPH8eqEWsfamDZd0q6/GSn+n67O/W
	 61QcPRvuhVF3xfmkk2TGoRnh9yE7g20lYdxGfp6YOgakr72f1lhCmJywKylA25uUE75ar
	 bQHwKOzP1Y3spiJq1vCbo4QTQO8e+2/GuoIozn8uNGhQttFMytqjyzqUXXSi2N+jdxzDk
	 bCsoVXKE9P5EN4pmm1cepp0JxS7J5Vrfbx66U12iWXkfGJ7ioQy5qePjyZE8DX2AqIuQh
	 W8aXvBGGMjYXfG+UM9w4LDXWGROcCx4lbaeEFcbWC6UasOBXRvqTvbLVhN+cJVkSQYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157162;
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
	bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=;
	b=jfcRXU704IYcu4tIeu8ivRMc8GvAMmNy55gB9YRHVDLa0jNyXIXsliuItE1pZB5BcnHi
	 EbImpcr8JRW6BlMXXMhq385kTbYPJMEGbKmu4Jq/oXoaKlSbF4TYE4TGLS9Hwa9sZwwCW
	 m7kTHbgKzAAgYN/jesqcr8/k1ViFtMQXos3WtvOHDZY+iaKKqlQNlcXe4DdinOdJ7/Zpe
	 Zm5qW5UnzBv+8sfpAXfs7dAJy6kwY/i8RHeIPldUsXrEkz79DcaeG1eAyNpjPzMJ0d1xX
	 /P5Le+GmZb5uhh93NEx+x0juCQXwvmqn+C5QhYUTv2cOOtkK2wo52yZmqeMkDyJc9xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="jgzn/oje";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.48
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129A606A31A;
	Wed, 28 Oct 2026 03:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A129A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jgzn/oje
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha+aOlCYVIc4fCzySyxTdmm+ko2tL5JYNTpktWOYbtlKyPS63Eml8Oo+c4DG1TuKGFdFCYPql/8CdkDHunJU0vskn/ZTUFrUOTBTQBEaGProp9TYSJVmnhoZ7gzQBb+i4OADpu9ZFwtM2WskQwGBl6xqZSckFkj9SxeDjiPGlJlLwnyFZCeRW1yebcxL3xd5jpfHqao6FTnkKxHOiD7b7Pld7ryvBjK7eKK5TKMeHy5h06LxjDsIJYm1wblhSKhCB4cQDmXPzkmwN/bFZU44uBrt8n4ZrFyQYabTO5J6Z/142WLW+Wf7VeCtZr/Vdjw/7wWvjS5LgRnTmEufQgVXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=;
 b=FgAcEDEcAJ7MKnI47Dth6HMY8gvzkPYe3Y4joA220FbRyRzuZ63Kd/F+jM1u8nSFakmDcpX32jXWgdc/g5RKERtRxyqDENqBTVV+y0a6GwltMkiE78L4/Nez1hISy1tOtXyPqJiDPuFG4anpCYPnXD5liHna1MFOVmSY6JdL2bs3f8eVK7sFbs5WfTAyFyg8BfKHtXHstTWx3gRssaTzDu5WxlIh3vRNeEsci0bF1WMVxEtJjrA2LbNyEeUKSsl/ga3OVrZwvfjnbmGpkVcLeVKxoN1DHOnzktuDxCFGUHwJZZM5X7j19Oh0q7TTxdjzsCN2YrfK6hPoxOzivR/gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=;
 b=jgzn/oje81iB7O03DwAYEmpBrNeXGoysjKU3886eRgpq41dxCgm4LJ9b2rY61e/IEf8QkUv7XUimRsflNXxjowqxnevuXeKO2977dy8tx6Q8rdaMk6zRxufkHxQLC+PZV7PgqNYEIK6pcCkPEWLRglTQjWYcHjTOslfNT3s1AXcCRZPK6l2fAC/as//8b0jO6/tBArYgLOO3CK/NIHbMrYgthfYwSV5MwwuaM85gHUFgSDr9tnKsTPpKT+3AeFfGZII06p7UGCAbJsAXGK8cPR3HfMtbuhdQ2rzvpgR1tVthV7VYB/gM9e1NukoPPBopkaTWA1QrUvW5RCodl0GF0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by VI0PR04MB11575.eurprd04.prod.outlook.com (2603:10a6:800:2fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:12:37 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:12:36 +0000
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
Subject: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
Date: Wed, 28 Oct 2026 11:16:08 +0800
Message-Id: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|VI0PR04MB11575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eeda5c5-3712-4dc8-daf0-08df34a15143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|921020|261026140227099003|11063799006|56012099006|261021121427099003|260925021911599003|261009223027099003|261022105027099003|260925022911599003|260925021311599003|10067099003|261022075727099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4PyMwPuD8+YxLux5WyHRLlXX2Stulq2bY1nxTAbS++sUuxf5UfaTQ819WtbM9RPtrQTGIKexUD2cOijlpnzti0RulierJhDd5bZvaD42kuVQ3zsxur91Mvm/vsYBoaCrqPtOltSQa4c2bEAxohKu2L0kXz72FgURb3T6pv9Sfa1z9F0N2m8sT5wUugYuLRMFjDv4MHm+LqXU5u46FSvXPs/SK7GHxDHsfbh1wUZq7fI6Ciq1Vt6HGU8sI4P9y5x+QmULxAvDO7zaIWiGpSexHvPHHpYXoL2PF4sSe344LiBXqSgRq70PDB6xtgN6NFAtnQbOsRe4KBv3QbTkswn9jlUPknVAQsOr2OaN/2f2y7ADwwYPrlxebW6PIhu4MJCwS8zdQ7cJmmc0vxlWs4K1ooyU8AypwMynhhT5CNHamYkfqpO+iextLXZbUTvLqT7ZkTMUBblUDFOb7cdRqZvNrAef0LZ+tvq0BzQdOpJ8c1Xh28M76ay1H2rfOI5y7EIPm1aSWS+osjOHJQvJEOVl5tHWWRXlqqNZrZVqynwvmKG9zlqn4gLonhDl6Kv3Va13Du+56gSIK+DMUcIAwiDAkPcawH2a8kLCy3zoo9zVFYNTLGRMmdEHG3yKm2sILuj8u/piKYzlNtVGKAPMCdmi3221UMkUVqtzf4+nkssYJHSQgey9TegTS1jNjFIwwQfq9Tz8DYx4Fuav1e02jIgNLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(921020)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(260925021911599003)(261009223027099003)(261022105027099003)(260925022911599003)(260925021311599003)(10067099003)(261022075727099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FFf51E6UCNxlXHWox32+sV2SF3K/dVVMIvVSu2iErxcfO7u6H/RQS5ceMiTK?=
 =?us-ascii?Q?THs1lRHq9PhFsvUQA18TRZbP195UIT6+PYV19rnGnnrJ+b0u4JFoTZu0a9Ls?=
 =?us-ascii?Q?7+r7NGJ/H+2dW7HMwjPIDydbvaxl9V8ZiCjVEtwsEOeh02J9l4qrB6urzfVF?=
 =?us-ascii?Q?qI8uTUUXoKgbgefBsPni4UXxwFwPQMUCIROVNx2AYCGc+blRAah12DqloHwj?=
 =?us-ascii?Q?Fkxe1Rgpmj+BnvsR+jalUfScGqr6It3cx6ZO6i28GhrPpOKUi3PLEvvYi4rw?=
 =?us-ascii?Q?PHaH44L/KwoIZ8z7APQEgzmc5Uleiazxv4aowTibIqbNhNg+T29/rdG+M/zR?=
 =?us-ascii?Q?wPcxC8lvgCiTjyxyBrxuaqR+PN+MJnCVbsmggzyeKcSR/a/+tW5y2ruLM74m?=
 =?us-ascii?Q?PmmO1yQdqsxO3LKLTxb7qPRlMIOTKtkw3CKjHXE5oS+AdWlbawdXC4F4gS/B?=
 =?us-ascii?Q?WnLvgiJyf/Ukya46uZmADlgSFZyKLrEomIkuhXIyahVTaEwbzstjBZL7RzVM?=
 =?us-ascii?Q?yA8Xpn/sr8iZLEnNGac33FMQ12XP+rNNZNsujkJWgOf74YhFXIyjRf4HcmBo?=
 =?us-ascii?Q?RUajmMuV56G3wHB1+fiZY9wDVfKXZciulciObucp7bKPzPcE965HNRnyIkBa?=
 =?us-ascii?Q?BGBrIgSnDOiXxanmobWMc19NvKJ7jzQTebpXSqpBjKIADxLcGAp3JbqgtmH2?=
 =?us-ascii?Q?fyNjOjLIlRwGTz2NHThz8u8y3MY0nLeteuFiF+frsbZJrDk+xt/+lWI6q/OJ?=
 =?us-ascii?Q?1cqtUepQ5yPZ8y3S5Q+LB+yQrxQI1txS7xEkQTfxvRZomMnj1f2YljnCKJqd?=
 =?us-ascii?Q?uA3n+8znc/VJwDo55JP1b6dAI9bppGnEbjJ/oxI2TRE1AJmUcMesY5mVXbLK?=
 =?us-ascii?Q?SZyY9P9XDINlKUPd1I1HQm1F19kHpCzP9aEBqboY1db/UWVWNTruafcRmEYz?=
 =?us-ascii?Q?GlMqqEPimgTwg6m6LATjD7VA2/3v5IjDpEoMubkkQ0wV6OZywyHe3BGf40CM?=
 =?us-ascii?Q?ulfGsm91KxVU4ljobHK6UD4cWh3tDEo0iI/CKg+DvHc8UhOtyW/+fwb5K9hD?=
 =?us-ascii?Q?yFjsXEBncV9rT0dbLArzCiepOPLPeujUe7/fwQ8cvVZ4pE8RTWByrLz4ixzo?=
 =?us-ascii?Q?ue3BGIcCvxu+XE+/IveOKyswGJ2XbccDGI8fLu/di2Jz6w8N7mDXWpKMZ2Wp?=
 =?us-ascii?Q?v5tvMhO/abykkPKr7BOZl2P84zKZi6NBp2UR47CHyMn4mS4ONJ2sSiV7jkw8?=
 =?us-ascii?Q?rH8vu0AVbtJMQubnICVxAPU36WaBJzCwsGsh8d2a+wvuxeWqrpPeQktQqkdk?=
 =?us-ascii?Q?hb0NDe+Xwa9OqXYm4g61CkoNxbVN5GTmyZSO5dQU5hBJ9duAgV7p1o9Od/Js?=
 =?us-ascii?Q?iwJ4/4i4YKprbS8fF1foH0R8KU0ADAC+MHql1GMh2x6vYWmyTMexGSULjXjM?=
 =?us-ascii?Q?ytux98gaRBTGsLxLgtLj2zsBGwt/dgRNY/Itoew761SYXHZYikJRgQp0DFmc?=
 =?us-ascii?Q?4Gv39nMXQMHO+ObGc4GB7+0+P/05vazWluqkGU/3FdnIkpNodkNBdVXCXYyp?=
 =?us-ascii?Q?pArmWihgmHcKBh6ufsC5KABL0I0/vMlF9S+Vf74b3vKsypPjoNERQlF+8ZGI?=
 =?us-ascii?Q?eMtINo3RiRUQSOMcs55iS8JiJrPT/MeYw77Z3/NMbG+XYzkoDx0r5KjhMMDO?=
 =?us-ascii?Q?imZqNFxbZk8ztQM5a9Msbm9c+mrA9hW39B5MdZzU/rNXK2i8mtxfZXM9xIIu?=
 =?us-ascii?Q?hTGHDMPBcZC0aBicCh7LXi5L6dHLNR+v6cHLNPnKlvijmSonGXkK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeda5c5-3712-4dc8-daf0-08df34a15143
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:12:36.8900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz0g+S6u27xn6pjnqe8hB6v0ha1Jxzp42HziDKnswCFn0PKmnPYdhaBCrJ8A+ZdfmZ7bAh9qwltNcuwd9y9DOZeVY/O7VQNAYl4r6K+ZpF2/uxlwjxUdf/4FSfnh5jUl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11575

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- remove the duplicate properties with dtsi for mqs1 node

 .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
index 7785eb1a68fc..4d325e848aa8 100644
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
@@ -390,6 +396,67 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
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
@@ -443,6 +510,13 @@ IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_LPSPI3_SCK		0x39e
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

