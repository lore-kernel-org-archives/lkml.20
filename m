Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5333EFFA6;
	Thu, 15 Oct 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070531; cv=none; b=XP567MxPYf8X4OYn/8cOzTLh9LAshjv1dfKvsBx7QtyHK1n/vMfyl/RqrJmJf6rGq/FZ4cqSs8Xr5ZS2fO03aRM6QIDcI6Gu1OgcFedIqUQ1F6KwViShPyIdHqiWX3ahraKdmalLCCEbp4tOV8pWKyCsv9qhm7HElnhnjfh6BAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070531; c=relaxed/simple;
	bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8ezpqtqJQm40cqFAkurBpmwVFDQPL5OV5D4ybszyuHVSE8gzaQGuHMFnWJHZndrNh4xOLJYZQTk/4JWHD05ZFTMsP5LNjClhfdkdwoith7mn+BQGCKeZ4ITPvogDmZbiVwyy5NebRY7CbF7ZWlyCa+8MvE6EbfAoP1RbSoOyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lOLIQy30; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lOLIQy30"
Received: from [192.168.1.215] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 938CA4F1;
	Thu, 15 Oct 2026 15:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792070404;
	bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lOLIQy302uR+9l/zojpwx1bdU6tq3JWHwjg/PUqwhTA/pgeICQgMjcJG06mkZ189c
	 cAdSMHvSCDf+PMRKdR+wwBRUKUYFsnVntqgo1tT2wuM4PngXDfi6A6FlmulSl/Eyfm
	 9BAhiVcNgZtWLz8C1JzxQZWDJ03PEYbqe+y/QK4I=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 15 Oct 2026 15:21:49 +0200
Subject: [PATCH v7 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-mira016-v7-1-828c931c5550@ideasonboard.com>
References: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
In-Reply-To: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
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
 bh=j/mjwgMFfWx14DxqZfBXYelW4WS4Tjqwvqj8XQCa3bg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBq0NN8VbGvPJjLaXBrc1mQlaepPppVht7HPuger
 ANfj2AKpMOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCatDTfAAKCRByNAaPFqFW
 PO1WD/956Zxg17b8RhEot6sr8dOXN/BNjWjF8wmAnVxDLvakb3R2WnsrLL0UUgf0si1OsiHPEvc
 X/ZO6WgizLoMS9dtnsJK1gNdH8RD5jPKIb3QGaAiVxW3Mbdla6cS+aTWFkbRjwEUqBkriCypI25
 pxGfAz/Amqo+Wic6LR/yI1UQYivBEMsxu+85ankhN16u+Hfuk9RxuJezwkkm/MgeYxzIhDL6Uoa
 wGEMqUPlHtvNm4JZsTVwC3CFLoaDSjSlKc8DKbREE78vxQ9BQYc8Li4SnHTq0ZnoqU8yjotbjXM
 SB2O1xXsE8OeyOf3xS1DJR74A5GL4lpnm2LEZE8oBkuls4JoRsAWj1FWroeHKSPrBB3bEBD2UYD
 NNXHQgXGnYvO1Y0gcy6RUxHul1aHoY9IHCMpPzTACyet4vn9y5TP9iMeMolNQkNZC8DQqNYOg+s
 +h6dY6d6eQWpUO/Syjqvd3Wziwk5ZBYqGatwpS40NEYs/x/8CI+FYyDVdM7dMJl9bNP3/3+nutC
 2v3BFKLCSO4IhwkAz8n/d5IEIY49iTcMgXh9EZyH2bvY1aAJew7DiWCXWsizQQXTfrdFAHyoavt
 GikxYpFhxk0AS8wLK6WvKp0E2D4egUIM/VJYUN/WCNApgNw0Lw8xwa2GNcpfTSVDgrJt2TOXRrO
 HCYhqgJ5jEqZF+w==
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
2.55.0

