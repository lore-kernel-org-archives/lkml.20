Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6636A358;
	Fri, 28 Aug 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932396; cv=none; b=lUrA0lVEqPRwLxjGPWzfxs0yhwWzCrXqNO4gD+UtoVSufktZutJ4OGFQ6YCAjVczlnP15NQLKH3eILAKi++6Rrah1IA57LUXX64Cb7R3TY9t+IelcEbpAVwQwNAv2PNZ9ZCBfG7pzr488Ga7U67C4VKDd/TkjRT0oqICnE0UvC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932396; c=relaxed/simple;
	bh=FLqniTou4JQnWTRSbyJYhIPig7BctcqFyncv79mGFio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eBeVsnuMdmFIjc8DyENDQPq3aLC+B81IubqGSsnsnYaimjgOMhhKVrTXtT1eYVdplePG8XzO/RkQ8RufAXx6Gb91Q48gZ18W4sBRqOWzAuZ334AyUf1hV13g77s7BufvyBMoWO6KdwddKSxtFtHsFmufzqg6tZco25PYqWiNeQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HKwODuj3; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HKwODuj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787932396; x=1819468396;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FLqniTou4JQnWTRSbyJYhIPig7BctcqFyncv79mGFio=;
  b=HKwODuj3pEEiw/YFWdrkO25E2iYEc1wA26f74rXZfthV/I8JYXyN4k+8
   CGtTL9LNwmP9jxYnRJ8FzLjcBvb5H6lyrHJ3PZhNv0H4A3eu3VtLJgRxl
   BR2FUlmBClolRnVuYZy+PcVeX+Y1L6tCT3J/DkJDkaEJFbK6VK4ejD823
   glNSuKMEJb6qofIqM5XsBomiwUOd1EldaDXYleL9oSMCQUsSgXtm/Gh87
   55M6qBnZ4Ijp8F6LA8r0kI3DLNHAvcx5JOQoCPZ7Vj5b6m9CqAFgjdAPl
   hi0HrEHtw3qNZWpcfd+zReN9KXpojywqBB4Z2fOwEIAuRsHee39GA7tPy
   A==;
X-CSE-ConnectionGUID: XVQXe42zRDKb1gOa0/aBNw==
X-CSE-MsgGUID: d0/AVLrdRw6PAt53T7pX7Q==
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="294208078"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:53:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 28 Aug 2026 08:53:10 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 28 Aug 2026 08:53:06 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Fri, 28 Aug 2026 17:52:22 +0200
Subject: [PATCH v8 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260828-cpitchen-mainline_gfx2d-v8-1-378374559738@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=FLqniTou4JQnWTRSbyJYhIPig7BctcqFyncv79mGFio=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bEdXd25EV5hxgXKWpX1G2SfPPpYvas1seqXldfFJ+6E
 PBwxh/tjlIWBjEuBlkxRZZDb7b2Zh5/9djulagUzBxWJpAhDFycAjAR2xyG/648xlPnZ3/5d1aw
 xZfflX9laNfGwjXMxx0ybP69LF3GvYnhfx1z04mpJj4nxJ/sqpvnuSvyDjuXpVBNa+u6T2Uf63w
 5+QE=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D

The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
Describe how the GFX2D GPU is integrated in these SoCs, including
register space, interrupt and clock.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
new file mode 100644
index 000000000000..1c0faef83900
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/microchip,sam9x60-gfx2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip GFX2D GPU
+
+maintainers:
+  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,sam9x60-gfx2d
+      - microchip,sam9x7-gfx2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    gpu@f0018000 {
+      compatible = "microchip,sam9x60-gfx2d";
+      reg = <0xf0018000 0x100>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+    };
+
+...

-- 
2.53.0

