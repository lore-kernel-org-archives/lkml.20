Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E434B3C9C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194915; cv=none; b=OHUsoLnqqDw82eBKx2cRM7a/RTY2P9XayNj9mFssaDXNefakK0UzSce8zakC93mfIqEXrnDKrYDZ217khbZym1JlYEJuoBbPbYCT7YdSfI9KWmFuP55Z1LJ1RxJO3L6GHb58pzj6q/c023yBA4wSlZ+459c346fg8CR20Nr+/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194915; c=relaxed/simple;
	bh=w5+HhoOHpY2OlQdb0VeMExTUge62X+hZEo4LSfzDSws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXD3dD+bt6nCZa3fAucDofd9xDWfy52WTskgYyntTLeiXG90LDHznXwE8ZcR85Gz5BfVe3Hr9sz7c4BXStnWsEknQUMbmu2QXidr7GSWIl/iGG1Schox55jtwJtJiZKKhs9YsGzOGLEQjzO3/VbnMNHzI9pvjfeS2dzdvUTC+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvkmGbso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjFGtAqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvkmGbso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjFGtAqP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFFRi3083021
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=; b=mvkmGbsoeosE9NPQ
	xPZW8/Uknl5HJf8svzfdAEY7TLnOJbVaWGxHm3qlnUJpiHIpoeNO/DslfyVr51I8
	CLo8TRoBKpMvx1abEkm1CYCt/0e+4GjXpXLHxXhmrjI+WK/d/I71LnAKlD1oK6ph
	5xpzQbh0r5m3DzUdodKbNmkFl1xQ0fkbwxcCdQs7+niWdOtyknneXWz0MMcDpzkA
	GG4g8ouYV8+MOAw4CjPfwhCFlSDLV5PQDVhsjdCEIeBI+kmBHpyc9qexh0fylsSr
	+2yYXq5L7ClYgnebcxf7gu9ZYjuvaLAnzr0cC6Ft2/GOGWOdsuA5YRQq1QlKkHYC
	iabuvg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmfamyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:55:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1333387c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194913; x=1792799713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=;
        b=BjFGtAqPcwIx+i/OVBOzHUfRVWl6z0Gl0iaSN9G2k6qanrrgoldDaTjqDX1T1Di6nL
         cJzoduio9og2kc5ntSUpjslkoWGuy6Rm6u4G13wID+leiWD2ipVAYEKLm4ZcZfunpqhv
         8iAEVlNhVgWZN2IIdE5PMWWDUiIx3f7QSfS/mTFnoYwev6pJtk+Nre+sJGFoTZw79dx/
         d7FMnC+BSKUkUj782F0bAaiLinsGeAAtousC8uXpn9VMPPXk0t6rLLvQUMi2CIu1di7j
         z6vZ/FTc4pENAUeLDbdzho23astVXQxc2t3vNIXvhFaB/fI1JDyiJ/Nn4xCrtZ+FIPij
         2ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194913; x=1792799713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=;
        b=Q6XrFCBZ/c17+9p9C7p0liPsREBHVh+QRsLJq7a5WY4cBo35g1E8HsYa2pNz638P5R
         WBxs7SNz/40xdAe+0G0Ekvde4Y5kCibZEoNwiI8XHwTz6Wmb5FP9PbpW2oxNVCFJZm4I
         QKtFQP5tCOgMCMGnm7VNrjJTfEl9wvb9v7UR9dqn3pcs+XQSBeTrdNG0Sa85a4SU1EAf
         41lZwpEWrS9LwI/n3kG1okciscdvmGkhWMTqcNm4AcgBj99CbK3agr2oeDHe1r+Wcxkx
         AmLgmnKLQkQU08itQkz/yx5WjF5Qm9OXQbteGozvhDKkKuilWjK/Id04O0gnnr5R88ty
         IQDA==
X-Forwarded-Encrypted: i=1; AKwUvByqJSuru1sGOzPd1LxngnPHMSZVieelmo3jzRJmvjeqI0TkjVUwa10MoqvptFKN4CjkfAMBwJYkgJoRfOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJauFcDknZbZwOYT0lWEGd7U2O2UG/eMI3D1JwUO4cQ6HSihVLJ
	XTvXvoMXFT5YINqqo8ZpOVMqEBKGCzuqJOcQurbM/3gjJHW9z90b6copdlY1LUfq7TCkLAqvJzY
	cqut1Wa9JVmZLtMhGLiOQgb0cydSELsaCBMFtFvW/zrs+xkxlT6toM3E2gSv2M6W6sz8=
X-Gm-Gg: AYBFou0XUQTGGFXA263PwCAagoNDSLXRrBn57Op+1mNVXOu23uwcxlq/5eUTUet+83n
	oJilFYA8Wpcj10O/JT+ZR4AFkFawDAtqAuiTZ+MF+8iV+tw6/pqPowBZL2/JKITdNEG4ozboNGe
	bq8MFj5sgapJk+V066HjfQ9nJQ1E6rR3HH8Juxa85DdHO3413cWO3eCgTOAsOI3WXci/DTKtxGL
	A9X3hhheti4ZiOfmHWkZjhm5WjGa3/oCU7vFVV14Iy4cYpOEcqMkN52YAmAzHUu5Vdu0zlLpL3A
	yodIydgJSXeW/4IAQVt+AOG/mgaoAVnR5ivzIteIWB1YzEoWKwQr4aQlSThbHUSMV/A9aYXoaJp
	+GFhmk+KlDXuMgoiXZWrHnOD5HESNr+dKeA/P4rUTETDVD+W1166Ggg==
X-Received: by 2002:a05:7022:b88b:b0:144:fd7c:84f4 with SMTP id a92af1059eb24-1850ce9b563mr1810852c88.5.1792194912644;
        Fri, 16 Oct 2026 16:55:12 -0700 (PDT)
X-Received: by 2002:a05:7022:b88b:b0:144:fd7c:84f4 with SMTP id a92af1059eb24-1850ce9b563mr1810803c88.5.1792194911763;
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
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
Subject: [PATCH 6/7] dt-bindings: phy: qcom: Add qcom,sc7280-csi2-phy schema
Date: Fri, 16 Oct 2026 16:55:01 -0700
Message-Id: <20261016235502.2274268-7-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ppgXqZLYucHB4oc0KFTv6QZ0dhLv_LXp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX8Gj7/iS3QrJF
 FnfjWKgs4RwkoNRgLI4iRxRwmSiOtTETHYo/y4P+nL2oclmyIOZJz0ZD2Yk7tVvN+j0WspeDOyx
 zOJcT2RdN1/4o3ZMrlgt0J0CXXHjY+E=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad2b961 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dfoMB3O58h9xp8Lkk0AA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ppgXqZLYucHB4oc0KFTv6QZ0dhLv_LXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfXwTeOYcS/7giC
 JGDku/VaywzILxyKvKxNUrfUKIb+lFcIz1GF+FAhKuC18v0LP/HlPCBTjP4ILSUy7RY5u0VyDRV
 slQ1JaQF8kp5e4Kqbq7lcTOIrfCn8kf4J5U7uq9/WGUatKtohjE8AlFYYLti+SREeNgzAbP1BD5
 fe4HvMGqs/vUWxRXwN3gBWJTHj5wYQxkuQQd8bIG7kYufutLUJrvfju1DvtfykzW670F4fTOdll
 bygCj0D2G2FZmVl9vasdEVDeMnjsbkbzXTqf1D5SknISR9akN4zwWnTq5r+OdYWTJuGc7kOxe/Q
 sUT1jwEXlG93ZkYhXeichbiKoVqobo+hKWm6BpRbGgFqegjTJyTwdeEffEUBXKRRVclr3E+hdPi
 IXy1oBb5D3gM+0EnabXfnDIEB7O+mloaiWBE0xPdQJ3UeP6mRdh1F64LIDAVLmIwENIXbneKaNa
 p+ajQG3GgXsIEqNRY+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160095

Add a device-tree binding for the Qualcomm SC7280 
MIPI CSI2 D-PHY, modelled as a standalone generic-PHY
provider like the existing qcom,x1e80100-csi2-phy and
qcom,sa8775p-csi2-phy schemas.

Follows the same ports/port@0 data-lanes shape and mandatory
operating-points-v2/power-domains as qcom,sa8775p-csi2-phy. SC7280's
CSIPHY has a single power-domain, the Titan Top GDSC, matching
camss.c's sc7280_resources.pd_name = "top" and kodiak.dtsi's existing
camss node. Two clocks only (core, timer) -- SC7280 has no shared
CSID-RX clock in the legacy driver's clock table. The core/timer
naming matches x1e80100's and sa8775p's clock-names convention for
this pair of clocks.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc7280-csi2-phy.yaml    | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml
new file mode 100644
index 000000000000..3b73a9933f03
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sc7280-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7280 CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder on the SC7280.
+
+properties:
+  compatible:
+    const: qcom,sc7280-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
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
+    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    csiphy0: csiphy@ac9c000 {
+        compatible = "qcom,sc7280-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
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

