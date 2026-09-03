Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8749F101;
	Thu,  3 Sep 2026 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437787; cv=none; b=RKaFFdcB49uhZ4aaoXKO+jfoF4dzll8VQAv4/AjU9CeHOTS4vi5814DFdyfI9khJLu93PBmPXvvOjF2IDFHEMzoFcR/9RjcTVAFX6paIn4OYmZo/l4zLkWToWj2smXzyL0T/FIkkgUnOn0cx4bvIBOsQZCk0p0iXLi5UbrkiuOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437787; c=relaxed/simple;
	bh=Hl1D/JYZ4zZRYCvc9Al8x/EjgensVebGxTcjxqhTP14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V390v8A17ylCTK2CGKR/+k9rjDhp7hk0QhVLQz9P67F6wJ6arDqk/6kE+I3qppHKdVcCMcrDYN5l+7TR+h+jXa2WpSSm6zDWNBcRpbDmKRrwUaScD+91Qv11QiGjinYp18ZeCQLaIPxgQbjKmkTY5y7nQhZTs0lju+6szNEAudA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TdqGuGEf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TdqGuGEf"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01A082590;
	Thu,  3 Sep 2026 14:14:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788437690;
	bh=Hl1D/JYZ4zZRYCvc9Al8x/EjgensVebGxTcjxqhTP14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TdqGuGEf3dvgxoyfrrrjv2UF6wtpod1snTtP+TvEDHv4xpi+cy+96EjANh6/DYK/E
	 FZVAWSBoHzdguIeHwGYyMRioFYS6qP5O10WwV/RqxfmCk0Tq7Q9YPO8wuBiyzZdEu3
	 +mwc5hySK/2c/0ZJZ6WR94lOfy4oI5BuH6yIy8+A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 03 Sep 2026 14:16:09 +0200
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mira016-v1-1-af0013ef070d@ideasonboard.com>
References: <20260903-mira016-v1-0-af0013ef070d@ideasonboard.com>
In-Reply-To: <20260903-mira016-v1-0-af0013ef070d@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3582;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Hl1D/JYZ4zZRYCvc9Al8x/EjgensVebGxTcjxqhTP14=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqmWUUp7XAQV4mwsBgD4Y6P3MeozYz7AW4YhbJm
 mxsrrq51JuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCapllFAAKCRByNAaPFqFW
 PO+lEACMjy8h7KOwoBhgsugNlWLkNFygMXU/Wg2bv86HdbKKsmwN0tBNtYiNk6Qsqj+FvxBb/Yb
 dvJ+1T9j0882mDY1PFn6RfOhpzcOukwYmWqUzpk1h6JHtQ+qRIJck/O6KdvU4xJhXXb8NaXliQJ
 n88P/H0LWu8DxnE9Xsl4nISvyMrqo2sqEBeU1SgDu/JHl+0QfvHklk4GTicC9VpvqRlnsUVlCJ4
 8bt3N2Jd0TN5BLjUXS5zAPqUgCRWwTiPh4d4D6Ld6E9CgidUH/EC7wKDbv4838EmbiEX6vxtmQZ
 xnYAb2dVZDd2kyeiEFzmKAB4zP/adYsbFM1eFKb7Iscw1u6EoOO5ZcjvLXeqodM6qK8lx1FbaiN
 EbPn+9VMgaUqv1V5K3hkdqy6AfplcrqFBT/ML4elx3RFb+kEC3iliKHO2XijvvCoav0mqwuHfBD
 uVS5HIV0Xmi1MR9nr1sbGwl1FVsoFLTUWXg8KjkltByqoV8clT2dXezQ0T2nXltFfkxRIWCBWkL
 mrMYYeFy/koL0+3UzAHEpD2fgRMiy34VS76qPule9USWRhyk8YUoZs+WeJYbairv2xyBk9l2qru
 4GZ/EPM6b7KmDtuytypdik/fa6RdlkKSgEADGwS6Ch1tubCOKAnOVkN7lJgbq4MUlEL30cADA4k
 QbXaJfEcARHvtZw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add bindings for the ams OSRAM Mira016 image sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/ams,mira016.yaml | 95 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
new file mode 100644
index 000000000000..dff51c8a2ede
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
@@ -0,0 +1,95 @@
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
+        mira016: camera-sensor@36 {
+            compatible = "ams,mira016";
+            reg = <0x36>;
+            clocks = <&cam1_clk>;
+            vdd28-supply = <&cam1_reg>;
+            vdd11-supply = <&cam_dummy_reg>;
+            port {
+                mira016_ep: endpoint {
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

