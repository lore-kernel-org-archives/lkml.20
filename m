Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33C48D86E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962596; cv=none; b=YhsRQRLQXhcm1AlugJkBXQ4Mauq1YRDdj0nncMwEp5K4PUL3MjTCP0TSC3IhQAIiJYCHS3drLG3xlKDhZysDH4c105gqTWAKcx17wLWQskS0QnJtyia5YjKyv53ITcImdzErs+O2bfpsrrZGlgBH/zV/h/cfLloYyr5AvCDC12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962596; c=relaxed/simple;
	bh=NZWAEkceALgPMAo23xyfHb6V9DmgRO6Dus9f8KjTAvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pw/AFly4mSvkS3DZpKaRoHDpyAWaKnEtv/ykUjqSLSW2cPmBL/UExLl9bD4OPQ0cVw3ieySzyNCUpgGEXSjXpNs07IzfVTZkqjSJoPLVkun8HBu1wdPt/jKo4pBLgxq01tei1+R9TYMa0rHsTFv5wD5IeU0Z5GMsGMMY+j/eqGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9IW5m3W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9IW5m3W"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so2417577f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962591; x=1792567391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGflw6Hieq74yfbfa4F0lEdKuK34IyaMLqXOMrFMFTk=;
        b=o9IW5m3W1nExc0TdTFfB+SoLtfkyI+WZv0KYkQK7Q/nY/3PweJlAob8J8bAE5cLhjS
         27dCIisSOkzw3w34Jbp8c/ptaPrExlp3gNFI/pb9Ix9rXMBHRucwmoMVR7WqarAcRrNE
         Df1dgCVaez4GXyTJSpKHXBK68zV2+elDKEdxFaPAZQsjIaHBCLzPcjfyOET/nlcyPvP4
         DC+CIapgWLKt5msfAAWyZGMDdX5mtAu7NnC9yAbmsH8uDHXA6Gt9BPwf4ddUYJ7SK7Bp
         U8hiwUd8ih/QwxZLpANQLuez05U+DHCJHExzt5c9TPtYUaOvlF/CUn+F0TdvWt04PojM
         wbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962591; x=1792567391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGflw6Hieq74yfbfa4F0lEdKuK34IyaMLqXOMrFMFTk=;
        b=BwcxVnWpB8kWOZAqxrs7fS/Qd4aWPbUJVUcp7hrk2TgbDO3osEi3Yo6PYsccPUdKyS
         f3uFZvpaDyhPpxae/XcnfSM7PmllKx4U10+UizvjA4QwEIZAFzM7+o8hXkkwmrbjAcZf
         jCF1O4ZZVxrLTRG87MTjmkM46pTl9zsii9wnM+jm1OHH2FAv86eGw83FfErtlRJWV2Je
         qAxqkGEaEvkmN2NPbZ93PRg5tonJMV6GSApxjDHr/bn+WabJNXvQuzgcuHzn1P5lJWX+
         lanknJQrf0nIwEvCCSLmE/l2Fb3eSZlhxzac2/xotgznysu0+xoiFPFIxYhj3f3+SK4e
         +aHw==
X-Forwarded-Encrypted: i=1; AKwUvBw3C8cglH4fzUgN2KNyHO19AEQuzIM0zJ6i3DgTetAdd4Sz8/QMFMGjRMsoAej+TTw4yrU2TlxKSF+sN/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0/hqdg1NxML4MU4qw4IEJ9aV1lxeGOPygsuB9LtPcLO1FW4tk
	Z2IVbQx48RWPf5kLCSR6VTNkcMWM9xsvFAdq0IOn7rprDjXDx08OUNDu
X-Gm-Gg: AYBFou1E10s9qeDo1oPp0yRsyXF/LG783GgKhT7JXdBW2ev9Cu5muw9X8/ZZ4uTZYY0
	B6pVX2DeJu9lc+LnrTUEPxk12c/5BC9PpyllQfNT9UUbuRAr9nUBfYzXHJqFFSOAq9H/aosbr+C
	5d1S5XMEwEorLcXQuIL7stRmjYT/m/Ap8Bbk6zdk7+KMJQaGSjRSY0GtoooVbuAOwC7t6gZwhk0
	LUYKEDBk5omlGf0XCIqdUUutN1jzD6FkpEDcb0p1LJkIg2AeTlvn9o/sqoFcUHz+JJPIEbZIw0n
	hg8rlOV8g3ZyyeHvPSZVfHB5m2Y85tGC8itWzgL6ZC0Fl2uZJJa+Cgw1Bc3ZxLcJr1s7a33Tjar
	OObeGDTqTRlfvxZNUORnecuj+CX2u3UQ3aslaY93J9OkbV+7Swwp2SFGkbk7BGbWIeFoOF/IdTN
	IMHVicf1YZw36ncSO/y9fA+DMNLb8Fo7VD3CgGhPQNcE94iMScyhMM6JxYywDAvpPAYIyczug37
	8uK2AalzKrmbVwHlNNt3IPUezCfxRVQKfyK/TrcgeI67U0O02Iw/P0QOHtGuUUEMA9ZsKsUFAKc
	rbK3nWZQjTs7CyYpyf8tP6GwW6mQexzYMjVLiIYvE5ZZG5W3wG4HqTN/0tIDig==
X-Received: by 2002:a05:6000:401f:b0:48d:eeaf:d2ec with SMTP id ffacd0b85a97d-48deeafd35amr380402f8f.49.1791962591088;
        Wed, 14 Oct 2026 00:23:11 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:10 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Wed, 14 Oct 2026 08:20:57 +0100
Message-ID: <20261014072109.1759502-18-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the switch, receive interrupt and per-port PHY modes and MAC
addresses.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
new file mode 100644
index 0000000000..fcbdbafa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s Ethernet switch
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has a five-port gigabit Ethernet switch with a traffic
+  manager, a buffer manager and a DMA engine that connects it to the CPU.
+  Each port is described by a child node of ethernet-ports and becomes its
+  own network interface, with the MAC address given in that node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gmac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: The traffic manager's interrupt, which signals frames
+      received for the CPU.
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[0-4]$":
+        type: object
+        $ref: /schemas/net/ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Switch port number
+            maximum: 4
+
+          label: true
+
+          phy-handle: true
+
+          phy-mode:
+            description: internal for the SoC's own PHYs of ports 0-3, gmii
+              for an external PHY.
+            enum: [gmii, internal]
+
+        required:
+          - reg
+          - phy-handle
+          - phy-mode
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ethernet-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phy8: ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        phy10: ethernet-phy@a {
+            reg = <10>;
+        };
+    };
+
+    macaddr: nvmem {
+        #nvmem-cell-cells = <1>;
+    };
+
+    ethernet@92000000 {
+        compatible = "zte,zx279128s-gmac";
+        reg = <0x92000000 0x400000>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-handle = <&phy10>;
+                phy-mode = "internal";
+                nvmem-cells = <&macaddr 0>;
+                nvmem-cell-names = "mac-address";
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-handle = <&phy8>;
+                phy-mode = "gmii";
+                nvmem-cells = <&macaddr 1>;
+                nvmem-cell-names = "mac-address";
+            };
+        };
+    };
-- 
2.55.0

