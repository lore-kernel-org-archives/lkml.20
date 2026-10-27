Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087518;
	b=2jgpl0G96PZQFlUml3+4amTE2xwdubuVykYusi/GbgnMFE4sB2cUBuuzM78pK89exkwY
	 Qq7ecjQSc/BKuzqM8IAtI0OL1Jb9OxWd671oz9Hyz1V13GCQWoy85pmpNl/48E4xrVAJ+
	 4uMBXhKV7tGP5LIDvAhIuOp3Hw4W810VCWhSCZdxdxfqrIptl7b/T9y84unEoLlYyvYEc
	 b6i05guNSJ48AuAIeJAj2LcF8G/tVq6szRBtKcE219Rnxy21FWvZb4gAtoF7JFvdOsvLH
	 eKDoYZVkQBhIDKsP5rGlgOWu6xJBk835fl9JcRZ+8fnTpTCZ6hKhsZQpbRue0gGR70w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YN640DNZIhu2DcedKHu6XV3/HmvSpjXrPlUnXe5XinA=;
	b=nMeVkMC4ihygeJ33hPukbFXSjEZ2Ag+zwuX1fpdLslt77BKyuKkCduoAB5WS86DrY8xb
	 otKAB4FTm4R7QCCDgMiB3NpMd+vLiiv2bVY+rBib1lSMTIlL4gOpceB6SJUuSRDS/4Rfq
	 85Yaw/3TXRaBkpF3ahL/YaPiBrsJRwGZGzudC4l1jR9vvEg2NPPq808+tU7ERb/lY9lTE
	 H/3cgtDJWad1I62kOc1Vnc3g2GTF0O9k1L+Va1M8Manocn+gB2iwXqU0WQgMz7o2STz+U
	 PSayd7xpWzqAsN+JPY9GAMPPeKkoZvp8HdNzH0JZMiQA4n30SP5sITaF+tkD74XczDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mPQDQrQy;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39079606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39079606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mPQDQrQy
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1668428a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087517; x=1793692317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YN640DNZIhu2DcedKHu6XV3/HmvSpjXrPlUnXe5XinA=;
        b=mPQDQrQypJRIJIOzNX2aHe4by8teKEw+AAnH2L3fqq1RFULPm65mieUZoEP17yKbZ4
         XELn8aVaqfMzw3JSusjWAXo3JyK2sqy8ObhtkmooneEIlbkmCJrwA3IJdJL+meInK9yJ
         uES+OnOJupwsMG5175KQGYrdubRL1MEDPihIP6Kg0CTDu8rBCCnRwswu0ZVzqXGeCl9c
         sNORgwbFxAyKM5zyHUomb8SwdDdQ3tYg1moufCW13qI6IgEzkLtMUh9xFyzowEwl9I7f
         vn/GAThUPdOp0bcID2pMndq2A9uJrsGiIQKzyzCnJPuatXjuJJtvieqK5HqPC6+4MZjh
         F8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087517; x=1793692317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YN640DNZIhu2DcedKHu6XV3/HmvSpjXrPlUnXe5XinA=;
        b=l6Ihk3RSr5QAgb0jdsAMatda7ogKmplUHXp9h97STfVG9M1cQ/1/DUXaDd0XNBCzHw
         MDuFj8fUbFoOg108NJNoxzb1Fgl6famQ+iS3M4LWXQrP68HU+1Hr9LaFIYv5ywIumKz5
         APqFp6O2F0W4DJMtsaGWfV5TbG01ERq+jXowZG62hP9bYSIKjyXrK/uevd7ydYSnWUqb
         oEiI5GHMrO+wFDRahSlsxMdojCwCxCAZc/xvtFA24VGM34yslNaJclOlGrOpOb6TQZ5N
         f6UnjP9KsddUkWtxEoqigqNOORWiiIwo74YYjOHv0mddJphflnuRSCbh5vA/hLhHC7IN
         3wZg==
X-Forwarded-Encrypted: i=1; AKwUvBzS4jFXJWZlCLpCC6+KgQ+2uPPRGshsx53wVXp7yUoGHASpEMbWo9r/QBeQsroj/MtyB0LQYfLz0RD6n0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZvROMhxiPCba7Hu2mqeyxoTzl/8krLkC/shHEt+2AVbSphAbD
	KU7lxuq2AeV53Cr/jkncjE6U4jtdqhQiRn5TnbmoV1WS+LrGWLnHhgRQ
X-Gm-Gg: AYBFou25UJdfe8QG3+1HI7dpLmkztukXvTMBH4Fv2JPik/kvRg97mY3d+tWMInhlad9
	yxPKPa1Mx6YeHy5rJeqa0i/hL6LYOemPodcWKZdxhYXpgQfCPhW2LxAAotvjVWUW96T7Lq0Njux
	OIjaP0AqzI15HNUai9TgJdUwLSUdS+urGgvOtaWsOHvh4zJlLotgdAYlR/FFcwHeyixZQ1XZCXC
	BLtnpbxP5xLFrLOHAgiXRzJaKIOEPF0PbG4AjLweP3JmaJ6AtdKPcIdHdGRE0kV8YH5zPngd0I5
	2CxOr9f4/+4MlZXE5CR6XuimPiLXMI9P41Yq1FKp9Is8cuXQ4ci5wi4qObb9Gji4ff+P1OQUUdu
	071uW2XBPThFuLgHeF6rcpVWHGVqIPM35C54BuhOon0KzvoIxFmCkp1z04BNFa46uOBIaTskZj7
	1zC5IZzvImO5MS66mya28frvPT1VrlUDv8RpbWikg5iP7i9a+JPLj8Pn6uKzre0LYahVs4mZ8ET
	pHpHCum2/BEtZStaPxE06n6A+mIceDpTJWOrM0NnnxZy3ObRFI84SM9/nbc9KXfPtGCjk952czi
	EoTd
X-Received: by 2002:a17:90b:57cd:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3adeb0f1869mr6984430a91.54.1793087517533;
        Tue, 27 Oct 2026 00:51:57 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:57 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Tue, 27 Oct 2026 14:51:16 +0700
Message-ID: <20261027075116.41673-3-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027075116.41673-1-killdeath104@gmail.com>
References: <20261027075116.41673-1-killdeath104@gmail.com>
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
based on the Qualcomm Snapdragon 662 (SM6115) SoC.

Currently working:
- UFS and microSD
- USB host (OTG)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

WiFi, Bluetooth and the remoteprocs need device-specific firmware,
which is not part of this series. WiFi additionally needs qrtr,
tqftpserv and rmtfs running in userspace, and the Bluetooth
controller needs its BD address set from userspace.

Display panel, touchscreen, and the GPU display pipeline will
be added later, so the display is currently only available through
simple-framebuffer.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 516 ++++++++++++++++++
 2 files changed, 517 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..02e87dd78 100644
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
index 000000000..00c56e0f4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
@@ -0,0 +1,516 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2023 - 2024, Dang Huynh <danct12@riseup.net>
+ * Copyright (c) 2026, Amir Hanip <killdeath104@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sm6115.dtsi"
+#include "pm6125.dtsi"
+#include "pmi632.dtsi"
+#include <dt-bindings/arm/qcom,ids.h>
+
+/delete-node/ &cdsp_sec_mem;
+
+/ {
+	model = "Xiaomi Poco M3";
+	compatible = "xiaomi,citrus", "qcom,sm6115";
+	chassis-type = "handset";
+
+	qcom,msm-id = <QCOM_ID_SM4250 0x10000>, <QCOM_ID_SM6115 0x10000>;
+	qcom,board-id = <0x00 0x303>;
+
+	aliases {
+		serial1 = &uart3;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x5c000000 0x0 (1080 * 2340 * 4)>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
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
+			vreg_pmu_io: ldo0 { regulator-name = "vreg_pmu_io"; };
+			vreg_pmu_xo: ldo1 { regulator-name = "vreg_pmu_xo"; };
+			vreg_pmu_rf: ldo2 { regulator-name = "vreg_pmu_rf"; };
+			vreg_pmu_ch0: ldo3 { regulator-name = "vreg_pmu_ch0"; };
+			vreg_pmu_ch1: ldo4 { regulator-name = "vreg_pmu_ch1"; };
+		};
+	};
+};
+
+&dispcc {
+	/* Prevent simplefb from dying until we wire panel driver */
+	status = "disabled";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/a610_zap.mbn";
+};
+
+&pil_adsp_mem {
+	reg = <0x0 0x53800000 0x0 0x2200000>;
+};
+
+&pil_cdsp_mem {
+	reg = <0x0 0x51a00000 0x0 0xa00000>;
+};
+
+&pil_gpu_mem {
+	reg = <0x0 0x55A15000 0x0 0x2000>;
+};
+
+&pil_ipa_fw_mem {
+	reg = <0x0 0x55A00000 0x0 0x10000>;
+};
+
+&pil_ipa_gsi_mem {
+	reg = <0x0 0x55A10000 0x0 0x5000>;
+};
+
+&pm6125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		vbus-supply = <&pmi632_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi632_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pmi632_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/adsp.mdt";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/cdsp.mdt";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/modem.mdt";
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm6125-regulators";
+
+		pm6125_s6: s6 {
+			regulator-min-microvolt = <304000>;
+			regulator-max-microvolt = <1456000>;
+		};
+
+		pm6125_s7: s7 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		pm6125_s8: s8 {
+			regulator-min-microvolt = <1064000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l1: l1 {
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1152000>;
+		};
+
+		pm6125_l4: l4 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm6125_l5: l5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3056000>;
+			regulator-allow-set-load;
+		};
+
+		pm6125_l6: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
+		};
+
+		pm6125_l7: l7 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l8: l8 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+
+		pm6125_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm6125_l10: l10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l11: l11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-allow-set-load;
+		};
+
+		pm6125_l12: l12 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <1984000>;
+		};
+
+		pm6125_l13: l13 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		pm6125_l14: l14 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l15: l15 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+		};
+
+		pm6125_l16: l16 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
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
+		pm6125_l19: l19 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l20: l20 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l21: l21 {
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		pm6125_l22: l22 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l23: l23 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
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
+&sdc2_state_off {
+	cd-pins {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_state_on {
+	cd-pins {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+	vmmc-supply = <&pm6125_l22>;
+	vqmmc-supply = <&pm6125_l5>;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <14 4>;
+
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
+&ufs_mem_hc {
+	vcc-supply = <&pm6125_l24>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&pm6125_l11>;
+	vccq2-max-microamp = <600000>;
+	vdd-hba-supply = <&pm6125_l18>;
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	maximum-speed = "high-speed";
+
+	status = "okay";
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+	vdda-phy-dpdm-supply = <&pm6125_l15>;
+	status = "okay";
+};
+
+&usb_qmpphy {
+	/delete-property/ orientation-switch;
+
+	vdda-phy-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pmi632_ss_in>;
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
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
-- 
2.47.3

