Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921A3403F8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811988; cv=none; b=Hqq1HQZsI7SRwDp17FTdkvRlJIhVyLu5NvG3N+brLlkL+/tMCcagZYuRAOojobpBMQWUICZ2pvsqJPxiIiLkVoNYruVUgUG2rfmrx/6UN3E0mTjMvAvJDS7mT9VGp5d+o/4TY1rlnsl6bIVKjqSJstLmO9rPoDXHpo5kBGRMEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811988; c=relaxed/simple;
	bh=MkUA2Hn1VAlpsIxT+k4nWmujbQxSj4rwgkOPjr8Y058=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4M3aFrDqzendl9jSUwbgZmu+QSVKjdAw8PmEgNnccfh7QdV3FMylw0nemL7mW7F6SR3Vpf7gaU39WJ3bv3YkZ/7Q595j1Iu/Da4YmW0sUtjVwuWtxAuvtD9GNvZiM0aKXNHjlIfMO+IsO9fFLjpKsxwMEk09DA+yByVkfvNO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8d4fHJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JO/Z63Mq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8d4fHJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JO/Z63Mq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07aK1686158
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=; b=i8d4fHJCUCRRjhFU
	udMdqK7QX6MnG7IxB3TBSkBsvj7P+n1v0JW+chGt76MtXT8WxZJ7mh/8gA5DbX3e
	Rl/og+aqhNgZ6FRnu71+LmuY6jiIJslpw5JvwjUwrt7zf2UC1rwhNuhuBuubivHZ
	xRKimY5M6q6XMOtgZlfo0gCsVP4E/dd/rGjgANqnoSaTQcJYJEf0KF1qY2mEbOZe
	HszRZYU6qLmstTIuVUEo+dx4D2kRDiCR/dOBd+/hpPWCVVaGtY4aLv+Y0ydhIH0k
	Op9SJpNZwEmweliUaUzKzzCn4+KSLUHHds+0jdTy45FKnNDbdzrv1FkXFL92vL6Z
	bjnqDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0yhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so8141400c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811985; x=1792416785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=;
        b=JO/Z63MqI/MYMwrz8m9qjGErBTPhsLbXwsLIWaQTy6khIL+nyuEOqsrLZVn6DnSNBT
         y+eZZziB3YVHnsqv3AnGfRuX/lofr61wespVusXi+FRnkoWEJs+1LpGJoMPWtPvub4FK
         MF4l88F6w43VMq9NxVKMFOWTmf9pWDBxhCE+ch9RA6iu7A4Yip5PLcSIs9+mWLn7yBsb
         NlCUtlmDubO39mLipKC5ZXm9kwW/iGTZO/F2CMI3P4J5kHCdqZ6g0wfLSckWFLvIMFQ7
         8cRitOjZqCG9kBFznNkHpxS38cvoEQyXn9PiICoYCdMZxfmmyXEOiaENnWJAvtmjutWy
         1CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811985; x=1792416785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsIDIIxYIR8hxItM65IQFe6k6IyKy2g83EPXzed51Nk=;
        b=x81NeBcG8fGeN/hjVT+geEnttkP1Mjk/lqmsQ3dcvEcpFmKqx9v3ubgpq5mIoWPujl
         fMMxNM7rjbfmM+kVj13166/95LZJUmLo0Stw56cMkFJUc6DJphR5lFewOzITH9JR/kel
         S5MzeyAKsz8qdRa4yIjSwUhGnn9bJgxti1yo2QPpxw+2KoS/OdoeHl7ScDGTK9UOUpnR
         dx9QePiRc+iQ4NSmKHynWMPXQEmmUlh8xIH4Mwz4Yb2W6in9l/t2B2Fyo2TIjXh/VAfe
         BrQOitF8/va2D8b/P3GmidkTxfO0BzwbChmngmb3uqmnCvICm3hzs7qxXDEbDgGnquQR
         8EiA==
X-Forwarded-Encrypted: i=1; AKwUvByPrzzUbsfOQkuxLTdRFBj9DapuASBhIShFGtm7H6QKgY17A1QulnMTc9AAGAcKp3hbj7ch9dF4pQvuzoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn/oZ8yWLiKJrWZ5fGYfzOTUbC5r3HB/zQ/Dvm1BSc0hyY88sV
	8u7ktgw+zcJQqT9e6p7nxCBs7FZIWtUBV66ktE64WGVf8R+py90xGD6xMc1S4BwirU4cmqzQv2S
	F4otvtHucyz9FDfIfriQI0eonbkvx5DmY7kcDYl++0362vJPhm4y/HX0EoXw5CGS52Ik=
X-Gm-Gg: AYBFou2BDZBwVHMjvRKNVx5ZrybBNKRsZ9QzO4a8a9UlhQabxk78mn0npRqecQm2nW5
	ffs9c8HyQ0Z2ue/EMRUXW90X5kFdkMDsPhWWDJGWLuja4YVlhu0w5EE9JDeRb78a8SlZp6b/KBp
	U7JjPVtPFL7Ys9E4z9ptCPonpUzLh0rTmNA++JAG7vRFTYWNeJ2qG4JUY1RbmclNZL6iiT/lQIB
	0rdon1p4CEvbz8oUSb8rPmJCWQl0W5ku6GMVNT6m4ShrvUxB1yn2aSJw4q0fFUGIVOSVRvR8bNZ
	JyyfhF7NFFMtSYEGRb3V8bwwlmX+V94kUBDs9ynrcAfniQ0EGAOkR5knhVwHcugIhJXcym0kbi7
	BYydEZdudbvYrTvpOUcwxWcuLkU8=
X-Received: by 2002:a05:7022:3a86:b0:163:8b44:902c with SMTP id a92af1059eb24-16a6250bc98mr13246696c88.17.1791811984862;
        Mon, 12 Oct 2026 06:33:04 -0700 (PDT)
X-Received: by 2002:a05:7022:3a86:b0:163:8b44:902c with SMTP id a92af1059eb24-16a6250bc98mr13246633c88.17.1791811983942;
        Mon, 12 Oct 2026 06:33:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:03 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:13 +0530
Subject: [PATCH v2 03/13] dt-bindings: display/msm: Document Nord MDSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-3-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=14471;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=PIhvMharehcV8F2KI7CYEOsm1wLJbNBmm8ONnPnEAf4=;
 b=pDbDXOChbVAY54mKsTwyNDKjKrSkbZnG1MU8iMabzXOJGiXRM8w1xxlQZClElSEX4871K/lTy
 eAE+OmFJ6WuD0r7HtIir+xizX9jXGUI45oGlTOYK5FpQpEcFAmpDzI8
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX1xSoR9c21PZ+
 ZvK/KBsdsbGcMvsCdlqOlOLcMI9U4bSMEPxpcDMEWRhIhF+oqVzTSTjSp4uH/zz5R7nyj+v78Qg
 rmRkIbPQyikDi7DmEu80p80jvEEOx3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXxihHHLu+qpDR
 8zSHOoeoLtc7IH9PtZseEF04Rwm6uQKjdaNaJidz7KCQmnc5iJy8ghVgwvdHnNQ8cMgmWypj87j
 lz5WSWYpyBL2VhqbOX0AzIc/cWcrTuEqrRSREGJTMRBouYlCKO5Kpey5HQoCd7OeBEzXRoQ5wc4
 iHQECHUksDCmb3ms8fjQTf9t8PMumkyZIvd3RM/5g3lDueDq+uc3RD35JO4r0d/hVCirq1cl603
 Q53z25ZvuO92snV+IAZbv9AM4aeVdA1uQmeTwvksl2g9unizdfTANd5Ayhh4M3o93ICU3x9pq11
 rU4Oc6f9GdhM2McOAVxGVL/01hlFtlyuqQ6DFJkbqH6tQWG62ts0CRsSnxc/ZY9rmihHOi+ozyO
 e0YcA0wSnH2gndXScF2J7Gezu4rPuW79SKsSVSkB9WYcp7kuvIRoA73Dbut/uz/gOze82xhO/m+
 h8mSK7bqxRIIoBm1kbQ==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acce192 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7d_QaK0HgB4quCyenD8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: vIOgq7zWLtdQuBOTa1esMXvOIwsnXdkY
X-Proofpoint-GUID: vIOgq7zWLtdQuBOTa1esMXvOIwsnXdkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord has a new MDSS 12.1 revision with DPU 1499A and two independent,
DP-only display interface controllers (no DSI), which no existing
schema describes. Add a dedicated qcom,nord-mdss binding to document.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++++++++
 1 file changed, 396 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
new file mode 100644
index 000000000000..abd80dae4e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
@@ -0,0 +1,396 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord display subsystem (MDSS)
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  Nord display subsystem consists of MDSS (display controller), DPU 1499A
+  (display processing unit), and display interface controllers (DP only, no DSI).
+  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,nord-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,nord-dp
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,nord-dp-phy
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-dispcc.h>
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,nord-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                 <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+        resets = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        interrupts = <GIC_SPI 930 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu_1 0x3e0 0x2>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,nord-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x3000>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&nwgcc NW_GCC_DISP_0_HF_AXI_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "nrt_bus", "iface", "lut", "core", "vsync";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf4_out: endpoint {
+                        remote-endpoint = <&mdss_dp1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+
+                opp-710000000 {
+                    opp-hz = /bits/ 64 <710000000>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>;
+                };
+            };
+        };
+
+        displayport-controller@af54000 {
+            compatible = "qcom,nord-dp";
+
+            reg = <0xaf54000 0x200>,
+                  <0xaf54200 0x200>,
+                  <0xaf55000 0xc00>,
+                  <0xaf56000 0x400>,
+                  <0xaf57000 0x400>,
+                  <0xaf58000 0x400>,
+                  <0xaf59000 0x400>,
+                  <0xaf5a000 0x600>,
+                  <0xaf5b000 0x600>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+            clock-names = "core_iface", "core_aux",
+                          "ctrl_link", "ctrl_link_iface",
+                          "stream_pixel", "stream_1_pixel",
+                          "stream_2_pixel", "stream_3_pixel";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+            assigned-clock-parents = <&dp0_phy 0>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>,
+                                     <&dp0_phy 1>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+
+            phys = <&dp0_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp0_out: endpoint { };
+                };
+            };
+
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        displayport-controller@af5c000 {
+            compatible = "qcom,nord-dp";
+
+            reg = <0xaf5c000 0x200>,
+                  <0xaf5c200 0x200>,
+                  <0xaf5d000 0xc00>,
+                  <0xaf5e000 0x400>,
+                  <0xaf5f000 0x400>,
+                  <0xaf60000 0x400>,
+                  <0xaf61000 0x400>,
+                  <0xaf62000 0x600>,
+                  <0xaf63000 0x600>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK>;
+            clock-names = "core_iface", "core_aux",
+                          "ctrl_link", "ctrl_link_iface",
+                          "stream_pixel", "stream_1_pixel",
+                          "stream_2_pixel", "stream_3_pixel";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+                              <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+            assigned-clock-parents = <&dp1_phy 0>,
+                                     <&dp1_phy 1>,
+                                     <&dp1_phy 1>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <13>;
+
+            phys = <&dp1_phy>;
+            phy-names = "dp";
+
+            operating-points-v2 = <&dp1_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            #sound-dai-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp1_in: endpoint {
+                        remote-endpoint = <&dpu_intf4_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp1_out: endpoint { };
+                };
+            };
+
+            dp1_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dp0_phy: phy@fc3a00 {
+            compatible = "qcom,nord-dp-phy";
+
+            reg = <0xfc3a00 0x1d0>,
+                  <0xfc3200 0x128>,
+                  <0xfc3600 0x128>,
+                  <0xfc3000 0x200>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&tcsrcc TCSR_DP_TX_0_CLKREF_EN>;
+            clock-names = "aux", "cfg_ahb", "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            power-domains = <&rpmhpd RPMHPD_MX>;
+        };
+
+        dp1_phy: phy@fc6a00 {
+            compatible = "qcom,nord-dp-phy";
+
+            reg = <0xfc6a00 0x200>,
+                  <0xfc6200 0xd0>,
+                  <0xfc6600 0xd0>,
+                  <0xfc6000 0x1c8>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&tcsrcc TCSR_DP_TX_1_CLKREF_EN>;
+            clock-names = "aux", "cfg_ahb", "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            power-domains = <&rpmhpd RPMHPD_MX>;
+        };
+    };

-- 
2.34.1

