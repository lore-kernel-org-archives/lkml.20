Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD37E4AD7DC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475942; cv=none; b=mfOgHLAsZ6CSGaLU25yNLACamHkRT3Pd3m169d5QJj8k4QpQ6rtlqlmUqe0UXrwpiDbk6stsMymxF6mwHIyR0BwY95hJpkJ311BD7sp2lptW66oMLxU2co8yaADyd/oVCNEpiWPEzaGdXubaBYp4t547iPh2xZApeTZL0EuVIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475942; c=relaxed/simple;
	bh=IdZSPXcFF+gTdOktfdGsPEKUw6gn4MOIdk0sQuimzBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWWdE3p2hhY1+qydQcXXB3lLOSoFMIVfBjnoFRmu2BAvX3eukhwJ6hutCDB+AZ7EP8ONMjP6zaU0JybjZzTBnVYm2MRS5ObiY9tyUiqMsIN1itMICxts29qnW1mB2bjduqHYowbQi0Z4JGD7tqXadtjk+wGYCVbqNPhblnrj5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OA7OjDcO; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OA7OjDcO"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39dba377357so1909841a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475939; x=1790080739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=OA7OjDcOXs2I37ayw1AYhNnGpp/ar7IYcoNfKjtiQiMy6F7mz6GJYfaQGFjrpmJZXv
         gabjZ8wSCDQQJzoik4XimD+8luoDYsyPO71v9hbbQGFUqnPX9A9joyES4vahBmNZeb4J
         R2DmNFigiHfBtsbJn/Rxj8fFXYBS25fvbOWMfb/ebMZjNxt8F8vMX31m/Dy/+2I+X5Zd
         Wwb4idB+eRMmFPgsz58NnAuj+0MEap55Cw9MpY1w4P/g1iGoJwhw8RJkozAenG3MbTli
         WpJei/jb4DL+77vNwkzvSq9mB/jJCAbExFVqvOpAWoaSdYSifKo8RY+Ou4ZUCmLuPwwn
         +ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475939; x=1790080739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gaQPgN9xwJzuM0GPM5hNVMgAOEuPdKVKWJmnNDeBdbE=;
        b=gM6IRNIMhl7YkGsdlQFxa5haeAlXR6IR0KxnOPNgzkmlmwjouw9jQximJ7EDNI23G4
         ujV6Yk7gOeicd9Vd0WwXPD45fVueYYkqXJLDQk7dKGPoFQgApNsxW5UMG/LV7PqeS3vH
         Ef8t0JRrkCWI3rh4Zxbcl6lroNzmBWaJAKK1DR9uvuTRAi+dOiaK+Pjekbq+soKTMvFb
         G4YcfPvqf2ngxq4A5oGlWAsyOCUYbS7g+yiAWXw+TPe7SzOVpQWCPNzwUL9WTKmMWA8q
         Exi9Mhl01cxlA0vCVtZ2LJT2msEvg58L68Ju/UvacmS90hAQz47DREDTygs9m+CzPZzk
         uo7w==
X-Forwarded-Encrypted: i=1; AKwUvByutnaVk9p2lWngkkO45RIxRznShuTWSQe2psNCPXVQhJoaPxuZ9dC31wGZB/Q18xT+hqAiunTp+PqF5wA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcaJnCFs3WY1Nuxq+NjSoclrex2+d66D0p/FwVwXzom5M+x06h
	bfql/oBkRhD2aHhmeF+UHOGDW0udAQ5iD6Ko7QNUnMvqIG1N7OXIIAyn
X-Gm-Gg: AYBFou36yUKI0XP+wecB8typ3TQJhp5Z6phEOyX1EkeqWj3J6ibvWPXcokgBhV5ckCL
	B+JMUcGt7m+YEr5LrDTvUDwiq5Q22gVpVFAQo9Tit77FmW5REKkSGXqEzdgLNOgCz2N1vNajmKP
	+9rlz9NkIp4cabGVolf3s2ccX2uSQNOJRBK28KO9E77RJ3Mz1nBTUqhqffA33rGIOaY29z/+mKT
	SORKST3uBFu0ZXwJH9Rxi/93L0kTB0ISs+PtBk//0JWax5QsziHFmhv07EoGkNN4H+tJvlHUM+p
	skYvV+McQaRGdVZArJzzim3OUWWVOp2v2v8hnMY2kc8qjfAf2HMmgoaknlHkvHLqzaB2QqZXCJB
	fPkuvMsmP6dBdwzAa6rUxz3UoKO+H6E6lSIeZglNshFI3e2zlL8LqmI+PWftdzHQs120qBRiuUO
	jCLW5Cy9RTDdE5Oyt3lNpC5Ei1Zua87uU2Sdd4fuR0HTdd9cA9yqGDwQJC3Vg+1G3BAILaqQ==
X-Received: by 2002:a17:90b:50c8:b0:39d:f773:37b5 with SMTP id 98e67ed59e1d1-39df7733906mr12070641a91.0.1789475938897;
        Tue, 15 Sep 2026 05:38:58 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:57 -0700 (PDT)
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
Subject: [PATCH net-next v6 04/11] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Tue, 15 Sep 2026 20:37:53 +0800
Message-ID: <20260915123802.1561724-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
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

