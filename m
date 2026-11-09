Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247026;
	b=c5w3/Jj2HGupe0uVd2zGcjbT4tBVrkUt7K/2xpoOd1OUKK2AFc6+EHISwIblrLUHMzKn
	 zyodAg2D5d/1F3KoQBBv3VuQHbBbjTA7pkhNopIveoKUmFLZ4TRaZ20Ux3DVm23WZexeh
	 zXOmzVtpGoO0tuxujdKr8kTVy7AyC8rJ9OCToUeBZyqNgHUE83Sgs2J7AI+Vl7K6bZv+v
	 l3pp5jV6BTAmyiHgIkM+sJPh6l7EsOkc80g8llwbmoyZyghEw0FYf17fCVmDFUhLGQTSq
	 LciM45XIwPditt9d/mlkR9tFdu9SwjVbarOTH+VfqP/UpvC9D4vBTED1FFoljugcVmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247026;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fKR8UMXrNocm7Qu6rSEm0sgLrsGr1Gnbf2PIxfeMwh8=;
	b=5KPog1dNdw+LjOFRrgVoU4NwC6yQQQGvX2NpXUxnpYlkakXWfkXV91dvYgp+vkybuWsz
	 WYGWKv7pbOjsHXCZocbYVePc2glKIID51vgLUxnIQE/dPLpR7YYOI9dm8OvA/ggxIcNzu
	 neUuWKCjr4qmiA5NiRd5LLHR065wkROFrNH2xqHb5AWciZfmvF1GiAMPWSmRqDqIGHlrN
	 b8YlDgdKOi/caSqar4QqvGufDkNlNp8tVLxUhnpwjMqlCbQAMAaJ4Qr99JmMTcUhH+80n
	 8sDvmLFlc7IXDF+eGI9WtluM3PSXEblUwFO69/4+tfFW4pJmcRFOYNms+NPplfUFZJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3F6DRxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A7606A321;
	Mon,  9 Nov 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3F6DRxH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794247025;
	b=V5Kho2fv289bPp6W9btppmoa1S8ClkJGcyQ936jEFcVsPi9WiscSyENe2gswENVUUt84
	 Xq8JdCk3mKeZLrZzsXj21sL6jmUXqTZJ6A09m2j5xcCA84/7wPIme9j4W2Xsj5SyNQPcW
	 79VS/phlgBvNvz+6V6B9GXDZf+sOXCF+raqA0j7RrWVUM7oUjW6/Nn1ztY3wvHBEKOZcm
	 WhZStGyXBDGpSsOEpVwTCrg2ZUYfs2VLgYRidQ9xozRBBGgIEiOINKMt+FBWUsLYz1e8i
	 B5Ipeu/m97cB4cqeVxgixDFfV+bPaX5e6lIZhrLiWYllDGryGqmyxe7YAJPNTbtmNog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794247025;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fKR8UMXrNocm7Qu6rSEm0sgLrsGr1Gnbf2PIxfeMwh8=;
	b=RXhqvGLAdZF4CGQ7+9UVwC0u1oLQPZTBbe4MxyZGcu9y/gHb5yUnHCegGnHNCHdbT0uh
	 tWdUMIZb8yUjA+m2moYvkxlHwik4bDUcJU6mRFC3Di+Cc/d32thAxGVT9IVMmXA1zHpzl
	 xnQAaj8ffJf6KNJyUuXVvQi2X9Kw3MHM7yOpai6Cr5fHgJTn+rLqERwivNFij6Kl8tPS6
	 fUZydRwsJqDAYTU61CyCp+wBFAd46C9rUv2Dfxs520Ej6ESUR7RB9+ZFBH6Pvf3S/UryE
	 hJdJLELwvmGjoG2gCQdP2BBRwPJGCwLkFKjukYD10E0bPcmkrezhMQZ8cOL5E2z5G5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BF141F0089F;
	Mon,  9 Nov 2026 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247025;
	bh=fKR8UMXrNocm7Qu6rSEm0sgLrsGr1Gnbf2PIxfeMwh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=K3F6DRxH4nmsO5Aaz/p0R4f1J8rCcWwRBGZcaGFY7zFlKhgWi1GP47dlYwnkrJlmn
	 7IaV1iKCGj6phczxontXi4YsxmuTbksxZUsx7+bS9/6Hkh0DKdCsS1CeLE8i05Y9ic
	 RnvadgUHq4QmxfzJU+ssQrXkhkz7BYen6kxrGFFM9lL0liFpAvQZPOq2LYicqctaQf
	 TKbZ98P7zBQJGRYZAI2F894ulwEMObS1+TMLmGdLumtPCoIQVIhRY+TmGVY/v3aFqS
	 LSlL0W6k8acoFSLLSxAqRj9V7xcPt2x+rVJ4RD501HGw1mhu9YxmWxNeMTqmXg1IMd
	 jAU3aYJXkZMbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 75EB74858F;
	Mon,  9 Nov 2026 17:57:04 +0000 (UTC)
From: Ricardo Rivera-Matos via B4 Relay <devnull+rriveram.opensource.cirrus.com@kernel.org>
Date: Mon, 09 Nov 2026 11:57:03 -0600
Subject: [PATCH 1/4] ASoC: dt-bindings: cs35l45: Adds ABPE properties
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-cs35l45-bpe-v1-1-9d7bc95a90a4@opensource.cirrus.com>
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
In-Reply-To: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794247023; l=6837;
 i=rriveram@opensource.cirrus.com; s=20261106; h=from:subject:message-id;
 bh=Pd960E667LHVi6FmIxmZ758aNEZWIIdo2651OW+cP6w=;
 b=yPUJShhSoVV+eS8cd+cqXiQsZEpiAy3TJp75R0IhRUAB2RltEcbsPpXZnacBNZrKMcZGjMpo/
 SHc/G9mLOTpBvDff/83kxALj5kWxjS8n/SF9v8zUU3IWUjPgSPFe0ku
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=k/iAEAtSPXvaWRDFupudzm6His7B7iJP1uiZ578a7Y8=
X-Endpoint-Received: by B4 Relay for
 rriveram@opensource.cirrus.com/20261106 with auth_id=1437
X-Original-From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Reply-To: rriveram@opensource.cirrus.com
Content-Transfer-Encoding: 7bit

From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

Adds devicetree properties to configure the amplifier brownout
prevention engine (ABPE).

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 161 +++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index e674811b22b2..2c118fa57ad1 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -16,6 +16,62 @@ description: |
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      required:
+        - cirrus,amplifier-bpe-enable
+    then:
+      required:
+        - cirrus,amplifier-bpe-response-mode
+        - cirrus,amplifier-bpe-thresholds-microvolt
+        - cirrus,amplifier-bpe-attack-rates
+        - cirrus,amplifier-bpe-hold-times-us
+        - cirrus,amplifier-bpe-release-rates
+    else:
+      properties:
+        cirrus,amplifier-bpe-response-mode: false
+        cirrus,amplifier-bpe-thresholds-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+        cirrus,amplifier-bpe-attack-rates: false
+        cirrus,amplifier-bpe-hold-times-us: false
+        cirrus,amplifier-bpe-release-rates: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 0
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-db
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 1
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-microvolt
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 2
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-microwatt
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
 
 properties:
   compatible:
@@ -123,6 +179,103 @@ properties:
       the current monitor (IMON) circuit is put into a low power operational
       state.
 
+  cirrus,amplifier-bpe-enable:
+    type: boolean
+    description: Enable the amplifier brownout prevention engine (BPE).
+
+  cirrus,amplifier-bpe-response-mode:
+    description:
+      Amplifier BPE attack and release response mode. This property
+      determines the ABPE attenuation natural units.
+      0 = logarithmic
+      1 = linear voltage
+      2 = linear power
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  cirrus,amplifier-bpe-thresholds-microvolt:
+    description:
+      Amplifier BPE response battery voltage thresholds for levels L3, L2,
+      L1, L0, in that order. Each level can be set independently.
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 2300000
+      maximum: 4500000
+      multipleOf: 10000
+
+  cirrus,amplifier-bpe-attenuation-levels-db:
+    description:
+      Amplifier BPE logarithmic audio output attenuation for levels L3, L2,
+      L1, L0, in whole dB steps. Half dB hardware settings are not
+      supported.
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 15
+
+  cirrus,amplifier-bpe-attenuation-levels-microvolt:
+    description: |
+      Amplifier BPE linear voltage audio output attenuation for levels L3,
+      L2, L1, L0.
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 187500
+      maximum: 1000000
+      multipleOf: 31250
+
+  cirrus,amplifier-bpe-attenuation-levels-microwatt:
+    description: |
+      Amplifier BPE linear power audio output attenuation for levels L3,
+      L2, L1, L0.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 31250
+      maximum: 1000000
+      multipleOf: 31250
+
+  cirrus,amplifier-bpe-attack-rates:
+    description: |
+      Amplifier BPE attack rate register codes for levels L3, L2, L1, L0.
+      Code 0 is instantaneous; codes 1 through 8 select progressively
+      slower rates. The physical rate depends on the response mode.
+
+      See section 7.21.9 of the datasheet for a detailed description.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 8
+
+  cirrus,amplifier-bpe-hold-times-us:
+    description: |
+      Amplifier BPE hold times for levels L3, L2, L1, L0. Infinite hold is
+      unsupported.
+    minItems: 4
+    maxItems: 4
+    items:
+      enum: [0, 250, 500, 1000, 5000, 10000, 25000, 50000,
+             100000, 250000, 500000, 1000000, 2500000, 5000000, 10000000]
+
+  cirrus,amplifier-bpe-release-rates:
+    description: |
+      Amplifier BPE release rate register codes for levels L3, L2, L1, L0.
+      Code 0 is instantaneous; codes 1 through 14 select progressively
+      slower rates. The physical rate depends on the response mode.
+
+      See section 7.21.11 of the datasheet for a detailed description.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 14
+
 patternProperties:
   "^cirrus,gpio-ctrl[1-3]$":
     description:
@@ -251,6 +404,14 @@ examples:
             cirrus,ldpm-group2-delay-ms = <1000>;
             cirrus,ldpm-group2-vmon-select;
             cirrus,ldpm-group2-imon-select;
+            cirrus,amplifier-bpe-enable;
+            cirrus,amplifier-bpe-response-mode = <0>;
+            cirrus,amplifier-bpe-thresholds-microvolt =
+                <3200000 3000000 2800000 2600000>;
+            cirrus,amplifier-bpe-attenuation-levels-db = <3 6 9 12>;
+            cirrus,amplifier-bpe-attack-rates = <6 6 6 6>;
+            cirrus,amplifier-bpe-hold-times-us = <500 500 500 500>;
+            cirrus,amplifier-bpe-release-rates = <5 5 5 5>;
             cirrus,gpio-ctrl1 {
                 gpio-ctrl = <0x2>;
             };

-- 
2.43.0


