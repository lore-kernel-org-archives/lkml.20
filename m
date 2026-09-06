Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7740641F5D9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704477; cv=none; b=HQw0CAz/bGUvwU6/N5JXBYUZ8ycVzWWS4mXicoQUODhgAW1UCs9PWyLWugog+CVmxP/hsaC/+8bF76PDL4KYnk4yoxCUTs+6UQgW9h4fcoGIGObwabBtn0TAUqLwHZDyepHgI17QRi2Pi1O3LkzDC0BXxTmpp3Nxb0DaHmTR6NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704477; c=relaxed/simple;
	bh=zrnb/YqtMvgqNsp8Nh28Xd0CS4M3SnTDTGk/7x+TrVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iesWUuB65nt56xBvS9KbWeH0Lz6CocwLyhWfwMMhKj1c+SVRXcKO8mCWRMyvOrOPIvaqboL7fVqMterjRz2FF3YCgfKje4eIk+0jkuUjhlnAQp7pk9sEqlMpB4zBjoJqZKjVYW3CQDtpH9ymaVCM1q7LFRfmVk1gLWDojA87jLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywLAtjQp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywLAtjQp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b965570d7so30973835e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704465; x=1789309265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TmxN8+clv6hFU9/XYjpn5Wxk4RoaFjPCPQElqprorE=;
        b=ywLAtjQpLANVmFBRf/X7vwY6UXQ/x4XVfGs3YfqVFqJVhyjCbjzg7/boM87lWXLSCR
         L8KNxVaudhHk9NaA3GEDiDVdzGurE9RjGmnRVfdafvNbpG0kbzVOuyT3oqBoIt83kTFQ
         vZyo6gGVJ88cO1D8GV3qpXCp32gHYeQdSBU32fuEaR756ljDsquoZkHPZgSVO1cJhOq4
         y8Du8OvE3/ok/Q+Hbz4P0DnzmSGKbUFTYUASBc8IguKtdFYYTdUCSb86hljfGBVFQgfb
         KvOtgZw8LPPkKzogOi3sIrNLc4zIr+vMFlT+qXtD61xBVNlV/DT5RrNZBn4zV2E95psu
         7CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704465; x=1789309265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TmxN8+clv6hFU9/XYjpn5Wxk4RoaFjPCPQElqprorE=;
        b=tQOyEq/ODTl9XeCliems70DqjZ3W9vvrU5gc6iJjlNkQovVBHRAhBi0BxkGr4jocDc
         3lL730osOWVHt3iT4DJheAnQoJLPyXVtQ34xaDWLCsj2oGj782V8id5aLObycHHv1HmM
         EqQ8mlusi+hgpqlJyDw3Fhny8pWr0EJeHDBtZm4VqAW2QqrtT0S0t36rk78Kc1xPMGHA
         SJCO2I2VyWzpouUU90MHwVH1CbqPV9K8W87b0V6J47c3FeJxw8/B0oxd/Z7otbk8yuKz
         /ce5iD+V4/qcZgqIFl6ATM+5nK9s8e5aXNFRg4ZBL8JAkuiEzXpb0Ogc47+D2jeaXUEu
         nMww==
X-Forwarded-Encrypted: i=1; AKwUvBzDFqoFOcb587ZkwmxrO/UO30kBT0jqUT1NkFGDFhQK4yFSvYQbRhN6yKedA3YDOqzpmOzGC/Rc/Xbm0B0=@vger.kernel.org
X-Gm-Message-State: AFuF++mabOPgI90FeJjD1VeWpeOIv0mo4A+4H5QsuNNzS8K6Guf2m8LF
	aTZzfjZyuT/z5a8flHUkWskygP6GKZMdx5VRQC8A7QaOyXl7csbVWc4KKzZqtjuFGwM=
X-Gm-Gg: AYBFou3gWZnFX9BKM+bGvvqh63njZFrNc/ElVnn7s769dFIgUIveclmJNFIkefP4zeH
	r3Y7tN3jlb1nyYQtcvva7pCtSmFQNqDIqCZZKq6FhXX0VXsyA7rKoepA9rkhISw4Lgjf2dW5QhE
	SUyhprbQ/TlAhwiOOt2GBzR1IQQwce9FJkTDvrfXkIFMEbdpai+Ig6iTjgQ2boahCqJNWn5n4Uy
	8WCJoMAt/IjDGQceaB4tMxOc3YnByOFZuMQhAdHXNSCngGEJNpV7g4dxpEtAUGckf0N0nn/Tg+8
	1t+l3d0iQP3qw0c/5WtfHeeXak8lHyOEMVw/xg6wWsM8ANNCxMKMifynYNOFFTBqx28WvX6ORCi
	xQwIOdy8/jTYZLf8AmnGmSL17FtrNbkerNjgyT1N4D1/xm4mHNe4uSqJzdC8FrC/bgO9HK1VbdC
	yUkOHMmhVtqfyiosLxOW2H640jSZiLuYcXzaHicnIh8wKeaWmCtFV3vlEsh/NO+fvfJHJkHePu
X-Received: by 2002:a05:600c:a00d:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49cf81e4a05mr169293665e9.2.1788704465066;
        Sun, 06 Sep 2026 07:21:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:54 +0100
Subject: [PATCH v6 09/13] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-9-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2995;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=zrnb/YqtMvgqNsp8Nh28Xd0CS4M3SnTDTGk/7x+TrVE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbCtzb/o5OwChu5GWDBd1meWrt9k5cPLWA9T
 t04EZJ7R3+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wgAKCRAicTuzoY3I
 Ol1FD/sGlJL3W1n6E35cDJfSA5GcPqbvRsoLFFP3PkU66EzfdHljHS0PB/dON+ULjlweEvC6zzg
 8FTS2Gv4gN+TavCcL+Xpc0dGw+crtZ8Pm2yv2PKjZfnGiZ3kxhFBt/UGI6sCcKucMSbiGxn3T+F
 dqiXeQFJAMoYxu1N2D1dERh6c30S5UBsWvjw5mNpfOwht42l0ZSpJpnHBd+2Mk8cn+HUExgDi//
 A3HbiKcRaS3hB+vVLlJ0kZQgpIQwD4xKWXdGz2zdh9QtfTKMDvBSf+cKIA73XD4DTuxn1M5hC72
 8oCcXyaKUK81bDg6dbB56yJ+NM5zbIjXsH5wt6z3zDa83Qu4IiVjyagjJFoUP969/HXYCDKpRq9
 rZtOSP74blvJBZRy+rnr43QnfF3rW77EbR/YZ+u5uQUOwY8QgnY4CUVOkaScNBhsyHZYxgOXMSV
 8oWbZUU3JkGRVMM8qTkDouxLuZxNheSgckAxSYjHDGxq/HMfz/jp0uXIcUxzvsGOD4rAG8R8ozD
 bdHNuFpJralXx7cExQroNW45ZkXqE5ZaclFxmF4nze2WsOYMabyA7Keozj2uuFHnBJx9Om4kuqJ
 o6lo+P4hxalK8kT0m9LgXcLuBFty8j8Gspu/uld4XU97OQbGFm8psP3LdnNLWCYDmrAgdwLqBXR
 lBm3ic0DTAy84IA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 70e50ccf67677..a4e0d5d1ba90c 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,89 @@ vreg_l7m_2p8: ldo7 {
 
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
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
+		orientation = <0>; /* front facing */
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1531,22 @@ &tlmm {
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

