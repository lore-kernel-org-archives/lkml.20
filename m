Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B94C0436
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795548; cv=none; b=KtmpzA+WrEtIZJYo6YH8BPwFR0hevqomyRqefmK1ao8sz54R+4UgToZyA60fqn+u/4ku1ybCROGfoiir3qgziKvzVFbcxNHwGnxeYJFbhGkzv9aBpax43GPsUD9E25RbStlfHsH1ESmunjTARtmiMuS19o5KZSC378OEA0vF5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795548; c=relaxed/simple;
	bh=oHYaNtlraUhl8j1v5uSplHKtyNUdHyxN7c+7WMfLpnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnZXIkgn9VpBCkC7nj/vttrbTqklQOg+AfOvOwf0hcoRcQSMLq72hoDH82zyiah8vHJV3QjS3FXXV31T+/HG/yfiZ/nWiwM5vmcAnSf+BijRaHOqR6eYitYV1X2m/i2FI0vf4DwViL5dr4sD7eUJMJEtKjsm1Un8HqRYBwpg8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kncc1AMP; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kncc1AMP"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so1545196a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795546; x=1789400346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6aB1UFx2dxtuDUMhshejketJxUphgoMFv4AnQI5Bfw=;
        b=kncc1AMPckBK2wC/EFxqB9keSVfJrlb1S4qWK2o3eyKbTQ4JOgFJdyEWaZIeDcCPJ2
         kuaa467DGAiuPW/Hz+txbTTAm0ga5x2KB8wIhwJc9iskEj5AaCYyhA4wBjYnRYrvEusZ
         Pkk7r66F1vKR3DpIW6EbWGRzD4kXxH0WlJUr4oSk8/nTqtfRalXqENcnDrEv8fAmQaYO
         /MJt0xkma3JMXp6T1cDfuPsX/LEO3rPtzVUkf/OWLkN6nav1LO0T/pjUDniS5zSImxbX
         klKYCfSJX2gR/hIZT0noAz3laDPo6leIFu7We/qyKp/S/zZjlsHudMjPphBwSufMo3Is
         jGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795546; x=1789400346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z6aB1UFx2dxtuDUMhshejketJxUphgoMFv4AnQI5Bfw=;
        b=YS+b9ffjJkxT3JjV8LKYZxvZwkhwO9rrlBwkjiDgbEOqBd/76yMMYu7oPXwyNJYd0O
         rbQL8wSUQ2MIaVfLQfM6ViQhM54lez0IBadVXPKT4DVyqY9eUPW7nCp1AA3ZKItW/hR1
         cvgeJa3j5/+H04UeQ+5V5Js1RX/AKD0UejMiC19cGr9PZIqvClK9ePUM7Bb5RBBBrfCV
         +uIgj6DdFcyKvyNzpTWhKL+Zv/w5aOmobNoA1a0RX723KtC9CPgaOKqEh5IlQkV+3HWF
         zK+aQATAwWHMlJM91ehIv/8sUNwDTeb2VjmiDIip8UkCyE56ymJ93SiAN+z/+NonF9rL
         Wpnw==
X-Forwarded-Encrypted: i=1; AKwUvBwrX+jDpdTOGMbFrCDXUamjV2GCPL/AuDtsRIm1h4v+GLE13udU86P7U1LHoXh/6AFAECIbABr0vcsvp1s=@vger.kernel.org
X-Gm-Message-State: AFuF++mP/FN1LbNS2p/gNw+rA71bxsNoKff6gjvmRX3naJCnAGFTRMhm
	zNKQjvIh7uGFpwX5jRKjZKK3ckdoKWJ9dPzB9bxywTr5Ej/TGM35VJcM
X-Gm-Gg: AYBFou10QPZMSk5T/llhgGChIwIUJ0viv91qca96qKZMaP7rxGt5igfDiemENpLCME6
	/fz3MeZ0RFy+E0hTmhfrGuRpR0npkI1si2CiDzDBjK1duc96fQNRBPWCvpGB4FgK2PeHCxLr8Va
	jnGkYV/9XmcsKE6erKIxBonYK0P4dMOJbi8+wPcvrSCanffugqJmusQvbDPIMwaUUVGpyxjYWpO
	9sgA7DFVL5euTKzrMDMP7hnGz0JIZMqS+GP1pxpHvCT+eTzN0SPf/FERawWZvshVpeJH7WegdvG
	qgDzJfBml/5ummii4k3ACQfKr6xPbU3ApDHjfSCJZZi6VckokL2OuS2hmQ0AnKNpnrUtO/L4sKo
	rG4MDsq4tuxpOzrRlKjMwmjvFmPu3TqYWXGI16V/nwPKSiMAjPLf8m7B4B8bBvJ7J1jxVFAN5h5
	D2goPbULiKLO/665+FYLjMhBKINVMLmpd7RFN1pH4lo5//mA4eYkV/2rIrDzM=
X-Received: by 2002:a17:90b:3149:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39b2618060cmr36557328a91.10.1788795545874;
        Mon, 07 Sep 2026 08:39:05 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:05 -0700 (PDT)
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon,  7 Sep 2026 23:37:07 +0800
Message-ID: <20260907153713.2572547-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
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

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/pcs/rockchip-dwxpcs.yaml     | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
new file mode 100644
index 0000000000000..0852d0bcb66a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/rockchip-dwxpcs.yaml#
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
+  "^pcs-mii@[0-3]$":
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
+    pcs@fda00000 {
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
+      pcs-mii@0 {
+        reg = <0>;
+      };
+    };
-- 
2.47.3

