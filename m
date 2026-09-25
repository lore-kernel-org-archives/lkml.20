Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A24D9F81
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360711; cv=none; b=IRAaqHGHlZAjHe6t4GZt5VpxqQYb9heYPI0yt0VhpTkEvIWUX5A7xpids5oISYzh3//3JLO4lqv8swf0t41QPuj8gbWf6ue8plqCTw5cRpgtomo4stVdFLSziG2m4v7jOIqHia5GvHhvbkZAYvnBrL8Cs8hN7F3vwIrmgTiR0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360711; c=relaxed/simple;
	bh=pOEzLfSLCr+9oxyGNTSsgNcprEznMU5MGTfyskpEb9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwVne26HVhI7YQHL3Hkt9rO5m6zHU9Kj9o537lWUhxf1zZQTczsYm5TyhRmyQYiggNwmI9tjcuOkYjIkfm3Nbm0m6zBwOnSlnZXOkDG+stediezgWnkGE7tahkXkiOlNOOTtJIvnnV6pufQ/R0fQKXJvMWcr7FMXeH2w7xaB96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqJEYciF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqJEYciF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so7230585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360699; x=1790965499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=WqJEYciFIE42bW++TuvV9qcIUwlFSCQPmTPUyPjrvNWbrl7wnkK9gPID0kmnQqRom/
         zFgJYXkiM+OGhd7lGiJrWyr4QOvNBAk177LyBEfXIEmp9NDpjwJKM0RJIw+wDKMTcO5y
         Pm9vmN6kfMU/96Vo9jBpezoD9+GXjm9QHN0j/TnRi0O4rAYSe+ED0ZZhCRyDD9DZ2wxY
         enluWSDDeGYzdVy0zljT52bOdwgPKWaw2EhyGj9ATwYsspK7OF+R/tOpbNsbHx+2X6d8
         ZNzeTJ3OUaAlfvzCiryUMNpFvVI7qI6IomRx6Zu3/9xG6ntwDMO5VYu9LNchfUe2KSOg
         ZMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360699; x=1790965499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=gAhEZcxW4sYUtKP1w2ut5PLFPJCYCfyDeDQKIIxcz9fpNaGMprNwxCg2BycDK5ycyk
         eknuL/j05GhZcdaGx1QHn2ooDfjGS4TcZasRE7dkjEen1B3F0rqaByKicaIQc0KuppZh
         5VKvnVRJ9EF3dzvtMQEUfYHRXTdop/skEB8ncNfIrPlEd7svlWoOrwgYa66Htr4cUgvK
         ZwHPEiK3td280rjiSCjHegZ4ulr30VBnpXFjbVTcupvihQ+xP4Tu4coLavpp2/91NCB+
         6h2c9Mx9toS+FXWPOjohi6PlH21RW9Ky/WMGFPYkOP05IqCJUq24cyEF2LHBL1q7U9da
         cSzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSR7t7yiw506u9t3JMXSALlhR13LMS8JXaEpT8K4lt2G4JtlLfjqYI9fvt6RiFfUMAWTh2JkAWSPfbmO0=@vger.kernel.org
X-Gm-Message-State: AFuF++mV8AdfohUKxJE7ioRuybMWXbfvuQx6fBTUyi7Dlo0xW/ZzJgSF
	3fyoc8N0cEASpa3WlKLYTKJZESRn2z9LlY+dN6wqRknz266RT4sYKk0x
X-Gm-Gg: AYBFou1qmATBgIKePN2UdaHFxNFF0kfOCCNRf4NsltXzZD/IvIU+v5ejz2y/0EZ7Uxg
	MbMS1fG6N8WvG2Uv71UOA22TCYS3P0tuVQwXmzhXqeUXBdr7lJOPu377Bzq6MwoZa7fIzzXNQT4
	TNYpSBszm7VZFz+9So3f7IBZ4Xw1cbF0iP+rReHSeIW/R7BFdAe48+7DYlKWS2htf1sC+g5F6p/
	sZtbTkLwy1h+4C99HJiC3iHXlguYMDv5paIAQSDHi8OD2TUWIkRHxOkjm1EdM5VF07deBekMuP9
	rHVO+yGmHREYi5W8anWfnmxDiBhUXWcxeN1DToDVhLPhl/YPPLb5oEo0VlEvvJCtRfDGlCY/mf6
	jLQ5868byGcRS0R1ct+gUB2B7/48whrh4fDD4QAu9mpUHlhG+QYnxViDw90OtBTHOZW31sqqYRU
	ksqGIZTVHvK6MKPQYSF9X9oe1uoXn3nNUw+LmwUcC1/qhLMYpD1ksztpstkWKegbzEl5C59vAKe
	4NLPFGx7ojVGQo3PVf4lEUrpXJix744tUyDuhFdkKOpg3de6jWbXMycV1xSGpn79Fvav7MXEfc=
X-Received: by 2002:a05:600c:3494:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fe66d0768mr111652235e9.12.1790360698492;
        Fri, 25 Sep 2026 11:24:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:57 -0700 (PDT)
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
Subject: [PATCH net-next v23 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Fri, 25 Sep 2026 20:24:25 +0200
Message-ID: <20260925182435.21207-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

