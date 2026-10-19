Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5B4C33D3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404586; cv=none; b=RdDpayV+KxIvbl1N7grtXhrEKd+Kw2YPUG7a/YSdkSrG9ceaf2FiHvNMz2yGcYu8Vs5xjYqH5a0CQ+EbfatIbaXNAe5JDvKk7DEg+MaJCaQwYcvlreTvlhvbutH11PGYmsjNlXpUCTxbtvFM5Yxfg66tWgHFsCF69l1kHoKITY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404586; c=relaxed/simple;
	bh=uckZyXVLlKGBcOMrrx1IvRPD9w3WkL3fsgBO4V5Ixp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=et3DxiH6e8JAObqiM/xAh/ddIq1xL3LIzG79OFfjtj336bAzZfvNab2RCCZD8K54lqrMDz9l1r9jSB1CgCkyQODye8hqBF1KLfvcxX0xAEzqF6PnsugGqxMHcbvOE4tfyHJdA3UXSjNywUeGRnHbpvChA7adP0mczcvlx89CM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsFFxPoj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsFFxPoj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18510675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404583; x=1793009383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=OsFFxPojFn+sx11Td6WUfDZkMG8RVf4y8u8NUGbT4SRsgdMAp79yIDmPJ8FGT5OzFY
         Iq9uxiUOtMFDkVRQFMh5NlcuVWpofsgz+MF3++z5OVfbtf+bWIMhC4yimHtpoD675RD1
         iZyBpUWI7qaKSE1WWupMvdtxykUp59SKNCplNZkFGMbLHDVvvthZRxPehRc4tBHS2JHJ
         KFbAIvN79Zcw2l6y9ogr2Nm3ErAYYQjquUJi707fRD10ztkujGLHLKAmSl8D1IO4js2A
         OTnGfspvLvHZiRhyj070jhbiSvOL1ldeE6mVRsKt9htHuWwLIIaK6JcbXOCEDLrUgWS7
         N8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404583; x=1793009383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=qg3Qy6NQVHVLe7yCySTsiry0K340DPtsfre58TRn6vWRqzv5U5opSOa5S/j1jWiSbW
         9BUPY3xHvDd3SPtan03voG1xoT7qogsYaeqvrfBzPpJQe+kIroubZKgdYd92SJseN1SY
         Cyi95IA1DQSzu2Wygk1wnPIx3cmwlfvozYWcpbA24Qe6v9OzXAr37fRNlrYj+WAaEMkQ
         Ji1wf+r/7pfajOjlNfga4e5hao+44wuwzn/SuUrJ3gt4hbJ1k+sGKg+Nmc69aft5Zfg+
         YU+u6EH7aHtYSRWDDNZPHTLFPMJKksU+aPTTVZZR3fVP7nEpKQmsqaAtsQ+aBdXTPXUS
         afjA==
X-Forwarded-Encrypted: i=1; AKwUvBzqMY5P01LxRQ98AXIsckdgNCo56C7jxWrK6ep2ptDn64uHx3vBJFRLutkTfLKW4Q1eN6T4YWtUwZvjwMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1dxXXPZBLxDUCtbxxZWBXEnLDlItfogZYQE5CUCPAKr2gBZs9
	spENpEPzfsi0KcHu5r9QWlelY094j8DrZyvuwxqprkmu4SXf9sXJNpTS
X-Gm-Gg: AYBFou0T6F8jHsVO3uaHBKtOSdPkjBgLPeCBrymHshL01u8IcgooLpOD2KcSDgZXnOT
	+0VWZYH5bcZnFcQhOeelQxT0M3si1jODQ8NGAYpdRUVqeuCCeAspe0XzCnuvjtesOpfh0Mrk1Yo
	hImpkKxV9oiN9uqJ5l/m0rqQsTaEywCI//cau4h0r4NOHkSw6pvOVpLgGhkpbCN1MvS7YxPlrlU
	X0NYxoopRLKxr0PcAHN86Fv0QwfqKKcG1UfvGiRJj2vSGzschWmzzs8NMY8hVQ7UMtIFo7lK6xh
	AZmFwf7JE918iuocHt/l0iSmufnsXv2jeJF55/WEOIxZF75pxaVebmqTEPF50zUaGhgyMDc3lnh
	V2//Wy7w3beX/4h01n6LXu7yNI5NomR8kfeuAgOKiIzuYir15RQ292LmNFdkg73HP0PfIt9uoLQ
	c7x94rFNCcsDJ/yF67CGyY/+VH3MAbz/bVrCRaCX5VkbH5VudJT0IFKadCQ+xjKYmNIbOjb1DKx
	Ls00pnBewmj1yaB3q4JaDEK9poyKQ==
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr153405815e9.14.1792404582625;
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Mon, 19 Oct 2026 13:09:27 +0300
Message-ID: <20261019100930.110954-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..0b4b8be9015bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 450
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^ldo-(a|b|c|d)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

