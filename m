Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020103.outbound.protection.outlook.com [52.101.227.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193953B27F3;
	Fri,  9 Oct 2026 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535862; cv=fail; b=cXzpQiHszrOchpYwuN+cpFdbfar+OYWZcVbIIX0GN82sOyqvtD/EInl7/8KRL+nCRuxMQJRaa359RCAt3ZQSQcK3Z3dj3r6IAW1dpiZ1/PW/DUHCLzwq73eaXTByJjI1MHLgCOHzCz6vhsyBlvXbbd523pTB+oMWWyDp1BkXh3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535862; c=relaxed/simple;
	bh=hPYx9lRg/rtR50puizQjWZ/6n4kCsiitXPfxRDsmeSo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZeiL9o2XpiKp0aSeMTQKa2+IIQBkVQm65qGXnTgX8svUrALmKY6LZ2UKG+pXKmsl1GobBne7gFn3lAQaViTi6jxYWGHHTzpSYni8DxSAxxCV310pEg537BWTQBItGMFSMwXxf7rBhNOe4vLCgAp8UXp8xRw9piaMMaKinMedRQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=brChjUf7; arc=fail smtp.client-ip=52.101.227.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="brChjUf7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD8fr1OpEf/0P/yi5vryf/eKFfduj4zLetydsBfL+vjkR8c1XNKr4OxDzVkoFLefvu4skRMGV+FGXbuIa6kUm50wOOR22UAY9xzpZdNFEw9Hke7pZ5/wS+v7Obif/fu2A9WexXNj5G0gMC/d/wZLc7MQmhlv7I4e0KoByFe8C+uN3isiMQLpXaF8umOiu4oBIs0TdDZll6Da/f2EBbPPAoAy2McYDV6ku5U+Tmuf1iOHJsbPX8mu04nPBUhVvGlN+VWsewdmgce7WZYd/tu1pIx5euYDz6/VUa9rVyWic0UaXUr/b+KWtlKYkiNgOOagnx4I5zg55LhwoMD+8KejZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNt4uj6NxCtpJZ32/vSFOthURk6InSTI6qU236c/pjE=;
 b=EILxwccoC/mOY0Cu6sU4u0+AVgOlMb00H0ATInNuY5kEKyHj88JcyKEsu6x1fx8fBH/Xz4OqFtwbVz9ZzgMBMkCXMYrXOe860+D2ImEHP94na4SAggUq1N0i0hXSln97taBITW7iiADdRzn9aHMyhPPWUA/4vmVyMAo8J/f14QTrJNKneventahpehsepYRdio7acV0HPG7myocwa328LlBYc8KsPfkje4ZAFhS948uq37KGdlRmDG6whEgG+1NwcvgQbsfo7Us+XytshYCNU5wTzKa9qL3TibYGP9Ioz3yUknngyF9m7XkmZHUEAsG9J+kCOSkIQTI8E2jyw8+apA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNt4uj6NxCtpJZ32/vSFOthURk6InSTI6qU236c/pjE=;
 b=brChjUf7DHwy7IcGWE3xPJGwRVFh6Y9WyGRKOu4oQxHUEEiQzPn/BoVXPNDi9FMwzt9xO2S/5bYmEK1UlGmQ7ojtEox8jYYAVcbnL9cue63AcFX8GhW3Tn5+JcI+IYmm2Jq5HqAwmN15/JmwdcOiXCc9SZFg/OM91JQs6D6+k62oJ6tHJxcfHavyxOgBJh3h7VEdvHO9/abQcfbgV7lHJT337dvAYPfjwCx2ysbVCQb1CuOEn7nYlg8hYFEJetYsZNgKky6suQrEuKdvyE5DOlOn4zzeZbaXN/e6O80/rz8+Kwg2HGjtruL7nWufaFc1g4ku3S95K2w7H17rxT4TTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1724.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 08:50:56 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:50:55 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To:
Cc: tarang.raval@siliconsignals.io,
	konradybcio@kernel.org,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
Date: Fri,  9 Oct 2026 14:20:40 +0530
Message-Id: <20261009085041.181160-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::6) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1724:EE_
X-MS-Office365-Filtering-Correlation-Id: 0273bbf7-0463-480f-5b60-08df25e26e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|23010399003|18002099003|10067099003|38350700014|260925022911599003|260925021311599003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9uPV1TefzXAtSy+mpw3iXtmXvc3wpoOugnCCrCCLSm4CxubRCHw/ysHk76nzZVY1HBEcz7b+g714RVufE7rd0BKAnoqEUw+6LUChMIQ7QCrIQL2vTz5mc4jGflcDjMewy94sSSPJAv6Q1Q9lhDhuuwmR5NZAB5eaRgyCzFhadx6vUi7PRalcgng/qFvZhDqL44jAzupVwBke4wqJTrbOR/0VQ+WHr3NZfiIxgiQZ3mquCjrDvYVSsI4Pp4KXeGFEIbWAKsXIjZrg6cNdV2k5LGY6A3727nIntl1hol73u9Xl0Xen8x7W6hsgXTwFsf/+9ci1dnECRRdfOnwJMB3L097jwRYpY7veZWr7fAORAnzLr2y9cWX2/rEYZKYXgvz8KXehqHtC8eIN9jv0R58SPbC3Oc68MO1rKrzd+wFD30jSwmE5MXRbs7JfHVgze2/WezCbUzioFYl7/98LCfx2gEBiwecQSiJv/DNZqIBb4cpSgrPEJZWcVPuQhz34xeRcIBrbNgxGl18FBubIZzVts36o9G5KKwZjruCsmw44bVfvsffv2eq58pRTGm1/KqjE29Jcpam5HlcHnrPa8IZnagAuokcH2d38vkyzSrhjJf6SaN016RabAcrGcBbDga1iEQ0LlQdrj+tKRjDQ6/3VQSXyab59vzlEUcsAtxw1l0NuIbLd0uY+y2sHla/C2aktxR/CiK2rWptioleHxZf8bVrEEhpnl4J1/CCibNe15aI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(23010399003)(18002099003)(10067099003)(38350700014)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iarAqoRVtgJPEbRIOTapkgvRfKvGC5l5IzIQnBBo8dtPYYMiRfr4kRY4ernH?=
 =?us-ascii?Q?gZtl+M7qrVnRCwFUfRlZ1RqczWJKrC2AYPbd1lCTsCwlRZZMH+rOK5sjbbN6?=
 =?us-ascii?Q?GQOFXpkDp8LnsNNzLtP+paB499P8JveNDgZ45ETysay9qaMIkCFQRamvv8hS?=
 =?us-ascii?Q?PzQqW7urR2TpeQlBmhkqAckwYExmx7Gpctq7JogWfRX0LD1D7hNY5eI3qF35?=
 =?us-ascii?Q?RSddKoLuRqH15IBCWvq4eS4po4+9NG16i7vykq5xafTvMN132y+JFNQGZrB0?=
 =?us-ascii?Q?YLPKZZnGP6D/7CYpYDS7mYz4qFwxkcJu6HicneNDwlxphADRPEM73S5UJF9c?=
 =?us-ascii?Q?hYo2pKp8l43qxohd9Xv5b7eILxzmvMt6XifEjlRQjudT2gFau464fblM/FjE?=
 =?us-ascii?Q?WjNEYQ6jfpgJCgYdyW7Lvv5Zl4eRr/x7o+vgGipuQAhKDBJ4AdsNbzzsNp4G?=
 =?us-ascii?Q?2ExI7TrUV4ILmkd7UpYmfHlb/CjiLNPtOcjmxO+YBkh+Wv1fLuHhxM8Pds2Y?=
 =?us-ascii?Q?ywXrDkEohY+8mRXKhNYnjDglMtslc2FYwm3uEF7WRMTqYJxZ+fq/PC79MKcp?=
 =?us-ascii?Q?cUKx8hZMngxDkP1txGoAVRoThOIOmMmVmvo+POwgh0gOxQqwfDd8dxfiB0hu?=
 =?us-ascii?Q?xrf4+tGCMh9GdPIuCjuHrui9P0m+YZ6EtMy5PXrn/Ywg/IeSbq6QPxTvVXN/?=
 =?us-ascii?Q?EYmDQnleLXTBXiGkeA6w1tcWzFdAgUo15CJurb5abZLK7BA20PakXmGdxv+q?=
 =?us-ascii?Q?jl+cPn+pcY4ypfx5YJsyUCbAsMtdRQdeGUHkWrlIzNjrGdc6t9xu2USRAm3R?=
 =?us-ascii?Q?QAI/BIr+e1SllebRD0Xnyyk5nOMQX0O+IraJuscL2M5BnTW4zUVk75PppSxV?=
 =?us-ascii?Q?j48uE120a9PLSrq66iR+R/3p33OHhdQa+oq9e1SnScJnsFK8GWNqAzqoVlWq?=
 =?us-ascii?Q?MzbINDWVKZwTiptaQVUMDOjH6Bhaa+16zj8SqxsOVEWXrpKDr6FiYrAGZ8JS?=
 =?us-ascii?Q?Awmx7YhF9iQ+Jsm5QQygfGv6Bsa7D2uDWViAEJiNIZAxczVzI4egUelxSHrt?=
 =?us-ascii?Q?pGY6/5WyF1x/6OMF3agTC66vcg3XfBpStPPbD2Rs7Hg0d/XlPrGOgbkpMau/?=
 =?us-ascii?Q?0zrDQgGMZmQymnm7+SkNfKdhJEnC+HV2evK87S3lwFYuXCBH1qpP0mViQwCv?=
 =?us-ascii?Q?58wQVmNHrIMfpA9A+/AQUZq0tmP+6umnB3QnI96BhREMMvzabFTf0AHB+EqM?=
 =?us-ascii?Q?Aoy2PQCb9pVujYQbTvbjGR6hQy/nFWMleVFhMZ4SQb7H8z2dZcosEm15uGhB?=
 =?us-ascii?Q?/VDuLpyDx/q4wwGq0iBXf0NVNT9xMmd5Lkdisjs61c/mpiqdUsg3urZvzLbs?=
 =?us-ascii?Q?mN0Ri2wka7hYneCHs0Zmo5H8j56jowWQQw4ZvTSRDHM/EBhX8Bxip7EaaWmH?=
 =?us-ascii?Q?PD9vBPIS6c6XaDlcniUHVIvxYAR8ysIZzqnGOGcSIcLQYbUVQWqfCIbGaDbg?=
 =?us-ascii?Q?Uq83VLNrMbh2rppPIlNa/6DxZXtxvv+bK/bqDIu8LDAMT8zuDlD8Ct1of5m+?=
 =?us-ascii?Q?pO55nOL1nuFwzVq36iIX0eRVhsBh0slGLtgCqhfuxCKW9jB/tul+48gwP86M?=
 =?us-ascii?Q?1/n7OCXiBIO9s9Pol4y1ULIDvcav/ArCMYYKY2pLPWsCbnSHgV/ZX+Glb7WX?=
 =?us-ascii?Q?c1SzFwdXsAscxXGUaVS+pEbZ8gwKTH/JP2zx6sJIxelDZ7LdH+4W7e2Gp8Bz?=
 =?us-ascii?Q?rSMguJa0aLmJ8PdcGVZAnM8iK8oqi/0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0273bbf7-0463-480f-5b60-08df25e26e8c
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:50:55.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF/HBYU1yVywUhHhG3QZL2ONqd4X8WZsGM70WDH1Hlzl+UVCb/mpqJgQ1R8Y4Qq5erny1z0AfKCm8Us9Eu29hdrncmMzPnOuGgkkD89majSU9M3nwRN1AJfaVy923NSV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1724

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add device tree support for the Sony IMX576 front camera
sensor and connect it to CAMSS via CSIPHY3.

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  7 +++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 ++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e0506fada32d..6b1371ea5d59 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2928,6 +2928,13 @@ cci2_sleep: cci2-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio30";
+				function = "cam_mclk1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc2_off_state: sdc2-off-state {
 				clk-pins {
 					pins = "sdc2_clk";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 773304b4759e..37aa272019cc 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -17,6 +17,8 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -547,6 +549,29 @@ vreg_bob: bob {
 	};
 };
 
+&camss {
+	vdd-csiphy0-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy0-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy1-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy1-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy2-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy2-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_imx576_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -581,7 +606,34 @@ &cci1 {
 };
 
 &cci1_i2c0 {
-	/* Front cam (Sony IMX576) @ 0x10 */
+	camera@10 {
+		compatible = "sony,imx576";
+		reg = <0x10>;
+
+		vana-supply = <&vreg_l3p>;
+		vif-supply = <&vreg_l6p>;
+		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+		clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default>;
+		pinctrl-names = "default";
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		rotation = <90>;
+
+		port {
+			camera_imx576_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				link-frequencies = /bits/ 64 <1017000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
 
 	eeprom@50 {
 		compatible = "giantec,gt24p64a", "atmel,24c64";
-- 
2.34.1

