Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540374AA577
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637251; cv=none; b=n9PGVzqiKmcRLnAS+Up+BOe5aD7M8qcHSzrZdjT//s7b7/Ec4O/9hZE/r4w0iR81Rt11ao7GUISeNeWXJ20TalyAY0UdUDlbOhhsx9Yl+0DiRG/Rpkd9bRWOwgKlgsQ9U/rJONMJN7nLyExjufGB62YJtmJP6YY8Rwcpifo12dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637251; c=relaxed/simple;
	bh=8cE+kRigrC2rLbTtNcE4tzjW4qt6M+Ijxp2hlZozUug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cd7VbhZpjZXiKKj+gKfKVOmon3+N5UfF/W4pQG5nCSXQv3eUR1fDLgqWjzAgZK0xo9aiU1+Y2g5jksh0PU8VM9xemw3ijeiF9xv+gSwzvvYVkPK3iiMBoVPbzLsrUPuRV9Wn92gjvg6uBt9JUPTFqglt2E/Jr1AIzhOw1QPWwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6wvYjMq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6wvYjMq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso5558855e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637245; x=1792242045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=a6wvYjMqGOOiJx9fOCfWsGphAcSj2W68dynQ9WlLrvExRGKNfuMPgI+7rV5dmQw1eG
         WTVbFGiVLDn3k4l49u+HXpZ/Pxgp+RF+hWlWeb+QdMWFT4CkToXerOHa8K1kQ3lMypIR
         /AX2zhtMs4vXlGeVklOyQKqPCKAzvKnzBA1fDT0FZaJswcQ/Ps553F3VYeDs4z3dTQC/
         lO2nEX2y+ea1eArLqSuXBV+UdqptDY+s6AiYzwSr4m7GHyjhUYz5JJZypib9q0YXiESs
         IlTomIA47dXHwoT07svtdIQFNjF7x4naez6X9dsJd4xi/hqiUVjyfCayl30ESCvW9XfZ
         +weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637245; x=1792242045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoroDu6xICaIQCB3Y6XVwmspeLrCWXpr98G9YRTCm5U=;
        b=hpOMzjH1Al+p79h5/lp9JfJ0LQw+jfwJzKC4ah90Oac0ta3zWUpna+t/BeQNrteu5l
         fESyAwFL0i4BT4XZgy/3e6tba8vpExoZ1qSUXM5OeNrJoQ5CqzFe9hPGAWYr92+5cAkz
         pHXfpP/daCehGHdeqC2yNv2/leKQamnOQPdZPTIEhrdE5ncqx4cJXsrdynIL+ehrWjd+
         bSPQHNjVB3oMHEjOclwA76epgtsIhsW0+tnxOlKm6L7Wge3pUn8GrJRgi/Pvjte22ID4
         vOTkXe5ly1JPtovoIQR7mAn0P+nOjcj2/ftBLys9oLpiEnBUYyV6pjv7AyaLJzkJxtIe
         uHHw==
X-Forwarded-Encrypted: i=1; AKwUvByje0es7lTMThstCHM8aHrMxNIBHBOwZUZgvQ5AuaLRO4h0S8EIbG+Naa7s/MEKS7fFfUARlmOsej52nmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq9wNWfM1Kw1CxwBkyT4rMmP/N7bCKj2r9/HkFnN2l7oSw2AsH
	8A81GvDwWPmDwNFtbtLnNtWHYPQFg3mCpxBLvBaDeXHKVh3xSk8rTkz6
X-Gm-Gg: AYBFou0ep9OiIXa8IcCOn8iTXJLbfBgRZOAZ0RUTpLuyrqPxHmHus6inQjqgBMe3wwq
	yPtiv8JYzJVe4VocS1b3DL7uNY9tXrtTnL9HgrkNsjCUCMRH+BQek0Jn5afzgcMHelO/OFc62Q9
	1OUUsuWE21RgflzVeEbfLKgYqZ8aMKrMBNrT2VlMrI8YnLX2HCgXZaJI/wZs3zN8aAbT5Pd58ZD
	FJ6b+sYEmFEbzFCqlprKobk8HSOxXiY89g+zpK9ERD55I9962GI+zVZGsZIiNxHYCyDnTNcLlrr
	aLuucJQjV6FquFpNj6Vigd+zqRHvWOiPwWuLWXAP4gZpnRLMrHgSqA3FU1iXJ4K1p0SEbl62VQk
	5Qn/JQ6Ft7qKW158Ofa0cDfzw1DmxaBUAqzPuxZuqgUgksa0vrlRwrAp7uy7aA1rXEEKYfVtSa/
	hL6CSsHOTtdxEBOhYkZ88y8h75X0SRSsaRl5oaVuo0Uof9BPCKDK35IIQ9ziqDvoL1ptH7p+h4A
	rf/+R3o7P3uHADZKepLQ1hu37VCQSAYsv8aAkCXJGA4rqHTJZTGk6ydRNlj4yO/GO3eDfuN85HE
	ppfHYf9n2aSi8HZ5hZZwcw7dAwAv9dqAMgf5VQK+OYPWPW6Ga3YIiBV2BNyQ8A==
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr91375015e9.34.1791637245361;
        Sat, 10 Oct 2026 06:00:45 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:44 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 17/24] dt-bindings: net: Add ZTE ZX279128S Ethernet switch
Date: Sat, 10 Oct 2026 13:59:55 +0100
Message-ID: <20261010130024.177503-18-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the switch, receive interrupt and per-port PHY modes and MAC
addresses.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
new file mode 100644
index 0000000000..56c81aa6e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -0,0 +1,108 @@
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

