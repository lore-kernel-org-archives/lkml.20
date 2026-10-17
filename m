Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AA3B3886
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215896; cv=none; b=DuzkSyHCjIvNEyMlRv+cZZbidsX7wfNcj14CW7SVfsa+T0FLaL4u5mGtkBgIoCRap+5eynNOtE5IB4g4kQa79klKzu1cbdQMNimioKE+tAIDIyT1Z/SgYBIog4d+J2A/CflhG/1fiqqbAkLrq9p1vZVlQa4N7T5fEZb5cFrnymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215896; c=relaxed/simple;
	bh=+ojFAngay73d5/WyAyhtk7ad9QvimhvdpmPfb6gztdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGQ8XYwRIXW0jjjUfLR7tgCwyJtXxB5EA/rLhipL+ABbDuc+y4IiX/SQoH7vpGlsSDmvaRVAqRkvUqw9RmSnZycpHFXzHyf4qQw9dasOH1RBDZ3fpgfH2KQ4j60WlsY/3pQKTJ/9gbsjF9yFJniK6M7jwhuCtLWTtY08dAst1ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNMXi5kk; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNMXi5kk"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc73514ac7dso299589a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215895; x=1792820695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oT/1KwqbtpFXM8iCK2NrIcWEMqWijDvNOiD3geX4Tok=;
        b=HNMXi5kkF7KjZJs6XBi5hcja4K6dT/WUgYU0Z6r2rKhUa3kaimOTShnNtxcLqyypwZ
         jzpLR76Goi1nDRIGgnbHaDLepsbqf06T+L36SpYza4cdvT69BE7KaiEeGVlu1Dw499nN
         AcTgq9X29Q7G8rEBnPTtYtSWGuVs0/GnlFq0WDg/ulU4qNteuPF29AE8vEaE+sbCVmxm
         alb7JjJdbvgqmBw3I3qwBpZRUG/2qqggfK8tVAo8WmwoUymqqPTmq4erhZT6IS7BG+O+
         IBPoDde1bnisKjCCOTwQZy/V+LsrIb4s1AUGNzorXskfNFZJuDQCTZ/ptArV/SsOOHXi
         ls1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215895; x=1792820695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oT/1KwqbtpFXM8iCK2NrIcWEMqWijDvNOiD3geX4Tok=;
        b=gfAi3gjqF98OJsWB0wiCZKxtDwE9OJSk0riTQNY5/kzA7GUYjftF798PdtdBbyHIWD
         HLsyhbd7hwnNp48tjFrYWD9qDcrVnWyr2+eYihLuvRcNJuo2CdN0YqqX/P696KKVOPm8
         PZKiKT4+miSyFQJBp89Tt8i+dCXTQvU0Rnhjx7/VPef0l9jMjz0Bb/Nm8+m/L8NGBHU0
         Emh/ltxgvjpoOzXHPxizOrZKDRlKsF2Yrmou2DmqZGAZONCNYps2FU+jTmAiHkumfFu4
         7wQYefEXFvpyz7D8KOUQkK98Kcr2CfTCuhMqtJInClns2CI/somUTmBV0YTgaDlpdZoo
         7M+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzCT0AmhfjccmHOLHOIstMcn18P+RMh0aymOXLXuE0V5YUme5btz9PMNZV3LrTOJJ55ZJda7+o+XhEWfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwvxkRVzg+40wDtDsKIXh59lIvz5KCuTzOCSj6S+UIr4UlTw9y
	QOkSXxPIHX4/+SMMhwNy5yVAYViKwoKZNdIquYJpLqheAgBfbvV6mCaB
X-Gm-Gg: AYBFou1ywTFvaCp5e8F/yg3drks8k4TokcQBr4kXmBNyzz4yzfoFtImkrC1AkwQOpzD
	2CJojsk3FJjOx9/nnTtTdVlrcZstY/iTm/zf9QQcGmh2NTF+Q0SmPdfT7ro5SB2HA3r1VvW2gXn
	GoOJi3tdsgpdRfMzz0dcotHhldmWBvsSwXhls3SAlP5RE3bkb73gO6/dpAQ/SGEy3IulrbHo/Nj
	NuuPDSP0UapeB7HIB3gMUfTTV8fA9Kp+T4tHd1+xiGuyxADmB7fMyQcBg7pcd62HfWFKh1xYqNV
	gXG7FalySV9rPl/FbyAmDw4UwgV35A13UK1QTYyP2nEjGkuSm+8ucfkb36fT76A2gMkKS0eAI9Q
	9LtovBM40EVAtzzgT98I7UCubBDRyMRDM4D0a73JZ5gCbMAxk6bCzLHZfF3GT6/gjz8BbWKMtbI
	iqxG4w7D+0zkI7RQrnvfpW8tP+fEmeUJYzPnQwgG9a1186YPzaXh3BqgW9nFCWp6ZctI57cBBx+
	y0FkJM=
X-Received: by 2002:a05:6a00:408d:b0:89f:b166:bde6 with SMTP id d2e1a72fcca58-8a04c43805cmr1583712b3a.54.1792215894837;
        Fri, 16 Oct 2026 22:44:54 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:44:53 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 2/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Sat, 17 Oct 2026 13:44:00 +0800
Message-ID: <20261017054406.1828061-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
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

The MII port used by the SGMII link is derived from the MAC it is
routed to: GMAC0 uses port 0, GMAC1 uses port 1.  The port index is
not an independent board-level configuration, so the binding does
not describe the ports.  If a future SoC needs per-port configuration
that cannot be derived, pcs-handle argument cells can be added then.

The CRU reset lines (SRST_XPCS*) are intentionally not described: no
in-tree user requests them, and bring-up relies on the PD_PIPE power
domain, the SerDes PHY and the in-IP soft reset. They can be added
later as optional without breaking ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/pcs/rockchip,rk3568-xpcs.yaml         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
new file mode 100644
index 0000000000000..a331880eb11c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
@@ -0,0 +1,69 @@
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
+properties:
+  compatible:
+    const: rockchip,rk3568-xpcs
+
+  reg:
+    maxItems: 1
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
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - phys
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
+      clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+      clock-names = "csr", "eee";
+      phys = <&combphy2 PHY_TYPE_SGMII>;
+      power-domains = <&power RK3568_PD_PIPE>;
+    };
-- 
2.47.3

