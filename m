Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061031;
	b=vswynji+f69LY1dAm6+CKwe30aG3KUCce6H1c7jlI4Q9EDc3T7nn5P3W8ZnRn11WY1a3
	 kzAXjE6Hrr2Fu2u04pQvMA4zaMUmlr9OictsMMyrJn8KV0wGWuHECJsGgD61LlMYjTlS/
	 bS1NFwWrWN+t8gQSFL5blPxglisNw2zYSJssa+NXDnWLPWoBzPwcQA9vM0neN/5aH+hq4
	 1yerfZ/dv/5kAYPhxcX8ujaDvdzLLbf+nw/uCLk+srrg+D4mer2DAHkXM3bvnc+XiX5G1
	 mL/7J+OjT35VkZXClCDm+UyA0Pc40pAVbkvHpZYP/AoyW4EFiwLggF8cDs3omFzID3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xIXxj+TyRrStl4YIa6MiIxQq9AtG2rf+mIKa9GrMlI4=;
	b=yW2frWqa83P7fkeKNHjR/CFwJ5sN7/Bn+f9QvA6faIllOTXXsV8qNaFwwpkjf8H07yla
	 kQDxZpEEVEsy/na92POcJ8tiQpVITIkdhXY2byBeJ2hAHsmOD3fnjtRh5kaJvEpwU+ecT
	 Kqm845aPRqQZiCiYt9YF//NTdS9NmuYns85iZSeY0f444oF3xVh9aycmK4H8nMFJ9Aehy
	 QcLrkUnnJj4QQq1ZJ15oAME+I5O8xt4Lc5DwXBJRelpBfVnQ+WR5BylSuUDUtA3N1k79h
	 gFSD06GRxI+48cNtduWKce2aLWZfgPkDWUaheIkuAw1vmDZ2I158EheDDG1IaHfJPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QL1q1g;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB25606EE87
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB25606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q9QL1q1g
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1052953a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061031; x=1794665831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIXxj+TyRrStl4YIa6MiIxQq9AtG2rf+mIKa9GrMlI4=;
        b=Q9QL1q1ggra9KbfinzcaKUnFX5THKOaJoUOowNTcfoOi09Tcr+dDcxhEiBC5+MeaWi
         71l2RjEdfi4sQE90k4PxRTLQRPfy1Q+hkLsX5pAtRiO2dTiTIc862RxlI/NUYdMsG62Z
         qAuEqcj3oRrPUJLNckxSSt9gryppd1zJb/mbKThpTPFDBUX54u+f4dXVRE2VHpVo5lwy
         nF6P9zV9FjFg3XwiSa9Sikr2tmthoQH1o/KwyGhCWJRHpER1xcyTii19m3MvvkcVg9O0
         mwI68pDlKDJ5GX4SEFZz733gMJQyw+DTS8MYAhLTW/DN7aIK0fl9NEAaRm4XP9wFpI0S
         jqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061031; x=1794665831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIXxj+TyRrStl4YIa6MiIxQq9AtG2rf+mIKa9GrMlI4=;
        b=ZW7Eh81hohVphgzFOSd9X0J2If5lAypY4m4Wwi9/Lk3fmbeXYg4Age6bMPgjsXpjdu
         CzS6vYgtXehEYqNOXNCktgInPQlvbqAvtCLi8m5+FvBxsBq0dko4L06Y5dAT8PaKmmyR
         mI7O4J4vQkd9Gh0y75OJQZCQTgQYjpr78suK8RZo9c68iVR+O7OYZYUWhdloG5Apga1E
         XrRtIQEL3xyLULOWBhOV8g8Gm+6h3ULRbJA3Jnz+mus/hJ5f2NjTNqY/Df3XVC4HK7do
         KXhhvSJtw3AwOim2L/O9t9XPjZ/KbAZfIDViXSzTyYSvgJLvTj3Z2+yYcd1ooEpptEIE
         c4WQ==
X-Forwarded-Encrypted: i=1; AL+hErG3qadDoRi6Kpe/ttqVMENO2GS0Cx13GcJX/ov1Q8abt83uSWhKU6zA1VD0RzJXAZ5VTEvyQlkUuErWQ/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z++cmCWb8hav57RTY7QUbvMiOmEV8Il1ZUvRDPyckXXNHh9GNd3
	fl7V/v1/tX38bNr0Fxi+aY6DzBv8/1F8imOQLjhLIuEebndmMH0Wtnei
X-Gm-Gg: AYBFou2OUF9R2sTtlMoQ43nkvc78vxDWdCI0fW9xClyzTZIl+vet6cEixkSCQJfQoqs
	upMh7FZjoCaas2eChlmZ9eFvm5ezwcrjp9GKcEZfH6SNstiXG6iER5/OGSNLvgwz/1J657OpcM4
	nETWnbpCbI3/11mzkLW0iKaR7nVCZF4tw9/zGqX5INw8T8Y0762RE0W2PEwJ8mXFuPKZ/OyDEjL
	3wEivPCVPUNkPaf5VSJ1v0EQTL+CI2aJHKG3tVHbKNlfH08KGylcJITt71ww3fDA8Vf5N6PZw3v
	LKuhDN56GRu2oo++VWS70pwhd6e5Skfis491ebBs4CyvQZc167pqFkntVfMgU5bPMCd3dQONiAr
	csAP06T2n2K8cqOBimXIGeAPS3c7BZnjGfMkgGEw+8jGG9ddVronWPP8uhbuIrz8XTI8FM4mkUF
	rdbouxFrW4o14jB8Mnelr/HCJTR3+rUBK36yz4DaPMEM7RhYC70LibeeJoKqfoVsvjfHECM1bYY
	aDY1KQxInphKw89ZMDBh0ll7Wa3EXoSe3kfwR8sFQMOeCbBKvt/cPbQUsrIZw9G1mnz7xLy8Met
	tSYQ7cGY/hvgr1sFLg5b4NzgsMUFWk8=
X-Received: by 2002:a17:90b:3b8f:b0:3ab:1285:dfd6 with SMTP id 98e67ed59e1d1-3b0db6e4139mr5674774a91.38.1794061030891;
        Sat, 07 Nov 2026 06:17:10 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:17:10 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Sat,  7 Nov 2026 21:14:32 +0700
Message-ID: <20261107141432.39099-4-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107141432.39099-1-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree for the Xiaomi Poco M3 (codename citrus),
based on the Qualcomm Snapdragon 662 (SM6115) SoC. It shares most of
its hardware with the Redmi 9T, so it includes the common dtsi.

Currently working:
- UFS and microSD
- USB host (OTG)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

WiFi, Bluetooth, the remoteprocs and the GPU zap shader need
device-specific firmware, which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Display panel, touchscreen and the display pipeline will be added
later, so the display is currently only available through
simple-framebuffer. The GPU and its zap shader are enabled, but no
DRM device is registered until the display pipeline is added, so the
GPU is not usable with this series alone.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 237 ++++++++++++++++++
 2 files changed, 238 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00..02e87dd787 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -386,6 +386,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-citrus.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
new file mode 100644
index 0000000000..03544f28f0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2023 - 2024, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2026, Amir Hanip <killdeath104@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include "sm6115-xiaomi-lime-common.dtsi"
+
+/delete-node/ &cdsp_sec_mem;
+
+/ {
+	model = "Xiaomi Poco M3";
+	compatible = "xiaomi,citrus", "qcom,sm6115";
+
+	qcom,msm-id = <QCOM_ID_SM4250 0x10000>, <QCOM_ID_SM6115 0x10000>;
+	qcom,board-id = <0x00 0x303>;
+
+	aliases {
+		serial1 = &uart3;
+	};
+
+	reserved-memory {
+		pil_adsp_mem: memory@53800000 {
+			reg = <0x0 0x53800000 0x0 0x2200000>;
+			no-map;
+		};
+
+		pil_gpu_mem: memory@55a15000 {
+			reg = <0x0 0x55a15000 0x0 0x2000>;
+			no-map;
+		};
+	};
+
+	wcn3950-pmu {
+		compatible = "qcom,wcn3950-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		vddio-supply = <&pm6125_l9>;
+		vddxo-supply = <&pm6125_l16>;
+		vddrf-supply = <&pm6125_l17>;
+		vddch0-supply = <&pm6125_l23>;
+
+		swctrl-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/a610_zap.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/adsp.mdt";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/cdsp.mdt";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/modem.mdt";
+};
+
+&rpm_requests {
+	regulators-0 {
+		pm6125_s7: s7 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm6125_l5: l5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3056000>;
+			regulator-allow-set-load;
+		};
+
+		pm6125_l7: l7 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l11: l11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-allow-set-load;
+		};
+
+		pm6125_l17: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l18: l18 {
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1312000>;
+		};
+
+		pm6125_l22: l22 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l24: l24 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-allow-set-load;
+		};
+	};
+};
+
+&tlmm {
+	uart3_default: uart3-default-state {
+		cts-pins {
+			pins = "gpio8";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio9";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio10";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio11";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	uart3_sleep: uart3-sleep-state {
+		cts-pins {
+			pins = "gpio8";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		tx-pins {
+			pins = "gpio10";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rx-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart3 {
+	pinctrl-0 = <&uart3_default>;
+	pinctrl-1 = <&uart3_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3950-bt";
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&usb_dwc3 {
+	status = "okay";
+};
+
+&usb_qmpphy {
+	/delete-property/ orientation-switch;
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6125_l4>;
+	vdd-1.8-xo-supply = <&pm6125_l16>;
+	vdd-1.3-rfa-supply = <&pm6125_l17>;
+	vdd-3.3-ch0-supply = <&pm6125_l23>;
+	vdd-3.3-ch1-supply = <&pm6125_l24>;
+
+	status = "okay";
+};
-- 
2.47.3

