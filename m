Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933D3D6CB0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548594; cv=none; b=MqmfUCQLbHdGp21bzDO/O2zZy5XyWUm5e3yM4P4q9VyWsHDt4oSVt9Pr5quiSzu3Fho2mlOel67jSvpH3HD++KA3v19n1RuD2gWm5VUrrSbSkcMRQbS+n0D9zLFXVU27wP6548PQXhpTzpBHS/LHy1CfPFiJoUY+IjXVqnzAoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548594; c=relaxed/simple;
	bh=8R4/NVGFvwwBFp0K57CYXj8nWvSaeS/7ZTI2XPzrhfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYCjilp7m5a1foCaoQ7gMkYDislGDmuYkdsdACZO6aND7orhfYj5S0jNBH2dP2FDOMmffImAiyDbxy9+OEe5wMaayGpqxNaQR52Ki687w3BDZ161NYgWehiGgmtCSImY0SmfPX2FXeEofN3d4yeQM+ATWAM9ZxKkFX8/Rgdv1/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Hg9gWEjp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Hg9gWEjp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10927415e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548588; x=1789153388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf0aKsZ1iXAzFzECqXKGTn9Dxl8O6Scv1+EVxQaYW8o=;
        b=Hg9gWEjpFlpCWBIKgdC+r0KnvaBaPjFjwf12HsN02VdFc/i/PZWCJ8+twEBFuGRwSF
         XkCjTx3NPvw7pBjywkv2+nnGRHyEqla8he+6VScySpxjng8z1t5qKxjcI6QqtPMsiGTv
         4XrrT8itWSTjLtF3J6y6goGmkkKu43yqaOrPCiiJdvuIkka2gWqnPXrBvZxQyImSRBjw
         9AJKlvOE1pTP6524D6iDcJ1YMnMgeNMEtf3/wJqMa1ydWPv2XFDoLxYgdm7YKo+7FWiz
         7bZsjusPYtE9bFfNgoYJeTb/gM4sOS0lCw0cvYk2hGz49cJ3D3V/yXa4aEuylLoZ2FoF
         nD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548588; x=1789153388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf0aKsZ1iXAzFzECqXKGTn9Dxl8O6Scv1+EVxQaYW8o=;
        b=NkD8LGTt0pZyqEls9XL8g9gcf/uw9DZRj9HOs/ASFE10JdjK+1SoyBJKySKoQRXdLC
         uYSyx54F6fqycptpZScL5vs0f89QzBlCJ27r535e17PT9Nf8f38hJSGHtB654cCU87Jm
         T30kQRXvLEPBwmnxvOvbWl0GlMYj2Fnwv/UTBe/yxl0C57+GqFRdsfXA0oIpnj/Lbk1Z
         B5+SzhBgKLIWPa6efRGXcjGabM6jji/O310Q4qyqNLT723u+JBSasfM903MN1IlTavwu
         iAaywZotyr4RPEl4nAFcj954rBjzMAqvnTNWqfDbyyVz1S1YPtCgbMA3YZ0DBYsEQdmw
         eWZw==
X-Forwarded-Encrypted: i=1; AKwUvBxbQ2ilSsPmQKLbsJER4vVvRqWWz2npTtnetAxVXU0alP9T8UQq1W3mHYBMIVY8X3nKNugSHeO8cwIQc9s=@vger.kernel.org
X-Gm-Message-State: AFuF++keXYyHiTNNkXE9+ftxoFaEdxzbZoYqYPWHyrOCgIb734loTdQE
	9JtNNrcfa0EARoCvGBjhT1BtQEPd4YlKwuBfuofTgJsWv4cIcSRgi5ME30O9LRnjdTg=
X-Gm-Gg: AYBFou1da80agQAlAgHI9kr+WUMircO+/2E+P6waTA+NmStNgm1/pKxPxVNeUZq3j1f
	hdjSVcC0HhTi7nQzutYTkoBgQjVukkbRrmk8GyIE5P2U3xCDyK2WfxvrcI51y/rpV5OzSzdsjFh
	M+sRBZZ+jzA5J1raj1T6A8EeWOKsi7BB+W1eKrcDdjxchiYCjL3QO6+JaERg0Iv/EImvQcCbtsN
	DbyLyNTfUMenMzAPMmxk8QV0VSz7okDdWiO9I4XfFoa8YlSHsHZeH8/wYrGLBNa0epFCYuQ2Uza
	MI3WX3/gYmzfOqtYv2/4v7TdN6nAThGMHRI62rNxHz6SRMeu4l64Ohvx6CKLoUqeoR9ml0H5sLb
	exqRjDtv5/lgS3MAUYzwp657/YwSiJxk/Ix2IJRMNxsVwokC+vxyDWWvL/HTNUi1CqL/G42KPYX
	7NC9FqBvVezBP8miM3zYP6/SxXBAb5SR3jwF/9P48=
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr86205475e9.6.1788548587745;
        Fri, 04 Sep 2026 12:03:07 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:07 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 01/10] dt-bindings: net: add Airoha EN8811H PHY MCU
Date: Fri,  4 Sep 2026 19:02:55 +0000
Message-ID: <74144d4bcef8546126b66d9541ed2233a2c04aec.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
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
 .../bindings/net/airoha,en8811h-mcu.yaml      | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
new file mode 100644
index 000000000000..99a494f6ca1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
@@ -0,0 +1,96 @@
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
+    unevaluatedProperties: false
+    description:
+      The bus the PHY function answers on while firmware is running, at
+      the same address this node occupies on the parent bus.
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
+        ethernet-phy-mcu@d {
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
-- 
2.53.0

