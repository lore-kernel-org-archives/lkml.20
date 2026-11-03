Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742071;
	b=BQnul4ruqHBBUP2Y0LX5+C+brhrxEC/P9ifC1j8GzUBCp/5ARakigaVyQDBNJXbBJANu
	 W3vTv2bktumpsynGDWCss0nAOn761euvhzIDcDevO8jDnVoGKFAACTGsOyGGpz6xjUI6H
	 F3ZXtUntBx/MAI/axrbrD4HIBaVVR2DJ+q6eE5dLOS6P6Nz7r3fbql35sfFf6ETXg3mAA
	 7Txn+4fZhbkYMIucC5vBo845oB16sRGkvCGbVKwhMxJx6pmooK9ve+OnTEmiWolJI3qY2
	 u5n61NUiOept5sNPMxTesw/Tsicomk5FZIdwxBUV36beY1aVJqJ12aTzfPhuVhApYMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
	b=JDt/8q7iRLYj1BG26q4DT5pzbF9KIjTVzSQ45f2lKJRGtJl9OOdEbuN4WHFF1HYLvccS
	 qfYfyMIDmS9OHWkza/hpjXP0U45LdhQUDcMnRedpE/0cKoSQ5Jc7JSdz540hRiMj1tA4V
	 ygtwm5xU7Sm4dU1H/X8m/4wWjTwz6153OYpwNk5CrfdTM4GlWfCLNi62BAN2WEaHCrM4M
	 uFdxjwFM0UYFaeyorRzNFVjM7kKMchZDs377b02Ph+Xe6x2JDSxX2mFmkgHIPcLnFl/8h
	 yc6MmCOAaLkB/cmoQMDOllA7yUaSjQroiuXJFwhwBVJoipGKATlZKMTXRgqNogTSq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkZxWV+D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF9606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3EF9606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkZxWV+D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKoFn415156
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 21:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoM/IqC1v4f
	yVgp5mXaugArWmtVnYBKnG59oPWEYQmY=; b=pWToFaIZmO5UuI5rcMdpvaSHr/o
	yBq0Ro0VLdHT5bY+juXr0VJOskZbCxorucOQE9JQv4XiUwV/cKnACEXzWD4GAtjI
	pr8eYaK3bHbpXY56qVRSYgghB1Kb9RMoOBw7OB6u5T3FeMl8qlJ9GK+JNDqt3gU5
	0vQqXFh+fEzKy5fZmZkXX2Jy5ApiioUl8nw549FLKeqvZ68oKHnBO4o0Wu60zON1
	Cy+e4otAst0oBBACkNbQpu3mXvvRW3V6dwHk2ygrFX8FjqFLgoq72t+Dzhqc89qy
	SPgshErcZri3tjVKO0FJM2kIiS8SMtkvmfPBHlDtM5K9tRotyomnUuRbfKA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp96tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so223278eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742069; x=1794346869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=RkZxWV+DxzCK56Ia+iDLkRQdmmzITr6dZ4l41OtnlRBEIQ6Fi1W2uF8HCPVEwGXfkx
         gupnjBwo5+Lr3/YcVSEutf7TfPip+x3G9Y7kpupali/NnnAc6ExagVitOIrl/VmJAJ/+
         y+dKga3FegqR6T/rWVspGb3Gg+VXi8ro40P5MdWkMiYZQ5J/oZg5ZQSa1ZPSQH3KqUKV
         /GHT71i9LM67fyDrowsl+j973NJ4Li0cTYsaLq4m2fnbmBVAuKKG+SmYJQZfo6pARJkZ
         p8V+B6CG596y85BHyUa6m7bTCY16lShlau6hsRErv6W0AwUnHAY2kTADUqMVruqbgU8W
         6MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742069; x=1794346869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=NPuhM+zZvKS2cTaxRjZdn9ekKMZCOKPZVzTWv/TZUaKuU591ibN24bhdI+cmz1mkTs
         Owcw8a90eVNtl/CxST8aozH0sDh4vpqqDo06hRVojSSWgVmOBuXVHmOSdlA8g6ClnUST
         wo9OZ3hMExC3K5Vokeo/UEMrPDNM6FpHZjEzkHtZy4vGTse/JdmYFVZNl0wM1WtDFJeF
         ejAaHemaJtHQ7VSMx+gnnUfZbW5dSpoKcgFULDgII/zTJ/pzuTax0xF76JlnR24TE3RY
         lEGcl20MklGOklhQDDuBk784D6WzfzMBCDrUADmYVse21xWUQ1yWoIIp7Ohf8ur+h6m+
         S84w==
X-Forwarded-Encrypted: i=1; AKwUvBwgJkQ+LAwja1DXAwc4p9qd6AkKvc5M5aov5KyJ/GF17zB/rfx7pCzARJVNc0HM1acv/u/RwPsZKxB8oFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z5zMyabdY2y3HFnGUhsvazJBhuzkbwDIIQulYztsp8zvug6Ns
	wMZ+M2MvsEFYyi2O13nRUeC3+VQZR4Ys6vPSEUj1l/XdMSFqqFy8l2PgzE9PuLwLgtCjNxUbide
	RzmzUIRY+Wi+GGWv0L754bMiGe1xZFEkCxu4wg8HAeLUU1vO09JRW9kIXnKxAltepD0c=
X-Gm-Gg: AYBFou2jg0IMMiLY9t6XZHnBXK8GUqzcLt0/rByB3sDmNVLKKZxNwaR2T/Wbzvuqq9S
	e6b/BYMddjmtOuB6hpnVbs6/KrMfliyuuLF/Gr8HhXSSNsNp9whRD+tuvpXJuP0ewMXPRrV+iEl
	yB23yqbpjD+hDaUBvLvIUEMLzCKEAvlE75jZYTR1lhvD5CdcdoCruxE9OcMvv8JG854PYF8yomI
	dquvegXPPkGDGqfqMjY0Ixvbc5oeSM+NXg9hGheReCZX/tLBnZG33Tzl4GEe0y5DuFNd8RmymRi
	5LLal0MsA2musxW66LqooDNJCCgwwqdwuzyPxJoDBkVyTsfQ2feEIx06mTHkKuOdjv+gNm44+H9
	QSQRsbII6kCrOkXmtfvwIGV9YD6+zzvJuYK9UwJzHIB+lp79FKYhh+jMgHB4aJE7F1UlT8kqeDC
	OQb7AbSfW/IYxAJvmV7dqK7lLuYKU=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23891001c88.3.1793742068339;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23890961c88.3.1793742067759;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
Date: Tue,  3 Nov 2026 13:41:01 -0800
Message-Id: <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXyTrNy8o0px74
 gZHNAnd2zc9CHKGs8CsJ65HbpSCshjui6jkZbDY0qjPXgfpYk1LBDtDxszl3uP50QfpanIVMIe/
 rIWcXdvZECl1XXxeI7QFYj1uF3pHegWbB1R/eijFtEp40a/5SJf6UKRLwRbIeLOmNycGG0YlQz4
 dYXn8LHuHjQz8O9SJS9HoccgfSe52a42Xndu64VyQRhKo6CW7/6O52JnISrA0Mx7GsTXoBBnV/b
 tZ1pp9Aa07gHV6rzznXACGn2/pIMsnx2o6K2MFXsNP0mnvXTNBb6iYigD2hfoUzZFSYVEN1D5yr
 RlUa21Vltxffv8fQqJKUxGK/yKWP/VP9cfmGc+26QrSz2dTYscdhBNrhyEVJ6Zf9irhCXD4IIeL
 ut3r82ZWmSZjjPmn1lhjvLkR5C/DCEpFIztyx5gK+1pK3hrrhvi8BEB1dOL968DKy1WIa9Fytfj
 do2keeeVv2OfnN/OgEw==
X-Proofpoint-GUID: 4rX5YGexk-q3w9QsMwtFzLWVJNtRVaJH
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea54f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sx4psc2xio7dPLQVwlEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX6pDP18N2KryZ
 UnDXB1xCkCRmiInKCUSq19kmvFtnDNzuq3SWfTvnWPxLPqGckGkS5/G95EK1oySqgyJTXPwStD5
 eKNprrFsP0ai+rOe26PJHs8ZgEpQjjQ=
X-Proofpoint-ORIG-GUID: 4rX5YGexk-q3w9QsMwtFzLWVJNtRVaJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).

Describe all three with a single qcom,csi2-phy.yaml and a compatible
oneOf, rather than one standalone schema per SoC. QCS8300 is further
required to be paired with a qcom,sa8775p-csi2-phy fallback
compatible, the same way other Qualcomm bindings express full
hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
match entry rather than carrying a duplicate one.

qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
(3 clocks, 3 power-domains, different supply names, DPHY split-mode
support) and is left untouched.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,csi2-phy.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
new file mode 100644
index 000000000000..5d25547528bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sa8775p-csi2-phy
+          - qcom,sc7280-csi2-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-csi2-phy
+          - const: qcom,sa8775p-csi2-phy
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
+        properties:
+          endpoint:
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
+    phy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
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
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

