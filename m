Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011062.outbound.protection.outlook.com [52.103.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B02481AAD;
	Thu,  8 Oct 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498903; cv=fail; b=Vil/Ae29ZDWXUlTHhDuVy6p2lkmvJvh9F80yM0UbKPII4yCqX95fxfWDehQ7Urexvo8SaCPoDvOGVnyNijAcKpvnHfyeIBCIl2Q9djVbjIxdx6ycFFohNXs3KTp5I2uqzj+S3uP+U8LM5atg3gf7GRXLMJPWMlnMU0oBIClDKf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498903; c=relaxed/simple;
	bh=mKqa1EqJhm3H5OUlBfoxSNQ2Cqp0u2ePmRqh/oIfGLg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qyAoff3iH1rQZSygDfBXoZ866jjiQme6Ep+fG6kLNv48r8ibrqDRmWgvek5z9nUAicAgj6+fxoCaAusqqjjG8VfLhSPv1oB9CJdCGK3rnH1Icol0FyFaUnf41xuN8CkERvNNZjZzu+xGfBQckRvGsIecPm9gid1qucKaUKy/+RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=A4WNk2nP; arc=fail smtp.client-ip=52.103.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="A4WNk2nP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPCdil00h00yXmAn/yJMDo1QTtCd6ocOPXuawfDZOHbCQI95PWX/Vm65eOzEhtTxEMGkVk9zd1l2/xl0ggqZtbmXxUcAgQ8jLzenuNScVU8ur8obPSeEnk5QoAnFrzsuusyRgsBpYifbgfvJIDFxjK0L1qMay5qVIFD5ymshYeyj7z/b2dTWbgyPSQByMpDn65b/1CInb967+mT7FQY6coarPYFuX9Kr8gm6LXgn9QjYGnIEoFXm9LRyS1+fFsmYJbzqC2foFXTTxDLHDFJm4SGGgLNdjii3Sp2k8epBO0GR5rJXHN+tMHYM2EfMQPD+j6T7OXel1VbMyDd6HdeCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4zNdJoe7J8GUOXB9rMMTbZll/nMWYA87zp81e90OlU=;
 b=Jer1A7coXqNcO3UyD/Xtar3d3ch74dgZKhix201QjUawIL9JM23jJxnFrKeuKiooAJIgPMnKNpCCOZYECL4jpG+T3EzZSW1j+jkFWak42I2/xJX2GQq0qOT7YWjk8yqi7bjeU/6b6W4NRUuBOVW2NefHujjJeaXYzTyYcqV4BWzDn4Th/kORfSbmvfHCqvzwOoAqbVTawzIALOvtUCJApzEp0dPsK4MDbDV9hvayrgAt1OGQ6bQ2gPQC2c9OAg52KwyxoBsU8opb9IBnrueiCKGet4w1MwjEY/vgRSTfOZSKs7pJ0oDsTa732e9dkoR0m3zGfHzoIbm/tF4z20bbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4zNdJoe7J8GUOXB9rMMTbZll/nMWYA87zp81e90OlU=;
 b=A4WNk2nP6NQ4T3vnEh9x6TgM3eFr4BhVXUQEyONQzew5/7jF4uJJLAa34/MWsQITFeI0CphAC2DVUYG65y5hbq/9RKOvvrhe2P5smJtcETuIdoYrST5UBu/2wdwe4012K6VkqcjjiOM9+EuWjWeMZgld6y/nxkcAvJwto7FueiE5GHlfE+zYqVS5S24a6Ae9lrfNhj9HkC6VuHs3VSRZWmb0BSRvINc1C11XxUor9jFwRMf5imKN9MUiqUVDPLCWnY/TKifTXGKuIqPMKoNh2aBpCqUEA2VyKi5xZw3onFko7D7uy6XCqhiqIm1CKqxxRWVG3XJsLBjDXA/ZvsSNag==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY3PPF346C5784E.ausprd01.prod.outlook.com (2603:10c6:18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Thu, 8 Oct 2026
 22:34:49 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:49 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
Thread-Topic: [RFC PATCH 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
Thread-Index: AQHdV3U68/krih4JgEKUP0+ex3/kIA==
Date: Thu, 8 Oct 2026 22:34:48 +0000
Message-ID:
 <SY5PR01MB10600FCBB6CF8F9233D1214BBA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY3PPF346C5784E:EE_
x-ms-office365-filtering-correlation-id: 4988ebd3-3b49-44fe-be62-08df258c5cfe
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|8062599012|19110799012|31061999003|8060799015|25010399006|25031999004|12121999013|15080799012|41001999006|38102599003|24021099003|16051099003|102099032|2607281247196008|440099028|26104999009|3412199025|40105399003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Tdz1dAQ5RlNi+ymwo7g8N8Pj+xFt0ncp0KZjXLOkr1Y9xhYJSL7qV0v1h+8r?=
 =?us-ascii?Q?lrPUa4G8IIxghRRBLEvYtKCxN/TSx/QBY3gQSrbgJZsi1dFZD+vPWElKoRQa?=
 =?us-ascii?Q?5p9eRybhYlHZVi6Ny6ZCfgwXyyvO0jDrs2vlxM0ElWhB2cIBHmj8OqGbLobs?=
 =?us-ascii?Q?zhsaCecQXHrNuZ5guwpwbUpx5k5/TtFypgP3w6cIIPSQbqSA3Lz8e5Ynftzu?=
 =?us-ascii?Q?x4NTkKLzC+2u1yGvjelysnO7Q4xEXTSTQxMF5taISurL/YJPmqQnhO0xla6L?=
 =?us-ascii?Q?hXfYahkG/4ne1D51dVzEzl21uWAyXMqZnMwBGMdDESD//Jm83NHYjUhZedoY?=
 =?us-ascii?Q?2FPogsazgWDsQaUfSslc7TTYggDWotZ5aikqUXsLSRcOospOi5QuNShdW3lW?=
 =?us-ascii?Q?96JvUYmpO7fTzy73zXRzQ7sNo5rIY2biG9yRcBo/lMSpBDDaMabQav7P/+1Q?=
 =?us-ascii?Q?eBB6O6/rYTXn784ROfPJCS8QvnlOszzWLXgt3H57x+tXfW7cC7eUY7U2r4vs?=
 =?us-ascii?Q?VBRMvJwZipfWMMBLfxFpj9rlvtgnwRV0QeveCUpVCL62dl11OJUkiEoQiZbA?=
 =?us-ascii?Q?VYzl2FxC5xjSLpb41aCPxte/l8Hfbr3gWu+2F9bfEtJ/vmG/bBwttOfwCdKu?=
 =?us-ascii?Q?mV6+FVwqNrl4qFFfbEPksEJEjFcyichjQ/1xaqKYHCIkZKsDy0BoxZOFbJ7i?=
 =?us-ascii?Q?wctiXFO6U9ryDueAZZ/2T+H8ZVzftQ9ba+PUFLsjcGHKIzVIQ9yeOZ6b/y+N?=
 =?us-ascii?Q?8uPvS6+d6vdZ1aqzVxJyRpAMxBTHFsalVunJMN5eF4oiEg8N0STRuQywDNev?=
 =?us-ascii?Q?CnCloxbg0IZ7rB9EQZKK98KAhxO/9Im942gIKtkwNH18apaGC6//nMDbf2GJ?=
 =?us-ascii?Q?y3Ved42iFiin0SJQtrgLOrteCWirz6OqWuFIp9HvDJ18mfk/e/Ao0F45xaZX?=
 =?us-ascii?Q?lYai2d5O1oUcFQ/Fabq+Sm14uGLDA5HCj+BBxt4u2kOUtutGVLJv1NXrCN7Z?=
 =?us-ascii?Q?rIJpxDpzInjrEwF0D2FYt8UBnB7rpB9MQAQLYoy4COlMlKc9A2Di+8DnlqIl?=
 =?us-ascii?Q?k/rFjAnNEvBfVIEtom8B63z/RlDh7xnbAhFjmnOx03LdVCiPJB8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vcH4WnrceFidNL+GONVaiEN08pgkUsWWg/AKkXkJoXOpiayEN69p70nv/tK2?=
 =?us-ascii?Q?WlHdB+CyuBQb+E/cxV4WtLj//5MF0gJ/8l2PgafLxBq45vPoDMmBGpvxDK8Q?=
 =?us-ascii?Q?P4v29YF4VjARsbJSYc4K43j82D2mUa6IqVg/4ywEzgHicyp7796oDIarqQPE?=
 =?us-ascii?Q?I3vlybCfvDXjNqNsBq4g98C11Vo0genUBI+Rj34RI+7O4gc/YgWpW3uuwOey?=
 =?us-ascii?Q?ZX19QkH41UAbkDfh0GtELgIQtamUu/xahvggzFRDV3z1vjD2GgorNuloRpwg?=
 =?us-ascii?Q?vo6SWyqwgVPMsVHbHpd45K+MDSrQqHYvKb/tPY03DivAfc3lfEApcdlrDPOq?=
 =?us-ascii?Q?wIeiOIueuKMU8mnn8tPiekFWdtM3tKgsUNR2IFjkn9B8nIqX9sUZFCq8cPFu?=
 =?us-ascii?Q?VO4sO02rdHMNfmyTjJylSJbRIf+s2NNDK+HhUVYMp8reewW+UkGwOQj5IAS6?=
 =?us-ascii?Q?stvyDj1SlSo/qa406lkGTRY40VCjbhzTLb643H9BVyoBuO8iPG+z7qwNXRkx?=
 =?us-ascii?Q?mr4aL5glw0ySV1TJRlPjANBSD6a+CwpnfZdEopaDfMVEL4dM8JGTfM5YXEi+?=
 =?us-ascii?Q?qqSGbI7mPF4JPDnFt1glAUvlbFkl1MXVho6OaNA/ouesd2osekmhSAV3tiDe?=
 =?us-ascii?Q?9XPjCPMiNBPTUdKdHXPlniHrNNn3tfxNR2Xq6ScV+tsGngwzHGxTiKQhO0uo?=
 =?us-ascii?Q?mGVQGB/fyqtH0mSbHleQhc8GdX9d40JoQHmYRh/hR3mUNR4CVh3qAIEmnxkq?=
 =?us-ascii?Q?gfYWqYd0nIdTC6k353yubF9Ka+fdkmJjb9CMzt+cT0o34EF9pmxqkqohrn+z?=
 =?us-ascii?Q?0nVzfTCEKIIupsAggVvb2M+aWnPIH7VUZc/PPNZfyoAm1WeB4Tlf1yWEpDWk?=
 =?us-ascii?Q?d8BTXhN0sFvQkEXhndXmH+T21N+apN8CgFXxNYCX64givlmQt6nvbXUyE0Br?=
 =?us-ascii?Q?OFGZ/nxtrhDL1HlXv2l2qcmgCAk4DuF7CfW6Il2aXA0dOstyH0Cb7uAMMF8s?=
 =?us-ascii?Q?o3jQEf1HSngJmc3QuUqQiRDpbCM6SyNUq17ZQEnsHlDIniMDAmnungyTyxj8?=
 =?us-ascii?Q?52pt3g7ppt4NIOVZb+/jAIGJzCBnwGKMb6ziQ1Qh9M5X31Wm7bLHR8CBg3Gs?=
 =?us-ascii?Q?VExsPgByyZ5Gkyz7fCiqFKZkSZIRRtU4CcX7s5hMcIi+hyfBXPODJtGiLTQ0?=
 =?us-ascii?Q?b/EjLV7dp6H9ni9lywGRRublakTYkrrTwRncDbH0Supbe6w8T9YxZ2mg0NS6?=
 =?us-ascii?Q?kDmUN2eY+1Sdym2tXvKgksQ7z+D+aHY0DdCTXS8myOsbHZ5PuGHSgHdrQhmG?=
 =?us-ascii?Q?+pJg8RUT8CBT0SuXUy1jWphY72UDeBTYcdldQ66Cn1HOGW0Rdd0tTrdaZ1hf?=
 =?us-ascii?Q?xnwdZU8bWNcbiGO9T/kimnKEfey8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4988ebd3-3b49-44fe-be62-08df258c5cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:48.8323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF346C5784E

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
Add the board identity, reference clocks, PM8550/PMK8550 devices and=0A=
keys used by the v165 board. Retain its inherited debug UART alias,=0A=
stdout selection and QUP wrapper enable. Keep peripheral bring-up=0A=
and the Android bootloader memory contract in separate drafts.=0A=
=0A=
Describe the board from the SoC and PMIC includes, rather than=0A=
inheriting all peripherals of the SM8750 MTP board. Reference clocks=0A=
and key pin configuration are retained from the MTP description=0A=
included by the existing Warsaw BSP.=0A=
=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
This revised minimal board has not been boot-tested. The SoC include=0A=
already provides a memory-size placeholder and firmware reservations,=0A=
including SMEM; the bootloader must supply usable memory and preserve=0A=
correct firmware ownership. The full v165 board boot does not verify=0A=
these fixups for this smaller description. No captured bank list,=0A=
private firmware region or Android command line is added.=0A=
=0A=
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/M=
akefile=0A=
--- a/arch/arm64/boot/dts/qcom/Makefile=0A=
+++ b/arch/arm64/boot/dts/qcom/Makefile=0A=
@@ -408,6 +408,7 @@=0A=
 dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8650-qrd.dtb=0A=
 dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-mtp.dtb=0A=
 dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-qrd.dtb=0A=
+dtb-$(CONFIG_ARCH_QCOM)	+=3D sm8750-xiaomi-warsaw.dtb=0A=
 dtb-$(CONFIG_ARCH_QCOM)	+=3D talos-evk.dtb=0A=
 =0A=
 talos-evk-el2-dtbs	:=3D talos-evk.dtb talos-el2.dtbo=0A=
=0A=
diff --git a/arch/arm64/boot/dts/qcom/sm8750-xiaomi-warsaw.dts b/arch/arm64=
/boot/dts/qcom/sm8750-xiaomi-warsaw.dts=0A=
new file mode 100644=0A=
--- /dev/null=0A=
+++ b/arch/arm64/boot/dts/qcom/sm8750-xiaomi-warsaw.dts=0A=
@@ -0,0 +1,108 @@=0A=
+// SPDX-License-Identifier: BSD-3-Clause=0A=
+/*=0A=
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved=
.=0A=
+ */=0A=
+=0A=
+/dts-v1/;=0A=
+=0A=
+#include <dt-bindings/clock/qcom,rpmh.h>=0A=
+#include <dt-bindings/gpio/gpio.h>=0A=
+#include <dt-bindings/input/input.h>=0A=
+#include "sm8750.dtsi"=0A=
+#include "pm8550.dtsi"=0A=
+#include "pmk8550.dtsi"=0A=
+=0A=
+/ {=0A=
+	model =3D "Xiaomi Warsaw";=0A=
+	compatible =3D "xiaomi,warsaw", "qcom,sm8750";=0A=
+	chassis-type =3D "handset";=0A=
+=0A=
+	aliases {=0A=
+		serial0 =3D &uart7;=0A=
+	};=0A=
+=0A=
+	chosen {=0A=
+		stdout-path =3D "serial0:115200n8";=0A=
+	};=0A=
+=0A=
+	clocks {=0A=
+		xo_board: xo-board {=0A=
+			compatible =3D "fixed-clock";=0A=
+			clock-frequency =3D <76800000>;=0A=
+			#clock-cells =3D <0>;=0A=
+		};=0A=
+=0A=
+		sleep_clk: sleep-clk {=0A=
+			compatible =3D "fixed-clock";=0A=
+			clock-frequency =3D <32000>;=0A=
+			#clock-cells =3D <0>;=0A=
+		};=0A=
+=0A=
+		bi_tcxo_div2: bi-tcxo-div2-clk {=0A=
+			compatible =3D "fixed-factor-clock";=0A=
+			#clock-cells =3D <0>;=0A=
+=0A=
+			clocks =3D <&rpmhcc RPMH_CXO_CLK>;=0A=
+			clock-mult =3D <1>;=0A=
+			clock-div =3D <2>;=0A=
+		};=0A=
+=0A=
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {=0A=
+			compatible =3D "fixed-factor-clock";=0A=
+			#clock-cells =3D <0>;=0A=
+=0A=
+			clocks =3D <&rpmhcc RPMH_CXO_CLK_A>;=0A=
+			clock-mult =3D <1>;=0A=
+			clock-div =3D <2>;=0A=
+		};=0A=
+	};=0A=
+=0A=
+	gpio-keys {=0A=
+		compatible =3D "gpio-keys";=0A=
+=0A=
+		pinctrl-0 =3D <&volume_up_n>;=0A=
+		pinctrl-names =3D "default";=0A=
+=0A=
+		key-volume-up {=0A=
+			label =3D "Volume Up";=0A=
+			linux,code =3D <KEY_VOLUMEUP>;=0A=
+			gpios =3D <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;=0A=
+			debounce-interval =3D <15>;=0A=
+			linux,can-disable;=0A=
+			wakeup-source;=0A=
+		};=0A=
+	};=0A=
+};=0A=
+=0A=
+&pm8550_gpios {=0A=
+	volume_up_n: volume-up-n-state {=0A=
+		pins =3D "gpio6";=0A=
+		function =3D "normal";=0A=
+		bias-pull-up;=0A=
+		input-enable;=0A=
+		power-source =3D <1>;=0A=
+	};=0A=
+};=0A=
+=0A=
+&pon_pwrkey {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&pon_resin {=0A=
+	linux,code =3D <KEY_VOLUMEDOWN>;=0A=
+=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&qupv3_1 {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&uart7 {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&tlmm {=0A=
+	/* GPIOs reserved by the Warsaw firmware. */=0A=
+	gpio-reserved-ranges =3D <36 4>, <48 4>, <74 1>;=0A=
+};=0A=
