Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F894AF679
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107474; cv=none; b=C9lnNYTIdB074b8yiD92eVH/8iVhV7Sphcp4Q4X/YGYxpU2HOte0bU/pQeF4/ZOwhR/IMaFnLUWSEhzd1Zz+UFeF+pLhIsVMVj6BseSpnMS6bHYb3/UZxgBpj+KiMZVdgKhtrlPkIWb3Vz8iqBqaEd+2eQRea0/ody+hP/Wp+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107474; c=relaxed/simple;
	bh=uIxFaIx1maUJPzb10cLtB0jKa27JO2f3e4ujLzs23xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiLWQeTj5dXqRcZqfJK/e5HMv9LItIrPzreQbmNTp+4FG0NEuYu8D6hgxiFyNUASdXXutZOk5sKfZjxa/o7AdBVULXh6BZAXvgw6/doMssKVXdmvk7sNCuvCxMJq73pEoyxRZJzjGYg/cbxrwF1SVx53on+CCFXKmr9hiNBIrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIr2APoD; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIr2APoD"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so862305ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107458; x=1790712258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=fIr2APoD/SvW9DLLtjKRuU1LziuuOor5RdzvIBWMKI4VwSbUlfXQuZk/ETywoUGXqu
         IhkSWZe6rfKdwRlrSWj7xUlXHn07E3LgLx6I9nzA6mKaJa83jxwOOMVyquXoHrAl7i9G
         tHwaPMIZVgaXDzvWyvA1SxFgvubjK2J5Oqvu0oigGYlnqBFsUBr/7W36py8tfjH6SuEp
         Ebu7os+bxbr/4Kv1z7XfViFqWBN0VrCAz7TCyK1RlUH0odSXC0QcL3Bc7NaU84/TP76I
         Yzn/RGt8ZoEO0jWTrtynNltc3MQOkaxv60Hkb6lJnpp0FhC0NdUw+CPfSn9O47JVF3Bt
         EaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107458; x=1790712258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzUxf96lJcOF3iW8gS5QIxqqy13/2PJtTrFNEXc29ug=;
        b=JUBNpLec2dqzQ9r9RoxtkccbU6xNoW/LkFL38ZRIA+zaTKV8xG35kz8wp6BRkkQYWN
         U+vRSvYOTAkl+avW5mis7oePUPDn0tkI0lOfniW4svhITzoaO08dFEAXxoofO6/rko2g
         L3LZQmfw5m34iLQE0qyWkBn6BK+oWfASQL48VjXUa2K+mP7vKEFAo7Mlr95t6NU/lObY
         C6T8mikaE4SJVk7GxaFAxIkZ52uE76WN5Bq3M/4RBSItnyF35vg9A+q0ABF8ydJrD3O+
         7/L+snRZESRODKB01Ia2twAG6ejSx9oGTjNvwHZ2TQJI501pKxRcVs76Qai499SH0Bsa
         CTBw==
X-Forwarded-Encrypted: i=1; AKwUvBxTDOK5ByI+OHQ+HChuCUO9RgTt4YCOId3ypgRbsvli2iyTez67kKjyLpBO30VlPeGXRpjbWFWWzcm5F8M=@vger.kernel.org
X-Gm-Message-State: AFuF++ktsvv8LKODtAEcB4zX9MU/ehtGTaRSKc7OnAVKzrMvXhcLG7Ix
	uW0McSErCEMPVcZPFugNtrSkVZI3VHZSov0aJ4TF4h7Iqaa7dbXuwt7F
X-Gm-Gg: AYBFou2NDAjwgQvx6SnWQnLg4zBTV8EiQqvS5C7VqyTc/jf+5uxeXyV3AltF9I3RsvB
	SEVHWkxrQCjkJJhJiNecYKmFtYKJD2gfaWSf7p7oquJMiYfB1Du82A7rF8uoTJchm+JHYIf30iE
	wcEDD2pVl1bGoyFkEWZvYAp92xhPFr7K26eOaokeI7m575QnWxg6Jb7KTxMmWHWjBTEuqWLjFjH
	EwpZTJCAE2sNqgpSoepKA5pnudSe6EvtU+gBrUfOj4n+SPcG2LfZhiU/flisJLe1lbbUl4rATis
	CxDaZm2l2vnWNWki+EyIQfIK547Mzgz0GxvLrDEl+1do5NQXuFhV3Ksiadfyi0fdmkxu25Cu4Y4
	qwAJrndVzSxwsM83PyhYj7v8X/pzzyMrWlYrkcuwLUf/vjGomzUhTZfMvm0maezGAPyHU2rwFXY
	aHbACvLE/vgeehGR3DukUj3l4rpJpwt4CwiSxvSoinWYHKsMSxsYnJA6hsd/zpyBSVG+E4
X-Received: by 2002:a17:903:2350:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2df69d689a1mr3760135ad.22.1790107458354;
        Tue, 22 Sep 2026 13:04:18 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:17 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Wed, 23 Sep 2026 04:03:28 +0800
Message-ID: <20260922200336.2201212-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

The XPCS is accessed over the APB3 bus and internally connected to
a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
QSGMII modes, with four MII ports.

The four MII ports are described as ethernet-pcs-mii@N child nodes,
consumed by the Rockchip XPCS glue driver later in this series.

phys and phy-names are required because dtbs_check only validates
required properties for enabled nodes. The SerDes link is a board-level
design choice (combphy1 on some boards, combphy2 on others), so these
properties must be provided by the board device tree, not the SoC dtsi.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..703fcff0e3f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Coia Prant <coiaprant@gmail.com>
+
+description: |
+  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
+  Coding Sublayer (XPCS).
+  The PCS provides an interface between the Media Access Control (MAC)
+  and the Physical Medium Attachment (PMA) sublayer through a Media
+  Independent Interface (GMII).
+
+  The XPCS is accessed over the APB3 bus and internally connected to a
+  Naneng Combo SerDes PHY.
+  It supports 1000BASE-X, SGMII and QSGMII modes.
+
+  The block contains four MII ports that can be individually enabled and
+  routed to one of the Ethernet GMAC controllers via the pcs-handle
+  property in the MAC device tree node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: APB3 bus interface clock (clk_csr_i), required for register access
+      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
+
+  clock-names:
+    items:
+      - const: csr
+      - const: eee
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: serdes
+
+  power-domains:
+    maxItems: 1
+
+patternProperties:
+  "^ethernet-pcs-mii@[0-3]$":
+    type: object
+    description:
+      One of the four MII ports of the XPCS. The port is linked to an
+      Ethernet MAC controller via the pcs-handle property in the MAC's
+      device tree node.
+
+    properties:
+      reg:
+        description: MII port number.
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/phy/phy.h>
+
+    ethernet-pcs@fda00000 {
+      compatible = "rockchip,rk3568-xpcs";
+      reg = <0xfda00000 0x200000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      phy-names = "serdes";
+      power-domains = <&power RK3568_PD_PIPE>;
+
+      ethernet-pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3

