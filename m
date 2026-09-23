Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF2566C46;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176712; cv=none; b=mhZJvdlVlbnnTCpd+ZN9KEyl5p/2ZcI0SCpvViNhfnhbevONTOLs7SFLSOA6xhEFhJYFdH4C8h4ERfG7tjRYcLzcx3vn9imw2+beh2r57RfZusqSAgri6cHFywWJ+qfSkECuqgRvRc0wpOIvvdtY51tmcp9iX6BhmLW5au4BBsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176712; c=relaxed/simple;
	bh=NlqPdjwrYm9qeKZ1Y9pedbHnRECF6NwU68PEyypH7XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wj4vFgb2KhyAZsF3H+MMNBKrkazbLOybFch7a+FTeDg7f0IEx41RD8Wgy4sK6mn4dAIf38aDXBboBRZi0cx9vPMl161jhorT0Xwb6vRI4AgE4mPU6ZwuS83RrfyUt8qjRVqhzQibwyP7ktbCrH2zb6crcpm9ts190byu+58JEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyKKV+DY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyKKV+DY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A85DC2BCC7;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790176712;
	bh=NlqPdjwrYm9qeKZ1Y9pedbHnRECF6NwU68PEyypH7XY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gyKKV+DYl/0KmyxhUPBPk5+e1wVNhTBpRI2d6vZ2ShEmqAIZTu8AxlcjVpB1X489u
	 pZmR9B7J+PY9LG7znKJZR+ixxYVeacW81cMDnEKUtQ7vzxjxpIXT3SLUr6G2mJsbjH
	 JesTqFTi4obYdb0NTLoeeoPLGRI/H6yyTqTxinqIWwu/3AR1sTgc3tnymy8aWV4Zqm
	 n3qg2g2DeL3M2CzsDzkKllzjJKDegb3kzsn70hfM7KGBEo8WGCWrG4U5+9wo7OsM19
	 lMLb1ShjSZruh/yFtNNKayxm4G54Iqvp2e0AslRhQPsv4FSKoBVI6VHmqNm9JIZCSS
	 ivCMsJlGJv6Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23689C9830E;
	Wed, 23 Sep 2026 15:18:32 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Wed, 23 Sep 2026 17:18:31 +0200
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2 image
 sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-upstream-s5k3t2-v2-1-04ffda3350c1@proton.me>
References: <20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me>
In-Reply-To: <20260923-upstream-s5k3t2-v2-0-04ffda3350c1@proton.me>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176710; l=3990;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=TgTul2Laa66jNxvryXNeahFMUK33hJQG1mYYZfYNCUM=;
 b=JZcXLrbznm4Cd4S9W2cEv6w76lZOXHmmtW5GEZRQOdam0WeAY9nhMYTtLEtLuqWPTq0iMC31f
 7xJNu8bK51mBNEtxhCJw8wclWvubpd5+gel+F3rYELVcHKuhNjGcCxo
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

The Samsung S5K3T2 is a 20 Mpixel CMOS image sensor. It has four MIPI
D-PHY lanes and an I2C control bus.

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 .../bindings/media/i2c/samsung,s5k3t2.yaml         | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
new file mode 100644
index 000000000..83b3d55a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
@@ -0,0 +1,101 @@
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
index cc3cae2e3..1924dbd20 100644
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
2.55.0


