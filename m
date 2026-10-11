Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DDC2D47F1;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710009; cv=none; b=KJP3DOHU9boY6CaRG0A8wbwfh26cZeisYQpqMxOs09g+dmNMplE2Ib7/iO/cPt/d4Y54CwfGLc7fXblVNZ4qa8i1NE/E4sinlg6lBYdK4sjOc6Ug6pvJpXugGy/Lh6cYilkPx7AXIirvPH7WHJa74FKz4BCENZVesAbco6qz51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710009; c=relaxed/simple;
	bh=+ojKlbOI9GG42/BHXc7KqXSVpS5SQlc2JFP93M0xMYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rb7/CFrRslyE/iqMpTNAq9xy0n3HWcDAX0YRCo1Zewq8CobQRPk818FneLsbRyyn8eJyeyvYYrihHcl2oGxQZlh6ZkLmYminfpXT+gZFjsUvJ+o+aw9arlUW214dEPCzPYMg4ZQ9TzhjsaDrB5h9pv1ScWbcNbdpFRtP7UxsyVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7RJGW/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7RJGW/P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C4FCC2BCF7;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791710009;
	bh=+ojKlbOI9GG42/BHXc7KqXSVpS5SQlc2JFP93M0xMYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k7RJGW/PLjV+S2uNcuenDqc3/YxA6hfcPb5z96ZWJbIpbjqgYVcvZuu54JFNpZTuB
	 BUEjUvcnMXMV3QS7Hjs4R2sUfcIgq2DQ6TJ43exXz5DFyANEhBOBT+/3up9D6g20hV
	 9fNA6qHpxKhG+8SjOOtCLtSV469Bg4/URtSBL1Knx5WfP+tOqIHMRicC9Iv5IVVgnY
	 4se6j4lb6DTFmac/GOLAc+9PnAOSmC/gyxti37Lj/YrGWUEaDL+0RukpIe0WX94PqI
	 7C5NifXNxIyy4Kc0IsJSzm+oBV/PXX/HZdj/rW5ahc1o79EmXee8d3MAijAaHWqXr9
	 zCw5zU1XX2Itw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DD2CA9EBD;
	Sun, 11 Oct 2026 09:13:29 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Sun, 11 Oct 2026 11:13:27 +0200
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2 image
 sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-upstream-s5k3t2-v4-1-d33b12fb3263@proton.me>
References: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
In-Reply-To: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791710007; l=4123;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=tkShdLWwWiHuVSzgY4OOZGB7fJdUgKDkchfsedpvqsU=;
 b=qrbbDOG6udm4nN6BZ8ufOJZ2gVee0ggAPFvOpcWVk8XPKQlb4cY24z+kw1XnPUbtDDhhxxc7K
 VpenG4Fo6E1AFwWo05duA6UOqMqxMbtvZgMG4H5IZFHc09abrmztJP1
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

The Samsung S5K3T2 is a 20 Mpixel CMOS image sensor. It has four MIPI
D-PHY lanes and an I2C control bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 .../bindings/media/i2c/samsung,s5k3t2.yaml         | 105 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
new file mode 100644
index 000000000000..74a1aa23249f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3t2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3T2 Image Sensor
+
+description:
+  Samsung S5K3T2 (ISOCELL 3T2) image sensor is a 20MP image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 5184x3880 at 15 frames
+  per second, data output format is RAW10 transferred over 4-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Armandas Kvietkus <armandas.kvietkus@proton.me>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3t2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.05 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
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
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@10 {
+              compatible = "samsung,s5k3t2";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2 3 4>;
+                      link-frequencies = /bits/ 64 <448000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..1924dbd20b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24380,6 +24380,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 F:	drivers/media/i2c/s5k3m5.c
 
+SAMSUNG S5K3T2 CAMERA DRIVER
+M:	Armandas Kvietkus <armandas.kvietkus@proton.me>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
+
 SAMSUNG S5K5BAF CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>

-- 
2.56.0


