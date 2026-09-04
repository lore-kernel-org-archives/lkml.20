Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D63F58F5;
	Fri,  4 Sep 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518632; cv=none; b=YZtLJWFyoUZ19ixHUwLhB5WoQQ+Lhm8/1FulqEWL2R9ENhcCP1Kcvf7s1rwn3w6YBJU9Kvlf6hAH+322XXkIUsFSmLLoWqHg0xLZdoy3YHlpBZNECJDFR+H6HK0TpY3eVYXM6beVw5g4dLAguFf5zPSimBipoenlSA29ePJKGXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518632; c=relaxed/simple;
	bh=Hl1D/JYZ4zZRYCvc9Al8x/EjgensVebGxTcjxqhTP14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hjPoGCyNRI0+IkIaVl/Fu7/tXCBH9UmLuiDC8nkQliIDJ/NfmS+OQUrYTDOF9efS6pqZ9e2Kiirpn7HFae65C8PudX2xrIUclsJrP5xYRSZnWPJ/5GopRtCwayino17YNQDET1hIkUXKorf2/qWGZAYTrz//MnZK0Ylgotwmerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nHwr/s5E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nHwr/s5E"
Received: from [192.168.1.7] (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 955FD2286;
	Fri,  4 Sep 2026 12:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788518536;
	bh=Hl1D/JYZ4zZRYCvc9Al8x/EjgensVebGxTcjxqhTP14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nHwr/s5EKA+eIMv8YHfZU4f8qPT2Xhf25LeslsM1Q7+nHlPSHzOUiH0z84xbHjz9y
	 3O0Yjx1MWNkDG6Q5S/uSb4DfXbBYcPCkh4mplbfj+7Rz972LYX7OxY5N0wpySjJsgV
	 t8aTUK/1A3M/u9tSTVUS8MVYskZWGLYs1R2Ut2F4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 04 Sep 2026 12:43:40 +0200
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Mira016 image sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mira016-v2-1-1dcf7b3a807e@ideasonboard.com>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
In-Reply-To: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqmqDixnG1Iawu1/mr9VtHoQM1PE43IQ/JAJwWa
 9SYaWkU7GCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCapqg4gAKCRByNAaPFqFW
 PNeaD/9qdwsXoZuH5VbSJ36G23uaHByYxe9gz3NFBuBp2P7XCx8rCa5Y8gEuoE1YHawboiL6U6h
 ybOgOSfFaEZjRWqaj3S1wAdkpHhpJkShh4q46/ity/byHFKWRTx/YSxosP+eR1i2tA3jVrvIHyx
 IUP2EelC3X3ulUmBhNQhDiliZvFXpRVc76zjhwrLi08/VRC0gzRR6RcvY4T96iRGgpw0V3i49yg
 HuMVKcHKKlvcYx+5c2PsvJc/Gd/faAOh2FdBOLEVr2uPsd5sr1qVgn00LV1IGdNV+zE/WF+4NjF
 +AzFYZTzgc68H+s07eeTnR6WAJdgO0rNANhSIkW+4PtgT8YXD8Q0jIsXw9OZmhP8NrNbQhT+yT+
 N2pQxd0IcfSiGr/h1XVmsf7cDFy58jXvA7fG5dPYXej6wVm5TPMbj0jvuBMuW5jszmtM0AopERl
 0f7IsPVikU/qh4AMHvtJT60zZJhQsqVzI6ir1KGU0njpzZBYLI2qK5zmtEXK3Rpyr7GVkeQT7Ao
 x+Qr798yvaaQIDzmhHMtObaegtXg4VGfWyYfeUZ9eU/DzgncmwtNXjFPnPcwZEXViYp1MRsIezA
 hnv+T7LEw1kuE0VP18EYBkFxQ+qxBGaq2U2kx5Wf9Sto63gNJ9RYAxwzrvYfdsc4en4Tn0Xzbve
 I+T7qvWh2RFq33A==
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

