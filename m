Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006B423E9A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704482; cv=none; b=mXd3ly49FY2TLecTxHh0Pp074PoONj3zW7Ag48ZpKfEHf7ar5p1rbw+u50OzfkUFcwIS5NZRvw7asoy87qWfLlMwCaOOw5qNSSewjXdbkpUyxx2eBRzkDdjkek5sGFj0XqbJsqkH+yE1Xng0nCmQkvcMcsR975Al6wpmQWGgYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704482; c=relaxed/simple;
	bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGm10hA9yUeWnjz6hQ7KJM5AGPzv2sSMQttuR279KHRzSKd1HWGdG+ju8EmgOrucjRHbv+uVAC7wAtnGKgj/F6wkFprVjxV9NrNmZ+MYqWHYh/jNDbKOYgmfTBb9EA7TOiEpnIYvwO/YVlueH3kG5sEdBg1zecMraagf7lmzBgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeNi0mAP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeNi0mAP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1779176f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704469; x=1789309269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=qeNi0mAPulgLZvFvSDLTOJRyVHuPdJWv4BEUMe5t06uNhdPwtcijEo8HXp5Nm80q1K
         G+A5mD3Hd0Nw2tvAuGAwGDg74Oodwiy5H+XHauVLmsASZj6LvaW8HhFqaRaUmbheNNpS
         A3w/rRbZQ7iKiQgKqj6knguAyKEC0Iqb2Ptf2nVfQQQMcctbSsFgzkgLRqImJWFUe0mj
         zOhojdJm22NH1V6CiCsVCSqxbhTpetzNibpxGG7nw8mnSvZ2OpZEvhs3wCwlPcrikxOL
         sIMA8OHUl1Hv+2/kIq4+j/79JYF5TaDIf124MgFQ6SJzpP3dT11eK9ahthyorS/II3eS
         Y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704469; x=1789309269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV/xxFOLjb67oe6b124gprVUysFfmBCGWhquo3HhkBM=;
        b=CYqUhpVblouyjUT4mzmlMBSHY8XKynpRZxl6ZtJJ8L4sMVg5ej8oZ8ETtUy9LZn31e
         xeEkIdw1ujXTx7/i0wyDOucssAnpSNKWwSD8ysDmxuOE1n10K+PVAup+4em2er7tlDBj
         wukqupi1AbA1DB4OaBO+1MuQOf1bfRVRQs+5kGQW3wZAXst23eRFJJlnGFII+DfoDJJV
         8hXDreiPOsb7a7JeXgcJqq9vp1Vftv11KR/xJgJW8tOc3rX9hZJx5ycd12UUX2njheeJ
         M1Vtf4AgXid1IjValx2HwAB79L/PhsqMUs5xDd9p6XmnWGGZoQakAfODLFTANE33U1b2
         FfJg==
X-Forwarded-Encrypted: i=1; AKwUvBytBh8CT1bqjEBxiGqX9iPvGlNWTG6lw4/uq+HhLRXjqqPP5op1t0KATgIa0H4jls1V+fzsdbqlIM8lNWA=@vger.kernel.org
X-Gm-Message-State: AFuF++kIviyj2p3QHjV2zacjsgTl0fLffg4FfR9l4s1S0zNX7ub30FdU
	HOjgW3z1G4XRJDIz7hkQEDldvVuTlgeVX9xzKjqMlreyOYy9bD71RbX7oEsbg8btLNI=
X-Gm-Gg: AYBFou1+tt6tbQFYUMwKGZo2PeFobYd59/c5w5ATI3LB33U7x7+rg12oep7yoR2hABG
	KTi5o4KNFAE7VAgN1JnUJiZTDUSM2N5kTuWjCF4TSNon3TR6J/gWC3DHyJTf7YTI82+0FcwxfT1
	knxiObssHYpr+H+hD/rduoWScLwRtHLCeurenN6Gx67dJd55OsraaW5BZHNso5lTFzWeCubVwiz
	/F7WLTKVNKeN0y833dkVkvfiXdP1U7mR+v0NYyzcLDwZFjbUcvmnYSZZKmn+A00vBZvfLhgy8Eo
	gY7IK1gdobil+nW4k/1HR9nbuO4TzhxqtWaIR4HjbjhmeBZDxN344p+U7K9OXe6q7dyWnDXNlsc
	LDKbrncFgFZqCWtMqVKXpvuwLBjvmlZbWMNasocxbOvlgR/aDg49eT8qDQKJP7aZv4UTao0XBF3
	TdZyAYvUC9SRqSJl9qmRRPbfHI4Ng/F9YXoHJE3UnQe4Sv1K72AucXPccB66Fp8p7yefPwTjcWv
	CRIqh/zekE=
X-Received: by 2002:a05:6000:480a:b0:485:8e70:c826 with SMTP id ffacd0b85a97d-4858e70c8admr13201212f8f.32.1788704468849;
        Sun, 06 Sep 2026 07:21:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:57 +0100
Subject: [PATCH v6 12/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-12-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2957;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T3eCxqMEeLwX423LxUJKnOfgBKSe3waR1F04b0ppdB4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDTJqsj1FFeT/yfRBb5orsdJ90SBzEdVkSs
 UGzykaxMYiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 OkVoD/9E2+yIeTEe3MqaK1z01nRoleTuJONPR0PMxBdKgzGfVkWXmLVqqOMv5TnF327QymV2MNR
 pFPWF+UkwEequ7Y2naGZ/mdB//5b1W2Tw+FjMNRq8GFObng8V1AQzjXBCCCmFQ2KmlcOyegkVbI
 tZBiNL04PNNwxsnVMNLtQFWUO4w4UfQyl0wi76XIIuTL9qeYSELxrE+fauDdzpmhs0iVFpPILCl
 Q23lY/PGl3ONqvJnuRdPcHLPtQIKtZEmoUJORlxm/mRtQl8Ds4sBg/mg3r7Evv1LNzuOyBaM0ky
 6yNca7O20bvO0IMNmCJ4bMK68/AUaOB5BKuJq5QxzxIngqU2So+vgsrtgRFpL9JOyghXpraup89
 6wqUx+RDJDSd/ab5cquQdxuqiI3U8ko1fjvAA1kz2ja2pUzEyu/RiwtGtUrAeOze6RZTFdjS4m0
 nITWrrulw2EoFpvQ6itud+/HWgE7nBWbwCnHp3AB4/xwyLj36Ug1TGxr8/X1QhdOZS2Ebs/mEhb
 gyTnHpUfKCb/rwTer83cajrAlXJPWpn2X82Vm7qmzL1rdyzjz8624uCIdPP1wWedEFdacOYFCEE
 SuQa7ZBRWfPybw0AwWQHr8AHRTOZCdPpFtQ9VH+zPLNzQ4ul5kol20m5fibaTbHMAAnfzBKK1EH
 A/LF20nlYLfhZiQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..8290f65f8a70a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,89 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
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
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1494,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
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
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.55.0

