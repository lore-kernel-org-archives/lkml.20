Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7293803D2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259195; cv=none; b=tSGLgSI+OlWofgUdEYTvQ4nvwsO2Z0ax7emAYx7lkVfu4cXTpB2rnbyonlVj4flLh5+o9HFa2NwI0YEgw019+bBEKCJRb2YHAwoiIfDSRNyVT64VKRvHRupJNZ4hqCP1aHyewVYXCVT7sZ35f4BYERZ9ytzIjSNetSCYhm4+xN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259195; c=relaxed/simple;
	bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAYGiPRYPuHvG/40IH/zNC1dAEHwLWIworqnzfdtomE0rD1jX7EJCZZ6KAG569mb1gCP0+Rk+EF2PEyyO8Q1FSuolCx0pighFJMuZS3QribmCUhViSG2b7Y1BoWRNY4h6vAq1MW6wnbYte7Krm2Zpv/u/MiIi2h2hX4IFcCwmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BwhGhWIK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BwhGhWIK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BAE641A1003;
	Thu, 24 Sep 2026 14:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DF7360341;
	Thu, 24 Sep 2026 14:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C20D103294D7;
	Thu, 24 Sep 2026 16:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790259191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Y0MZScFajZWrkKqKqZGddXZHSBkTqkV4VwI6jO7es8=;
	b=BwhGhWIKg22Mmn+VW8vQyGRv4WPyX6MM1v5BUeB52GHWJuH1fUEmV4vP01kNsAc+n9FBt2
	knMpcG0HXR4fDyCm1xjEIH3lBt/jgcujBVhZH7ilU/w9fOXNsEBwGq3HHFDFv6r2HK45/b
	sukCh1HLUuRagap3GBlvm0WIg+tFLovPdDTq2aMDjVO26mkVJh+TvhhXd+R7Be4XqF5tdF
	R6tfuW1x9K7SCWOXm/azLKBPz4d3IvPxCzedZuPJeFKKojHy8bW3Eeaapn0dcWIaoCAcRs
	35UOHBhfxiFhIs+j/x5Qp0x5+M50i2+Jn3ke5Hk+WEk8SCoAtN0mhi6JCiLyfQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 24 Sep 2026 16:12:47 +0200
Subject: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790259185; l=2780;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=n3hyLzFoSxZdeb4xNzn2eva8ul3VuNt/ZX3nznZtTzE=;
 b=euSbKuFKc3kBjBcwjF+jcn9l2q5vIdKWw51aoUVvrR2VrHiRGRiC5hunR+qVbhpdBJOdxHZ3L
 HwLm22yQOx6BjM+7ReQGQA9T7yiPs/m+h6XRhCDk/IucZhmQ4W9aYux
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

