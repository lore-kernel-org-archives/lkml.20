Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F74AA01C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637247; cv=none; b=KBxAt7xqYaJ0gvEihOipDmpBVMAhXYKpfs64WeabNho9+f5Tp+zgdO9Ts0F3OJKBPak7XzeDwNSb78oI1eqqQ3NKHbk9a9YHmikv1Kr158BzSj54IJYqtJqWLJWdZN8ESVoSAF4IoTKiOQaKuRBBp/ocCEX/i5RS3HGUcbtI7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637247; c=relaxed/simple;
	bh=2Iq5URQh8j2cslcdrK0rHb5Ovhb0ZDxTNezfsgzf7F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rG2VJ5I4VovgjqGmqg6uPoZhI9L6xeYrXCpx03LxlS1QPS+psN6h88/Dw+1Z/ZaklOUO/nQIYyyIhP6H6Q60UpxGbs/oM61kg/TOy6LlVrCm+h2CnqcoqpnNPhCxtbskM8xc7FSPeGIEII59p9NfexGDtUo87o4b+9UcJRagqes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQoKGILb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQoKGILb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so5476935e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637242; x=1792242042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=HQoKGILb6dCVDFNnZdynmwig+/qTr+oECPl8e6x5mOIRMJLrSlQYRO4oaUUJVNjCoK
         Ve8K/Fmze5Bbtcm6qfd4O9P7HzwogRzQQ3aPnpgVZHYUXgoMi48O7H6PbjVa4A2itkaD
         UTwB/sexWVnrH9tO7Xw+pBk8g3U6t9HfTbKTdjUNsAoRoLq7M5xSfsumyNX85gnJXsrl
         L/5L2rDjimjeU0c0rrMbvjA23TcP3JjBOOdLZUi5wZUBZK9x4nPTf2xXXQ1OAYG2zo4n
         4RCmeEU4PLRz+i4EPsRYn0di0a2P7dQ6zMai1cfO6O4tLJcAhhFcDEQ5kR6kK18mTSpV
         VCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637242; x=1792242042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=VX+c7onqLVZfTohqNvRw0gOQ9L7aeEMK8S/dQ4MNCgfPTC3rdeKN0Mw+iTh4Pg6iYW
         1Zu0pLyt3Q0R30v98IfYpEEdc4j8oLbwGjCuRc9uOsq7OfAsi42vFXuTJ05WQ2yhrsPH
         jHGOaY7X2/AZumBeePFQ4VsUPqBCgdr/iG0WKB4R106vOSEglFWWWrA2MLaTCRJlSfBT
         AUZzCRI9xDdAjX3JeaRiQi8z5xx7jzuitTpbEEfTIGLhfxLVyeYjmbaLY9oTAOYhIqWQ
         D71buofdB+uFsYmSfzK5KttUmqKFSsmJ04fNDi2UU9BAOJWk9IJ77VTZz4IdUzefOGje
         hlRw==
X-Forwarded-Encrypted: i=1; AKwUvBzkVJ28lIo+0OnKZJlqdRZzW1mjQncIoyJAG38r0RIJREcY/6+LzOiI5GWuMLz1ocYpMjo11cPuIYeMUkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZB95+/m1fueNP7x6yZCB/8tQKVHlshKTf5uV7yw2L4+kXp6k9
	V5zbsH+dMr9O59wla1UVHndiClXqG/KLcMnbgDal68GCLUiHWlIOyk3M
X-Gm-Gg: AYBFou0httmZTi0a+B6+/pb7QWAZGAXnOKQ4Hf4Lo3fCbPGaGprWx0jk1PcifnQz34b
	+JOEAYFHDCWsi2wVAH7ALxEzD1crnKgx1QHVRo6GbaMaVXDEu9v+UCnQkYm8KFLUwyxcrpTWVaz
	IQWVtN6y9zMG0KP91Zi5ii8HnfQNANHIHOZTZu/9EHMxPQFtPg3iBJdfDo88Wh0giSbvqwTVq+L
	3JCQd+oD56JUvAH+CFfOkDyKttiv0L7Z/NjiDijhESAJwKTl8Ob1V0q/mA6dC1P9eZpb9SYS2jY
	AyBe+uLOeL5zmdGcU9C4CHnHeVVqqFPrgSqlbUSJ7jlH2Se8+1JSTOSEgPmXZXAlFKQp9vffy8C
	oisc7WuB2rWBqApJAHlficP2ha9IK2g6jViVD4OYVpx87G2rovYjgwapkVGNohH4bAw6mVocCSF
	7FcMbHFyaj40X+Xsk18YWZdyURU9I38xDU5fE77iisQsNbf8UNexiDB51xDHZb0y5VR0jszQYpH
	3upV0PSJgd8LykzxOxksECNz09vwb4AWiPmBATmd+ju1QRbX8M/QbbHQEmJLdgxlFmG14+XGaBk
	0/dJtL22KkfviF2KWm4oOkDnU2uCegjgrdqTg0eNRAicQpLFPrjDj8fvU9chng==
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr95532245e9.11.1791637241030;
        Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
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
Subject: [PATCH 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Sat, 10 Oct 2026 13:59:50 +0100
Message-ID: <20261010130024.177503-13-ghahramani.navid@gmail.com>
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

Describe both DesignWare hosts, the two control syscons and the shared
Wi-Fi reset lines. The shared-resource model remains an RFC question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/pci/zte,zx279128s-pcie.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
new file mode 100644
index 0000000000..57a4e96610
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/zte,zx279128s-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s PCIe host controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has two PCIe host controllers based on the Synopsys
+  DesignWare PCIe IP, each with one lane. Their clocks, resets and PHYs are
+  controlled through the SoC's Top CRM blocks.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: Controller wrapper registers
+      - description: PCIe configuration space region
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  zte,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The two Top CRM syscons that hold the clock, reset and PHY
+      controls of this controller.
+    items:
+      - items:
+          - description: phandle to Top CRM 1
+      - items:
+          - description: phandle to Top CRM 2
+
+  reset-gpios:
+    maxItems: 1
+    description: Board reset line. A device connected to both controllers
+      (the MT7915 Wi-Fi chip of the ZTE ZXHN H3600) has its lines listed in
+      both nodes; the first controller to start resets and releases it.
+
+  enable-gpios:
+    maxItems: 1
+    description: Second board line that is driven together with reset-gpios.
+
+required:
+  - reg
+  - reg-names
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-map
+  - interrupt-map-mask
+  - zte,crm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@f000000 {
+        compatible = "zte,zx279128s-pcie";
+        reg = <0x0f000000 0x4000>,
+              <0x09500000 0x1000>,
+              <0x1c000000 0x200000>;
+        reg-names = "dbi", "ctrl", "config";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        bus-range = <0x00 0xff>;
+        ranges = <0x82000000 0 0x10000000 0x10000000 0 0x08000000>;
+        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        linux,pci-domain = <0>;
+        zte,crm = <&topcrm>, <&crm2>;
+        reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+        enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.55.0

