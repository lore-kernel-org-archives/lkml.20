Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42123B634;
	Fri,  2 Oct 2026 01:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905914; cv=none; b=QCEC4aJCa4greDa+ioADQyLRExwdGMbwW8mgq7iU1jXQi2M/jQMdZ6LJIOUo8u+/xqa8WLNwlvUb0QpxHVLuHz+L0WVy8CVJfamnO4ynNE9UAVOzEKtLHinafooi+JGoQ2Hmz9X2CtBbCnyqGO9dQToz7i/+RMY2Kn7ev3csnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905914; c=relaxed/simple;
	bh=TQv6E8NTuGiOtieNp50oiMT6CUfqsRcnZhApELUtVUA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MLv551RQR1HsKTAkliEkHbTJ62v25YSlSuSA7KzZj0Y+oIf2p5tN7QE1Sy7IBzt4BW8bQboqejEj26ao/dTYjo5zVjIvUXqHNHyvlUdRGx2sRdZQQpedxv1AHgdXwQngcp3s6MOf6/HPl6Xd82Uwo51EVCcfd1IqhEZQkKGhric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IU9/zI7y; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IU9/zI7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790905905; x=1791165105;
	bh=Q6+5/o1HuyzU+Op3nIoMQbTXVqMWKvjUuSpNCkPhVOU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IU9/zI7yRQcbQGiQKmhTtzdC9Dw/Q+ohxUCJGniAK2Nd+TkfQIA04C1NYf01fmKDf
	 T6aVIt4zQDXmH74Trnbvhe0ulhw9ZvknnUUrYcSoyCvoc8treT/2U6M54K7iji5fZ1
	 fCgBzrpY07uPYM8MIwd1G/ZEF8CWBWjtP1lAQ6/VRJEZXcTiZ+Pvup9wvOqoU30jqS
	 fwqX/kS/T+Bj1OvPnhyJPQa8x+8izVrb30VpIfkLNbNfjvr0nWvkkUFu1iux9IqALG
	 s/jw9GOJuWg1S2E62KLmAedvctdMov+XfKWt2qjlrfR5XZ+BR1D/M9DidQHIX408+X
	 egbxNBiPBWSVQ==
Date: Fri, 02 Oct 2026 01:51:41 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Document Raydium RM69220 DDIC
Message-ID: <20261001-asteroids-panel-support-v4-1-fb228194ad91@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0a9467843ba5e85b6aa49ae7a0404f348b3ca3d7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the Raydium RM69220 DDIC and the BOE BF068MWM-TD0 6.77"
1080x2392 AMOLED display panel used in the Nothing Phone (3a).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../bindings/display/panel/raydium,rm69220.yaml    | 74 ++++++++++++++++++=
++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm6922=
0.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.ya=
ml
new file mode 100644
index 000000000000..3c94db88f797
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm69220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM69220 based MIPI-DSI panels
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  The Raydium RM69220 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - boe,bf068mwm-td0
+      - const: raydium,rm69220
+
+  reg:
+    maxItems: 1
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+required:
+  - compatible
+  - reg
+  - dvdd-supply
+  - vci-supply
+  - vddio-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "boe,bf068mwm-td0", "raydium,rm69220";
+            reg =3D <0>;
+
+            reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
+            dvdd-supply =3D <&vreg_oled_dvdd_1p8>;
+            vci-supply =3D <&vreg_l19b>;
+            vddio-supply =3D <&vreg_l9b>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint =3D <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b9e03e2960e1..6702142b117d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8583,6 +8583,11 @@ S:=09Maintained
 F:=09Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
 F:=09drivers/gpu/drm/panel/panel-raydium-rm67191.c
=20
+DRM DRIVER FOR RAYDIUM RM69220 PANELS
+M:=09Alexander Koskovich <akoskovich@pm.me>
+S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
+
 DRM DRIVER FOR SAMSUNG DB7430 PANELS
 M:=09Linus Walleij <linusw@kernel.org>
 S:=09Maintained

--=20
2.53.0


