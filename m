Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924B32A3C9;
	Mon, 14 Sep 2026 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354276; cv=fail; b=k9Wbh4IQOIFXHOAVSy8JHIZjVH9JprhwAJn08WJSoAL3Qp3yNZFWVpp/POMaJc7p+XcJg3/JSTengpQqc8UG0S4+bkEWK+vr1Iu3XjDCvFSp6tiBLdebUOA1Fj4IRvlw5MgA2kVJiQoe0YuGVmfD3/qHNzeaR6eEr6vP+PEqwsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354276; c=relaxed/simple;
	bh=noxIFUgk1GgLXsqtUBOWRnI4ASUyj9LXyCg4ECXBi5I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWapPuV6kABxYcOQ3cm3fFzFhTjt4ryGHIl0BYPd0FZkT8CvAxGNUNuvY9qYtmdw73FUqam7fBv7viiCFufLXSXaX4dSIkvCLg1pedSAHiulwFlHM5GG18ikXpQClvBbSwV2vcBy+tq3yI+wLdf4vw/dp9FIZzQiuE0UX0DNxrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oyrEx8O6; arc=fail smtp.client-ip=52.101.43.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oyrEx8O6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abg2pe2HYhP8wOMR53Tby4o5eddymP0L9my5nosB4J9dH1AvC/oCVm5JsQTBs+GlU00ox62KCkaqaYDyNcuzyLVyUf6sl+DTHBG57PMEEsD1PtvDpB4YxbV8fR9Z4Ohdk/tRHh2ikh8q3JN7OXk8RQ2kR/KIsShozBOfM+Y3ylTqt8XBJYxsfIC2375PGVsAcSgGjkWg+FtwEOIZ9jd+E3bXYMWhKGdsjig4CpOzHI69xF4oea2zemUEMVKAooiuSocp8aey+oKoknReP9qhC5WYx0WS2SKVYxEo8BykznZ0p3z7tKwR1aI9XQUudJzitOHREJS5ftD4JiOVTptsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3bInfaLLH+54YCwEVXo8eVMZe6orJRP7jlSGWaofS0=;
 b=blF+OsJm+AwbA6PLerC5+JHdA7IbfuTuEOm1YXM9dcN4Vkne94hlnR9h1qzwvMYTvQcbsDfJOA2fnmqMyFA8nes/+8rUXaQ/aQXpjZ9Ozx+bkMEV30kt9Zlny/8DJZ/FZVVW2uV4+npZoszCT7yPoot//SpHztl8UnYokMhXE6wjyrZNXrvtg1kWIZ02i72a1PkCywN5Ntl+aCdgKFkeoUT4bpmgQfgZ0MaL9On1QM9/jgtFSqu+Vn2v9gZwUxJXfTmItogKJPcM0wHV3zyU0RZbPQJiYqdDDHtJPKpW7CJg3srf2ueMXTVRqV58Er5tVMYxhm6UThsnymHTCDqLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3bInfaLLH+54YCwEVXo8eVMZe6orJRP7jlSGWaofS0=;
 b=oyrEx8O6yHccb632Miw36kdxECPbOhkF+2iggM9qV/6vNeLy6fJ2bkMkmNsAmoMxBqzYo7ypB9/28el4MZO9ICl9o81lpBUNwwoSQRINTYfWgyVgKwHMe5b2OFlQ8maNNJAKK07B5HJAucCgxZ24vHR1GiIHgqzyXVk2SipmxchjTQcBPXmnaqXIvssh3zOJ5vAA2QUEgpZYrgL6d2j1YdMf8a5qhtjQFaJVcCm/tl/ABsDTKOeGXqse9ShGeKDolw1ZKOD7ztKb5Ab2T0Yl6nxwKDc6KGHCOei+F/fmVlmil9pskDtNL4OrCfXzF5UR/9dgAOGbryJ07yJv7vgSug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by PH7PR03MB7267.namprd03.prod.outlook.com (2603:10b6:510:24e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:51:09 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:51:09 +0000
From: genevieve.chan@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: socfpga: agilex: add Agilex7F SoCDK multi-QSPI board
Date: Mon, 14 Sep 2026 10:50:52 +0800
Message-Id: <20260914025052.14354-3-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20260914025052.14354-1-genevieve.chan@altera.com>
References: <20260914025052.14354-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|PH7PR03MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9eb432-804f-42a3-6c32-08df120b079e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|921020|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	v2fizMBbvYqCAiGMyXwcL8UwS5mirPVwj7/Nt7+06a+CHKnmda7o7D3HYb0CMj0xk5OmSTM1I15nIPIav9eQFUtgJDasdWRYIQprECjxUeYkXTUKbpcZuOUsleloy3eKplCHHM4AZK5v8l8Kr/oLsozOQokSlXJoy+plTFsnvbRubKgUxBlqsbNk+qkfAn099wpa35JlQ9qXth603c2MYCTe+6SwF/Wx3VQXIDXEtbd+r7zmtRYYU3cCHDKINuBUODpB77sAZShEY0E0X288FBLy7mojcHdaz+/PcQGXkrtxTXpAvbBVVXPpq8ppY2xUoce19sorcZmV5Tpe9v1/akjwqBdo/nE8sPtkisLgDf/1i+MyYelmYic2UAAqCkn7INqBNNN8U2BbI7JIcHKzu6uRGvxm2mUD6UrCwyVrbNbpjxVlECoyruGz/2MmsPaXD5rh/jv5lPbMrCLlrgxOH7pudEGMf0HGShiLX/1DFd4JZOYE2zu1Loqn7gKjNKaKmnacS5JUEcET42JAnu/qOOt7k9+UgSBEkpxuDh5S1kGjIolc3uqT089FWoQP3WauwcS8vd5Ec0q4JgI//SmR8M26Vc8ZGNz9+Rcj7fI3GZ8WrEIITrMJ2iGc0TGBGkdXV1iq5VzoUG/4nPkfyNrLalwBidrh52Lt+FwrR9OhEvhF1dZz/p2pjnaV9YKrQwdNk1sIe02I+AiiHrH/0GUQ3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gi6rEawMPHg1vDc5zCOVD5Gip9iIjrMLWhyyGFsUm8sEPSitpoQ2cyy+tHXu?=
 =?us-ascii?Q?bwOVGMf4DgTH/1DTtcijFe0An8QlYOSkd1nvAiWVVDQlazhdO5q2TNoP1XQ7?=
 =?us-ascii?Q?ajnErs93IPWe3iuX6AsEGkrWgNsrxUyO8MgaZYq/fbAFpkPVaREpaoQgVrrd?=
 =?us-ascii?Q?YcoQY386gQlXmLxcju241MLxt+N7ziqoX/rmbFzlNjfc9sj9S23CxhAswZEf?=
 =?us-ascii?Q?f4vMHsqGditoYelkM1pD9S6EuYcsf9kp8TIhKenwD+hOW0hPFSaKUlAQh+to?=
 =?us-ascii?Q?GcLYgAF4kFXDeQPKV1wquPpIAYYAwskdiY3Lme/LVES85T5LaF+OICNGhaB9?=
 =?us-ascii?Q?IvmzxXB/+m2TTJuCDc3T8Br279ETRuveC7fSgBHAc0rZWqMOD8bR4w4Z6Un1?=
 =?us-ascii?Q?DbeozcZJsjwKkSs10a5Ql/oyBTcmV04Isetc6XSsiq/FJ2MPi5eCkrJHjc4y?=
 =?us-ascii?Q?tSd+fw3SL4F/6cxtAGHqI/fepQ8BCSwPjXD1Nvh/+WsiauyYdpbwyPzCVhm1?=
 =?us-ascii?Q?REve+R9YMj/Mnr44SFXJZ87qPx0crlqa2cExHD4B09OykAAkQ+93Njg8eARC?=
 =?us-ascii?Q?x+loHoITf79NtCP5FNd4UEWBQdItOv+fdbayqVlLLQaMDyqrxe0qmdMfIjXU?=
 =?us-ascii?Q?uuWSoBw+jjhh8wRATAzbZHYsQkQB7XBnlTna4sEZt9OYUCTkvWlllVJ9KPRz?=
 =?us-ascii?Q?2s5GqV0JCgl5LHbgys3ZbDYB0X4whrC7SBQHBXhPcT0CZR+Bcrz9jvdONAgj?=
 =?us-ascii?Q?d/CoERNjEl5qnHy61CqeRtEUUlpeoEKn6b6AdqoJxxU17Oz2WQ6Xzr5ITcvL?=
 =?us-ascii?Q?qMbvRfezsybKzjRzI9eCifURhE1Nw1bfb71JO9lvMDqlZB1jnlm34BBOGBRq?=
 =?us-ascii?Q?Y/RDrOxpEQQqrIWLG1ElhxP07J4giHhto/Ji//Nj9E7WwnKO3pXik6QWkOJj?=
 =?us-ascii?Q?QnD9kVXWdu0c9vGR16cMya29ZB0SF6pwEQfLHA1x/xPkwk5HQJMtOzs132Q1?=
 =?us-ascii?Q?4iU0zoME5dU4kiTiSuykHOZtcnYSdwDE0coenUf1SWq+oIWYqiCW+pUarWxk?=
 =?us-ascii?Q?+/aR7dJqe3ztKCscf/l7Qht7Er+XQuZPUo2FBAiK8SKEm3AY49Mz7wtcKN2P?=
 =?us-ascii?Q?mTewnODnfrAJdbXMrvP4qSJ2CFNsyIiLGIsPrcS/RrXT3Wc9Kd4fxABf4z0Y?=
 =?us-ascii?Q?bFCzpB9m3dkgQVBM0LWVYK1OdTrDUXvHlYWvqAtWckgxAAFz5osHE3kjohoH?=
 =?us-ascii?Q?FOXpI4abn2+bxZS4c18nkZyIdVigw8H+FMdNE0+AsSBbNB0xw3OxII0nARqB?=
 =?us-ascii?Q?3Ct9JjgtJSzafo+AsqxgX91edvdZDDjGQ7lF7gTAFXr7sicX9ck6bVvyDLdj?=
 =?us-ascii?Q?w8oqL2+PUQuqGoI83RYa/YWq12VPqVRGjXZ0yezA0ugEsZuN+FdYiCAmKVnf?=
 =?us-ascii?Q?YlKFAQASUzbJKtfLdMftivnEeJBI5g3/53Z/29ejWr94efj90gAjckJ2cMGN?=
 =?us-ascii?Q?cRtQRUu+z2wJvE/OFCJZb6r/6020EaRRc90aMa9rG+nob2DhJsVHhrCIqQrA?=
 =?us-ascii?Q?+JyTy6Z7+zzcqBn5q05m1qQQKB5kWT6i32XkK+T6PWtw5kFBep5pOfv6qkuk?=
 =?us-ascii?Q?EsJ/Fg2CmX+MQUltWoxP3/aBnweVj5HFA7zOnUEsH0JMFprhLtuL1QCk2Qlt?=
 =?us-ascii?Q?eas8E1kc5Vb4mhv/Q8UbH0OX8BpNQB4b+hvSExYvPT0+4RwyGZmV+HxFlkQS?=
 =?us-ascii?Q?XAosf2zaTpm3WA2tEx0DsiUREtEi4Bw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9eb432-804f-42a3-6c32-08df120b079e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:51:09.3120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhw7TNMqF7IZO7eusEVNwyTTij8yG4lfiJB7iqiliwklnmCp5c+CW5Y5Nwh/lDxBKCVnvqlACYVHZP+dRDCjuE3h/2nkgo0MFuRQ+RTHpDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7267

From: Genevieve Chan <genevieve.chan@altera.com>

Add a board device tree for the Agilex7F SoCDK with multi-QSPI support.
Describe four Micron MT25QU02G flashes on chip selects 0-3, based on
socfpga_agilex.dtsi like other Agilex board variants.

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../socfpga_agilex7f_socdk_multiqspi.dts      | 214 ++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..9298ab8b9314 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -10,5 +10,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
 				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
+				socfpga_agilex7f_socdk_multiqspi.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts b/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts
new file mode 100644
index 000000000000..7d444a84fd67
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_multiqspi.dts
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026, Intel Corporation
+ */
+#include "socfpga_agilex.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex7F SoCDK multi-QSPI";
+	compatible = "intel,socfpga-agilex7f-socdk-multiqspi",
+		     "intel,socfpga-agilex";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		led1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0x80000000 0 0>;
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+	/* PHY delays are configured via skew properties */
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+
+	max-frame-size = <9000>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@4 {
+			reg = <4>;
+
+			txd0-skew-ps = <0>; /* -420ps */
+			txd1-skew-ps = <0>; /* -420ps */
+			txd2-skew-ps = <0>; /* -420ps */
+			txd3-skew-ps = <0>; /* -420ps */
+			rxd0-skew-ps = <420>; /* 0ps */
+			rxd1-skew-ps = <420>; /* 0ps */
+			rxd2-skew-ps = <420>; /* 0ps */
+			rxd3-skew-ps = <420>; /* 0ps */
+			txen-skew-ps = <0>; /* -420ps */
+			txc-skew-ps = <900>; /* 0ps */
+			rxdv-skew-ps = <420>; /* 0ps */
+			rxc-skew-ps = <1680>; /* 780ps */
+		};
+	};
+};
+
+&mmc {
+	status = "okay";
+	cap-sd-highspeed;
+	broken-cd;
+	bus-width = <4>;
+	clk-phase-sd-hs = <0>, <135>;
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot0: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@1 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <1>;
+		spi-max-frequency = <25000000>;
+
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot1: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@2 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <2>;
+		spi-max-frequency = <25000000>;
+
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot2: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+
+	flash@3 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <3>;
+		spi-max-frequency = <25000000>;
+
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot3: partition@0 {
+				label = "Boot and fpga data";
+				reg = <0x0 0x10000000>;
+			};
+		};
+	};
+};
-- 
2.43.7

