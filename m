Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD343C05E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751475; cv=none; b=XoRAGpAcf7GdlIIzdV4vSz/VPPoqKpHecST9p5Ve2WTmMj2LAtlctAQp2Z/OafD0SblCYZcKBhg0TQBwmtouqnAVZVPEm2cZ+a3yYpF+Pdw3+26vauFryA/tixxEzTIvrx1cb/D9NAd5SGGTf0aC1oHqm4p6vhnDsdUcLfmqiFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751475; c=relaxed/simple;
	bh=ByDTTT0Qj7ywEuTooScxYWiDYq3+XbUuM2+ao4VtRSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3vWWWHP8Re/UANwpdecCu5T+2T0pQa2ly2YUki6qmI4v4IzwHEu+PXwQoC1pDBZfLwyxZpwriiNvvdSDlrUvhu6l0PCSkDqeCXHkq5yW3DrytxH1J9HU968r7tM0uteGfN8/sFVG/R2k+n6AsdYud3U36oxPIY0OjajnoG76qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdBWwTgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tplsow59; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdBWwTgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tplsow59"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6oVlY2973412
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBzi21mSCKtvtbfxlQPChsAyE4Ks9llbbpyCB8qx42c=; b=VdBWwTgHxEpz8xJI
	g4gRsGAkEK2eucbb0TD25cLRKQD+hKYDoNUSAPxp0HIr+ZlVC/35LAN6efwn8Pid
	zkhT31Jy/pFyBurNw1mc4cI5amlenAztPreEzGZJZyE1Rn85eVjIMdhmBt3w2TpH
	Z0ElSMXGz2NOB/3CYw++JnrjQX8XIW9opZc91GnoiENAedNWpY6USfLkCTiIUeyW
	R0dj5kbi69dJl/v0zpTrpLfEDV5ImGC3mi7/N3ZWKNYeM246NfsD8ce3d1Q1QRLh
	eNbS7HZnWb4mT9Urstj3Q82y3TCA47WXT5FZEzka5vE4vChwQUPM3zGNjoJXlxpn
	WlKDww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1405b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5e9c2ec1so315060585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790751454; x=1791356254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBzi21mSCKtvtbfxlQPChsAyE4Ks9llbbpyCB8qx42c=;
        b=Tplsow593ToyKJELdrpYmgrR0+v+fctMaWIdF2Ph8J5KasZACM0WOu+cpN5wHQ4HBv
         iut2ecB89sOJ254kKuOEBqhSq3CG3sEuIt/roams6ZhOaf0Q0M7QhOvzm3wW2zETmdwl
         lXDTLqCowt1HnydSO66cLDroFeTKr1sAbp6SLZDjPVizEKrILca87AU0X0RG8t/YrGx9
         i5MEGMEoRMFUDVnBDgzZBwsgY650QNHpDQHbZ4J4RprT3+mukyd87QjQE+7F33Xn3wRN
         ddVcrS/mD0XdQBlEYIDzZwn7JF86N9S22sLjtPHpzr9jrmINEb1yqLzj85Lt12lrH98r
         MgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751454; x=1791356254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBzi21mSCKtvtbfxlQPChsAyE4Ks9llbbpyCB8qx42c=;
        b=rNtOE199bIfzEbbOHL/EPDBTrZ6T8sDtuyVO8sGI30EeAZFPIFXB8nhBvg2MpOkqpU
         3p2PcdL0ZEAbsHftxL6K6zzSI8hbM3IqmQ15UfjMwfG8Tmr5l2b/NNLHg27RnC3qkbVx
         v4+I60yz6X2qeWOA4FSkgJkd0jsmt+Tq2wgMfQAneMtzWEYCj/esH1twMwyMVjv9h18/
         bT+xHWtkk+xE54IrvOP/S+W61T//NtOSzobEkmCDuc+jCdVzFDUHNtTBbS4Qu1EacjUn
         F6GE5WBKnhrtp/M91YiKQ3emlDhjYD8F+e0C5AX52KjKtenK7tOAZroWlKIj1oIiDwQ2
         CM0w==
X-Forwarded-Encrypted: i=1; AKwUvBzvzAR2rYfAl8+OJEdMFnDL15CbFSrL+eVI2F3bsS7kW7p7lYlCLWL4xKHb2JNS+78GwUCUGAWI4Rx31dY=@vger.kernel.org
X-Gm-Message-State: AFuF++nT/5oMEGxW+hKhMkAZztNUifeM4HBqdRrDH8VA2uVJSIVXywp9
	tnBmKSn7xoDjKQTPlX1TfFIidvnd1d4wlAFNpNFeRHW9gECFOk+yNVRR+HqNRPsO36avqLCUkPg
	/dTOdq8OUSCImWwDMgltD09ugoTal/wodle+cDdm0kuma2w3Kq34tEgdYLfGXszJDA3A=
X-Gm-Gg: AYBFou2BcWT0z0PRUycQalnsOL/wErtWM17d0eOb0Wd9zMbX1u7//h6Tk72XR4tFW8c
	0/UJbb/HXWQ/B+SqecwI+mY/kut3wM1+biA/eiV7xPPXYA9EC5vw5nURs0REsozW5V8dn/P54EE
	Qw0gnkGBSB/hi/RlUXR7ITS/D2nF72zh5qNDBKqBrMANmU/QphJoLlWeGG/0sDRA1mUOhu5h9Q1
	KxyBvk/49AoaSI3f4h+qhOOGdL3lyXJI6vOnrNg9hsYKREqpYgFdzBnUNGcH6nWgoVMO4gjqJwa
	GyEyIHzKFBkU2zYi/YU3FVxZx13pAqaYYIXj3WiUNnuMsYWN2UHewpgGlh78KWq05NY4EQPEe3M
	8ARACOJGxLHEJwSOtceukvSn4zarCdtCyOrxmHFRwNe+4G+kh7L+j36AHKG0UvqWSt8B2Zgjgm9
	998NI=
X-Received: by 2002:a05:620a:6509:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93ca9752cfbmr63274485a.25.1790751453944;
        Tue, 29 Sep 2026 23:57:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6509:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93ca9752cfbmr63271085a.25.1790751453416;
        Tue, 29 Sep 2026 23:57:33 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82cabcesm51534785a.27.2026.09.29.23.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:57:32 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:57:16 +0800
Subject: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
In-Reply-To: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751443; l=8956;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ByDTTT0Qj7ywEuTooScxYWiDYq3+XbUuM2+ao4VtRSM=;
 b=MNTdvZvVPZ/AL9bYCjAbXVzsmBy7Vcbp1iQJSLSEVIImwiSuJawuo4CnisEnHMl1lcG3GTZmf
 9ru/49R+1qgBwFi7eio2+1hEH00yLWLT31BmIc6r39wIW77QqUgLXbl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX92Ezat0LhMQH
 OkzmMgeE5v598U8Ug7F325U0X+Biu1LeMYDBsQ1xoIi614tleRznnukBRDIjHsgWRau3LtneEAu
 qcos1aWjRC4SiybnQxcmVgb4fXTSwDQ=
X-Proofpoint-GUID: WRp2BSETvc2AYgY8GlQb6cZGoZnZQQlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX08yFgPdSARnq
 hboy3CKCg9iAyF+HDRdlOibGZZ+GFMNFAXq8zq9bqr5pEySoain1cStRGmjsluZY4fH/aOZeolt
 N5xsLuNFXNrUep6/RPogw0KYD88m77Ex9aNIqHf0w0oEsVCirj/8r/zW0ziRCe0nfzJcU3I+KBd
 E8Bo47DSn9MqPR3u1FSplOumuk/JdW164ItHpm1Tlw5myG3hO4Bn9HrVDv0VBddMQARiDYtDmbv
 K+osMfiG5V0QKgquTI4UOZJbMnKj0rH0HWvMJkx3Xbov9NqB5/c57lTexD/MU0fPwz+A1vgrVWM
 /ZhxxjJeFduCkc7Bsx+eMZ3RBY+MvlR/a7ZriOWaZp/6OT5gIEdrl7oBaEBWZiy4IgYeWA0Jw4v
 vlccbVWs3vT961/vAxnFlmdHhSqJTxHwS+xnvhakqo/l0kLaMU8qfshoXfoygDTFryo9vCkL7Wj
 bRzgJNXjvzHyWm01ntA==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcb2df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2DfPVCEIPBpRJJTYYFsA:9
 a=WHF-xbD5_J3Jx9WD:21 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: WRp2BSETvc2AYgY8GlQb6cZGoZnZQQlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300027

Add bindings for the Camera Subsystem for X1P42100.

The X1P42100 platform provides:
- 2 x CSIPHY
- 3 x TPG
- 3 x CSID
- 2 x CSID Lite
- 1 x IFE
- 2 x IFE Lite

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c5ea7a7d9fe5025bb15cbddd85b915d136083447
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1p42100-camss
+
+  reg:
+    maxItems: 12
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 14
+
+  clock-names:
+    items:
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected read
+      - description: S1 HLOS IFE and IFE_LITE non-protected write
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports, one per CSID. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[01]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb7000 {
+            compatible = "qcom,x1p42100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0acc7000 0 0x1000>,
+                  <0 0x0accb000 0 0x1000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

