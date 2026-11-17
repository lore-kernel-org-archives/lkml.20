Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936680;
	b=tvOlEZCI0uunCKaTMRTHhg6UttunJO7DmR7t0aGrn1CS4rRRudV9fbui9CIWRhblx6YO
	 w0ggXBmdYIk2pISPEWwVLARr8pi2zySNveGnA6/4X4qUWnG+3ZsuzRUCZnpG9pYDKL4Vt
	 U6QxHWwNfxQsiCuxkAyn1T6Jsl2ylnl0zdxu6KPaKoOFo57JMFnvp0iXvY49sLiIyZCR5
	 aBRdgP3PuuSNozxj6XRdJSoRdNlzgQgXSpvOMGXP6vn7n3a0m0kcg5l/4VNXFrn7CWCiF
	 rdIZigKimnvHdG3PPc/ilFVP6zx0/06102/ZqX41mcbSj/TCIdSKRqEcCEN03JTQj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
	b=nygVcbEyfgJEb9JY6udB4TwKbsoQ4LYs+lWaHiEokJuuOmWxMfyjcYFirp1gPjhB4jei
	 4MfvRlwZDGNGzb9jls6/Op6KZGFE8yBjaL6LlqsE0eQDZUwp0+0d/gz3IwVsGkvDMLqvO
	 U+k/vz7/IA5sjrKG3DLaJOn9W8Vry32paUIPMkRSYaX6j2O7HTbKJYIn47ozWfuRXm85L
	 fX5YaKaDuyIczd/Uce4o87q65Rmdu325DE16BuueOHr6nJzJxsPJDmTR1fWplXVsc4mFk
	 x2IU1zUJbFwIhNJdjzMLr8c9UfAeHcprc4zm8hmnu4jHhmtAzUezaO89Dkt0Kt67SxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e6ei50fN;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CA606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7CA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e6ei50fN
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so1084345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936679; x=1795541479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=e6ei50fNgiwaj3Roi4rb3gGbEqZtS1SvoZVotqNQr6DGjS/FJL/kSWq2LkmPPk8+/b
         4N3Nnf/1clgVjhxFZ33uG4feiNDB5Kp1y/63cOEVQoFud3nRRr+B+pT3boauzhPKbbOK
         Ku+YPEh9oppI4L/MjD+Rqe7xRFpMTU+ZKEvczeyByOLPooVSd+kObZCiuWmBMoYsofSf
         TtZRJmnonzG6IDoKP82vSaYQmSXiJLgN4mHEbPCeI6UmFhlXydcvI2VrvkzM7aF5ZQnq
         XX1yqEuiWNLszLgw9abNaPB3KEfLRBvJ1FfNMefRkLDG+zWA7pxzPOqm76BtM0d8HYUv
         e8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936679; x=1795541479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJuJ3fuAuVzPsFJO1Ot45ACKv5nIG75pwulMSwBfSL4=;
        b=hGfWSFmqbjBc72rjRzjF8cdN72ALKAWMhMz8U7QQlgsYjiOP0QabFX4HhvwxC2NFph
         W94y8MpQKruEcfViQEG3t0tSfOXSa1Uis5KPBkb7oakg8mJDJX8454ekS/SxlzSMlFCH
         ogz9BcahLq7hnpYKLv/xsW0zI+lTGNF80tnDBh3A1tlSuz44Bjt1YeMSgaduuXy8rNzj
         3WGFysCsdgAtMuH/SaAq3KjjZDuSlFQlXu+jE7hapPs2U6Z9wX1rjU+CisMGx4D3R/9Q
         lY/QSn4F8+1ZO214twAfvUEyyCS3PV9j4SlBkIJbEWr/wXhi6RwX8XDKt55CpIIklCX5
         y1HA==
X-Forwarded-Encrypted: i=1; AL+hErE2emv2LuQ7pIySFgHtH82A6tgnm8U694WONX+p22U4obCYfWy34S9HSA6rZ8wpELc3oBboqUZmBZYN38U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MB0fpGPUSHBhLZWTtGObl/SPxCu1ZXRgAolnZB216gyHQMR2Z
	nvzJ0QdvgIPqAceRM8FuUoABxQQBjZrCSkhgBsg9nCasy2gtWQLgDBq7xW2CeKmdBL4=
X-Gm-Gg: AYBFou1yOvp04UnuJzx9GZYZHaMyVUuS4bBsGlNGcC8Utwb1EvVTuPww8PjkaQGHtOe
	pOiWQwvWzAC+3iRtMH9ux9B/gMNnaElPuhO59gb4tHBdXU/hmwbdiF+z0nM33/LVdCxY4FmqW94
	zRqFF266uiikr/dY4DI/8yBIRset72Xt9NOo+3svCaSWktKPqhFTSPXD1p700+IkOZPeH6HgRGs
	jfg30rPgOtBdaqU7k1+r+IPVs/Pvw60WzsVNZjAcBopz30TP0sOzcjwSsaXdDxJxkGSg4Rfc2pj
	ZK0STOb/7vcMvhJ3D/DlG9X3XxxcTllK0UXbvVzxIVovsC9afBbeWKa+Ndvn28r3KNhYVE9f9vX
	dIeOKgL4eLhQ3KU8KKK8HicyzI/iCvTd1OD9k7IkwHWY7quVnJfdKOxdtji5ldjl3ERdZue3GmM
	ylaGb+4tndhKTLlArBDKsHaV/lzjmesI33H5vluaLN+/ofLlpzXkDeFYasE2FUaNJ2MACUrXdX/
	JzWUj2AGymzLEEYVEU1XQm+6hwgfqEuOKJW2vN+U6oIGxc5rTm7coI9Shfbyvpga8BpWKvn5C0L
	D/N+ZbVfKUUpRskTMd5x+6FW8R8MgBGBl+CmHPOhzK3cHgBGLyj8OXjh
X-Received: by 2002:a05:600c:3547:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb55a8a402mr298153595e9.28.1794936678575;
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:04 +0000
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: Add MT8196 SMMU
 wrapper
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
Message-Id: <20261117-mt8196-smmu-wrapper-v1-1-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

On MT8196, a MediaTek wrapper holds the integration settings of the
multimedia SMMUv3 and merges its interrupts into one GIC line.

Describe it as an interrupt controller, in its own node next to
the SMMU.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../mediatek,mt8196-smmu-wp.yaml                   | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
new file mode 100644
index 000000000000..b841d9d0e3fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt8196-smmu-wp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8196 SMMU Wrapper Interrupt Controller
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description:
+  The multimedia SMMUv3 of MT8196 is integrated with a wrapper block that
+  collects the interrupt outputs of the SMMU into a single interrupt line.
+  The wrapper latches each SMMU interrupt and keeps that line asserted
+  until the latched interrupts are acknowledged in the wrapper. The
+  wrapper also holds integration settings of the SMMU, such as clock
+  gating and system level cache attributes.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-mm-smmu-wp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The SMMU interrupt source:
+        0 - Global error
+        1 - CMD_SYNC complete
+        2 - Event queue not empty
+        3 - PRI queue not empty
+        4 - Performance monitor
+        5 - RAS critical error
+        6 - RAS error recovery
+        7 - RAS fault handling
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    interrupt-controller@309e0000 {
+        compatible = "mediatek,mt8196-mm-smmu-wp";
+        reg = <0x309e0000 0x1000>;
+        interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        power-domains = <&hfrpsys_hwv MT8196_POWER_DOMAIN_MM_INFRA1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..5cc65a753ad2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17223,6 +17223,12 @@ F:	Documentation/devicetree/bindings/memory-controllers/mediatek,smi*
 F:	drivers/memory/mtk-smi.c
 F:	include/soc/mediatek/smi.h
 
+MEDIATEK SMMU WRAPPER INTERRUPT CONTROLLER DRIVER
+M:	Alexandre Mergnat <amergnat@baylibre.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
 M:	Daniel Golle <daniel@makrotopia.org>

-- 
2.43.0

