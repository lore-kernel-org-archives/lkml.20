Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435074A68AA;
	Mon, 21 Sep 2026 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998336; cv=fail; b=mmAlHUccZdowJ3qp1wuuNj073QYbvfYRYSVewXBD/yzvTELDnB5NAXsQn2d3Tt54MYWnapQw/u6uk40gtVqv2WRmafoeikov8EGMz5ZWRE4CCYRf2tIqMa+55bGr0oIF1kC38h/tnOlOnaeTUh5BF1gzfju1kk35GHafKWKrqdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998336; c=relaxed/simple;
	bh=SSqdKb6M4bFJ1T6w0KsUIKtHiwGBtzc7kgd7iU/cD+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbBzoti5N/SDigDNOuvE4PpWeslKVB292jkbiBXrIvfEH8+rP0yWwgsAgRt+qUQ1EYfRdP7L3JQR1Hg6vWhDNN3ArPSl8OsJBUCvVsnYgQfFqNaDySQabGoPJFBdpPC+TcVgj5eIdPeoGDXWVRqt8V8rRMaeXPqiw4VdpxqZZsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q2yuhN5x; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q2yuhN5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r92OlWJwD3VyP0RM+QnXfNrTgf4u1xqzzbkjm8kKPQeulaUzwRLVRvZjF7F9pueQfotfD1LhcrtqRr5E+09BLltj4OHhS2mAuprLuhxZhiZytgzq+JZgrSNeaM8CuTy5+iy9HYFMukzXtXC4y1IueHgk7O0ERGzLULJAMzagvE4s3Tx7eij53Ruuf9XaVplu8wAFpChqWWYpbcDappUzf0mx5386GeKQBSH2LBz8Aks/II4q6fjTSJoqxbL0tzP2ZNCPY7xYGzbhx1tD2lc3FIJhogvfnv/Nl0H6YistKQzZEb3e0hHQlLaKI1YM9HZLIIdCpG6nuFUeP+hjMPaklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CBgilYwUD841m+poBcaIjJwLcmO95glqKcTRG3E4Ik=;
 b=M1Q/xOM5A+qbPflHeR6+uzi96kcbswKGlOm1tewVjG9Agokuj6fx6M7YBVX/XJ/OH7UPRp0oo0O6DuQlcTbG/K74NIiyRu7iXbENOAn1mnN6ZS00QsonMhRtG1MHHWSXco5EX37S8utwdjO7u49Mv+Ey2Pt/5Jn4+TG5sjmZHyo8H2Sa9Cv3v69AUfB9h7J4eNtVy5fkuER8MfrJp7K0slNTumBRShDSQr34cuoU9Fhzkg870RkVx75RfxdfY7ik/szSSQiJWB0NW57PEpFHOwA+Xme6Q8zxCtV4c5qMMlmeUXsuHx447b1d3zBxTnWensWOf4TuzIU/eBFlgpKyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CBgilYwUD841m+poBcaIjJwLcmO95glqKcTRG3E4Ik=;
 b=Q2yuhN5xiF5cookJhy0WgQl0+pccbiR4rcSubgATb8HjVQ10jWKgLRA+ESK6dFhEhzFlkoD1dQzdWCXSIFZzfESpG+rKUwtR/I8VSKrYqyc+xKPf9shVsFAoK11d/qHb/xs68MnYnFg69VgaUWU7QzjAxsATkt3Z5zoI8qiTxF0=
Received: from OS0P286CA0117.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:169::21)
 by OSCPR01MB14694.jpnprd01.prod.outlook.com (2603:1096:604:3af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:30 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169:cafe::51) by OS0P286CA0117.outlook.office365.com
 (2603:1096:604:169::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:30 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 481EB3000279;
	Mon, 21 Sep 2026 22:45:26 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/9] arm64: dts: renesas: Add initial SoC DTSI for RZ/G2M v3.0
Date: Mon, 21 Sep 2026 13:44:27 +0000
Message-ID: <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|OSCPR01MB14694:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e674906b-434e-4306-47a2-08df17e699da
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cK+A90VL4xZP68xX1CyuY5xfMPGOnwJFfCFiBwp+qCaqupALlioOWc49J/bZyPY74jvlJ3bB27F7rkmtLv0xVwjndQZKHUbO7ruPDMra5GbVqFG8nPBOXBMatWMoy+aNZcLkGHQc/mx2B1P3RtsLVzErZyzCH9OgqJflk1h2YS6ndKVcFSts+PWDdYvcyLy150oaNgm5VfGE1yIw0vRowtYbchRitw79k0mbBus1GhzPLOss9IXZy96gnz+9xjXXCS9w5ic+hrDLikWbg8DNoHuBcjq1B51nEp2kuHckVpXB0jLk2EomfBpX3bTLBdvTcQP3pVlpNl4eF4Cl7B4V84lBdKhAIjnkbzYmP4wf95tzi9i+0XIvd2hfxLVJJd62g25f1SXZxhB5X1cW40i2KDHG3lE9gmuTatWOorjRG+IMZZrlnd4tDde5cGXtWs+fa/TnAvTFcHEUgT+s63w5bjFTzIlUdsyKoypN1imySxxuvbRRrNzhHYyGa4XoRMLCEhr+wGsctLEUX62mC4alWiwxwkLHRz1v/n8yKV24xTIXr0hN3zbkHLqpZG8gVHKyDOBTEmC+TpJd91POOjFT/pp/dpWsjZnWg0OwDowEkvyZrMmsvEX1x6lPOVwdHvzwCbT/M1+PBRq3iCgC9QFyYyLB1YU6DQGoKFDh94YAZP0cX+tslXZ5ZcEz+t1Yaa43tbIpVVqYQSgW6d5VDdIFtw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pk8CpbR6KB+ZzO/XrsIOLDMvHSRdWhpG5YCj3dPPWd3oKgCCWVMJo04DyXsxN2yUSR3tKI+lJ7tIJSYKv1ybwNBoBBg8OTEaWMrqJa8qJsnrSPA7gm5myL3JKRhItvSwOlFNl81d9aGlxH9kxofWVk5jyauy3ojTK+DNTFGbq9pnuk9vcT+s8CWr6H40MNkK14U87/+cbnDdoxljxP07U2xuTrNUXqVdAE4CsIKhCcQbXtYMriNPBxCKGEB3mGsg8A1cUYsAMhhsZCTMKZ/7MxBuh2gkhCiTqkYqQRsELbK3g3rew3q5L6CTM8ZwfNbcBUiJr6OUOmW+xNfFXuAbuyMZdF/gjnP7PZdJNGmPtnpneUCAG7XZnezWS4HhWztUPD1+EEtNxfunwdz/dGZylm9ayNaRpikDw4v/5qk/qunpj94BFbCOp06plO+cv7wM
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:30.0407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e674906b-434e-4306-47a2-08df17e699da
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14694

Add initial Device Tree Source Include (DTSI) file for the Renesas
RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Updated include path to CPG, SYSC dt-bindings
- Replaced underscores of node names with hyphens
- Updated licensing to "GPL-2.0-only OR BSD-2-Clause"
- Added soc: label to soc node
- Updated register sizes for clock-controller and reset-controller nodes
  to not use odd sizes
- Updated register size for system-controller node to not have a leading
  0 in the register size
- Added Reviewed-by tag

 arch/arm64/boot/dts/renesas/r8a774a3.dtsi | 302 ++++++++++++++++++++++
 1 file changed, 302 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a774a3.dtsi b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
new file mode 100644
index 000000000000..e8adafbf0104
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Device Tree Source for the r8a774a3 SoC
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h>
+#include <dt-bindings/power/renesas,r8a774a3-sysc.h>
+
+/ {
+	compatible = "renesas,r8a774a3";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
+	cluster1_opp: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
+		a57_0: cpu@0 {
+			compatible = "arm,cortex-a57";
+			reg = <0x0>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA57_CPU0>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			dynamic-power-coefficient = <854>;
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
+		};
+
+		a57_1: cpu@1 {
+			compatible = "arm,cortex-a57";
+			reg = <0x1>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA57_CPU1>;
+			next-level-cache = <&L2_CA57>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
+			capacity-dmips-mhz = <1024>;
+		};
+
+		a53_0: cpu@100 {
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA53_CPU0>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			dynamic-power-coefficient = <277>;
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_1: cpu@101 {
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA53_CPU1>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_2: cpu@102 {
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA53_CPU2>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
+		};
+
+		a53_3: cpu@103 {
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A774A3_PD_CA53_CPU3>;
+			next-level-cache = <&L2_CA53>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R8A774A3_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp>;
+			capacity-dmips-mhz = <560>;
+		};
+
+		L2_CA57: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774A3_PD_CA57_SCU>;
+			cache-unified;
+			cache-level = <2>;
+		};
+
+		L2_CA53: cache-controller-1 {
+			compatible = "cache";
+			power-domains = <&sysc R8A774A3_PD_CA53_SCU>;
+			cache-unified;
+			cache-level = <2>;
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+		bootph-all;
+	};
+
+	extalr_clk: extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+		bootph-all;
+	};
+
+	pmu-a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
+	};
+
+	pmu-a57 {
+		compatible = "arm,cortex-a57-pmu";
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			    <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&a57_0>, <&a57_1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		bootph-all;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a774a3-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>, <&extalr_clk>;
+			clock-names = "extal", "extalr";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+			bootph-all;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a774a3-rst";
+			reg = <0 0xe6160000 0 0x200>;
+			bootph-all;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a774a3-sysc";
+			reg = <0 0xe6180000 0 0x400>;
+			#power-domain-cells = <1>;
+		};
+
+		scif2: serial@e6e88000 {
+			compatible = "renesas,scif-r8a774a3",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e88000 0 0x40>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 310>,
+				 <&cpg CPG_CORE R8A774A3_CLK_S3D1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A774A3_PD_ALWAYS_ON>;
+			resets = <&cpg 310>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@f1010000 {
+			compatible = "arm,gic-400";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf1010000 0 0x1000>,
+			      <0x0 0xf1020000 0 0x20000>,
+			      <0x0 0xf1040000 0 0x20000>,
+			      <0x0 0xf1060000 0 0x20000>;
+			interrupts = <GIC_PPI 9
+					(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&cpg CPG_MOD 408>;
+			clock-names = "clk";
+			power-domains = <&sysc R8A774A3_PD_ALWAYS_ON>;
+			resets = <&cpg 408>;
+		};
+
+		prr: chipid@fff00044 {
+			compatible = "renesas,prr";
+			reg = <0 0xfff00044 0 4>;
+			bootph-all;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
+	};
+};
-- 
2.34.1

