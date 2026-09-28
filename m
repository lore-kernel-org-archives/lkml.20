Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522D34F5E1E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624761; cv=none; b=BxM79g6ZPiw85GHGpmNGBNhdSbFqtj3tkRJwzh2mepM7fTeFFBNdftKgls5PSgR9kB2oQH5mJg6/Ogz+utmIILsAUkl0hRBUTZHRNbpd86VOpFVkMClCMCXS+9aInts84LoZOXQa0WYEOSjm7I0UWGOsH4MZtkH5VEU8ujtmddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624761; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFDgAKNJHBQ3nxZvE1Qu2RySeQacNp3Of1gcJQ9O1NqNhbPMJNP3GN39IvR3IDeDCg4BdKrZAArycPWf/aQwaG61oGvIrvNPUepO3D6iX/6IDJsQ/FKY0MTKYyvguYq3ROoKgNuGXV4SM2ljzfbl6OsTsZkEQP/knKFoZHmX4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seYqIv6T; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seYqIv6T"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso2721403f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624757; x=1791229557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=seYqIv6T85/OaRPHYw+SaLhFK9aad2/4460S2d44hD/igO+JHWU7Pvk6aaZegAeHlC
         G62W/fq4N1wJPkzLR3i2aF8gp8mPz2kDmB2m6J3PHc3d/AcB1bPzvRsh9Ci0yU6ziB8/
         FTaXejwpqNT6wR1Wx8IMHgY3mczuZUnQ5OTMUPe8USupKjE0WypsP+F04aCemPcqgj/m
         yAGpA+wubclQjI8+O+fUvg46EvjRMaUrYsAzVhQos/+6thYHZdcoKGtw1V23APwFGTOn
         0eFgrt4oZ1J+dLKzTEuaIBX2m9q7Aq10XelOmk3P1AFqAkkwiuEszAihwMMIWeAwhwn1
         MBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624757; x=1791229557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=B/q6dijfVJ1xhRAZdz6j0PCvUnNE8VsE8S3Q+Yd8EP1K5T1O6QwC+v8qL5eU7MZR2g
         eV3QQb10aFfwl6tglEir7n3VE5/jKLag3CX7d5+EM2GWMALRo1XkmXjfPlUfiVQvPGVj
         12pduNc2CVb1VeETCx4lpTS3tR3rU9AQhgJhrWbwZBuBhn/qLNXztRrRynpu1+Hxo1pE
         utSRsT1iavCFaB+AzZMp005Wr4vo6KpXs4lmgw+l8+K27XQSRrX2EZVUyY4VXBqNM82k
         /4rgxKhUIWEyIAytCRedYy7Ey+8xGGnE2V8MwWEnOcjNUdJ9giRkBvRi2hjVD0K84mbu
         SuJA==
X-Forwarded-Encrypted: i=1; AKwUvBwJFaWAhxXlmGfw/LtPpWUZCmEYTVE/AuNfoAAYGS5XA3aoGpE9JNwOyIZuC3s49lPBm+DDLHUm2ibY9iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGSDv1qu7BiqVbhcrIjapl0lIqASzJt556d1a/ugRNC1CbQ2EZ
	rz+esDWj6oEupjfTuVDPQhKdg/SJhvbuEHhPQtLCDgat+WMe64iXniIP
X-Gm-Gg: AYBFou3iMQtTl27fr8nLnnBzbx0S9yjmhBdRDxJvGHGYQFNo1G4ymym9GhMLGzJRQGP
	Oy5/Bli6GIZUeSGTubcXEFQmHEvTYFPWvrDhvTTaYAZikEQ7+Vf1WAQGA4D4mZF8pYkXbWPw5eN
	bmffL0xbzpw1lrFpMc/Fu6vxAVSVpZ7RQj80it+mk2KZv4y6MwB6Pz/ul7yy5wa3hw6mCOEo2vr
	WpPtazc2dlRWhkV3a2h4gPVBNdijt4GLSpDWF7rV2TcA7f4cUrXRRTZ5FdDZXwNqDlLX0YoBo1Z
	9k1PurqboYAK3VUILfazfcJxGcbwZvYY40GoVDtICn85RulnWLUqwM4ygehVkWjjEQzfT5HEGHW
	ugn0u2ZxLWDhWoPC4o2yjOTJeX9nWN03lYnMfU067k5gYwuu0AP5zWnxeNAnZLTr5mQ4bFgQ/JR
	ElGr2ctl3aqvhZ8YbbDbXaqlhhks+PnmLPRsveHc7SSb2uGwDfvaPo6ne7lRBhpdHeXjEWFu6HO
	ABM5ad0M3/4HjWUdo6frNkrVttynpVNTHwjXmn0Ll1mMVusQL+V8l4QLLHVxtUT
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id ffacd0b85a97d-48872ac750cmr24124073f8f.45.1790624757303;
        Mon, 28 Sep 2026 12:45:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 28 Sep 2026 21:45:01 +0200
Message-ID: <20260928194511.41878-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0

