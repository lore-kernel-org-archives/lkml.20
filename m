Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C454E2F06
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646791; cv=none; b=kRJX+CEySnvn4vMMTF1CZp+trhbW0XSucoUYmoqaI0b+7SOQg7PnVnd/kciRTvQ3Xqs9KhvItmtQp6+JGf8fahMk3RPFNvJsB4ru+kQEIcdA3fovkkbEoA/NS9TRYexMLI8a0O/dY/HLTyynBQbEHT7UcZfqb9Fe4vdamRmXxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646791; c=relaxed/simple;
	bh=P+unFlUHEdDd9f+Q10YFMB8qwZfDEHa1ScuwgHEZAMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bv6IyYb1PswoAC1mvxrOZV4EaOoTOq5y69U60G2XDygQR+m0mBSNIP8rnL8IfV4NjSv5AqJxmxZtu9AUJi5l/KNpkXEIMNcGUSyLUUOlMZpweW0oHVfjjeKjuKPWZ21uvGuwpQ6aXcJknBK/e1X2fFLbhZ3hs9/JROSfuKOFJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ng89QN6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pt+HV14W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ng89QN6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pt+HV14W"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zokk613661
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+2CKQh1ieZxmCezKjIHSnKR/jjJZkVnb8TyUl2XKDY=; b=ng89QN6f8vO7faXr
	CLwpoc1lcaxIQZTGZCqV/sfMnnell5Hc2zLZ4kUCxdBDYY/eiZQy4zx3HqHIs+Le
	RS/Dudq6aAQGhLi6K+U1p+9NxfGRA0awaHA5GBf3oKMbH8IH75K00Ze8QOJXAAri
	jaE3BY3MGH/9TOX6c+6YNOm+9Pykb2qIo0Zg595tx1zsOFh5XVKoTuvYoTeHUHvp
	5Q8Tl1YuBIf0zt8oLyCP2Rm2r3F7+dBhZklPO0bRwTzDN2GNFF0V0v7jMj7ywsEv
	uGH8SBNAr4u4k14GMfLG76IK8DBcQftxtRXRLd+J2IBarFDjE1iAhHahmCCbp6cD
	YP3Upw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rywx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2317523a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646770; x=1790251570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+2CKQh1ieZxmCezKjIHSnKR/jjJZkVnb8TyUl2XKDY=;
        b=Pt+HV14WBJp8GNjQ56Yb1Lxq6YEDCy3h2qvWP+hHz/PGPbDGz+kjWi1bRSGSbRNu2d
         Ctt3Vy9FUB2xhPXUOuePjhrf3ZtlSEGmmiUcBErnK2BWfotdcwJJ91GVCK3KE1PX7Xon
         QzuQI6Jbilxag+i02juFNowL4p43cYqOhdg3wPDo1xLrbkckOW+/qzsdWcfpDM31NdWT
         MiuPn0uLlzwumq3ISJl+vVCeycvOj2AWLCNbtpydwrlx1AvOYXfSLbS47Vs4AcqlpOcw
         b4u/iEGEsA9wQo7pQHjanQrL+GYkshZw9eTu0kK4ZfEo4fxIB9Sd2iR9Q7cdKPKSSTCH
         rPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646770; x=1790251570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+2CKQh1ieZxmCezKjIHSnKR/jjJZkVnb8TyUl2XKDY=;
        b=Px1+QDQmazwjF768A/rBG52SYT5dbja20iY+m+Mx3qqr/y8Ll6uyPftw5UfqFg/hXq
         wG85P86EbVzy1dvVyjq5SjJrBbtksV5+8C1cxnfi/zUU1fiOH1SO546ECknT4XFkYx3/
         TUtaOogNjwr4qX1CTUDIgSx3+4J8s2ijo9yVcBoY6mGFpLX++ysdYM6YafVBm7hdf522
         0cLe5cNoZ8QTku2mg8pbDdp6sg/JIotnviLe1nNSQtusHfyj3jfM5iPhEtSvOlfj6kyq
         LLachNG7gUunkDaBjfUbTGmrx8oz4Y9IDU5ATOltFv0pXHix6gz8p8h4FVrKoTf7jT9i
         Mc1w==
X-Forwarded-Encrypted: i=1; AKwUvBynZEPT6Ke9eNWkLioa5joq3fcFgnPcU6KbcDSNJPbQ7lKsVAG3pAS9AgR07O5SQxrLDW8qaOqAIsieMp0=@vger.kernel.org
X-Gm-Message-State: AFuF++muXgtofm3T0N68A5TeqJf8JwN2wLtbxlgGyPqpDo3uAnHabtB5
	Vzf7OBqXAk35oiAUB6Q0qZTRO4qGuhQ5kP0yFNEk0Tw+LCmBlMVZv0a+eoiGK+rpKnjpvy94XPv
	pInc9ZsEVKF7FoqXhldV+uTkVmAfV6NN2XEeTUkD+0yQeZzDXeuNV9rHOhR1Hf78Qi9k=
X-Gm-Gg: AYBFou3k5so/OmGR+USQADqhQqomvCLRu3A7KajOmz8GSdJNnqx4SnE4fWxkDl0HHx7
	9P7xbFgp12UuAR/LRmjKCjnZchde/y/I0Jv0fBM5vxI2eSwilZ8a7AEp0qUIX/LV6hI1Mr3a3Ac
	Pez6WSjpR5GdgmzTktzFYE0OzXEkvotBRU0TdQRfjFIGP6aMl2fUnXMQK3a/1xdjFXB0lt+ejJR
	4nZxEhyklbxm7DHQtGwisTAGY+47XutNPYeOLbnM6vDwKYynSYBPsW1rFfWPwSKs7FPY9orwPH7
	CiqxE0Etyuj5x8i+k3NxIXp2if99AMay14cDoG4iFZI2bOvj5Tuo4CFPKgJJQpwPkgh82F90MZe
	y0RcZ+QiAtda88WsFfR42e7iQIoiFVA==
X-Received: by 2002:a17:90b:2b4c:b0:39d:f024:c7ec with SMTP id 98e67ed59e1d1-39e1e484b5emr15886323a91.16.1789646769775;
        Thu, 17 Sep 2026 05:06:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:39d:f024:c7ec with SMTP id 98e67ed59e1d1-39e1e484b5emr15886111a91.16.1789646768098;
        Thu, 17 Sep 2026 05:06:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:42 +0530
Subject: [PATCH v3 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-2-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=10986;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=P+unFlUHEdDd9f+Q10YFMB8qwZfDEHa1ScuwgHEZAMM=;
 b=JXjXpOuqtH9d0kzFWRnnzONpiaIoXt1ijEi5tdOCH6R3TrwiU82rPAZMejcSKRic1lyD6fJFN
 G2iuauN09bFC/BT6EpgE3Z7cc/YzuSLWaH9Zz3Xq5qOAYEcOTJtlPjl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: XqXCSrQPA_HIBih_3lKmv6BH1jYishD2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX8Bi8iIReyKOO
 etVJOv2dejhbN6HWbAXp8XsR4H+bIgxB92yUi/ZnWWVaD0lvoZVgUm4D5PlbJJ/g5oqwGXxZN5+
 b6dE1OXgEiJ/GHMI742e7oYyuPWUpZk=
X-Proofpoint-GUID: XqXCSrQPA_HIBih_3lKmv6BH1jYishD2
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd7b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=MTeEhnUUud4OIzaa2fYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX7Q8dKhRxp9zC
 AzagC8/dPALBPbM+t4iNAJ1nvtiZdiH27VXa7mGMX87e4eCf7nOybPwsL6bI3uH4tOGyMWSK1m5
 VE9WoxAbzGV9gbLPhWkvxKssYSJ79+wWus1/Q4/y5IZ3tOpvltzBmn3RDIj8HE6ye2EdNJTqUjf
 cxK7ZTcAnx9fE6l29rk5riu0oOtMHA5dWIguNqHnRVppMOfAaq9brfk9Bsu1006z6eB1pmw3THL
 6ST8ODWd4lUnoCITleiJWlvsb+ELbMw710YzDvKnRtQ20AYMzinBn1TAVKCixzv/xBLDQbZfIdP
 C9zpnL9hbCV95Z6HsUMM9wtOEjM/jo3z/TNYDgGFT9/dh/ahtMJh7bcnbKSdAE/KFQAmCK7MDq/
 CH6KIVncn0nIT8rLlIttVPjhza5SuQioKELSddJSSEsJQebVZhXrxajCNey+ePdtxjiMfeXahxp
 FjjpzBvjpPaa2pX/fLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

Glymur uses only the new PHY API via standalone phy@ child nodes,
so per-CSIPHY clocks, interrupts and supplies are absent here.

X1E80100 has four CSIPHY instances while Glymur has three
(CSIPHY0, CSIPHY1, CSIPHY4).

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 1 file changed, 300 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a0b77edc212319fad69113f3d55ca24f184d4b23
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -0,0 +1,300 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Camera Subsystem (CAMSS)
+
+maintainers:
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,glymur-camss
+
+  reg:
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csid_wrapper
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 20
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
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
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,glymur-camcc.h>
+    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb6000 {
+            compatible = "qcom,glymur-camss";
+
+            reg = <0x0 0x0acb6000 0x0 0x1000>,
+                  <0x0 0x0acb7000 0x0 0x2000>,
+                  <0x0 0x0acb9000 0x0 0x2000>,
+                  <0x0 0x0acbb000 0x0 0x2000>,
+                  <0x0 0x0acc6000 0x0 0x1000>,
+                  <0x0 0x0acca000 0x0 0x1000>,
+                  <0x0 0x0acf6000 0x0 0x1000>,
+                  <0x0 0x0acf7000 0x0 0x1000>,
+                  <0x0 0x0acf8000 0x0 0x1000>,
+                  <0x0 0x0ac62000 0x0 0xf000>,
+                  <0x0 0x0ac71000 0x0 0xf000>,
+                  <0x0 0x0acc7000 0x0 0x2000>,
+                  <0x0 0x0accb000 0x0 0x2000>;
+            reg-names = "csid_wrapper",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x20>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    camss_csiphy1_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy1_out>;
+                    };
+                };
+
+                port@3 {
+                    reg = <3>;
+                    camss_csiphy4_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy4_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

