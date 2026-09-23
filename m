Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC53CCFC3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161421; cv=none; b=NpDemnTr/hi0TWwJBtoPts2IxJKkZWHMLGF0yjvk2MXWAqgiUmKu8L2mbMXvz/mRJgNxOsb7rM/0Z1pFsJQ8uUGSd3PCiN1XVE79/QLzXdacYSg8q+RHq25RbgyumkmPvUaxAxqbNxIVopOfd/+wAnYFbDn4SZ1ISsCs+4PwydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161421; c=relaxed/simple;
	bh=fkx8BdgQCXtuvhheut+uP1TzKPTL2Yk7D3OafuiXXC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4slLhq11kwEFQRcHufiVv0JfSp8TSPxoMpkBK6qUwpY7jAZQoIZikwMlAlUctvdkJWnLunChWiRhyAwPYdi1n2jhdpw44mwfucgZU1G1hJBSbZNj/4486lITQg/XkZx9pP1hbVPVAWYrkj+XXk3FdFWAI1D9i7gixmrOOkmtAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihLeobM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=inuD9LIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihLeobM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="inuD9LIc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2gJb2429446
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jFXCPTv/2nT4awTOU0ExymnzqiaZv71EpQzw8EoM3wY=; b=ihLeobM+MQKgBYwX
	gohWKxO816Jngy78zweGBJKpr2jsBe7AbAIdyzw2wxRddOkObNqgmMMOyMf0piyA
	tPe5uN8BnIYvPle1xJJYV6X+eeelBgQtC6aT68I0J2WXsfaGprGPQNRpqDpz0UAP
	qegAtVpk8uTucLvx1geFR8b3ny/oiCSXe2mOVBuzsW9mF6o4Pz4W1ibkF5O4Dfmu
	BTh1KywQhHZ1+Oo8toskruRid/htRreRIpEgHWuau09UQI7WF+QN1RYipexfo5G6
	0hxhfEeZ9C6JP/QVcXcyqm+/IH5fouDym7glENc1ZrLzD1hGPfmEDzbG+qSNytZP
	e4gTRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh6k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:03:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3286d2bac04so886181eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161414; x=1790766214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFXCPTv/2nT4awTOU0ExymnzqiaZv71EpQzw8EoM3wY=;
        b=inuD9LIcs8EvNiGzhmzr7C34YjbY4Nmw9VYe97SA9xe0y+t8yv2kSgvcCWV372nuZb
         zluGepeF91yVAZ/niiSUqS0HtKo+ZLCqnLHxXTpf+MCSL2nON3o3Lb5ceg04gNSq+oTM
         /6FVviLlNZmrMKhouvTGDbsAPJSYgM36Pf45WOrW7QW5HN4I62kqWcn2v7JNcKDo4Toa
         lRkrv3MxDESIsHxQrhI7r810904QZek2IYhSHdtBt2BgIIwvTGooAiYpRo0a7HZaZv4H
         4GS2O3Uu+t+UfuFevCtCDwxmcDUyH4EusYxxO7RLFTL4uLsnRTVbE35340itZK+1ebn7
         PQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161414; x=1790766214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFXCPTv/2nT4awTOU0ExymnzqiaZv71EpQzw8EoM3wY=;
        b=A2atInhzIjDJ5qEpGPaQRq+R7XnF1iGi83fN9isHdjr8B2b6Nf7bYkkNwC5efjuNNF
         8RosWDpHJnHv1XAZFuoiipL92N21yRnBKY9YoAqMqvHe/SSgnTZF7rRv1Y6dQ5LhxGlx
         vS+I1oK65XvBXwOuQeQH4NJ5qPfVcPKdI3xiE9VNInKFXwqyJDw8ILprP/1YVK6Dvuu8
         7DLehhptmHFiuY899TTgHbTAY6K5XXt4FY5mi1jTxIE2z+NsCBmKVsmztI59LjfgSlZN
         gGkAYsgcYQFSLU2Kqg5aCR5kek0qbkEJegLaJ6kBGKP5JEw08BFGRgSkNFrhIg8DweH5
         sJDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3WFv8DmtjCJRS9bl1Mh/i6OznWUsFoywTAxywLTW2KHJysSFQiqgrmXnxh2f1DsBUgE117XOmYW0WKEw=@vger.kernel.org
X-Gm-Message-State: AFuF++m8IbRYQHZMe9QSw4/PADqjANeyPiYlG8hbWM8wSNp+sFV8W/SH
	7G/AOXeTQ7oakfn86C1OUqhQPqSnwZSckwAQqNZ/OwkMaY554y8iEZn0yiqZbq6wopsR4z6yqx1
	zM7hcdYHwB21WRizqx6cgjsqfjcdMoVLy8yhfzSN8z7TsVBzr0k9jbeMoG64m+RgqgzE=
X-Gm-Gg: AYBFou0e5cjCSsjO7wltkYm4zzilICk20/sZ3pTJUty6oKQKXzbuHNxC5QzzQs+53aO
	qLPheOseTVYiaivgDLdMZQLizsrgl6s71pILucjzXTIDcJ+av23xk5ILVBpJKgfHOPbBOP/swxf
	ILcxv2iD4ksg1+32jDLH8R7t7fA+P8Va6JtB7NQ725v1cXItgTmYHi1obXFfYoELnjHsgj7WPkG
	QuIhGUjBYbQoigldqRGUIMZ+MoBj3SRYMFT28gNGQS9JwMbrJpk7N5dPEVdai4MiVaY/uSPwEPC
	1/eOFcASwp9PpbRvoL1SlwOuiNDWbnxL3NEAeYJg3jdNdxvIEt/kfwAxRyFmCSHAUnniiFcX31A
	6+kRW2L70QHhpIKCS5QCymmXl8A3aeg==
X-Received: by 2002:a05:7301:6196:10b0:33b:fc9d:947f with SMTP id 5a478bee46e88-33e8ea87051mr2340481eec.40.1790161413713;
        Wed, 23 Sep 2026 04:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:6196:10b0:33b:fc9d:947f with SMTP id 5a478bee46e88-33e8ea87051mr2340293eec.40.1790161409291;
        Wed, 23 Sep 2026 04:03:29 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:03:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:34 +0530
Subject: [PATCH RFC 03/15] dt-bindings: media: Add CAMSS device for Hawi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-3-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=11243;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=pZGG3ZTs6JHutNaOoMRo42LdG3lmp4rBlAcm1z9EX4A=;
 b=Nu+r/h6wjdCN2l26Bp4yMRKX0yBKrEt9LPuefTvbbhGpTC4BjTH0TkAyFNil2paiwZ4HHlLOJ
 HsjKsjcCt2YBIjhRMIcvZFlMg0979dlk7GJj14GrAKvyWD3m9deVFVw
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: ZQ89wByAszg31cQdT5XoU8iLeBtyddIc
X-Proofpoint-ORIG-GUID: ZQ89wByAszg31cQdT5XoU8iLeBtyddIc
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3b206 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX8nRSaEOU2fk4
 UUF4EnkovVAOMmjpvJpDj699Cbjdvx3liubUCZH3byl1SC4Vb04jmheOIPbiCY6Pv/vyZa1R7zy
 rXXB9YlDyUqs+R4VYG9UAYTvOPXrRUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX6uMhLX8nnlTq
 sIZa4cXOJ2vhTMT6ROAeKNDJHlDVSFPPlSE6M2kPUg+i++kcJKy77yE5RtzHNep4j1T3w4jrzjX
 PRNbvDIyQDT+g2tnjRwVoPocKPg7w97Pm2kY0dKUU1aLEcUoyORORBCB7prQQU18pdq8RCYMWPU
 3xwQj0tAgieeJB9ZYcL2O7tzmWCswrXMGcLVay0pXWluWxj1gPs0vhwCJOiVXKJrr/dg5vG+1Rk
 ooychedM5Y2ni1vEWHLMaFFUodOxBuT867/bmijR1VmfmFOAEyyZshF68rvfgiAfp+qPizktMSV
 ++jtsiO9tRCpUw/HVCQhU7Vfi1eaMYg3ne8xSP40BFERG1aLzKe4y9ZHakJ7TBGinY4Ukjsp5oy
 xhCQyfyR6hsGFA4CKqDvQmelMh7366XbXOgeeC9zLPu1oflFLdvJy9sain7njuqZ2DYeRPL8p2n
 0as2IyD2Zs2MB//HLQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.

The Hawi platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 305 +++++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5bf0dca3d24621bfc4a09feb8e5037a925869751
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
@@ -0,0 +1,305 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,hawi-camss
+
+  reg:
+    maxItems: 13
+
+  reg-names:
+    items:
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
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_dcd_xo
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_mnoc_hf
+      - const: cpas_mnoc_sf
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
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
+      - const: vfe2
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
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan GDSC - Global Distributed Switch Controller for the entire camss.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-5.
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
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9253000 {
+            compatible = "qcom,hawi-camss";
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x6800>,
+                  <0x0 0x092f0000 0x0 0x6800>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_dcd_xo",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_mnoc_hf",
+                          "cpas_mnoc_sf",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1800 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

