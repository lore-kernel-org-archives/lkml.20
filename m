Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695B3859FC;
	Fri,  2 Oct 2026 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969527; cv=none; b=iyn+TiCmWsXESkdiY/UIaJXu2CNjnXy7eCenE8Ai0lQdHvIa70HLOCzJRgKC4pQpozHv3QCO2nbkI4KiNUDzU9ZMwxTWPGBchtO1/iG9oF1uRnSagTgJp7KwX5TwKGr48JHYrkrJH8QkKj6Q6PanGcz0WH/UDEas25hARTo48wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969527; c=relaxed/simple;
	bh=LsDaIGUExgftZdb8U/4yaWwYkC0UxvvY9UVHuwN4zHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMMu+JZ1YZkgmhOp2Mgp2AF10fPgSFyAcH9MSPKubZgzIMDxQEydPKA5/9P3XxZjYRIhSqSSZgExkUm8DMWVeHB5OUo+VRgHvVpdb117bpeIYtaQGiURi82fGHN70xGobsxxyKqaKzuIyo/IMkh1yCCwPkALl1fuh1YOa8PDttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiVcSAad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiVcSAad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAE81F000FF;
	Fri,  2 Oct 2026 19:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969526;
	bh=MxkIod4vkqkopxKreL82cGl0CUGN4T8AqlW7gLVVr2w=;
	h=From:To:Cc:Subject:Date;
	b=HiVcSAadmXglv5B0GrYoRweicM7AK7G1MhN6gXJS1uZbrshUZa4jxk6d4O6hvjxDA
	 +MkNSiTCCnsYCaDGyrut1LQVkUWXl7y5HIAwlJVTljMWpwSMrvWEFsSNaMxxNVlxVg
	 n41brGAuFFeNldycd+Hdjfuz6SCivGvw0mxhZ1Z9jIuMZntCNjvWwXQWhuVgF0T79K
	 jstl6jhu/pmNzVErl/TgoGiEOc3UPqCD+BQXfOk/ehkHFBipt7MmyCp6hn9cXVG/w7
	 S26GULBJqQFALUkQpPgvGZ7WCkB1eKh+uS7d2HK1D8SpheFR3pubKCgPXffAukpa7w
	 vTkgP1PBirgww==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Convert hisilicon,hix5hd2-ir to DT schema
Date: Fri,  2 Oct 2026 14:31:56 -0500
Message-ID: <20261002193158.3263741-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the hisilicon,hix5hd2-ir binding to DT schema format. It's a
straight forward conversion.

As this was the last reference to rc.txt, it can be removed.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/hisilicon,hix5hd2-ir.yaml  | 52 +++++++++++++++++++
 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ----------
 .../devicetree/bindings/media/rc.txt          |  1 -
 3 files changed, 52 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 delete mode 100644 Documentation/devicetree/bindings/media/rc.txt

diff --git a/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml b/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
new file mode 100644
index 000000000000..cd836f266e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/hisilicon,hix5hd2-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon HIX5HD2 IR controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hix5hd2-ir
+          - hisilicon,hi3796cv300-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  hisilicon,power-syscon:
+    description: Provide correct clocks instead.
+    $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ir@f8001000 {
+        compatible = "hisilicon,hix5hd2-ir";
+        reg = <0xf8001000 0x1000>;
+        interrupts = <0 47 4>;
+        clocks = <&clock 0>;
+        linux,rc-map-name = "rc-tivo";
+    };
diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
deleted file mode 100644
index ca4cf774662e..000000000000
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Device-Tree bindings for hix5hd2 ir IP
-
-Required properties:
-	- compatible: Should contain "hisilicon,hix5hd2-ir", or:
-		- "hisilicon,hi3796cv300-ir" for Hi3796CV300 IR device.
-	- reg: Base physical address of the controller and length of memory
-	  mapped region.
-	- interrupts: interrupt-specifier for the sole interrupt generated by
-	  the device. The interrupt specifier format depends on the interrupt
-	  controller parent.
-	- clocks: clock phandle and specifier pair.
-
-Optional properties:
-	- linux,rc-map-name: see rc.txt file in the same directory.
-	- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
-		Provide correct clocks instead.
-
-Example node:
-
-	ir: ir@f8001000 {
-		compatible = "hisilicon,hix5hd2-ir";
-		reg = <0xf8001000 0x1000>;
-		interrupts = <0 47 4>;
-		clocks = <&clock HIX5HD2_IR_CLOCK>;
-		linux,rc-map-name = "rc-tivo";
-	};
diff --git a/Documentation/devicetree/bindings/media/rc.txt b/Documentation/devicetree/bindings/media/rc.txt
deleted file mode 100644
index be629f7fa77e..000000000000
--- a/Documentation/devicetree/bindings/media/rc.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to rc.yaml.
-- 
2.53.0

