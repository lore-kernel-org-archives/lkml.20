Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0051FCDA;
	Mon, 21 Sep 2026 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029627; cv=fail; b=h2PJDwfLAXXAkl9Yw1OP4+fCgHA8Fp5W4MJknTAAsOZA1gNkGcNp/Jpo+ovldBSFt45+PWus6n+956kpkN2jZviFRXmdFIelCd0aq9zKhFE6f966q9BRji3vkSarZhJUbNe9OahwqYciLfMDeOEbhq0ya6ikqHdL0eq/V/y6N8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029627; c=relaxed/simple;
	bh=XW+9odDmh9jKPsiFURjDIbjCxIk5RCIYGolzb8O/2DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZ5+5/oZcrBhLkkdQ1Cc51PTw0d5dKJWXC1k+0GPax6LnHN9PsZPApCZESBEjQ0FsfJqUzpiYjO1lej88FmNlHdNt4SQTdIc0C9eUuJs954n7EM2v3CQ5DtKYi21o6IMYWd6r9ktPIXTDIF+jxohGuVqKRBbd+9ROoPmtpXp2CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QbUamdJd; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QbUamdJd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jse2oE5DDS8ATQ4J/E/H596IJWYEG2mMoT9GdPz5rzOWkWu51QJ0xgtiNiaaSRiAlZb2FdxW0YiFdxYiQMzIaloWFgUr5BJQxKQzPvXmTzg01Ks4ey4CB3SSENwo1Fyuj+uhpnS0tprYcB1Z1/7THnw3nu4TaAnrOIuIliPVzR0IRC2UM0ghPSTNqMCM+N6MMAu709h/qiaKPkhOuJqLjIbBO7MqeoaRmOsCE5kcxAMIZa9N73KbNJM1t4Bn6KPoSpU86mM1cPIwK1ghxPf1jiG8I8+YSqXZAte1WnGj0CJX9L+HDF6Z5Uf9Ko3bxy/wY5VlDh4J/GlzTquHyTxJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5O9V1UbRQxeIWyRdGlwl3vQORc23JRO9K+ts1gs9n4=;
 b=jyInE58/DJP1wHV99nqYlx0/Va3hk+ZajFidHCfy5/YpnkmZ4fbkSIwz4ziBnMpIU8kVSSLfAeGGTnGdny9srRIH8+cs/VB+1oua6uAS2oXreyfEbG1KINndLKWd17/+OK+11/NBI1p4jqoAPnmWuNzWSPuhmRYZZi0gDFxhMFOegk5LHdeT7TQzztJKwzojh9eaxF+ldrakpdnd+SknIatE55916lXr+kH4jGgEO5qBA0GfptKBj2FTxuX5TEl4YZ1J4Pj8syKFnYTj6GojyMEhY8JhMR3x3f2uF63R6SuWAq/wK1pUckrOT40P6JrSAqGvZcqXAjWXcbj3uyluJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5O9V1UbRQxeIWyRdGlwl3vQORc23JRO9K+ts1gs9n4=;
 b=QbUamdJdTTenUuYSj6+u+mNQM7fv2H0FFZM7EU6riNQca4HxZ9vEBT0ebBPncyMyD8oq1Y/YQwkY29ORxsIxNYS5esHY37VRahxIPZPMj9v19hwzfAFzlM6TLsuRM2//Av58q3IAz0FWTu4Cy7FWn487aSA9wV8lmkRtyrjbkos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB9927.jpnprd01.prod.outlook.com (2603:1096:400:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:27:03 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:27:03 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Tue, 22 Sep 2026 00:26:25 +0200
Message-ID: <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5cb8af-b059-404e-a906-08df182f7605
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gpiUt7DO+jawPHTWa370unR2rFEqGMLxzLcptEsjsjLWuWPHovJUYbDFbnEhAL7L5Antwsr/zA7Nxou+7+sDSGcvJu+g0R7WAUzxWH3MYb1nFNcfs7yG7krCnXT6nr0DmUNFR57GCXe260LZ3zqg36bQJoapBbrvPm3NN0ffHApEIsOc4GJCIRFog79wfPZ452Fg12Tp/PbYsatmbJYFgq6GU6wpbTzlpJ5aXW5IGhcU+HIE1bfjHzRZAhIA7+okrxwQEzT1D92qFPlWD2VC/MgNC7e9UW9d5fLuBXsv3rVyPtxw6iEhs7zW87q7OFqAHhGExsMxfMUIGwpWvXyKqEnXK1zFnNnOq6suChSpG49wlE4Nvvi+qZkdXdpeZtyU04U9W8kLcu3e1xc85/6w9udDkwosz8FCZn35Dj4o8oGPUoNX5G06einBJE1bucm2O8BlfE4ySuvh8QKt9ods0wsropcGSfuhm2BGTbryvrrMg32TWkm052sisqn/uFNojqvts780ts2dU3Wq8KXVFHxmnVr3QQidc68IMOfdB+j2XQHZqnToeCZDyLfRWueYMDsIjc7NenuuB3uq5Tl0+EmYFP9mVIk64SJBRVPIVeU8+9d1j5GuE8SI2v34nw11UOgYu0iOGAWCVLYazo38HY2kXMCc84hn7Bo+OZEcm/zVryN5Royj8H8p0JJTQW0rrAlehxdXGk2UZDTLufKDGwWRIPeS+OTXYyycGlEg62c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QUzbpFRXhx2g69+qAZVilWL6QP1byXhii+Bc5DZlBF0KKUw5dhvRAhSD/KE9?=
 =?us-ascii?Q?giVhbpoeXZ2OgLnLKRJkH0d2G0kzRf8KJ3o0I9rxPSWaAgZ95NOfEiKjHEW6?=
 =?us-ascii?Q?X/msxwPdEFhytfDSmww+aCmEm8PVQHSjmvT/BXpFHQq0Z7h9hJXj3IHb3NYl?=
 =?us-ascii?Q?C7ALM9DhfngX2/7qpfMtrFkVItzl94J0RX4ODhPRisDtaI4aFX7Arv450zB6?=
 =?us-ascii?Q?OYxH537UFdUDDofMTYEhC7lXfnQppQe85rzCFYjFNePnsvHynwclW04I6mVq?=
 =?us-ascii?Q?BwU34krFbzxwSzg/MkeOf5arTNNTXP/4PaAQs2aKlXOXmBvUc2EPE1mE/B+7?=
 =?us-ascii?Q?13wOXEwGD8C5cDxhaHHYwWf+5OxeRc800EXuRGsucnsg/5thxtBCUkU4l57h?=
 =?us-ascii?Q?5Aye8dPzN/Ax1qwTSy6BdJa2hyhhikPJ9ocwdnun3ytc6AepWKjfcsvSHTIC?=
 =?us-ascii?Q?mTHHOffgaRcx/IQO2P30TCFJ65sLg5IciHGkFcmRYqqZDnVNFHiHOMCGPhrO?=
 =?us-ascii?Q?Ux8XpDcILFmBVqXVguvx5l4hzbjSI/c3VJzgKNH7m2nFm7AHG8SWjvCzl30B?=
 =?us-ascii?Q?zFT81QG3Z/lnKYtSEktGsGNynmAp1yuLa6v7dITY5OnMJYCPb9NpLs7a58Qn?=
 =?us-ascii?Q?1go+IT2BqejdLDA5ZUdf1Hzs7iaZC9g92T58IgEaSNSH6IdAsK4t7LtyPhKY?=
 =?us-ascii?Q?XjOAb8gCTYgfTouZLsDdFU/bAlsxC531jFq9UWPsEr2DemQqemUszbPcRaZR?=
 =?us-ascii?Q?07i6T04xGm/IynYsOtsIYfj2iGrwLPBYTdC5ljDgOldf/1vG5pUPmRn3SzXE?=
 =?us-ascii?Q?4WPy7BuGwzNxlHxwsyWs/amW2FKUCSo8u3TDm0lXQM6+fCChwaauzlVma518?=
 =?us-ascii?Q?iuNl1A0AFaQjR6z077LqLTaj0nedh+9OfV1+f99omul54TlILXpNxe1/lR5k?=
 =?us-ascii?Q?25KmsaR7TwTSAeTGGpT4hkaci8+gegJuj2/JaATuJoDt0hi/4w0OL4souqz2?=
 =?us-ascii?Q?3Wye11G7QAmTVMblLc2yDGFxCdN76u3LSoTeRyWgkDy0eCYMlsxuK6uYMVJi?=
 =?us-ascii?Q?nG+zPkQk5iqsCqEUJwgR7Oltg72beGPRYFvnPTF4htGNZTdWEzTcq3kpWpGs?=
 =?us-ascii?Q?P6yqxtRYX85Qh36Yb1yDmq1weWJK9uZmMj3XzKFHNhGDdyBXmCqWBu577wME?=
 =?us-ascii?Q?eesa9sjlHk45kEquwo4+KQStC39CrPcJCSRIF0jBDF4Qs4NIpJy+WdouHMEW?=
 =?us-ascii?Q?dckGfJp3Uk77z6/FxRrHrxSiqbV93o5LQHvRhSJyerjDnHSQU8xAMQsSdouL?=
 =?us-ascii?Q?1WFsfQvuE1RkwnoUdZTqFZ3bftcSiORQjr2z/pP1DIbK66gAjHaDqFH5MJ6m?=
 =?us-ascii?Q?UAJ1V2v54dk93iqpzZV1JapAo0OX/nKFQrthfkRbv594PCAsAK51oqauhacF?=
 =?us-ascii?Q?hk/IjbQOHUP9yQ03NbV+mnNS+we893BpxPALsOMvEccrRjYANlOQ+u4/9vvB?=
 =?us-ascii?Q?R9H+ZLbYG4Oc9SZFy0x4elrv885L2ZeOlrUcPiye77Odb+33K8ImT7pWhm7b?=
 =?us-ascii?Q?kYJ/+ik4tUeFNRNed9VIyRR+H3m6ju3SIV9Y7QsHtUogsbHALfcX5RirkR+D?=
 =?us-ascii?Q?2Eq0G5TS/hi9li/yUpy6NPJX+8dCq+7FTF9aQ9T2sN8Dbvs/5wm7Kp4a79H7?=
 =?us-ascii?Q?3fbQMbxFP9MYxak4Hbq2GqSuriukn5kPpoUMdmbtIxGFwfH2afH/cRZ/OVaZ?=
 =?us-ascii?Q?aFLl8ZzCOVaSI7lmDpOtexSQD2WX+gEKW/Z2LR6p6vByg9/G++wY?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5cb8af-b059-404e-a906-08df182f7605
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:27:03.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Mtmjx0xwsdcPJ6JXAEEDcFpsE+dCM5XDuStcBOnIJrSqbWvmg0w8oBxoMYXsN/j6O68TKVVxU3i6PdkHlnzbvxwk4pNn0I5pibrA2qvfr7Rnq8E77ab3mCL6Eii+NX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9927

Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
USB5_4_HOST connectors support host operation only, while USB0_OTG
supports both host and peripheral operation.

renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
EVK, so disable the common USB2.0 nodes in its board DTS until proper
support is added.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Drop usb21_pins.

v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts in this way
   we can drop placeholder patch.
 - Update commit body.
 - Improved usb20_pins, usb21_pins comments.

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 20 ++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 31 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 25 +++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5289efd1a430..ccd6e6394532 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -71,6 +71,18 @@ codec_dai: codec {
 #endif
 };
 
+&ehci0 {
+	status = "disabled";
+};
+
+&ehci1 {
+	status = "disabled";
+};
+
+&hsusb0 {
+	status = "disabled";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -122,6 +134,14 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	status = "disabled";
+};
+
+&ohci1 {
+	status = "disabled";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 14f5834082fa..095acb87c20c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -301,6 +301,17 @@ sd1-data {
 		};
 	};
 
+	usb20_pins: usb20 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
+		};
+	};
+
 	usb3_pins: usb3 {
 		pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
 			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
@@ -397,6 +408,26 @@ &ssi4 {
 	shared-pin;
 };
 
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
 &usb3_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 826a11ab93c7..234ca287ed28 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -84,11 +84,36 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
-- 
2.54.0

