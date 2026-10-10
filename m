Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC054A92F0
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637245; cv=none; b=Gu4UUupB+FRKTzsMHugyv9tIWZW/HRkXKmiuMEA2/IDOoDHVmqs09q4Xj99j1JVoGvaVnlGVllyhfe63fPVn1B715kszpkRWSIK29VMWj95pRAlCcGfFu4saE0FfltpZVTqtY9JpG9Z/Z9jRPrKqq38tI4AzICcf9Uz+UzAHXD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637245; c=relaxed/simple;
	bh=6Sl5dylBa2kVoR5hIFB770hS6+/oeSr61zTcPZ7DAes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eauv/yFKqXhizTvCQByTklIkNNl1enW8woGXBizs1U1LWrHkN93aqgFz46r3srIMFNMNB2uKilc7+/isGFNoSWJMHMtD83/djw3PsSHCplbhX7QbwLCUeXuxSCobNVXl0bTM6F3rUOUoSiIm+ccy9/KTAon4CD4YYJ4SWayKDMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krOEbSkt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krOEbSkt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so4872625e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637235; x=1792242035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=;
        b=krOEbSktkJ4S6kGVYl46xqc3LwdnDngMKkKGe8MIYn7Fcr74H2HSQwoY/mqJB+NlDe
         /HxSOyEJQIaUaINFgcTVygCjvBuSZCLft+G1/aeb/kfVyB55saJtq9urZxl+den59dDr
         6/wjLEuXwrsb2CpHEj+tsEW/APpA3XkQHqpD54cgSU/NiVeGpVWS4hxnsDmu97s7Zt1B
         rPuss591OYPUyjKLpMyC8I/KB/Sl6gN5pe/w/8oKtZNMvJ+iKOJkWwMSfchHdKiTceDe
         NrbFVPhoduSeXvGAAuRiXvONBMXoMLaUgf1JRABf4uQOOToHeC5Z/WwePJqA34BhRPW0
         Xtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637235; x=1792242035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okZqjkUX6jwAmxhXromeBQSC/ImnHAAnu9CdaScVrV8=;
        b=wTUgKr0t+T6B8oSch82CQzZiedwSfeF5bP+ZIw3WAVp2a98caxyrXXcCYZOW1Vez2K
         yq5kYdFHnr9L/XRrT6+OaaXccJ/1k4v5mKaQdU+hwAGhvaMhnEc+44IlpI4RZf46Z0Oy
         tkblDNSZBbpiMT0DWvkcrTjvlVEeRuojTuoIoVUduFdpSQttVtrlwvS4D7TiP2P6A8d9
         aomxbNxBuC8GHNLzpkD6AwQX8Yf49Swjtiyt/SuVS97YmmNdNBqTHXDNB8myMXXs0yup
         UQdF7WUelFsKL1IaPhOA7hV6gWj1uM8jbeLzOIKnmRmtQHjKRCPpR21uSUU61WkHGoYH
         u5Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxgSoA8ATw3HnavIfRU6EvjgXHdljpXkBzC23tf7xDQ7WY+Ui0KJ1QqXQvUl2V0ClUaoaWDqdiJkZFoLKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwMHI4AZ7ZT0brpKBlhEJPPbzU3ozNgXB96jDvVIPuwRn0WgP
	hPX2TWr5lq4fCp2EcEkGI4uoVk6S7GphOt8ei6t2ZyzOLX+UQbj0SZx9
X-Gm-Gg: AYBFou0j/7ipugnweb6AxLEtM01o85xqWKWgzVz1c62ReX27ImnnPUcCFn9TR+/s+W+
	1yxK7RmgFfeY2aWcfA8BRAVcEsyWY6cekoqwl4u3ASptNhSL1bR/GnV36Hcav+BlJjeI6e+APrg
	lvU72DsuwJGtAQGDs+J3LTSqIgI03aOuZm/vZs3vY3Ar+2Q+y71NppyNB65B/PGSgYDI0DYtgDO
	F48RASs2E8NwLF3lrOmoWkm1Vy62wLZXscIwwMsTa3GfUKTF7E2Ew/f7KjmPk8okj7OGTrW5/Gu
	lbwOuEJjUDH7iRKNJMSGMiCLG+bdwQG/BxNAQ2GnQius0+e4K6SGlyb4v5qKL50YZ/+JHI/Fdh9
	4PSMek/uOhgt6oGOxmgmiEwCYyT8YZYyi8kCmq4uh9GwUceLNnW7kgTm/qT8/cy4UGpFCRGjYkF
	bcS35SDQUiyPsAgUohm4QeW5BF2MxRti3+TuPOllh7D88Ti5vKjfotJBrSzAcsmmvCIqKZvO4UW
	NW8CmdpZN6xmYTaQ6bpRCwd5QZ/sCFUV6hCdFpHsBrGxmURJzHZAis9B3fVP084AwaLV8ci7R8j
	wmeFAcHb6+PXetytcGblV0nOHPmyqNWmAkAMR2M/lW4Hcz4eo1kVsGCFpaDliw==
X-Received: by 2002:a05:600c:8b82:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a18e4b887amr89143345e9.27.1791637235528;
        Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 06/24] dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
Date: Sat, 10 Oct 2026 13:59:44 +0100
Message-ID: <20261010130024.177503-7-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the top CRM and the two low-speed peripheral clock domains,
including the confirmed USB reset bits. Uncertain clock-source rates are
called out in the cover letter.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/clock/zte,zx279128s-crm.yaml     | 141 ++++++++++++++++++
 include/dt-bindings/clock/zte,zx279128s-crm.h |  55 +++++++
 2 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
new file mode 100644
index 0000000000..2964c0fd6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx279128s-crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s clock and reset modules
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description: |
+  The top clock and reset module (CRM) of the ZTE zx279128s holds the PLLs and
+  the clocks of the CPUs, the buses and the bus interfaces of the peripheral
+  groups. Each of the two groups of low speed peripherals (LSP) has a clock
+  and reset/power module (CRPM) of its own, fed by the top CRM.
+
+  The top CRM also holds reset bits of several peripherals; it is a reset
+  controller too.
+
+  The clock and reset indices are in
+  include/dt-bindings/clock/zte,zx279128s-crm.h.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx279128s-topcrm
+          - const: syscon
+      - enum:
+          - zte,zx279128s-lsp0crpm
+          - zte,zx279128s-lsp1crpm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-topcrm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 25 MHz crystal
+        clock-names:
+          items:
+            - const: osc
+      required:
+        - '#reset-cells'
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp0crpm
+    then:
+      properties:
+        '#reset-cells': false
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: 25 MHz work clock
+            - description: 32.768 kHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: wclk25m
+            - const: wclk32k
+            - const: wclk100m
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx279128s-lsp1crpm
+    then:
+      properties:
+        '#reset-cells': false
+        clocks:
+          items:
+            - description: register (APB) clock of the group
+            - description: AXI clock of the group
+            - description: 25 MHz work clock
+            - description: 49.152 MHz work clock
+            - description: 100 MHz work clock
+        clock-names:
+          items:
+            - const: pclk
+            - const: aclk
+            - const: wclk25m
+            - const: wclk49m
+            - const: wclk100m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    topcrm: clock-controller@94000000 {
+        compatible = "zte,zx279128s-topcrm", "syscon";
+        reg = <0x94000000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    clock-controller@94400000 {
+        compatible = "zte,zx279128s-lsp0crpm";
+        reg = <0x94400000 0x1000>;
+        clocks = <&topcrm ZX279128S_TOP_LSP0_PCLK>,
+                 <&topcrm ZX279128S_TOP_LSP0_25M>,
+                 <&topcrm ZX279128S_TOP_LSP0_32K>,
+                 <&topcrm ZX279128S_TOP_LSP0_100M>;
+        clock-names = "pclk", "wclk25m", "wclk32k", "wclk100m";
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx279128s-crm.h b/include/dt-bindings/clock/zte,zx279128s-crm.h
new file mode 100644
index 0000000000..41fb041c8e
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
+
+/* Top CRM */
+#define ZX279128S_TOP_PLL_A9		0
+#define ZX279128S_TOP_PLL_LSP		1
+#define ZX279128S_TOP_CPU		2
+#define ZX279128S_TOP_A9_PERIPH		3
+#define ZX279128S_TOP_MATRIX_ACLK	4
+#define ZX279128S_TOP_MATRIX_HCLK	5
+#define ZX279128S_TOP_MATRIX_PCLK	6
+#define ZX279128S_TOP_LSP0_PCLK		7
+#define ZX279128S_TOP_LSP0_25M		8
+#define ZX279128S_TOP_LSP0_32K		9
+#define ZX279128S_TOP_LSP0_100M		10
+#define ZX279128S_TOP_LSP1_PCLK		11
+#define ZX279128S_TOP_LSP1_ACLK		12
+#define ZX279128S_TOP_LSP1_25M		13
+#define ZX279128S_TOP_LSP1_49M		14
+#define ZX279128S_TOP_LSP1_100M		15
+#define ZX279128S_TOP_IRAM_ACLK		16
+#define ZX279128S_TOP_IROM_ACLK		17
+#define ZX279128S_TOP_SYS_CTRL_PCLK	18
+#define ZX279128S_TOP_USB_ACLK		19
+#define ZX279128S_TOP_USB_SUSPEND	20
+#define ZX279128S_TOP_USB_REF		21
+
+/*
+ * Top CRM resets: (register offset / 4) * 32 + bit. The USB 3.0 controller
+ * has four in register 0x4c; what each one resets isn't known.
+ */
+#define ZX279128S_TOP_RST_USB_B9	617
+#define ZX279128S_TOP_RST_USB_B10	618
+#define ZX279128S_TOP_RST_USB_B11	619
+#define ZX279128S_TOP_RST_USB_B14	622
+
+/* Low speed peripherals 0 */
+#define ZX279128S_LSP0_UART0_WCLK	0
+#define ZX279128S_LSP0_UART0_PCLK	1
+#define ZX279128S_LSP0_UART1_WCLK	2
+#define ZX279128S_LSP0_UART1_PCLK	3
+#define ZX279128S_LSP0_SPI_WCLK		4
+#define ZX279128S_LSP0_SPI_PCLK		5
+#define ZX279128S_LSP0_GPIO_PCLK	6
+
+/* Low speed peripherals 1 */
+#define ZX279128S_LSP1_MDIO_WCLK	0
+#define ZX279128S_LSP1_MDIO_PCLK	1
+
+#endif
-- 
2.55.0

