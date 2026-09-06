Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2533ADAE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716754; cv=none; b=YSn/WAc4tLcPwDO/zUNVXWcjHVfd5jQ/i4qqMAxc4oiw9tqkh8DH7dh0OtqdOucHjs+0ekTVBsb0zXlcsn+cVi7r008D70MYnjXQoSTz1m6jExSsx2Tec0Qg2DZGHakaG/d3vPivbf8RCpGBe1k5qhnqfEz4MKfDVBnttvMYzf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716754; c=relaxed/simple;
	bh=eTj+v4XZ/mc1fs4KGXNTWMfLWYAfDj0EedWktiYlkHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gt+03EnnChN6v2taJDbhVdY0AR782NevFJ1wSr0A9M1x+rjtGvMBn/ulpGCCvfyEV4uMWHdXZjQAhg510Y/Cc+0TPjMYYvMxLMOMdp8uaviJARKgmfcN7kTFwcJ3JWewVJ2BrmLl3XQUxOebmoo4fuPNqrpnaKDczfhgNF3qTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=iqShrAT9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="iqShrAT9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so23935365e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716750; x=1789321550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CaAy/OOlyYaqWLAHRZ+LDOoXJmE0/3wBUASyxhKepw=;
        b=iqShrAT9e7JfEmgnyioc9eKb1fqXFNjntNRZhBQ2Oa8ScrBWZsKTWcU8B7mz2LpAWe
         7O4Bx1AEdDqZADPXIEYvApnWtuPnS1Cbce2sE0T5R8gHlrJ2/C1mLwShWIKgWiPNOHYQ
         a1gTTFuHST37Xj5AKb2BHy91RXU8+m7wdK5hWbJ49NpglmmijgBgz3mw8Dt+oCV+m5ac
         rk00+lkxnMckvq/J22363yUZoeTnvPVbO+GvSqhNPFdiq2cBtGGUhdJdVqlDRWi6FKo9
         dtLuGvH+GPnp4YSouDS3feuys+LrIJRW95Pw4Nh7KIPSGqIqG7zLLW0dxs1cooNUnEzq
         FgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716750; x=1789321550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CaAy/OOlyYaqWLAHRZ+LDOoXJmE0/3wBUASyxhKepw=;
        b=He6AQSKs24wJ9wYe/gaqtLewgExFBpyHAooyC80gsed0/D1l9xFAka4UgVJE6VKY7x
         VZNHL+LtmH451v5jMobY2HexzVQwLISUv2DSEetiJ/14VjpBT7R3o3CRe2sdgshdURlc
         jyM4XLzHNtZ/GfTjYBtbdSXA84jRdN/IS4Fe1HvggTC18ZCUbm01bNvbrPAt3zvC/OWU
         WqvzVWePhFo6LANi60E+KEHbLVsaj9ksgzEOQ4WWBOIJo0r2OXZxzr41Zhh2GPNcO7j5
         oR0IfGKLa2pvFBj0ve9RzamT1VIuuJA9/z7B+IyHPNmQqGWX2GbS2p7G0OHpWCAqm4dx
         Khlw==
X-Forwarded-Encrypted: i=1; AKwUvBxczmL2IKKbIp8TlQkK9c0vU5Q/u9BaBtkr9OTr+58pMCsNm4XuHxfmxSXO3mFYC6WEEsWoRX+MNE90dpA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJPGOvygT2Fkc15UmDwUeXCnNVCJoTzeM15s+JnGnbbXEGwPBJ
	uCY89Qmi3Kg0YE2N/9BkBNEg71TsyFoUVEQc/dyqbMhvDycol6LED2bRH5TgVr/hTgs=
X-Gm-Gg: AYBFou0SxqmSZ08z3esyykRwOf6ZaidU5p0bfxmp7ZdU8FsLI645AsI7Mrd3IFykevU
	klBmQErxESRkgLe5VE+wIbpZnbvM1/+//XMPUUDT4sdcu70g0QFIk/o4Zkc4Ta4EHCan9NSJVfD
	Exj41wYNofLPTiG3dxc4EqM7A4fJa+FliGZcXYQlV+zR7VgLkUXYV+m6YMY27kLvboCFDuxn3+d
	/eFCxz0DjLyOL/vaOYl6sxYeCi5nHHKh9uXGMaitCmm3WnWidyv4gggHmz3qicIhZQaBXwbfHvJ
	6hV5w3CIMjzjiSh5qDCHQg7tnDfDTF9+ZuWCjA8pYB4m+u1WKYrsq41gFvdfxDCHWV7oPx8OAL7
	/A0YmT5vIUfTPeU6OsVw+oV8ghLJhbZQpTTtV8y63W32wTEUKWmPMO5ZSoGrEEH7fvWO64FvqQr
	XouB3nod0XbL6GMyZ4Ajk/vew1WLcK6BFeQGS6hKY=
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr182941215e9.4.1788716750222;
        Sun, 06 Sep 2026 10:45:50 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm245418805e9.0.2026.09.06.10.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:45:49 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/7] dt-bindings: net: add Airoha EN8811H PHY MCU
Date: Sun,  6 Sep 2026 17:45:37 +0000
Message-ID: <20260906174548.4106801-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711797.git.f@lex.la>
References: <cover.1788711797.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EN8811H answers its PHY ID from power-on, but a link is only
possible once its MD32 MCU runs firmware that the host loads over
MDIO into volatile RAM. On systems that keep the firmware files in
a filesystem, the files arrive long after the MDIO bus was scanned,
and the PHY node alone cannot express that gap.

Describe the MCU as an MDIO device of its own, with the PHY node on
a child bus underneath it. The device downloads the firmware when
the files appear, or adopts firmware the bootloader left running,
and registers the child bus only then, so the PHY never becomes
visible before the chip can serve it.

The reset line belongs to this node, not to the PHY node: firmware
lives in volatile RAM, so reset may be asserted only while the MCU
is not executing it. On a PHY node the line would be pulsed by
every phy_detach() and wipe the running firmware.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../bindings/net/airoha,en8811h-mcu.yaml      | 117 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
new file mode 100644
index 000000000000..7be0ab862266
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,en8811h-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN8811H PHY MCU
+
+maintainers:
+  - Aleksei Sviridkin <f@lex.la>
+
+description: |
+  The Airoha EN8811H 2.5G PHY is built around an MD32 core that executes
+  firmware from volatile RAM. The chip answers an MDIO address from
+  power-on, but the PHY function does not exist until firmware has been
+  loaded over MDIO, and it disappears again if that RAM is cleared.
+
+  This node describes the MD32 core. The PHY function answers on a child
+  MDIO bus below it, at the same address the core occupies on the parent
+  bus, and only while firmware is running.
+
+  The reset line is wired to the core, and asserting it clears the
+  firmware RAM. It therefore belongs to this node: a reset described on
+  the PHY node would be pulsed by that node's own lifecycle, whatever
+  the core is doing.
+
+  A board that has firmware in hand while its MDIO bus is enumerated can
+  describe the PHY on its own, as airoha,en8811h.yaml does, and that form
+  stays valid. This binding is for the boards where firmware arrives
+  later, so that there is no PHY to describe until the core has it.
+
+properties:
+  $nodename:
+    pattern: "^mcu@[0-9a-f]+$"
+
+  compatible:
+    const: airoha,en8811h-mcu
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      The GPIO phandle and specifier for the reset signal wired to the
+      MD32 core.
+
+  reset-assert-us:
+    description:
+      Delay after the reset was asserted in microseconds. If this
+      property is missing the delay will be skipped.
+
+  reset-deassert-us:
+    description:
+      Delay after the reset was deasserted in microseconds. If this
+      property is missing the delay will be skipped.
+
+  mdio:
+    $ref: mdio.yaml#
+    description:
+      The bus the PHY function answers on while firmware is running, at
+      the same address this node occupies on the parent bus. Only that
+      one address is passed through.
+
+    patternProperties:
+      '^ethernet-phy@[0-9a-f]+$':
+        type: object
+        $ref: ethernet-phy.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reset-gpios: false
+          reset-assert-us: false
+          reset-deassert-us: false
+
+        description:
+          The reset line belongs to the MCU node above. A reset described
+          here would be pulsed by this node's own lifecycle, and that erases
+          the firmware that created this PHY.
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mcu@d {
+            compatible = "airoha,en8811h-mcu";
+            reg = <0xd>;
+            reset-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+            reset-assert-us = <10000>;
+            reset-deassert-us = <20000>;
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet-phy@d {
+                    compatible = "ethernet-phy-id03a2.a411";
+                    reg = <0xd>;
+                    interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b23fb6f2f4ef..4ca19275f4d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -750,6 +750,12 @@ S:	Supported
 F:	fs/aio.c
 F:	include/linux/*aio*.h
 
+AIROHA EN8811H MCU MDIO DRIVER
+M:	Aleksei Sviridkin <f@lex.la>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
+
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0

