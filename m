Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EE93D649F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475910; cv=none; b=MH3QfarrSfXHRlbWz01bxyzn/SPB2drFJWBc5HyrG2xuLyxMDo4rTUEDtmxe75sEKuhMql8/ef7LaeUrDUTbJS9K553WdvNtLdS/tfqomYSTU0BtSqH8G1+l8emi3E4mYKqv7uapXPGwlWGXDJc64hv6UGTrVXAH6ROQdUnSvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475910; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqccgsMimv/Z2thBkPF88Ycvd4Gm1BI9FXinjV6BshQ4CG+8xRxopADaB6Xm8Ove9cx8UEDq56xuaufUsyhA9NX5BYZVhAvvDrrIn5ToJL0gJvLk+IWalg4BlzajvwbwqhoqCH5gSvq3IQGhcTgxd+jYGvPZ+yWz7w6j0VbddyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHuDjvhk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHuDjvhk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so27614055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475906; x=1790080706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=XHuDjvhkpfjjroKtuJvBdH1GP2adgn85txZ3kkfo868eqPh0bEZ1Zri65czug5ym3C
         6512mXmJ0rPVdFcKSYhvG/LiX9lFQ84vng7yy3AnuGWwuh3eR67pn8Ed6Q/nydbCe1qK
         jDJN4OFQe2upv9VrFOdnAqFP7i44pB8ptoRMgj9fz1SAIcgbutQVxtyDroNH7C5fStjc
         qg3+/Tb2KHmAZ0aEPAsytEUF+BsxZ0yrwjU6r8Fax/1kAGvLmqi0uA1xIxLWaLaVN4qw
         06CKTabqCks70lFOYBArMm6z7W+9dZPwnpOXEhjNDtX09WHHyD0SLPrxUSuW8PHXcz3l
         KndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475906; x=1790080706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=1/LaRck7u0RyXiPQzms8+jMFgw4baTYJ8cUcOAzTo/carGvO9szc7LSnjUV4nCAee0
         qM5dUjiIJGF8yBNrwdrFXucYyYX0wCjUnyD4kcgTvwtv/W6GVdHyVJSmerVlFr03jOJx
         jP7raEe3vkHACAYsgP6Xtqk1vHyEz6jhjVJYSMnnMz8FM2qY4CY12ORj7Yn9wSbs08Qc
         LSo/32Xg6EyGHLdxfVrOJceHgGNZlme4JgWEhE6Do3k+/Zjn4ahwusBCdVQpwsGTOwui
         luUYjYR/ZBuUIWcZmAUmY4Q9BZf8NptmdE5ecZyfCOLNaJ+Jf98g5fv6b/+64OkJmee9
         1xhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPb8dxxxBCv5Q6/uWvYZ6AcNoaoWwYRV/4ddYgEPEn9hpkICWO4VqHhjI+z44D5sJ3s2ZLfQugnjCxy+w=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpFDpm4RjCAy8Ca8osQaekxVNUbvVWwciXQGjsric1Zu5F4Wa
	0021bnPaM8cYi1U21GbwNODkVcw8Eqx0R4u/OV5ERDgoFt1runRCvF0d
X-Gm-Gg: AYBFou1aqkbOsorvP0axxuB9M9dEV1J4YM4olqIN9S9PZcSuZPYBt3brHpvcY8ia0N+
	aKMGDNvsWD83o+vGuod2UZ5Kw2U29CsubMiPNZCEWhaXY6OqXFcGcHhZxv/5nebE8zYtL8eydnh
	xEqcBibbaXUcatRZ8LNZ/EG8kXC8WuDRP2wE2zOG6JYWsnyFgw8zHco1Hv2XVxkquAH7W9zzMeM
	sqPAFyChCVi0NFNvWPP/oy0IzAzpM9Tkxxftu5d3MWpU6Yem6EzdCcfm56ke0/FDOmQZWnA6xC2
	58PKOToxIJyYExfXdHqcWw2hM/AaPNjfzrodRlmCbJW3Fq96mIEX2X0piAA5g4WaBC3cYQP/bBe
	AFqSGF0fRUHXxFzfMYYQylok6KW+tkM5bf15mBCCSkxnB9CVbg/cfaedn/d5VZG3qmtaw7TUgcp
	XK+e6fEL5z0JRVdGHmCgFKovdyKoGc9BG3FEw0aY9W9JLuSSKFOhEUR8TVsfowO+qOSVB66jnF+
	rCnXynDtGShtbSg6MHEjlNFku9jCKbVY1UN4p59w25iHpXA8fBNGulfNsd1GXMj
X-Received: by 2002:a05:600c:3b89:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49e7a692d5emr106570525e9.24.1789475905719;
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 15 Sep 2026 14:37:58 +0200
Message-ID: <20260915123812.14747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.53.0

