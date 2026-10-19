Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427269;
	b=mBGDaX/imix7cwGNOxSG90eYbdE9UEEF0BgfATj+x6WVSXhHBFmAhDICpfO4bCqELaHe
	 BYeT/v/tdE/U9BXocZmgjuX/qCE376Tktqo3EATAqvBTobJR4lpk8UbX2V1SoV4IECgWJ
	 GWtgVigksyhzIlH7Zta4YcDTylsAHVIBIaiq3SK7LZ3d2dnfKw+b+ufIZAjg8EMdX2cT+
	 FAa6agzPAIPZlg5S+tEmDjyJ3iZJvV0XA9I20j6ZTmsEWR0Xx5y0XWJJlOnzI6hfO4nlx
	 wz+ScJQjaA7aLQHp8siJ1NZ3jAtB9IiMr1S4Ohtgl//BSkIDafKaQducLGrPM0zpZMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427269;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=E0kdQMlTkU0U95vRQXu54GmTzl69UL7f/+igTH8mVwc=;
	b=hPG9sgDID911O/2FLW2ikInGshsJMpEcxhZtBKOcv9YWahh0FjySwd12u13Ld7PCazgl
	 LMb0s+/KSQMeGDo0bgJVyQSD29l8Mbt6lOrI2JPMYaE9oM8DPZxI3jIesn5KTjZtd3fR0
	 S57XWiW8J02ZQ+GmPM4vKHD6WD07m+WhIpLY75exRN1AY+UoFNoK5EL56hvkkymGLwgFv
	 40g8KjX3H/5QD4zyQszRTgsAmG+QaG3Ld/6AD7P9sIGTLLceB7bJ4RZgn0LEUA1UdHAT1
	 p6TpdObAHGIKRcUVe2CnncmdIjojXGb9rDeLhujwxYJg83HouQDK+dAAgvCjpNfXp+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="hCAzON//";
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0CD606AAC1;
	Mon, 19 Oct 2026 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0CD606AAC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hCAzON//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792427266; x=1792686466;
	bh=E0kdQMlTkU0U95vRQXu54GmTzl69UL7f/+igTH8mVwc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hCAzON//zfrY6oy41D3kvGlO2axui94o0PvfFkuXYPJt31sUr7mFH+XoWdyjiou9K
	 Dzom5Vd6v/3fQLYKKqK2Ba9zOw3Fpu183aMbGRa07d6FV3gNi/ZGgm4Er1vFW8Ifqi
	 BvU39KAGHy5F8vv8X4V+Qr/ZYi/mdetU2AH1WNA6EVFvwOUPCSODYTGzf19zVEVnhw
	 SjlsdIIATKfU2FQlPluMot4ZmZ7OlOJc5FpQAnjIboLBWbdHzAemWoTIjtm1aS8BGK
	 gwbISUnhs7J/mZ1XZNtL2IIla3xF/T02TyIDufE8bBvR2ItP0SYjWhbQbq3K48urU6
	 hiGwAd/afXq1g==
Date: Mon, 19 Oct 2026 16:27:38 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: i2c: Add ST VD55G0 camera sensor
Message-ID: <20261019162722.25587-2-lsa.uz@pm.me>
In-Reply-To: <20261019162722.25587-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: cc5b59fab56c2649139bd4b48b27cacf3b72d89f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The VD55G0 is a monochrome global shutter sensor with a 644x604 active
array, sending over a single MIPI CSI-2 lane.

Merged from ST's own binding in STMicroelectronics/vd55g0-linux-driver,
which gives the supply voltages, and st,vd55g1.yaml, whose conventions and
property list it follows. ST's st,out-sync and st,in-sync are left out, as
in vd55g1. Link frequencies run from 375 to 600 MHz, for the sensor's MIPI
rate of 750 to 1200 Mbps (UM2829, 13.1).

Co-developed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
The properties follow st,vd55g1.yaml nearly line for line. If a
compatible in that file is preferred, with an if/then for the
link-frequency minimum, I can fold it in there.

 .../bindings/media/i2c/st,vd55g0.yaml         | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd55g0.y=
aml

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g0.yaml b/D=
ocumentation/devicetree/bindings/media/i2c/st,vd55g0.yaml
new file mode 100644
index 00000000000..be03d7e8b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g0.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 STMicroelectronics SA.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/st,vd55g0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics VD55G0 Global Shutter Image Sensor
+
+maintainers:
+  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+  - Sylvain Petinot <sylvain.petinot@foss.st.com>
+
+description: |-
+ The STMicroelectronics VD55G0 is a monochrome global shutter image sensor
+ with an active array size of 644H x 604V. It is programmable through an I=
2C
+ interface.
+
+ Image data is sent through MIPI CSI-2, over a single data lane. The senso=
r
+ provides 4 GPIOs, which can drive a strobe light source synchronised with=
 the
+ exposure period.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: st,vd55g0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vcore-supply:
+    description: Digital core power supply (1.2V)
+
+  vddio-supply:
+    description: Digital IO power supply (1.8V)
+
+  vana-supply:
+    description: Analog power supply (2.8V)
+
+  reset-gpios:
+    description: Sensor reset active low GPIO (XSHUTDOWN)
+    maxItems: 1
+
+  st,leds:
+    description:
+      List of sensor GPIOs used to control strobe light sources during the
+      exposure time. The numbers identify the sensor pin on which the
+      illumination system is connected. GPIOs are active-high.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 3
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
+
+          link-frequencies:
+            maxItems: 1
+            items:
+              minimum: 375000000
+              maximum: 600000000
+            description:
+              The MIPI output runs at twice the link frequency, 750 to 120=
0
+              Mbps, and at an integer multiple of the input clock frequenc=
y.
+
+          lane-polarities:
+            minItems: 1
+            maxItems: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcore-supply
+  - vddio-supply
+  - vana-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interface-devices.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        camera-sensor@60 {
+            compatible =3D "st,vd55g0";
+            reg =3D <0x60>;
+
+            clocks =3D <&camera_clk_12M>;
+
+            vcore-supply =3D <&camera_vcore_v1v2>;
+            vddio-supply =3D <&camera_vddio_v1v8>;
+            vana-supply =3D <&camera_vana_v2v8>;
+
+            reset-gpios =3D <&gpio 5 GPIO_ACTIVE_LOW>;
+            st,leds =3D <1>;
+
+            orientation =3D <MEDIA_ORIENTATION_FRONT>;
+            rotation =3D <0>;
+
+            port {
+                endpoint {
+                    data-lanes =3D <1>;
+                    link-frequencies =3D /bits/ 64 <402000000>;
+                    remote-endpoint =3D <&csiphy0_ep>;
+                };
+            };
+        };
+    };
--=20
2.54.0


