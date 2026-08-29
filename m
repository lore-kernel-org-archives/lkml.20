Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6A33F588;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032142; cv=none; b=T03JgmhXySXUZxDTQMgrtd7G5B3Jbd9Tpi8h4+o80j3pVYYBp5a2MFqRbp70ZzB+vtb7axwp+3Gz3Yn22Rn93qD5x0CAuUlg5cg+rMQ7z90Qtp3L7DqDokq9q9ORCYIdblGIidbjd0yBZ8n6VL99h0Q1saRyZrilf9sxqYiec0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032142; c=relaxed/simple;
	bh=BuWbjHqcjwSqo85dhSN0LQd7o4oQ8F03RwL2iZS0y6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q09SvLi8eAQqUmcty6+aID4FV0q70cgsowxVnZ5T2iBrREIc4grihAI7VOR8RfXi98XIjo1alobXhcZXC1Xdq2/ktwlX4x3wUJHMnLqb48kg6DfmH4a5GJmLt32Osjg2mLws2dVxch5y7ih421RUcPEBlX3cNqwqz1JZNIZn/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUdzqO/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUdzqO/G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D349C2BD00;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788032142;
	bh=BuWbjHqcjwSqo85dhSN0LQd7o4oQ8F03RwL2iZS0y6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mUdzqO/G1sMqKUXGdMFqfj2eE7eOeYbY5oPUccjG/iu/VBCdPM+8qD3Iy5UsepTcD
	 Y+pOsWfoTW8lHp6d8JAi8hQJTWy7zahe7sPplQWwtAMnPl7f7ne/lcyaFjUj5B68fU
	 rWz5Du3OlcDTvi+WjxTy4QDDzc5V16nHY5HozFdPsae7fLYhLu3LIzngeRTH4911I6
	 560+S1iWMjzPNfXv9g4+5A4r0RersMxWKnraCzUA/aDs+ndCc0dSLee8a/2wpo1mJP
	 3QdXK7vpOjmej96G4fa6FJOL457aixR44jG+NvG1gpLB2NObLj3FAtDLt9/nwTEELb
	 VwAFj+LQiPuag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14108C61DE2;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 29 Aug 2026 14:35:34 -0500
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
In-Reply-To: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788032141; l=4201;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=63P4oT6UJRI5RcFp4MDSgRO4yYmZZbwljJ7ZdnJQdDk=;
 b=nwHV3NkkV7sI7YBD3Fu/DkaYuLqOeo1Bi1uE2d0d4Ru/dHZaX0AN3skjYvqj9tRVWgQGn5yrh
 xXu0vW5HxeoBpHLEWNfNimQzLDdf39E1m/xT+QwsfXWQ1z8ctVUQPuZ
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Retroid Pocket Nova is a high-performance Android-based handheld
gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
featuring a 4.5-inch 4:3 AMOLED touchscreen.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 116 +++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 09b3c5b2d9dab..582805e89f4cb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-odin2portal.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-ayntec-thor.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-nova.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-retroidpocket-rp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-rb5gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
new file mode 100644
index 0000000000000..0a0546977a026
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "qcs8550-ayntec-common.dtsi"
+
+&{/} {
+	model = "Retroid Pocket Nova";
+	compatible = "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 860000>;
+		brightness-levels = <1023 0>;
+		num-interpolated-steps = <1023>;
+		default-brightness-level = <600>;
+		power-supply = <&vph_pwr>;
+		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pwm_backlight_default>;
+		pinctrl-names = "default";
+	};
+
+	vdd_disp_1v8: regulator-vdd-disp-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vdd_disp_2v8: regulator-vdd-disp-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_disp_2v8";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	ts_avdd_3v0: regulator-ts-avdd-3v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_avdd_3v0";
+
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		gpio = <&tlmm 144 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	ts_vddio_1v8: regulator-ts-vddio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vddio_1v8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c_hub_3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft5426";
+		reg = <0x38>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&ts_avdd_3v0>;
+		iovcc-supply = <&ts_vddio_1v8>;
+
+		pinctrl-0 = <&ts_p_rst_default>, <&ts_p_int_default>;
+		pinctrl-1 = <&ts_p_rst_sleep>, <&ts_p_int_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <960>;
+	};
+};
+
+&mdss_dsi1 {
+	status = "disabled";
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/adsp.mbn",
+			"qcom/sm8550/retroidpocket/nova/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&spk_amp_l {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/aw883xx_acf.bin";
+};
+
+&spk_amp_r {
+	firmware-name = "qcom/sm8550/retroidpocket/nova/aw883xx_acf.bin";
+};

-- 
2.54.0


