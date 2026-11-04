Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797100;
	b=DV6bFU7EIV99UdEnXubC8k1G4brMmwHk4304xig8E/yRDCheK1NOCMM7sOPBFI5tU90P
	 3N0KTNqTw0JEW9Pz3yo5g2aeGbfcdc80H1HmYgiTvtDMHE8KV4oh0ep/P3xThetDFHztX
	 +wJy8sAZljScW8rPJTqNZHJodb3uBAftACjO269eXFco8OMPeBGcy2WrO0bMCh/JkTDRn
	 sJYDTcOYi7xa8eVzrXlV44yzCsvSfJa8gtBjTRqaaJ08V8Avp6f9Zqfwth4QSyXCvCRkF
	 //MJAHCClZI96HMHtsfDzwt/lEoIE1VbcgqY83xZkxi/cCLEuqIBzyD5nurWjiaNcHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797100;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=W+r/xUtIUSwzG4wcoOPjBbcvEe6Z3PpBnex3cnH/dns=;
	b=38hAAJKmvuA+hZ+VOZmSKqdycallllJWRS2UiIQzsLrou4HL8RqlDhzVYbaJLImtqwSE
	 6eResFyEY6NoQyZOvNYaHp33+Nugn2cAQhtZ/zDpvQCcq5zKXBHky1mgmqDA+OOb1k7a0
	 QGa3we/5QExNdH/bMfoCiKTb14mZY0cDzCcqXCVPJQkXR3YTIbR2nBAZh/9pGM69Irwqt
	 Uxh93TQdhDkEOy2oVzxPcCoAoSKXbnl+axJiiJwZdvCSziJqJP9qeG31BII7fJ+DuoHzo
	 0bERXSS27/sVhlaXoMVxwcW6KzNMolcd3iiNoSWijmFe2sGYJjwWIk3XAOqYi5w5tNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YixDGG+q;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E107606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E107606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YixDGG+q
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D6CB1A09F3;
	Wed,  4 Nov 2026 12:58:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2890D60779;
	Wed,  4 Nov 2026 12:58:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0202A1032925B;
	Wed,  4 Nov 2026 13:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W+r/xUtIUSwzG4wcoOPjBbcvEe6Z3PpBnex3cnH/dns=;
	b=YixDGG+q1etppxmCBYnS4xUJmgoLEmlLe8gAT5ASxay93brj47sarNJpx5Pr+P1o4gy9kB
	5QdUPSOJpDWdURiom97nQabGeFx001g/k6hhtOyZI9fQhaiSHSimIyf8hfGNFD6qt7dUs4
	e/B+uxR+zZCazal3DR1Qu1N1bC8SgWYR987vXDPAH7ZYNnueCULkLz9vleYaZmQwZoOK7A
	igyITtB3ZuX1oWOkSNuPMjso/Saq254bHXCSnl/0oLr7R17q1SGpp1FnIrbx3yGPp576xl
	qp+e2zvTrLI3+IsJTCwiUdRhFQ0AzwxDGW0qFlAhrfsiQn72eoVOJWEELQinkg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 04 Nov 2026 13:58:01 +0100
Subject: [PATCH v3 1/4] dt-bindings: interrupt-controller: add Mobileye
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
Message-Id: <20261104-eyeq5_msi-v3-1-2866f732cd38@bootlin.com>
References: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
In-Reply-To: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
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

