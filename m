Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A14AA3E2;
	Wed, 30 Sep 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765524; cv=none; b=kZhGxr2Vu8KqyAwVqCyBbli35dJbpL+8cNFwdtsJf3Q+EHo6gYiX1CEHRmBD+wuBmw/cQRAEndeysp+ns2XFj8hdcQKGoMy705dJ5s/K1j0uF9VPl8T4auKWfxP5aGlgfO51q4YAVEhcKRbs91Hl1B0CIfdSdTd5ruV3K3YxIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765524; c=relaxed/simple;
	bh=J1ATkUtbRsqqMDeJ9hZKsvpLL5yOjba6D1QIlbLSPZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGRF4qfwK88M7IwA4fKKIu9hK2Yt7Z5u1mWSaH17aGgYe0PSaaXEuvIHbZgruXLvBzqZdq8/pF2rfiK+pGGRzZPM1Yg/JDM7MFNqblFbjx7S8k2+Y+/F3UC1VCzgMpn054Dlsk7zt2bgHflkVmaSy69ygmCUY3t7fkkxNDqmSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VoePUKBu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VoePUKBu"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA0EB07;
	Wed, 30 Sep 2026 12:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790765387;
	bh=J1ATkUtbRsqqMDeJ9hZKsvpLL5yOjba6D1QIlbLSPZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VoePUKBur9BCAwJRaxWC02/wyE8zq060NUTMyWcT6SFLXiE45Ro3bITNq77PD57iB
	 AH1DwWgzhZ9D/re6c5ymZK6C8KWP3VPLLU8c4o0hfEQ7MTqtVvQoWB4oPvvswJfeWH
	 NJoKQltKP4V0nCBOOzsQ4nk4t5wivumokDaJaEIU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 30 Sep 2026 12:51:19 +0200
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mira016-v5-1-499a34ab8204@ideasonboard.com>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
In-Reply-To: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
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
 bh=J1ATkUtbRsqqMDeJ9hZKsvpLL5yOjba6D1QIlbLSPZg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqvOm4f6oS0ciPiHxkyKJmtBAAIuhw/5m2ZpRvM
 fcptutxPjuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCarzpuAAKCRByNAaPFqFW
 PI1kD/9UM0Pym/wF3qoxFL9XHYQ8Ug06/6miV/bSkpjNWVvKae09Fye7eKqlvVU/89ZbZmS8p9E
 0CCb6drPDac+XXPExoyiW9q3ArkLOVUmiv+FHi4r9aShDQJKlSzxiIbetkc2up1ikqeU8n97vLb
 E4/q1csktehRrPprzCSYJSIcq3wu1/pGmVE1TECNHMMofeSKxqf+VqziaxWTtKEgty0wn3BSP0g
 S/5eBw0pofvMXHTWky1P0Z3fyJatnO6UjQJtmFrLXVhutsSbi+FE39wxY4qfbEzVTTk1SSr/Sqh
 kW6tgrkWW0IrI3WcDej2W79en/ccnAjRWVVvfsdM3lpVyJATVXgBX8jR6k4wHX/34EIxpq4XlJt
 Rua0XD8PZjtTqxtZvFAdbeucIR3S1ND/G5sXKJahc+oqZm74eqSvdu1bUnQ5ZNwIarTezU/a1T6
 90dqwRRp9s+O66rzRNxd7FCrBqklchjPGB3EGIwthuFRHi99iel1JC5wEfmHG2m5K+vT6tmjPGr
 5BRr3RhH45QpOb319t70Pgl3iD5M+yGecUB29j5+U/CJqj3GMml/JCpo2KAh27qnHdpnK+mAUiw
 tpvdS+7dgyYL9ARsIfom2RfSv9R6IVSKHxXDbz5NPYRWAlKifON8XiabBHc5iWXRdMV0/pNnQuV
 eLUo0JTvapY8uNg==
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
index 4cc4a2dc6d30..1296280f4299 100644
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

