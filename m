Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5899051D503
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758328; cv=none; b=fR0p9aok3D0kVXxBeO5Ciqv/szzC4x+S3cLpDr+Wy2u93sw5G2TbZ+VuaJt19annbEHXpkst1/QNQzo6F9MKxufrbBiwMTq24MLcDn1FMJ2iQa2zzc63b3q4ddX2HUphY55AzwsGpGDqYw4cFu5pEvdC0DZ8baRF3VK4yYt5WjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758328; c=relaxed/simple;
	bh=UoNbDgetSFVCXuAi1HIH9PBkiKZyFnd5WahFLf0JYso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gozEPCRIylKZ6KkGEJeS7DbXTr62koMf22xT6WBn7cfViVQRC49HSjZVQ1vaOxWdGqujZSkQ/uLjms/KfjIeOQju1bIGFZVrKI9l+foxjYIKGFXwTawjc7jKoFlp2QJlWWZfKk7N9X7HbI58bLBSx4hsd4R7KaT08bTu4vmSSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pmbzyRC2; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmbzyRC2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso1273961a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758319; x=1790363119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHPWb/2AKTs0IxscwyHMU24JMXrU/qe+KBj7Iaw8yaM=;
        b=pmbzyRC2CbH9X0NlpnaJwn/eaW1NLwYlYbWsBZ/8e/FQ93ofnNFdvI7mQ/CjdvctPm
         nM9QN8x4eOOny/T8v+CqZKcgdcJX8k2gg1ZpfFjWa7C2aXjkfnf7wPF2b7pSMQ8KMndJ
         KbetMobQgwmVFa3OQAd0kRynvLYDQDf/nWMhISntajKr6kF84Zpt+6nEzmgFq25Csvjc
         9Tt7s3SsYFAnyiTbhWtuJim8Xwv4sGakylaJhRRfgIYXLb1mqkV7Y5te7ZVLGdNK3gkt
         tdmJMjbKd9Z2GHyQSlnD8EEvmR7K8IptB+B3wLVjYlHGhu0vten2lC7Y4vyHrlgodlag
         GpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758319; x=1790363119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHPWb/2AKTs0IxscwyHMU24JMXrU/qe+KBj7Iaw8yaM=;
        b=CJx672OWw0VDwai3mivaQnVxydYbrICSWyMkgG+XVJvOayc+2to5Eu0tOh4Qw4r8im
         r9uUKfde0ieLqe4Tt3oJMAnEvSDrpyCnlo3Pin1AaqsQHzEm3ZD99rAeV/lYV9+flRYW
         mhx3Q9fxa5ruuVOeh/Zt+/NegvnMpLeofkZJRu2rWwPYfc3GdXVmdXu3hgPpoPJyQPez
         tTuRXqDmr63+QBGaSTAe6XGQpfE/bACPP6T0FgC7IkBKGxh+8j3c7A0TZUTbRIqXBYEA
         zae55YFYMqTsWzApVqeyW30/HLVqKl9L2dEpm+y0Lg+vARgf0K0usfHCRLSnQq9nYZcm
         u5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSHKBc0URlsDZUNJvG/3GTyU2e09KLidK6JRth5IYgpaQUgbRFPRiO6OMj+5Z0uiP5tAovchw1OXHYFHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyi2KwJV1+php8DzWSbrmMvN3b6cf6erre3GXufFQxxJZ170Lz
	YNhomUJqJOtiEe/gEJecjHQl9d4VZzGBvSgfduQJH8LMyIz1RcsnSK3xxSApq7V8Cfg=
X-Gm-Gg: AYBFou3yYf8ILHMBLLynloBXCmVNHyWhUztpOeVw3slzQ9oKgfBHJHK1DnATMczyqPS
	9MKSoJR0GsFcs31y49Gzc3uddTrYs2Y2y28AqjLMjTlfbXhQzsxxXqm5nY2C23Fy0k3jZt9tdEJ
	Tp/AAYMyIOyHHbUqEOsivvNY1ifZTTBN7GAIy25ldqkbB9YwGM2Kb8kis9/GfRU9RxJo7vx5fg+
	R8kewt7iv4SGOnlPS1lWFW0DCytShw7qlGSjR88MZsX5EPp7d3eepIoGhFBM53tEaBCIy+0q8+e
	WCC31VInDz+1A87DBAWi7ZSesmAWMQp9wgtDRyL/TSLkjfAmeWJjlP9YvsIVsSsCj29YHPGlatE
	6bi8uEvcfTHS9d6b5OELgT6HSthHltbHlfBTVUcVK5bMy5uGYjo/uHAjMgZJSEB5Z1IKiE7b5Z6
	5mSL/SG53OQhMmvZ/bstXLgxda+0D88u1uKN1bGNjdOqISmov8RB8j6+5ZSR+tulCIEenJ+7K/v
	OFXN/+DUuuXT/6ApQwqqC4RWYQrE2Fpe9wWVdx/e6Ty/WG8y/+wVE7Gf5TAS3LuOg==
X-Received: by 2002:a05:6402:1e8c:b0:6aa:7d3:7c8a with SMTP id 4fb4d7f45d1cf-6aa5319ded1mr2447864a12.22.1789758318489;
        Fri, 18 Sep 2026 12:05:18 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:04 +0000
Subject: [PATCH v4 3/4] arm64: dts: google: Add initial dts for
 frankel/blazer/mustang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15303;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=GX1o5adnABIWE5s/BQwhhbHTvDKx6nAtsi6ZephOr+w=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtrOjDXgGCJ01qkqC25oJTeMyJcoGZoyQPE4
 f1FxNqrvpCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 upOJEACbR4oXKnA2nKmXFUCEke9qX+ruDEL0L9kiOSZF+MLX2fS8rJBDtqU4SU8X1C1CQSEKUbu
 9Owx0/1r0KfBnc6gFgbOPmfp4TeIGqYI1UEdqsH+14dFVus6nIrsWUd/6hO5QoRzgOiRr4Ds3wc
 FnKtZ+xNr0w2iZSTzaZwaV7A90txTgBCGTeTEYnI7/weQe6FU4EGIRI71kw2ovHEZ+1lZZ/Tl4l
 Mp8wzTFpDnaJE8Ub2jjrNbLAW9S2+ydRbYI0zoiC/G09I8HO1CIIB8ipSUe21cv+MNNGWjsJ5Ch
 VZxywmoazElW8j+6ly7Y6xJkvPx8J4GjbQj5Kp5Ok8Fr5ePkm6KAkTB3k18c/lWCt2xFch5zjy9
 slPDMRa+4U6DiIZ/E0TH0v1Il9xD1k64Y+B3r7yBIXINJRzoP3Gagd79B4HQ2AYkuPVN+5bDhij
 5hmPNugaD67DQa/lL3GB/mMOVgyWHWveU9HurehBSc1+rxiTJH0WzE+1M9UAMm7UIXnLs+RQPEP
 lZRwcNZIMzUN1J/ARJSXHaYRsH7O+z9FFP/p4nFvdzi2EVhzuY9KI/1n1P8iwdph/NMw1YI0pbw
 4uGR9BEGjkTrnkmoZinvCUruZZODmZaW7g0mE987iGyrqiOSkXVqhddfaHwxhUrfLyhzb3tK6+y
 VrWbEZTRQ9/Y5Cw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
boot to a serial prompt using an initramfs.

Currently only Laguna B0 silicon found in mass production phones is
officially supported. Further revisions such as A0 silicon and EVT
devices maybe added in the future if they are useful. As of today,
these device trees boot fine on EVT devices with A0 silicon.

A few things can be noted about these device trees:

1. They purposely choose to use the full 64-bit address and size cells
   for the root node and the `soc@0` node. Although I haven't tested
   the need for this, I presume the arguments made in
   commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address
   and size cells for soc") would apply here.
2. Though it looks as if the UART is never enabled, the bootloader
   knows to enable the UART when the console is turned on. Baud rate
   is configurable in the bootloader so is never hardcoded in the
   device tree.

Changes by Peter Griffin:
 - Remove dtbo overlay approach and add individual board dts
 - Update to lga-pixel-common naming like gs101-pixel-common
 - Reorder nodes alpha-numerically by the node name
 - Add ramoops reserved-memory (tested with console=pstore)
 - Add reserved-memory for bootloader & gsa logs
 - Add reserved-memory for Android BootLoader ABL (used on Watchdog
   reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
 - Add osc 38.4Mhz fixed-clock

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Co-developed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
Changes in v3
 * Use 0x0 instead of 0 consistently for new code (Krysztof)
 * Remove 'ranges' from gic-v3 as no msi child node with unit address (Krysztof)
 * Remove ufs0 alias and ufs placeholder node (Krysztof)
 * Remove memory node from lga.dtsi (Krysztof)
   It turns out bootloader adds the node anyway
 * Use standard '/ {' not overlay style (Krysztof)
 * Update alias to point at label (Brian)
 * Drop GIC_CPU_MASK_SIMPLE for GICv3 interrupt controller (Shashiko)
 * Fix dt-check-style --mode=strict warnings (Peter)

Changes in v2 (by Peter Griffin):
 * Remove dtbo overlay approach and add individual board dts
 * Update to lga-pixel-common naming like gs101-pixel-common
 * Reorder nodes alpha-numerically by the node name
 * Add ramoops reserved-memory (tested with console=pstore)
 * Add reserved-memory for bootloader & gsa logs
 * Add reserved-memory for Android BootLoader ABL (used on Watchdog
 reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
 * Add osc 38.4Mhz fixed-clock
---
 arch/arm64/boot/dts/google/Makefile              |   5 +
 arch/arm64/boot/dts/google/lga-blazer.dts        |  15 +
 arch/arm64/boot/dts/google/lga-frankel.dts       |  15 +
 arch/arm64/boot/dts/google/lga-mustang.dts       |  15 +
 arch/arm64/boot/dts/google/lga-pixel-common.dtsi |  22 ++
 arch/arm64/boot/dts/google/lga.dtsi              | 413 +++++++++++++++++++++++
 6 files changed, 485 insertions(+)

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
index a6b187e2d6318..4e833b2561e08 100644
--- a/arch/arm64/boot/dts/google/Makefile
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -1 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+
+dtb-$(CONFIG_ARCH_GOOGLE) += \
+	lga-blazer.dtb \
+	lga-frankel.dtb \
+	lga-mustang.dtb
diff --git a/arch/arm64/boot/dts/google/lga-blazer.dts b/arch/arm64/boot/dts/google/lga-blazer.dts
new file mode 100644
index 0000000000000..0894606624f8e
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-blazer.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Blazer Device Tree (Pixel 10 Pro)
+ *
+ * Copyright 2021-2023 Google LLC
+ */
+
+/dts-v1/;
+
+#include "lga-pixel-common.dtsi"
+
+/ {
+	model = "Blazer";
+	compatible = "google,lga-blazer", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-frankel.dts b/arch/arm64/boot/dts/google/lga-frankel.dts
new file mode 100644
index 0000000000000..7504222a728d4
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-frankel.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Frankel Device Tree (Pixel 10)
+ *
+ * Copyright 2021-2023 Google LLC
+ */
+
+/dts-v1/;
+
+#include "lga-pixel-common.dtsi"
+
+/ {
+	model = "Frankel";
+	compatible = "google,lga-frankel", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-mustang.dts b/arch/arm64/boot/dts/google/lga-mustang.dts
new file mode 100644
index 0000000000000..6ac0b5ef22ff2
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-mustang.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Mustang Device Tree (Pixel 10 Pro XL)
+ *
+ * Copyright 2021-2023 Google LLC
+ */
+
+/dts-v1/;
+
+#include "lga-pixel-common.dtsi"
+
+/ {
+	model = "Mustang";
+	compatible = "google,lga-mustang", "google,lga";
+};
diff --git a/arch/arm64/boot/dts/google/lga-pixel-common.dtsi b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi
new file mode 100644
index 0000000000000..5aaa2e5af8ec9
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga-pixel-common.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Pixel 10 family common dtsi.
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+#include "lga.dtsi"
+
+/ {
+	aliases {
+		serial0 = &lsion_cli16_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&osc {
+	clock-frequency = <38400000>;
+};
diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
new file mode 100644
index 0000000000000..26a14b3a1b190
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Google Tensor G5 (laguna) SoC rev B0
+ *
+ * Copyright 2024-2025 Google LLC.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	osc: clock-38400000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hayes_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x000>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <258>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
+		};
+
+		hayes_1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x100>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <258>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
+		};
+
+		hunter_0: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a725";
+			reg = <0x200>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
+		};
+
+		hunter_1: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a725";
+			reg = <0x300>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
+		};
+
+		hunter_2: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a725";
+			reg = <0x400>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd4>;
+			power-domain-names = "psci";
+		};
+
+		hunter_3: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a725";
+			reg = <0x500>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd5>;
+			power-domain-names = "psci";
+		};
+
+		hunter_4: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a725";
+			reg = <0x600>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <891>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd6>;
+			power-domain-names = "psci";
+		};
+
+		hunterelp_0: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-x4";
+			reg = <0x700>;
+
+			#cooling-cells = <2>;
+			capacity-dmips-mhz = <1024>;
+			enable-method = "psci";
+			power-domains = <&cpu_pd7>;
+			power-domain-names = "psci";
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&hayes_0>;
+				};
+
+				core1 {
+					cpu = <&hayes_1>;
+				};
+
+				core2 {
+					cpu = <&hunter_0>;
+				};
+
+				core3 {
+					cpu = <&hunter_1>;
+				};
+
+				core4 {
+					cpu = <&hunter_2>;
+				};
+
+				core5 {
+					cpu = <&hunter_3>;
+				};
+
+				core6 {
+					cpu = <&hunter_4>;
+				};
+
+				core7 {
+					cpu = <&hunterelp_0>;
+				};
+			};
+		};
+
+		domain-idle-states {
+			cluster_1_c3: cluster-1-c3 {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <325>;
+				exit-latency-us = <553>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-1-c3";
+
+				arm,psci-suspend-param = <0x40010033>;
+			};
+
+			cluster_2_c3: cluster-2-c3 {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <345>;
+				exit-latency-us = <673>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-2-c3";
+
+				arm,psci-suspend-param = <0x40010033>;
+			};
+
+			cluster_c4_deep: cluster-c4-deep {
+				compatible = "domain-idle-state";
+
+				entry-latency-us = <510>;
+				exit-latency-us = <1027>;
+				min-residency-us = <10000>;
+
+				idle-state-name = "cluster-c4-deep";
+
+				arm,psci-suspend-param = <0x40020333>;
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_big_c2: cpu-big-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <110>;
+				exit-latency-us = <413>;
+				min-residency-us = <3950>;
+
+				idle-state-name = "cpu-big-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_lit_c2: cpu-lit-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <132>;
+				exit-latency-us = <296>;
+				min-residency-us = <3610>;
+
+				idle-state-name = "cpu-lit-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_mid1_c2: cpu-mid1-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <130>;
+				exit-latency-us = <274>;
+				min-residency-us = <2720>;
+
+				idle-state-name = "cpu-mid1-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+
+			cpu_mid2_c2: cpu-mid2-c2 {
+				compatible = "arm,idle-state";
+
+				entry-latency-us = <130>;
+				exit-latency-us = <274>;
+				min-residency-us = <2720>;
+
+				idle-state-name = "cpu-mid2-c2";
+				local-timer-stop;
+
+				arm,psci-suspend-param = <0x40000003>;
+			};
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+
+		cpucl1: power-domain-cluster-1 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_1_c3>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpucl2: power-domain-cluster-2 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_2_c3>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_lit_c2>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_lit_c2>;
+			power-domains = <&cpu_top_cl>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_mid1_c2>;
+			power-domains = <&cpucl1>;
+		};
+
+		cpu_pd5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_mid2_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpu_pd6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_mid2_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpu_pd7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cpu_big_c2>;
+			power-domains = <&cpucl2>;
+		};
+
+		cpu_top_cl: power-domain-top-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_c4_deep>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/*
+		 * Store ramoops at a known location in DRAM, for access by the
+		 * ABL following a crash-reset.
+		 */
+		ramoops@95200000 {
+			compatible = "ramoops";
+			reg = <0x0 0x95200000 0x0 0x400000>;
+			console-size = <0x200000>;
+			pmsg-size = <0x200000>;
+		};
+
+		/* bootloader logs */
+		bldr_log_reserved: bldr-log-reserved@95600000 {
+			reg = <0x0 0x95600000 0x0 0x100000>;
+			no-map;
+		};
+
+		/* gsa logs */
+		gsa_reserved_log: gsa-reserved-log@a61b0000 {
+			reg = <0x0 0xa61b0000 0x0 0x00004000>;
+			no-map;
+		};
+
+		/* Android BootLoader (ABL) for ramdump/coredump processing */
+		abl@be000000 {
+			reg = <0x0 0xbe000000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@5880000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x05880000 0x0 0x10000>,
+			      <0x0 0x05900000 0x0 0x200000>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&hayes_0 &hayes_1
+						    &hunter_0 &hunter_1 &hunter_2
+						    &hunter_3 &hunter_4>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&hunterelp_0>;
+				};
+			};
+		};
+
+		lsion_cli16_uart: serial@db62000 {
+			compatible = "google,lga-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x0db62000 0x0 0x100>;
+
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.55.0.1082.g2b9226bbc0-goog

