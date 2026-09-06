Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C061422E2A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704474; cv=none; b=drJdCuT7myQMnmDWM8O5aVh8lkYCl8VSxuRuX7tRHc64Pznv7J+ReUMZ1dNnN66hZfeM452mTnWWnqgiQzzuIDcu7L30nyWkv70EORwtCkli3IKzVqpCWVx0IWA1XvuVPBPFnR6l3a7j33Gsa0405TJ5Ys/kb/mVDNGJ7KEY5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704474; c=relaxed/simple;
	bh=/+p4YZEzTBI6n8V4vDPrNWKQ8/kvRqGwhIyUobmyEd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6oXKWqBSmHu7imxo52cAZfGV4izPa3DV41j/x3A5/3/fFJvY15W6UUPWSgCeluHoYPqzPqAyTjOLMYtn3KousybYrCWuTPOZtbUNSduXJKAXauMPINd4d9STOqXPaYlGJ6N9o5Giv3G3b/UJLqTsy7cP8iAqytDC+uj6Y0Qufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpa85+3T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpa85+3T"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482dd6ee390so2942856f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704462; x=1789309262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF05WClfR41ZYThh4riDA1S/tuEibqTHMrrvSxjho/k=;
        b=lpa85+3TBlW32yFJZ/8kjAiXfS2d3tCzREZfIw5GK/QOO0qLjkH9nUjzJrNjNGRmzT
         f8CUPPa/Cd8Bl/e0ZLqOeTn1G3xRQPPleaG1aFIILrIvyGj5W1gby7brPNNFDTxMOsrR
         iUqufdRl0l1U+Cml5rBsCFPBEvElmDVWiYj9dfpxXgds7Gm+SlDT50cQdlRCMw368dIt
         rXbZjEUJdeHFFFQDCQ7U+piMxcKV9yqSXWJsUySRpiIig8pMyphR6uII9CxKiulKiM/2
         e5Wl4ZAIIKTk1NQN0STkE+7gA+8M1M2PrjqwjLlgXWsJ0EJEcC10/V7Ml159tWd9HH9Y
         hV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704462; x=1789309262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GF05WClfR41ZYThh4riDA1S/tuEibqTHMrrvSxjho/k=;
        b=AaEbGarcKcGVVdk7DJafJfQPmFXnHmTUIKPgz0q2nRpdIQAJ+CKvZ6Wm4wN3JTBxj/
         8n4vDFvJeAJVdxHtBA7J5/Kwu51rxfiFGoZObQfqEK63lneEGfWUt7KirmdZzbs360a8
         3z8dHE2WDTqP8pl5AOVBys5J5CNAP/HRX3/0geroVykTfPcudwtZvvtO+o/orkF7M9lV
         PAOBmxjvxYG6FDtR2uhJXTyWCaZ9BPHd90mU8SXlJxpwMp/B6f25wQbdj84ldj82opvK
         sxVh/tOJ1KMwHEgFEj3N4AKb0auOWSeOzYqaw8K8YOf6XPw3ZrhGq7qKN8AZW6TWsPHn
         YORA==
X-Forwarded-Encrypted: i=1; AKwUvBwFqc/fltuhsnATFoJ+AwhBzVfkwjN2jSQftDNT9XpWJq713G36vcJ02fMLek/Y8RAVwu0e7NOHwSINIJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kN2myIPaSGBB2mb2y4x4uOOipS0zYPuluRH3ikmR70fAQMhrsD
	EYp8UToPq8HN89ujD56elh2RuOWOJlYJyb+fqsJyiVTnqdoxAUc+mUNHpA9Xu7LAdag=
X-Gm-Gg: AYBFou1utIrjMpLqq/Gn0EBjIeJFN+f2UnUhG/xnnZcrEKYw2BlWsOiupfKKUN7CJtK
	9uWoxKtrEcrGWj7N1eoVACC2H4fTdf7NTPj35/sYQkYHI76jzNdTzXawuPQ9qmZb0RRXvIEB0AE
	Re1DWWtUapyzlOqoJJlEHBtmsILpe5LZdeidQ/rYa9ZqRWZRhiUJWHNXyowNX5TVmuSTC955qvH
	/NdD1ZADADwxMfwiMly9wZp0sX4zcl66H+QlBrW/3ptPFFU84/Yo8wx4DIVmRHItIxl7uWBkXX8
	fpaGpi0Eqztgrla5Mf5R/IDfmumv9VQVlYUoUkfWgFzr1zbehDcQLsz6czjQTxsbzcz9k4woMPE
	o97q7jSYmFzOBJLKx1T7kK7lDqWhMX8n3KULlBKx5wzyBVCrLG4dZudBX5RyUBe4h4uhDodJ1As
	tc0jIQXatOeWVmAx2I/5Fp3rJ8Z7pHcKZ2Sf9Batapd8rsgdXTN5CTbSVhe5W+GCVW9x9pZDHU+
	GCY5+6lAfw=
X-Received: by 2002:a05:6000:4029:b0:485:8bad:fb4a with SMTP id ffacd0b85a97d-4858badfe5bmr17688490f8f.7.1788704462612;
        Sun, 06 Sep 2026 07:21:02 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:02 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:52 +0100
Subject: [PATCH v6 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-7-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=/+p4YZEzTBI6n8V4vDPrNWKQ8/kvRqGwhIyUobmyEd4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbBd+XGfOdErJSAyjynq8/2wRuvHTSmUOuFm
 Fw99d/ZPOaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wQAKCRAicTuzoY3I
 OkVuEACQdGWeP/oIljm6MBSx7g/+2bMSsFsO50J2+9NNVNI+oqCBi3ie7f4zeK0C+BMS6JA61Fp
 Sw1UY769yGAlPkEdqIHISH/wEgYfcEHxQLC6J+qG4SC8EiIc0Yoi3YStGmdS45oaxUIofsAnXa7
 4GNe0N+AYroQqXLgBUzPaWJRv+z4VitlAaNdozSkXT9iTWWTxEkGqtSje93hCLucecdPCg0ufas
 dF7CytDF03C6KQHUA9p9xmuQHkQxKze1Uo1i4WM2q0qFJYuZ8LX2v/FcRAW5JIfXYiD5E1ub3zn
 CzMRmXg+CT36sJQF05mmsehwSyQ58IM+45dmMBm5LqmxCufqgMZD4xv1H+TEp3rewBXFvll8yXp
 htCn591uDVtfvqOQC17eA6yYFXpr0RegaJwSfzJnE3+uhpNRnlhDUgi/C3eeml+KhXijl8Rgqke
 nXzGwyJh7OMHFQ1KLSOf+8/jnx1Ws8w/gEnuGprtFzQamVIG1yhOIEFCxHatHmweLqVtoofdPDL
 CKWWnLk+zzQon15dgmfNwb+WCodZG2qp9xCX2yRD4IeCFmLfzmAPp7kQWKfOkbCsmU53ObS1VJm
 WtuKIPlrM0QL4QJP+OzxBeQ7XVcf/kKnlEd47oY1n7J7DjuJ4WdH4GAmDCTDMwP33QKBK6OFtw3
 UV3ycDWXLq9GeKQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 97 ++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 7b9a40a7b9a95..96324f6ff6a0b 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +934,86 @@ &gpu {
 	status = "okay";
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
+				data-lanes = <1 2 3 4>;
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
+		compatible = "ovti,ov08x40";
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
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
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
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&ov08x40_out_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1553,6 +1634,22 @@ &tlmm {
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

