Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858614908AA;
	Thu, 24 Sep 2026 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257300; cv=none; b=U7wDhM6eoYyfcoLDvZ+CcFn9RQPq8arxbcS1nlh1U0jBZ25AZRzv2S6ZDrXtzZrhzM+ITxikdV8hzmNJ2N2WH+xoqSAikv+sALhpsuRBunRKdEnTuasYfVgi9Jj6oADDbAWQtlD9kwZWjOHhuybjM5O3ZnxDXuqrlA0WUTTim4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257300; c=relaxed/simple;
	bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARHW8/3BL/Uq3xQay1qCnFliGFHM2RJ/FhY7Gk9pRdHTUxYoY4fxi4MPjvqTinYcJ8XDt3hemvFaLnFlcx1q7/XH6y8zgCHaAaZy5gDQzzwV2B854fL3rzt/1SG2jJi0c48Hotd5/pH7dlER4ruFUtsQ0lSa+JjzB66aMkhQU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QF0rq+O1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QF0rq+O1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C138B1A1003;
	Thu, 24 Sep 2026 13:41:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 969816073B;
	Thu, 24 Sep 2026 13:41:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EA36103294CF;
	Thu, 24 Sep 2026 15:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790257288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Y0MZScFajZWrkKqKqZGddXZHSBkTqkV4VwI6jO7es8=;
	b=QF0rq+O18I2VwjvhJS+3jg0xezQfsv0z9HZd6ln8QcyhBbIPq1LgGJ61gaO+5ByaFO59J6
	DREU4rq9/arPDuBZSxOLtJdfV2fQ1rHxopwHFY+igXO34ZvHiNBPq9xNvUKg7yLu10/7Nb
	2SmNH8DGEXvQjJIVNBMB5Rya7n2t1S3GZOQ2tuCaeWu5oc59eaE+I2EOl/LdygLRHaSl0u
	gmDJABXX5SBphC55zTG73Uz0PpWmdatuWEqx0s7qxVoIl27kNjaZTVpkpnd2i1beZmPupn
	maEjChpKKGPbYb3C4nPKzaS7U+7OvkB6do1I1BpMejzTr3n+MMhLh0BUn6VkMA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 15:41:12 +0200
Subject: [PATCH v2 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v2-1-bc1406161ecc@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790257282; l=2780;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
 b=kkkImN/8LWHQwW7sqjT+sNjHDXGWSEEhArNQxheEyEJvmvrkQgGpGKJBww4BvOrnY3LfIYxfm
 gMV2QCXHQ+dDmUPICIRnyqc2aZ6Bit82eu7I9HtJYCEab25pzv0f0Nb
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add the Cadence EDAC DT binding.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
new file mode 100644
index 000000000000..e0deeb3dfb81
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/cdns,ddr-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence DDR EDAC
+
+maintainers:
+  - Paul Louvel <paul.louvel@bootlin.com>
+
+description: >
+  The Cadence DDR supports DDR2 and DDR3 memory with or without ECC.
+  The bootloader must configure ECC mode in the memory controller.
+
+  The memory controller supports SECDED (single bit error correction, double bit
+  error detection). ECC scrubbing has to be done via software.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
+      - const: renesas,rzn1-ddr-edac      # RZ/N1
+      - const: cdns,ddr-edac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DDR controller clock
+      - description: APB internal bus clock
+
+  clock-names:
+    items:
+      - const: ddrc
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    edac: memory-controller@4000d000 {
+      compatible = "renesas,r9a06g032-ddr-edac", "renesas,rzn1-ddr-edac", "cdns,ddr-edac";
+      reg = <0x4000d000 0x1000>;
+      interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
+      clock-names = "ddrc", "pclk";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..60db3734df5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5760,6 +5760,12 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	tools/testing/selftests/cachestat/test_cachestat.c
 
+CADENCE DDR EDAC DRIVER
+M:	Paul Louvel <paul.louvel@bootlin.com>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
+
 CADENCE MIPI-CSI2 BRIDGES
 M:	Maxime Ripard <mripard@kernel.org>
 L:	linux-media@vger.kernel.org

-- 
2.55.0

