Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791091;
	b=rh8+SB0D4pmLPuaiNLUwGiE7TDalTHtKGea7kzXuzjoJJ72XXOf8ptumzthAIEM1Nrth
	 H1r7Ju2TvpY7fBNxSZqe85atjuSaWoYu/EVA9LAWuONlMJHrWbpSw54rycmY5L4nPljAq
	 GTByThZTVQVpYIuXLwepN1Bluxxm1rg27nXzrH6p5PNlOW2Fnisc1yC45CgbI04MlBwyj
	 kBNKQjj9Lb0mvifi55ULwgpSbKECdzt3jfiWlxmU/RE1LCEeh4YMdHW+S+44n5KJt4FeW
	 N9oNn1bBP/GgOc+qPj6Xh7taF9ETC43AEUWECJEObgxmzZu5KleGntL3Xwbsas1U1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791091;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4RJ6M+JjySay4WKw8KPrIRm4D2pO/biJ5kqHdcznYKs=;
	b=pLPuewQh8lZafaZSYKCk48a43DHXgkZf3UqMJDfRpM+Pu5E5JCPJaJIOGkFpDaTfm4Y1
	 u8KZdgoLg+Ypu3Q7d6DVfIN9JnReAyAt4a74Oe91H2SWZPDvZreNFFXNuHy0peZfDEG5r
	 46gOxlR3hxwQeR/NODN5bSdYsbjZnpU5CJ6cUnN55KEG+Q1YQnZxzbwelSE+6zXTP1MNU
	 rt4SGvUjLW6F077Th7+g37l+nCB7Jt9Sf4AktitMHJgBKH9+U3Zf4Z020xWBQ/kqzVu80
	 DA7HrtxAyutBoBogVYaEN9SrzRspuvTO1g8IqpHlj6THrPg66lFY5Zd3kY66j4N51fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8QE9k5W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61769606A332;
	Wed,  4 Nov 2026 11:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61769606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j8QE9k5W
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B5G3P2599691;
	Wed, 4 Nov 2026 11:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4RJ6M+JjySay4WKw8KPrIRm4D2pO/biJ5kq
	HdcznYKs=; b=j8QE9k5Wt0v6erqo4TztWoLdfNaKyNPJ4fDEvDehb1GGOzWrET+
	swxSUMynF+C7neo6EMSs5nH2nyictmEjDGEt540M+BwX4OhgxTa1vwK16OTQSfXX
	sr2/6PU+ZVTOnja5E4kJRhvZ2d7PPLrff81IuYEeWBU6bwdsF59QDVO9hSCPtHrb
	pQejdEzxorad4ziEZA5Rn/ldkcsJOjio9BD1rdQ2c29OzKW3Ozia4bWWnZhK+9CL
	EiqN2g50DLCeGRTyj2Fah+tqP7tOxX9HUwtFzOx3zNvH1YZnbYoFofVvuwuh5Hhq
	LGKjkRZFzKlo2zJaRXlpNWYtxShtR6d3MIw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkt9n-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:17:55 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BGGWf2675525;
	Wed, 4 Nov 2026 11:16:16 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4BGFd92675519
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 11:16:16 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id BAE0A21442; Wed,  4 Nov 2026 16:46:14 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Wed,  4 Nov 2026 16:46:08 +0530
Message-ID: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX2p0U8BCkRYnl
 3kGCPqV4FlUTr186LmTpRbKUGRWtme32paDuP/v2zq9WeSEUKGajdajuMj769wkLAjkFZawcQ2e
 8d8uAGN6fKW4z3V3QZ3e/ou+FCs80/k3vGWm1mxiXGxpS/9TFN9rbWarvPfQ+1prscVWDtxs1Nu
 qfDUEMg/pWkonvLV8FIpSHEGPXIiQ0u6VA6FJ/iBT7qC9dSSZZow0eU9f2XqweXI3UltBMM2Vq7
 5xgjmuoFlgUz53+RQ594bgpo6zWbCDgGEH6OrYYsJLpx7U5FT/bbWC6qG6v4/142kmY4rSdZY/q
 mqGu4DQ3awZxvh3ICZ9K3aF/2LLUlffCpJrX2KSPKytC2uhnV5ESYsOzpIUICApSXeqSOjabU6+
 CTDxGXAqAvuBdVZ+kZWYcwc8/xWEtCGZsc8BOJuzppZDXRusW29TbBixKl10sy2s2/cEyoF8/8A
 4PVVgrR7VkGr5sseBuA==
X-Proofpoint-GUID: xFu2Ebln7wVPe8h_7vtNauucD1dZfn5w
X-Proofpoint-ORIG-GUID: xFu2Ebln7wVPe8h_7vtNauucD1dZfn5w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXyFBBaOt4a6y6
 akuqsxzujPEqMH46Xw5hYSvj+JamAWLOpHFxm7rhd+gqyCVnH3pgfhu0SIwfRktRYqUTep28Q8X
 SfqIkfnQlPK9zGemgBas1B1Wuggm64M=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeb1463 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=m-1na6zgiUrtrnXSVq4A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040044

Add device tree bindings for the Qualcomm GENI-based I3C controller.

The controller supports I3C SDR transfers in mixed-bus mode with both I2C
and I3C target devices present on the same bus. The binding describes the
I3C controller instance along with its associated In-Band Interrupt (IBI)
controller used for handling I3C target IBI events.

Document the required resources, interrupts, clocks, and dependencies
needed to represent the hardware in device tree.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
new file mode 100644
index 000000000000..bab89aeee23f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Geni based QUP I3C Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+
+description:
+  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
+  The controller supports SDR transfers in mixed bus mode with both I2C and
+  I3C target devices present on the same bus.
+
+  The controller consists of a GENI Serial Engine (SE) responsible for I3C
+  bus transactions and an associated dedicated IBI controller(IBI_C) block
+  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
+  resources associated with the I3C controller.
+
+  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
+  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
+  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
+
+allOf:
+  - $ref: i3c.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
+
+properties:
+  compatible:
+    const: qcom,geni-i3c
+
+  reg:
+    items:
+      - description: SE (Serial Engine) register address space
+      - description: IBI controller (IBI_C) register address space
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: se
+
+  interrupts:
+    items:
+      - description: Core Serial Engine (SE) IRQ
+      - description: IBI controller (IBI_C) manager IRQ
+      - description: IBI controller (IBI_C) GPII IRQ
+
+  interconnects:
+    minItems: 2
+    maxItems: 3
+
+  interconnect-names:
+    minItems: 2
+    items:
+      - const: qup-core
+      - const: qup-config
+      - const: qup-memory
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - pinctrl-0
+  - pinctrl-1
+  - pinctrl-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+
+    i3c@884000 {
+        compatible = "qcom,geni-i3c";
+        reg = <0x00884000 0x4000>,
+              <0x008c0000 0x10000>;
+        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+        clock-names = "se";
+        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
+                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
+                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
+        interconnect-names = "qup-core", "qup-config", "qup-memory";
+        pinctrl-0 = <&qup_i3c1_data_clk>;
+        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
+        pinctrl-names = "default", "sleep";
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.43.0

