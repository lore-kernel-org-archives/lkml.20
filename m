Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E41566C6A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177085; cv=none; b=AWzW+1oTayqCj1cj+q/HphkG3T6PcoVE8nFItVI8eZOnh4rMQGY00Rzp73OnAIvxChnkGuoSEkBsxnu3xkGWZowupe/GDhx12nDAve61TzK5f/yBQPpInrkAlvZ1Y0LDveOK/I7aX3SHnTMfttWs5BA1h7Y/uV+H3FKXGeCsVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177085; c=relaxed/simple;
	bh=PpFEyVaBu9XHECxlaufb+LXVgXZBS0OkF6zgnYiD3og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAgox/4ewHzq4W3bw14uYpuf1kIy1u6Zg0uA7q+CZtz25T4HYnN3B7WkJ3QyxDY1MgExaCOvwYqPttm0PgZalJavQedrlxRoOEhk0CVjbO/PMGzORTS6/Ei0I8SuUm3yREardD+3xkl2xY4vKh+W5MmDQ65nH9E33Ho4x0KrwgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Pj24RJdr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Pj24RJdr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso7571385e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177082; x=1790781882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozMsbDX9PM7NmdNq22axboQ2GO4zjike6CEQPX9ud3M=;
        b=Pj24RJdrWvKvuSNEt1JX89JO906u5cK2Xa67GvV4d6hMsOjYDfM6+EfDqfEPy9b20e
         9bUij+BleNcJcWvtDMKcEbI6m7jVtLQAq/wTHA8l2mCHQfxuoza6BRevvzvABCR7BH2X
         UTITdqj87XBDUQ9EvD3n37FZOQlOh5HbFs2Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177082; x=1790781882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozMsbDX9PM7NmdNq22axboQ2GO4zjike6CEQPX9ud3M=;
        b=M5qBjFWPv3O8Jsb0jrt7Kp8lmpOHRoQdOkIJkJq3/HXATsMbheriEvTbaNzPYkP9R8
         qOuLKdntMXYhPDTIzC1Jz3YJ6XSW8xF8y2/81ns7x1sO9SThCVR9E3rmtcg2bktL3k61
         zZISZJlch1tSix8Ih7C7SgOMR3Kq0Ve+jpnrY5039XlTtjdA30ucGUejDhhYG6/aBHiN
         Af1jxLFJLNflECObA3/iKAYjJcGNEBQcCRA//jJDJ5+q02c948uxcC5Jg9O906SNiWVi
         Rv2l2x54pzioVDwzvja4E3gYqAlaxCDv6V52wFlXvmsC6BupLeAWCF28ccBeQkAYEw0l
         W+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr0GybUG4NuPW3yy282M9fG6HKNrY4RIU/Mxv7jCsZT9UYnG0zhI5OqZibUy/RCrobjR2v5WonMpxP43Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k40EifR07vJ+ezcToeo+GppSL2YyVTiT8EmTnz6l9Vl/f+ljw8
	gYMBRdFDX8v97BZAhx/4+GmpbellDAbQR5GqSIPrLIPltQ4LTkZTFFg9GfT/yXmnPlc=
X-Gm-Gg: AYBFou10fFMhDTIOScc2wlwcvVtSf1zUXQoRuKLPu/eDLJ0sr/TuRw+53goD5ZgU880
	mF0coxNj6mWMeK4C3n4yCD1eYqihgq3UZeAqSvJAQyGG/GBoq/mbhaUnzuifCTLqSy6JCx1nQue
	A+AWnrjClz1+jPPbxTp/tpJe2tfp6K/3PPBLEY3KKgCpmV7+n5sfE4i5Tav9aH1+UyDndIL0mRj
	5Lebnbp4vKPZ6wOxkXlPGfyqZF2TP/hvtgFgDqFpc5ahrYrlEk7a9nb4v6TUQUa1Hvoj6P2ljfK
	AaOKGD/p3UcE15OzImm20pRr4AeikGKQg3IcxKGmgGGYOKwKfq7xejUWc+DHxNkFQ0ipsH1b22g
	N/EY5mbeJoeY2RDte9YgEDbp1Nerjx3TR60OXGvMyuQuZNOqxd7CxnIUmGhiaTcfw1shtrr4uy7
	XKciN8AbiUeVKsWbewiOxqXS0GpZRC4mNcB58v4eZbAvP5wIktWaZ8IWGaY3ODuk5ndiqpCLmzr
	QRboUeRli3O8vJ4kfCjELYVoZYi6xs7rCasmwWquMZXd078quAh4sVhfYk4zdEExE0=
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr42436965e9.6.1790177081744;
        Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 1/2] arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
Date: Wed, 23 Sep 2026 17:23:47 +0200
Message-ID: <20260923152435.563925-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
References: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board is fitted with different displays depending on the product
variant. Keep in the board dts only what is common to all variants and
move the RK050HR345-CT106A RGB panel and its touchscreen to an overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 69 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 49 +------------
 3 files changed, 78 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 6cbccfd50993..218ff7fdf576 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,7 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a-dtbs := \
+	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo
+
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
 	stm32mp257d-engicam-microgea-rmm.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb \
+	stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtbo \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
new file mode 100644
index 000000000000..e64dd277ff09
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Rocktech RK050HR345-CT106A 5" 480x854 RGB panel with EDT FT5306
+ * I2C touchscreen controller.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpiob>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <854>;
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&spi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+
+	display@0 {
+		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+		reg = <0>;
+		vdd-supply = <&reg_3v3>;
+		spi-max-frequency = <10000000>;
+		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index f5af0913bf1b..4b39b6c482d6 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -116,25 +116,9 @@ &arm_wdt {
 };
 
 &i2c1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&i2c1_pins_a>;
-	pinctrl-1 = <&i2c1_sleep_pins_a>;
-	i2c-scl-rising-time-ns = <185>;
-	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
-	/* spare dmas for other usage */
+	/* dt overlays don't support /delete-property/ */
 	/delete-property/dmas;
 	/delete-property/dma-names;
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5306";
-		reg = <0x38>;
-		interrupt-parent = <&gpiob>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <480>;
-		touchscreen-size-y = <854>;
-	};
 };
 
 &i2c2 {
@@ -179,19 +163,6 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
-&ltdc {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&ltdc_pins_a>;
-	pinctrl-1 = <&ltdc_sleep_pins_a>;
-	status = "okay";
-
-	port {
-		ltdc_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
-
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -257,23 +228,9 @@ &spi1 {
 	pinctrl-1 = <&spi1_sleep_pins_a>;
 	#address-cells = <1>;
 	#size-cells = <0>;
-	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+	/* CS0 is reserved for the display fitted through overlay */
+	cs-gpios = <0>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	display: display@0 {
-		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
-		reg = <0>;
-		vdd-supply = <&reg_3v3>;
-		spi-max-frequency = <10000000>;
-		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
-		backlight = <&backlight>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&ltdc_out>;
-			};
-		};
-	};
 };
 
 &timers2 {
-- 
2.43.0

