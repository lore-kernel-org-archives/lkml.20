Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657768;
	b=gHxnOQEzDSbIstzeI6tpO9ZFNzdeMjazlkBTZqQD93wSNXRgU0biUOEQ/L3rSsYUNTi8
	 rG4h5cFOju62DHXQr/ttqv7zTF/sep2zK4WAOpsM6Esy2AEa5pyLTKaEx9npmmVQeGoWr
	 cVTE6Mrhkp4/MGj23VSXXwZOp9T8rpjTTYcz18dxHJCiHgHLeHioTvffn0gtXP3VBoKsE
	 xeX32yWCCjhVlN3szpKScptesaBTb0uh2w56nzKV3EttVS33fGfFktRZSj7d91hxxmZkC
	 yhITSLtfaZkuMXTn8FrPRa8nUs4daIC7uODKK6TYxmNOLRZlPWmw77bf2UB5OiR8qPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657768;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iphSEOK725Po+Iy/KSgcBsItwqmHt+QArLh0InOsxhQ=;
	b=g+1kAuTJF+vefVECIX+4rjbyUHHHHKF1CI7YLItyiClUt2iieme32euPADKiLLJp6SBo
	 DoTz2zUyiybTVpSg1qJUDGP6lKN/iewa0SAR0Emrfdo/QIozcaHDSrdBGW059wA0JpavL
	 HFOe2B2cg2Pjb9EGoI0nLafzq2KMRo5AgNF0XUm07vK7mpFJD+SUO4h8hMVgRgD2Grh9K
	 j8ffTKy/iNHwtskcKVsNJhcz3EiT0+dprgKSzP9UVNbC6JT8NcNZgygCE3XGHoTbuvxFt
	 vvQrFFLsSfGwVqXskb9Voppm5kUzikCgB0uHEQ3wmxOXYEfyUpph3pJSYrmphlGKo+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oa7JErOs;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51140606A31D;
	Thu, 22 Oct 2026 08:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51140606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=oa7JErOs
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 892FCC23;
	Thu, 22 Oct 2026 10:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792657636;
	bh=GtHdYQ0qiDKaxymiPI0zKjYJ/BnmZazBFikYr5nLAmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oa7JErOsH9/s1gGdsBlVlsSzaUFICtUJfXT+Lv28Exbz7hb2UkSck/eyEzXLSD91p
	 RPbKMff6KKq5wKFGIpM0Wi10GKyyM5ZToGro4OuAw8EEnY0psdT/vT/kCMtzE+3qTW
	 cuyL/I3eQUE2G/BqVsFileHXHrshxbA9agcvQWb8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 22 Oct 2026 10:29:08 +0200
Subject: [PATCH v8 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-mira016-v8-1-a7adc039e938@ideasonboard.com>
References: <20261022-mira016-v8-0-a7adc039e938@ideasonboard.com>
In-Reply-To: <20261022-mira016-v8-0-a7adc039e938@ideasonboard.com>
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
 bh=GtHdYQ0qiDKaxymiPI0zKjYJ/BnmZazBFikYr5nLAmE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq2clh4HxwbGsE/r5KctvkUoH+SKcNi9EvYyLCI
 f7cwGLyC0mJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatnJYQAKCRByNAaPFqFW
 PLvmD/90wosxVYIjIwWn7TLPAb9dGZMy0pztN7XOy6y8690M0RKf+ZpjKQ5A5jAydcgtJ03hhgl
 oUqeD7/q7KAZ2oFxLt/Gl4jfLqfXlTZoDRnGBiT6O1/XmJkrzHmPRKHUb43o3JtMZ/f5/zva2ES
 LApCrolXUx/XZsIwYPMrZznDovG4IHlghRGfMwSzwD932anfGveJD4wbqs6YYgILeC0hpML/vhB
 5Vp+RR6Vai5Ui3jkyIr6YirAweJwZftUGBmYtl8LCN7C/2NlwUYNS+3+V1uUrCEzuVxH0NH6QUz
 V5xefDmuE7wCMik6bojiBIayheRuqVNNwB3/gTrLIHYQ/cDdKySO5cpR1Q7Fr73P2G+kCigZHj1
 PtZqXVXUfVdPm8C4r2z6UYHN/bsV3XWNeDs5fQ8jS9h80ucjUB7Jj+T8y/3QPVVon+FBAwtCXxn
 ftWGxoBqscR3kGyMBEqytr98UwIzCTxFr9HZrLDtbKRcTjrxDqs3ZPPAt/I6uMHTTQsK/ICG9vi
 bkWZlLTDHg4vs6AZ1a5s7ZwKkQ/4WOcQcmmeGAkYafrP9J5Xjb0TnQ3rq9GIvsMi7rmEYdPU9PP
 3P//LyuX5AAgFT+VPVrx3z32VnFuWO95SEmgOQ6q9HPnR9FWcG2BLA/q9ZG0avcqM8QPu/XUUDy
 OOo81VmZiuyuvSg==
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
index 760791e3635f..2e01f389f057 100644
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
2.56.0

