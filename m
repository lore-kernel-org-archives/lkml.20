Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE53AAF6D;
	Tue,  8 Sep 2026 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854272; cv=none; b=e80zymrAZNM0Z/b6UDbMx+ZpI+hHYZpxg58ZAAKGaUGPpsal9MqYD1+iEXaAngZtPGmGfBFBHYKZXjca6IPDvEh+oJjpwYRUmxfSYuc4DJ+qlW4OgH773Sevt3Qb50gxXorKnaNtjJCZHnEDyClJQz/2SeL5FyBZCdJsNLDifSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854272; c=relaxed/simple;
	bh=QYy17LhUjd7G0KPVtQa9AT156zJJmhd75aS73kNqMnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZ5Pa7uCFeCFAMD3skvtcX8c93p4kfInzxUi0kDa2nzE26pBpn/yE57IHLyiscKWhmRpTt+IN5pJ2S3sEl1oSdfiDGYxDcgfTltn8I/MU5hcfktsQNkWa6DE1yAmAudFVsDiZtTfW4BzdFt5y52+1eE+5ibRhBb9f1HD3IuvZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZMB7o0XO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZMB7o0XO"
Received: from [192.168.125.177] (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C9B6C13;
	Tue,  8 Sep 2026 09:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788854167;
	bh=QYy17LhUjd7G0KPVtQa9AT156zJJmhd75aS73kNqMnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZMB7o0XOsCH7Wa1CCHf3fgrgP6qCGB2Xon+B2LEnvFE7/qwszTiYPUtRS6MDlW40Z
	 CQr1p4hINKCETZ9ichvCAYQzoTEJs8hRzGqtgYlmQR39quqZrj4Ijxn5iojXr3RH78
	 RCbV8A3haDTQTq8oyoz1QiYEy1GKq269KKsPVdsc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:57:23 +0200
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mira016-v4-1-1950504c131c@ideasonboard.com>
References: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
In-Reply-To: <20260908-mira016-v4-0-1950504c131c@ideasonboard.com>
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
 bh=QYy17LhUjd7G0KPVtQa9AT156zJJmhd75aS73kNqMnY=;
 b=kA0DAAoBcjQGjxahVjwByyZiAGqfv+yjQJRwp5i7f4NZNZ4VPjPYG+RJG4LGhKhurvByNXEqx
 okCMwQAAQoAHRYhBLXEPUiAmiCKj1g4wHI0Bo8WoVY8BQJqn7/sAAoJEHI0Bo8WoVY8kbAQAJ0v
 tcLWtVGhD5r41v6QVN9vaOnaKg60rXxKZEfScS9KoI5DabaOCRWf+PpXPnWjWFSCRGsJ/tgBpkF
 8LPMo/Yb2v4mgsNL3Vp1FFwcb1RGh/5FNg14tHW4aPdlYCC2O4LjF6GDwSdj95vJPTueHCu544V
 O9TJFhdNNJJSXFwFSoh1ozsCmqGBRdxM82cKi5z8pMKmgINPdH8fh82U7Bv97JzUGp3uvnnSCvv
 QHmBl8kRnVdRkViZ8K1apFe4r3I8zBK4JeRq/C4xXh+iqFv2DzfpgKw/P3wQ7YP8xH4ju6JTKQ+
 DjPU5dGDq9qJXnWI5k7FYxowwlSzIJbCHYQkPFNro4N4zCELGblTEpJkvnpkVFnX60mZeUU1liq
 Mr3v6ZEYwiOqVdx8xyd78RNRKDS2tRqdkh8t+rMGui1m/fGydFYfRetymD2A7nhgSr3q2QTZbaK
 YWxeYzevkyKFiSsyflVvDgtL3yW+qlMlqo+S5VVZ4aH4bG1nkf58+IjQy3TWA4mSCL0Ui50LKGU
 CDY20JjAmAXPVAuf7y3k8nSOpZaGE24moIbjW/p2fqxHIKTVjeP78B29gibd+zkc6zlqvhpQQWs
 1xfFF0QClmLdwrD66XKoWxvon8dneKUN1/tTB3TZTT/fuUlf6DR9LYrqkD+4vvfZ3JsRUHjT/U7
 64d1a
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
index e12dc3ca57ab..1c24b05b378b 100644
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

