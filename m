Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F94248A0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315356; cv=none; b=gLNhNuTXZCzWjaufJK+K5WOcDm1pvONZk3cw9OU3ktQoIyC+dJ8FgPP9ws6EP39P9lWgm7PL+1cxazL//VUtzogrV1b7ySiJLGDbsqRcSlYYfOVAUtdOjzeN7qKhavfyBmw/ufd7b6WYsZRW6mZ8PBE4Jcp3Fq+c4uhn8N8cQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315356; c=relaxed/simple;
	bh=NZuNHL1UBfqgNWKtvhtOpBVni0+Wp4WN3hp2/6qRqzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNUJF8+7Sr5lz7Fq8aJYnB5+oYuaNBXMcfJCgq2SscM0FxNo+K3xpOI2+msywiph8u8/9+Q4pQ7/PD4X3ETLzV3nnI2xi1FpgxwO4sIbv/KCuA6IODCyL8T+UkRvx688Qjr8taS78yZGMh+iIQ6vaohgzAVgMNNYSSnnzzLz+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqUNXEWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoUoj72i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqUNXEWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoUoj72i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YSne2911624
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jsmb2+8ETECDlV8vJZlWo0+dCOk3HY+XqMB0gSs45YQ=; b=RqUNXEWctVqm3eWV
	AhgbfJEfVovLuMp91ee5tSZqJSsY5gXnjN020kuITpbGQen6qniN3ckE+2Y0tlR3
	SeH1G6jcK2WNA5/WtaiftXtq+4RTug0aTXzzwKVdF15Sep9deVFSUsB0Ri5IsYIx
	s2hlHcXRtTFGPtusQKth2L3yTpIYr0YjfmkqJDsyvwTbNlqvn7gDsUNDIyg5PPRf
	JV09oaeYHZJMQ6cilQyHiDQpTdgJAqFMDHxBMOpKoRho103Y+T2uVH+RIcTbK5ya
	2FNU/S7ZNrCYYruih57hMk/RtZc1Y2lh5a3L63kKNYdvSptPa5V+UJIHGTCJebmq
	BIPy/Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm509hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so710325eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315353; x=1790920153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jsmb2+8ETECDlV8vJZlWo0+dCOk3HY+XqMB0gSs45YQ=;
        b=eoUoj72it7usVlY4fw/za7TvfJ1YQSsUf8Mey4UmrxmrlhNwc4r+RdagYH6xjXDtlA
         NGmLuA2wiry++UTe71RbmtANlT5aUhlikqs6VD8RChW4pGNIAb4fd1Ob38fOq/aurSpb
         zfTfHZfZ1X5hmNU7IMyImwoaevLSgFLBOmyUnPgd8Q3ooR06NSro+XcMvmtHCJ3US8ws
         fi4TYdRwIB6cTds4XVOs/B9DLliUN9cE9Hz4qPLDaaAtc9r+AVrglMGNVMpYMTzkyxOc
         9biAiNIhxSgKD2SSy7kn956s/5Rybwrl0D0yT1ToTQmcF8gxwgR5zcbTXSCzMv6P9L4A
         h7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315353; x=1790920153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jsmb2+8ETECDlV8vJZlWo0+dCOk3HY+XqMB0gSs45YQ=;
        b=bl9aIS7knlGvXtbaWBpY/N1DJwDFRkbA2Z5BQWvcGHrbzKcoYspUm5nlVuaHBFJFt3
         AYLKq6TxPfskqz6e3R0HcEVR4kyZFyqpgH+Q61RBBuz4j6/VooQU9a9jCo6httkGLXmj
         bm33ljc4UQSwNF5yBL88wfkRIw82k6/nhKzPzvrfITZL5v2Ju2xJZa0QUKrrfeUmlUzh
         xvTnoAHct2Ivv+dTFP5NumTGb5J625uIIrFi5gvXRl0YZBBUj7eMOnCfe8b6hP9obI2p
         58fJmXNXSG4ZxGFbMHUag+zXIXZ4IuBFWrrABIDAFXzyTekFofhaMaFfLu8cq6zu5njv
         xSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOyaDbYCmiRbWeFFH/QZLqhpwaBXBGmqhcd8wNPNKaNG0bTxFNg24RerVO8BwMECi5MPAKv16rHwIWZA8=@vger.kernel.org
X-Gm-Message-State: AFuF++nOfwqpr1bxDdM0AIna8W5blVJLpf4zX0fU4ootuCA2SDDhMR9M
	3YpVpUQPyjD9sA3+3VuDCZkX5H5LmafLT+dGRJulPCR/q7FEZY4ls/gUwltDv5fLITvaOYiyOMJ
	ppRZ59sBrLwdsBcvN5S5UvhLe0jvrBuQjYPOcruQYy0RRprFXB918Ptk9I98zmHwIN8c=
X-Gm-Gg: AYBFou3gDacDH2f5lUW0GfCeCpGGd4DaIfAE3DG/Y0hWkTQg4Bb+ypLkeN8YpMOEeSa
	L2reR3lw6CEV+J1j6BbBdjFGNdiCeNCBlSNYm2fj4e6lCNwK1eOrUkrcrqXOqW+nisD4AohJAmY
	82y3LSK09DpM6pAMsrpv0x7O6s8XsRN5L1ZteHnAHTBfLihRp1VmdOk39lCzL2o1t9q8uPEk4mg
	iY2JV6yWeZJb7Aoi3xGMMV4UMj6/6yBJsE24nf25/RIz8BjzW/Vmi5Sphf6aJR07tyViQGXWWKq
	vHHTSgLHPTmer32QJTJ9wF3ReYxhMUvqYIF0RwaSPls5r8vbNITOItpPzAFIdTo5eN+T0WctB1Z
	04/G1sPXBswJPgwHEKI1FEf0sjrvBQUs=
X-Received: by 2002:a05:7300:b1e:b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-340036bfe73mr3683083eec.18.1790315352745;
        Thu, 24 Sep 2026 22:49:12 -0700 (PDT)
X-Received: by 2002:a05:7300:b1e:b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-340036bfe73mr3683046eec.18.1790315351889;
        Thu, 24 Sep 2026 22:49:11 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:11 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:46 +0530
Subject: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=11059;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=NZuNHL1UBfqgNWKtvhtOpBVni0+Wp4WN3hp2/6qRqzo=;
 b=8WNfNBLhLOshrMZ4OpAI2VaZYeqxMofiBY3a331bqncCkF5kTT5ks1M92JniVHr12xBm27abm
 MzNWSBdGIbmCoQo/6dO0Kp2ivgyEvTZ0BzEhJXmNS7pwRDMnpIEc9GF
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: XitUKN8qZkI6Oo3IRd93pH3yWCb27WPT
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab60b59 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=MTeEhnUUud4OIzaa2fYA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfXxZ4yQZOhUXVV
 bldt/Eic48n1aH/c12oCB5tedvs8hEcxJi73TDA9IVFQ45Zx+PjRgnH/Ak32W5rdp4zs31J2oop
 8iliTzLSdr8gSXNvZPFMblFye+6WFihubXpTz06jLzKO1QbFGUyBuHspivhKTQGAfRhj9PJtc3v
 Vw4I4ZnkCrdGR/moCDloD2LglBwcKvAVWBml30RNW0xcI4rE5kCGk6Et7uwAmD+gPq/QCqklsg7
 OXLHMdxJln2vbx+5fFtGrhwJ5Mm1WGMBnZJrQW6vQlaHzwHLct4nkaYsKmAmjr+iwYMAd2Dcn62
 X2EKRyAxJQ7pWbmpdxsVmLqef1hJjyYRvWfsMYniSWl2eL0x166g5lMhRYW72ZDPGRqjj4zCwIN
 zi0zFsxsbWI+AM8o2D1Ow+psPyPkRY0sI27MgMGDXq8sCrRHwM1ga6cbKcvIdoRFisxwekocLm1
 tMm9aaaij3t7rU53TWw==
X-Proofpoint-ORIG-GUID: XitUKN8qZkI6Oo3IRd93pH3yWCb27WPT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMiBTYWx0ZWRfXx0jFmMk+PkFA
 wfxvLdsziOK8zqZAin4PQep53+5yHZ360SxvtHH80j7VeYLoLYFprZJx0CZbl11vWwuKQXtLFNm
 GmWqF5KtS0BFc1JBU98nHbri2Xg0o2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250022

Glymur uses only the new PHY API via standalone phy@ child nodes,
so per-CSIPHY clocks, interrupts and supplies are absent here.

X1E80100 has four CSIPHY instances while Glymur has three
(CSIPHY0, CSIPHY1, CSIPHY4).

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

