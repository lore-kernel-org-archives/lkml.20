Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837549;
	b=CDgSshSJaz335mQfAbNhLJwSOpeDwtzjOZkAd3USw045wX2vp2hBEmR2c8AiD4x11kPr
	 ZMwXFYzHUhOx0Xat1xesJxxfIwuQRzTCMJkFMgT+F5R28qOWas2p0X2/sQPCMp4Kuv5cB
	 UkghbSUnmzF3k0lCky7TGDBUl/zvmuDyDsPd0WsL14MjMXACRNwJ3iYG0jhI25/ikebyL
	 A5gsYNxpP7XMwAOhu31rpRYbIiBvAA3oxLD3zLR3csmFjM5hD5+C0HxS9WiluUkikTn07
	 YhiNT1OCh99EDzSQWLEG+bRfHKNw4aFFA7GJPpNpfwnYvGLrCVwd3pT10zNR0Qz/y6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837549;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=uL8zUdscsuzLSxH3TIBRtn5i906XKgs83xavzgt4D5c=;
	b=CGPzmYZ4IRycZWDt/dW1h7ma0P7j6DUH7LXFB97Orp+BxNjfxRmIHMShDajlLivZyZkf
	 86bNN5YUWpLMASaGoBuj9kqbiIsQXhTr4QoJuFTcRtM3HL/mdfHpR0iFXhcMMMEx6lZrf
	 zLIP9g9ELtBe/BNSIEk/9lYi4n2dC/CYQ2/jo4/LtQFIX2IG7EtrLDQYYmXcpIw7agX8u
	 V12i7iaksYLLUGCNGgGBK9I8a0AAv/yqX9VYowRtCUxOG1STWJj5+/pW8FTqV/OOf/yNp
	 3cftJrELDlRflLmk4UiSVbOC3/TM47ux2dzjHKcifd8sUCW6Nw3T2yokiKzU4rQtTIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OLl1ZdQX;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A2606A323;
	Mon, 16 Nov 2026 13:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1A2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OLl1ZdQX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B7BF1A168D;
	Mon, 16 Nov 2026 13:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F15F6023F;
	Mon, 16 Nov 2026 13:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27B7B11BC0298;
	Mon, 16 Nov 2026 14:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uL8zUdscsuzLSxH3TIBRtn5i906XKgs83xavzgt4D5c=;
	b=OLl1ZdQXh/X5RGyMHBr9xp0gi8R+pBfLzc+V5rLDz7XxGva7FFlaGkBZsc7tfQWRQz7Si2
	Ev3QLmhTxNR7LQrBMj8ttIUmkHZJ5oK16kH3IQoIzOk6/bxkqz/T96tWN75RdUAdQf4nXM
	uzmVyz7jtVUSn9xT+cSgOJv90oFsEXYDqcC+APkzKbXq7UAHnh20Q/y62u5ulItANF34Oj
	DZNZhCWeHElIQAJ80Ha63w+Hc/Nlhi+4uwU094F0HAShvKnb35WTOivZ7SrscEBktGb0BT
	yYtOHndQBGlDxOiHeHvjAx8XeDzUrm7977vJC/ISX+HndbtWkAJKtBIhxpFkFw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 16 Nov 2026 14:58:37 +0100
Subject: [PATCH v4 1/5] dt-bindings: interrupt-controller: add Mobileye
 EyeQ5 PCIe MSI controller
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-eyeq5_msi-v4-1-2e1233b014b0@bootlin.com>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
In-Reply-To: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add binding for the Mobileye EyeQ5 PCIe MSI controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../interrupt-controller/mobileye,eyeq5-msi.yaml   | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
new file mode 100644
index 0000000000000..e41a92aec3b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mobileye,eyeq5-msi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mobileye,eyeq5-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ5 PCIe MSI controller
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+
+description: |
+  The Mobileye EyeQ5 PCIe MSI controller snoops the MSI write TLPs of a
+  PCIe port. The controller signals the parent interrupt controller when a
+  vector is pending. The memory-region property gives the base address of
+  the doorbell window. A port supports a maximum of 4 MSI vectors.
+
+  This node is an MSI parent for the PCIe port. The driver chains the
+  controller interrupt to the parent interrupt controller.
+
+allOf:
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: mobileye,eyeq5-msi
+
+  reg:
+    items:
+      - description: GCSR block of the PCIe port
+      - description: MSI vector control block
+
+  interrupts:
+    maxItems: 1
+
+  msi-controller: true
+
+  '#msi-cells':
+    const: 0
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reserved-memory region. The hardware uses its base address as the MSI
+      doorbell window.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - msi-controller
+  - '#msi-cells'
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        msi-controller@5840000 {
+            compatible = "mobileye,eyeq5-msi";
+            reg = <0x0 0x05840000 0x0 0x10>,
+                  <0x0 0x05840040 0x0 0x20>;
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+            msi-controller;
+            #msi-cells = <0>;
+            memory-region = <&pci0_msi_reserved>;
+        };
+    };

-- 
2.53.0

