Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281042;
	b=t0DvUc3v2bCJc+m/jgnhZd7jhZntGt6f4OIjH90X/6DR+orHI7zmva5/2pphx/U5mWe8
	 JaKn5wy62xAwkkcDCSXILMWQBOHdjWK8I6DNpbqJN/fknkTyySLbzJcQATE9p79EclibU
	 vc6da5Nsfg/aQP3An8X8bO/LFFLk28fOVaQEzKXtpefdwAT/0APa5cQ8Oxw4PUHJDAJ5k
	 yViZlDUP7wDcGpu2Amj1asYkgyOc4UBz5ngSbRCAxuu1T7tvj4qQX45ATNmXrewlNtaFB
	 18DLQ3jlRvpPP9KDvDlltHII//NujHp5KuUtUb4TWri3FMpTMyVMLsODZqdScmRvKIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2UWpUZrVlnI6LKkPGCAXFEMAitXZdC9zHv0+aPoHcyQ=;
	b=B1wglQcGgJorNkYUxHzbzCIb+1r6MXkgdiQnR+CFKxkiFwdej3skE3YcvNcmcI/2o+Me
	 mHNJu/VM0R5OlbElrn2w1brOD5AxuBVfmSwrYHgDh6KHAAxSprg3DNOOC83PQvPkeVPCY
	 tyt1ejTFe07ByLsHQjDomL0Ky6vO0YflScNwgfy4AqspETglB3j856HWnywbAb6YfdUX3
	 izDSQNXXPrywjsAJ2VGDH3QzAUoRc8oWW/Tb41WLE85x4UtOq+9Ug3N6L5UMJRWeo94Wb
	 7vB7UqJWX4AMc/omRIgY3HjgwRfI78Z1aXG6bMbEybLwKZjL0jmU1R266HBOJKoiOjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mry5a6fG;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3210A606DA7A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3210A606DA7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mry5a6fG
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-156cbe59524so2390118c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281040; x=1793885840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UWpUZrVlnI6LKkPGCAXFEMAitXZdC9zHv0+aPoHcyQ=;
        b=Mry5a6fGgUhNFMdZv4gBw+rO9H9yxwxSVtSRMb25QH+7I/FKOyWbi0meqOZsz7q4Ew
         nEzoZ4t2EVGXyk+PbKravlL5jNkBWbvgWw9Qw5MkLuZrTKrAqZ5fHGfg71qUmjiMfktv
         Te7c/3e0T9qiG1HI6xhGll4iu3EMf/5+z7VoOrpynGsRkq7AmzbhLC/wWaFmFK2rGqm2
         tWfQQyjvX3efndDwc7LTSmWrYz4WIfdJZtWOeaIhRv4I4zOobFPrXb/uofKdh+UPEAwk
         ZcTCJ8bQNi123Q/pQJxA3oUv7U6nl7kzHABAtALRYHUI4CU6vmJxviOZesiaxQCJwiZZ
         Y0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281040; x=1793885840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UWpUZrVlnI6LKkPGCAXFEMAitXZdC9zHv0+aPoHcyQ=;
        b=LkAiN4/wBwJqQ+S7C0pmbvkg0MdY/gz1QHTaoARRnzAkZpD31ewPMN9EAO2Arq7ohl
         AzUeGxzaVMI6w9fH2PiovjIAZiWXVdzvqwKTV06kWCH0bAyhPrhNHAtfROdvqPjIwxwb
         Mz8VGI4XyVfp0cYv9d6beHJFQ6PQqrqth62Ffr6j/uH2hQ9G5Pb+GzuiXg9CSlaUVeUd
         35xLKEP9eboTe8/saI6Sxt5T9dftQr+XDeGQ6eOnPqB/BZMwSRqBb0pmeHDlIk7r0pWw
         eTIzRDPMszYaS2uvztFb6sYNqe47xnaTVJ0PTJWAq0P2PQHz3eOWz+f0aiWcryV/nSBK
         +iHA==
X-Forwarded-Encrypted: i=1; AKwUvBxOaRsB2++kdjBmMhvmy/WJqNZi4H38301NVyM2qwx1MlATS+XkYSqeFidnJdvJ6oNuQmP2L+ZjeLY54Jo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJebXKWSnGvgkfMyGtm2KxmE021bHh6zMn8UT5s2YG1i99ELsB1
	QuKzeOF4AZWSrPGEgvkDDW0Fvo3fEVkF8bFIwWp93qkn+KX0U4R1oNAx
X-Gm-Gg: AYBFou2TveKE1wJb/9pmjOISx4n3VssZnmM3mNAJUGjRuFsPfBoIM9unRxR2Ki4zmnf
	U35Uh4+63+jD9gdFBqEMHhWJUwIFg8Xex1tg8qJSgrUbqLvj4TIpYMNRrOm7ejEWX4d7A5yHc9k
	Lme47P4zvkN56bfsN557zLmuMuPYZSDF269BKLbj6m+uRsAblYuPdXP2u+rLIbDDaOYh79omk8+
	cdQPeHIEjGfGvKcNIB6wcYB9zfaIjKi8zp0e6m7qGQJ/10AHIOG0zpjh5lnChp1M39CxFfo2fXT
	cdrfwhg9IzHEgXTtwygAUiMhz9TY0a+jwzSjpJB22GPS0XbBJJz8rb2hG79WLVigcHqMw/bPsRj
	6BbqaGo9Lwu9rg+yVurgD6527Xh2r+BDg6iVbdw2lGPH8KWNcQXsdd7811Z5HU8lpcTNX7bMSij
	6mmTA9uIznGGBO2MjXwPTYj/38cz7lP9ICN+bojAtcMPBBrXLGQSZ7kYBjo4rExiwHfqkoqr7Nl
	rawv+xtz/6O2pWQ243ytaa5QlO9QpwnqXRnn19P+ScYz7PzzprQgGIjczRnSQST3E31Ci4cNPQ3
	/5y8YBuDRf3rvUByCb61Mvu2hninpiSn50TjHkdkJpKy/0EffspyzSo19Vwrh2wVj0AMsLMRgLM
	=
X-Received: by 2002:a05:7022:2582:b0:192:fd91:c567 with SMTP id a92af1059eb24-1a6cd498f92mr9629178c88.11.1793281040065;
        Thu, 29 Oct 2026 06:37:20 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:19 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs9100: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:54 +0530
Message-ID: <20261029133654.6585-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029133654.6585-1-blfizzyy@gmail.com>
References: <20261029133654.6585-1-blfizzyy@gmail.com>
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

Add a device tree for the Vicharak Axon Pro single-board computer
based on the Qualcomm QCS9100.

Describe the PMIC regulators and enable the debug UART, UFS, USB 2.0
host with an onboard hub, PCIe, SGMII Ethernet, GPIO LEDs, GPU, DSPs,
and audio through the ES8388 codec and two digital microphones.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 848 ++++++++++++++++++
 2 files changed, 849 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..a5e0a17e4129 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -57,6 +57,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-vicharak-axon-pro.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts b/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts
new file mode 100644
index 000000000000..9431a5c381c9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts
@@ -0,0 +1,848 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Vicharak Computers Pvt. Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+/ {
+	model = "Vicharak Axon Pro";
+	compatible = "vicharak,axon-pro", "qcom,qcs9100", "qcom,sa8775p";
+
+	aliases {
+		serial0 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	speaker_amp: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&tlmm 27 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vcc_5v0_sys>;
+		sound-name-prefix = "Speaker Amp";
+	};
+
+	dmic: audio-codec-0 {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+		vref-supply = <&vreg_s5c>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&user_leds>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "keep";
+			retain-state-suspended;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+			retain-state-suspended;
+		};
+	};
+
+	vcc_3v3_sys: regulator-vcc-3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_sys";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_5v0_sys: regulator-vcc-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	regulator-vcc-5v0-usb2-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_usb2_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vcc_5v0_sys>;
+
+		gpio = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+
+		/* USB-A host VBUS has no software-controlled connector driver. */
+		regulator-always-on;
+	};
+
+	vcc_pcie1_en: regulator-vcc-pcie1-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_pcie1_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vcc_5v0_sys>;
+
+		gpio = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie1_en>;
+		pinctrl-names = "default";
+	};
+
+	sound {
+		compatible = "qcom,qcs9100-sndcard";
+		model = "LEMANS-AXON-PRO";
+		aux-devs = <&speaker_amp>;
+		audio-routing = "Speaker Amp INL", "LOUT2",
+				"Speaker Amp INR", "ROUT2";
+
+		pinctrl-0 = <&hs1_mi2s_active>, <&mi2s_mclk1_active>, <&hs2_mi2s_active>;
+		pinctrl-names = "default";
+
+		hs1-mi2s-capture-dai-link {
+			link-name = "HS1 MI2S Capture";
+
+			codec {
+				sound-dai = <&es8388>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs1-mi2s-playback-dai-link {
+			link-name = "HS1 MI2S Playback";
+
+			codec {
+				sound-dai = <&es8388>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hs2-mi2s-capture-dai-link {
+			link-name = "HS2 MI2S Capture";
+
+			codec {
+				sound-dai = <&dmic>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <2970000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1816000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* Powers boot/reset straps and always-active level shifters. */
+			regulator-always-on;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1996000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9a: smps9 {
+			regulator-name = "vreg_s9a";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5c: smps5 {
+			regulator-name = "vreg_s5c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+
+			/* Keep the RTL8221B powered for MDIO discovery. */
+			regulator-always-on;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1450000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4e: smps4 {
+			regulator-name = "vreg_s4e";
+			regulator-min-microvolt = <970000>;
+			regulator-max-microvolt = <1520000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7e: smps7 {
+			regulator-name = "vreg_s7e";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9e: smps9 {
+			regulator-name = "vreg_s9e";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "g";
+
+		vreg_l4g: ldo4 {
+			regulator-name = "vreg_l4g";
+			regulator-min-microvolt = <850000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/* RTL8221B DVDD09 */
+			regulator-always-on;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-mode = "sgmii";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: ethernet-phy@5 {
+			reg = <5>;
+			interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0>;
+			snps,route-up;
+			snps,priority = <1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <3>;
+			snps,priority = <12>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
+&i2c8 {
+	status = "okay";
+
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vcc_3v3_sys>;
+		DVDD-supply = <&vreg_s5c>;
+		HPVDD-supply = <&vcc_3v3_sys>;
+		PVDD-supply = <&vreg_s5c>;
+
+		clocks = <&q6prmcc
+			  LPASS_CLK_ID_MCLK_2
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		assigned-clocks = <&q6prmcc
+				   LPASS_CLK_ID_MCLK_2
+				   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		assigned-clock-rates = <12288000>;
+	};
+};
+
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	vddpe-3v3-supply = <&vcc_pcie1_en>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pmm8654au_0_gpios {
+	gpio-line-names = "DS_EN",
+			  "POFF_COMPLETE",
+			  "UFS0_VER_ID",
+			  "FAST_POFF",
+			  "DBU1_PON_DONE",
+			  "AOSS_SLEEP",
+			  "CAM_DES0_EN",
+			  "CAM_DES1_EN",
+			  "CAM_DES2_EN",
+			  "CAM_DES3_EN",
+			  "UEFI",
+			  "ANALOG_PON_OPT";
+};
+
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmm8654au_1_gpios {
+	gpio-line-names = "PMIC_C_ID0",
+			  "PMIC_C_ID1",
+			  "UFS1_VER_ID",
+			  "IPA_PWR",
+			  "",
+			  "WLAN_DBU4_EN",
+			  "WLAN_EN",
+			  "BT_EN",
+			  "USB2_PWR_EN",
+			  "USB2_FAULT";
+};
+
+&pmm8654au_2_gpios {
+	gpio-line-names = "PMIC_E_ID0",
+			  "PMIC_E_ID1",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SGMII0_RST",
+			  "SGMII1_RST",
+			  "",
+			  "",
+			  "VMON_SPX8";
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@12 {
+		reg = <SECONDARY_MI2S_RX>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_SEC_MI2S_IBIT
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_2
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		clock-names = "bclk", "mclk";
+	};
+
+	dai@13 {
+		reg = <SECONDARY_MI2S_TX>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_SEC_MI2S_IBIT
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_2
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		clock-names = "bclk", "mclk";
+	};
+
+	dai@15 {
+		reg = <TERTIARY_MI2S_TX>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_TER_MI2S_IBIT
+			  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+
+		clock-names = "bclk";
+	};
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	firmware-name = "qcom/sa8775p/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l4a>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	hs1_mi2s_active: hs1-mi2s-active-state {
+		pins = "gpio118", "gpio119", "gpio120", "gpio121";
+		function = "hs1_mi2s";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mi2s_mclk1_active: mi2s-mclk1-active-state {
+		pins = "gpio117";
+		function = "mi2s_mclk1";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_en: pcie1-en-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb2_en: usb2-en-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	user_leds: user-led-state {
+		pins = "gpio16", "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart10 {
+	compatible = "qcom,geni-debug-uart";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l8a>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l4c>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	/* Routed to an onboard USB hub for two USB-A host ports. */
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.50.1 (Apple Git-155)

