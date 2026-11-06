Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969137;
	b=E8bjtFnTXGmy3dexYchl1DROLSD7mx6pevM3FOdPvmbERRnUuW5rvkpiFXxV/GvwMAm3
	 Q+RekD/c0QopPNK/fNnIPNAeOYzKx45h/fSder6taGRlLqDrCjJu90XPeuZ/g49Zurqqt
	 7NjeQWqFWuUMpzp63AzgyrHo5tVe7fOTW69dyvefJDSkqzcolxkP7C9b4iuQ7SfvW5vUT
	 grZSoXyxFGVKuMFjH1xoQVHfJomQYZPuqa0crMkMSu1M1xMR4KwGJhypvZxcjB7/kUtlk
	 8oBcVMYdnXOeagNYGgrJ9xkGemLdiZ02s/M/rB7EZI3Bcz3s1ZcLRaOh7vMar6o8RaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969137;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mus20XM8D+qKMgV/iA9VhjQY13W0kUKsfKS6jbgQWf4=;
	b=kU13ToE7h12QUGTbq9941U26muh7M2G3ya7Mfrhb8LxmBfyOvwgHZ+4L0lpnorK4W5V/
	 MknaSfYvRLmpaxLeNsH3/p2gcVmOPBqFjTHgS31ku9zGvSZ0/lX7RoystHOwT8mYGCgwW
	 pwyv6yGAXpHGjE2TIr6Zu+8lHhawolg/af9vgz0gNAITxX8Mlme/MXKnMUKLO01hn+AMv
	 6L+5/9DGL/3uMe4uz7EObg6erGCL/CZ1tsBtDJCXC6gQgFx8CMZmgvo1rlnKjkxrkXtu1
	 Q32JynsUXpFq7UuZ5iLQcKRs/l8xIlE89DYOrXFzvq4+rvLtiLpHLTdaBZSCQ0NIraw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EtNfSauM;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A446606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A446606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EtNfSauM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793969134; x=1794228334;
	bh=mus20XM8D+qKMgV/iA9VhjQY13W0kUKsfKS6jbgQWf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EtNfSauMKUgWngbyZAjNYkBm7QiR7cEXAm0m9e4dRpAYUXuB537+thCepnfIbkjAQ
	 1Utlg728AGGPkVuvRNuV1bmK5Y0g+n+sfXvBMKKuHzuvBhoYAysO1nUT+PUeSTRgxJ
	 qU6YiXNgbfFNLazinAAImD/hxltc6F5/wj5CNM9N+TOt4EYCfPeMnzRwAeJA+q/rfi
	 9wbKLFnUkfjuG6Lxp3yQQ+WhoihODC1CambnGyOlwxbvfKPTPdmN4VBI3IBS/4qtoa
	 +wJ0IhV5QzDRNCpGK3KPm2CBGF18DKN2QX5A6+yzUwbQRB+K6J77+ixPInEvOdSJaw
	 8j3dCkxOf3VeQ==
Date: Fri, 06 Nov 2026 12:45:29 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 1/3] dt-bindings: media: Add Sony IMX681
Message-ID: <20261106124505.71429-2-lsa.uz@pm.me>
In-Reply-To: <20261106124505.71429-1-lsa.uz@pm.me>
References: <20261106124505.71429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 871190daa2fc31ce0cacccd47fed5741b595f31c
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

The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
several Microsoft Surface devices. It operates from analog 2.8 V, digital
1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Andre Gilerson <andre.gilerson@gmail.com>
---
 .../bindings/media/i2c/sony,imx681.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b=
/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
new file mode 100644
index 00000000000..24c55760547
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
@@ -0,0 +1,108 @@
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
+  - Sergey Lebedev <lsa.uz@pm.me>
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
2.54.0


