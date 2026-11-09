Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262557;
	b=kxrvjDAV/5nEETtctnXgeMdHtj2MxD8XDcdAPIBxUfQDGf9obvPZIlMkYNn5YLjEH6Kh
	 2UYbnzua3kjn7NWPYe5xuktuPVQMUMWzC+HWKwhvU9/PkmrA5wQD7kRYT+iJLmtmZtn80
	 z5KEZ16WAuRP2YvQrdrk6eHFE/9z7tvhElxwu24uDHVkja+O4FFP9VdU3yRfemqBkqiNl
	 agqDIZOBYGT32ml3dtZJIkY+c7KsPQ8NQA5tJI9Rj65bCrpOAMcgHhxbk9S4RdlisERV3
	 iJcmLlHNg6tQ3uLXGxw4+7ZfxXrprGpMBqNjGBah3Tkew8YpyR1gq36VJfhAIfhi6mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262557;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xnuGvwDOrbu52j/k9LzaMEgO6UesZH/gF/4y9/fHv8U=;
	b=5UaPF8ihhsWWUzYq6hTIW0nf5HT0I6UpsMFreO5PGBNzjfm2uqnK/Lhg8Z5m5QdMKr+c
	 qdssey4s+KyulSet1z65DgHSuoewI6nSp0OPfwe25Xl+Pp6Ei6dAYjvuQWYipHgHNq5PJ
	 f/XJG3D4Tnwwi67ifI3FnOv9ipcLkAkFyjgeOsrr60Gg80yiegkxXKXuvfjZ+2+U5lgpY
	 JJouCM2J9l2gEB1EY2gYi2f1X2tt5opQdw+PsdtUft71gOd31ACDAObIxPX6WwhVSuB9W
	 q/sdYfV9VucWW74Ulm24AcoI5dJaa8z8piZb4AadTULZZQLU3fzlZMeH1w9gmNJg/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=AmNgOLd4;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E660A2600
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9E660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=AmNgOLd4
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vl8em2le6r9R4gWj7WyezubQwCRTkYgmy6/jQ9x5LPk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262554; v=1; x=1794867354;
 b=AmNgOLd41fYDfs/3Ul439uTAJGMQCTBhMzDQgUFaN8Bb6oT3uLUxb11o2yi4LhY8l86jP4oo
 Xnm+VUyesQwCcNi+7uSCb+GuWvXyTr7ApLRQbteRtjsoFkjfLEZYVTN930sNDKE5/JeWXZNtR2Q
 mU4CvR00z18MwYe4EtYxNZD01Sq9l0K7MiqooKgyRq3ZtmkVRZZCihd47m8X5WltmJ7R4gR3meB
 K6rPid4Dl/IUHkPefIXAifPCIBw6A2NcH2906QJ9B0K0Ml8VI1HViyp21e/BJKugCn+9xEZqbzT
 fqsTVgviKeZH8AZQKvmpPaCxVU6+8aXVaLJdv6P5EkVGA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c46bb50348f69123;
	Mon, 09 Nov 2026 22:15:54 +0000
X-Mizu-Trace-ID: c46bb50348f69123
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: Add sm6115-motorola-common
Date: Mon,  9 Nov 2026 19:14:33 -0300
Message-ID: <20261109221453.658316-5-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add the shared dtsi for sm6115/sm4250-based Motorola smartphones,
with support for:

* Simple framebuffer from bootloader
* Power, volume, and assistant buttons (PMI632)
* Charging LED, haptics/vibrator (PMI632)
* USB Type-C with dual-role USB 2.0 (PMI632)
* eMMC onboard storage and microSD card slot
* Wi-Fi, Bluetooth (WCN3990)

Signed-off-by: Val Packett <val@packett.cool>
---

yes on both phones I've tested, only msm-id is required, not board-id.

---
 .../boot/dts/qcom/sm6115-motorola-common.dtsi | 541 ++++++++++++++++++
 1 file changed, 541 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
new file mode 100644
index 000000000000..6a5110319bc3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
@@ -0,0 +1,541 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/usb/pd.h>
+#include "pm6125.dtsi"
+#include "pmi632.dtsi"
+
+/ {
+	chassis-type = "handset";
+
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <QCOM_ID_SM6115 0x10000>;
+
+	aliases {
+		bluetooth0 = &bluetooth;
+		hsuart0 = &uart3;
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		serial0 = &uart4;
+		wifi0 = &wifi;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_memory>;
+			width = <720>;
+			height = <1600>;
+			stride = <(720 * 4)>;
+			format = "a8r8g8b8";
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>;
+			vddio-supply = <&vreg_l9a>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_assistant_n>, <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-assistant {
+			label = "Assistant";
+			gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
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
+		ramoops@af000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xaf000000 0x0 0xbf800>;
+			record-size = <0x3f800>;
+			pmsg-size = <0x40000>;
+			console-size = <0x40000>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+	};
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
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm6125_l18a>;
+
+	pinctrl-0 = <&mdss_dsi_active &mdss_te_active_sleep>;
+	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_active_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	panel: panel@0 {
+		reg = <0>;
+
+		avdd-supply = <&pmi632_lcdb_ldo>;
+		avee-supply = <&pmi632_lcdb_ncp>;
+
+		status = "disabled";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm6125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <0>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pmi632_lpg {
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		function = LED_FUNCTION_CHARGING;
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
+
+				pmi632_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
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
+&pmi632_vib {
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
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm6125-regulators";
+
+		pm6125_s6a: s6 {
+			regulator-min-microvolt = <304000>;
+			regulator-max-microvolt = <1456000>;
+		};
+
+		pm6125_s7a: s7 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <2080000>;
+		};
+
+		pm6125_s8a: s8 {
+			regulator-min-microvolt = <1064000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm6125_l1a: l1 {
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1152000>;
+		};
+
+		pm6125_l4a: l4 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm6125_l5a: l5 {
+			regulator-min-microvolt = <1800000>;
+			/* 3.056V capped to 2.96V for SDHCI */
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+			/* Broken hw, this one can't be turned off or SDHCI will break! */
+			regulator-always-on;
+		};
+
+		pm6125_l6a: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
+		};
+
+		pm6125_l7a: l7 {
+			/* 1.2V-1.304V fixed at 1.256V for SDHCI bias */
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-always-on;
+		};
+
+		pm6125_l8a: l8 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+
+		pm6125_l9a: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		pm6125_l10a: l10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l11a: l11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-allow-set-load;
+		};
+
+		pm6125_l12a: l12 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <1984000>;
+		};
+
+		pm6125_l13a: l13 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1952000>;
+		};
+
+		pm6125_l14a: l14 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l15a: l15 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+		};
+
+		pm6125_l16a: l16 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		pm6125_l17a: l17 {
+			regulator-min-microvolt = <1152000>;
+			regulator-max-microvolt = <1384000>;
+		};
+
+		pm6125_l18a: l18 {
+			/* 1.104V-1.312V fixed @ 1.232V for DSI PHY */
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1232000>;
+		};
+
+		pm6125_l19a: l19 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l20a: l20 {
+			regulator-min-microvolt = <1624000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l21a: l21 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3600000>;
+		};
+
+		pm6125_l22a: l22 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+		};
+
+		pm6125_l23a: l23 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
+		};
+
+		pm6125_l24a: l24 {
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
+		/* This is odd, but it only works with pull *up* and ACTIVE_HIGH */
+		bias-pull-up;
+	};
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	vmmc-supply = <&pm6125_l24a>;
+	vqmmc-supply = <&pm6125_l11a>;
+
+	no-sd;
+	non-removable;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+	vmmc-supply = <&pm6125_l22a>;
+	vqmmc-supply = <&pm6125_l5a>;
+
+	no-sdio;
+	no-mmc;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <14 4> /* SPI5 (TZ) */;
+
+	qup_uart3_sleep: qup-uart3-sleep-state {
+		cts-pins {
+			/*
+			 * Configure a pull-down on CTS to match the pull of
+			 * the Bluetooth module.
+			 */
+			pins = "gpio8";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		rts-pins {
+			/*
+			 * Configure pull-down on RTS. As RTS is active low
+			 * signal, pull it low to indicate the BT SoC that it
+			 * can wakeup the system anytime from suspend state by
+			 * pulling RX low (by sending wakeup bytes).
+			 */
+			pins = "gpio9";
+			function = "gpio";
+			bias-pull-down;
+		};
+
+		tx-pins {
+			/*
+			 * Configure pull-up on TX when it isn't actively driven
+			 * to prevent BT SoC from receiving garbage during sleep.
+			 */
+			pins = "gpio10";
+			function = "gpio";
+			bias-pull-up;
+		};
+
+		rx-pins {
+			/*
+			 * Configure a pull-up on RX. This is needed to avoid
+			 * garbage data when the TX pin of the Bluetooth module
+			 * is floating which may cause spurious wakeups.
+			 */
+			pins = "gpio11";
+			function = "gpio";
+			bias-pull-up;
+		};
+	};
+
+	key_assistant_n: key-assistant-n-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_te_active_sleep: mdss-te-active-sleep-state {
+		pins = "gpio81";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdss_dsi_active: mdss-dsi-active-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_dsi_sleep: mdss-dsi-sleep-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&uart3 {
+	status = "okay";
+
+	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart3_sleep>;
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddch0-supply = <&pm6125_l23a>;
+		vddio-supply = <&pm6125_l9a>;
+		vddrf-supply = <&pm6125_l17a>;
+		vddxo-supply = <&pm6125_l16a>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+
+	/* USB 2.0 only */
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_dwc3 {
+	maximum-speed = "high-speed";
+
+	/* Remove USB3 phy */
+	phys = <&usb_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&pm6125_l4a>;
+	vdda-phy-dpdm-supply = <&pm6125_l15a>;
+	vdda-pll-supply = <&pm6125_l12a>;
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6125_l8a>;
+	vdd-1.3-rfa-supply = <&pm6125_l17a>;
+	vdd-1.8-xo-supply = <&pm6125_l16a>;
+	vdd-3.3-ch0-supply = <&pm6125_l23a>;
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
-- 
2.56.0

