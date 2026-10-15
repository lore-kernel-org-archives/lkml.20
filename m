Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456384A498E;
	Thu, 15 Oct 2026 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060597; cv=none; b=Ulh6OQfLO/TgxWZeXhAgyvgoVAj4jYlhvlmveOVPQmtH2yhAQG6nuZg3TNeeCzF9Og1nDEfGOsMoKb12Kcuc9nJbhE0LJahqfk0mO0UV8PazggfRPJm27U9M1ktJmy1k7l5Iz7RkCczmPTy7ilyO5XNltaXzRvoVe58TaTfEw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060597; c=relaxed/simple;
	bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aB6KzoPASLl5k5LUnCbiiQq9xI4KV7TWWCBC2KW0nrRUA8Ra/27g2dwA2zv/kM0gty+ing/lrz6+1TyHgDo8u/MmHS32rJTIc5nfV/9lS4yF8YSR8ih3+oLgoV6aNeZ7Y83QEoBrUJ9EzMkM/qxYvKQ4oX9sU+FEIYNFsGyNUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oJ3gkW+L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oJ3gkW+L"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9E644F1;
	Thu, 15 Oct 2026 12:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792060470;
	bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oJ3gkW+Ld3qvFEUDAJz3fQCZJyi27nVkVajcchszxiD27Hm75sLm4W5RSejPRE3Z/
	 pktaPrymc4g3rTKkwPb1PiCq+WGx68+XVGpAKtiVggCwRAzv/dKRG8krRckSfvnMLT
	 dzlO1wLRS8iTzX41rcuRcXrmO0ofovlRX8l4UbBg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 15 Oct 2026 12:36:23 +0200
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-mira016-v6-1-177ecfd6d357@ideasonboard.com>
References: <20261015-mira016-v6-0-177ecfd6d357@ideasonboard.com>
In-Reply-To: <20261015-mira016-v6-0-177ecfd6d357@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq0KyvWe63nM4UtNJp8M6e1sXVwX7nAQGXDtVNT
 IrgcNJqNoqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatCsrwAKCRByNAaPFqFW
 PNCBD/9ZqZ/e64Cnwl9eUsskaG+vs1/GAMveM071iMn8mDYNmkCQEwzRhU7Jvq5HurT/k3ffGzN
 SO3WcaG/B80KWlvxKiy1AoPmBFeUa8rOIxqZ5xIlENSK57IRsR0CMlK5GlsCfk9nHLFs+RtyFt7
 9V78KPC9NA/m7aSZ5KOJ/0kZR+DXJ1L0U62T4DKrl0u46a10vJBw87h1Jkdvf0L6UWlsdxJNwLO
 K3fmqr8Ny0tTQHfQPcOo9O0QK4ENeX6xJ7oyT2Cfr3oJ7M6KkrnOnMjZXfn1jXfTUVIPOurq9VR
 1ewV86v6HsjVyOcYqQLHhEcYQHPGnoyw7VY6yaj6X9A/8FcmMsPnKb8xXNrHf+AI54vgWl7IxKx
 nw4Ic5eHF7uD1xF28AGFvXC08ffHpZNs/vI8RCbIBmGxqt0/68k4mbo6TwAP5KXF2+KsH0ytF1o
 47huI7aMkNwGlItTeADpd29MAJaChKphf0DoXZeQC2h4IsabotdTqmKGkaYlb76ARzDGbqFSCUW
 yA5q+vPZt4zteX5wgQOLDm2YC4yU0pId9OznWY7RCYxWslkwXt8GHpbFLsZKjhY46QKGLV2ah7n
 vX+Yx/wz7Ytr/CGpqJyDP0WO38iSbCwwKKvEDaQ9tfZd9r0XGxBnDb9vqOkDcooPQnrsO9DgN3J
 H4VPqF2V3IBFgDg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add bindings for the ams OSRAM Mira016 image sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/media/i2c/ams,mira016.yaml | 97 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
new file mode 100644
index 000000000000..49a606fca6cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira016.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS 0.16 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description:
+  Mira016 is a 0.16 MP NIR enhanced global shutter image sensor designed for 2D
+  and 3D consumer and industrial machine vision applications. The sensor is
+  compliant to the MIPI CSI-2 v1.3 protocol interface and the D-PHY v1.2
+  physical layer specifications to transmit the image data to the host
+  processor. It uses one data lane and one clock lane operating up to 1.5 Gbps.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ams,mira016
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdd28-supply:
+    description:
+      I/O voltage supply, 2.8 volts
+
+  vdd11-supply:
+    description:
+      I/O voltage supply, 1.1 volts
+
+  reset-gpios:
+    description: Sensor reset (RST_N) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Video output port
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
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdd28-supply
+  - vdd11-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ams,mira016";
+            reg = <0x36>;
+            clocks = <&cam1_clk>;
+
+            vdd28-supply = <&cam1_reg>;
+            vdd11-supply = <&cam_dummy_reg>;
+
+            port {
+                endpoint {
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e3635f..2e01f389f057 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1454,6 +1454,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA016 DRIVER
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+M:	Philippe Baetens <philippebaetens@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.55.0

