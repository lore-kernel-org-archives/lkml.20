Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3C3AB28D;
	Tue,  6 Oct 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291437; cv=none; b=D7BnY0ppAcB3YE+SZEpkXM4zdMOLRSOthqGlijyTe/moyOV0hxq0X7nwVgKec1hzlTPF6mu1v3s7nY2sbkQIDpzsFFeKJ9mEhv1whpJ6hThhghJVkbRgPMWiEKGds/nVxOiPLerB0q3Vwi3MvPiLQJ+ZjY5E8xmpgmOtr1o2QTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291437; c=relaxed/simple;
	bh=FLqniTou4JQnWTRSbyJYhIPig7BctcqFyncv79mGFio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t38ArRXrf+BI1UeRcvsN1emqc9fhO5Wlq2JeN0MQwLgaIiM/4a3ZgrnD82Uv13wz0TZ3Ih3V57WdrEf9CcjWBdshwj6qHr5s84ZamvhFd5B+zBkaNApK+b620RtZZCSez6S/EloLd1Ok1uiffOt/+1Xpjbiv8aPqCB3pip/AoQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YFbHjrJd; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YFbHjrJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791291435; x=1822827435;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FLqniTou4JQnWTRSbyJYhIPig7BctcqFyncv79mGFio=;
  b=YFbHjrJdx4bSM9g1PUcrOM1dUbw9CyeEJCwEApqu0uR3dcvJ6BrKon1S
   ANTuOnHU9nIkv75uSfis6NdHN8d6LU9xVKprUiOAnqZhndNW5cWGxiWVN
   U46GV1zOtS/PIuvxRIYZGA6qaz9OChi8h4IifJx6qnElUmfSM9kKoAh9x
   MjkWYJfjD4ZxTctaXeCeUdBD0/Jg79BLK/d6926kOmZNugfagn2aZe+jW
   CTY58d9nWJ3vyyJI1dsbE7pgPP7RWxpilejuJlX8ngdAuFzmyS9mCJ6o3
   NyvQ90uEtX22Ul+kA63GA1aoGOHyYrEhkQ7VKJ+fzzjTgtF+BuJerS0no
   Q==;
X-CSE-ConnectionGUID: lykOJGHeQZWsXJQN1pvb5w==
X-CSE-MsgGUID: SQruFuKqSCm55osgPT53pQ==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="63701584"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:57:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 6 Oct 2026 05:57:14 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 05:57:10 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 6 Oct 2026 14:56:33 +0200
Subject: [PATCH v9 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-cpitchen-mainline_gfx2d-v9-1-74bd3df2e183@microchip.com>
References: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
In-Reply-To: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
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
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9aRD/KuM2tmhYrfvascK8hwLT121sn1tdtM1FpmSQafn
 cSUz8bQUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACbyjZ2RYVKg9V/te5nCvI3/
 /l67el2u01Vu1bVXrKpSQg0L5y1d4cbIsE21bp5M3yaz8MC3xmv/eieUfyjwnf9lbshktUVhZ46
 K8wAA
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

