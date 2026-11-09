Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263926;
	b=agRcgSiK8GjRMv3XjBOdYY+3ZG6AKgH7ZiBUbw4s7tfvrReqR26lV5tDpsrL5frX8LVl
	 YgfTSmv3RK98TA9WSAE2I6toFPAIQHlt/X1IDgOVan8Hgyu9pr8MM+vS6dTDc+YQxEXpI
	 taj3KkaFxUs+rL2A2Ac/nbia/ApBYP/h/1mhuIzIzeHXDBVVOa9kcj6G0F1TiwO2CJvP2
	 szVsuGrDolEyaB0kynx6KsT1kD90NQtDENiaxwuz0noAbPEyO/3EqNSnSoOYXzFVejFMj
	 eImaKL7HFTd7UFGxBcerwEnnjKX0MebF3lOKl3orvXqwUQSmG1B9Q9ZiFelczmO7N2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263926;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Cv2ugW4W2/7cBP6tQKGqkydbkAUXsi9JOHrTI/0VYZc=;
	b=MsuwdirB9vtUIzijNKc2l9F4S5A1tdO2fxrXh5/6wGnoT5iwLUNX1hXbkW5/rsnD1T82
	 /ZB9Ut9SSGVCGuvyOZUm/i6V98qDYPbO/dQB4imPw1/aG2A+Ofdz41inGqa1FAmBB9/WV
	 mtO7BVdma+7VFw0ZzSt+x/aGWexCxLIUUub5GKiP00s3o+4MuY4eSqZEnt7ca0/539Cqk
	 hbAZ4cMSIYwkV3vvE9xezsjjhQQfNfG3PUzwPkruFO7Xl5uAKsXUwGnPFHU1k1zMb4fO8
	 lCyv2yFxD1S4OU0eR5UiWKbR/cOMEAAqwGLOHN0UNr0uW+YA5z2kKx8foSimTLCr56w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=heFvRUXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3647D60A2608;
	Mon,  9 Nov 2026 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=heFvRUXR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263926;
	b=Ei9WoHABdHUWhS3vdisnjqGtgp6PiHAFIhhQ9ioHzXTAmxhhgTjc8hXcruwq8WgIaWQo
	 R8ihid/LuBr6AuEu5Uu1vV1h5wXULmVb1098ooQBPbvczlFUJ+DCU1sO7J/xvdlNEaudR
	 aRaWZTrUxe3YGGfHHM610cpJ/nMWpWAO4ML9eAAYx8Xyg8OUzyrTbmCj0+TmSKEsGQYEH
	 mI7Q2k/uh5N/8h8n1FAFo+WUl8zqC/AFvV8IxykEPjZu3XgAj3Te3piHvgcjNx+NfNBEc
	 wZWQy598DX4fmmTN6ce8cL8H+2ygPN++IdgvlXJmw4plNG8qrxQHIsaY+cNDuMXsLVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263926;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Cv2ugW4W2/7cBP6tQKGqkydbkAUXsi9JOHrTI/0VYZc=;
	b=uDQvlw48VFSmmSsJt/pluWAMqlqp6WLHHLW/Cx7QmbrAbfF/3INknZ4ZmQ8tN0mZ+SQO
	 9uGc4DG6PmgnKX/4m6zfJ35mlEQcwez7VFRbMTWCS9a/4JLCmjwQSz8pn3x/uLbGy2C4i
	 3FFEm/ucYXPhIWuAW7Ktjxa9K+ehBm+7I72HXrwJc5reqhkLNRskvSe4kTxMt3WIirNQB
	 G1A6/jgO3tYK8yqu91lkUJHt7FjnkVvTogrRO6JTQUF44Cp3m68eFuBq9daxecv6s4/V+
	 tm32e0z9xlvvfpuBDZUnMdlHKbvZxyX1VnDkv+7hJ3NRn34BSPkLpbYCzW1SGnCaZcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 012B51F008A6;
	Mon,  9 Nov 2026 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263926;
	bh=Cv2ugW4W2/7cBP6tQKGqkydbkAUXsi9JOHrTI/0VYZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=heFvRUXRB9lqeI4Vz15s8DasWP74Q1s6OE5/TPxSVT60wMJF3t4iJddwldKCes/9Q
	 BG61fhxO/Gj3PhSmndy/Lf1i3css8ASEYZ8Af6yuV5+IikgY1EAVhyAVHzHspzzHGe
	 t1D2GTNOJH6VPhtZGc0zOBU8R3b/Ih6D8IEV13yECmPn7k5N7y9NtbDNEgf5I4UyJN
	 pfwKnGPUITxjjpJYRuwdaVVk88iFxTuFpRrqenowWX7K6tlR7F096GmvEE/jBJEXcJ
	 ssFb3Uy0lWJrin7D/BWZ+XhrRbrw4gTyuQOXiSBUobdb27o5NC9T+9BEp8T7IKJ/74
	 zOtfQxvVfuacQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AADB486D3;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 22:38:23 +0000
Subject: [PATCH 5/8] dt-bindings: media: i2c: Add Samsung S5KGD1 image
 sensor
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-sm8150-camera-v1-5-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
In-Reply-To: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gaurav Suman <gauravsuman007@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263921; l=3549;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=/uP5BNjbdyi1wf98CyTi3wc+sNFa7nqcCb/NOpDJ6F0=;
 b=zXKjcD9GYO3wZMfX1wq+CxIBgPCXHoqFK3BIJ4HHoRBM0e5rHu3wagCrvCbzEwOA6sUfOB+NN
 As5nCPUenKbAJsHwP4oo+gQj6I6r65J7G/dVjwQ8L80yy+yfKN/riyI
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com
Content-Transfer-Encoding: 7bit

From: Gaurav Suman <gauravsuman007@gmail.com>

Add bindings for the Samsung S5KGD1 (ISOCELL GD1) 32MP quad-Bayer
sensor, used as the front camera of the LG G8x ThinQ.

This was written and tested with the help of an AI coding assistant
(Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
---
 .../bindings/media/i2c/samsung,s5kgd1.yaml         | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kgd1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kgd1.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4b01f1057afe70665bb445c8395a6deaabc8bd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kgd1.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kgd1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KGD1 Image Sensor
+
+description:
+  Samsung S5KGD1 (ISOCELL GD1) is a 32MP image sensor with a quad-Bayer
+  (tetracell) colour filter array, controlled over a serial camera control
+  bus. The driver supports the 2x2 binned 3264x2448 mode at 30 frames per
+  second, RAW10 over a 4-lane MIPI D-PHY interface.
+
+maintainers:
+  - Gaurav Suman <gauravsuman007@gmail.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kgd1
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
+    description: Digital core voltage supply.
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
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - reset-gpios
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
+          camera@2d {
+              compatible = "samsung,s5kgd1";
+              reg = <0x2d>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
+              orientation = <0>;
+              rotation = <90>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2 3 4>;
+                      link-frequencies = /bits/ 64 <380800000>;
+                      remote-endpoint = <&csiphy_ep>;
+                  };
+              };
+          };
+      };
+...

-- 
2.49.1


