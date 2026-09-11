Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C343DD879
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167277; cv=none; b=GLqp53b9w5lKhY8EljRWAKkcorktp0dq5orHnvj+syIBtrV9CtsNzdcaCxmBXSyjoj3SZLpsyS+V5+8VjlMxZatZtoc8URrczlq+HMAEgyyZc2KZ+pjpq+0AjmnBIy2btbu+x2UgG8Wq4CEvQQKxA0X51UkPC9p5iS/2lk9I3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167277; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfH3aeN+Jh4uk00SSbJFtlTU9rF09WWrdj/g/iIrUJLDl/HtBZnQquFZQev9spHM/Vbc/oelaptQrwKn4DTINWVd3GeKPsba+rnvwVYqh8x1FgWyhKo2GyB/O5pi1lAzDjq4XmSm/xwl+FxoyuwQZhdqiTZPRjUwdmJLQYyUG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ba8ulXt2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba8ulXt2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2328755e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167274; x=1789772074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Ba8ulXt2FzckTMm7NIj9QTMw0uZJkXPCrAIny+gEKasrfSbX9dcyKQ5Dbq2e8751hj
         SyCK1kZ0IOKC5MQFAmovOajrhRv/nHt6LbJ0iqxIxYapvGjYJAsHC6ClNwD1N8rXlI6c
         P3aHKgK+QO8CDuzP5BKhWg8neAk22uIxn/OXsgi7410TLW2kWfZnqF2s9hpeveIg6Tpw
         jdA9nVpG136jWVuIU9zgPf48Isvcy4HJ0pHD28LswgVaOnP42UtFTkw9kcm7owjmlgPL
         NLVw6ZqFf/GlT1OzT1By456jSDzwE5vm3C+rwGDp+ZB3jwsWxQ5i7+MV49B+k1E3Uozm
         i+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167274; x=1789772074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=l1ZStamMwK0xhpM5B4oPzfjHzTEIrDMQCz5xLi5xoVrlNqvEnkJ1TtFnkIg0viUEOE
         OiIBoFWppMwDK+zwFrcx6Uj9p66nOKW+BszSwcpCuzq5qTHnEGziEkjBTPDEsgjHlvGB
         8ZizmNje3ScXyJ61aFKht3qCsf6sV+3FQD43crmno8F+Qvh+Vs/bCW36fJoDaB/MfU7P
         QbFLAtGG9KZ5BRqmtgey2TzbAdTCaEa10uZyiZRj1GprRCn204R2N79bkQMcOCSav/R0
         kC6HGaGz46l/sjydN6paWNDxp3Q2DJHDLsGwZbeHlFWLYnnMZKmRdLOFR5TMG4txHOVz
         9cMw==
X-Forwarded-Encrypted: i=1; AKwUvBy9o3Uk8TFrfJlI5hVY7sfYb+FrZ2njNB0YDKLXbqDgguVpa88IgwvFmQg2QpOken2+DZewQuG3ZyHVS88=@vger.kernel.org
X-Gm-Message-State: AFuF++lTXm9v81l4UDVlAk5qYxC9st1kjHXtKrdks1fxQ4O9cPe218JI
	zhgAqtolWDDWtWZOMAZOFdlTXzmjizmfj/eNORwjnzC/GoW51kLmST8d
X-Gm-Gg: AYBFou0leKe1E3clZji9MY4933/PbRT7VG2ZF8nY0phiZh5S26BVwnQBiBw8ACCuekN
	Wxex8yYKXn5IcGTlKXGoIHjffWiekaOQ8RkVr2TxQ9uCWPg1I/lum/y4vUpVvjvNQtvDUuzcW/i
	0FWFfI+MWYSbSK/7otTgfJxa2U8N4ticwuxwvmCvvaTLz5G8sonpB6LiFOPj1XEl0xo9HTa69XU
	S0MQ+OJioW5LM399QwP1uMK6cBaqXqFQSEgavP3l8XDZtNY1bwD5YOnjPRv6h9AVpp6euj5lxS6
	uog8EV9NRr01lAQBzaeoI57dxQGf8ryhZs2PUKZupQYvlJHHhnfBkXixmvkHX50fp1AE3EPWGfg
	KE8iABqjvpfMMZrvM6Ss8XI/zMcQj8v2CNsN1M9nRmmK7V1WVmnnGsNg/tCI9bz/Nft7TA0P9Nc
	bVkLSWTnZBCt1bWVVooaXuXeoQpq2p7w/b+UjVFj2Y+FmMxv07iKWUdXz7C+7MZNLRKS1ZW64ab
	wCOPcJxmtmx2x/TI0KuS7vmAAuQIWeAfcxReeGIfPDQkvdabtNPYXQ09JVJ6zs=
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr168024575e9.9.1789167274003;
        Fri, 11 Sep 2026 15:54:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:33 -0700 (PDT)
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
Subject: [PATCH net-next v21 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sat, 12 Sep 2026 00:53:26 +0200
Message-ID: <20260911225414.225980-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
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
2.53.0

