Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418885;
	b=iPdomhWTyLIdnQBZOj2pRYHf7qKNxId+PhzE0nFhU4oyD2RlJH/OhQWHtVDa1vD1nn8p
	 MB83IrYyD5Dpb7s149kjTh4ek948u+XYGtoyq/YqIVfb0o3yajDfz4OvNts8mM4V/xAVb
	 RqFsOt7Ge2bGzOPerwuJERwh19lHXZDgoP/0dBjeA/envMjU4Y+jJ7ozQ1dAKm/G/TkkD
	 r6QhjlPWK0pd4GK+3VMvkLAJ3hTZdoirT36vO86CnaProKfM4YGghyI07Bd11psV6A2HR
	 fCboSMVX7pS66KmCnUk04ZgubFzYh556oSWI7WKHuPtyxf7hioA3KZqiOZRJ1vUn58g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418885;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dQ87uRIk1/rKJPSQMlWIws72ZtxUVkBH9zQufej+U6w=;
	b=UcSBqVRUuv3KFOLvDXa+Vjn3W19BaK29C/4l7G3JubU0hXNGLr2JCza/xvMUCOFwSPbR
	 a5sHAyppaKN0gstNTe4Tr44hIRWiTlJ3xM44Ej8nvD5tHMzO09ZpuZAmHk0bYSfXWIsRv
	 G9r8nL2T8b6RJlCha82F+U8whIx8oPc9N+0h//jg9qT7OSoRYc9EF3gZf4exDoPqRgAT9
	 rofo5mVC9mk3vB8rJXsd64uvyjoCRnwW7ih69ZlL6HtN8Nl/ZcUawc9Uc69QeV7WPKNTI
	 5QmwmRzOXRjiEtFwr/NXig0zyZzB/EMvUdC/ub4mdnEa/0yikyQTySds6HBIRzMbhsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQT8fiwt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A0606A887;
	Wed, 11 Nov 2026 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQT8fiwt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794418885;
	b=WYiRCYFpqBsgb+8LnD86ymqddOykw0gRV/LTgvnEJz+H7W/WaEutAI4+wbAyFpI5C5CC
	 oU4lEUg08i92yKrNR9WaISQmUyq08bFYQVSH5k7ZPZi9k1jtKoEiiJoe1Wr+YEdQPId58
	 yaY2gINKWtZ5ngiUsmnzhBCMXId0VAE58+++k48kXwL93L2V8CL9fRN6NlqOTLmSyRFld
	 bQohR1v4EEt5CtLwyD+yl4xmG8RQbSBpGhPxOv9zwlxEs1Jg0Q8jITpK4U1BCKnVTGUcT
	 hOrHfSOuoKp6B74fq+BsZC3V+vZXbtg4RT+HSC/72ATFeEmhHNfx/bSlHBBcw4k6TBg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794418885;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dQ87uRIk1/rKJPSQMlWIws72ZtxUVkBH9zQufej+U6w=;
	b=qc1ro2Y9WUoizfUs4UmfV5O46hGpC7xKYk0TjqDirIgZM1QLEFb0NWuDN4n6YqJ/0lDk
	 jZH5OW4h5Q+1z+boFYLX6V+PIsfiY/z4X5zNMBhd4Bf08gPnfUX/JI1TM7ghxhJEqN7jZ
	 5CT0/3ScjJvYQ2d1h3a4Z/Yi1T518ya+l1hUB669guyz9LPXyv6E6WQ/sKbrgWDvZsl3k
	 vn2uehOy1uxxwSy64aRMJhsBKLKfTqp4332oGisdYZhN1HRM4VlgorLRgyYX2xl0Bsz5D
	 2qAk3J7rNINwgRnD2iqVdhPF80j/QBjzVnaDtrEFA1XY9YI3qHAqbYAF89GIsTz3YLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F9801F00A0A;
	Wed, 11 Nov 2026 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418885;
	bh=dQ87uRIk1/rKJPSQMlWIws72ZtxUVkBH9zQufej+U6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nQT8fiwtsTGBiH1pDobJ8O8GXRxD7bTD7incznFpWScq6kpa4FCEldwWKqF05CIR4
	 v3FnY5f4gbgojgNrTq70H28EQXeMAEAHmaTCOCKVyrEn+kL/cvwGvJ7fPBuHGYzjtS
	 LltQdrWqJxBQEWKvJHjFmrgSaf87FaD9HqpJqPb1ZrP77C5G45AKJDuNVjD2dkk5iQ
	 I3dL0VPZD65H2ll+1HArIjdIPkZ62GmyUxkCyRuzmuHWA+Wh493V2jgmx/T/QAz7WZ
	 WuWZfwkYdDUd42Y4YWIIczqZyoUnr3IHJLh7E/KZ/uCUIfG24+Y5gsK3FIdx6HY9A2
	 1H9sRA0ZDp1FQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C532B4905D;
	Wed, 11 Nov 2026 17:41:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 11 Nov 2026 18:41:20 +0100
Subject: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
In-Reply-To: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5486; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8yJsQhHjtcmcBZe8XGO9gMKEXECDvVEp3rYDy21u1PE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq9KjB6+zLSXn/3gI7/glgPF7Yk31FizyR9z5Mw
 0gC93SF3FyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavSowQAKCRBgAj/E00kg
 cgdxD/4guzJZjqsfByb71MP32uOd1eQHHzpsmiLzFzsnQmAv1qqCEdgEEbSsQS1no7+L+B1gx73
 EqQpt6hWjYJFZKdk3kMV+NbMwRbq1i1xJl5+9FWqyfikVk51ishcij2CiU5w1IZzhAz8ISi7QA5
 4UaJBT++1RQnIWzJXV+7a2RYuTeSCfzFOO88MhjFvwnVncHxBo3BtQot3GGtvUkqi+SU1QN8/Qd
 Zhf5z2XNXXF0ApIJrc7Rjgz8SxFwJXoY0wJ7DKqKor666O0ejDo37O8yrgZrVkbb5UxXrzwouD6
 srQSTMo56ZgMYIoNwWPmUCgMRd+gTwZR+n5K2gSLEakBpGjxicOnVrxhrjLYYpEqgqJSqhD1E8w
 JaFxyVvTO/zcS2hthS6W/BZWB4CdQks0qbOd3V1TKP2dlpe6PPjAUWF+LAn/cP0jvsItZURQxif
 nj473eVd0gNjT3UPedHlrEPgZiOsD0WBeykr8AF1jPgWzyWxx6oFJcHekbF580naeRmqiNncGAM
 oIoO5Uzn3ncZfCNXiBMMU7UGqyGMU5j/UCzh6ITYAEV8U1kB0D5/2ejrb6k6gGe7PqUMskO3H0g
 /ZlKjLF+/Fx65nR24iqcRUhXHK/Z7PIitMYYnj+sWwxg/vB8U+tEkaOPd6Pcv/YoaBVj5d/0LQk
 XmwwMZ6uQWcxJ/w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Introduce support for sound card and wire two CS35L36 audio codecs for
top and bottom speakers.

Inspired by commit from Joel Selvaraj.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 132 ++++++++++++++++++++-
 1 file changed, 130 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 3c9656b88b696..fa327ff156b86 100644
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
@@ -406,19 +408,61 @@ nfc@28 {
 		firmware-gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&nfc_default>;
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
+
+	cs35l36_top: audio-codec@41 {
+		compatible = "cirrus,cs35l36";
+		reg = <0x41>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left"; /* Top */
+		VA-supply = <&vreg_s4a_1p8>;
+		interrupts-extended = <&tlmm 40 IRQ_TYPE_LEVEL_LOW>;
 
-	/* Top spkr (left) CS35L36 @ 41 */
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
@@ -451,16 +495,35 @@ &pm8998_resin {
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
 
@@ -474,16 +537,49 @@ &qup_uart9_rx {
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
 };
 
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "Pixel 3";
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
 
 	panel_default: panel-default-state {
 		reset-pins {
 			pins = "gpio6";
 			function = "gpio";
@@ -531,16 +627,48 @@ touchscreen_reset: ts-reset-state {
 	};
 
 	touchscreen_pins: ts-pins-gpio-state {
 		pins = "gpio125";
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


