Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35163B8BBB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481986; cv=none; b=A6LJ6IcDGV1YoeHULF905F0hG4n41MoBomO0tFELeUyOq+SEgdAW3WZ9xezstuPAUvYPg0sOWZFPvKkkDnsjWZXN5NFTtRyiWbegtwaXyCmqnJM2Hf/uTQFNOAN2OcfKQrww3J3AxFjQEKMQGSURerMTPJwwneMBgREEw9fZBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481986; c=relaxed/simple;
	bh=wxtOCo1J6xK1gXQQEVh3Vjrp9sJuOVndjXZA+LJ04PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DM27G51QoIaOCWu9aOJ1PIwLDtHz+JmRMBhk4fr/PRurex4Ap7wxKVS8ybRcx4bQIvF7Ydlwt8dnLZlUDX+Y3Tk63mEtIuuXVXddh5tLk33d5u2oSJpWTZIKGyyleCwWMGFR2/M7pZ6W9L+WyJigoMFIIVGhjt6aZaS3ofEYi4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+GZMEPu; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+GZMEPu"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3a8c118e711so1032161a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481983; x=1792086783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbQK6NgiCotND3PJt+n3FsbZUv6wfc19zH2Mf9/gmJ0=;
        b=h+GZMEPu4ZOUqFmyxDkrVjYPvpUuIr30bYkKhhJIsKUmBtWchy4zi292SnPePCwbKk
         2rwmaG6gkVKnsRSaoFH05uCpcq4H5Gj8faABP+ri9zYUV6uhAb25ldfY8OAHE9TIIMFc
         RRQvHLcxdeFtlV/aVa4W7eTPppoP8CFBTcmUSNA6IJBwGtQA+tPr8o4tgk1QOmhR3bd+
         uV2PB5HX3SPqjQyEIEwqslUlwHO/6lFGJIxJV8ZqNymiUlYF0lsZdkUYRYGX2u5wVcdo
         r45ps+ncpUj7k2BR24vixdAwEHs9OBwCwOs0SLY7hph7e4ik+13JqTk9N5DxW4o4hrnT
         HW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481983; x=1792086783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbQK6NgiCotND3PJt+n3FsbZUv6wfc19zH2Mf9/gmJ0=;
        b=IVDAhedPpOKLXSsRSfOsa3rrrbx51K1MM5KDcM0UStIlNzZq2NT3rPgpkqQE4w8P/1
         pMYmvOBgS8UjzpTQZR+NekROGMPZzCYpqbOdAQMhpVul9BN2rx1bmeAUG0tZoVv3T3zo
         lucFBiXUlqtrjy16ExY64BO1L1EpRSyIrUf6C29ggW/8DJzteZPOqkm6CBOd0uBxD1uW
         IjJ9wFX0Yrja+NDkNW+mwkdNVJHBbcUjOWBES/LMsOgQIe0biei51WfBFda0IEYgIv8k
         i/AxWoFR6oJniCC2Le4JhH3nW/vh1hBAjX0Ex2qTJaYfdFIQqh8Whs8zVRm2l25WhT7w
         Eizg==
X-Forwarded-Encrypted: i=1; AKwUvBzpQ01FxpiwHaJEhTPvw3Ow7rLnhxJgOTKSUAcpsPjQMvxoTOTjJM9sOQq9XmepIge/xhWTk64TZsDdxP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh8+d/BeNnbJ9RKOj6lugmejP4xcSG+fC7wzXBX65slgzVY8dW
	R3zKL2PWW38tZi5FPSmDVkfO4oeANeAhDOYZJ00ad2Y9lHnt5iRvLBLJ
X-Gm-Gg: AYBFou1LkGoinkJyDOlxkRYryP8oHbPCtsInznq/O6SbrSHtjwwR+M7YHIDR05h8pH0
	Mbr5/Y+m4WVzA07i3D8/QrCb392PeLqAZztMWFAkR55Qx1f9nFaeaMUd4qzeEi4FmoZeXUUoMvZ
	REPCFIDMsnHTpJ0lcvfnNQqVabhgo/T+XZI1Sb7ywYANQqQRBv8zUP5sMd1xHWSr3xGai6Na1p7
	EcJ1nSydMvw2IgIEG8eoYJToZjF/3/q66QuWV3oYNxQlrSigk9EUBb7lTCEq8XDEILlBi1Aelfb
	Z7UwDYbUlsA0CySs3+1pPbWbONNMCFk+4ErMhijuD0IGxMd8mN4qhoBV6Fcvmzhb7Vui4FelS4D
	tsKsU5hgSZsf4nIhs9WKJ4paXReC+a3TKX/G+GhWhVG3iLt0dMgWgxD7ibZDEfLFwIxZQgukxU6
	JeikbypQ5Iha4YX0miK+YR/VxquxOVuadpdkDqCiP2alXDlcB4YZoAltoVz/WzmemntdCegOVEf
	0OHo3I=
X-Received: by 2002:a17:90b:2c86:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3ab273737d4mr811350a91.40.1791481983181;
        Thu, 08 Oct 2026 10:53:03 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:02 -0700 (PDT)
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
Subject: [PATCH net-next v11 2/6] dt-bindings: net: pcs: add rockchip,rk3568-xpcs support
Date: Fri,  9 Oct 2026 01:51:56 +0800
Message-ID: <20261008175225.3375274-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
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

