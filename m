Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E34D1F8A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421061; cv=none; b=pirvH+tJjDuKcPzR2+/wxJtS6LMONfnBOTQaSak117Bs+Xt70hoENi+uyw4FgPTDu8a+C81LLDl6zoAR5aGKnp0RzdktiIDmoSnnPZvEzzVIxKe3Yqvhx2/2ztYf9eG86HRLrKPXsUDOy+SNDznx97UeqSDEL+i6FFLQb9WdOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421061; c=relaxed/simple;
	bh=DmO0O2dRv9MTdJBb07f31mKx2vPQz/W9pdKFXGq3N6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZ0UROCrQkdj4tZ2L70P0tzA1+WeRBUl7b5L2bQKGfRu0BGZlKMyImSdS32g18/1hdot6Wcd5wThQEORHN48/cNVUlOsWLPvN3Z2YKGvEcXGqo2Z6e/3ybE3v68cTajVWThicNVTKRgekS73OyuIgc1XqPdng+fLV1lChHxGw4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Puy3+NJW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Puy3+NJW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0822A1A126D;
	Mon, 19 Oct 2026 14:44:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D06D360582;
	Mon, 19 Oct 2026 14:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B15210328D5A;
	Mon, 19 Oct 2026 16:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792421052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S1lkipbHNbs7GuDexNjAVcya4EV2X5eb41MjTrEAfkM=;
	b=Puy3+NJWWezCI1q8fsTwITM0D3DoEPM3fJQTBrZ+ur1dahc0frFcrG0lzcvHc0Y5BADOTN
	NEa4CE3OSKahrz4tIMKRAQVoqpy3kDZAZ2zeExHSmz09feZjRwFjO5bFKzBfDQRgBscAxi
	P3SxJwBO9H2wxCR5kfgdMjPK2TGGGK4cuVglyh2J7OGWpJhmD44yIr9Fbb0TpjAAAjwzrz
	JSYMHCiqVcRScrVge91piRTbz3WjjFirr427B2rz/okJTV4pnjT656CvwSMTvishGnMsFj
	kfjmiYHOPyGmTvxaREM+6BpjzUcTxhuw239I+ERgGVqK2NVj2CxSXmWj2mRd/A==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 19 Oct 2026 16:43:25 +0200
Subject: [PATCH v7 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-paul-v7-3-rc1-edac-v7-1-84c76c6d7595@bootlin.com>
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
In-Reply-To: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
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
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792421040; l=2885;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=DmO0O2dRv9MTdJBb07f31mKx2vPQz/W9pdKFXGq3N6c=;
 b=yB+W7GInWXWXYZqNCQLUW8fXbI0C2myCGNt+veMeHWGlDFe4E/OAiCHtCgiE6LzwScl0ZPF9c
 1ZbwLKw4C0zDmJviTUnUvDJfeK20KQCKAZ8D5qDXJYB8qB86P1+nqQD
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add the Cadence EDAC dt binding.
The memory controller optionally supports ECC SECDED with DDR2/DDR3
memory.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
new file mode 100644
index 000000000000..9414cb9c59b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
@@ -0,0 +1,61 @@
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
+description:
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
+    memory-controller@4000d000 {
+      compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
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
2.56.0

