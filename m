Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564109;
	b=zilh5uDbUJLTVnMcei0H8YHtXXzd/34sCzj70GYhK7o67lREvdTrurrmkN0mrVlyaAjN
	 OlS0Ap340qgxdLi40QYhSguKz68Bo7gwCflFVUbYq9BOGnSkN7k1mkxXUdZW987XQMjC8
	 jT9OCihUjlwuFvjkNhhF3BavDuGKuEKTiPCQ2LT9TKNSiStYq5YxBzZ0JYPsWXDnQgdM3
	 TsoAbiZliI1Ets//ST0KD2UGE7qhibpZgFtYRFfV/xqjjGsrcCBtYoVVihQBacTsETZK+
	 GPXmpOsXn7y91M2NP8nnqOedas3rBeOy3F764B5XsRBOPUQHRCQhvJ+kvYy+c56M5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564109;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=ciHtI+5r+7x2SF+EXZv18M3c3IsV/RFqcUbpTe+Eh4M=;
	b=JBFFWsTRjLTJdAD0w7mNoErGumyC39iRXiBn3jNSPYhCZaiYXMl8wmI2IK80D8yjGlV5
	 7KTSyR86U1hN/IsoG7K7m+5Af3o50oFCRzUGOjz0pg+Hxglx9M/psndxVDhz/xuQOrZl2
	 Lig+OWgfaI/UvO0iF4vl0x9Gu3exevDAmzGw3YQxUkGg6oL+kgMG1a45PZZSWts9H943O
	 5Lq7BxFJ+uJJNkGBqy6T4FgTo3IvygjIomfqKVFD3xKroHtN4PDAeBNpH0smFSZp/yVMR
	 Nzv3JgXZk0IVNqZ2etGsoq6zh0YhGQ45UXceTfJcTOljluLs8GLrxbXuSzxlRi0+SoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNXrDDby;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D84606A323;
	Fri, 13 Nov 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNXrDDby
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D061F000C4;
	Fri, 13 Nov 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564109;
	bh=ciHtI+5r+7x2SF+EXZv18M3c3IsV/RFqcUbpTe+Eh4M=;
	h=From:Date:Subject:To:Cc;
	b=oNXrDDbycUwETg6fripz3Zax21stfDwqYisSNPtkMSI4Y9D/gIRPY9t1JIb8f6TlE
	 HJp++5lYZWrTdD64BFbU2dg325tw2Fxdl8TQlh+LlmZbjapBmMxu9xo72dR4bLXR+K
	 b5oNY1oQKENHVbvBa2cb/AhZcskKpPhTg52hu3Jd8YkDSiPvINtolvwaZg2alTxaTg
	 I79a1JAQEGZlHVUMt5gjP48Ojn6nrxM/2MQaJIkBL4TYVtFaf4K6ndtAeYLQmRjVSZ
	 eylnJpWde95K5UcfUDncQff9uvdaZfV4shP7RprcmKBGUPYF8cZBtqdUvYobped9fO
	 w7g/HsD8eufPQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:01:44 +0100
Subject: [PATCH] dt-bindings: usb: ux500: Convert to DT schema
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ux500-musb-bindings-v1-1-553aa97c5c95@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AJtYWchVxocnUzqJpyaAI4
 t0LfQd4J1ybqSPRiaa7uX0qEklHyK+5rspWkAgxxLuIRN6OIQR+b77wYrVYXZ2zlKC3R+51iOg
 I36ZPO/7rOF3XDxbYC9plAAAA
X-Change-ID: 20261112-ux500-musb-bindings-c1d0e47c3e52
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Convert the Ux500 MUSB text binding to DT schema. Describe the APB
clock and the existing ordered DMA endpoint channels, and reference
the common dual-role USB properties.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Convert the Ux500 MUSB text binding to DT schema, describing the APB
clock, ordered DMA endpoint channels and common dual-role USB properties.

This patch is split from the Ux500 DeviceTree validation cleanup series.

Prepared with Codex.
---
 .../bindings/usb/stericsson,db8500-musb.yaml       | 79 ++++++++++++++++++++++
 .../devicetree/bindings/usb/ux500-usb.txt          | 50 --------------
 2 files changed, 79 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/stericsson,db8500-musb.yaml b/Documentation/devicetree/bindings/usb/stericsson,db8500-musb.yaml
new file mode 100644
index 000000000000..9edf77aa43b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/stericsson,db8500-musb.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/stericsson,db8500-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson DB8500 MUSB controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+allOf:
+  - $ref: usb-drd.yaml#
+
+properties:
+  compatible:
+    const: stericsson,db8500-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: mc
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: usb
+
+  dmas:
+    minItems: 16
+    maxItems: 16
+
+  dma-names:
+    items:
+      - const: iep_1_9
+      - const: oep_1_9
+      - const: iep_2_10
+      - const: oep_2_10
+      - const: iep_3_11
+      - const: oep_3_11
+      - const: iep_4_12
+      - const: oep_4_12
+      - const: iep_5_13
+      - const: oep_5_13
+      - const: iep_6_14
+      - const: oep_6_14
+      - const: iep_7_15
+      - const: oep_7_15
+      - const: iep_8
+      - const: oep_8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dr_mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@a03e0000 {
+        compatible = "stericsson,db8500-musb";
+        reg = <0xa03e0000 0x10000>;
+        interrupts = <0 23 4>;
+        interrupt-names = "mc";
+        clocks = <&prcc_pclk 5 0>;
+        dr_mode = "otg";
+    };
diff --git a/Documentation/devicetree/bindings/usb/ux500-usb.txt b/Documentation/devicetree/bindings/usb/ux500-usb.txt
deleted file mode 100644
index 439a41c79afa..000000000000
--- a/Documentation/devicetree/bindings/usb/ux500-usb.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Ux500 MUSB
-
-Required properties:
- - compatible : Should be "stericsson,db8500-musb"
- - reg        : Offset and length of registers
- - interrupts : Interrupt; mode, number and trigger
- - dr_mode    : Dual-role; either host mode "host", peripheral mode "peripheral"
-                or both "otg"
-
-Optional properties:
- - dmas       : A list of dma channels;
-                dma-controller, event-line, fixed-channel, flags
- - dma-names  : An ordered list of channel names affiliated to the above
-
-Example:
-
-usb_per5@a03e0000 {
-	compatible = "stericsson,db8500-musb";
-	reg = <0xa03e0000 0x10000>;
-	interrupts = <0 23 0x4>;
-	interrupt-names = "mc";
-
-	dr_mode = "otg";
-
-	dmas = <&dma 38 0 0x2>, /* Logical - DevToMem */
-	       <&dma 38 0 0x0>, /* Logical - MemToDev */
-	       <&dma 37 0 0x2>, /* Logical - DevToMem */
-	       <&dma 37 0 0x0>, /* Logical - MemToDev */
-	       <&dma 36 0 0x2>, /* Logical - DevToMem */
-	       <&dma 36 0 0x0>, /* Logical - MemToDev */
-	       <&dma 19 0 0x2>, /* Logical - DevToMem */
-	       <&dma 19 0 0x0>, /* Logical - MemToDev */
-	       <&dma 18 0 0x2>, /* Logical - DevToMem */
-	       <&dma 18 0 0x0>, /* Logical - MemToDev */
-	       <&dma 17 0 0x2>, /* Logical - DevToMem */
-	       <&dma 17 0 0x0>, /* Logical - MemToDev */
-	       <&dma 16 0 0x2>, /* Logical - DevToMem */
-	       <&dma 16 0 0x0>, /* Logical - MemToDev */
-	       <&dma 39 0 0x2>, /* Logical - DevToMem */
-	       <&dma 39 0 0x0>; /* Logical - MemToDev */
-
-	dma-names = "iep_1_9",  "oep_1_9",
-		    "iep_2_10", "oep_2_10",
-		    "iep_3_11", "oep_3_11",
-		    "iep_4_12", "oep_4_12",
-		    "iep_5_13", "oep_5_13",
-		    "iep_6_14", "oep_6_14",
-		    "iep_7_15", "oep_7_15",
-		    "iep_8",    "oep_8";
-};

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-ux500-musb-bindings-c1d0e47c3e52

Best regards,
--  
Linus Walleij <linusw@kernel.org>

