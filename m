Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8989627466A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981160; cv=none; b=MAr6Pk2mADfDowsKFOLka7aqYD0ipTJJKSStmqiPRbma4d+kqM/5+QRx6xLy4LFzoj95l7lh8h0Li2VO6iC5g12CvSqZeqg6tR9QA7eINfQGhvwUikRdUMkqNVyw2Di6VRkciqSNjcQIU86KXnpK8CIerWz4bLh13bN65Ic7K3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981160; c=relaxed/simple;
	bh=6smDZg6FX3ydlxDcUe1XoFlk/nAtSbiRQRH7DWbaBw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5+J6FwQKf1ZGB3XGVJPCtm42kDdiqx+LBug7TL2v2TaHTqfAYTzq9bGcY4QIeMgJJyPUOZJB6a0vtlnrfo0isB8HVJjWj4tTImGlG7y7x4DWo/to3zRPLIm1H+5PoGzzbmPSVdXwbNC+jRkOQGSXWwjXX/sVYMB1KgAGcWLW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=ehErYBPh; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="ehErYBPh"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c25099bb1fbso232147866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981155; x=1788585955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3HUI19LAi4NPu5wR+/Bmyr8Ia2vgCBzo9Z3ziBwtkg=;
        b=ehErYBPh/TNr/8vuROvsNKoZWiO8vlljLdNuSW/jHczAgqsKWlAr7K5DvV22orT/nY
         74kri//oT3NRijcDqmvxDIezOcxmLYmg8xWP9I1EUcjmQ3VXGb2qqWXyL1VHtxR0EPkG
         g0NiOhbUTV2mmgx451GVmVFcmjuThKHsbwOP7a4PcoXVAeeLlFoAksifx7NiNrglS9Vz
         5UJ5q65Em2Hqb3rTNPMyLqyCW9IuOpAnDzMXWvp6gnUE451zjMw4ic24CJYkwF5WgE3n
         Rg8OuPrrK2IlAZfUo/+V9LWcq5k621QscWMsQZp2T1EzJnmHo1+SeQ57/u8eTwkTHMn/
         nZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981155; x=1788585955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3HUI19LAi4NPu5wR+/Bmyr8Ia2vgCBzo9Z3ziBwtkg=;
        b=QF5CN86omAd2GRNd8Nt2yBj1fKv3t2lRZTbR/Vkd/XuruLJqQMr8hLagAqYlJvMuD7
         6GKTu7Y0DrU3cfLjN3u0HRZAwrOPrvSRqIYPG1xeKmnXR2oqCFw+nTM4ZiKnFxJ4sLhc
         XwqwVXb6y8xZ6TQ455lnPVr7/Bi3ydwwYsc7QRnTZ1gwCpO7Hfa04xGisjn+Qbi/epFg
         Rb7Uhqb9ZZIXN5glPHnDfVd3wxrPC2w0X4UjOSOg1RQmUHLFfVz/QZCcFe2bowJMV2Px
         JnZjXBIp1WqhLFiY2T3XsTWg8RsdZxuJWttCuSVTyFoQTPCr4A2uEj/CbvPHmurzpwZk
         DA6w==
X-Forwarded-Encrypted: i=1; AHgh+RpPTWz+0EU1tRE9LxAoKKphZ79OW39BfY/oRxwKRag9rE+euxUj5crDkJFDzExp/RNALd8sAjVhE6ZlWoE=@vger.kernel.org
X-Gm-Message-State: AFuF++mb1VrVRTa86UJtUab+XkzyHMVHwXTPAhUhqwENMiolsKGjWLnm
	Yx5I27k16cMVKdTbcwvAJ76+az+6VIDjEJfJ9Qid/Ktcw76sPq+ZuZEszD2nvOkfyAg=
X-Gm-Gg: AYBFou1V3tElqaNYHp+FyZ7rJGysT9V1sE40GBmyJ88sHW8eAs9+m1N8mGZJDmEIfPX
	twNa4u5VP1pNzS4JRyCDXlSzmmVEf3/RPgZmrfp3RthwWe7350gYAkr+VJwqlzMa/jdIHx4PgDi
	KEjHKBiPpj8yVlAI+DvJHBCF0OuB6nJIYEzRz+/fArh5FyvsMLIfTXUr/17UHqqC05oQba9U/ei
	QNAgI7lTty5i5+5DwPprn8BPGgkBV+Puw4Rm5emSwBIGE59rkIEW4bippCUkCpl8ghafR1M2qth
	d/V+2r55cN2lRlt2IOG/i4PFgbbRs4hvmLh5t+luUxY05PzJ9qit2znnSJaIJhr3tHMY/1hqWy+
	zUzsh9tbIq4xZxHggnf/WKAA5zpxfPFlk67rsUerDg+7YFgDl4znep5eoQYiG0IuCvxZPgARDAQ
	4MrVZtIofeRAwuJJYtR74eoWhA2h9e80aEzTQDK01ygA==
X-Received: by 2002:a17:906:c145:b0:c24:bf0b:6b62 with SMTP id a640c23a62f3a-c2556baeae6mr819278466b.4.1787981155025;
        Fri, 28 Aug 2026 22:25:55 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:54 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 1/9] dt-bindings: net: add Airoha EN8811H PHY MCU
Date: Sat, 29 Aug 2026 05:25:38 +0000
Message-ID: <20260829052546.1152446-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EN8811H answers its PHY ID from power-on, but a link is only
possible once its MD32 MCU runs firmware that the host loads over
MDIO into volatile RAM. On systems that keep the firmware files in
a filesystem, the files arrive long after the MDIO bus was scanned,
and the PHY node alone cannot express that gap.

Describe the MCU as an MDIO device of its own, with the PHY node on
a child bus underneath it. The device downloads the firmware when
the files appear, or adopts firmware the bootloader left running,
and registers the child bus only then, so the PHY never becomes
visible before the chip can serve it.

The reset line belongs to this node, not to the PHY node: firmware
lives in volatile RAM, so reset may be asserted only while the MCU
is not executing it. On a PHY node the line would be pulsed by
every phy_detach() and wipe the running firmware.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../bindings/net/airoha,en8811h-mcu.yaml      | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
new file mode 100644
index 000000000000..b51a14a3b7b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,en8811h-mcu.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,en8811h-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN8811H PHY MCU
+
+maintainers:
+  - Aleksei Sviridkin <f@lex.la>
+
+description: |
+  The Airoha EN8811H 2.5G PHY is driven by an MD32 MCU that executes
+  firmware loaded over MDIO into volatile RAM. Until that firmware runs,
+  the chip answers its PHY ID but cannot bring up a link, and the
+  firmware files may live on a filesystem that is not yet mounted when
+  the MDIO bus is scanned.
+
+  This node describes the MCU as an MDIO device in its own right. The
+  driver downloads the firmware once the files become available (or
+  detects firmware already left running by the bootloader) and only
+  then registers the child MDIO bus, so the PHY node below never
+  becomes visible before the chip is able to serve it.
+
+  The reset line is owned by this node rather than by the PHY node:
+  the MD32 keeps its firmware only in volatile RAM, so the reset may
+  be asserted only while the MCU is not executing firmware. A PHY-node
+  reset would be pulsed by phy_detach() on every unbind and wipe the
+  running firmware.
+
+properties:
+  compatible:
+    const: airoha,en8811h-mcu
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  reset-assert-us: true
+
+  reset-deassert-us: true
+
+  mdio:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+    description:
+      The child bus holding the PHY itself, at the same address the
+      chip answers on the parent bus.
+
+required:
+  - compatible
+  - reg
+  - mdio
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-mcu@d {
+            compatible = "airoha,en8811h-mcu";
+            reg = <0xd>;
+            reset-gpios = <&pio 14 1>;
+            reset-assert-us = <10000>;
+            reset-deassert-us = <20000>;
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet-phy@d {
+                    compatible = "ethernet-phy-id03a2.a411";
+                    reg = <0xd>;
+                    interrupts-extended = <&pio 15 8>;
+                };
+            };
+        };
+    };
-- 
2.53.0

