Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061019;
	b=bCjzDnHmKU3O5M/0ESbdbvB+lMZDNJQrCWhKzqqvxKzE6OvL91436+mdWTb41423w2bl
	 uSj/C52/OT6JMnyMWAl5uvKpihqYgTjgFJLJ6S18ZlY/neNPSEtMmHQ766dipJmMaeTpO
	 PsikJmD2pRZQuBxN9i59jpj/jFDymh6a+P1iHfvzPPJ43Ow+qAsJoPAgV6JSxEqGrrRX6
	 hqOC9rQXtthFdG3/PWDX9nVnuYMPvD36mZMAoifdIJZeSWXztYgBQMapwEqO8GDhGHoTm
	 OFp/cy9l+Z86S76e/IDzLGTmAdSKRYugq0m716dvNDoZq6GMOnFvWIoqf070LHHq8ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8i/LDty16WS2G3g3S8k0Lh+7fwt+fHIDbfAmr8CmX6Y=;
	b=OYmaaOKqPnnA4/QvRlQxNBrLdbboIRAI0zLRKLdPrwH9116YjmGs8VNuFhLKpvVtM244
	 Ry7lMudqLYmRg/fJRTRyKH74u5LVLmNX37+shA0kA77ohdO3cFwzysQbP2cDQKj5ayB+S
	 Zmn1xSD2BLA8lEBmPzzbHIrqarFW/1McByBF51NjVluINOCIcFoWQUkTj3OlVdIpnpvja
	 UbLvyRoJbECtrBRQy3A+27vcsSdFvovby2xbB6Wl6E4tY0YCHFAVqCO3W7VTaOhakDmvl
	 hqbHYNcmQ+IfLV7gVnbdIpEjVLFZqwVyyzoNgJqc5urgF7P6qX/c8GPl4eUwXVUtZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlKk3krd;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D3606EEA8
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8D3606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlKk3krd
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so12385335ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061018; x=1794665818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8i/LDty16WS2G3g3S8k0Lh+7fwt+fHIDbfAmr8CmX6Y=;
        b=zlKk3krdk3IYauO4niCu3lh6NZb1/cWMaT5uXFadnCne84EKPdi7ns8RU+4keWC5jp
         F9LZp59QsgViMrSSUW/TVVNJobaLAHS99bzOuPEa47hqIxjDNUWkmcJIb/4cRLeC36iZ
         CiKFKL/O7Mz3vmLL00dL5uswHcxY+GlOyLt+RGgxauLhzxRr75P5LANe5fzqALrMSJNy
         JItjsS4dFnWz2OlFKLVZfW3hwQDQzK+2RztD7bRWs6q0hLAwd9e86kA/FcZN2AadWrGL
         1eBaJfz2EGiF81X0iKJ/02n81me0FHjH0/oSWHHRYIs6h/e9xX8Np3X5pbu55pUFc6U2
         XCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061018; x=1794665818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8i/LDty16WS2G3g3S8k0Lh+7fwt+fHIDbfAmr8CmX6Y=;
        b=BwQa9Ix+Lfw4dMcWOn6+yJaKu+Nk8s9juqiaoM4DPB1Kv6zsO9nV2S5UCDDgp9d9bY
         780yt+ubG9jlKACkf5x9RBCoSaPx5/oErt+RejMj8ilSs1J8CrZBIVR8jJWoZB3eM33X
         VC6USP+xt2maSfLWPbTPk1Oj0MT3GEIefPjORN85yKE3oPVgUPY92TVW/o5kcyPcOQPs
         gHboj0wegta/d9IWOm9/kwMOrtBu02ByHVr7BjinojJDBbFFUtjSOEbQb2wuDYH8iOog
         kuXeI1jf0cqZfMGhm58fveiZcwkGVPXbcqdcYiD+ea1iZ8dM+WpWbV3jE8AlCWGSMVXI
         /UMA==
X-Forwarded-Encrypted: i=1; AL+hErHwRAKROE+lf5gdbzu8kzBB/HHULC78d5qFIrMtAJaFP5mYpdCD82LHcbbM5mkoOJ3GmgjXF3bzRcLRSq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eogSAT4BEaQGR9qG8PHnROUrzEVb0ajSaZikA3z4YVvyg0HGW
	1T8jo6RpaXxXOsReEO1MYu4QUGTVpFBgZv+l/vw28v28aLAKwEbhxF9e
X-Gm-Gg: AYBFou3EQDK/gzkWbFvUAt5tXpqsavc2BFvxuyHOhbzyT5owdUAuy/mXN0poHCR9GxO
	E+5nYKw6h6HKDkFUphAOXLwTJtJBcRFzJCovX+jCKVPIxhRhRPEBLdTkj3kuxldO+x0P+3b85CW
	RHmWJBrqLQGZM0jlrGPRsXQu8yu74tIgdfCuuXnwT31JHgFewp/+Y3+RQlLygg515/bm15PKOOG
	Ax3PSkltPag0+6Mpv60NtG5QEZugOdwOvH8iFqGkZfRUwlgHMTPqiQw5eq1I1PO1ABZnrcErzID
	ijNZHzF/zPLj8qiez7T6mu2Zd/l/iuENMp3PIwXnvU/STH5a4J+GUw8kI7+znYVMjyRtl+JARKl
	PXejqa3S08iFS0ZXoL35sJ02PQN1B4Z2S4gSkSh6NICZ0XHTM7gLK9RYDOybO7A2K+7Zs8LM1pC
	CdJVdlhHqQXdAXRNOA/Fbw4ZMCgodPSuQubo0BhHKufkIBTWLqWcAZDOU1rcNxmXZNGHs938q0V
	FJOwFNPCaGkQ4UN/vkoBU4kCh2ejqj0EhyRp0kjY0SNiuzA8dAJHYudeaHMDCnsZr+E+fC2tBZL
	UmzErNecCfpdidQqtCgZ+7H0XyrJnJ6M
X-Received: by 2002:a17:90b:1b07:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b0db6eea1amr4836457a91.23.1794061018020;
        Sat, 07 Nov 2026 06:16:58 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:57 -0800 (PST)
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
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
Date: Sat,  7 Nov 2026 21:14:31 +0700
Message-ID: <20261107141432.39099-3-killdeath104@gmail.com>
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

Move the nodes shared with the other Xiaomi SM6115 variants (Redmi 9T
and Poco M3) into sm6115-xiaomi-lime-common.dtsi, so that the other
variants can reuse them. No functional change intended: the
decompiled lemon DTS is identical before and after, except for the
numbering of auto-generated phandles.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 .../boot/dts/qcom/sm6115-xiaomi-lemon.dts     | 317 +----------------
 .../dts/qcom/sm6115-xiaomi-lime-common.dtsi   | 335 ++++++++++++++++++
 2 files changed, 336 insertions(+), 316 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
index 881e05b701..2caaca3033 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts
@@ -5,41 +5,17 @@
 
 /dts-v1/;
 
-#include "sm6115.dtsi"
-#include "pm6125.dtsi"
-#include "pmi632.dtsi"
 #include <dt-bindings/leds/common.h>
-
-/delete-node/ &pil_adsp_mem;
-/delete-node/ &pil_gpu_mem;
-/delete-node/ &pil_ipa_fw_mem;
-/delete-node/ &pil_ipa_gsi_mem;
+#include "sm6115-xiaomi-lime-common.dtsi"
 
 / {
 	model = "Xiaomi Redmi 9T";
 	compatible = "xiaomi,lemon", "qcom,sm6115";
-	chassis-type = "handset";
 
 	aliases {
 		mmc0 = &sdhc_2;
 	};
 
-	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		framebuffer0: framebuffer@5c000000 {
-			compatible = "simple-framebuffer";
-			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
-			width = <1080>;
-			height = <2340>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
-		};
-	};
-
 	backlight_dsi: backlight-dsi {
 		compatible = "led-backlight";
 		leds = <&led_backlight>;
@@ -49,38 +25,12 @@ backlight_dsi: backlight-dsi {
 		status = "disabled";
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&vol_up_n>;
-		pinctrl-names = "default";
-
-		key-volume-up {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
-			debounce-interval = <15>;
-			linux,can-disable;
-			wakeup-source;
-		};
-	};
-
 	reserved-memory {
 		pil_adsp_mem: memory@53400000 {
 			reg = <0x0 0x53400000 0x0 0x2600000>;
 			no-map;
 		};
 
-		pil_ipa_fw_mem: memory@55a00000 {
-			reg = <0x0 0x55a00000 0x0 0x10000>;
-			no-map;
-		};
-
-		pil_ipa_gsi_mem: memory@55a10000 {
-			reg = <0x0 0x55a10000 0x0 0x5000>;
-			no-map;
-		};
-
 		pil_gpu_mem: memory@fa400000 {
 			reg = <0x0 0xfa400000 0x0 0x2000>;
 			no-map;
@@ -108,19 +58,6 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
-&dispcc {
-	/* Prevent simplefb from dying until we wire panel driver */
-	status = "disabled";
-};
-
-&gpi_dma0 {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
 &i2c1 {
 	status = "okay";
 
@@ -158,118 +95,13 @@ &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 };
 
-&pil_cdsp_mem {
-	reg = <0x0 0x51a00000 0x0 0xa00000>;
-};
-
-&pm6125_gpios {
-	vol_up_n: vol-up-n-state {
-		pins = "gpio5";
-		function = "normal";
-		power-source = <0>;
-		bias-pull-up;
-		input-enable;
-	};
-};
-
-&pmi632_typec {
-	status = "okay";
-
-	connector {
-		compatible = "usb-c-connector";
-
-		power-role = "dual";
-		data-role = "dual";
-		self-powered;
-
-		typec-power-opmode = "default";
-		pd-disable;
-
-		vbus-supply = <&pmi632_vbus>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				pmi632_hs_in: endpoint {
-					remote-endpoint = <&usb_dwc3_hs>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				pmi632_ss_in: endpoint {
-					remote-endpoint = <&usb_qmpphy_out>;
-				};
-			};
-		};
-	};
-};
-
-&pmi632_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <1000000>;
-
-	status = "okay";
-};
-
-&pon_pwrkey {
-	status = "okay";
-};
-
-&pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-
-	status = "okay";
-};
-
-&qupv3_id_0 {
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	status = "okay";
-};
-
-&remoteproc_mpss {
-	status = "okay";
-};
-
 &rpm_requests {
 	regulators-0 {
-		compatible = "qcom,rpm-pm6125-regulators";
-
-		pm6125_s6: s6 {
-			regulator-min-microvolt = <304000>;
-			regulator-max-microvolt = <1456000>;
-		};
-
 		pm6125_s7: s7 {
 			regulator-min-microvolt = <1280000>;
 			regulator-max-microvolt = <2080000>;
 		};
 
-		pm6125_s8: s8 {
-			regulator-min-microvolt = <1064000>;
-			regulator-max-microvolt = <1304000>;
-		};
-
-		pm6125_l1: l1 {
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1152000>;
-		};
-
-		pm6125_l4: l4 {
-			regulator-min-microvolt = <488000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
 		pm6125_l5: l5 {
 			regulator-min-microvolt = <1648000>;
 			regulator-max-microvolt = <2960000>;
@@ -278,11 +110,6 @@ pm6125_l5: l5 {
 			regulator-always-on;
 		};
 
-		pm6125_l6: l6 {
-			regulator-min-microvolt = <576000>;
-			regulator-max-microvolt = <656000>;
-		};
-
 		pm6125_l7: l7 {
 			/* sdhci2 vdd-io-bias supply */
 			regulator-min-microvolt = <1256000>;
@@ -291,51 +118,11 @@ pm6125_l7: l7 {
 			regulator-always-on;
 		};
 
-		pm6125_l8: l8 {
-			regulator-min-microvolt = <400000>;
-			regulator-max-microvolt = <728000>;
-		};
-
-		pm6125_l9: l9 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2000000>;
-		};
-
-		pm6125_l10: l10 {
-			regulator-min-microvolt = <1704000>;
-			regulator-max-microvolt = <1904000>;
-		};
-
 		pm6125_l11: l11 {
 			regulator-min-microvolt = <1768000>;
 			regulator-max-microvolt = <1952000>;
 		};
 
-		pm6125_l12: l12 {
-			regulator-min-microvolt = <1624000>;
-			regulator-max-microvolt = <1984000>;
-		};
-
-		pm6125_l13: l13 {
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1952000>;
-		};
-
-		pm6125_l14: l14 {
-			regulator-min-microvolt = <1704000>;
-			regulator-max-microvolt = <1904000>;
-		};
-
-		pm6125_l15: l15 {
-			regulator-min-microvolt = <2920000>;
-			regulator-max-microvolt = <3232000>;
-		};
-
-		pm6125_l16: l16 {
-			regulator-min-microvolt = <1704000>;
-			regulator-max-microvolt = <1904000>;
-		};
-
 		pm6125_l17: l17 {
 			regulator-min-microvolt = <1152000>;
 			regulator-max-microvolt = <1384000>;
@@ -346,21 +133,6 @@ pm6125_l18: l18 {
 			regulator-max-microvolt = <1232000>;
 		};
 
-		pm6125_l19: l19 {
-			regulator-min-microvolt = <1624000>;
-			regulator-max-microvolt = <3304000>;
-		};
-
-		pm6125_l20: l20 {
-			regulator-min-microvolt = <1624000>;
-			regulator-max-microvolt = <3304000>;
-		};
-
-		pm6125_l21: l21 {
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <3600000>;
-		};
-
 		pm6125_l22: l22 {
 			regulator-min-microvolt = <2952000>;
 			regulator-max-microvolt = <2960000>;
@@ -369,11 +141,6 @@ pm6125_l22: l22 {
 			regulator-always-on;
 		};
 
-		pm6125_l23: l23 {
-			regulator-min-microvolt = <3200000>;
-			regulator-max-microvolt = <3400000>;
-		};
-
 		pm6125_l24: l24 {
 			regulator-min-microvolt = <2704000>;
 			regulator-max-microvolt = <3600000>;
@@ -382,23 +149,9 @@ pm6125_l24: l24 {
 };
 
 &sdhc_2 {
-	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-0 = <&sdc2_state_on>, <&sdc2_cd_on>;
-	pinctrl-1 = <&sdc2_state_off>, <&sdc2_cd_off>;
-	pinctrl-names = "default", "sleep";
-
-	vmmc-supply = <&pm6125_l22>;
-	vqmmc-supply = <&pm6125_l5>;
 	/* No binding for vdd-io-bias on L7*/
 	no-sdio;
 	no-mmc;
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32764>;
 };
 
 &spi2 {
@@ -406,8 +159,6 @@ &spi2 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <14 4>; /* Fingerprint SPI */
-
 	lm3692x_bl_active: lm3692x-active-state {
 		pins = "gpio99";
 		function = "gpio";
@@ -422,20 +173,6 @@ mdss_dsi_active: mdss-dsi-active-state {
 		bias-disable;
 	};
 
-	sdc2_cd_on: sdc2-cd-on-state {
-		pins = "gpio88";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	sdc2_cd_off: sdc2-cd-off-state {
-		pins = "gpio88";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	te_active: te-active-state {
 		pins = "gpio81";
 		function = "mdp_vsync";
@@ -443,55 +180,3 @@ te_active: te-active-state {
 		bias-pull-down;
 	};
 };
-
-&ufs_mem_hc {
-	vcc-max-microamp = <600000>;
-	vcc-supply = <&pm6125_l24>;
-	vccq2-max-microamp = <600000>;
-	vccq2-supply = <&pm6125_l11>;
-	vdd-hba-supply = <&pm6125_l18>;
-
-	status = "okay";
-};
-
-&ufs_mem_phy {
-	vdda-phy-supply = <&pm6125_l4>;
-	vdda-pll-supply = <&pm6125_l12>;
-
-	status = "okay";
-};
-
-&usb {
-	status = "okay";
-};
-
-&usb_dwc3 {
-	maximum-speed = "high-speed";
-};
-
-&usb_dwc3_hs {
-	remote-endpoint = <&pmi632_hs_in>;
-};
-
-&usb_hsphy {
-	vdd-supply = <&pm6125_l4>;
-	vdda-pll-supply = <&pm6125_l12>;
-	vdda-phy-dpdm-supply = <&pm6125_l15>;
-
-	status = "okay";
-};
-
-&usb_qmpphy {
-	vdda-phy-supply = <&pm6125_l4>;
-	vdda-pll-supply = <&pm6125_l12>;
-
-	status = "okay";
-};
-
-&usb_qmpphy_out {
-	remote-endpoint = <&pmi632_ss_in>;
-};
-
-&xo_board {
-	clock-frequency = <19200000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi
new file mode 100644
index 0000000000..16883e35b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026 Adam Skladowski <a39skl@gmail.com>
+ */
+
+#include "sm6115.dtsi"
+#include "pm6125.dtsi"
+#include "pmi632.dtsi"
+
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &pil_gpu_mem;
+/delete-node/ &pil_ipa_fw_mem;
+/delete-node/ &pil_ipa_gsi_mem;
+
+/ {
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
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
+	reserved-memory {
+		pil_ipa_fw_mem: memory@55a00000 {
+			reg = <0x0 0x55a00000 0x0 0x10000>;
+			no-map;
+		};
+
+		pil_ipa_gsi_mem: memory@55a10000 {
+			reg = <0x0 0x55a10000 0x0 0x5000>;
+			no-map;
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
+&pil_cdsp_mem {
+	reg = <0x0 0x51a00000 0x0 0xa00000>;
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
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+};
+
+&remoteproc_mpss {
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
+		pm6125_l6: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
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
+		pm6125_l23: l23 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
+		};
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&sdc2_state_on>, <&sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_state_off>, <&sdc2_cd_off>;
+	pinctrl-names = "default", "sleep";
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
+	gpio-reserved-ranges = <14 4>; /* SE5 SPI (fingerprint), not usable from Linux */
+
+	sdc2_cd_on: sdc2-cd-on-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_off: sdc2-cd-off-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&ufs_mem_hc {
+	vcc-max-microamp = <600000>;
+	vcc-supply = <&pm6125_l24>;
+	vccq2-max-microamp = <600000>;
+	vccq2-supply = <&pm6125_l11>;
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
+&xo_board {
+	clock-frequency = <19200000>;
+};
-- 
2.47.3

