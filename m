Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E24B0493;
	Wed, 30 Sep 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765614; cv=none; b=c0eWKhZclWnqJpFptdDJqMmlfYHSjbK3h2u+vbTNPWIbgGJ710UPyY2UGl7htNBhshbfTUHEd2il6MKhJM22wFI59sImQXzpMvpWhFg4KgnT7zUPqZ+Xqh65Rj+C2j8YIMsDWatxMLda/XrqXwU6/R83wLW66pZdMD0suyYG150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765614; c=relaxed/simple;
	bh=tludWhuI7KWuPh9oQDoX76PQGtABhCCxsjAEb5GJ0qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXelWoKScJuIp+tLgviYfaCgHBBW7WId8HxEUgs485JIGa50SlmjHkNwkhdt1Ffnivw3tAc7i02uO/G1FkwWVWFd0WDDUraO98ujqQPqETjSCZvjphSLaPlBynEpi5HII+qiSZzp9imYhngEVq/nXyIAN29dHHihjHWsU472L8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=atRSPYh1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="atRSPYh1"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6973DB07;
	Wed, 30 Sep 2026 12:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790765491;
	bh=tludWhuI7KWuPh9oQDoX76PQGtABhCCxsjAEb5GJ0qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=atRSPYh1+w6W5iZDpjKJIlzlHqbNpBEb72gzr0Ey+xF3G7d+/j4ey1FAhGMaFby+o
	 M/XAkcRkb9VyiBP2xipR3PdjP75sbHHaCl4tubbRkLRrdF9zlWrnznVkyasuW2hRFq
	 jFfsg2EFt7fEeLKgLyEngG6wHXPDNWYkZfyTe1LA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 30 Sep 2026 12:53:14 +0200
Subject: [PATCH v12 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mira220-v12-1-07061064cd7b@ideasonboard.com>
References: <20260930-mira220-v12-0-07061064cd7b@ideasonboard.com>
In-Reply-To: <20260930-mira220-v12-0-07061064cd7b@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4484;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=R360zkA1nKcFrybNyyU2mixAnWiG5Z5Vw4TKNrHudLA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqvOohEoh+IERWBq02pahNomFNGkHj3P2+AGabj
 QxU/+8xpjCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCarzqIQAKCRByNAaPFqFW
 PK14D/9wJQZlNkCmVXwSbqe12jpGalZBD7oWyxOTQDS3/GKYfkggHuS04oWKorpcMoycvraosM0
 Sdtu37NaQD+GLUhfj3/Xh7XDK5i53JSUfKzNI3XSTGBBI4apG7vpc/DFCJJX0gsh0Cr21zLvWyg
 rtLZK3bghzX9aMKkTGK+KnN9YpCyyBoI0xwZxAndVXRqHexCQ1BTwMaRIuz8NHO7y9YTWQO+Nfe
 1oTs/pU36l2yLaHfPuEBg5R2AxC0vpi+UCnjdtbZYM+E5UIAxNe/EHWck0Yt5B+Dm0cJkCn9nNC
 2AoC817oZsNH7hTge3JAYOlgzJLhS7srwmR0BdVbcuPnvD5o/VGXJ6PlT2+9OC4wDS8aQ122LVC
 +19cxIeGKLv3QGZ/ENvFJM4FMaOxlAvL2TM4Jp6cWjTmJSp0uu/MwsytOaMI+ta9pp+WI9K3QKE
 KBGLnhjlsIikMVt+SfmOHjc4tQgSKKQTcuKJjGP7KcVuvFHhdRNpMuC4koQi0fZeYWeicPOxP5/
 5MP+YLE8WOguAV7oBssUC5Yf98RFvJbLIvuZXKUxhl1qR0+flqcggHWvpBSmfmj9mOpzmp/LQaF
 3DSElQ7SO0CbKG9+X0uxqwd7i8NYY+N7cq7kw06t+HWnZ92fFrtlVgYm/a6etBFdMZYwByBriKJ
 xweFNOYsmRstTTQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Add bindings for the AMSOSRAM Mira220 image sensor.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v11->v12:
- Remove labels from examples
- Add myself as co-maintainer

v8->v9:
- Make link-frequencies required

v7->v8:
- Add Conor's tag

v5->v6:
- sashiko: use 'unevaluatedProperties: false' at the top level to allow
  properties from video-interface-devices.yaml

v4->v5:
- reflow description to 80 cols and drop |-
- remove 'reg' description
- remove 'anyOf' from data-lanes
- remove 'link-frequencies' from required properties
- remove 'clock-continuous: true' as we already allow all properties
  from 'video-interfaces.yaml'
- remove tabs from the example
---
 .../devicetree/bindings/media/i2c/ams,mira220.yaml | 103 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000000..f809530ee660
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS 2.2 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description:
+  Mira220 is a 2.2 MP NIR enhanced global shutter image sensor designed for 2D
+  and 3D consumer and industrial machine vision applications. Due to its small
+  size, configurability and high sensitivity both in visual as well as NIR, the
+  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
+  Vision, Structured Light Vision for Robotics and AR/VR.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ams,mira220
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.35 volts
+
+  vana-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
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
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdig-supply
+  - vana-supply
+  - vddl-supply
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
+        camera@54 {
+            compatible = "ams,mira220";
+            reg = <0x54>;
+            clocks = <&cam1_clk>;
+            vana-supply = <&cam1_reg>;
+            vdig-supply = <&cam_dummy_reg>;
+            vddl-supply = <&cam_dummy_reg>;
+            port {
+                endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d30..d61d664aa459 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1454,6 +1454,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA220 DRIVER
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+M:	Philippe Baetens <philippebaetens@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.55.0

