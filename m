Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418885;
	b=oFELRqj7BCTZ5CfbywHPPkaY6OraCkU2AedchYoHk93ny0t9wwfYQ0XpviCe1AHFz7iQ
	 OT+VT9wZWumChAi0NXvR9zEKP7p9boFZlAgbkqNf7pbjSbEw8HOT0rpi3lfv4U9RYKdYW
	 mYtZkrIqBf3Y5lr8mU+k1SM3fQjcg10DeUs+SF75bQ0tOSTM1qXC0s4Zw5r7SfaRnKotn
	 INQEIKkU+aAZfQsyuUPSGFiiZLxIDaPQXZbdK/sMsEltn/qteE1JkMmzB1mbgo+JyaQsB
	 QdaL5ws+fEBYYwkqmBhDEcb19qMDfFfj/hP88MlWd39WCY6fyHUjBL6LLD9b7OAFZIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418885;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UzhG6eWlPwxpX167+QaDtZKGhL6hJQsFTV1UXHY4BGM=;
	b=JjggefIMfNC/IF0wZHAiyKUCppE2IYGxxBF5yYVa97Q5o0x29a/APbB5WvwABFgl0Ofc
	 QyDHMTXDN+i5aoO6NFz3RyIq+fRIqbJu4kPIbCRvEyZj9CR8JmSscymhhheSzouhOqHLa
	 nyf8js+VaU9rAw1ckIEUNLXnpa89hEOejeQ3WTVLMRnlDUcYT30PCTyPcCQOp/L+Nep8s
	 G/SMfYpesX6uBQGqUYCY4VL4/bhAdzG/LWqbkGn+mxFTsFPmHkfGGTITrwlaVeyB/JOcy
	 fq+t74L0r3NwHQt8xEUA8pZM/308v5uFbSx2YsmnEoQTSPiGnivdeTKCkJsG3L5vL6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHybwEoC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A4606A884;
	Wed, 11 Nov 2026 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHybwEoC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794418884;
	b=J/0S5Na75+IanZc9l6CQ/Yt9a8r646NV6x9GjwcroRpMOpxbZLD+gFJ25fYlXxpoackr
	 3Xvq/oQzhjqGYPVyAXf2cVjuEnTsjVIYjCwxlFHJJpDM1YanURErSfgAdbZLEa9Lf8IVl
	 8am/Fhm5l6TNKEVq8oGNayKRC0nNVUy2M242r6ItgEhbXgbogk5tRQCTdtvhNcrdU48zo
	 Cjt6KyuS3CqbxcycmTlqW3zg+NoU7A+re8i4+8Lj0tb0/C4ilBR8jzt4SfKpHtt0Ke1Ta
	 lh3Z0tuC79mx1qY2U6ARBA8egV6Huy0V2GAWja8WRTQPwezQWkzmSPWTfcHN7JX5rCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794418884;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UzhG6eWlPwxpX167+QaDtZKGhL6hJQsFTV1UXHY4BGM=;
	b=Q6ouK/xDQVBpUXQ6pTfAXEgSYoXaxjxWyf9AqVcsM9jaD5VHX5zoplYNk9XZ9LOJA6nu
	 Lj/D4Fx9GiGo47G7n0UIaiP1ltSXWp4Hj9qaz0AyhZmlf0WNcsREUtbGDhvaD1uG5PDKe
	 f20j9qWBMCb5lmgEwoUJjhMGIM6dBOISzVI+2P6fbcZtORdcoZhgMcMmYLdM3MjfXIEcm
	 b3AyyPFMrU2GaMJA5PerqkWMWQsUYuJtuOIRrkIjnMiNYQH9TrcL96MB2KxM+r79BCFss
	 l1jhEgJi5JpQLhxikxbc5LV4f28R/LyZJBbG8O5QhdyTQAtmof+yF8AliBh0AsYeUTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 760191F00A0C;
	Wed, 11 Nov 2026 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418884;
	bh=UzhG6eWlPwxpX167+QaDtZKGhL6hJQsFTV1UXHY4BGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RHybwEoC/oyv/zDLKEY3YMs2R7GQYh8LQWK//yrkJ2M7sObYWQ+F+yP1Av6JNwElP
	 KI+ggHBEZTKu7AXxmNWWDTk3EVSQKJWuVycZDsnqQHeTb2O4tQcvPl5VO47f9Z63fR
	 qOe4TMn6T+0K6dPFWbJ7vyY33dcYZc83WbTenOox05Z5UlP4U3bpNqpt5vqAj+mSq4
	 dXn98Z8j6aYcsV367uNBpZAiv8NiD0UvjEOtNNSVX85GahvAt8hVMG4Vi8iNrWfQX6
	 iyRGYoCMA4jrJBFqutWxJLrKmM3rGfk9VrViPj6EsJ2otK6j6lzurVAOFP7xfQWhpN
	 foliYneElR24w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EECEB49065;
	Wed, 11 Nov 2026 17:41:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 11 Nov 2026 18:41:21 +0100
Subject: [PATCH v7 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
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
Message-Id: <20261111-pixel3-audio-v7-2-ecf28efc5c33@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4077; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=uuakIZu6Wy/NrugWd1DLRLYP2J4loRYGwzYovA75Huc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq9KjBE6O2BocYEO+M7shiFBskLapAfjCKS9MYF
 QuxhcjixPyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavSowQAKCRBgAj/E00kg
 cnN3EADA25mhVpQJMStudgdTqNBMfDMGsD47VSdLZmJkOnZNpKJ9WHRWPVsgpHNExpZNyi7PMoG
 VE2vcIDgfN51It3Dn3roS81kyOsu3V/L/GFHJ03jwfQ6UbTU3nw53TQh5V1LTH5F6gHx02Dp0sA
 u4GcZwaeNSA9+EL1oopde46oatPuIDV/7xP0TVhiMmKptt/Hjb6aaPtPN4PQ4OfumQhOPr/34cJ
 YmLcw0HxcKmU7z1uJWWkCTES78/ofNuRZHROxQrI/HcesNRv8bCam9s2hRSZOpUHkLJkwbQUBsX
 /lfkzMtnrXaIOqwDXYS/E5+WVq812O983RkGynOvXaj7nxvmf2wabiWOFA0tfW24943TkBvNyr4
 /WgOSqitN1S13Vyd98dXmXXBH55RlmIBbcpiekuAeLMFTwzO6ms6oVFAHRe/SgyQ0Jwx6p05HZe
 cQsR4nKHkBNTVYOiu6VI0woFElfImpQ1enr1a2+PNsfxBoe3JkjlB/OQHzxtQMLm+D4tb92VcLt
 cOUKhd9gkCiO/da4/0G4HjTAQnBwEobxX12Xik66D12VOGaoGojytcxZ3IY4hGTZr1XgFJXZf7P
 qRf1X6Mv9BZIUrg6C5S1GykYwD6+4P8wVyfSCPMAkcs6waAdJEB0wXeoMg8IlZQadp6wAmeGabi
 MzQPUeewHYDl5wg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The Pixel 3 sound card so far only drove the two CS35L36 speaker
amplifiers. Wire in the WCD9340 codec, add a SLIMbus capture link
for it and route the three digital microphones

Based on work done by Casey Tunturi.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index fa327ff156b86..7020bbddbcff2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -4,18 +4,20 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd934x.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &mba_region;
 /delete-node/ &slpi_mem;
@@ -512,16 +514,20 @@ dai@72 {
 		qcom,tdm-data-align = <0>;
 	};
 };
 
 &q6asmdai {
 	dai@0 {
 		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
 };
 
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
@@ -544,40 +550,79 @@ &qup_uart9_tx {
 
 &sound {
 	compatible = "qcom,sdm845-sndcard";
 	model = "Pixel 3";
 	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
 		    <&quat_mi2s_sd1_active>;
 	pinctrl-names = "default";
 
+	audio-routing = "DMIC0", "MCLK", /* Top mic */
+			"DMIC0", "MIC BIAS1",
+			"DMIC3", "MCLK", /* Top-edge mic */
+			"DMIC3", "MIC BIAS3",
+			"DMIC4", "MCLK", /* Bottom mic */
+			"DMIC4", "MIC BIAS4";
+
 	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
 		cpu {
 			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
 		};
 	};
 
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
 	cs35l36-dai-link {
 		link-name = "Speaker Playback";
 
 		codec {
 			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
 		};
 
 		cpu {
 			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
 		};
 
 		platform {
 			sound-dai = <&q6routing>;
 		};
 	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
+&swm {
+	/*
+	 * Nothing hangs off the codec's SoundWire bus on this board: the
+	 * speakers are CS35L36 amplifiers on QUAT_TDM.
+	 */
+	status = "disabled";
 };
 
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
 	panel_default: panel-default-state {
 		reset-pins {
@@ -732,16 +777,27 @@ &usb_1_qmpphy {
 };
 
 &venus {
 	firmware-name = "qcom/sdm845/Google/blueline/venus.mbn";
 
 	status = "okay";
 };
 
+&wcd9340 {
+	/* PM8998 LN_BB_CLK2 feeds the Pixel Visual Core on this board */
+	clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
 	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
 	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 

-- 
2.55.0


