Received: from mail-wr2-f21.google.com (mail-wr2-f21.google.com [74.125.225.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F74915BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588621; cv=none; b=YuaoaQADAcHfcg6DpBygP3xpfv2YkBf4lByloAYG2RCenUOnJtqvW3JpC6mjLU/HdUE5smmrNxxior4cMHUQ6oRYQxeISBxFtToucoUOfkY2a7mjrFUQX7uv74NtVaYyoxjUXe/eSQTODDB/tZUl0V0g+0FG6WVqMNe/DoYUwqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588621; c=relaxed/simple;
	bh=fNTKonUy0/FAhs8my66xZF7DW3W7vEBYzduyDViRLv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdzJzeFd8vKs9NLmkTWh86VlwtM2Mq88xTUPN7DG5liBYE2hInEkSA4sIOhpiwIOFWVecl+dj9qcEP0udV7RpXeqQAHvc42UMYoctR7qvXL0oyoaugdmvxXFDkcKiW4yA7RTkrcpVck1PYjkvqOxlQCsunnegUxSDQRMrStsgwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrPtMj0X; arc=none smtp.client-ip=74.125.225.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrPtMj0X"
Received: by mail-wr2-f21.google.com with SMTP id ffacd0b85a97d-48881a62e09so1556254f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588617; x=1791193417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elEzk/snbsv6yNIQrza//d+cx8Ge2QxQ0RhCb2xVBrc=;
        b=RrPtMj0XUH775GnjDf6ILQGuJUsLCd3ewrbjz2ZqB+jpEVMF+QvhkCGjLzVdW0S9iZ
         ulsyUGaslbx+rMVzpr32tRJ9SWP4GsZRwCvQyIFGQSQV4+Pmo/QINIFvK4DPi5O7Qgln
         y9gBJTYNXpDwfjn/9evLZVsSDBysvsIUUYk8NcYzJXt1ET6E7pdOSnP/QdI0FS5THtFz
         ZmezKFXx2PGl5gI6s/k5XDaKZnD8zBES7BKdBYXUFmHFJS0rxPbecPRMLnRo17i4R/2E
         rMTzNEdlXMKaEhXPTpc1HrSixU4zy257maUNCwD3jtGLyvbUhmA1Hla6+K0s35+u8P9m
         8JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588617; x=1791193417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elEzk/snbsv6yNIQrza//d+cx8Ge2QxQ0RhCb2xVBrc=;
        b=eqDTulcEWwZ2AMaGfyLSlAVB8+LS7eQxhiICD40NdQukIV3C96kk1ExF4LK62a1KyQ
         ZS3B9AUsAjYy0GbrTr9VkMrcDefEfQybPlcispZ/ZSX68Htu3PzD4m39Bb9V3mE039Kx
         xY4T9fiMPnJK0u4dLX7SpFXD3lT3ETAnlYaG5RIYUbMQU/iA5Uh2MNIWmKUK1pjo8eXX
         fQqPcN4YSJrIEl/+Xh+m7heB/TQ81kHiQPxmkWK4Ou+c5iUFBuC/522kIl7q4hj7Bgt5
         VioOCKPS8ilQ6YgD1suuOHstiYQS3SzwFB/XUa5mcJ7fQlrFn0LqZsHOZVVeX/JK0pxz
         woLg==
X-Forwarded-Encrypted: i=1; AKwUvBx4sBqewl/xDRzxXKOoAa16nszPwMOD3lTsMXVwZRaFIuHF427Yfjtm0WZy2RTpsM7kjmHJcnxhSLJS2uU=@vger.kernel.org
X-Gm-Message-State: AFuF++miazSubFwHorMhmrfoix77PRW0rEMdjhdWABSANZFYXxzrI7/r
	Ep9vkr3l8TG4KIyJpfxkp2VplZ/eFV2dGR3lw5nDHAYswP/UcqsT9tKa
X-Gm-Gg: AYBFou1+lSDRBSv/Sai9ETghJLx58/XzpFBjiNDyMqLnbzRYPzuv3HYBtOfTq2gZ4lu
	QzSbgEl05+dfc3TJaPiwat4JN842xxAMMlyvWLvkbTrqdLPfMIzSUhrNEKtmVJHiH2l3bY4Qqlb
	G157To4lvx6vmibfrvTt2dm3/uB0ylTnl8eL3JZntakDoGzE6z6HF0WpvxdFFt4A+mkc1Y0kAiw
	AcEHWW2SYNn3YM0GfFVwqbh1QPaGsWJftqSnXccMEJ6B+GVpZ2UkF/q/dDAetdnxNMcoXhS8N5r
	4q+a96KGHi1lieD8t9Mm3H4lo1V319AgoPGWqOLqOSWi6EzVabKgtbiCXzAvpAC8OQbSxXjY4l5
	TyRrAZw+3qcHo1C3RFjuCMHYfcqE7OB4n4kNF6sBm+Xc7azGHQ9g0YkdlwZiWS3H+oeKCNzbdCj
	4Gk5sINpXVbCc5pnbi50WjgLfrtv3mLSYo68M7xQbRaq6/sMrdKBhfjM4A+68aRSSwUivwbkbqT
	N3fD/x9U+mndYiFIfr+t2C8d1HTBX1Z0uZutDvWse2r
X-Received: by 2002:a05:600c:4ec7:b0:49f:ff6b:bc82 with SMTP id 5b1f17b1804b1-49fff6bc143mr74538605e9.20.1790588617153;
        Mon, 28 Sep 2026 02:43:37 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:36 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: leds: Document TI LM3643 dual LED flash driver
Date: Mon, 28 Sep 2026 10:42:34 +0100
Message-ID: <20260928094302.86966-2-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments LM3643 dual LED flash driver devicetree
bindings.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3643.yaml   | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3643.yaml b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
new file mode 100644
index 000000000000..c212f2345d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3643.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3643.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments LM3643 1500mA dual LED Flash Driver
+
+maintainers:
+  - Rillian Grant <rillian.grant@gmail.com>
+
+description: |
+  The LM3643 is a dual LED flash driver utilizing a synchronous boost converter
+  to provide power to two current sources.
+
+  The dual high-side current sources can be tied together to provide flash
+  currents up to 1.5A through a single LED.
+
+  Datasheet: https://www.ti.com/lit/ds/symlink/lm3643.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3643
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
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 1
+
+      flash-max-microamp:
+        description: |
+          Maximum flash current through this LED. Each high-side current source
+          can provide up to 1.5A. The maximum current the boost can deliver is
+          1.5A across both sources.
+
+          Valid values for an LED connected to one source:
+            10900 - 1500000, step by 11725 (rounded down)
+          Valid values for an LED connected to both sources:
+            21800 - 1500000, step by 23450 (rounded down)
+
+        minimum: 10900
+        maximum: 1500000
+
+      led-max-microamp:
+        description: |
+          Maximum torch current through this LED. In torch mode each high-side
+          current source can provide up to 179mA.
+
+          Valid values for an LED connected to one source:
+            977 - 179000, step by 1400 (rounded down)
+          Valid values for an LED connected to both sources:
+            1954 - 358000, step by 2800 (rounded down)
+
+        minimum: 977
+        maximum: 358000
+
+      flash-max-timeout-us:
+        description: |
+          The chip supports timeouts from 10ms to 100ms in increments of 10ms
+          and from 100ms to 400ms in increments of 50ms. The provided value
+          will be rounded down to a supported value.
+
+        minimum: 10000
+        maximum: 400000
+
+    required:
+      - reg
+      - led-sources
+      - flash-max-microamp
+      - led-max-microamp
+      - flash-max-timeout-us
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash-led-controller@63 {
+            compatible = "ti,lm3643";
+            reg = <0x63>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0>, <1>;
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_IR>;
+                flash-max-microamp = <750000>;
+                led-max-microamp = <180000>;
+                flash-max-timeout-us = <150000>;
+            };
+        };
+    };
-- 
2.55.0

