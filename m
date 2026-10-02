Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D134AD4B5;
	Fri,  2 Oct 2026 13:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948641; cv=fail; b=QrTNx3Zdn6nasrqGclsZClsK2tYxmz6o9aDXG9ziij1DW0Zf2zGSVZ6nK1NAfO0tVqNNje1pqTLGGjhaWzbc16SWyE6Afg+QM0TGLvIaS6V/UYIaPY9OvEcUIWcM9/xxzFlkIzhdgthXSE9Hdyh5mrIX4rdPXXkUoXLqblf3ITQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948641; c=relaxed/simple;
	bh=yGoXnU6dpHuWFmeKb+g8CH+o1wV6cAYQCbN80Dsrops=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uzOwYDurz1wB79vSQJHJuaWHFXAG1c5YhqlpMEyVw0IRUWWaNxkIY0C/EsLI2t0vQmj7QyI20Cu0oqqc2IUyIG+z0O8nUbUisZQLi7oUceM3J5SR0qc2fIg5ky7Q8ZTssPry2WMBW8yrj35dLcViQiXF/raloKroJ7HKO4ECOfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=WRvshvsM; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="WRvshvsM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRjBzMloBtHmXPqbAl7VOjwlIilrwlV2WbM7o7jorMaOP0sVmbqQxK2QVOaWijws1y0qnpclLQFtBNdCayJeLGF+pl2omXTbfyd9ai1DR4cCGeSK31NoxoA6p6vMaUAZGHpaxSdgATShzAAvBKwsOD63XgyRzUmOxqwabPTXxmggwt0Y5Zwexz8J4H1SiJdaDsVRgVY71JStvrQ1knf+GbqvdkvCW/cBJ02bAO0/wAPcNspZWRiITI6fKfWvHvxTBJoWTJo/ZPwO3eoj2fWHGqKdIWnakz4mA0+n8RboUcuk1az5jTE2QZJYY+6Qc5JAEidCfyvA83kSrk9PfufU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdU3OGTDSkpdKuvVrmRqbuMtjUdr6614nI2kT7EGXSA=;
 b=fXfrKxB/HjlZzbI6HdPPIHgYYi8Crx5m99th51h4GW4B47e90UHlbSS+JWBbSbUM0K5cjZj2ns3XeqYdi+z2irX2CnRwcdz56wMUV5Qc0XfK30KCmkvAwZjB3cpWgoxD7xd1FgmqfI5sUdna+J9JZpka+7bPuJAnfKsXQnnCHdeBdBleB3JwXh6iKYOms2F9dT3aygwO+gtyofzElZP8bzsUcOD2OZ3AcbNSv4TwF+BF4UMyibVovwyLxvvWGSaBDM/WbVkjF81VOAQX3wSDb46uq9T/AhvD0fYKyckzimVT+92Ih2ls8Ea2Gq0psa+NWdyRT4ZXg3qRPiF71iNBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=dabbelt.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdU3OGTDSkpdKuvVrmRqbuMtjUdr6614nI2kT7EGXSA=;
 b=WRvshvsMUmnk6vIUWR+1j/Ix05fNyxEs0KUnXXbY7wHWAwK44e0MqlzyIqaZ9SNf0j24qhKIQNmeexMMVol9OMr6JqgbhP2g6pVVXnNwpJH2skfv35MzEeVX/aFoENunzeBE3zRnqZ8KD5PLV90VJ5HERuF0GK0Otq046TMS8Wc=
Received: from OS6P279CA0164.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:39::17)
 by DBAPR02MB6037.eurprd02.prod.outlook.com (2603:10a6:10:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:43:52 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:e10:39:cafe::63) by OS6P279CA0164.outlook.office365.com
 (2603:10a6:e10:39::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 13:43:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:43:51 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:51 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com [10.133.4.42])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 26AA34AC7;
	Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
	id 0F9B6305CE1C; Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Fri, 2 Oct 2026 15:43:36 +0200
Subject: [PATCH 4/4] riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with
 dt-check-style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261002-fix-dts-th1520-v1-4-9a8810091d47@axis.com>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
In-Reply-To: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kanak Shilledar <kanak.shilledar@axis.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4427;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=yGoXnU6dpHuWFmeKb+g8CH+o1wV6cAYQCbN80Dsrops=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsjav1Vs8+fkCWK6982axRwvKe8/ab9nwfXvh+RZ3P6uX
 BB+9nz1gY4SFgYxLgZZMUWWc0bbo/cn/9OdI+10CWYOKxPIEAYuTgGYSIAAw19hv2vn3m81O/tb
 bW6GN1tGe+rso0nH+NiFj3Y4pYisfsvO8E13xt/S572qnIcW63mf8Qtf2bDSafqx31vvvq//5rd
 Dhw8A
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|DBAPR02MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 5738cab0-37e4-4eb3-1650-08df208b31d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hCQP3xRE4nglJhQl/71w/gneXN644LWnnXqFQQucTtc3jEMEyk88o6q24h2H3Bf57JDDerCOZXehyQw4Yc3lIuA1BkyC5Lv8E2NuEnTNIvSbNokZTT18P8W6sE1tz8s0t4fngRz9Cj5G/ioIOJebRXMLU344ehJYBdZ1dExCyeA0DVctfTajfW+iddfMM2wHXonRnEB+XMNuwFk66ksKMIaVtm0y+Mzxz2hXfQ9UhR+Q5Bk++oV6HJLGxRQiZwdOkhZXPW4x8j9r8ZejhccsqbrHTX48NtmIHEr4fX7J3BiB3Q8ZXlQvxrxmqBf4/RPCBtvfqsZP/Er+/rOKR5UZwlYv/R/5uiO6GDN+J+vEmvDPLs/tvyxUM0PYfquT7w4+ZbRbwEstKrYis7XVib0k+W0d6v8gmfGrX5N7v+vlVb6x2vaAGvVbk2E6IAaRQMQZ4uhUcmvuHSJCdfXARUSB5bJCb7zgi940ieigI3LplKBCnq7E+jO4bCj7TJkbxQScPX1CPIO6aDC81rz929JwTmXQSP2Dqqdjt0B/65EKdhfYRHZyT5+ECaIpyQhXl1srxOgm99CPYPTpbAe8mhXWd1ukyGJsqSi8QzOQcB8uS/t2Xu6CdJAwwxYpPsbzETnYiM9n9w2gwVhJ+TAkvVjSn0xYOitFH6anmIaf+bnQS55tY5rINfwvDgyM1uwBb9gRb5VkPLQVH/r0pxUaJIWAhWLDt9vaZlcMqYEkLhajnXBjqqPkqZxSM3lo7GXlhMYs
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PyelJu5Go78kANc3PFtzQhHDzmyZvUGDm4m0OuEfAXKq14Ii87x5xQflaHJ+qcZgif/alkPjVJcMS9ilOIgGGkgeOgOS1hL/muBCwtCbFpkglszXfU/rCk//5K0G+HSQbxrd4oI9YZ/fE2pOk9ZxQGWtGhXWtXxSsKLKBNcVMkJkEqzJyYjNXVthXrPhFa9yjfcECwy7oFFAjJ0Advt7WPlKnJW/TFhb0eK1DtUX7Lx75YVJhudmSChY0/K6jEHTV1klPlTEqG+++gBM6waV5r8U30qshpNjseq9SChkldLLUujOYCs/8rd59OGC+jkARH2z3vApOuB3Xx01F4ITAEUKpxwSphHh08bOJjOFSL2j+SYx5gXBgAd4ymqopzsJaeIA2Nh68v4ktsRRXxM/CB04OYuaMy3LO+oXNtqUBjLO0uVC9HQbOLo0k5kgi00R
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:43:51.8361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5738cab0-37e4-4eb3-1650-08df208b31d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6037

Fix warnings thrown by krzk's recent updates to the dt-check-style
tool when run with strict mode. Fix the following warnings:

	thead/th1520-lichee-pi-4a.dts:161: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
	thead/th1520-lichee-pi-4a.dts:163: [required-blank-lines] "status" must be preceded by a blank line
	thead/th1520-lichee-pi-4a.dts:217: [child-name-order] child node 'rx-pins' out of name order

After this patch, there are no more warnings thrown. Fix these
warnings to make the file more readable and maintainable along with
that to make it more compliant with the devicetree specifications.

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 90 ++++++++++++-----------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 1eb575aa9a74f..5908b21d558d4 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -41,10 +41,13 @@ hdmi_con_in: endpoint {
 		};
 	};
 
-	wifi_pwrseq: wifi-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
-		post-power-on-delay-ms = <200>;
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-0 = <&fan_pins>;
+		pinctrl-names = "default";
+		#cooling-cells = <2>;
+		pwms = <&pwm 1 10000000 0>;
+		cooling-levels = <0 66 196 255>;
 	};
 
 	thermal-zones {
@@ -53,6 +56,23 @@ cpu-thermal {
 			polling-delay-passive = <1000>;
 			thermal-sensors = <&pvt 0>;
 
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 1 1>;
+					trip = <&fan_config0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 2 2>;
+					trip = <&fan_config1>;
+				};
+
+				map-active-2 {
+					cooling-device = <&fan 3 3>;
+					trip = <&fan_config2>;
+				};
+			};
+
 			trips {
 				fan_config0: fan-trip0 {
 					temperature = <39000>;
@@ -72,35 +92,14 @@ fan_config2: fan-trip2 {
 					type = "active";
 				};
 			};
-
-			cooling-maps {
-				map-active-0 {
-					cooling-device = <&fan 1 1>;
-					trip = <&fan_config0>;
-				};
-
-				map-active-1 {
-					cooling-device = <&fan 2 2>;
-					trip = <&fan_config1>;
-				};
-
-				map-active-2 {
-					cooling-device = <&fan 3 3>;
-					trip = <&fan_config2>;
-				};
-			};
 		};
 	};
 
-	fan: pwm-fan {
-		pinctrl-names = "default";
-		pinctrl-0 = <&fan_pins>;
-		compatible = "pwm-fan";
-		#cooling-cells = <2>;
-		pwms = <&pwm 1 10000000 0>;
-		cooling-levels = <0 66 196 255>;
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
 	};
-
 };
 
 &dpu {
@@ -119,8 +118,9 @@ hdmi_out_con: endpoint {
 
 &i2c0 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	ioexp1: gpio@18 {
@@ -136,8 +136,9 @@ ioexp1: gpio@18 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	ioexp2: gpio@18 {
@@ -158,8 +159,9 @@ ioexp2: gpio@18 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
 	ioexp3: gpio@18 {
@@ -204,16 +206,6 @@ i2c-pins {
 	};
 
 	uart0_pins: uart0-0 {
-		tx-pins {
-			pins = "UART0_TXD";
-			function = "uart";
-			bias-disable;
-			drive-strength = <3>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
 		rx-pins {
 			pins = "UART0_RXD";
 			function = "uart";
@@ -223,6 +215,16 @@ rx-pins {
 			input-schmitt-enable;
 			slew-rate = <0>;
 		};
+
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
 	};
 };
 
@@ -261,11 +263,13 @@ &sdio1 {
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
+
 	status = "okay";
 };
 
 &uart0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };

-- 
2.43.0

