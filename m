Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BC49B47B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119222; cv=none; b=AiWKsPjRGm+1bPxx+lhicAkNM6R774oNK5tFwk+gjiavxtlQglU8kIrfoJmtVQrtKdtF8ZmGTujH+hMHn7X1b6Lo6W27UGna0Fu4pA0/GhG0lUjUT7dVH17V4u5fsaIqqOqrOxMRR/Juow5xeGsWvzr44xsGmRJI2ANnCjVt2uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119222; c=relaxed/simple;
	bh=5gKyuPmbQs/yXR5DzvUIWYPmXhAND+P46ZayWmgn4uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNlhyKS30CKJiKT1hvYz3Bk7t3NJV2eut1gB7ihVzEEFidQuqt5qrS34Mo8V8WRKDtAyGWZ9AeUzwBzvddwGq4ne7/Uep+BaKsZUvSmmgtShEGmJEhVgt3bqddYSWX6OTXO7RXQ0jp2ofIs1uLf1iCrZrExFBLg7RZzER6hrV84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jPk1Fpb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egd0dsSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jPk1Fpb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egd0dsSa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74Oq1509178
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjMqlWd89OQHBaZOc855Wd9jybBBJHY/55FbW22nEks=; b=jPk1Fpb72E5+nCBx
	uLfrZXWBu4xFmeB8cVB/uEPM90NuG2kCYZywtdTTebR2FtbLglcDddBy9sE0QeSk
	GNsn6xJAyhh+eN5+jfyWLnxMWHZkZ0/EpXsT3BXD2CAWUAeGmAkF0BGXZ+fiVpPA
	0AHUQjXRrhCrMPqOIKrxl73XqPgOJXQcHV/PfwuCeV4ullDDGIcPNoSCwKVWH2DJ
	Ufrg/vC91p6jKs+ERMZEcM8McCa91CyFUMldnfeg1Ywp0UQTXp/tcBOOod7f4qYj
	+g6tmm2mYbDxgKHAiy/6ophr+GFY0PUttDE1EqHbpm2DIKn2ZlKI/YQWTxWEMzJr
	brfD7g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xshmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso358422eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119214; x=1790724014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjMqlWd89OQHBaZOc855Wd9jybBBJHY/55FbW22nEks=;
        b=egd0dsSaLRgpDoRhWAALSAsNlwCtQT5PXkPSnbcSI1LtGf7ayvgvWp91XxzJ5twRgI
         Va6uWkjyzM0FNCQ2tEkkniWcAly4QAYzhbUOW41irN+irG1ABVvbienqBvMPb8bSrTZl
         38DDj4KEh99VIOGB73vdDcbYe4eTdxH37bCgFsTBVGhTYRGyDEQMa8y1mNCqoLUxEDg3
         X7L5h3YBvdxQJ4SA79zFji7qOaObEkxvAhOJlJrBMiUrjntUYlZ4Qa0GEvOT4Xi9B6A/
         3+kegpHVHy1N10zRlVd/o+uFU8pLkmFjI/byZRuvSx/j9YmkF719enPCZYw+6/KS9LZU
         mvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119214; x=1790724014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjMqlWd89OQHBaZOc855Wd9jybBBJHY/55FbW22nEks=;
        b=BLDfUonau5vUfReH+HZZSvsFRkdN1dtnk1Xakj/55WR3io87wXqbjVo+c51sKHcFWt
         8WDqDlyHPjV4Ux0pE0Dwc1jhEHOQZtWYSg2Hdr82IwtlqXornqVW2U5NndL9Ru/b7a0p
         GyTFcTRUWeLXT6o3qsBXjlYmILHHcGJ3P3PrkSpgq8Qe8GBNb0NVzUDzndQ8cauE58e4
         lVJSxKO1dSZKqqUWvu6XhlEDSBml0tPgaFJAaDiHVnBaZ5cI5FmgNKhi4hm1aCX1ubDB
         yXpqHHXoSnkQSihzYEzuSjw6IhNqVwphApzi7S7ti3GzDnMOMRfBotTF4p8d+65BmRBO
         drqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPe0JDP+08OCsESRUQ9IAKbXGLcfdqygBerg//q9n56qi/CrOhkfQBKNa5fOc0KyvHJ3HbSHoO80uAZjo=@vger.kernel.org
X-Gm-Message-State: AFuF++lQAe7yc+ce/F+AjfG9/N4zR6vWRpsaxxG61Cp6d6VA+ukC5hvp
	INFWWa6X25rrC2OlIbyOcF7VF3s82kwNUDa/c8MSybqXQP/g6m1i7WCNRX9ZSM7UO8bTPg6WroU
	52BDFoy9jmi/wFJY0aCrZFijswjCWeCxf2dUkzACZAPnRD4WKV/6L9yCGwCGWtAyJplI=
X-Gm-Gg: AYBFou3AuntISJZOyVR/OVvo8GjjNyKBX0oVWw/if4RvOIx6Bw5Tl1HdQkhy/K5H6cF
	qB2jKhsnocAR0ERfF9FwqxW65s7hJCg+bRvDuJ76G0/Rlg5C3kvMGDAg2aZmsLpSKmVbp5DAKHw
	n2O7EHojaTb762R3VwjtMv6+rLlNFUAKIl6pQE/3tW7qULOlrm5gW4kuioUzwgOvi6ythKcCiSW
	KBbC/7WTxd87rZPysansOaFz8vvqU0PggiHZeoiJ7cph/yr1CQJZ4We8ld/gj9WT5mN9YdePjMf
	b2M4qg6tc2mp8z4Pfnc3k7VmRhKaKuRuY2RMojTtGz/k3rL4Q/wbmfC5nDjwx0hMBWK2EYF4npg
	XrtqmDBqQyG0CKcjnFNpc9LnhpudjxVJwDVjZSTyViWeZ97OITA==
X-Received: by 2002:a05:7301:2808:b0:33b:c122:6bd4 with SMTP id 5a478bee46e88-33e8bc75ad4mr788163eec.6.1790119213613;
        Tue, 22 Sep 2026 16:20:13 -0700 (PDT)
X-Received: by 2002:a05:7301:2808:b0:33b:c122:6bd4 with SMTP id 5a478bee46e88-33e8bc75ad4mr788114eec.6.1790119212787;
        Tue, 22 Sep 2026 16:20:12 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:20:02 -0700
Subject: [PATCH 5/5] arm64: dts: qcom: maili: Add base MTP board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-5-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=28026;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=5gKyuPmbQs/yXR5DzvUIWYPmXhAND+P46ZayWmgn4uM=;
 b=vKk/z2rLG48RrLiYOw19QGPyuIXC+LZoPDW8rnCjxPqcZYUMulXF09eRbqeno6VdOhQjjVXHO
 UnqhpcyWIcJAQD6nDZOLVomi044LeW7/90cEy38QT9/4G6aDD7dtLoK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: N-MPuFasRvDPPiD2GoYKILMq4ar7-FUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX+ZRtSwwxKvvZ
 wKpvEtUudlh+rEcFWTgXGx8LJkTl2OwUOq5cKxqrCOJzuK+oxZYFzmN5bMKa0eMluaHMPtfd5eC
 YZKZX4SR3OR0W5LEIj+hoVIz3oLj6QjphvSG9ptYT4rtG6OcOv4vro1cPlVBHmCJ3B4stdayD7w
 gwht3hpBwmdfak1b4+X/2IKPlJLxzT+4yqnH916Cl67aVN9eNjwllpt2Ni/VFfJNPqp3tktdkhD
 nXv8fqgsv/3CBMiTzezG5BSiRASDHHsE2+Ne1NCVRBrJBWawfvOzeGPC2xtnYlUTgrl6Kn8LRHC
 WnBUUXktdKk/63nacaS/yUv918KOUZLGp7U313USjsIhl3jnv8o/bLBkk0xCISSjSHvVZZMhJkm
 +RLoYoWruF/1lYS9vloHRJ2Y3+zoR//NhKnkJXmNjuLARqhArLy7R6VHC3qiLhEGa1cnpoU3NHg
 lV979Fr7aU4dKODIF/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXyTnCZ7Ev8Sl2
 zPGzE2TkoFvDU0Z71iTUxfSxc/TFM4oflPOi4L5hlkIcgpk7ydqn6vUdQRuBXgwq1YzTYDqxUDP
 l1WygfBNIuCxrlHQ5bGfybdR2grgaFU=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab30d2f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=azjsmfPmHcDX3kzr_QYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: N-MPuFasRvDPPiD2GoYKILMq4ar7-FUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

Add initial support for Qualcomm Maili MTP board which enables booting
to shell with UART console and features including UFS, remoteprocs, USB,
PCIe, SD Card, PMICs and devices for keys and LEDs.

Written with help from Fenglin Wu (added RPMhPD nodes and PMICs),
Nitin Rawat (Added UFS and SD Card), Krishna Kurapati PSSNV(added USB)
and Vivek Pernamitta(added PCIe).

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 960 +++++++++++++++++++++++++++++++++
 2 files changed, 961 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf..753351c42921 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= maili-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
new file mode 100644
index 000000000000..1fdc91e03271
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "maili.dtsi"
+#include "pm8010-kaanapali.dtsi"	/* SPMI1: SID-C/D */
+#include "pmd8028-kaanapali.dtsi"	/* SPMI1: SID-4 */
+#include "pmg1110.dtsi"			/* SPMI1: SID-9 */
+#include "pmh0101.dtsi"			/* SPMI0: SID-1 */
+#include "pmh0104-maili.dtsi"		/* SPMI0: SID-2 */
+#include "pmh0110-kaanapali.dtsi"	/* SPMI0: SID-3/5/6/8 */
+#include "pmih0108-kaanapali.dtsi"	/* SPMI1: SID-7 */
+#include "pmk8850.dtsi"			/* SPMI0: SID-0 */
+#include "pmr735d-kaanapali.dtsi"	/* SPMI1: SID-A */
+
+/ {
+	model = "Qualcomm Technologies, Inc. Maili MTP";
+	compatible = "qcom,maili-mtp", "qcom,maili";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pmh0110_i_e0_gpios 13 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,maili-pmic-glink",
+			"qcom,kaanapali-pmic-glink",
+			"qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_dp_out: endpoint {
+
+					};
+				};
+			};
+		};
+	};
+
+	sdcard_vdd_3p0: sdcard-vdd-3p0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sdc-vdd123";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		regulator-enable-ramp-delay = <1500>;
+
+		gpio = <&pmh0104_c_e0_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&sd_card_eldo_en>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob1>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <3616000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <2300000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l7b_1p8: ldo7 {
+			regulator-name = "vreg_l7b_1p8";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l9b_2p5: ldo9 {
+			regulator-name = "vreg_l9b_2p5";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l11b_1p2: ldo11 {
+			regulator-name = "vreg_l11b_1p2";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <2650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l14b_3p2: ldo14 {
+			regulator-name = "vreg_l14b_3p2";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l16b_2p9: ldo16 {
+			regulator-name = "vreg_l16b_2p9";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p2: ldo18 {
+			regulator-name = "vreg_l18b_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmh0104-rpmh-regulators";
+		qcom,pmic-id = "C_E0";
+
+		vreg_s3c_1p2: smps3 {
+			regulator-name = "vreg_s3c_1p2";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <2100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "D_E0";
+
+		vreg_s7d_0p7: smps7 {
+			regulator-name = "vreg_s7d_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8d_1p0: smps8 {
+			regulator-name = "vreg_s8d_1p0";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9d_1p0: smps9 {
+			regulator-name = "vreg_s9d_1p0";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1d_0p9: ldo1 {
+			regulator-name = "vreg_l1d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2d_1p8: ldo2 {
+			regulator-name = "vreg_l2d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3d_0p9: ldo3 {
+			regulator-name = "vreg_l3d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4d_0p9: ldo4 {
+			regulator-name = "vreg_l4d_0p9";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l3f_1p2: ldo3 {
+			regulator-name = "vreg_l3f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4f_1p0: ldo4 {
+			regulator-name = "vreg_l4f_1p0";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_s7g_1p2: smps7 {
+			regulator-name = "vreg_s7g_1p2";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1372000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1g_1p2: ldo1 {
+			regulator-name = "vreg_l1g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l2g_1p2: ldo2 {
+			regulator-name = "vreg_l2g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3g_1p2: ldo3 {
+			regulator-name = "vreg_l3g_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4g_1p2: ldo4 {
+			regulator-name = "vreg_l4g_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_s1i_0p5: smps1 {
+			regulator-name = "vreg_s1i_0p5";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4i_0p9: smps4 {
+			regulator-name = "vreg_s4i_0p9";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s10i_1p0: smps10 {
+			regulator-name = "vreg_s10i_1p0";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p8: ldo1 {
+			regulator-name = "vreg_l1i_0p8";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l3i_0p9: ldo3 {
+			regulator-name = "vreg_l3i_0p9";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l4i_0p9: ldo4 {
+			regulator-name = "vreg_l4i_0p9";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pmg1110-rpmh-regulators";
+		qcom,pmic-id = "J_E1";
+
+		vreg_s1j_0p8: smps1 {
+			regulator-name = "vreg_s1j_0p8";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+		qcom,pmic-id = "K_E1";
+
+		vreg_l1k_0p7: ldo1 {
+			regulator-name = "vreg_l1k_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p8: ldo2 {
+			regulator-name = "vreg_l2k_0p8";
+			regulator-min-microvolt = <831000>;
+			regulator-max-microvolt = <892000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_1p2: ldo3 {
+			regulator-name = "vreg_l3k_1p2";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k_1p0: ldo4 {
+			regulator-name = "vreg_l4k_1p0";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k_0p9: ldo5 {
+			regulator-name = "vreg_l5k_0p9";
+			regulator-min-microvolt = <915000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k_1p0: ldo6 {
+			regulator-name = "vreg_l6k_1p0";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k_0p7: ldo7 {
+			regulator-name = "vreg_l7k_0p7";
+			regulator-min-microvolt = <713000>;
+			regulator-max-microvolt = <765000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "M_E1";
+
+		vreg_l1m_1p0: ldo1 {
+			regulator-name = "vreg_l1m_1p0";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p0: ldo2 {
+			regulator-name = "vreg_l2m_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_2p8: ldo3 {
+			regulator-name = "vreg_l3m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m_2p8: ldo6 {
+			regulator-name = "vreg_l6m_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p2: ldo7 {
+			regulator-name = "vreg_l7m_2p2";
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-9 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "N_E1";
+
+		vreg_l1n_0p8: ldo1 {
+			regulator-name = "vreg_l1n_0p8";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n_1p2: ldo2 {
+			regulator-name = "vreg_l2n_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n_1p8: ldo3 {
+			regulator-name = "vreg_l3n_1p8";
+			regulator-min-microvolt = <1792000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n_1p8: ldo4 {
+			regulator-name = "vreg_l4n_1p8";
+			regulator-min-microvolt = <1792000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n_3p3: ldo5 {
+			regulator-name = "vreg_l5n_3p3";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n_2p8: ldo6 {
+			regulator-name = "vreg_l6n_2p8";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7n_3p3: ldo7 {
+			regulator-name = "vreg_l7n_3p3";
+			regulator-min-microvolt = <3130000>;
+			regulator-max-microvolt = <3470000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1d_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&pcie_port0 {
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1d_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&pcie_port1 {
+	wake-gpios = <&tlmm 80 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 220 GPIO_ACTIVE_LOW>;
+};
+
+&pmh0101_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <0>;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmh0104_c_e0_gpios {
+	sd_card_eldo_en: sd-card-eldo-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		input-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pmh0110_i_e0_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio13";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+};
+
+&pmh0101_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/maili/adsp.mbn",
+			"qcom/maili/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/maili/cdsp.mbn",
+			"qcom/maili/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/maili/modem.mbn",
+			"qcom/maili/modem_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/maili/soccp.mbn",
+			"qcom/maili/soccp_dtb.mbn";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&sdcard_vdd_3p0>;
+	vqmmc-supply = <&vreg_l16b_2p9>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <36 4>,	/* NFC eSE SPI */
+			       <119 2>,	/* SoCCP */
+			       <144 2>,	/* CXM UART */
+			       <211 1>; /* NFC Secure IO */
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 226 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1200000>;
+
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4i_0p9>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l3i_0p9>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l3i_0p9>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.34.1

