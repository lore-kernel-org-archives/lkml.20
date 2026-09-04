Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043D499F26
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519421; cv=none; b=IH3mV5LgeElX49TP6TcbV4K4NrxzX1JUz//fDWDIgKo9IdZ7JwtPo+bif3Kw2pB7IAxALwx/XM/kEi1ID849jjHQ+zJn7E5lAM8RUOir3HZdOEpaj4Yyv2mmDQ8X8WrRSxvtlq0KbquAPjLs33VNevHrgL1OUQ3xxm1i8umov4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519421; c=relaxed/simple;
	bh=FNJ+GocNgW0Bq0aBQ9K4FVVIYYeSNs9Nx7XmpkJfg0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+zj+oeBJ4q3cT3lKuXvBPit6AXNijGsJwkTXkqFZirJVmT7TBROY4t+opUP4SzKPNjRRTPMH9h32tO8YONBpQ225tAdrO2qJUoanrNm1uItU1GRJBJMQdQbN/IR7HXuYeOFYWuLMTwobGTs9SKkT4KKVw7ONDxcoth5ggvgZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlGx0txg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlGx0txg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso8429945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519415; x=1789124215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPmiZNeid6/JuK0oaLu3fj0vFeRVSDFb9TK9vagTKHA=;
        b=rlGx0txgAVUsCYbJoPJCOJQwzQo4lAuF2c0gclYm1XA6NbpA+0YMbI3GN5ABkdOypz
         JcaQL9xlI98cEUFIAp53/WrDyfXWuIVrjGn1RzOKp24NsSr7YxN1XI1V5Ogv2k+I0SIV
         uB2avSiii5ijGG4wvazdMa4l/av6/AyWrE4WtDSE8o/JfH1bolxsO5jMS1eUdbxJgKDM
         JHQloIRTKuf1TcaIs9zkbxuTlHSdzXZxvwgKnTqK/99PGMXD+pf93dzKfeaLSm94hMR/
         2s6bLRuPqH8rocirQQ7TM16AUTFyTruWnaf/7Rzvg4M7SqBAdfNIW6N+HtDA/ydnXoqx
         qjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519415; x=1789124215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPmiZNeid6/JuK0oaLu3fj0vFeRVSDFb9TK9vagTKHA=;
        b=nhmIFxWmWG+CuattFRcYIjye0vFTf/XGMX9mx6m4nFqmXXa1nJ8vb4H3iNqDRcDG2r
         H+cGg5pkR0ivCNWLSR0rBWhWYvFf3XqkzNLyosxzBaUhTJabQKk7kwFnunutlzBW+czC
         RerPdJiqxUxT6gRH8+HRWVGjhJLdx6ewSKTHVn0owDoKWAeK9SfPAN0+XWBfj3D3BL5u
         +5+TxsOS2SlBW0stxYEr/ftdzmkB6ccUoFvVMuWrG/uLMJ2X9MUCZGskdHet2a1RgaAs
         cISWfdWLPLqlj1Aybg/9pb9m5OYW2muM4KQ661HugWdVc1S6BjlyKlyvi1FL5mrGRBHC
         FQww==
X-Forwarded-Encrypted: i=1; AKwUvBzPFZ9X9lRbHt6zFah19Whf+d7Mf4SSd/0o2W6yQMpXhpQN9Q+QYRJtkXA9pkV7tAf+zhBv44K2QBs/U4o=@vger.kernel.org
X-Gm-Message-State: AFuF++mSLMtz+rOSFc8Y/YJ/wBPCjs8T6HXvZvVbTV+u2XqO/dE7gby/
	xuJ/G077rSoW6Hy8oHJ9vAp9iYcla8ecEpDlR7MYx8K8oxKJbIQzmbcnW7bh3Y6+LFE=
X-Gm-Gg: AYBFou1+r0MlPdO3bh93pyBBiM0mkZ4cB4DG/v96sQ0ucDNdu6Xw9mYt0uyFWJdZMm/
	DBcHIES1OTXxJhBcscrTfoJ+EM6LxetGsZvUoIYqR2Vcms5kymbCsF4bExrobe4OD/wVIbOROot
	w+QvN0O6YzuWUcUSs211fOLMTulLSGEN2t/00ZMw2N7Hv3jJWmOVs25/wnQuyv86J/NVuqyfkX0
	zC2ZTX92WRyjBXeB8c9/veDfgVd612ukJx8zwnyc1F3u7u2kLjsdI7V1PtyTwYOjSvUCE5qm3pk
	62Nzr4HupyrGu2c0opB/w9OxDfy21gz9T6Fm8ZbiFPUF/3Co05otseTc6K8lXgBr6CSFhWTfBiu
	TUL3/yGlHz+ufM5iVdd9239AOxnA0THky3aMDuuMUnhgRtq4rgYbXreknJHZkam2l+GJBICZy3b
	SsrmbKQMZSwr+bJ3aONlQX78FoeVZpM+pMz1ZUu4O32OAt77BfsuKdC5TqsRSAW3p9Nx87I9+bQ
	XjYJR4RVkE=
X-Received: by 2002:a05:600c:4f4b:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cf823f53emr86299175e9.9.1788519415581;
        Fri, 04 Sep 2026 03:56:55 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:41 +0100
Subject: [PATCH v5 09/13] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-9-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
 bh=FNJ+GocNgW0Bq0aBQ9K4FVVIYYeSNs9Nx7XmpkJfg0w=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPnvhgTb9I/vx1N1T80XZ+fBsxYF4xT+lTVC
 36YIHLclCSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5wAKCRAicTuzoY3I
 Otl1D/9mlkQkbZ+9t780Gyv2x3dcUfc1oXPClefMmns8poCegwcnX3Thylk5oFoXURpcBQyFm1M
 kXSNcaWNnvXd2MwCZ2fLxzLBduOOvvkF1/SAxXkgOWYZQM/DrTKrAcWMJpcnYi/WeWVnvcBbh1h
 F/2Td03JpSv0hwB+Hqd6RwpT802tkcCR56+L9eiX56JZFJ0QVhsHMLmxCmNS9vhiEyFRbgWNKRn
 R9I9DEE1F8DEDCb7oza74hQ/jB5pTUT4rB3DpU/uSF9N77gwcHZPXUT6+LTW67MBETc3emMhN9+
 MBgMyrqC6uLBMD9RB+MRYH/Btie63kFzDT0o/qV/Won6kEb/VECLhIT1OS3EPOvGIxqiDfkAaUm
 mGAN+OwR/PYPfRMi6ym4nlsFNndr9FfPIgD8ji0KPzZVBHkC2WRZsXcIOfRyj38gkWo5jeSX9wY
 n2tWlVebOfUryzHUuX/cZYPLK8hAMd3psKNmJHrIYN+CYaRqsDR4Wi/+1Wu+oGdapbVbSpdJq35
 0xxsk5Jj3CtaGgaVOZc+jIknvtUe4osMTdvI1lQQl51y1wKS08DP4sJwZMJpTTAE8YnDebjPDdh
 Ah0CNJV6bLOLIDY/ymuAEFvz9gJPZ359NNd/ptalFtyGm3mPneOFCZSfxBfwAsi2S9M9NsEZlTg
 VVWe7/d9/xqt+Nw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 70e50ccf67677..1690bd2a6ec41 100644
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
+				data-lanes = <0 1>;
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

