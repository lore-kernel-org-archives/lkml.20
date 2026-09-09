Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B483C9EC2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982829; cv=none; b=lImY6RiVlh76+K6MZLNrxKVhMQGfeG1OZDRSMylnew319KLFLFuGQy2mO8QtTMMbIVdAvhDE3n8F0mekR6pXh9k7QEo7q9ObHxcI698Ez0HV5AJUfV8kULkN1EHmju0iLAI+yqHu8VXHhmqhieXE6DhLiBEzOR2lcAA+wQBgJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982829; c=relaxed/simple;
	bh=k8s+rVCUMvjBTnZOnves0aAx0qGp9PRCg2wgF4YOsu4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1gfbI3UXxBHOkl4jHBZUaevvOwsZt3JAcd29flH2cfEFU0h4JPt4naXk7gmjokv4XyCpCTZa7b5yGFslSJ0mLQLB11gVJMMNoUNczyVGLThBngKHz3Q+SD51wk0Cr3YQwmSMG4qcxaiezZTg9F3D2OgZiQJw1/Ib55kq2GI2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KtVUj+Oj; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KtVUj+Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788982819; x=1789242019;
	bh=VyJv7HpB+lIhsmHnwFJ5SrdDv0jsrX3CB3Cu/5qNaX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KtVUj+OjgpL4E7yHFWbUbA/ogu/Or+SYWbua8QPHT0xJFjw3FxlZVl113bqKet7rg
	 oBtdkYmDpXqhQ9EAxX2gPMcyZ8OjT1TNkppkq4rn7LNy+x0Du65bWlYRnwltiezn6F
	 /Wvr4ECoeYEk4/kRHPuzP0KcQk183ybbOW48fPKCIh0tsH74b4OvW1JX8JFhS/5lH5
	 pVmAvYr67LOJ6zJDndeU+1/XApHkgjCFnI8a8Cl3OoIyrOhi4xu2mz4phoNliXOpSs
	 sucqVgFKWzzV2RMvLV3b4XIxPp/8VrkwR0Rw4to/LnVWQPe/42R+NZR3cjTAmv+z53
	 7Vz8T2YuHbvRg==
Date: Wed, 09 Sep 2026 19:40:16 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20260909193953.86192-2-lsa.uz@pm.me>
In-Reply-To: <20260909193953.86192-1-lsa.uz@pm.me>
References: <20260909193953.86192-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 131bb8dcf6ae7a8c500becd6311d54066b402de4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
several Microsoft Surface devices. It operates from analog 2.8 V, digital
1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
new file mode 100644
index 000000000..6d2e4ddce
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX681 CMOS Image Sensor
+
+maintainers:
+  - Andre Gilerson <andre.gilerson@gmail.com>
+
+description:
+  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
+  array, used as the user-facing camera on several Microsoft Surface devic=
es.
+  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V suppli=
es,
+  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
+  MIPI CSI-2 D-PHY interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx681
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Input clock (19.2 MHz)
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8 V)
+
+  dvdd-supply:
+    description: Digital power supply (1.05 V)
+
+  dovdd-supply:
+    description: Interface power supply (1.8 V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO, active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
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
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera-sensor@10 {
+            compatible =3D "sony,imx681";
+            reg =3D <0x10>;
+            clocks =3D <&clock_cam>;
+            avdd-supply =3D <&vcc2v8_cam>;
+            dvdd-supply =3D <&vcc1v05_cam>;
+            dovdd-supply =3D <&vcc1v8_cam>;
+            reset-gpios =3D <&gpio 4 GPIO_ACTIVE_LOW>;
+            orientation =3D <0>;
+            rotation =3D <0>;
+
+            port {
+                imx681_ep: endpoint {
+                    data-lanes =3D <1 2>;
+                    link-frequencies =3D /bits/ 64 <969600000>;
+                    remote-endpoint =3D <&csi_in>;
+                };
+            };
+        };
+    };
+...
--=20
2.53.0


