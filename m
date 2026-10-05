Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C8242E8DC;
	Mon,  5 Oct 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193536; cv=none; b=oL+wb6Nu4BCtj67UH+ZWR0sUG42wHKTFuYhzw5LJTceIOeXCbWTiKAPEyAwo+5kcR9mxSeNrMj9u1mLciRGzn6O+T+FwK/sIOW2y1SsDNKrj3X7+kwAbTVHP1KrS84acEqpQHqh0shYs7iDrKtR2paLwfnhaOrvyfw6obMtXGH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193536; c=relaxed/simple;
	bh=MQthEJPYsPCnEOiR/kziVX6oS1xJMZiyb9ZaC+3Rd8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MViCINeB6CJVxDDX1OxZHKxrgMvraU43mIT5QCEIuWs7ne2sH9ONag7K4FY3XoAocUVq+KIWLkgWh+Oexy36SmG7v8nVMz7ZZCCYRGfl2n3n7Kttqu6QCbke5cdKc2iy1K6JtNaDpt6ii6XNKeSHaUk14w6HLUYB2pNQVkO8MgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gc6Zn9NP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gc6Zn9NP"
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC06BE91;
	Mon,  5 Oct 2026 11:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791193413;
	bh=MQthEJPYsPCnEOiR/kziVX6oS1xJMZiyb9ZaC+3Rd8s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gc6Zn9NPyl4QqjvB5pJXR+VmfsBP2TtRB7ZS9Ib8w4k+4yqDQOHO0vyVUHBBop2S7
	 iL26NKyoXgNyVO4y3GvXe9K20nHBxN9ceJCZ+Tt57OJ/QaWoQsrhEWtdt/11T4ajcW
	 /uQgpvS6qRlgT/269waCD+5J8ij8nPsrlLaoUAoI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 05 Oct 2026 11:45:18 +0200
Subject: [PATCH v13 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-mira220-v13-1-27a041933929@ideasonboard.com>
References: <20261005-mira220-v13-0-27a041933929@ideasonboard.com>
In-Reply-To: <20261005-mira220-v13-0-27a041933929@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mKLE7GU+7yHm6bFamKpH+MfKOUmzfXhahnSMdvGshVo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqw3G2mFjo8xtAAen+ORTdnT38CrJarWCyEuXHj
 rCx1lxUxDWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCasNxtgAKCRByNAaPFqFW
 PN5sD/9p5GMR02lQPvivTvcptFavBXn6zEZ2KsBwxc/fCLIDogaqu6fAYiaqPhNgdYg3B94KlVo
 aC07+C5NbWTN48TlxUy6f2G5Jp9KMOOve3DGG7oVpL8z5hMNXgJZYIt1yMAb49I15fPNkf9BIN1
 ykp0AwLbmplk51BDfhKOgfcsUg4QkdHaPsUkz/MUv5Ii8XO4+AENP/4ufJww14Ti+I1Hy1z+nZO
 Lxys1VyjL86oF33s5fbLUSYN+y3lhLyqEz46PX9QBa0xiwSHX1o3ec9Z7+GOJy4cSmWCu2RSO4J
 tJDNQhCrh8JMlkQuXFMZ27VHWT8XT+mZsAIODwDTVRCaRO5lX5nVdBdRPtul9YH7pdGx4ygDwnk
 v/vFvx4JXqHzunu2OEV6bYZjvJOEm/xbaLfYpzQtM0BON6JP8qix9FK99B+QjN9k4m55TZx0fn4
 +xx7Rx9nfODqz34rXGMgD4ZPLOSguhx7vBJBKYOEjFUrINmvR+lXklt0yB8jbJ3meO6OehDALYv
 mcf6BpqP/UUEPQdLIEr60nkovp5G6i49HRYjpGBMy2xU6jCEsfaQklUwQ2tY9CCrk0X94xTj+nF
 xXhc3SMvCeG3HW5Jtxr16EzHJw4JnU8xWlm+iuC46JRmJxTc74bDi2M5jOgJ911/BB0BQ8HFBOp
 2Ku6XHPeXLicvuA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v11->v12:
- Remove labels from examples
- Add myself as co-maintainer

v8->v9:
- Make link-frequencies required

v7->v8:
- Add Conor's tag

v5->v6:
- sashiko: use 'unevaluatedProperties: false' at the top level to allow
  properties from video-interface-devices.yaml

v4->v5:
- reflow description to 80 cols and drop |-
- remove 'reg' description
- remove 'anyOf' from data-lanes
- remove 'link-frequencies' from required properties
- remove 'clock-continuous: true' as we already allow all properties
  from 'video-interfaces.yaml'
- remove tabs from the example
---
 .../devicetree/bindings/media/i2c/ams,mira220.yaml | 103 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000000..f809530ee660
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS 2.2 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description:
+  Mira220 is a 2.2 MP NIR enhanced global shutter image sensor designed for 2D
+  and 3D consumer and industrial machine vision applications. Due to its small
+  size, configurability and high sensitivity both in visual as well as NIR, the
+  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
+  Vision, Structured Light Vision for Robotics and AR/VR.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ams,mira220
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.35 volts
+
+  vana-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
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
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdig-supply
+  - vana-supply
+  - vddl-supply
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
+        camera@54 {
+            compatible = "ams,mira220";
+            reg = <0x54>;
+            clocks = <&cam1_clk>;
+            vana-supply = <&cam1_reg>;
+            vdig-supply = <&cam_dummy_reg>;
+            vddl-supply = <&cam_dummy_reg>;
+            port {
+                endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bdc32e7c8bf..013b89089e95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1454,6 +1454,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA220 DRIVER
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+M:	Philippe Baetens <philippebaetens@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.55.0

