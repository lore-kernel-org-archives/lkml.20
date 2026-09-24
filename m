Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDBE35677C;
	Thu, 24 Sep 2026 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242272; cv=none; b=BFnSBWsJEsKDgzwBHrKX+eRBdxVVLawDO2L9kyr9r7o7wAwkszx1XckaGcEJt/TfMH23Ceza5T7nFC99k8/46TtZwaciiuNrYXbqHBrg2MfpovWJhdxNf3jEnw9BuUpsX8zzU6n6wk7rij1JvRHApPtVmEXFGz/HwJ13zFjaWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242272; c=relaxed/simple;
	bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDPVQ0H10jOhiH2+WeIHH5AM9swNI+AKrbDukXhWivjQkhqK90i+uUBslHT68gjhiYBsXi88B6hNqpae2uYqzgVnv5T1x2U2nQYGQOkRhD0THfHyL8GHdHil3kBkusniKlIysl/RsMXgmZP3wyJOHT+tsQ356ltVpOf+ZC3pJOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cbjx7603; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cbjx7603"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9AF601A0FFD;
	Thu, 24 Sep 2026 09:31:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA6D5FB45;
	Thu, 24 Sep 2026 09:31:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB50E103294DF;
	Thu, 24 Sep 2026 11:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790242266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Y0MZScFajZWrkKqKqZGddXZHSBkTqkV4VwI6jO7es8=;
	b=cbjx76032+yxA84PRpvb/hbtbgfVA165PZVk6QEPTiYwXar/gI+6fE6cqGL4TlI7BDymi2
	OePdTECG7g7rb3EkZ32aAxAypmyTKSsyaKD8uPyOagKkR+GyYu0VivI/0iNsDRf7tqSdGA
	g9BFcsG3e/OouaAD7txW5LRJULvYTgvWuZbNd213Y2T4zXRK4cgNmp0q3ENIvLLM2C7NXe
	G+yypfxKNhMBljt7v4h755j8oMNudokd6nnGKzyzFgQ76hYzlwyktrJZu5xI3017gMNBrY
	p2zrhlCaS5WnWXVvFDXZqYa6sSBFdiB7sxjxhV2LuHEQmzC39mw8O3KJPlExDw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 11:30:25 +0200
Subject: [PATCH 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC
 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v1-1-70be37c41a18@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242261; l=2780;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
 b=2YFbjH+z6vyy6L5CjY4RYC5+B6C7fNkReith/uoamBCdeWV0C5sxIfoBHhlUOfcBgt8u4fcPS
 awHG/JFq2jxCzhVn/0cL8oDiA82sOe7jNTw9mrmyvMGf23HY1osY1jj
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

