Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26447255B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836577; cv=none; b=gKyQf/2Cm39J3s5nQ8JK7aOFjXCOpIq7HfnyIICCT7v4yDJ3YO8RWNL9d0IS3cr/hzYf/fHnzfbYYz++h/hAh9Ep9krbWI2Q8jjAO+Mw5I8qxRLjTgRhe1wLJWy081VD0j6S0ddb67wvWY48Tn4SL3hIKVlu8Gy18bwgIf3ga/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836577; c=relaxed/simple;
	bh=cfYLMttHm5lYFRShaioVB/9FzuF8nxuxPzPW7wPQFvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/8T0Cqn/gY9BBEFA4MlXc3Eg+T3cbdZTa1B14404wwbhGw0chpXnxCy7/t+bAeqAVQ+3TfYIFRn0Sn3HWRu6M1eXnIJIHsZaO/KRBpfrSOGUrcF/dcAReR6TAT+4SCIgOh0b4Za8oQsJyCySbvqEfcFwc5pDmOb3Xp0DNo2/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNddpMjm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNddpMjm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b14637dfdso4607415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836561; x=1788441361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XDY73W5+DrXEydXQR2nkbVBUMArg5jEL4W2f2kgOO8w=;
        b=CNddpMjmPnV3DrhHV6NZetJs7JJCu6CCehp+OeHjbTFHlFFMQuUjLgewaMCEx9h1q+
         9x/0EhI2UbXgKzxXFf2xcjXQc8UungWx310XAn1COzuOCySm7RXB5wixvb1Lqfi2f/BS
         MlhMTXN28RU6GbwhhcJFLFOZIncM5NzivLkZ7Edu5OgnXweuj/n0Cx5Rn16QvzX2h1JI
         +N+MtqJsiVCH4c5ODEP5HuQrAfp4VaTZbPGJWzJB4IZ9bouwvpbv6Cfmf30ncZqy5uZf
         Z+iFhUUbj0/8Nqar36V70SYiXx7io/7xqOXTcNJtmjcYQWWJ4nBV8hSndRduQ10ygZl9
         Cp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836561; x=1788441361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XDY73W5+DrXEydXQR2nkbVBUMArg5jEL4W2f2kgOO8w=;
        b=DWJnbPCJDyDmEgRYsPMZDgfmeRZ8H+O8pVnGtblm8HClBPhP3bU1C6g1Epontn25wv
         +Dfq5lgQlh4LRlOOwOCq4eueVrDBxGAAdkzGTRxumveH1LC/bvvFG0R84r6ZjRuge8ru
         6nK1QBPY4qoMVQ6lyx7UIj5VbWSllGFfzZH9Yz9lYoTdea8mLAt3cL+5m6ZwhEhHGXIp
         DjU6KtGPG86Lr3oB3s5+W7oBZBhBWjWv4EKpwqmElfDP8BDrCP15O4oRh+8aSH2uiD31
         7znF6NAornt2t3qLuptCvUI1SN/naEFG34YCVhUDpPZ+tIa1SFCa/KmhURheLhG8sm+W
         yeoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKtm2SGrnTQGBUX7HBkddjzNAouXyEOZzZPurzE7/91XYfZgV3HRkn+1tWRCy2hrJ4uHhq3sll4yGiDOY=@vger.kernel.org
X-Gm-Message-State: AFuF++l4cmBlc0f1yGiHVz6J9PMfSZJqMUGp4RoVvnSZQrusRkvpgANJ
	/GtXzVSmwRyzmYxLow8qk7a+C1jzf2/0e4NxY1y2X97xfWrZLuR/Gp2v
X-Gm-Gg: AR+sD11MAu++ZBINrNsDhFziex04AtoVNdZkbSxBTWpaTAbOj+3AAUoj2G2lnzSv9VI
	OSc2tpIVaa+cPTg+qxWQmkFjZMcZbT7cpH96td0wDQTp5rFfZ2gSgzuGSi5eTyyFbmlVgPZNAaG
	heysq5/+oGGsGA93tyvoWPeRYjLP0YFyhUYr34yIZ4nUTowEvg7L9VRGYNFHPskajj2g1d1oYX8
	3U39sWdYUXpcfWGG5LF6OP7XhAympyHqEv2DX9Zx4rdetgQ2LayjKPlf0Sy1jIx/y0IcGCPlFCU
	/BJCfbnKHdNwJ/9xBCWiqmU2DLbR+QWeZQunZnQJK7CmLjffYq7YdnsCyg+fUDnT9BzAg5qboF3
	Adpa48Oh1BTZe9JCs0tPjYR6KtrjWMUJUzmZ8VZSb2DNFIukG5XHGGPbUYLn5kQewBA2VVh/aTx
	ECrRIRDdWnT+xg6ggAqYMNmnvFhzRmeL5GqNWPE7nqWcpa90W9krrkSGgEVCMqiSHkGq5AgeU+R
	0qT9gZCqsYXy/p60G2fosdPbODmz6ygXUqOTDL3aXuTFHytfwS5ADzQ1FBt29E=
X-Received: by 2002:a05:600c:3b0e:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-499dc701419mr155135385e9.5.1787836560352;
        Thu, 27 Aug 2026 06:16:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:15:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: phy: airoha: Document support for AN7583 USB PHY
Date: Thu, 27 Aug 2026 15:15:45 +0200
Message-ID: <20260827131551.26725-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827131551.26725-1-ansuelsmth@gmail.com>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7583-usb-phy.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
new file mode 100644
index 000000000000..7ec655253a8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7583-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7583 SoC USB PHY describes the USB PHY for the USB controller..
+
+  Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  On Airoha AN7583 there is an unified PHY implementation where a single
+  PHY provide support for both the 2 USB 2.0 port and
+  optionally one 3.0 USB.
+
+properties:
+  compatible:
+    const: airoha,an7583-usb-phy
+
+  reg:
+    items:
+      - description: phy register
+      - description: ana register
+      - description: pma register
+      - description: dig register
+
+  reg-names:
+    items:
+      - const: phy
+      - const: ana
+      - const: pma
+      - const: dig
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  usb3-phy:
+    type: object
+
+    properties:
+      phys:
+        items:
+          - description: phandle to Serdes PHY
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - phys
+      - '#phy-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  '^usb2-phy@[0-9-a-f]+$':
+    type: object
+
+    properties:
+      reg:
+        enum: [0x0, 0x1000]
+
+      airoha,usb2-monitor-clk-sel:
+        description: Describe what oscillator across the available 4
+          should be selected for USB 2.0 Slew Rate calibration.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+      '#phy-cells':
+        description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+          as defined in dt-bindings/phy/phy.h.
+        const: 1
+
+    required:
+      - reg
+      - airoha,usb2-monitor-clk-sel
+      - '#phy-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    phy@1fac0000 {
+        compatible = "airoha,an7583-usb-phy";
+        reg = <0x1fac0000 0x11ff>,
+              <0x1fa6f000 0xff>,
+              <0x1fa6e000 0x3ff>,
+              <0x1fa6a000 0x8ff>;
+        reg-names = "phy", "ana", "pma", "dig";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb2-phy@0 {
+            reg = <0x0>;
+            airoha,usb2-monitor-clk-sel = <0>;
+
+            #phy-cells = <1>;
+        };
+
+        usb2-phy@1000 {
+            reg = <0x1000>;
+            airoha,usb2-monitor-clk-sel = <1>;
+
+            #phy-cells = <1>;
+        };
+
+        usb3-phy {
+            phys = <&serdes_phy>;
+
+            #phy-cells = <1>;
+        };
+    };
-- 
2.53.0

