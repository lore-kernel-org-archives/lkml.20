Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469E37BE98
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643350; cv=none; b=PWuS6xetuK2yZiyLMOm8cLIheXDAN7aA4waOc9Bdaukz+/PV+4Xw2Kqp1WjU7WpqoGfnCTQ7LVNk33QUzRFoyY4KtUNtr7gJ3nuDCisivMGT/w/x3ZaC4SZmGs/YBD+a0Za2biYZpn6PMGLoRibUg6vtoxD4SWpYAaQ1batozY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643350; c=relaxed/simple;
	bh=auCB5rNo6b+/K6OB2qyoTXEsixd2XWS1Ty0U4GrdKWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DbkV+gr+u/LryPSQhOvHojxAPXMf6Y7u5T+wrU7fp6vJI2HwbDZjDYscjVwpxluDzDbyj9Jhaf58P7QCcZaz8MWs+HEtRzxzMiKhaM0aSxyN6MZR9t0qzspH73H0iJLcdDQjME5aUi+/kXZyZpRv1pJp6BKnaGG4poa+fXK5hoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4FubtNC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4FubtNC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed442so410510a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643348; x=1789248148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9WYq0M3dpGnTj4OQeONNxRvWLYluAMfzIb1PckYIv+s=;
        b=A4FubtNC66zRyl5fLicU7lRMlkwx8nZ/+hCq5oRr+pMrk8z/lGFMIFZeM0PQwR4v2r
         VE6Ego9UVp6rDXIASiRljZHPOxDdTVfhmscjUumHKZCZXdbTrwCuLezXK4jU3p44M7Vj
         js9Q11WYEN9TISpxw4d03oSE/86g5GdufhQ76DxhtLipR9E8lgfYjdBG3RKZkJrRPuRw
         LMk5K/2BiFKJlc5MlHgWQq41oCzZZhd/ZxaH6TRYOIUudqVfGMqJxdNQ8JUmKgIyO2vm
         tV4P+GKheUzVHZ00WiqKI/GbG1InvrsDp4r4yTpwlSbnX0kmk+0pZrUS83R7+IGlZIWP
         fbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643348; x=1789248148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9WYq0M3dpGnTj4OQeONNxRvWLYluAMfzIb1PckYIv+s=;
        b=b1JIbmhjDvj5p9pww75yNlW1t9mld7nYA7P5t2+hPSUMzS0JmkVCUoB+HB5Ljt594/
         rOu1Ymw2eTsBYjjtqxaWVx6QDNl0LpF7aeP3YI+bw82HB5R7Yotzh39ypNKwHu05H5yf
         o/ql7KJm7pFnt1orFH+luFUakroWU45jD6h8EQFPf9Vo+dXvR1yhhNGZThra1MhzJXb5
         /XVk7Dn3XY/b16oB8JDg+PJSqLVRRc65qwg5RedqyM6XuelNBSsAqNL5fVpPA1zkTAa5
         EDLACQ8lHa+4UhMBdHUvhezd0oOBqM5hQQS902+58LIg3y3eAxqi8x1sRABxX6iT4PN8
         4imQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUEoQfZXIxvPSGKCBTKnPsVT+xf4EjKQlp4E4ioe7XdivX7n+SL6y2kQNdYX/BfObcaWFC0UiIGrhqVwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kMzFwnRiJfurBQ5JxVs6QOMcDyoF/1Ietv5ErejK2PE5448QIv
	7cZ5Q3Coc/q5JjGrb6FRlAWDHt3M7BR+nkmzqs0my1Hst4L81Jip5+BV
X-Gm-Gg: AYBFou0kr6XHE/WqP2MkH0iiMgWRRScpPw1qEE03ksnyvl1yXHJadIPmw6pXjzbQG3Y
	DXzpC71kWcdXaTe/+35lsqvjLYASk7AEc/3yvNBDrIiF9ShXlAT2ntYn6/jMNNiYvvPjfMdPHdN
	/1hgSEGeaQBH6IR/C/zMTX3za5PWgds0UGG9mX79iBjUkxobSNIPzjR1wEgjXtxkbL6emK9Gn2+
	6+Ryg5azw+sfDarIl8FauDPoLkDnA3pqLMgpnlFqnG3rIrHKyxq9DMUfPiO6HlqzggpzpJralzA
	4n/kUeSK3rldw33eSwe5CMZqKNpCIlagA/oShNuoZKEMRaKlAZg6wSUqWnb9YdCH3hoXUTnfOSD
	ktKObeNLDkuuEzmdlE7zpq3iGYDWQO+YT1h9igaXjLy2UmzUwZb0Q8V+GcxQ+LnkM1t9WJL7K/C
	elTDEoHoQjCjQqoQmRucLchURpYHiEsFzWFLNDGBoi72T/jfXngtb9XeV31bWAxzDoQrTGZ2SH
X-Received: by 2002:a17:90a:d64f:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39b26741434mr14295061a91.2.1788643348186;
        Sat, 05 Sep 2026 14:22:28 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm7783072c88.8.2026.09.05.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:22:27 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 02:52:04 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMQQ6DIBQFr2JYlwa/gLar3qPpAhH1pygGDGljv
 HvRbkybt5qXzCwkGI8mkGu2EG8iBnRjguKUEd2rsTMUm8QEGEgm4UJnpK2arKXaOv2kolQMNEh
 uJCNJmrxp8bUH74/EPYbZ+ffej/n2flNlXv6mYk7TallxXYPgRX3rBoX2rN1AtlSEgw7wp0PSW
 SWY4Eq30Oijvq7rB31Gj1frAAAA
X-Change-ID: 20260629-ti-fapll-clock-57a02c264e60
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643335; l=4915;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=auCB5rNo6b+/K6OB2qyoTXEsixd2XWS1Ty0U4GrdKWk=;
 b=uPVaYuFUkJGRyxOIdkbk5virGh8cp5eAvYi8Rc4w94CpIt/rh/IN7T6qUYJUT/kg6llPEW7xX
 JcXVRg8k8AYAS4Ruoe7jNOiFEP7jaR7Nvb/qg+Con6D1b6wnp5qajyE
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments DM816 FAPLL clock binding from plain text
to YAML DT schema.

The text documented #clock-cells to be set as 0, while the example and
existing dt and driver require it to be 1. The schema now strictly
enforces #clock-cells = <1>.

Properties clock-indices and clock-output-names are documented in the
binding and added as required as driver strictly requires it and existing
dt already use this property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Rebase to latest mainline rc.
- Collected tag.
- Link to v2: https://lore.kernel.org/r/20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com

Changes in v2:
- Cleaned up binding descriptions by dropping the redundant common clock
  sentence and removing "phandle for" from the clock items
- Link to v1: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com
---
 .../devicetree/bindings/clock/ti/fapll.txt         | 31 ----------
 .../bindings/clock/ti/ti,dm816-fapll-clock.yaml    | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/fapll.txt b/Documentation/devicetree/bindings/clock/ti/fapll.txt
deleted file mode 100644
index 88986ef39ddd..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/fapll.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Binding for Texas Instruments FAPLL clock.
-
-This binding uses the common clock binding[1]. It assumes a
-register-mapped FAPLL with usually two selectable input clocks
-(reference clock and bypass clock), and one or more child
-syntesizers.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dm816-fapll-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of parent clocks (clk-ref and clk-bypass)
-- reg : address and length of the register set for controlling the FAPLL.
-
-Examples:
-	main_fapll: main_fapll {
-		#clock-cells = <1>;
-		compatible = "ti,dm816-fapll-clock";
-		reg = <0x400 0x40>;
-		clocks = <&sys_clkin_ck &sys_clkin_ck>;
-		clock-indices = <1>, <2>, <3>, <4>, <5>,
-				<6>, <7>;
-		clock-output-names = "main_pll_clk1",
-				     "main_pll_clk2",
-				     "main_pll_clk3",
-				     "main_pll_clk4",
-				     "main_pll_clk5",
-				     "main_pll_clk6",
-				     "main_pll_clk7";
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
new file mode 100644
index 000000000000..423b7405e398
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dm816-fapll-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments FAPLL clock
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  FAPLL is register-mapped with usually two selectable input clocks
+  (reference clock and bypass clock), and one or more child synthesizers.
+
+properties:
+  compatible:
+    const: ti,dm816-fapll-clock
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: parent clock clk-ref
+      - description: parent clock clk-bypass
+
+  clock-indices:
+    description:
+      Maps child synthesizers to physical indices 1-7. Index 0 is physically
+      reserved for the Master PLL.
+    minItems: 1
+    maxItems: 7
+    items:
+      minimum: 1
+      maximum: 7
+
+  clock-output-names:
+    description:
+      Names of the child synthesizer outputs. The length of this array must
+      match clock-indices.
+    minItems: 1
+    maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - clock-indices
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@400 {
+        #clock-cells = <1>;
+        compatible = "ti,dm816-fapll-clock";
+        reg = <0x400 0x40>;
+        clocks = <&sys_clkin_ck &sys_clkin_ck>;
+        clock-indices = <1>, <2>, <3>, <4>, <5>, <6>, <7>;
+        clock-output-names = "main_pll_clk1", "main_pll_clk2", "main_pll_clk3",
+                             "main_pll_clk4", "main_pll_clk5", "main_pll_clk6",
+                             "main_pll_clk7";
+
+    };

---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260629-ti-fapll-clock-57a02c264e60

Best regards,
--  
Bhargav

