Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C6549AA4B;
	Sun, 18 Oct 2026 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357823; cv=none; b=RGiX9LHJYQq7TUR4yzxcG/5JDweQx280qlxdF9hUTEPgMtiiOaIR+zBZuaWqgrfMlqCg/I4wVpbVntJM+4vpPHfuL/xlwgxz3kGHouICN8CwzWajyjp/eBjOuAEMPrIYEHQKagcAMulBN1z0uwFTdN0cjraxAxTRKdEyCutWnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357823; c=relaxed/simple;
	bh=cHcpTFOTGdHKWfrxgwp/CfZ0r4K5eHiSCNS9p/A+NcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8k33SgTP8bgkLcb8tSS2HK92v1DoYIPnOXT7aZmtWKS4dMOz+ZjQ2pyCEEabaZskiqDjDkQsn6BXBHsJlKYPJMKmtVmH/KUoJFl154Ef7l2fUFSdc1dB3tqPlkJxmE4xEKV04SWh1ia1bHMS8cv/UQCnlTe9T9eyA4ehn/cM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrOEEjfP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrOEEjfP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 533CAC2BCF7;
	Sun, 18 Oct 2026 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792357823;
	bh=cHcpTFOTGdHKWfrxgwp/CfZ0r4K5eHiSCNS9p/A+NcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZrOEEjfPFJrw6OjWaKq3obyEmsivkTTTNiPhD3mT7v3wIKpzERC1ng/dSozUcvwjq
	 EEmHymhPJ1KsXT5pBa1DZQZjZ4WhM+7RUZHYFtHQHUti+0JpuVTbV5f9CQgwTpaUe/
	 RfP8DjZy7cjoMRfrCKBwVYpBSrinTVzCf+SFkLxbgunqZIl6PFEnd/UyZU0kM/KhA3
	 DZ3ZW9uzsrIMPW6DnofqzBTZIYcF1ayE/y711iohbKZfnXkjHbiyNSGZ9oAW3XY7n8
	 GI+CIEvUxbTSM6gM6jD5b4+UgfMDE4a0mW4K4jXYO4ocZpu2EgdsdJBp3HUOBiaDOY
	 RthfKK2tN5P/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D72CCF2C4;
	Sun, 18 Oct 2026 21:10:23 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Sun, 18 Oct 2026 22:10:21 +0100
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-ov13858-x1e-v2-1-cd35434cfcfe@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
In-Reply-To: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792357821; l=4174;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=OzTG46gfpk2pnDBYcA+0AMPZaN8UKbkzHCoTLIiLDiQ=;
 b=D6/vax9StjV/YkL7bMS7iyxZhSo+BcAK11gxRm6fddpzsjuA0L7acDJKZgncl3wmfM9A9ULyI
 gnqTRW0qmigATdpNkeUejJ6gROr6UL8vnSbtlz5pzeKWbfRnv1IB7+H
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The OV13858 is a 13 megapixel sensor with a four-lane MIPI CSI-2 D-PHY
output. So far its driver has only been probed through ACPI. The
Microsoft Surface Pro 11 with a Snapdragon X Elite uses it as the rear
camera and describes it in the device tree.

Describe the sensor input clock, three supplies, reset GPIO and
four-lane CSI-2 endpoint.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)
Assisted-by: Claude:claude-opus-5-5
Assisted-by: ChatGPT:gpt-5.6-sol
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 .../bindings/media/i2c/ovti,ov13858.yaml           | 113 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml
new file mode 100644
index 0000000000..62bfb27782
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov13858.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV13858 CMOS Sensor
+
+maintainers:
+  - George Neacsu <geocausa@gmail.com>
+
+description:
+  The OmniVision OV13858 is a 13 megapixel CMOS image sensor with an I2C
+  control interface. It outputs 10-bit Bayer data over a four-lane MIPI
+  CSI-2 D-PHY interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov13858
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    description: Active low GPIO connected to the XSHUTDN pad of the sensor.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "ovti,ov13858";
+            reg = <0x10>;
+
+            clocks = <&cam_mclk>;
+            assigned-clocks = <&cam_mclk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_cam_2p8>;
+            dovdd-supply = <&vreg_cam_1p8>;
+            dvdd-supply = <&vreg_cam_1p2>;
+
+            reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+
+            orientation = <1>;
+            rotation = <0>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&csiphy1_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <540000000 270000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e363..d4348a56a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20235,6 +20235,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov13858.yaml
 F:	drivers/media/i2c/ov13858.c
 
 OMNIVISION OV13B10 SENSOR DRIVER

-- 
2.53.0


