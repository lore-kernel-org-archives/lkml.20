Received: from mail-qv2-f32.google.com (mail-qv2-f32.google.com [74.125.230.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD773E49E9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425243; cv=none; b=UHc2LXlreuYvaF7ja6FNUVz/Rodn0vn/nu+8ZG9vwLLIwlouOGSyTNg0tmTEoQwRCOiiCDeKv0NxtFdBCitabflj9huhWQImWFOmvIWICuE0Aw5SgdGFODPZu8DCF0z/yg4tPpTvngTFZAFbsTpp5YUqh0fi3q+9SOVqahy44j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425243; c=relaxed/simple;
	bh=IBYztrV0tY4V7QEYijOF7gx0QmCZePFsfBjD6WlXg/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9FAzpzviHOKcmPP5E9vq1ajprtMz4BYjbtHivMhkaFbMraoQ4fJSJ5GSdKk7s5yYP65QVgSmXS5nBiTBVG/wecycFXHG3I/nkO/NhS0Hr6DOe4hTHFrLgqn7n3WEL5d8THHFFFzsLu4ldqvOGwQOlM6FNqVMcdGxAVyt3jw4LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=YxLW2jZd; arc=none smtp.client-ip=74.125.230.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="YxLW2jZd"
Received: by mail-qv2-f32.google.com with SMTP id 6a1803df08f44-90ce6d5271dso9555846d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790425239; x=1791030039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAsdC2YpnuT6zTnGshJ75DxjPfJCKBC7fNG6VgdNlYM=;
        b=YxLW2jZd0QcRtq+NAEgkfqvU6gfloRx9Vb4pJiDSqeYsJYLQ9Wbtzi2TGqRnyjTUwc
         W/uZxtx2/jKr46dGET8qLFjl75+Tpf1JSZNssnXXCde8/mMp6SeTBTYPYE431BLPDbpZ
         tZHcBakSxvVhxnWCck2rdgSB3xdWct2jPkuTqaORPffWyuMnkb75n3EGXC52Mi+t3Cbj
         fIuqoLwiEjO3VqV+k38dNCtSlPZi4/bXzp3Lf+UaIiOssBYrT/FKD3O6oaLGnZdqv/Zg
         zVmlyH8snuky1XP+7qHWqXkONDDvhq/FBXyRMTURMVtsIWJ02cYsZrKDmhiiltCpu8j4
         U5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790425239; x=1791030039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAsdC2YpnuT6zTnGshJ75DxjPfJCKBC7fNG6VgdNlYM=;
        b=sPba8nyOKQzZMkH87QiAVGeh+MIdM7Yx8blK7e9/kdqotmps+Zt6TuAcWNWYekeUee
         5XIdB2jrkpKcHrb3DSQy62oAOpHo1fITAAM8wCv6g+1Dci0jxYvzX1ThvEx/6D0H4LxI
         3su9tWJD/RzMUo0rJBYDKDg5t2AOlIOWWA0DPVMA6NcChAOyirDV5cEN61YAIpKSuacC
         vBAGeqh4826uqcbMg4mdQsS/y3en6yZ1oMsFNT3+QlXmuEw1sa/4H7fa+zLCQiSnVygE
         txHxlZ+wOjxZ264f4HguhI6zKw4a4WfJHFOWQqgrnm9OfTUspKN2uJkMfwpV9Snm1Rt1
         gzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJEkRxc0GMWox/KKuDD8IYyAhf1f13bE10aJzuKvcExgGmci9mv5kXYctw8teprpBG1blyv0Frv0hGPhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa5NfoL4co1++nn6n5xM9wyz/Vyp/jFM6Aq1J3vSinKsSmTWcq
	cm4TAGcRMN5GS+FqgHLDs+aemwvZhhr6tYNILLxLj72DOM4VK4XTVT/0KOvWWB5nPBA=
X-Gm-Gg: AYBFou3BNr8t1UPM206jmvv/pBh2vWJicPam8ys/fpoTy1Oy+tc8/qluBaQLk+c2J/V
	xinOr2BzakBqoPeQPnkeJnG/Tt9R2j/gptqQEDacLXbZio22CiqhYcB/5uYYle+2WV4zS+4ITa9
	xvdpIQMJTG/U/Q+C4FQZmgO+ELQS7dO2CPabYAM7QBFlTxol9vfSBgHJEQd40WVM3CQ4R6lrZfV
	zoBWhOtrihK+sCaIF+KCKaaxLXMgc4ZHSgalXtj3k/+mhxpI3dFwDzUsTTeMiGdRjwq6Yhs5K3k
	tv3rfxaU4yDXYSPDVxJBj8BcRVbqQypS3N2J3tQU5NMGMpmIFGcvSrBtBQS/SpJA9O5xBU5/b2z
	97V1HgsFrwC1AxOGcfHPfcHoquTehw66gF+V42EdrwmNSLjQe990aQIdRmopXY3ukxG6U6EaP3g
	UISsVTRRskKEwa5nMQ8eCNMxug9r3jG5CH55caACmlP3o4dqc=
X-Received: by 2002:a05:6214:319b:b0:914:4fc3:e85d with SMTP id 6a1803df08f44-9144fc3f607mr11238846d6.4.1790425238783;
        Sat, 26 Sep 2026 05:20:38 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a27dcsm39308096d6.3.2026.09.26.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:20:38 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sat, 26 Sep 2026 08:20:32 -0400
Message-ID: <20260926122032.4847-1-lnicoara@thinkoid.org>
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
---
v2:
- Drop the dependency paragraph from the commit message (Abel).
- Say in the message that panic-indicator stays, as on the X13s.
No change to the DT.

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

