Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD423C8AE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425539; cv=none; b=bYtFIEy0SWF9I/+x2kZSIt6GlEc0wKp4V8S1H175MMZ7V/Vza3dBIM81G2g8LgvyeaYrUTOa/HcSQffYu9PDncpICxVT/KblL9VWPLoKvIOJ4/SOB13YdqBPL2HHDvqXTfGMpNZHCGPj+C04J9xWJWBm2synNX2Pj6k9F0GQb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425539; c=relaxed/simple;
	bh=+MxQJxfxyXhn2hlgfXKOF0r0b76GvWH1hzAhmky7Su0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HWQktY8QASHx8o/cWP8plkaggoQfDSvp8621Y76ZwmuCsFDIFsS+5QLc8fn4tlCIZVVavvBJ2lfL4bLIkZ12r2iQ/Svif39MB04dnju2hQS7moj8WvpN7RpzajvfJ2gdXqZ0l84aqRzcbPKd69xUhJljpPKfBFkrhAu5P6tcjJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=obIhTuA+; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="obIhTuA+"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530e28a62abso26424381cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790425536; x=1791030336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+TVRBcBiysASXeDoTATHtlh2YPl6QD63Z7oJTtZse0=;
        b=obIhTuA+jQeOg9izWUIJPJxrccKgQZMI0pjvD7UfJJirtoAuXMDkmrVWQH/r6NWzrn
         H9F1eud6IGa/CV+jJGNACz7CQKAvNqXiSJeKmIRye8bCQTHzCdt1uP9aDKLiseapNrpX
         e3WUSzXYrrJlcHsDngnHUu+/HYagKqTfqDC+HgJKvSJos3C87Dncsx1ctrecJYRBvLOI
         HWtK148xuKPCNLg4Cvh77ecr5kLhWyWlquB6byKTZeLYgHh5JTQI0DfPUK2bHx/CvUQ2
         8ZM8PFRX2Irjl2J/32M8Zs3dJ1UX6Zspn2YOUJaarZemgYPAZGgwWL77MQmXzbkue+jc
         tJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790425536; x=1791030336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+TVRBcBiysASXeDoTATHtlh2YPl6QD63Z7oJTtZse0=;
        b=tgoeBLbpNyH3iypm4ekS6oESvxv3QsLqMVWJQ888G6sLt5il7fwhssTCAso8jehaHa
         +to1WtxBRoH0QwJEdC8/UllHleSI8d94ftr2xbtDJefGX8FP9cG5fXHgSHxvgqvE0eg8
         r7TmyWoRBeBRFXX6cd02NuZDvtB5mbk9QuuGAKVLCp6eokVMzydXCKE/rfNfxSfCpuEo
         Y6y6fCjEUsBngWBp8EfLCyBk9jsQyTaFzEAcziNPRPnR3dtDO8S1aS4XAJ/6ehpPKa0Z
         cr7tYa4ixL1qFfb+IO4fIR4nHUiui9KLNeHnQqisZR8bgFbnkrc7Sjs/hcQ4U9xK3yKE
         VNug==
X-Forwarded-Encrypted: i=1; AKwUvByr4NbF7TurQV84RcIRxm2vqii/QWsPEC1NW0F08TV5Gr9vTPJihLDsjEacKfFDXm5K3E0oYT1PcNwmWHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kCXBtci9VEtanqdsVxw3YYNcVC866ym2yjB0vDCdcyVD52TfOQ
	FhG2iMre2B+9/8/xpqPsjhJ9IKU0Tl7Phr8iBd1IKJchfT6eulkbGIfkat+fNZMjpQ8=
X-Gm-Gg: AYBFou02Ulbk9nAjj8HXWQK3D7HZ5g4ikxTmHtlMcRQcwBpjmxPnPLBQb+Dx3iHmjwR
	8ZESlPTcgcy7HYTjVjAicY3uJRsmrP6+aTila9jcxId7dsPJh9S3GRyOZwlviBmOllAyGY6csPk
	Eww5kMS8tflQF4BrHF9dOL7i9sXwzX2N7ZJy6IfF8yeKU1QZBdrGnKKUPLj0uTsuisYSUz8YXJ/
	i3UeSEXzyMBVzXklMkVGzeAiWy6gri3tGN2QC+JgdcsoyKpMyNdZbkEgNuniGDWxbukPIuQOgGN
	nrQXYfKU8QUDxGGCaWaknlSGftLklarrU3DRUG9TdoYqikyym+ridqSwjuxhU3OtwyQe5Pv3+DT
	k70C8MAzV8QEbi6ThCspNBPaMf4gEZwNGOylAqVVyl48oRfFVHyHVSaFrIe1luPBh82GZgoOOlB
	Av7UxqoHLGy2ttxtagR4GE4fEIBYIp7DJnLTo7uPkKO02EpvT6ODir1gxfbg==
X-Received: by 2002:a05:620a:6602:b0:939:f89:3688 with SMTP id af79cd13be357-93c47498f78mr873998785a.42.1790425535907;
        Sat, 26 Sep 2026 05:25:35 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430ecf80csm38377966d6.49.2026.09.26.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:25:35 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sat, 26 Sep 2026 08:25:33 -0400
Message-ID: <20260926122533.8200-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
link frequency the ov02c10 driver offers.

The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
switches a single rail, GPIO 91, before releasing reset on GPIO 237;
GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
rail enables. No camera resource file votes a PMIC rail for the
sensor, so avdd and dvdd are left out and fall to dummy regulators.
The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
and tested streaming.

The module sits upside down in the lid: with both sensor flips on, the
picture is upright and unmirrored, so rotation is 180.

The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
so the V4L2 core lights it while the sensor streams and takes it away
from sysfs; the comment waiting for a "camera on" trigger goes, and
panic-indicator stays, as on the X13s.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
---
v3: add the Signed-off-by missing from v2; no other change.

v2:
- Drop the dependency paragraph from the commit message (Abel).
- Say in the message that panic-indicator stays, as on the X13s.
No change to the DT.

v2: https://lore.kernel.org/all/20260926122032.4847-1-lnicoara@thinkoid.org/
v1: https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.org/

Depends on the x1e80100 camera DT series, v7:
https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org/
and on the CAMSS PHY API series, v20 patches 5/6 and 6/6, which read the
CAMSS endpoint's data-lanes as 1-based:
https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

Built and checked (dtbs_check, W=1) on next-20260925 with the DT series
applied. Run-tested on 7.2.6 with the same board hunks, the CSI2 PHY
driver v18, the PHY API series v20 and patches 1-4 of the DT series:
the sensor streams at 30 fps through libcamera's software ISP, and the
privacy LED lights while it streams and goes out after.

Bryan, happy for you to fold this into your next version of the DT
series if that is easier.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 120 +++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ad62350ba670..73f06fdcd138 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -10,6 +10,8 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -46,14 +48,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_indicator_en>;
 
-		led-camera-indicator {
+		privacy_led: led-camera-indicator {
 			label = "white:camera-indicator";
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_WHITE>;
 			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "none";
 			default-state = "off";
-			/* Reuse as a panic indicator until we get a "camera on" trigger */
 			panic-indicator;
 		};
 	};
@@ -151,6 +152,25 @@ linux,cma {
 		};
 	};
 
+	/*
+	 * The one rail Windows switches for the front camera
+	 * (CAMF_RES_QRD.bin: TLMM 91 high before reset release), the 1.8 V
+	 * LDO enable on the sibling thena boards.
+	 */
+	vreg_cam_1p8: regulator-cam-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_CAM_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_ldo_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -674,6 +694,78 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2>;
+		remote-endpoint = <&csiphy4_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		/* upside down in the lid; both sensor flips give an upright, unmirrored image */
+		rotation = <180>;
+
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		/*
+		 * Windows switches no rail for avdd or dvdd, only GPIO 91; they
+		 * are left to dummy regulators rather than invented.
+		 */
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
+&csiphy4_in_port {
+	csiphy4_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2>;
+		remote-endpoint = <&ov02c10_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1102,6 +1194,30 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	cam_ldo_en: cam-ldo-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_rgb_default: cam-rgb-default-state {
+		/* 2 mA streams; the sibling X1E boards use 16 */
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio74";
 		function = "gpio";

base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: a12186bafac9b287c19fd719aeceb8ff1372dfbf
prerequisite-patch-id: 4bc923fa59ee4c1ff68e64497f11e937c0ab3918
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 8cde6fd860c857dd7f3efce25970c88c783193b3
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: edb32e32f2b6be0b93f66d8da460c9f9de0c52e2
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 348caa9cd0d1d70f181a47b40e2d75e8b25b5938
prerequisite-patch-id: 1c4e4c457d8f95d8f5aaa2d93976c374b8282bf0
prerequisite-patch-id: deedbed2643ca8a0f26bd87175d787d2f0c87417
-- 
2.55.0

