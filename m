Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263925;
	b=4FhJYdtw3M3E1lYTQJ/DFmTN10zXtW8AvN/ZjzmVag/JOBP64cpCJDPpWI4Y16XsS+ck
	 sNRNRS1QVmoXS73nx4Myi5rChSMrZZ7aJiGmf1CruS90kxgfUXiKTzpxszfjmw6zuT+Cz
	 0tN1pnNLUgEVafYwUcV0ZxWqb2GmzltaxnI6w8l37+rg7JwNtu8pztfdHcL9c5VYGa54S
	 k0ijh8QJLno6MneEhPa/BxBKNzaaKQetR2ys1F7UDS0OQsA8gPfdnR2sDCub25VDECPyY
	 tYZsALJ+DYXKt4EQdWCWdWBwpC3FHB7krrvdsbilIEKYsXL5q9C5RHIvXsWEeJNQDEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263925;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zTBDdqdVK2g02AANq357yyU4yOnZzmvhW4b426CSbp4=;
	b=m7SEil4v53+ALHsWcKJ90OXTUuTN+75lyWWCksfd48WL+0KR4/onaHs12ykOUYYlCfGP
	 Pf0726lFrtEdjAgMDo5Z/a86E0dZJ29a0bfci44RGDlCB7uMbZm/Fnc77o8EDusprWJ6f
	 Kg480K57E9eUjvW66r4hEH8HT10hLhxt9BXn2TAXCEKL5tveT8mLjeFk3WBnm7nazn24k
	 5VJ5oyq1YKrnSEOqQpPqDQ6xJZvskGg09wsnqTaOI15r/CmqJfppNbERHEBlCrw2dXZuG
	 5LY/I9QlDNDXZ7cOZE+MVvEZKJklwNjo2sMKBJkKbBD/gNpG3FBsGIDf1e7WAjcCpGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imefxIuQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E877606A336;
	Mon,  9 Nov 2026 22:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imefxIuQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263925;
	b=hoqeip4lPhMzmDJIupF30+/yC/mkQxTHE572XAPb9xPS/xa3+OTE+quSP9RYqCzKgKrO
	 RJ3eGvDtgcdy4U9xunr52mn4m/A1NS0OoRsXMrVBLQlxy3nHn+V/7beCuC49wBXgiIGwT
	 8P8epjrijLxWWn73TCTJnPMHvHCNlXisc/04T1tal1/CPwCevAllbyeSjWpQhLLYRQplQ
	 NekqRaUijFnQ5MwPR0kZyAkkhlRXL4wEwyYM3FWEwU4Zn9qov3fxZUYd5jLCs3GGM6ybs
	 be5weq6xpPit8E1V+waBIH7d/MwgQYeF3pod6GQ9zXFwWv13AFpzmF3qO9r8IQFmBqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263925;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zTBDdqdVK2g02AANq357yyU4yOnZzmvhW4b426CSbp4=;
	b=xw50k8AtP8+UvUxxCAm/ECZAfuM4QbUPPeI78yDuCMkWcZCHwHRgfj3NJ+UeRqhmLC7i
	 dUARUVmwEEJZq4cMQGbMZGSetSqs9biqdfkAZ4dUobAgIqa3uFkAhQ5WMbF57uAXpfSmY
	 wFp4YBPdd3XrCHE/whn7QdGrocVkhuVRvj91lqzTGJVok1LJDJKtBkkoJ6lQEbLSkgi0a
	 2qHBImpCKNnwhuCTqp8HjB0KnRJ9M5jNSecEmkzSBL8VhlTRUcgHjhIvyYGnis3KeGnXk
	 WIKfchps9cbfZcqxktWqW0kDaud5fFAdPEQwusx7Cj0fYZsJJwEMXNMO6vLDxBfF9Zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC6D51F008A3;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263925;
	bh=zTBDdqdVK2g02AANq357yyU4yOnZzmvhW4b426CSbp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=imefxIuQ03/sMprRm0VBgOYV2Ad3R5WGbS9wv/5vkMmYmFXI6QD/ivX4bqj77VuVI
	 ovoEiV2Z2XZ+EMiM7vwp4x2KazfFMDyc7qqMPGuIIbaKO5WQvSw9WEPWX+F/YsFzAv
	 DxV9kiy4u2h7rWEROfwO71vgW2GAueX/tTNFInTRg2cC+GRwnh/BOk3MlSPR/4wrB0
	 FJ9vVjb4bGt4+JE4AsE2PJfN1HyI5NzQKm7IzAazkzJD85EVE6XMBDzy6EKMsWHsS2
	 ghvGR8TrcNjtjUl2MNRDfkcEtNDz2u4A4UN5y5NC+Rkv9+t2iI3VUpUooJZWQP83ge
	 96De45wOhLDaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4578E486CB;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 22:38:21 +0000
Subject: [PATCH 3/8] dt-bindings: media: i2c: Add Samsung S5K3M3 image
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
Message-Id: <20261109-sm8150-camera-v1-3-3d2e7b407516@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263921; l=3463;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=tGZ+zbw9ZERTwhJF6hVQyIufXiB8qRroYi+8OOTYnCg=;
 b=fj9HQAkNpa0WIUCDJfD+j7G+CNH3ZDiHmlxb+fjWp8VoCN8i4gpdbUXHk4ufeNfiVxOpeb60P
 yj6FZn73EiSAQ34CWqxl05T6PYTMNZfb6cb+zqMHcGx6E2QnqhJrMp4
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com
Content-Transfer-Encoding: 7bit

From: Gaurav Suman <gauravsuman007@gmail.com>

Add bindings for the Samsung S5K3M3 (ISOCELL 3M3) 13MP sensor, used
as the wide camera of the LG G8x ThinQ.

This was written and tested with the help of an AI coding assistant
(Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k3m3.yaml         | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..434f5d4326b726d0a65288a2a91b750e38a8706e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3m3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3M3 Image Sensor
+
+description:
+  Samsung S5K3M3 (ISOCELL 3M3) is a 13MP image sensor controlled over a
+  serial camera control bus. The driver supports 4160x3120 at 30 frames per
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
+    const: samsung,s5k3m3
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
+          camera@10 {
+              compatible = "samsung,s5k3m3";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
+              orientation = <0>;
+              rotation = <90>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2 3 4>;
+                      link-frequencies = /bits/ 64 <595200000>;
+                      remote-endpoint = <&csiphy_ep>;
+                  };
+              };
+          };
+      };
+...

-- 
2.49.1


