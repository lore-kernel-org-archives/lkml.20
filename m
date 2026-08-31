Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD43D47DE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164460; cv=none; b=WnB64MSU/Rtj4/bSGwCPd0N5/qNPtlrr8GhgEAxJGoC/0HpMo6NZ1qcReiRkw0msX5mO7O7zjKop6ydAG4FntHP0CopXaqELb1D8/jwC/dTVHzry7kr1xTMn+fC+/r0VJ3aCb9Mwlu5G918WdZFXE8CgiLotb8HK5MTrc9dLbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164460; c=relaxed/simple;
	bh=XMF+vhUKOjUOuc40M2urXASf8+nQxGMRr42QCyG7Rdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eEqGqjGJUq7SMceOcHWfnr/jqXiifEujwxqg0dgXi7KbC1n49YG0a06Su60syjlVcdHaDQ66eNCPOr5iQRyuGawUYQg6J++ORlDuyy0BDze6vqj457yOeTDif3r5Y2sA3wMF+DkfGnGheGuNrCjPUFtVbKoOnzpx6VzG7SF0YSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtOZhAWq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtOZhAWq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso31242965e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788164457; x=1788769257; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MgBK+9leXVbxmDatVupt3ofH6riq2Lw8Q4eAqxxizh4=;
        b=WtOZhAWq9HU3W6ZcVtXecwkKv5mpAcQ7hpAsbu0nIP13KgHMnWWWulHwiMCNju+s1N
         aEO1lZaIQnsiUpUaC3qH75TYkG6D3HUXmr0Y/Xg+zcyWSr72wwQeMDUR5DS+QrGgQx+q
         aDW+imwFtMWyfgJZ3tzcwCX6KvgpuSxmihULC9qtBvF8NuOtyWTKd74O/yABwQxlXKqa
         6nkoYnPBz/KBhQBw6WtinAfx9Rxb2/Lc8fPvK56iDqHS/gn3gtsZ3cwZCWCYXyqvqjzk
         quVuxA8UulGHnVeIFna75O8wZzqgaRaSTfq2b4q7a3ZyjEpsqFxoJqAARzVhcOdZlQJh
         Vk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164457; x=1788769257;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MgBK+9leXVbxmDatVupt3ofH6riq2Lw8Q4eAqxxizh4=;
        b=YSIZf4DeMzRmOSfRawFQeUfqkW62E1gIuYIXlm6ZERnz0HZ7VBjVTiItmZY0JxJhxQ
         5I8tI7M75jwYGkYdaXHGQwybBadE2SuDvLK0sEwC8j9qAWnXcFO0iM6KlIbW/kRgis7I
         4RYs19UoLsDskYcyqHJmWyXePf8zkxLEfmFXgCPl30p0AqJrIPCJP48SmCfeUr3aIIL1
         N4Ug4n+Kh3Z0a1XNmtCjyXNTVymivglzlS+FZ6yR7uliEzlAvZqdNyD9mTALcP5Wvas2
         UAx98k9YYSwQ1UuG/7zCq2OrWRUVXQT/gcqjr6M7uBlOksbqwemfclr4tZN3rNz162eR
         Ek4w==
X-Forwarded-Encrypted: i=1; AHgh+RpndesbykGyVH3IamO6YLkjhh6ONpxMWtB0SKD/kLiFoKZJ3W7duChxAQyA9Cp6U6wlUgrRSxBAPRrmSKM=@vger.kernel.org
X-Gm-Message-State: AFuF++nMGX0I5mLlb/ZpFjV8ioJqGrzXIeYSkVV0ZOz/qIHx+RISN7mT
	KPxkTfnpZNxGI7qPK/6+tcukGYiLOl3V7hcGs8axALlDkx4Cn2b6e9Bff0RQPZtEybM=
X-Gm-Gg: AR+sD13eH+BMVUQpHIcoq5fu94h7BP+Rjt49UbLwao4z5UNKOubTA09GOJB9LzCqzFD
	oX03MSWoILOy66dRxZO60Hon8ApWWfytgCCgWj0Xd7j24SwwXI7xY7vn2mfPuN3RaksVhcjJyNh
	FzWpcSV7Fy5nCDi53iRNHXQA2Yo9b9a3c53q6Z+xXqyWpKLgEXbtdaqQwiyp7iEXDKQiihtBQCL
	4jW/+bz6SaPE8m0EfoHAkh0sPLgOIXvViO/Wuron3t7HxDkKWM98vDp56LNZMHHWVp1KGihoyRb
	viywXzfVF5NyvT1GTA6YqI+xNQiLUOdao/kzCWu2lbFDkRlipCwWaQ7NSOB96y28BmoTAIX3RTQ
	hFQ+FKrhP1BAYeq0zsv2xWgpwK/TM2LZIP3okS36WcdIxnurRWiVEguHxK8utR84JM8mVVokuqM
	twmhomQ/IaU2TWGE31rGZCKbQ79d7nBE+PjvjzoWp1J4I2P2bACNuQC77Jmu9DT3caAmgM+UAxb
	YOqBnMJEw==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr280936065e9.12.1788164456461;
        Mon, 31 Aug 2026 01:20:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm20105883f8f.5.2026.08.31.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:20:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 10:20:52 +0200
Subject: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGM5lWoC/5XQTW7CMBAF4KsgrzvImcROzIp7VF34ZwJuIU5tE
 xUh7l4TKkHFKssnPX8zngtLFD0ltlldWKTJJx+GEuTbitm9HnYE3pXMkKPkDXaQw+gtpGMnBQd
 91gMFGIP9ogwJwfk0HvQZXAZRK2NaRablihVujNT7n3nU+8c9p5P5JJtv/l8j0vep7JDvNWZ0I
 rDhePR5s5raNUK0yG6v9z7lEM/z3lM1l5evOFVQQd9XNVrOHW/l9uAHHcM6xN08ZcKHLBAXyFh
 k61xTfk9CV69y/ZBbvkSui0zSkexcXffKvMjNk4zVArkpsuxI9FpxIbV7kcWzvOTOosidQm2Us
 WR7+idfr9df3QuHWIcCAAA=
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7893;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4Gbxk0saXYa0vASwZGvK4kGYCHKXsm2fZeaiMljHqRo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlTlmOyq3GMlmNDzU4U/6VF+CdgkgwVrjQjC7+VOJ
 Fj72PTqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapU5ZgAKCRB33NvayMhJ0Vh4EA
 CbWT1ORbrBcK51UsHCcC0nbL5Q4GC5/NCxCbt9ZFL4XMHoqN+dfouMOfQgTqelIOZVHRHTqFRxrSMJ
 3UEpdjviccDkJzRQPWoK80xnhw9sEMzaBbNv/9MV2Xq9bqkq4aJNkr8D9tmeyRXfv/azay8qotxexA
 ePtu58dnTLXMMelwVpah59TIs71YKkCOKwVuJqF6G65N4SMbZH854o3zWWOsY6zzsooaAoiohCXb45
 o2h/O+cVFJQtnJC3npUK0NXIggdIFbBfzDjDgRWKSfIDbul9VtU46nEX8bXw6oJcOUiPKWi8J8zLRs
 8fgmO4Xu6ImDmT2lBu0u7MgtvinoqNbfZHS2sgw4d9EXQWuscsr+FzQiUJR2RkFFv1MD+o9mxaqigy
 ny8HcyzfIbZCHXnv4JNbhwFnG5HoFW6zUkSvYUIsnTdihX91adG6/Ujsjvoyhx2EMLQA7RQXLnpXgw
 AWQTaWl25WrkAAPiDlHcnAhmkprLoo0K4l/ITnPnxDtdMSpUZWqpgqSePRTylLVjBtTJBkclmP0x+N
 2BIwSeijnPVuL1jotOwiQIoIs+Uw2Ma/UuV2JQ1kxeML0j88cPtKZ0LoqWGYcJpujnxVohtRu1LyR8
 +Gdjdh/44lWarwdrlPG+dik85QJFUFbZX3/Ry/0vLQ1JolfK6YD5Z+PoKeow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Rebase on v7.3-rc1
- Link to v5: https://patch.msgid.link/20260728-topic-sm8650-ayaneo-pocket-s2-display-dt-v5-1-892ab9bcecfe@linaro.org

Changes in v5:
- Dropped unneeded mdp vsync pinctrl nodes
- Link to v4: https://patch.msgid.link/20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org

Changes in v4:
- Reordered regulator & mdss nodes
- Moved zap shared firmware into separate node
- Link to v3: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org

Changes in v3:
- renamed backlight label and node as "backlight"
- reordered pinctrl properties
- added regulator-boot-on to display regulators
- Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org

Changes in v2:
- Update for bindings changes
- Remove empty line
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 230 +++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 6ddf30ecabfe..58368ce3cb44 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -325,6 +325,23 @@ platform {
 		};
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+
+		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&sy7758_vdd33>;
+		pinctrl-names = "default";
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -986,6 +1003,10 @@ gpu7_active: trip-active {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 
@@ -1016,6 +1037,30 @@ wcd_usbss_sbu_mux: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vreg_l14b_3p2>;
+		AVDD28-supply = <&vreg_l14b_3p2>;
+
+		touchscreen-size-x = <1440>;
+		touchscreen-size-y = <2560>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
+	};
+};
+
 &i2c6 {
 	clock-frequency = <100000>;
 
@@ -1053,6 +1098,51 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+
+	/* Screen power */
+	regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		pinctrl-0 = <&sgm3804_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Backlight */
+	backlight: backlight@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-0 = <&sy7758_default>;
+		pinctrl-names = "default";
+
+		vdd-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1073,6 +1163,93 @@ &mdss_dp0_out {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,master-dsi;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		status = "okay";
+		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
+		reg = <0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&backlight>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <90>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel0_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+				panel0_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in_0>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel0_in_1>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1390,6 +1567,20 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	fan_pwr_pins: fan-pwr-state {
 		pins = "gpio125";
 		function = "gpio";
@@ -1440,6 +1631,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
 		output-high;
 	};
 
+	sgm3804_default: sgm3804-default-state {
+		pins = "gpio58", "gpio59";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -1454,6 +1652,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		bias-disable;
 	};
 
+	sy7758_default: sy7758-default-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sy7758_vdd33: sy7758-vdd33-state {
+		pins = "gpio163";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_irq_default: ts-irq-active-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts_reset_default: ts-reset-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio107";
 		function = "gpio";
@@ -1549,3 +1775,7 @@ &usb_dp_qmpphy_out {
 &xo_board {
 	clock-frequency = <76800000>;
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
+};

---
base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

