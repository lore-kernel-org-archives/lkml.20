Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C0511205
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468310; cv=none; b=uNqss07gBqh7NEFUlJmW6wW/GBMkBcLDiooPXVCWZVajVtdiRw3xt8hXeu5yF2d3PvXA39YBDvEsBiA8KxFHs5zBiyS7zZrpy/+5+ukRLUYleLhFYX2SQFfGeMCbpTHvftD6Xp0sSq0Oom2FJP6xYRIdgFhvv5JmXSPg4tzewvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468310; c=relaxed/simple;
	bh=+uIW161wF1MrN9KVJPQ8cjWepKKfZMVD45r+Q6sOPus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVM7ii/AWmr+zcCvrRbGl6l3sXuf3awoa2fsKgQnfDfV1Tf5CgF52pck4M8Deafx0u0OpceJAd1gIHIHq/4sdRniwbwEjUv5GPP2cHuthwh+I1my0J4JpwNMmTOMetwvCFhdoDN4OOq5Tj0VXm+U5jeoaEO40kUzw3qI8abE/zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nw3qp7EA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nw3qp7EA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843e397f74so349914f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788468300; x=1789073100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs6fzXacoZ+goKyWRAwAmBG5MIfaY+s659GryGv3AGQ=;
        b=nw3qp7EAGJG1Ubzg/Bm4XXCFe4lsYVm42mg4BQ39+kje5BM9ZuXlZqzjAfenzVJXpW
         v1LcJKLVCY0edi6xN0uWu/DOs/VJeri2olD6oDJy2FMoR86i6KoxUf0OStZEBoMjzype
         BCMb65K4eXcrol9nQfye2z7LG5vvNM1LL/6nYFv476liuS459krl/iY117/ysLFoz7Ob
         7W0E+msRtpJAGbHPoFB5MSJL4PoR4ghYeok5XnwQYi9jU/QFdrOeMzUvhKLSPN6ASYtX
         l5hER+InXZLsT5MBpNWI2xO589Y/tLhWBJnVWUeOoNjZuUmeH+orWSFseJr1wrgg/WgJ
         06ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468300; x=1789073100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zs6fzXacoZ+goKyWRAwAmBG5MIfaY+s659GryGv3AGQ=;
        b=QQUW2RBWuru8TvzbDho9KsH44ravuXxmrYs1gL+0xyW+oLxuBRyPSzaKhNsBZjK6ds
         8nMVHtrsEIRefQeLVGfnnGvFnkqDRG0iWnZD3MYeDmXzhpewFc32ReAcCTf4O9bWqsjP
         sf3f4hAVLUTWZAmaf5QnP6vD2dW3Bh4YYcucdzz2oDpN3WnftAHn3lQT8be96OHX9UuF
         E5N/q7D/0aFaRKzbQ4sAJGp+rLbFMAGbrJUbOg4fJRVu5OB64zscg/UHkMSS48OLl0ci
         43oaEnn+MI9hzd29WqIzX6WPdhStiYCu1F6j/DgooAOFP73Rtcmk8geZPvZTt1+sFuJD
         t45Q==
X-Forwarded-Encrypted: i=1; AKwUvBxB/vjkEK3HXjKKa7Rjj3VEsSq2BelJOvwIWNG51NQPi0P6Quns/2U1uVU1prBKvmaCBBvWCdaa0Imk+cU=@vger.kernel.org
X-Gm-Message-State: AFuF++khfKAzEtD4Td8iMps+KKtmvOOs1uSS6b539hi9q/k5D808Uly8
	K32nc8vObKrMwiuBopl1EZmKga3NZ33IakwwSoj8Mh61cltg8wQSz6M0+HsPr0Mjgmo=
X-Gm-Gg: AYBFou2/QK3hrRyjcp0cJGorgUx2UnOSoC+tTg+gVhY4K5OZa+I43KFNOs/PqoOFqwq
	ptjMwDWsPwZ8ZedKexZJOQtoT4x8+6VDXDCqzj3lr6OUNGBYi6YRsoMF++U3g7X33r1TQBr5jBO
	XOW0yRQg7ulmmBPPjT+CM/f3vpEuvmOugXR3prcLBYsv8XFLYx0+KzpUJI+tJc7XMtrUpc+AFHx
	ZNwGfP9iUHIlYJAri9w60gQ3WOQ8LN1OBFK6HkrYKAysOTyx64owrg8Em3MSJ3wgX+SF2YDQfEb
	G6W1Y1aHqwsfWmhocaQdcXmA6XknAA7Byw8+pzbYrLc7zJ1e77yPU2+0Kat1Blv4lzDl+fUXDVj
	WPCS3/r2sjJCfS8mthUop0qg1AEiqC/hF+WF8UMK8RJ5KHGoHyi5jvq2WMlZVHdeMq+mUt1jCMl
	3bhoJ6+49bbqjCJPXVEUHdM/F6MuY206T3amOKuQkLRVGHIIzlHT1cKQcbmNuzaRo7D7/I7gzeW
	e4YDT8=
X-Received: by 2002:a05:6000:4618:b0:484:410d:c9fe with SMTP id ffacd0b85a97d-48589216f43mr387435f8f.11.1788468300335;
        Thu, 03 Sep 2026 13:45:00 -0700 (PDT)
Received: from [192.168.0.35] ([93.107.91.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1040684f8f.8.2026.09.03.13.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:44:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 03 Sep 2026 21:44:33 +0100
Subject: [PATCH v17 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-x1e-csi2-phy-v17-1-26606fa9a039@linaro.org>
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
In-Reply-To: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7202;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+uIW161wF1MrN9KVJPQ8cjWepKKfZMVD45r+Q6sOPus=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGqZ3EjIeQIRRzrJGwPSzCXl7WO2pkw6GSdBkLzmPJj/yJQjS
 4kCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJqmdxIAAoJECJxO7Ohjcg62MsP/18E
 JQ29yvMw4pozcmBnuW8qdIPuKRsTDUdli1VlepLBZLJC9gltWaNiTQr62M4Ov8KLsQ20ATgBkDk
 Ley9TkIpf44MFSpNCnx99I3U4M5zyLaiz/838ZGcIxo6KU4SPQHEcppp4H2LRaVNmczYQM9vKKP
 bPjx6n/MF/dr23pUPRypzJb8F6pmTxXEZpPpgJ2cZ+R5T5GeA6wQdsFc3pOznY9A+7dOMedKoJt
 c7/0MCRUqKJw9TOENhDUwFii4cxlUi+zNSrdyIFRilKRZXKy+Thv6SXHY69nmv8k2ZBhR8re4zb
 Ttc1ZouHFfqDo0NT6daCqsCSWmItCvKqORKxmUdiebV3OGNS48BoLv0Tyu9AV0upe+25XvEN7Gg
 90Ww7KOcepdd3DmYp9eMPRDLywTsZzlgAWl8v9WbuMXcsztZo1s9vM8rAcxU/ddJ0eorQZDtGPQ
 eYi7t3uqg9P7GJnUV8WIoJeR2IsXf3zq7gL4Wk+hqcGJQCJhcGCeeGV7V1zOFDd2/eUxubRP36J
 gFEzWKJssmcI5/VKcmSwiZB3hJdj0KVxcva/Wugum0vsVCIUPJwkitNxGWvYSVKJe8Immz+ENiI
 K0uWqX8zynB6QJ11SXCHvyURxwkt2TRXCYfljjvOwz04kq899FzC1IdbPVyRsqejiFDszi4SLTP
 NUM5V
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The schema supports both the D-PHY and C-PHY bus types.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 221 +++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..993271c42fa06
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,221 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SoC CSI2 PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with the D-PHY clock lane at position 0 and one to
+          four data lanes.
+
+          DPHY split mode, where two independent sensors share the same PHY,
+          is described by two endpoints, each with its own clock lane position;
+          endpoint@0 with clock-lanes = <0> and one or two data-lanes and
+          endpoint@1 with clock-lanes = <3> and one data lane.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[01])?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    clock-lanes:
+                      const: 0
+                    data-lanes:
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    clock-lanes:
+                      const: 3
+                    data-lanes:
+                      items:
+                        - const: 4
+              required:
+                - endpoint@0
+            else:
+              patternProperties:
+                "^endpoint(@0)?$":
+                  properties:
+                    clock-lanes:
+                      const: 0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-0p9-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "ahb";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "top",
+                             "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p9>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+        };
+    };

-- 
2.55.0

