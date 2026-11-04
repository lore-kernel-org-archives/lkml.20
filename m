Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794948;
	b=ioNK5/ALgm9kY5qeDj9gQCF56GJ5eCvcZIYOEHhCjG+Hit2Ug+/4EKDYR22CcYtkJyJ1
	 K+2jl7SnJwgqNiD6mJ6E9/BCp0um8ys0Jzv9qQwTelctDD4wVC/V13e0keRNPQDTRAGg8
	 5+rqR44PNPThXbrmy4hMHSsHuirDv58wCr5bU8cK1fef4BErE/m20AcmNCJ0zUlejCjX2
	 O+2Z5vj7XpCm5NStPzVKpJ2fqk1gcom8a26n3pp6hF0HxtylCixT6/bG0FGvnkfzD4/is
	 8nw/UrJ8IP6DR3P5lPs7+Yy5daMIcSWlOoKXsLrnV5lWF/CQLxc8vn6gLutTcWp5/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4RJ6M+JjySay4WKw8KPrIRm4D2pO/biJ5kqHdcznYKs=;
	b=vMi3VgtamPSJwvUUgqO4Ts5YAJkn3HGHIjTo2p3bQyniuw0cs4zrfe7L13KnkA9/bHWc
	 6FFbz4vdhExpElAiBdMM4kBDUKc/hYTpIpQsmBrTS2bdmnuAgOq1+e3D7zLlRRm8f2bnx
	 W8kQVVPB8Sl3fRv9lxwQEYol/1P0HrqAknqgTYZb3Gt8IcJEHWN9eU8cNWj66leRKXX0H
	 X4wo40P6cZMm6pM7vdVsj78V9FR2SgjIjnMWZ80TCvTeJinT+r/0cYcG6ZpABaBwFf9mU
	 yK+5PnTWFFWy0SLxQSvLiSFJP0puN+7gmZvN40VhsdIL43gAlo/imxUwpxREl/MBCRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE6bZeWt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C447C606A31B;
	Wed,  4 Nov 2026 12:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C447C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE6bZeWt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZuhC739250;
	Wed, 4 Nov 2026 12:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4RJ6M+JjySa
	y4WKw8KPrIRm4D2pO/biJ5kqHdcznYKs=; b=JE6bZeWt5bssPi8MBM/xGRSO2qy
	gb+wZH28kPzdpFvwe3EBi+GxCqfIxpYiYDkXdErM12Rmpo0TMzTraFzgzdL2EXGA
	TpTpddxbmtYW2uvmG5dod1kV9l2u3YBWc3fDOIi00OpPfiM57yRTagElig5PZ0Wf
	M6uTrgP3awfMOMxNbdRya2WpxMyLvabWP/z1jMwqEB52xGCuz6HziybhQnKrtyxU
	s54H0iZIzk85eGGDMNMvE8soYayIMsiEGWywqmh5QYtz891DSLQOT4mJ0cqIEDiD
	sCbbPG3Y1MLrhytDidecTqvzxVynmYugXmyzjai74KvQoshLYeFeBMIv0Pg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163gxqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4CM4hv2768554;
	Wed, 4 Nov 2026 12:22:04 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.147.246.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4CM46l2768540
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 12:22:04 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 429934)
	id 3EBBC21577; Wed,  4 Nov 2026 17:52:03 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, alexandre.belloni@bootlin.com,
        Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Wed,  4 Nov 2026 17:51:53 +0530
Message-ID: <20261104122155.3789346-2-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
References: <20261104122155.3789346-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: o6q6M_eV9LymZ9g3zrq6R8d9GbELgoYy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX48NtdwRSk3TL
 mDUI8C44zrEzlB/tn61x8cB1x2cJpqCuP69rmR/SpkexyPbqVtjrUizSWZ4ue70W7Tz7ouXzI63
 9I2cM6pNXqi7PQTvY+jf7f0hHEh+fPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX3Vvz3htA9h8r
 6012QGrzYro84lgEi4/F2yZEgKd17/uMKcPqhd/I4hy+tFZ6oS4OrNJBv7TRytyDwwqgIvRX5MB
 ZXkkagPxoq7Iwe8aIVAWT9abYja5AfghGpH58s/yb41hAZIo3KjewhSaRQ0dhCOa1FXxcFcfaUp
 JD9kvhGVWtiFqv4tbhXuwX1TA4sqlW3sQQnbBErwH5JZSjAW87MlvhOHbi+eFjSyeIwnLcJTIMe
 IF+ge5WxvAMlTgvMI9IQZtm6EazZuzeO1JoM2tmQrMm2slat408EfsmFWaWlRMztS+0+aWRR7Oy
 2HYz/4DrRfPBZr6a7mkOlrst2WeiXyBz9/ng3rFS5ktAjmLkwp09HuCn4tvIHEn+ehS2ReN/Sb8
 MNQUCFnXBWQ+LeHK49XJh0rfUoc0iAza1A3MTiR1OsuAkuFV1bMMBDot/ITwzKKzZneXdg9X+Hx
 tFoDkeuET080g5DvElw==
X-Proofpoint-GUID: o6q6M_eV9LymZ9g3zrq6R8d9GbELgoYy
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb236f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=m-1na6zgiUrtrnXSVq4A:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

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

