Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B623B9935
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326014; cv=none; b=q1kX5NSo4LeiAKe4AUIoDHzw0HHyqEFyndAqtnfiQ6UwNvAXlh3GQzKjxnf8pln6oVudm7fgdmJboBUo5b96cqO4sAeh33olQ4/Ap124yC8BovZscejSkzJGBbqhbPCnqtwDZLJrSBAhHmR0S/OugpUEIt0RWxOBaQYEhKWN5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326014; c=relaxed/simple;
	bh=IdZSPXcFF+gTdOktfdGsPEKUw6gn4MOIdk0sQuimzBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vq+FEfwHgMRwC0xwOlKlPvF7+TdpWc9s5QO7YolTXNSdimp0WIbCxumkm2kOV+PvLtXNDAhWPFJ0/ibSYvUyG4WlcGwuitfA2BVNg8b28ofAeOQjZRshEIyXT2a6IHDUXyI/bJVPi6zus/9LlsNL9yRkXtp0xi1DNBHEZkDq51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq1Qp3Di; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq1Qp3Di"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso12001665ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326012; x=1789930812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=Mq1Qp3DiD+gD5Ph4B5H1lbME3kUKAdyzWjCUk1zl1oQmvhY0tfPvLyf6yKbesvydMc
         ckDgGUSS/oZQVN7dQrm8QFhpyvcbRAzQi7b46SNuiNRGJDlNzQTOzuK7WpkzVkNZX6To
         g4w47y5Aa+cvrsdL+ROBjoXCTvzzBk4mqFyEJeD04CGHs8wifyD2C+Axn+WcHrAacNen
         CYJVWp9Juh8hjciMh55ves9hinmXyb1hIcJ9rH+22K7XEYg8R9nVX2v/Uu5rl0NHzA4M
         SUQq8kJqUbHbWNgXRRJzrQFoPau+OYTHXPUOb4jPIVIXJunsGQC5KY0MDKR6gmibEON0
         qStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326012; x=1789930812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=fK1/4e+Afz9ElIRsPzkXPj6w0vX6Y5435JCi34ANIXqvM3kcaYPJmVfUF1CpOYjlCW
         WAk0KMMuc4WnSSo58gT412c7S5fSQi6wlZmxfe1MLyvKbAcj32tOKkn7g21WdEqqkL6o
         1giiI2WJ/LuCENRFxA4UFG1V5SMMlV6hDf1S/UKP8SUfiz1UU3kmxS9CDHWjmDjFH5UO
         MYDyBM7JHmiE4L9WsoPqFtnCFxRPsJlZFUBEoFSIFNb4GjYp473AZZW0WsRbF3yI+7Ui
         i01fMbsqIZwbdDhrBKFGPr08OfVdqdGBCnc1mtJ2FBlxGlfry/Tw6IRdWY76K7sFbynI
         nSFg==
X-Forwarded-Encrypted: i=1; AKwUvBx5l+zJ5bp5J+1rpikrrlTNYDVnT3PsAAWKXQXYSjRSacZhncwXMDpGl9zJsE/LrMOtAMS0mDVBC+yMb0k=@vger.kernel.org
X-Gm-Message-State: AFuF++la+1sOYoL5oavB1JA4NwsCKmL08PrUG1ky/z4sEYBE9YsQj+D5
	vFEmBNAr9mAzZm2DHyFhKhNp+Z1i+yB1xfabwrD2LAaU/bE7stD/hCdD
X-Gm-Gg: AYBFou2uUFSUM96XBfzmRSG0Qphob++7MLafApXnOOLFbD00gDo/5x/1hyNHG06ibRy
	UoN/ydIYzh9qhl5XsYhc+sYgMOJhRdBFA/fM0/MHwz3r3WGVkCn8uGYc8OZEOUjdstRYPbtRANt
	GafW21Rk++zMLHaauJCniaxTRbGj69wNiNwRRYA1Hl4jTsYfCVuturX0tXmPtHiy2OcY32ug+06
	5SRSlk+nCTdbQDfbA8aQK26jnaa7F7OSA/oXREB5UzOKqSJpmQcba8gQQjc4tcPlchVtvwJRXZr
	puWT9nJETZ4AHUwJVUY98TSGL5l3OmD2gB6+WsidMYC7SaFNBvtU28BlB1Qq46pxvkrRrnxuNhv
	3QOj3+0/0/t18ADe9Em0Hw+YsQZgYXoQMP9dZWeuYujj7F52fFnKw4NUNMMxy0Ap6riQbLs7ZTK
	02Q5ixbCxGLqnV0dqkO3mHCqMxZLKcy655p3O0JPfagtvPGR7hLZHauviRVKaU0f9+AgbY+zM=
X-Received: by 2002:a17:903:13c8:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2dd4bc32ee4mr166613045ad.5.1789326011475;
        Sun, 13 Sep 2026 12:00:11 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:09 -0700 (PDT)
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
Subject: [PATCH net-next v5 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Mon, 14 Sep 2026 02:58:39 +0800
Message-ID: <20260913185849.907479-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
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

