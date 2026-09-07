Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35298409273;
	Mon,  7 Sep 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776499; cv=none; b=ZXxI9BK6qsIbiHb4BAMmi4L7mAjrLBH44qbV3LxQUAEIGPYtVDUhp4GWlS2y/EigBSy7soGThfS2+9VOdmDPZS7GzLzHDcqI8RKDqoNNxA1ZpKOC7Gj9m1BGma5HAvpegJ17+jS86l9o6bXt7e1b5F5XBbitGJ63TCmgsBcVoJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776499; c=relaxed/simple;
	bh=QYy17LhUjd7G0KPVtQa9AT156zJJmhd75aS73kNqMnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WK2khTAzHA76TKlp56XgeUmhnBCu81RY4gCRjZDHJujVXhhXdxWLEL3mR/0K+4tNzhooNRYRbTL0SsV6o+coON8N/3H09wXHgPPNtNGaZdQr/22RrwlZIwWoa50vvCE4GfVzV/NqAYFCaa6BQmMavO+nhdt/rn9kv9e8bl1F3N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MyIUgM4P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MyIUgM4P"
Received: from [192.168.125.177] (mob-109-113-65-131.net.vodafone.it [109.113.65.131])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83801C45;
	Mon,  7 Sep 2026 12:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788776401;
	bh=QYy17LhUjd7G0KPVtQa9AT156zJJmhd75aS73kNqMnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MyIUgM4PHlZAyj5IBo0EwhluZKfPAVtWS3uztIZxOe/PdIqGUQ6pvQMbMj9CxFHWZ
	 sUdhS4t9O/AZaYjLVU22nIcb4yTABNU/D3rrPn/Meg35SRsQ8mZ9b6jOKmVtpy9yie
	 drPj9N1q5/+vwuXrbqqu7dAEyn5txF+dwBUgt79Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 07 Sep 2026 12:21:20 +0200
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-mira016-v3-1-b078a6793d65@ideasonboard.com>
References: <20260907-mira016-v3-0-b078a6793d65@ideasonboard.com>
In-Reply-To: <20260907-mira016-v3-0-b078a6793d65@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqnpAsfMgVKuI9x27G8Ms8YoU+ypuEmcSjyPY0v
 8cxLRu8JK6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCap6QLAAKCRByNAaPFqFW
 PLWSD/9lx+0Lhm70K8q7wW6xva8UkGLsIf2H5w5gHAtCgA2YqnUC3ZcPQQYlnnmiv2iB4b/NPu0
 kpSfy/Wv/0KLeDgeCyEBgFxAAvmXCMKWvSAsRocxGzcoDOUG95oyzhbu+snT9ShLNjbgqvIKxzV
 KlZxzfjsaNLg9g4crM2HiNuCTeOC7ABguCP37EPMGHAENuRADvQo+rSrAX8iFbQyKpd4lnAkXkF
 mmoCRqHv2NUWrfehVqhdtgONsrfpQVWVYUURfe3fBXB+910n7AvwIzXnuQmK+w+BfQz7MyAwNDd
 mueNU/IvSOnolGSHOEAp0BersNaWJce0nrA0ILHOLdIhWPt0Xb/bvLVg3DbrI5iHkazm0MniBZw
 gM210bHYNAw1bl5CWGnuCYIEXWloN7xHDNl4xsTI7ZXQMmzjp3EZ2l5g3DpfH9t4s/+nQSb6IkS
 XXaaa93Rm0IyB6bvn2a15fMQKkFNprg6tAuIW+3vWHJyqoi+CIZOX3wgCoZkmPsAJA5NKibnWZ5
 E3OaCKb8dYxFpzf86iPi/4OZQjw2HeUPnKcPQiyDpN8dnLSQdGpt0p9/Di+h5O7pzGAHrRsYkm0
 xke6MPs5hqQkV77SRR9je/ZeSsIYAzQhvUx9W+9HHSMDjh/4uMNx7Fq9kD5iAbp7Xs9JTO/kDx3
 AeRIczVepHIqMBA==
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

