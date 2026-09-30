Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA411A0B15
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760643; cv=none; b=dlfQAKrXNa/XFtFDql6EqJujkECXYwvPvGXVn8X3qPgto0SPSy/XfdfUnkjGSVIOn1sBiFyhCnWKxcFM4A07KHcg7f3sinUzLtIT2sPkfufU1+UV0xm1DEd1t/YFai3CQ7Ir78QimdvSsz7+BHkHhYoDanh5yHQQ0f3/4V3hzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760643; c=relaxed/simple;
	bh=F8OyEDMJn14NpnonHbCfxlALMJEt5YhSqKsUWGkcr2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqkT9vbGk9jq/MXXKv88XDjmEk0RKDMHnF5R962hEXBh5nhF0Vw0edKGZHu+EI7o/6XE1uykrPsAb93Lf0UYcGEllCqCu2qdwDiREcY6tHQHfzmGKU1Etzc7vzkJ6f3pK0G8rUnFESjCDkNTrlcVv69TygqUNCzv3thfPyHiK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2XnOwCQ; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2XnOwCQ"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb88abebdso1983343a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760639; x=1791365439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/zKnHAGq9to/WIL7jxhxruK6tjAHMHjB3oW6qJJ/zM=;
        b=g2XnOwCQKMCi8JWdGx6PQc7nafKzT19P0TsuQRTVevxYFI6Gw2/1bCi50pRr5RSD6D
         ftlP5NR00Bn5u81Zc2HGpnd0o1ezdnbFskDQlto+z5ZTUpbYR1P8gWtWvpbfEt0+Arzh
         dE4Ljv3D7/mRmGC36PUtbsPleL5QWDOe+F++WVrADGOstHOn6jlmYiUxZSnQmKbpedY4
         XDcDW36ZNOWv0d2q1A3EyKlbWE+iI+FTKGt+IaUOeU4l6sWeWW+YAKCRoedFyG1fP1iF
         tT3UzkiQtTx5dDuvrryRbLBuDa4VEhwk94Hw2PleZE1riBlWZH63b8YGwGArry+oqaXA
         JlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760639; x=1791365439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/zKnHAGq9to/WIL7jxhxruK6tjAHMHjB3oW6qJJ/zM=;
        b=1bZ8EOccBoe7LyI8qlJ3dsUxz9YiZCMJ5RwOU2cf7w8xlbFYWqYNf5TFbG1J8gb+IB
         NA5pYXWZbgta+hoyNqCrBH1WK2iIWl4FTZOupPC/ysob+dqP5Ckp6gpSgjwKW21M2StQ
         B7GKAAlh9GNncso9PBE21qpY4+eIJpuUc7VJatHVltncSSK2gb/6KUy2RXl4jhHXKpVL
         IRQjip4CuR0KTQjRs0xIyhUR5wOOo7Kgw/iWWx4An2UpIvsjpXSZLN8idZOnHmukiH9J
         lREdVnwdVI/kIexGdUeyE99AEVzC6GyquR7rh44wNkYrOYkX1oLKkQaiIgDHGWu9rb3z
         lVfA==
X-Forwarded-Encrypted: i=1; AKwUvByx/AdMv9C2LQFyJwgyr4irR5NI/VF90IJ4KmUYgupG1OrfhQEz5WjGurLZNKd/3ab80g6hUEkPHjtgJJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpAua6k5+wcHzLmXVq7KqHvHl9sXawNJzfUdIoKyUfcxmlrwPw
	5UEseW+tUezRQbLWFAjn67EKfLcA+1Np19jV43g6lgn/7SLMkDkMpQyioTV+tA==
X-Gm-Gg: AYBFou2CXcEkS20X1ZSr4XQQP3kTVPJPDt/3jpdpjTEW14WPy5HCiIAkqQ23KU//lGs
	uZW1H7D9pafI2F5bANYMdIvjPIf6ZcmE9qg10jotzdyUn3u034+cGTC86MFAjkJ7INDTEdUmjRx
	mlZjHG8qpIUQLdBEr0R3ylpqWIfrMSQ/wMMIcCByWYRTPhuhaZQ+G73i3OIUktH5FvXRJyXjl/Q
	cIhXFxQg1cenD3rc01GONi2DnmmtANnXedUL3eWHrOfdGsXRXFHPfdqMrirQGH1cGmqyaDHTZyK
	JlhgNLWSkaVRuXY/tGUk2K7zuJnBQ8KD4vjuMN77OMuV50MnrZXQ5xQD4uVQvYjZW0UWlX592H6
	qzr5cmoz0DNWMZQQpEfzrDs7yIFYz8HvhCEkYr0LvlpW+ktMd6HXkxSTM01DSC4E/jScnsOXh7m
	ivt+kH1745mBfLmOG3ZVjfW9k79lqp8WnMIpqGry8q1WZ7I6nijK9qWAFd51Qq/l6giLL6dmI3O
	PoHZrtEyf4=
X-Received: by 2002:a05:6402:4543:b0:6aa:edb3:d687 with SMTP id 4fb4d7f45d1cf-6ae1992b728mr420886a12.15.1790760638648;
        Wed, 30 Sep 2026 02:30:38 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:38 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:05 +0500
Subject: [PATCH 2/4] arm64: dts: rockchip: add Forlinx FET3568-C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-2-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=8144;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F8OyEDMJn14NpnonHbCfxlALMJEt5YhSqKsUWGkcr2Y=;
 b=1bWzAjEazfw+ZhFx+3PJN04vFd4tgaGy74s+JlHhJmJNE1mJHDhe/pt1jBcXCSbzQ86Y7WxK/
 f3/hVwp2XFvB83UWRHHPLMoWggQECI7N03veL/SpFBWthYFCnsgu/9i
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree for Forlinx FET3568-C SoM.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 331 +++++++++++++++++++++
 1 file changed, 331 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
new file mode 100644
index 000000000000..258e7591063f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "rk3568.dtsi"
+
+/ {
+	compatible = "forlinx,fet3568-c", "rockchip,rk3568";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&led0_pin>;
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1150000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-names = "mclk";
+		clock-output-names = "rk809-clkout1", "rk809-clkout2";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>, <&i2s1m0_mclk>;
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc3v3>;
+		vcc2-supply = <&vcc3v3>;
+		vcc3-supply = <&vcc3v3>;
+		vcc4-supply = <&vcc3v3>;
+		vcc5-supply = <&vcc3v3>;
+		vcc6-supply = <&vcc3v3>;
+		vcc7-supply = <&vcc3v3>;
+		vcc8-supply = <&vcc3v3>;
+		vcc9-supply = <&vcc3v3>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-name = "vdd_logic";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-name = "vdd_gpu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_npu: DCDC_REG4 {
+				regulator-name = "vdd_npu";
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_image: LDO_REG1 {
+				regulator-name = "vdda0v9_image";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-name = "vdda_0v9";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-name = "vdda0v9_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-name = "vccio_acodec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-name = "vcc3v3_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG7 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG8 {
+				regulator-name = "vcca1v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_image: LDO_REG9 {
+				regulator-name = "vcca1v8_image";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	leds {
+		led0_pin: led0-pin {
+			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <0>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};

-- 
2.55.0

