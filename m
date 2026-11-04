Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777895;
	b=4O2rS5LmR/nVJIZr+RNYDaEp5T609STjrqoPUVLooHMwYKbRP/C4/SERzM1bg0lNBjIQ
	 2syTxdQX86A5iNYcdWwAVHmBauqMVym5kWtloG9GJ5xoL+Nik+54okk7lXtNREm2Pvdp6
	 Meuv+ENNL4em3zeNBBcPFG+UqS8NeSZd8rmlpGim7VtPanQKvrh8IE3mKkqQ83Eh1xu0A
	 Fau9xGr+XZHwq6dxlMuCbmTzcUj/nqE+hwzPwOqs8osnyqXMbzfDMqtWohyMkqQBqjaqm
	 GcpSkFfl+i8eYEegvpiLPcax+qs5ySiFYWGVKJufNLa7YpkmasqMrdz1B4zNGifq5AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777895;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lpjKEXE+EgZLF1QDHkBYDLLM4Tv3cH7IqQT860HM0ik=;
	b=i6qvFw8etgujJ1YDpH0D70KQrSspG1oGGFC4vCSrElk2ohL6M5diwwzLxFwpbShYy12X
	 qk8iGbnQx8N+5kAZmCojuFrCnf+Uji6AhcykWw7N2I9xngvF8xQ1LGh9oxpnkIA1a0JBR
	 Rnj6lHpISYg5BeZZWLcftP/TmaSTqvVXfIB0r1l4L7H1O9D6/aRee1nDzL4h0XU2vEt9c
	 skGtrD2oku+421leIF82I4/GD5+mHBKl19SuW/rO1We5jdJjTRRuL0NfYS7Id4AkE19yW
	 7lhDuysrBCYaDX+OUmBqSCHGkpwyTbLeq0oU2h3LMhlzh51anCkRkqvGCPb4xPcnmFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=FWX5B7rD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B8606D80B;
	Wed,  4 Nov 2026 07:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4B8606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=FWX5B7rD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTr1UOXh8NiJ4jpJNvS3C05QuYneCahB2eMvDp1CS101mGrnYNk/IqtQ8+2zpmSR18pQIqt0QUdUZgH4BMRgAlKqD6wnfqfRZ/oalQt6hJuO8v1NdnLXmDh0UEj7t6+UlRDd5c7vosblZ+VN6ql2/OA7/OTH0G5qhfxWwnuRu1sZ8hu4SfOdS1YyTit/8fa5keG3MOTxwJ1LAtAG+vUscCuDtMgW2PnYV4nHjeyzzDe0gr5sXHdRB5tY1eEN2ZECs9LUna5QJLMZ/tzpWxv7nNfAvgl5DnzuYVCjWB77OHdpOv+cQ65lIZY1oeGUpKy4/sZ+Qy5vmW5ChN1rAHa8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpjKEXE+EgZLF1QDHkBYDLLM4Tv3cH7IqQT860HM0ik=;
 b=lGlh1NthOBfoyWFOKGBFNtnriG5PJooDqdn52AKWpPxMbdBwNH7jGwRC5ykgFK7DO4iJVHWJTDcRPFPkiaSMNKphAdaQhgQj+Ybqsh9cFuSVEtj1wNJJH+M6Nri+PeeMGQZ1YtgM8tpZYNvH4koCdIhiQJ3f9Fi4eYFfowIOhRrIXP5cquP6Kme/n6hvHportZfi631F7FEhoRC34gpVFT7B0fW5kVwPb5QQzQH18UQtbx6CpI7ffENaFKppYvdBceNtSjsN6S5XLTBh/dO9zny9R6Bd/M5jNhCaNmqLlHDVQRC1G0hPtoYVlfqu+F3j+26Et/iJqviBQ89ySdIMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpjKEXE+EgZLF1QDHkBYDLLM4Tv3cH7IqQT860HM0ik=;
 b=FWX5B7rDRmQaPshqToq+cAiuHEuukm78of4W4K73JZQomHS4rxnfVkTV1+rrnDpCxf+2cCb3lBylxIWUg/wUmOhMcg+up7nXujxhRWH3hUAy7Pb22f0rJSMhquFVaQMofOXqBduWgq81Kt9hAouKyiQFrGId4tsw3QZs9qx+YH+Phog34O/+mwkgjU1udazvgzFpAUIcVtJiK2avQAxlozfHmQPabbduPhtW4+pW5ocD2BE2jCGj+QEXDjshpS0xxvnC8/iE94ds9oAcHIlLgeJkg4vjHrstszAlVj3Aw2zMfLysLIMbsa/HZrsLKrRMDrCyudTcogh9P2awnAJ6UA==
Received: from MR1P264CA0167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:55::8) by
 AM7PR10MB3336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:106::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:11 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:501:55:cafe::87) by MR1P264CA0167.outlook.office365.com
 (2603:10a6:501:55::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:38:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:38:10 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:57 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:53 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:50 +0800
Subject: [PATCH 10/10] ARM: dts: imx6ulz: Add SPI display and touch overlay
 for BSH SMM-M2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-add-bsh-smm-m2-v1-10-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Simon Holesch <simon.holesch@bshg.com>,
	Leonhard Hesse <leonhard.hesse@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4041;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=1Y/6Cryy/EYbtBVAnXUaijO/dZkGsHxngYmSXSOAksE=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVjxrum/mMCPA3+tzSSKa+aHnXWQOMPV9Wrnux2rt
 pQ3H6rm6ShlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCK7fzEyPHjc+qp+zifp3B17
 2U59WXFEsOVrnvXG7I1Z1uE18Y9uGDP8z3Q4ktnT9G+1wZntVUJBbfs1nm3rfWGtGSa/5lhzVGY
 OEwA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|AM7PR10MB3336:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea91c09-a30d-4ce5-67c7-08df3a469389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261009221727099003|261102123227099003|261026121527099003|261021121427099003|261021123027099003|261009223327099003|261009221227099003|261009223027099003|261009220027099003;
X-Microsoft-Antispam-Message-Info:
	mHjqnvxRvRM8k1QCXfxS0ZOQWHGW4belbEtYASG7uf26XwHGeb/q7Ig7zL/hiwwvGiT1Lp4NG5glbZqaCsvN5lFtkGN65LFp1DqpHgezKLwRZTYeYxYzrK6MnKnvwmc8sDyYypNI01v1IFy+DF1eEnamwFVAWEcxsSEOEdACJC4VNbxfARldU6wcxISRKTEry7oFJwRMxDWOYmrVnsWrhKeE8DppLCxIqaiFmhjq0M4KyHAA0qQvVH4juiRbC9DwqD7axB2YD9Ytf/lFvPVpUld1WyZrph66DngHndA3mM106oPHfXYj1fgEt6oxJyAHUobF6fGvCpsaZpdhCWqFE50TtaexWhUyGnvsXif5oPoTmcBvhMm4/utfnfX5AEDlufPcosuPB44HMiQaVmAVmm6723B/OYnDB5wcTND18qKYkVgZdF17F65q2afY4fDFyh6+dfSf7IApF/lfPNsFDNxfuzR5ZLE54Gz9CRCjW9IJ1FxhbphK6OiFvsXZO4Bn49EsAGKYVKUWtxQYhyAV0mHiylL7oMLCvS5S1UtPfLOEkY4m1s+wr4lf779rhdVe6asa01R4kcL7hxU/0YJYrxNXc4E7+rrG4HlFYndxBCh3SvfgpZO1BWqn3/iHA09YdyYAcohE2MYlIBL5M0Eqaw0SGLLewahZgsFdxtqhSBUeUikh/rsqm4Cj5yMexok2hfgsPaJNF3u5vVcZNXfkPA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261009221727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261009223327099003)(261009221227099003)(261009223027099003)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xSVwigH15dVJK3U4Rw9qZcuoEGgi4tcB1Bp59Tklsr0IG3uZ//I3QmY8ZfW9vRpCiAcrTAifnsyVCsH8pLtvtxv7wqTzQtiaF+rvgDcNirV6lEeJPEeZrpNTRb3y17Yd8wHraGtWkhv9E0Mg57hHUIe9IQKX6vpZ9YqMJgahKLdzR9vqauBXxbuSBIcZKYHNeCWCKzaBY+GCl1DoP7fb+exy2kJSLRx1PsnASHLmI9vkYTTYPAimnaKs3gbS6etjnXGAQyG9dut2rueU4WQgoJlKL53j0u/dJ82PXQnYBAREeRASdAGvCSGcV2Y5NLaKhwMePOGysspczQsBjDRY3jpL7nDJgVV0k89/AjmZ4G+8/K5miTALZBH062XnWGWjMyURR+r9Ppc8Cq6A02Eydw5txk7f2k/SyH9IIPRgfvVARwj6yhH7gzb38QKMMAcJ
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:10.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea91c09-a30d-4ce5-67c7-08df3a469389
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3336

From: Simon Holesch <simon.holesch@bshg.com>

Add a device tree overlay to support an SPI-connected display
and touchscreen on the BSH SMM-M2 board.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Simon Holesch <simon.holesch@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  4 +
 .../imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso    | 99 ++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index de9a317132ed..9b27d2f0fa89 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -421,7 +421,11 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-var-som-concerto-full.dtb \
 	imx6ulz-14x14-evk.dtb \
 	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-bsh-smm-m2-ws13506-ads7846.dtb \
 	imx6ulz-bsh-smm-m2b.dtb
+imx6ulz-bsh-smm-m2-ws13506-ads7846-dtbs := \
+	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-bsh-smm-m2-ws13506-ads7846.dtbo
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso
new file mode 100644
index 000000000000..869443dd648e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-ws13506-ads7846.dtso
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+)
+/*
+ * Copyright 2024 BSH Hausgeraete GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "imx6ul-pinfunc.h"
+
+/ {
+	fragment@0 {
+		target-path = "/";
+		__overlay__ {
+			backlight: backlight {
+				compatible = "gpio-backlight";
+				gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+			};
+		};
+	};
+
+	fragment@1 {
+		target = <&ecspi1>;
+		__overlay__ {
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ecspi1>;
+			cs-gpios = <&gpio3 26 GPIO_ACTIVE_LOW>,
+				<&gpio2 15 GPIO_ACTIVE_LOW>;
+			status = "okay";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			display@0 {
+				compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_lcd>;
+				reg = <0>;
+				spi-max-frequency = <32000000>;
+				dc-gpios = <&gpio1 31 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&gpio3 6 GPIO_ACTIVE_HIGH>;
+				backlight = <&backlight>;
+				rotation = <180>;
+			};
+
+			touchscreen@1 {
+				compatible = "ti,ads7846";
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_touchscreen>;
+				reg = <1>;
+				interrupt-parent = <&gpio3>;
+				interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+				pendown-gpio = <&gpio3 18 GPIO_ACTIVE_HIGH>;
+				spi-max-frequency = <1000000>;
+
+				touchscreen-min-x = <184>;
+				touchscreen-size-x = <3869>;
+				touchscreen-min-y = <141>;
+				touchscreen-size-y = <3959>;
+				ti,x-plate-ohms = /bits/ 16 <150>;
+				touchscreen-max-pressure = <255>;
+				ti,settle-delay-usec = /bits/ 16 <150>;
+				ti,keep-vref-on;
+				wakeup-source;
+			};
+		};
+	};
+
+	fragment@2 {
+		target = <&iomuxc>;
+		__overlay__ {
+			pinctrl_ecspi1: ecspi1grp {
+				fsl,pins = <
+					MX6UL_PAD_LCD_DATA20__ECSPI1_SCLK    0x100b1
+					MX6UL_PAD_LCD_DATA22__ECSPI1_MOSI    0x100b1
+					MX6UL_PAD_LCD_DATA23__ECSPI1_MISO    0x100b1
+					MX6UL_PAD_LCD_DATA21__GPIO3_IO26     0x0b0b1     /* SPI CS.0 */
+					MX6UL_PAD_ENET2_RX_ER__GPIO2_IO15    0x0b0b1     /* SPI CS.1 */
+				>;
+			};
+
+			pinctrl_lcd: lcdgrp {
+				fsl,pins = <
+					MX6UL_PAD_LCD_DATA01__GPIO3_IO06       0x180b1     /* LCD_RST */
+					MX6UL_PAD_UART5_RX_DATA__GPIO1_IO31    0x180b1     /* LCD_DC */
+					MX6UL_PAD_LCD_DATA16__GPIO3_IO21       0x180b1     /* backlight */
+				>;
+			};
+
+			pinctrl_touchscreen: touchscreengrp {
+				fsl,pins = <
+					MX6UL_PAD_LCD_DATA13__GPIO3_IO18    0x1b0b0
+				>;
+			};
+		};
+	};
+};

-- 
2.43.0

