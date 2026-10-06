Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78793E3D85
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282591; cv=none; b=dsGLJLHUidyvFdyORpO1/qqjdWWvDX0wBLpNPsAZgRnNHoYyDeucxlxRButi2W40og7dMpCwSDb58MwirIqBU1sWkE9Ojv/T6nRUh/3KoJ1AKfxsWYjYer9Xkw19bOqzxhHM/dFSgwpBB5nbZfoaIIw6B2Vwk5z79AO2yK136qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282591; c=relaxed/simple;
	bh=GnJ1XZ0QeiU/YTLEycC2Q+SFmPBbH4BNS6SV3ErRa0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxhpRLczONUvpIJ+J1hQDh4c2gErE3cn6r6nlEti/Zh8aNtz0hdXyKOUr1AfFs4ZV28/dH0btPsKuuafNUHtQObvADYYQbaXfV/a5knDBI9xalnNHVxZKJvZsa5u2iTdoNLw7wWzIomZQ3SAkMDLYieW2mNSvVA4VGrEv7Tq550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQE9Qz/F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQE9Qz/F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so17358575e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282587; x=1791887387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lg3zQibfNcBS7Sf0Juia6yunt6F/9FPxX2r5Kh6Q+zc=;
        b=RQE9Qz/Fghf0KyeuLjmJ/8RhkZZRwOpS2nomPtOqeYL/mt3igeACjgzROrFyAARL75
         iIvE4hoXWOBW9TY4lzvyX63FP5O5Lm6+x4ZaZoxy9YBGBN4QFPmABIbySDfqjZVDud0k
         c/aUBNDeYaJ25oAdfgQjIgpyQuQqYscxjw9M4tvSB/+LC8alVpWWJgFjUHT7WV2unUwZ
         lYpJhAmT7/vQZjLo9vMC958GciE9pPyiHFPTucpE9Xh6PJLxGuTNiNEHzJbXHX7wJ6/o
         4xWmMwhhL5wozcvqxmdlW4hDeaXzG/DtXy1IcSJPcP0Pmy7OnHa0NDuHhASsoD4AdScH
         6qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282587; x=1791887387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lg3zQibfNcBS7Sf0Juia6yunt6F/9FPxX2r5Kh6Q+zc=;
        b=Gwpg+OG5TjlyBvq4x61EzNkOzGnmifYzkzXevxp66gNQFG/v2vNkxZSmDGYz9xBYuC
         IRhrehDdqOaWn3zjyAKNrRyhYekE6amEgBO/moFtj8gbusRddz7URljqVGbWciEWtMEL
         Hvmi7aHuc4QdYgpCelNJGl4r098YM5gXs8qdSXkyPO81BjzQDkkQefCOhIwWxCAmOJi3
         JnQFiD5xAd5swiAq7SkijEY98nCbOKUJveLPkKwkHtDIyQdRiGrei7rjF931IAvKhTpl
         O0L175dSi09qqiD+0goeud7+WmMIbnewLINvfty/kpe/R4ZpmcspeS6G6qj23yAht+m3
         zUOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8KJhC9Y1kLVn5RZ6uonGUoUNXNMBz17R4IaGzNwA4OayWkd5m5YG4eNM9Ftdjl1ZBJmdB1wWOqaJx5Bc=@vger.kernel.org
X-Gm-Message-State: AFuF++lnXF7PxJdFkwvjYbVkJCXNNMzfF5pkJY+U+oSyoL+xBRR5iXIt
	8IC6W83udgaK0r00VkRrGJ4crmgzhWdL1oI2rYWn+geDsibXkxnon/tA
X-Gm-Gg: AYBFou02SkaA8LLpu0+EUkRXDiiPz8o6gYAQlPXRMi4TN07FZHsS4vbFra3CjobW32G
	9vBiunG+V4rwI8r8TGjJ/4fpC00BVNvrd7q56jM2+EgbaSPGBTfKqkKS+BwvKzcBbR3k2Bw1zmp
	wB7n9S88waFlsAzNDWd46RSElK2xQOyGPtp+j+Dbq7iXRIT6/24OC3P5VoI9sKBtOMpv8OHGpi/
	sx9fZI8Ib0hz9Mz1+Ozg7z+a6u42DARYKdagXNg9ZYuW6TC//GGX+FP20l9hbtm3DeU4Gs6mDGg
	f9poSFSnBdOg9Mh5R4qUGer3TbGXu6pNVtBx1QV0nyq1LdH8Qzn05OiRAJ5TJJnXwpodyy38WBj
	tGRPb8by5doPjiwsAuT4vjKOLniuc2xVSKLAWdUpDE68ojZcZML59llExkc8eVQMmIuC94+ht/u
	i9RgnirPXs271FerlITyi4pnbpCiHl9TbuhgWyFVwY/O4qSv44uZBqaEo7JiTR+HWRyo9kUJ+YC
	T5ZpYiZha1wCowdIRltj5o3kEQ7S4IQ7idkWXOaREsTOnWt+w9pMNr6wF25
X-Received: by 2002:a05:600c:1394:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a17b551b8bmr15839765e9.23.1791282586565;
        Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm63427485e9.4.2026.10.06.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v14 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Tue,  6 Oct 2026 12:29:33 +0200
Message-ID: <20261006102937.10972-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..61a8d773f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0570815ee980..d8cf9722f76e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.55.0

