Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5140547A898;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=XN70g9XxekSx1j+AKoNrtos2RW0XEmBCmX+VcIc+ChvHu5TsJroghoTQQ7xwRcNeaIdwWDfMLU8rzod1czveJOhe+z7n1kXgCQsoSJaFbQD/AUso+0jo4EQIXr4iFhF3pnMrf9ahqvX/zZmaudspl1sFMtACRI3oPERqDz2WsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=0Wny3MyWQ81+tlNB90k7g1GgQgq82xtFl3DomK3NlRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCmWoPSDvsm/GZd17xgCdmABPjJofpol/uybIcTDgggISYVJOJ893VQ8Z0aahwIls97XrwerUKbzI2E1394OBdZzoB4epe+GMFiMdql/yVixlM9TA/U5IiBOBf3s6oaYUP6aSqY2WgflNMgO+/cNRFSxuTgxrM3WM44X+uXaFNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHuEGRU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHuEGRU/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E83B6C4AF11;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254011;
	bh=0Wny3MyWQ81+tlNB90k7g1GgQgq82xtFl3DomK3NlRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WHuEGRU/3S9LktuEsRRIZGW0SNO7wiFErzKWML2TABS7T+8Zt/MNrcyP2iDHGP7ZR
	 dTSBNHSum1W05qHItZu4cztf6I5WXMnxNhz16kgLkhFDvaHujj6LHXMAwXqE3xIZrN
	 4a4pFdDzb5PYge8+0jhBBHfNAv5P8PszGcKYkAaZKWWNc/kDScNqSsB/DIWAY+PvEb
	 CkkfiaLXHI/xWbFzkL4iXoMnZKeSErvJVDeFVBKf8l+/hKgyW6NY5xTLoJBwGxhTXB
	 mh/IfaS3GZcjLTkuZ3BX7sipQRVpTe9iEa9DdLgjRGtso8b9d7BHYS748jzT+ojgqY
	 FCqnfuIXkeodw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D446BC9830E;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 14:46:50 +0200
Subject: [PATCH v3 6/8] arm64: dts: qcom: sdm845-google: Add basic audio
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v3-6-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5540; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kcOJuw/9+ohJx6Qaeb4TQNVMUEcnU0DSvegSZd7bX2g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu4pgWbGkyQQ7bv8Axc8fYZHECCPzbB7kI0/
 PlALchkGBaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbuAAKCRBgAj/E00kg
 cqI1D/4xcs9nHc4M8/zYv6e5HayzuadgVhsAVIxoWA3zwOYZ2nh6WqbmnJA5TYXs9inYT53vgiD
 lmzEnTdO5zFEWn1/Ar3Fapgdszfvb2ZS9BodAsXBZqRTYqb6hJ0XJll8iK/oevq5sWw3GruRNl2
 KRrCvCGE73qe6UPtF6DTCyHWZiMKvIitIWcw4QFJ6paBL0VQ4bg4K75995p79SGijNBEWT3kFnE
 lRfPpBi4/QUfZFH1I+BT1z9yPzzEXhhHShHqTCtc7SVEZFum3DYTnA4SYtkFY78XXjlI+xeazZu
 s4vICP7RrZGtrckeKVus2Elx/nKwjhA9kp4iKxM9NoH0XF6+HAawR6s4XRU0LWS92PWRtKHX/aj
 btAw8BDEbxBlwH6AExcVASc4+UMZf8RM/N/lEwbUAdSjocCCUewLFUsKkM29BgIhxA2X6bYlGXa
 kzdtP8Vi5sAUkdys8q+CDcN2BbnEKBeMIllvWPkSJRwlvlADm/HtzpHdBvjumX4YWtZmbBUAMgn
 kePeiagmaXIKD6pO/mj+A7UabkMUPt3CA9eDK7YC1YPt+rRCwdaFZNoWYcxaofo7LkDX6RUt3DX
 an1s4DS4ZAZMg+2e6bmWbE16dX+93LM+qF4C9XE/23x/Fezl0eSXfr/bJb3m5V97oC6eY7LfVcM
 kC0xAo4xSj2vb6Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Introduce support for sound card and wire two CS35L36 audio codecs for
top and bottom speakers.

Inspired by commit from Joel Selvaraj.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 132 ++++++++++++++++++++-
 1 file changed, 130 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 9e952f9862f24..cf87b582e3997 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -2,16 +2,18 @@
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
@@ -404,19 +406,61 @@ nfc@28 {
 		firmware-gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&nfc_int_default &nfc_enable_default>;
 		pinctrl-names = "default";
 	};
 };
 
 &i2c12 {
-	/* Bottom spkr (right) CS35L36 @ 40 */
+	status = "okay";
+
+	cs35l36_bottom: audio-codec@40 {
+		compatible = "cirrus,cs35l36";
+		reg = <0x40>;
+		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right"; /* Bottom */
+		VA-supply = <&vreg_s4a_1p8>;
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&cs35l36_bottom_default_state>;
+		pinctrl-names = "default";
+
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-ctl-select = <1>;
+		cirrus,boost-ctl-millivolt = <10000>;
+		cirrus,boost-peak-milliamp = <3700>;
+		cirrus,temp-warn-threshold = <1>;
+		cirrus,multi-amp-mode;
+		cirrus,irq-drive-select = <0>;
+		cirrus,irq-gpio-select = <0>;
+	};
 
-	/* Top spkr (left) CS35L36 @ 41 */
+	cs35l36_top: audio-codec@41 {
+		compatible = "cirrus,cs35l36";
+		reg = <0x41>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left"; /* Top */
+		VA-supply = <&vreg_s4a_1p8>;
+		interrupts-extended = <&tlmm 40 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&cs35l36_top_default_state>;
+		pinctrl-names = "default";
+
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-ctl-select = <0x01>;
+		cirrus,boost-ctl-millivolt = <10000>;
+		cirrus,boost-peak-milliamp = <3700>;
+		cirrus,temp-warn-threshold = <1>;
+		cirrus,multi-amp-mode;
+		cirrus,irq-drive-select = <0>;
+		cirrus,irq-gpio-select = <0>;
+	};
 };
 
 &ipa {
 	firmware-name = "qcom/sdm845/Google/blueline/ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";
 };
@@ -449,16 +493,35 @@ &pm8998_resin {
 };
 
 &pmi8998_charger {
 	monitored-battery = <&battery>;
 
 	status = "okay";
 };
 
+&q6afedai {
+	dai@72 {
+		reg = <QUATERNARY_TDM_RX_0>;
+
+		qcom,tdm-sync-mode = <0>;
+		qcom,tdm-sync-src = <1>;
+		qcom,tdm-data-out = <0>;
+		qcom,tdm-invert-sync = <0>;
+		qcom,tdm-data-delay = <1>;
+		qcom,tdm-data-align = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
 };
 
@@ -467,16 +530,49 @@ &qup_uart9_rx {
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
 };
 
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "blueline";
+	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
+		    <&quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+
+	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	cs35l36-dai-link {
+		link-name = "Speaker Playback";
+
+		codec {
+			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
 	nfc_int_default: nfc-int-default-state {
 		pins = "gpio63";
 		function = "gpio";
 		drive-strength = <2>;
@@ -505,16 +601,48 @@ touchscreen_pins: ts-pins-gpio-state {
 	};
 
 	touchscreen_i2c_pins: qup-i2c2-gpio-state {
 		pins = "gpio27", "gpio28";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cs35l36_bottom_default_state: cs35l36-bottom-default-state {
+		reset-pins {
+			pins = "gpio112";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		irq-pins {
+			pins = "gpio115";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	cs35l36_top_default_state: cs35l36-top-default-state {
+		irq-pins {
+			pins = "gpio40";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio75";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &uart6 {
 	pinctrl-0 = <&qup_uart6_4pin>;
 
 	status = "okay";
 
 	bluetooth {

-- 
2.55.0


