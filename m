Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C01436BC0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141054; cv=none; b=H/d725zyvkj7DS/TTpv7eO2QIkYj6TA1+8+6NEQfRqHl1nwgKawuRNNH2ZGHLJyyqtHevEF3sYyknPho1Stu8z8nkhWm2xcX7O43Xq2jLtWd20grnHt6iqE3goAOTpRIkdBGZxfadhgP0CaaSzutuB+j2j22VmoQxNNSrOg/V2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141054; c=relaxed/simple;
	bh=l4cRMebOt7WuiPKCbPWufOoR6jRF3gde+e7GFzqF7zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mG9LyypTqNNKnNx9D4bWx2FtZ9dSArSihh9EEdP19pnijhapYq9QobcZATxQuRQ0T7Grudr69APVf719RjYCB+2NGfrex7Ph6IVne/w1vY0oE6yyXcc8Yr/0GyVNvrUmfHQBdjUhPGD7d0whik/PZFUinBdFdSLA5fs2qxBGkz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYTnV2H/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnWFJtef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYTnV2H/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnWFJtef"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEluA93748615
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0/+fVvhOXF30n3qDQqRZypRi/vvshor5bgJQEsTRIo=; b=KYTnV2H/WDw8kR6X
	0fCxw0dQ0glmb3+7ZZhP4iUYGI91IcuQ7lG7wzU2pVoDrWky/SrPjfsID8E2Njay
	EZIBRzGq8FB89e1jEVhB48fhf5WPIDWh02WCzFg/8nL+GJXSyOwRuxTbk2jaQ9q1
	8VwiKKpCGAPzgv/CJjfW4gZl0dldAjfRxMMW3d+GZPgQE+T9AKNJ+cOhlgHE8dmt
	DjJU78e4Ph4AcmtprVeZo4ebIIybMealRF2wB4WWdGCTCHTRdF/6R4rQCk3d/ZK8
	3SDO6AFceYSywWSzRaiQR2LTgIb03drBLgxO8QJCo8JU1XNLqsqBHKpjftAnuR88
	quKSDQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729kfgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:32 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-467c2c754f8so602356fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141051; x=1789745851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0/+fVvhOXF30n3qDQqRZypRi/vvshor5bgJQEsTRIo=;
        b=QnWFJtef/WgE4ZJOdxhwOAvdlL9rJKfv4nn0TdBlHVZHwPxq67EFVVh6WLmlrOGi31
         S131cUp/V5Tps4W4O7s5d+LRVCJjJIuvT767IX+zKtSdlQs8J8yGbg+eoXiRfsEmbNoU
         38XfCz+AEchTzOR/1NQIQRNmr59+OAvIJb1eGXcPPBVOgiayvALSStR0wDTbHS5lctSM
         Dhng8glJEqAHWQDUgf8KXeLJAEkfwYeq+AftXwP1IWFkNje3mMCIWt64IeO+s3hg2e7j
         NDn2fCHrHVpt325UnA6806A+dSX+WxcGhM6bbIAvwzQU9A2sPRQ/r0FA9ddUe6xKnwOV
         I80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141052; x=1789745852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0/+fVvhOXF30n3qDQqRZypRi/vvshor5bgJQEsTRIo=;
        b=kDTfN7GWCW3H5xg6YfPUrlNfzab3XKjcOWO/f/QUR5SEwNYW5P8QDyG26qlCt/CsSa
         o6leWIZ+l2m0feMH7Z5knYzK32u6gW0zgMNse+X6AAvPS/BpOLYM3rZZiM1Kpm19139T
         ykw4Tm8cRkrFHq0+7w/QHDB8Dgw8fgbYwQFQywy/CWMW4JHYAZ6cV9faQ4ajez7nyStt
         Ii05JhYYeZjjdCWZRhuMpO0/8O/7zZrf4FRRtui0cbQbSnWivCPHMCQbNDAF3PcPJpVt
         +XIBqjdx/rZqhb9ODdqguf2QhnqZVec9/YOl6oynoLiJn3gu71kobNPWUusfkJoFgIcu
         l2Ew==
X-Forwarded-Encrypted: i=1; AKwUvBz2efAYWP+chVfQKplHZGuAlYWaveL1l8bs6al5sfwbNt2ytMpjnLFTlI8rqqsOWg7qczOrQl5ZtYuntjg=@vger.kernel.org
X-Gm-Message-State: AFuF++kFz50Pjw+bKaX89AOSf/hlCHkoOhZ7YamKwyAL2sojjSKa7V7P
	WqNkYXtgkKa9UwUVlKg0jep2zMPTuy1sOLVMmaNldU4Rz7VREocDljAir3CU0Tr1aPgz61c2gOM
	JSEemXhlqYfdUFbQHGBM8s/3lEGC1oJmGoTIHzzoggI+sI83U225nNsoDHuy3Xeal9vE=
X-Gm-Gg: AYBFou2YoUi2bF9g5NbBVmOnwRwVf39baGU8+oXcKAI8itXlvSKN3CQXj1Sh6sk8fFw
	XzsdDh50+v8RgHsiQNLU3UqsGv5MyCfHV0fAKjoS6eIM4A4cJqZlVL5eBuHpui7rkFTJhpfLpW0
	GISTxlPBt5d4zW/cZQoj8cauHenFdGiFR5x7K5k5bKOT+CoaQCQbx1cK2NC5KDCfXLMVStra+Y4
	qIazVLWKYEyKs/vEplkwVVF3wH2ewZiwFJXOJMgP/vo0gsl54L+YHi8z2rz0HziW0/DdonlOF2w
	fWiqHiVfNmhOrgUi/aw+9Jl4erao7NVWLY4oIqea4T6uoxm9v7v2qFJqjRUOcvFs1hy/LtKhsUk
	UxUXgTKbC2g5JQidnXNApEnHNgeU=
X-Received: by 2002:a05:6870:a0b5:b0:475:e0a7:9f34 with SMTP id 586e51a60fabf-47de9967df3mr3841105fac.34.1789141051476;
        Fri, 11 Sep 2026 08:37:31 -0700 (PDT)
X-Received: by 2002:a05:6870:a0b5:b0:475:e0a7:9f34 with SMTP id 586e51a60fabf-47de9967df3mr3841081fac.34.1789141051072;
        Fri, 11 Sep 2026 08:37:31 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:34 +0530
Subject: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=3375;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=v6qbb59cSCOFYZp+/jT5/t4KEEFywV4AJkLRBZh12sg=;
 b=VthrLSgYFzt0GpHboC0CLVbmH++is8PI/ePpXkxK0R4IJmY1Nk3ZPzxHZowpzVvWqG0/fFN9B
 AtF5j8uVhD5BJvc8A5vnxBD/fKNGfqlsvf7DTpwIBlhQnVqil92MGQb
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX4L4NA0azQQy1
 OXrnlsRJkLfcETzm1trNUL9Vc1B0crkCSEelHK4XdLXGEPlI2lgOknPrKvIhHnxxvRTC4rr7Bl/
 WdyEPt8GikIFgrloApq9yRtxDIeqMWI=
X-Proofpoint-GUID: vQRuyQvgQj3uv9YsQsEhdnY59u9UtwtM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXyIKH9i23X1Pa
 J10ddQj4RhEC9nDNZ/eQk9Epx5+6juM0Z9H+rkbHmmLo3VPbgtV6Pa1PsxUQlZUFm4SFuYfeMgt
 S6eWN7QY59va3djMyXmPEZOXFCKUduzBOYOXe0HyQH0ygo8Hss95bLWFV82z3OSK/D+k9touSlc
 jR4ftlOxwyc199sI1QcENN1dQ635qnSkBe+IG/w62O9fUULM8rbFCF8q28PeWYIUyM5G0cyHW3S
 Wt2xjl7BwALygiT/vd3iFtT4SDHPD1EAqGa472sxLJtlucNL/R3dh21ajvnNjcpcv/t/vFeiVgh
 n3o88itmqacu7JblOfIMq1ZcJgMkCmRLzHwKgJ9W+L3hWUp/a6lm741yvPqQsBwh7PojJgDrjli
 3K23GKXUA5lzTdUonEqJz0u5AVLP2reHabtf/e+efDFIeXRyq/ijiZqQRxi//OkeZVumvZhYEZv
 OYocpSIDNDi/iS8cDuQ==
X-Proofpoint-ORIG-GUID: vQRuyQvgQj3uv9YsQsEhdnY59u9UtwtM
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa4203c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=DZBPq5aedYDaYU3_3SAA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the binding for the display subsystem (MDSS) found on the Qualcomm
Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
controllers.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
new file mode 100644
index 000000000000..0b0cacdca9db
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
@@ -0,0 +1,98 @@
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
+    #include <dt-bindings/clock/qcom,dispcc-nord.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,nord-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+        power-domains = <&dispcc_gdsc>;
+        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISPCC_MDSS_MDP_CLK>;
+        clock-names = "iface", "bus", "core";
+        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        iommus = <&apps_smmu 0x800 0x420>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };

-- 
2.34.1

