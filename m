Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134373;
	b=RMqK+YQrDFEsfq1+r/5mI+Q/df9VfItp8LKXMMD9oRHtHp/9lKLR+oolVOraMwABqC4g
	 jGYlkw7KlELmjyvdGEnwdzOL9C3kKnR5mVIgSkvVlMTrpOzUM7C17dabxFtQ0mxrv/XiT
	 GRAOGNjfl4D67K/VUKcjhiQyUjKgYPg9P2+fSk0P7ZycI+j2blG3Q3yXqpHM6H0c5r98I
	 5mBLt7wL0Zf24SrUJYDmABH/ORLzmkRI2gk2ffuSZThLwp4YF+cz/s838aVlm9sjlfBjl
	 CQr2PgeS4BFj9SzRdmajr5ufsjn8gEHwnhw2wU+iZ8IZ/G2MFz5LF3Ex46vg3GHMQCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KW0MLQ+VQ6JoSCmItNcfak9NBoS33FEYYX2R5s4lyak=;
	b=S8R38ZtEIiPMrADUYpZNFZhNsJuPMaXsTCAHds9ppxlajW8rVNtRBSGRfMvxRst7Y9D5
	 hCFENq8MUzJpacOmNopruF0OmNQs7OLdwXd5Y+GWzclaLRIZ7heoaekAMkCMR542KBfmu
	 HF9cRDreYIUbAewGZYjj4hoLU4/mSMfW1NlW7hpcz6Ombuqp8Bw0Mz/a+X6vE3pTfZK7M
	 BN7OXTWklblR6l1jqCkB1b5TgTFaqdsZ49p6IkzJvGbd3pdfMODA/jEQjeJqgDjUvyF9h
	 PM8Nv4VcxDTz31j17nxf1/T6G2tQu3Suw3bIS6dLdqBMmzHDr9pO4CDvxkJtrQZMYmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDBgG4YH;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1A606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC1A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDBgG4YH
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso279140a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134372; x=1793739172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KW0MLQ+VQ6JoSCmItNcfak9NBoS33FEYYX2R5s4lyak=;
        b=YDBgG4YHJYBpxpoFxhRwJZvr66QmRApC4IsyoNvGr3LeSRYXrIqmuT6Gysf91xbG1L
         dPahsOYtBY4tdwqlH+9/e1urr1X+tQChZHi3cCI2G+Cy/Yotq5YxMFe2ZR3barA3Suvn
         vMk1aiunAUr2VJX5RFp2gdzCSMAiofK3mYYt8tJfm7YDrW14r2xpHyjcxnzWD8sQrfQj
         SPsOpM7mbjnBbGnn2BXjZ3XLIshtAeJBOWXK+Cc7wVpByXAw7HHsk4QRA9+pUMJa6Kjf
         wy0r3icI6k499jBWC0BUrB4rINeS0ERDTdFldd2/zWrCJ7ZL77cz8HHv9xJ189DocLX1
         LlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134372; x=1793739172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KW0MLQ+VQ6JoSCmItNcfak9NBoS33FEYYX2R5s4lyak=;
        b=uAdfy8CB0qpB7hYslXVF9yHiPSkwvInvg7dJL4FFR2ZJBTEMVPSamRUvWoKZ+q7QVT
         hRrW0MeGml1hfg2pkw5hVEtl2UN5uHs2dQ/tyOhUN6kAKxAhyJZteO45d3ObImxG/x9B
         o5dVF8pdezpEqK+YWa0Kd45Q0PgpUN7QY6x/KMTpWAOfb8KTF6uaLHqowriwm3c1oD3K
         HzLltzhtwjDWQYJIJTIF/i8KFfrIsCsHDohUnKbb+akMmZNqaovxYuNho1Irze1d6nlc
         lvRkNHbOG0S7EH94QeU5qYDpTNutw3iYO/YivOm7O4+pvbAnRQvU7vBbXPo2jWdbCJAE
         50IQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5oxYXvNsSveM1BYFS4WqQeSYEnBxk6yIX/LMDDvhnbumsOs+uwuPciE7Oqw+nLoBaV5KrmEjwid9gzHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLayOXIzAZm/8+bz/OJrWwFqU15YIpHXDfDwudJftNU8twOtO8v
	s1qcxym3/jlB++tA/bnwQY1hczjmfjLdkHNu50R0hPe7JbJH1EIMCFzc
X-Gm-Gg: AYBFou2RFgiMB7vY1JuCfd8ELY5sRheXvyK8k2cR0sNQvr4Jh56X8S/AI+eFNszvniP
	lElSF7t7oAJbMeK1RY9geh9vEfVMomEQLuz6C3A3CSAxmvpU87/W+Ief1XK+IM3pVAkLM/5+ctc
	ZPNv70AFqdbA9eONxAW54OwscVtfvLSq2JS+VGxEVuM45bIXBa9QdxfRCz8jU+3z5YAxJy4YPKi
	UB+2pU93ZBWZYU/BQutCmeIjpPcWfwxCDcZRcBBuXFMpfH8BP63iwIzXURisxJHnDkk0YUC9Lzh
	oULsTcRc8Arpsf3TOEWNCnCXgkjBm6Tdgii0F+SlRmW3V9ShhwEP5HovRdqVNb+c2VBLm2SfdJo
	bdJamuDB6beJJXHJtIDMsM8hJyTc8oLqgzXyfoX/aMjId7V7Qig0D/spgMs1NBiuJMPadwkUQSy
	XGlvUqoOdGRZ2T4hrx4+xmgxg3WgHBvgLKTm5odwfHzamIsygZt0XPxNm8UUXsu0U5RNpiS9mkm
	ewz9D0gKYYkTNELrH3A0IY5SIW+xmD8ceUTh2c70hQxnAB2Y1ZTV7ABUow=
X-Received: by 2002:a17:90b:586c:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3ae583194aamr175789a91.56.1793134372093;
        Tue, 27 Oct 2026 13:52:52 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:51 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Wed, 28 Oct 2026 03:51:46 +0700
Message-ID: <20261027205146.16384-3-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027205146.16384-1-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
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
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 538 ++++++++++++++++++
 2 files changed, 539 insertions(+)
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
index 000000000..330f626ae
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
@@ -0,0 +1,538 @@
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
+	reg = <0x0 0x55a15000 0x0 0x2000>;
+};
+
+&pil_ipa_fw_mem {
+	reg = <0x0 0x55a00000 0x0 0x10000>;
+};
+
+&pil_ipa_gsi_mem {
+	reg = <0x0 0x55a10000 0x0 0x5000>;
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
+
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/adsp.mdt";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/cdsp.mdt";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/xiaomi-citrus/modem.mdt";
+
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
+	gpio-reserved-ranges = <14 4>; /* SE5 SPI, not usable from Linux */
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
+
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
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	/delete-property/ orientation-switch;
+
+	vdda-phy-supply = <&pm6125_l4>;
+	vdda-pll-supply = <&pm6125_l12>;
+
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

