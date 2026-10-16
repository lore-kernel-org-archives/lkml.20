Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BED487CD9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194910; cv=none; b=fISdl27cpXCt/kXcDhA3wxpekXsAw6zrZ7823HW81I2z9o9M+r/K3nDf/5JMapLEKOZt0Hzf0Or1wD+DUgIBQ0J/B80viSc8MIOjZNiNCI7HEWgZYOwL3pj2U018J1bugZCryn6f8MEOqpZZiX9zkUJs56FagNARGTplimv6FMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194910; c=relaxed/simple;
	bh=6atMquPRfhkv0ylXEOERmlkDRIo57I38PHGnGHtHQ3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cx5VZmbuQNQqreza1BhDnZMDofemNgZA+SXCBg2hPPi6X7+PpSf/t+SqXI+nR4V8NGrzuQijmImGcgPGmguIZ2459RTD1lcjOkMZeH7ni5VKO15AvEEnaauQmeni1kr7/EahCrADwb+oppjVEiRNZDBF1/xHVkVGeV+k5BeWax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz5hpCGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3xl6etZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz5hpCGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3xl6etZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFBQ72783922
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=feRtm2SE11o
	kGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=; b=Kz5hpCGqyDAn4zoZIuvHi+4TzQN
	b29fxRR77vs611i/QWzcJ+cYG+zA2DWmZWeJBXbvd/lu+5M3yfVQzveTL62lzRbd
	Qwy5r2Nnvq8oDXFfFGUfbaBLviM9lIp4yWeXtFbUZa0MiRqtajn4adQ1Xv0kw30x
	maqvOej8WidxnyZvEHRvjjIAGnk55UZdgT7iyCpAb95mQAdbXqvJyKggszbwfZZY
	KB8nyUP+5Kio9vEEbhMAgrFxupt/Guyc2qNu+UlKz1WKMahOlibOjlKIzWnKKRbz
	VSBDWl0feiGeciL13yVHIU05RdS1WpLUjK/Z55VCbtGdQ8UXJ7/CmPtdjtQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v2j3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-17dc865c94cso138922c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194907; x=1792799707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feRtm2SE11okGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=;
        b=Z3xl6etZKz2wMOSGAi0XSPWA/il0tqOyGEKyxjODG7Nz/DCxbu5QdOZlHOCPL3xKLb
         EggtHQsSYLPvi6LyoAjGH/C8icZIiM6cLWkcpdqDmyeeeVO9p5EK/XMZlrHpzCyHQ2ut
         m1cIGzK2+QtZFPEmeScElhiNnWVpCBXpI2F7/SKNJzH8cQS7bkt7UkJAndFMzbAh9Rkm
         PjlrjpRmQfJuQ0onJCYsoqouUy5LOpX8saBen4q0wlMPzXqmajWYqfmdNgdyEznsN0OQ
         xSkp+U775HCHbMdHBQBKjkwOU9XOx0ILIzme/Q2stzWaytseBstXDyNEqIc51+9HqS6w
         wCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194907; x=1792799707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feRtm2SE11okGy5uEhKVGhOratl/Q0XPxlXRlVQG4OE=;
        b=I1xGyxReEbjt4uSQ+THc80NkYtP2Q79gHM0X9dEq1Qx5Xe2CKB8OeyH26h50VeTIaQ
         hodac3P4YgMKONxJf7rDyz3297MvzZUuNGdeqP7Mw4UhJ+eI1kZdVM/5y/jDc+lxHKYv
         fODNK5CbF2eu8Ok2HheZJXalqGVXiFSXLBWjkIA/tWczYb5yjhyfCVmfLEjnR5FBshN0
         rFftjsdkiltmaU9EqOkbzFnbqXwNkLH4pmPVtSk2u+EYg4SujsSBcBWEemiwI4cx8CpA
         Di4C7lDO+1gsmL2i803DPFiFoDPWEm1qgCEtHN8+L6b26JCVnsiGsTqoTF81RALyaFMQ
         fClg==
X-Forwarded-Encrypted: i=1; AKwUvBx8dezOsqWoC1nEXaUZpPtOwx3B0wcR0aGbiWL+xgZ+o+yMvlZp1g4BWtVrXRdhYEidSiteJuSjN9LtB5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlHijzpyNLUmSEcA/mpBmH8lTDZ8bsj8nmJlyFrjrdyEOKO9bL
	cMEKj8cKeYNwZKHAz8iIjskdAJlCLr5hPxZJw4VYPrI/0hai2aP7vJ83/grHB9Cq4B1SmZtUo4F
	5k6vaOiU1XfsL0ZGZqxZ1afHTabtwujWGa5ghBCQXUaPS/6Nf5Zjxh/KJsHMztQjAGWE=
X-Gm-Gg: AYBFou1WY+LxTUlANh+NF2L+3r6EgvoZnDQg8t9ecHY4K8eyXDvStd2gjgVs4CPBpX3
	R+QbLRE8vlwuwepWAk7x7bsTyrvGl7BfUNhrR9jqk+sRE3EdGixDpf8dXVj7+546d5Tc3qnZE7y
	ZlYXkEkPMkSEF6L8YvAm8K2FP32F/vInRe3402UAIYWZ6QUe6BgGbjrQ0umzzk9GQ9zdpSj3vp9
	2XydXsqDbFY2Th8fxQd0OUEKqTCtBPWrXyw6LjBtbBjGK5S7vmgpEj2dNblmT8R3JRF5oZxoYEL
	IpocBbXzUcBwiWVzWxCPJkgSvrpCDcC2jXZNuS01aXWzCnz3YDnysJmBEj6oa5+2iLtSS3Ymjb2
	e0VJvE711JdbMySE3DffBHbgef15XUOQQKF2MkmbRZu6MHVupLmV5qg==
X-Received: by 2002:a05:701b:2807:b0:14d:baf5:c411 with SMTP id a92af1059eb24-185118edb00mr1677832c88.14.1792194906904;
        Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14d:baf5:c411 with SMTP id a92af1059eb24-185118edb00mr1677786c88.14.1792194906193;
        Fri, 16 Oct 2026 16:55:06 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:05 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy schema
Date: Fri, 16 Oct 2026 16:54:57 -0700
Message-Id: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uMTagdZzCDvdoTctGMiortReyyq0tpDZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfXzk3nz2Pejme/
 eNFX8dY2mB2qyK4u1pNM/X3Qc8kryZQQ18uAjArbn+v5uvkCLWbzWiFKrS3jfbE6yj2F+qyt75H
 aoOFuK3zM8FyjJOHM3Q5y4xawvAcLhM=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2b95b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=o-k08rXiG_sRaRb_8WoA:9 a=vr4QvYf-bLy2KjpDp97w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX9tyztWS7BHeS
 HG9+Z/wdt4Sqwul4917UHKfBSRY0m4gdNnblkjjpJKMLKpIiJh8OgSqgEtHWUZRkY9QnG9Fu99W
 +exGE6jNv0Fa7l1rEqaSFkkCaLLmcNlucw2jgbt8eC7M8ReH+z75F9XkYajvotJYFzJ/4GDxwKE
 G/cjneR5qbFRxA91x35KsMyRa29Sd14cP7N+xKPfFJW4I0GXNZ+OBZyBeE4RPTaniQpOFNAY3Eu
 S6C7JTW6ptEvradhu5m6WnCNg6zXxlG6MtUZdoZSm4YPgRDeDe3KyBZk6w64BkHa09B3vPpPRCI
 n5zGTHZbY4/0US6XeFZaTD8G7GjR5EsKOwqbVyfl5pI/+RNX6mbL/BW7ForMm2NBWkgkh+HKlKO
 gRhsAMa7tK/agw5yDMsb7rVpPBRvaBKS+jNY8myg9UjPs9WdvlEk3njelk2Wu6LuePnXSAhagtc
 5OU+wpcKO0x/lsJDonA==
X-Proofpoint-ORIG-GUID: uMTagdZzCDvdoTctGMiortReyyq0tpDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
PHY, modelled as a standalone generic-PHY provider like the existing
qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
common PHY framework instead of driving it in-line.

Follows the qcom,x1e80100-csi2-phy schema's shape: a ports/port@0
sensor-input endpoint carrying data-lanes/bus-type (D-PHY only for
now, C-PHY bus-type value is accepted by the schema but wired up by a
companion series), a port@1 CSID output, and a mandatory
operating-points-v2 table plus power-domains/power-domain-names.

Unlike x1e80100, SA8775P's CSIPHY has a single power-domain: the
Titan Top GDSC, matching the legacy in-tree CAMSS driver's
sa8775p_resources.pd_name = "top" (drivers/media/platform/qcom/camss/
camss.c) and the existing lemans.dtsi camss node's power-domains =
<&camcc CAM_CC_TITAN_TOP_GDSC>. It is not OPP-scaled, only kept
enabled, the same way x1e80100's own "top" domain is.

The PHY takes three clocks (core, timer and the shared CSID CSIPHY RX
clock) and the vdda-phy/vdda-pll supplies. The core/timer naming
matches x1e80100's clock-names convention for the same pair of
clocks.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
new file mode 100644
index 000000000000..b66ec2f14189
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8775P CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder on the SA8775P SoC.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-csi2-phy
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
+      - const: csiphy_rx
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
+
+  power-domain-names:
+    items:
+      - const: top
+
+  vdda-phy-supply:
+    description: Phandle to PHY supply.
+
+  vdda-pll-supply:
+    description: Phandle to PLL supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. A single sensor is described by a single endpoint
+          with one to four data lanes, numbered 1-4. The clock lane is
+          position 0.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@0)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
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
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    csiphy0: csiphy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "csiphy_rx";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy0_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "top";
+
+        vdda-phy-supply = <&vreg_l4a>;
+        vdda-pll-supply = <&vreg_l1c>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
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
+        csiphy0_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

