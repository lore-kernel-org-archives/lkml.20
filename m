Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58464531625
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178822; cv=none; b=LjXw7Xx4sVJueEEOJhzqHarA3MdmAz7glqqQT2Rm2d1JLd1YCgvDBWGgbsRhWgZLqTPxWk9zhA4ECYBAuWlJ8aRyNUXXDUhOO1JnteWkSE4KJPVFTBrx5s2shaFHmqBoGJY9mCTuRrzh3BXlLBtMil9mXlSZhjjXan439e7o0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178822; c=relaxed/simple;
	bh=Eva+ZHizA/xOJPwrntOj0lFaBBzLravCS3cca+PXGVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRKkjR4ldm/tQIdACkgNBI4BYmzfXdzQTt9tlJgpHH6EL0Py9fhKpXaqM7We2Bri4w/9B4S20GnDnl328PxHh4fVOcDT1vlq3EsaTLInz25jfs+n31A+AeVsZ+iL9jfc+UEU4yvvm+0xR4MjONnPcGY7k/GuXwXRtqwm5g++9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j8pIjGOZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j8pIjGOZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso474550f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178818; x=1790783618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=j8pIjGOZBsxBwo2+fqjKhUrZFOHqbjQLE68IP7zZwEhxhKsdHb1xDo5y6+Oe3LY2u+
         ZtXUsHL6uYQmFsWG2XXYRHy6t0F1r1oYmo32uC2Ibj6xfpkdXGIpJ39H4HgfvUffL3xG
         3qcstYCYz1sQAgbsBxC9DgXhW4NnKrGzdHrls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178818; x=1790783618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ogzk1zAksC1p2lO2lX+ildRtH5U/X0N5sk/kFhqIelM=;
        b=dzO+I0zmjBNoHl9Ru+cQ1i9qx1/TZ32/5DDnU+uEILnsU9yCn4OrPSiwqtfmq1UtNf
         eSo9SA0M7GOUXptoCsxZaX1VvueJjkOkSYH1/6A/IxgYryYdYUWUPOJZ5Qd+ADPdvllc
         v0Mm7FihRfaA6bE+0B7aJ+VtvhFEpHy6iLn9nAH1XSDxuYGiCMBK6MyCwAdkhDKm1BBb
         7/d4PZLa6E3Tgv9qzk3WC0PQkDwCbLKa+4G+pZ4fnVgAWjOs1OjGX9ZrDGi3UPm/dGbR
         A8ERy3PtnWuMLS1wOqL+yeYd2Erf8lBPaJtjtImm1/LgfbPaVH2JZ3Uknlf2c6zG//8M
         BOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhLs4LPHij1po8NAQOz+2EhyWPJr7If6MSt9gu4hbaafxtWrkx3jzmsnETAgUBUrEpfhLZlq+iYTi90JA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWG4RMnR3aUe/UblxWkPBV09gDRlosmezKJdKYygM3ptgHqgdA
	fleK5KtAUslVdDjl4hxh3eVczbcgPuAzsS0RiMyCdyuTd2/KMURiiiH6fvQJr21RwGc=
X-Gm-Gg: AYBFou0aMqGN3VlrEneRxvjvYlgbtvBOqO4usE/8rWKHbHH2eXCmhqf/Yz4Y2kJhjP1
	XIMRzv5JmkEPsdvp6usxzYplzT45bz/cMaNOXbZ6cWXBkpvID1JxH9QI1FTeVpP6CfO2R0VBtzJ
	Z4skkl/zQppTigTRpuW/1Efp9ejJzRU/l/HLX+HWpvVaUx/JaVYCWrL4HR7h5uGaXNlhTzkZBSE
	zRhbWlQPG3Q1egfFAmENd72XVkI/iyqGKWj6aUcBxx9YFcsZu9ADfwhcTEu9NOgrXmCVta7YnSS
	UICdzmspRaqV8kqEBZS0saHCHKnW5i6qWjLtFIvrgUI1R5sw3GavoZDBwXnVT8hAvb4CIA0HKdG
	tDNwolR/COMkpfUcYvIPWY3eO5EHTzfhG2o9BV8CQAsutFrezVwdlEzMA/ovjaVIKC0od5f9c8+
	J7nXFEIqeTgloofE/Jzh5VGUlkg2Sb+go9rwetAU7Ys9DpB0zjSFNeBWcLRtdB1j2jRxs6KueGj
	EGWm297KRiphDjNRZGLr2+sZP1gCeBWg2QfShCqQl6W636BXJU1yDw/0r6Wfzx1paI=
X-Received: by 2002:a05:600c:1988:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fdf3571f9mr41898745e9.3.1790178818353;
        Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 1/2] arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an overlay
Date: Wed, 23 Sep 2026 17:53:09 +0200
Message-ID: <20260923155333.610134-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/Makefile               |  6 ++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 46 +------------
 3 files changed, 75 insertions(+), 45 deletions(-)
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
index 000000000000..f89641bdb23b
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -0,0 +1,68 @@
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
index f5af0913bf1b..faedddc2c914 100644
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
@@ -259,21 +230,6 @@ &spi1 {
 	#size-cells = <0>;
 	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
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

