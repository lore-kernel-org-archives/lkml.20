Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67149213E9C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135970; cv=none; b=Y3gFeNAJoy/YQz1H5WrIDsU/4n6cxZE1G5XWrL2q3pEzJTYq0jF3p9rVaVpiKCN7IHFJw0exGbaRxTEnr0UbBuC918QmOmj42/j6W8VYkHD0LRUTUhs7ADprgjjAioxKFFaLffYxLd1tVxGqPkZ7BR3aiOMc4UVdq6OSAIKurxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135970; c=relaxed/simple;
	bh=h4iQMDwculI35BN+CaCK0/O9tu5VYhaUA1qiA1U2urM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvgeBqRmgwqFItqr1kP3t9GOOAiimIXLLsXLVengkvA7JtMhC1u2DcpuHikGGq3YEEZPfVDT/p3kULQb7+jDtp5hcAOeCtMwwvAfoGUnYbkykNFxh2QH+VJ/87SFvp3KshM0Va0CXb88BAYB+q9ANaJ14IDfazbpZdUR7vj/pTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=R6TDZH4u; arc=none smtp.client-ip=91.218.175.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="R6TDZH4u"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h4iQMDwculI35BN+CaCK0/O9tu5VYhaUA1qiA1U2urM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135964; v=1; x=1792740764;
 b=R6TDZH4ufGC7yzzou84+p5kCxMO2nPvFjhPSm+HcYRnua+1vv7GsfWpqoy/nR9/dkb8UXvz4
 zmH8asAy08i9x2HXQI1zJmXe6oiaEbSRfV1ki8R4XxiOn7U0H55UyMNFELtaiieEebe9cUyeDTb
 2GuidxlumJL9qGToz5WdBc5cgcwAvoFBzyo3lLSh4Kutwfze7q64nWsFIoWtY/Nr1ZpMu46mG5O
 urxvYPyE8OJklvMEehA2d3jK8Tl2Qp+EGty7kpYUDycFYQrXLTXQrstofDC5BNdjZltBL+S/ZGk
 g360KnFTY30/WWoJvMBP2pUnp298JRI5DHbm6rm/8m4Uw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 26581679077c411a;
	Fri, 16 Oct 2026 07:32:44 +0000
X-Mizu-Trace-ID: 26581679077c411a
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Mark Brown <broonie@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers
Date: Fri, 16 Oct 2026 04:31:53 -0300
Message-ID: <20261016073157.611956-6-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the sndcard node with three MultiMedia frontends, a USB offload
RX link, and two Awinic AW88261 speaker amps on senary MI2S.

While here, use the correct compatible for audiocc for this phone,
and remove references to power-domains from a 'reserved' node.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../qcom/sm7325-motorola-dubai-common.dtsi    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..1e1c195de1af 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -16,6 +16,8 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sm7325.dtsi"
 #include "pm7325.dtsi"
@@ -699,6 +701,40 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm7325/motorola/dubai/a660_zap.mbn";
 };
 
+&i2c1 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	/* Bottom speaker */
+	aw88261_r: audio-codec@34 {
+		compatible = "awinic,aw88261";
+		reg = <0x34>;
+
+		dvdd-supply = <&vreg_l18b_1p8>;
+		sound-name-prefix = "Amplifier R";
+		firmware-name = "qcom/sm7325/motorola/dubai/aw88261_acf.bin";
+
+		awinic,audio-channel = <0>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Top speaker / ear speaker */
+	aw88261_l: audio-codec@35 {
+		compatible = "awinic,aw88261";
+		reg = <0x35>;
+
+		dvdd-supply = <&vreg_l18b_1p8>;
+		sound-name-prefix = "Amplifier L";
+		firmware-name = "qcom/sm7325/motorola/dubai/aw88261_acf.bin";
+
+		awinic,audio-channel = <1>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &i2c4 {
 	clock-frequency = <100000>;
 
@@ -732,6 +768,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &pm7250b_adc {
 	channel@4e {
 		reg = <ADC5_AMUX_THM2_100K_PU>;
@@ -972,10 +1013,22 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@147 {
+		reg = <SENARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qfprom {
 	vcc-supply = <&vdd_qfprom>;
 };
 
+&qup_i2c1_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-pull-down;
@@ -1066,6 +1119,72 @@ &rmtfs_mem {
 		    <QCOM_SCM_VMID_NAV>;
 };
 
+&sound {
+	compatible = "motorola,dubai-sndcard";
+	model = "Motorola-dubai";
+
+	pinctrl-0 = <&lpass_i2s2_active>;
+	pinctrl-1 = <&lpass_i2s2_sleep>;
+	pinctrl-names = "default",
+			"sleep";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	i2s-dai-link {
+		link-name = "Senary MI2S Playback";
+
+		codec {
+			sound-dai = <&aw88261_l>, <&aw88261_r>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SENARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &spi13 {
 	status = "okay";
 
-- 
2.55.0

