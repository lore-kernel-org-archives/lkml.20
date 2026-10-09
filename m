Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36439A047
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562278; cv=none; b=EKI4OCdeNLzQU0BiOHFaqG8BXZcWVC2byoe4isThpSUVwAeHWHW2jLRxVBgZnPlKO8+JIccFUDW5YuF9kt60/jFIav4R021fHPUfS+8Huz9fTZuYo86m9XeOz2CU7BgdpMfwwW6sw69upfzc/inuUKw7x0hFUbBJhm68iLvGwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562278; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZOHGmiuSxLcbE7w7/1LkXLY7DPBeFmdqGNR35YqfTQK1w/iM0pU+A14GDybsC9GuBsUJa/KCQuctGzyGagKddJhTj+qwHiL9WGdAMgF+ibgVu0bR3fI4lj4PUud73N8VciT1k2S7T1P61d9pezy1Pt3fJnUgfMBMCbto/Ybuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVFMsxLY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVFMsxLY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so180095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562275; x=1792167075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=LVFMsxLYM0PzWSpOwy6JNiv0PMz05vk7m++G+/r3XMJKABJkzrNG4uEvk9ad9ajwK4
         FLTkpARMIkCXw7e4i1rvqWYo3GQKfjLMGPEB1mo6qeyvQ+LTJGRfOxcdCLNG1eW06cnO
         TjLlDx4NDAmbjqqHAfaz+zG8u0SM0ZQVdPVWoGfs6mvJH53ueVdhwVQeVbHLCWiAIa87
         DpGqEJ8JBc96S2my+s6DE6paz/Q/PEUrxYm6RPxnTElzVMjkQRYXbQlfjqZfHrUFY2o0
         zYxvQTt8KnxGFSkxi6wMmdcsB2DdFKCXKbB+f2A1lY8xd2E6I4oU829G3BD8wNbaj2Yg
         WnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562275; x=1792167075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=llLsoC+O9POji5YZkVwubb4w1ZX6jGNNeTIbTamUjcOjvSMJ+NSQlFbd1GB4auSoxl
         vUm0peLOF3d9HOXc62NMPedmGN2h96QFrZ096Av4aTQqdRQaOJKORgCei4WlgN9sDtMK
         eIvbLM3Cq8ccPhfRvzCCdrK8U3V71KiBIKvxpZq5YChLdyODV1/4Veliirnm7Qsch69x
         KjQOAsKRG+Cm4TJ0MmeZZgJvEbZmw/cJGWiqc3GoxYAr8MFIFOp0FWWy5SBhzLz68UB+
         9YP8sLBK+0vEV39eF6QHdjlnfIKdlcMunJTNxI2XhXo4w8pvrSh3EJIBYWkxvJj+4PUj
         TKZA==
X-Forwarded-Encrypted: i=1; AKwUvBwixHb4vTWSUylqbG/MyojtSz2rmtjuX4taeCl+mWe1eD4HV/WUf2iqI2wdbLG/t/O5KSAepdC0Uqd3/kQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kTVRpbupsmvl5bp0W3zR83AozpR2JGT556RE7WS0lkDg8m8HVl
	vOKmPyXYz/0lLkNntVV/XZ+PMnLcz7Fbc7JOBTqaaCOpZ0smvvdA+pw6
X-Gm-Gg: AYBFou0rhqTYEsS5CJAvFvB7PvyGAzh/6cAPLtpl89TlK+tQxXGmOhXerp+vraTNskd
	XrnZgOJk81445G5VwXvYbhmqN1xg6gYF5gxfpk8nBUnU2NW4kPaXDagz2ISjTOpdpG6iks8t375
	5NQWdUgb+Znsl+ujhud00EM+sdq2JF6QY4qsxQqQEhqbiJCnUPfkgVWf1FM8hfKVp18l/B9RWXw
	U/skQ4iAVhggpsGPxGtosygVj7l44tBETIrxlM3D1uc1EpeZp++OzeDFhyiBzeicaSwyZLpAHVh
	SIsETL0FmP/ybJl1MRjDESbk9lGs5RMq4vXrr2sNXu6KrRNaOLBTW/KHWCdK1+E0wlh8lCi8TnF
	lrjwkMRdQFbv3mK5gQjoWH1qPX477cm1EQiJftF/fK0DUrV6nbAvRC5wM6Lma0gbQpoA0Gli6cH
	5VgBZLMwd6Wwu6UlZX0QYpcRsjqHGRA0Srm8A9eletSOXG8NA5tgwtUqwJ2Isfbnclg2TcY9OGs
	myQVxQYtykgxyavRXJvVfzhhS1ncNz+GKIXEwlafcBRYFP0XsJYZWeb3etE2nkQ8zcF86nmHH//
	DCZgyVjNfveP0OAtUg==
X-Received: by 2002:a05:600c:37cc:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a18e44396cmr51955465e9.2.1791562274820;
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v25 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri,  9 Oct 2026 18:10:47 +0200
Message-ID: <20261009161102.38961-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
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

