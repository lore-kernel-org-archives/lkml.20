Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342354;
	b=r5Er8/ZQO0jRFh0MqNDC3VGxTi1BqPXqtwe8V/wzXGKPnjwJKfLZ2DNe9uPYFSvTZixF
	 5p/v+ycEZCvh8dICp+EE79EvLLDT5s2cHMXkJGsB8KYpUjWlPEb1kQhb/4P6cEUZjkm5f
	 2b12tUNv2yMDoOZMIZa58eQQB6zYxY1xXPnUSvrloBqlN6+YU3o0A7u6nuMOFCFVi6JHq
	 qiQtg7YQr7sTAkzsbA7l2sl7o6Ekxq1sCefHMesSUozL8C+DkQkaWfMM1SaOFZv/DC1Dl
	 VQxlYNTlvizZyUf6Qy5uhujtqsLQV/cNPT3MTsaSmVAk1WDzKo8mtlGhkzuoxyHDOxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
	b=TeDf2oipkh/c7Z+gPwFOTq7f+G5ep5yEvMiZcGeJlvO+DdRn2aq6E1Ll6kByARTeYVg9
	 2GLykWqexElX9OW4XRVZlMIjrQYp5xWILvaXQwmOF62vaCT+7MZ2Ac4HsocjD+BQ07c0s
	 5y+hqFtJhajp3FOakj43f0qDm0/z+b7NPOIZpv2rrJ+BwTc1y2o0BXo2ZV81TBT/muBs+
	 W6afW4MQ0dSB6I1WqqBK3BknmV9uCXMIXDx/TEG3Q1U61Kbh001cytouiAOj6s1gm1bQr
	 pTBEDTHqh+GazEPgUbE/QikPhW5UnpP1AbtDz0USNWvSZPL1PJlvXWdFiQ+2YY/1Gig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak57fYpA;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4690D60A3803
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4690D60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak57fYpA
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-717080a2d50so1750641eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342352; x=1794947152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
        b=ak57fYpA+NzKZA+GJU56IRIlakmzz5YQuAsTq5In9PHJ72U7cFhOoXMT95aOC7WiB+
         8h/Z0tUAGcYc0ifz5PFLpqN74LnQ1W+XNPGnKg7HO4nX8Tgrr1SCbjjQJJIcwcn87hfg
         UQEFNplgI+/D8Pf7sMcXJCac2AxVm5vnYYUMWLJxPTYGtJedmDTiNXZQ3/Dg16F0KQoa
         9rSdYCL4CH9OIg68JiNFZG5Eu5AEAmUjESj2W4h6IuLilMUl95EzFazcv+Syod/ErTuT
         r3VVqbpDtE2ni9cvTCc5HFHM8uom7VeX3qxmkUvGgrQZz1rACkwdDklq83NF3u61ENM1
         570w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342352; x=1794947152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
        b=hZC+hcbeVVMccSs0+xtF45gm+07qghjBaIzbfp8gmywjNfTDymaSSnolcRB8H2qT/2
         ToznTYLRLqR9NPB50oTBJAfk3jtvH4AInyJ4H5kgh8BlraYlqGw8+SzupbauefCUJeNw
         /QWeTj+2Q7qAcBtxYcPvQe61okZfQaMv9TmKZsDbIuUqCzgJAaBVwtAWknp9fM7Yx0I4
         hbdmB7NysdXF8K/pXRSltPjKJwDz36vlFAcjqo9/DpcFfSOS0Gdjy67bs7xqytGaB1ec
         UWsQLSBBvsroKYN59XYsOkYqn05y08vN9fmr/q6hqQEUhqFQMZ2YYz3W7SkO4j6U787R
         GWpw==
X-Forwarded-Encrypted: i=1; AL+hErH76IWXFX8nM76OX9ra4VaazcEJBUC8Z/ZBmPbOPMvGt6oI4WThYS2oJn4Ni3REMs91bX2TQI0pkE720A0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G0t4HuMlbM0Qj15Y/hAB/EkrGZDVVy/CsqN8kFVC4v6xclp81
	F1PtCICHizYCbXbrlP3EcQM3MqMGQj2uT9FaVdCTl6eDHTQqUw5kPdg5
X-Gm-Gg: AYBFou1qPB+wropq78Ud+b6fyr5XKsa1EHDyqg8WwTHDTMD4FGsRJcLDGAnHU0sTfiV
	7LIpYWQL0IgJ5vztPHaquWITRLf1NyW3EElYbHXb5AAHXgTUuTQZ+Xbto3JWyOV2ZnN3c1Jez5s
	goWN09jiGf/ILAoMWLGSH6Ei2OITu7qrjHmlgOK8UPZyAO9dtngD1Ujxy2+5MhGX4uLAyLbVqlf
	d9Huefbf8Xk4Wac0jivj9GnKWWF6LDMdItXxPVU3k350EP3Pod1IFCaZtPQgtptN8K5q/xL7h5z
	C3+k4abINhyGRYS94QipjddfV2SEi0CWBf7A/qUyM7UZ4iAl7nV8ZxsyvprmPbrLy4KI4WGEoeu
	j07btrJd5ymUk9CVEMUNy1pctE/CN6Pd0XnmMkpgdOpnY2zcr27Uut+MjSuLF6O7ZD+L5DtEYAg
	75NPRxiz1phrzr8UDxZnYKFrPmfdlWR1DyjRUpDHNjYujLSMTDVtG8e8NXt0Z6Yphy82RvfDBvD
	0myJl8Ti1PlLv6O3+XJoBNDm0m4g3ckV1tpjle3Hk/nTMKoWZkyuTc32+suEPHFhLOKoZKbHS6s
	1cZZun/CVmLuto7Fv285Oi/SxpSv5cCFI5sXE2pYSdpGXcXLB8a7OA==
X-Received: by 2002:a05:6820:2214:b0:707:27c7:86d0 with SMTP id 006d021491bc7-719175d0444mr145066eaf.4.1794342351981;
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:45 -0600
Message-ID: <20261110202445.14100-3-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110202445.14100-1-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
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

Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.

Supported and tested:
- Keyboard, touchpad and touchscreen over I2C HID
- Lid switch
- NVMe SSD (PCIe 5)
- Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
- Two USB-C ports with orientation switching, USB PD and battery
  reporting through pmic-glink
- USB-A port (usb_2)
- Webcam on the internal USB 2.0 host
- eDP OLED panel with DP AUX backlight
- DisplayPort alt mode on both USB-C ports
- ADSP and CDSP remoteprocs
- Two speakers (WSA8845) and two digital microphones

The GPU is left disabled until Mahua's Adreno X2-85 is supported.

This device tree was written with the help of an AI coding assistant
(Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
ACPI tables. The regulator voltages were checked against the power
votes in the ACPI tables, where they are listed. I reviewed it and
tested every feature listed above on the laptop.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 657 ++++++++++++++++++
 2 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60..e84836e5c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-hp-omnibook-x16.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
new file mode 100644
index 0000000000..1d30dff7d2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Copyright (c) 2026 Jeff Roach <jeff.roach0@gmail.com>
+ */
+/dts-v1/;
+
+#include "mahua.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	model = "HP OmniBook X 16-cp1";
+	compatible = "hp,omnibook-x16-cp1", "qcom,mahua";
+	chassis-type = "laptop";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c8 = &i2c8;
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&lid_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left rear USB-C port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
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
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Left front USB-C port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
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
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "HP-OmniBook-X16";
+
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/* Qualcomm QCC2072 Wi-Fi/Bluetooth module in an M.2 key E slot */
+	wlan-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+		vpcie1v8-supply = <&vreg_l15b0>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+};
+
+&gmu {
+	status = "disabled";
+};
+
+&gpu {
+	status = "disabled";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	status = "okay";
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&pcie5 {
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qcadsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qccdsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, left speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, right speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	lid_default: lid-default-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+/* USB-A port on the right side */
+&usb_2 {
+	dr_mode = "host";
+
+	/delete-property/ usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	refgen-supply = <&vreg_l1c1>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <1 0>;
+			};
+		};
+	};
+};
+
+/* Internal USB 2.0 host for the webcam */
+&usb_hs {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	status = "okay";
+};
-- 
2.55.0

