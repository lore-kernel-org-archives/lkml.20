Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE23932E0;
	Sun, 18 Oct 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339687; cv=none; b=QkFO4tJKcNcHGuJHlxvrz3WLDeASta5Agd1AkaW1AliCxlGY6ewt38p4+5dcfDZAmag9D5XeHxJc8rN8regSCErs/7SMDFD/JlBtkAfrqKlReNnYK0yqIgkG0+1/gVkeAJIDb17pYphSISyNZqeDe5t89wBL+NbnqlRTt3CRmXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339687; c=relaxed/simple;
	bh=hjE640VxfshWCrb7WMVB6RgUdenssAP7+7XtbFDW/Tg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZyBIOhYgBHrJuj7jzXf6JvpLiexa2VPhDhS35Oeoi6JsxjHNTYrl3lJn228opUhVNvonueRHv2WexcJvl1Bryu1/qtYOehplJ0lbokhQidUwUv4FQPOIHBoj9dSHoteVPgS+Z0dHX0kfDYr9vh/JkCW7UPRSsW1bLbaa32is8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=lGRUi1+q; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="lGRUi1+q"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rk361115119, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=1c75o/7n2ITgdtepV590AFYrUcMlp+WbRILrdLNtQqk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=lGRUi1+qeVeHw1+NkCwS++fQrNIM10ttoxFChrtnMv60AaEYcVM0ff2jb6+fFFj8k
	 jVWOJIZ6fkmsWCAw3LzOEcwumX3cebt0kgAqKax91mVUOQzixjYpVw+EZ327f7c/Sb
	 tDsbRCM2Baoa0v9jLttyryzlkycjUodn3bzSHEGSMlqsNYAX50p1Tr1fDrP+IcW5xi
	 p303gafTZS0gor2MYHgl0V/cHUk+ZfuYkeQhijUsI1A8Wmy2SepwX1yVtVmjQcURMx
	 ktINhRwsC6bvAsA5i4zbX2juoGCHxTPvlpOSW1v7SCkW6wWl+UUkiXJgf1fyGt9XAw
	 gqC7rJWMTtghA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rk361115119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:53 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:53 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 1/8] dt-bindings: interrupt-controller: Add support for Realtek DHC SoCs
Date: Mon, 19 Oct 2026 00:06:46 +0800
Message-ID: <20261018160653.3940371-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: James Tai <james.tai@realtek.com>

Add DT binding schema for Realtek DHC (Digital Home Center) SoCs interrupt
controllers.

Signed-off-by: James Tai <james.tai@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../realtek,rtd1319-intc-iso.yaml             | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml
new file mode 100644
index 000000000000..5540f6304795
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd1319-intc-iso.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC (Digital Home Center) SoCs Interrupt Controller
+
+maintainers:
+  - James Tai <james.tai@realtek.com>
+  - Yu-Chun Lin <eleanor.lin@realtek.com>
+
+description:
+  This interrupt controller is a component of Realtek DHC SoCs and is designed
+  to receive interrupts from peripheral devices.
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1319-intc-iso
+      - realtek,rtd1319-intc-misc
+      - realtek,rtd1319d-intc-iso
+      - realtek,rtd1319d-intc-misc
+      - realtek,rtd1619b-intc-iso
+      - realtek,rtd1619b-intc-misc
+      - realtek,rtd1625-intc-iso
+      - realtek,rtd1625-intc-isom
+      - realtek,rtd1625-intc-misc
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description:
+      Contains the GIC SPI interrupts mapped to the external interrupt lines.
+
+  "#interrupt-cells":
+    description:
+      Specifies the number of cells in an interrupt specifier.
+      For realtek,rtd1625-intc-misc, the first cell specifies the interrupt
+      bank and the second cell specifies the interrupt ID within that bank.
+      Other variants use one cell to specify the interrupt ID.
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+  - '#address-cells'
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1319-intc-iso
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: RTC interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1319d-intc-iso
+            - realtek,rtd1619b-intc-iso
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: Watchdog interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1319-intc-misc
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: Watchdog interrupt
+            - description: Uart1 interrupt
+            - description: Uart2 interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1319d-intc-misc
+            - realtek,rtd1619b-intc-misc
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: Uart1 interrupt
+            - description: Uart2 interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1625-intc-iso
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: Uart9 interrupt
+            - description: RTC interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1625-intc-isom
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1625-intc-misc
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Miscellaneous interrupts
+            - description: Uart3 interrupts
+            - description: Uart1 interrupt
+            - description: Uart2 interrupt
+  - if:
+      properties:
+        compatible:
+          enum:
+            - realtek,rtd1625-intc-misc
+    then:
+      properties:
+        "#interrupt-cells":
+          const: 2
+    else:
+      properties:
+        "#interrupt-cells":
+          const: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    interrupt-controller {
+      compatible = "realtek,rtd1319-intc-iso";
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0

