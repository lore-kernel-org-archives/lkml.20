Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5742E42B;
	Mon, 21 Sep 2026 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976062; cv=none; b=bCo0FWo8QJaCtfbytJzs+FP6PArTZNHcMjwe91ZxOKt00vF932Sk5rLOpNIUx4lFje5PCbRcpzILM8xmfOTpJQhlmrMjfX1Sw0IaofyqYevIzbLkMaqq4XyvRpBhcDghyn8/vqT22STdIbzY+RUyJfPgbDuIdJrJMDBl0uPSVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976062; c=relaxed/simple;
	bh=CWeNmB1G1T4FfpPmAdc0PU7vtCSMJKCzRLRTwINH16Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APEJuLk5CcVJdUiWUTJVF0muulpYs5GUzbEjfuAxTtUnJ4Oi0WPaWjF7JtVDUxbBJBng6dOYGqMTAu6Vwp16RvbH1Ofc8DwL+y3no2v1kTJ6xS+lHm3sKD1sbWtiOaCqGX46hAVd41bejIQF2xtnW0g1mBB0xm/x6/AsEH7rJiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=iKAY4VMb; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="iKAY4VMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789976057; x=1790235257;
	bh=6F7ov9WbdmIaBdnwxxwpg5631cX3gWx45dosU+Bspgk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iKAY4VMbAQnGLtMoolZtk8GOPEHr4tTTF+vKAAKGgUrU9mqYCW+JGgN2xx8ZlxAGf
	 Xwc/FapJLampryGzjiI5SSAknjysnfFw/xhOm2Ppx4cMEz4LBpPVLZD+AJAu9SlBoF
	 safs9bOdr/u67WdnNS6MZRnAHBcW6EjE2obUW9BTsqgUXq6j2QJ/eNLiQ0M7oIkPMR
	 LohXTOnmNNkpYW42dgwC+ObCG1xwc8xWuTwL9uLlknHAT/6fNO4b+SQNZc2Yq2bYio
	 JFKLLqcY6sbjr8HihYkGSVUo6Pp8WyXME3PT0k44eecZ4YHLj35pPoqksm7hIOnmMS
	 H/fR9rYT6CsrA==
Date: Mon, 21 Sep 2026 07:34:13 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20260921073352.86357-2-lsa.uz@pm.me>
In-Reply-To: <20260921073352.86357-1-lsa.uz@pm.me>
References: <20260921073352.86357-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 858a23a747afd27147ce8d87e536cb8f32e412d6
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
new file mode 100644
index 0000000000..6d2e4ddcee
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
2.54.0 (Apple Git-157)


