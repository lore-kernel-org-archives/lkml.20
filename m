Received: from mail-ed2-f18.google.com (mail-ed2-f18.google.com [74.125.228.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B478F529408
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651252; cv=none; b=H65d1NfL63mic76Y83uGKbmrHqPY9NBWwpJh+lc3y+1Knukzt1HfRPVh9OiojyNaue4kk7J43aDSv33FYZwYfq1iYsu8SOCHnvdeUnkhBsgoFI2uuVnXwO4fd5EhehclUupZTW8HxANdQWjIf/iYOxUKvxkVCyHwO0Q1USz2Rts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651252; c=relaxed/simple;
	bh=umKS2avGCEdkRQmhIBM8YFil2eP/51Z0Phzxs7xmWJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDRLEtb0Xdq0/2RcyxXGmoXUMxYMcQSMBW0Axcu0kQNV3YZntfm4AhWkHPYdFDF+AbjDn/TMOhYvgj2vb1n6QZOPOKFbgsnjgjNzxVEZQrm191NSHbTOH/3ugUDjiNqu4Bn11nsQS8hV0/U9yASLEtF1CsqdqSzxWgEuylozfso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhbyERWq; arc=none smtp.client-ip=74.125.228.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhbyERWq"
Received: by mail-ed2-f18.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so1164590a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651246; x=1790256046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ3Kd/Lwo1SRIsB/zhB/eEd6rVq/wRMfzLXcBlo/5ks=;
        b=LhbyERWqas5lcgRxeiqzN6G/yD0XdTzG8n9m6ihnrAANUyijcI+6pG6eHgxtKpGCdq
         BVH1n+41jAbIF6F0ZG8+irYWPQ2oSuQ5DF6l68/NOH4AmZKF8Uc/4JScbhkK7dYT247v
         p8BFpys+VvhtXOhcaJsMd/6zK6SvTPYqnwdU6SXbGEa06ZGuVF+XvPn5GYTSSbOuYZIA
         Nxgwt8GCAIQCqtbvo1EFNdOw7Bwc+7BhwIGw76pgv9vCX4SAAVr5SDrmm6e/htMRvXKI
         ouOfXacwlhXy0qRQJ8mfHFQof6MY5BFJbPRI/SX/Mkr+3XS8nI8aLSrptMVcMQZvIWwj
         K7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651246; x=1790256046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ3Kd/Lwo1SRIsB/zhB/eEd6rVq/wRMfzLXcBlo/5ks=;
        b=FXSaexfbt2Ct2ZlGQakvbuCEZDmbQxw0CYIwM8EVNgRisvFG4Ydg0yiDsRXgx11PWI
         XUWUmCbLCvwf69d5a7zfG3peJxTuOymUz2sOCpaylTyeEOkgvqj1spL2vsr/cuWIVbLf
         6ydOXMKcTiu9Y3br+yb+lFeOa77BH1SO45sMvVTWxS3LxVddN9NTlPktcDGjgAWiueLE
         1o2tJtSvJiaZDA8XK43PvZFGAJHisMA464YMeAgnCdCtTDoNkoyJVGvJqvJTYgWepXHq
         ubUFqHwEkXbntHVGlFq+yA0QOLz2FOFRYDQT3zqMgQnoYhmSgwEh5Xet2JvB+f1jJZ3M
         N8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBypGR/t1cJfxpFMtOrmCzod3YQFy/JOnyp1hkcggTsjm3oNRxyubgQRBXIBVH+cu7Er3eXKVq0d5RwYt0I=@vger.kernel.org
X-Gm-Message-State: AFuF++k/bognHbNQodGjQXXQxDjWF7jpwSo6M0TjdSg2xchFrGESmlZR
	2RcbTHePV+ZgW3exVsWPs2EUYXPjRbZsfSkP1PKqFRfEtg7kI7s88hQBSl+qe2ZXXu8=
X-Gm-Gg: AYBFou2c3jOsxvhyx18jkvQTDyUos4ngndTmlh9XxRPhyCwdZsUWDSw6RmLwT/mklIY
	dVVIstXBofngaQ3jkvXYtTePiL+hiec5Yi7atE4wvF5S4izIexk0zP+8jLTYldIMoyB3CZ/pl4t
	ry2D8c1O+SwARzmXAWGBVB6bxV8GSowVWS3PCBOhjkEhMeU/Kn4Bg0xaWMAs7E4raMyE6763cZb
	fHuiiA04ATovmp9DQFhkfIlW3qZkPHvziB2POI3LKFB22wDNXcnF8WEVN6aM1qgmvBHJySRBK7E
	6yUGTI4jcQzpbcBORX5qBnYPgDu36XpeSg7rM0bbvVcglb/IoqGJ9N94sJcQSTaoMVKoOnKX2JP
	7kriiVJkDcK3K2bXRwdICIr3DfmsDkH3D2kIEn0g5r7+gFhXC/bJJJDXs/F56GROLlcvPVkcaSG
	7xGhqYbNKZECfNjdQMck5b6ZgOtdPwZOz7LGBHjO6dErRr+N0Ai/Om7WGkgFo5X1ZHT4D0dYF0q
	vU+kCVN7w==
X-Received: by 2002:a17:907:9343:b0:c29:5340:182e with SMTP id a640c23a62f3a-c29e51dc0cfmr470286866b.2.1789651246133;
        Thu, 17 Sep 2026 06:20:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:33 +0100
Subject: [PATCH v7 08/12] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-8-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=umKS2avGCEdkRQmhIBM8YFil2eP/51Z0Phzxs7xmWJI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+khFTnzyfPglSDKRhe9jhJ248KVhsVPA721w
 maThl/mHh6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIQAKCRAicTuzoY3I
 Oja3EAC3xwXRn2CnbM0LqkhMDSHIb6egUVT3Z4/USTJOaxCioeLFZxFJqP34dWW3SSlYeOf0LDN
 HaSLy26QHiLolkGa0nFeC2c0SUDx+Pk4xQhGJnhzYniD9HdyeEvjsE4Ll40TFMoxFzAqTdk6FmS
 YZDUokzUSnJOHwa7hhJbxnVvTc4M5KNEV1sMWFbMp/Mz4/gls9Yj8FYOQPXSVXq3PJRwzxgwXGf
 RQ9lBZnHLmS6LCSFWqktfqArHWugOPWCPBXjFqrvseaVJXAFDFhIqREIc8p1tlEz+ogm6Pnk1cM
 9mNI7NhZZcA/JeDQ9Q1AaEeDHLcq+vjF+dDQOqck1zZ/I26wfSM14S1xlr/KrizHcWcRoL1dnLL
 /9++ITHKabEZyHJStti/G/T2KUST+/aPu4NA69Mr/2NAYjF0utew8A80jYxMo6q/pyvHEr1e7VS
 9obWXQ32gzhlD3o3qa1pciSE8aL483gP4x7dU40kU6XOhwLqYaB4+jRHBwSgsDrPumS55/MdX6O
 l5zz0ZkxxLUDk8R+/WjdPVKycvaaQlh45OtFW9niUMiS26fUXQtNYyHmbZQZYzhBUpjN+GTCEcc
 fabOGYY+E0p1NlbamnWav9vaC/cnwYdOmGXuIjwv5wTAPbWfGq+iF+35ZOAPgoEg7Drr2/WiaMR
 cAnqElNPFkXTxCA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index d2eaabf917f11..f8b0f9fc0a6f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +868,71 @@ vreg_l7m_2p8: ldo7 {
 
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
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
@@ -1447,6 +1514,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
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
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.55.0

