Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253733EB7FE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621284; cv=none; b=qiKjfWEdWHS3NmVEwv6iQNO1wofPiY7YofwU1RmaLP1JY82o+VOjihV6BHPLP97cKIXKwnlqXaq9ZRI+2cOZZ8TqXA9Vx3Naql8Ps75mO0/MlMg+6cj4BYGk6WKnnrHnU5BLkdmgUwajqwoPGTInmvUAn1Hqyw9WGhaPANpcqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621284; c=relaxed/simple;
	bh=AEn1qZIvtYsDtYW9Jo2rMgEyNXr2DDHQTheOu69T+/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSeP3AoZBOwfp2HN1yrAwgK7iEbT9Noz7SwRnAG4YzDMyAwGqkpmBZc84BtGZCwiCVYb22ihGTEaYygdwijV1y/0i0TeQYhWf2Y8SsFZK6/W0OutnciDxsr6h+RoFI3FwPxKbHgCS+DO7HJXx1l/lKRn3dPd6pvPmzkloDJMBgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ7COhJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bb8kr1oC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ7COhJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bb8kr1oC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2Gron1239351
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BenidIYy78D5ORho3gGl03C9Pj+mlKVSX0JJ7xNJ3Fw=; b=KZ7COhJJqb47T6tY
	cQ4ixBaqvBl6F4bQPIE1+5LIoZEhJMRCsMmYtWK28Y2LHVHws52JlmY/LCacLWg9
	/+einPn9dugMVb60wA2LJfaNnlTNZRjxaL9vq1o8p2hTVy95TMJpRyipR8ypMErw
	L8pxlt+bUjN5n06gNMGxUP6nBPSM8RIpsAKdTbgGEHNvjZEfO4tEr8yyT5DmuLeN
	kb8EH9TlvHe+MFx6alGlpL0RqNptcB+cm5aXayHH/OAKnlqv3uH6YCeOAskmqR7T
	yPp+QdYFWe3pTVojXr4bcaGRvJDY3M8uGVCQas+2LfDdJpDs5XnHRrmudjAGJG45
	9v/VAA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m0hep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:01:22 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-48296f34f1dso404235fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621281; x=1790226081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BenidIYy78D5ORho3gGl03C9Pj+mlKVSX0JJ7xNJ3Fw=;
        b=bb8kr1oCVlbFvuPmYwx5Z8kxmD0EpaMbUkmHYLsCZLYQ9fHt52eiuseIjt2OBPjTCy
         9Gl6S/qnCsMCD1Pye6gEQq2UM0Ww39UT719H7Fi4joqOLCbxS20TcI9CYdTfi10LBtJI
         gFfE31vCKRfc6K8/chsPZqBmb9815Ef43xKv6a4BDjuddOV0Q8IKMb5qCh4RoNSBXkkf
         k8FriHcJjRLFhHV79s03hN+z1AiXWWh5TxQ1QoqP3MxcLQMv4/JGCRANbiimLbmDvH1K
         kgres4Hxh9fLOgOgzKx4FhgPrDk7kPWSXcXQpMuEaqKE7y2ZLFe0AQijC65IrBvoIDOR
         fJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621281; x=1790226081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BenidIYy78D5ORho3gGl03C9Pj+mlKVSX0JJ7xNJ3Fw=;
        b=Ic2tnVW2/ucgFXMTSAjYFqV+d5K+S6agdLcCiIxGeV4i0DSFeiMS6cXX/7J7AlPtd5
         pa3Ay2JNa56FGnK5fxJIfR5K0eHky1vj5144vQ7uf/g1Ek7ZR9VkN6FfmwcGdHzYHXu+
         8lQ0ZbKpRL0iHzD3v+DCc4gtnEqD1om9muw1BcA6giJ30/lWbXYCcZEOfEpSv0MwxbnY
         4DjC1c8vhVpSDdLU8J/6Me/k08Wfsut98Wry7Wjl069uPriYP/xqV/O1PxIO3NPYTqEx
         m76HViCKzA/bGMNg0/3z89ogbSvRZMVqxJoPfHPKULnIw1kNgGZwwx699O0UuM6kmPbH
         Rjjw==
X-Forwarded-Encrypted: i=1; AKwUvBzGZE2fVcXdGeJPbHX4G1B4sa4IMby57FuIIsdFAKncjJAr5CvsTNH9RqEn+z2PC97BXuBBYt1WudQpXIs=@vger.kernel.org
X-Gm-Message-State: AFuF++my6aJ1AcWA6AiIj/hYChzvIwvgd+yA+kQcgSEt0z6kYGub29bF
	RSCeCeca0vybPIvY71OaRSEhd3/ldSteM5sxkYV7q1lCcGmfwBu/uLGL7XX87zvy4/6hJdjUAIR
	4wfNPYkTZgC6W6Y4hHx1jtdVzI1vru6/f+prm5+JkKkmpLOerLqDkDLinL9V6y65e2s0=
X-Gm-Gg: AYBFou3L0OkXLjj3Cc+cJ0ZlyX90PPrISR6SSgMbr9Vqqb7mV61smleaoQ14uWSXZ8D
	8bpLEzIigY9oPp07rsFOFP/6LfD6wBjb7VbpWT/ex9l+NelVoZthBejbhwjKNup5p4bCRSIUZBJ
	s89iFZ0ZRZOIe4IhJai1X7J7tACI93pSC1oeGu+HvvleWZgvmMGUoYlqT907lS5eLcS+j96UEQS
	xMM/Zi/aUXsuXwkTF+LuxuD2x4UB/zro3cAoBClm/w46DB6VkHMQCsrHlEIUdRb+sDhKsZy9acA
	avGhJcPGkut3CXB0IZRnUnFbmwDawNKr5XmvHPDZfEeqexE4xZ1JQ6mniIZRcGQ0XOo2cJ9Vyzl
	1eoE74OgOEUYeLTI5zESV8LXfC7IT3QKPgQ==
X-Received: by 2002:a05:6820:4dea:b0:6b7:8415:d77d with SMTP id 006d021491bc7-6c7d27e0047mr5403610eaf.40.1789621281001;
        Wed, 16 Sep 2026 22:01:21 -0700 (PDT)
X-Received: by 2002:a05:6820:4dea:b0:6b7:8415:d77d with SMTP id 006d021491bc7-6c7d27e0047mr5403585eaf.40.1789621280539;
        Wed, 16 Sep 2026 22:01:20 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:01:20 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:20 +0530
Subject: [PATCH v11 1/9] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=10123;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AEn1qZIvtYsDtYW9Jo2rMgEyNXr2DDHQTheOu69T+/8=;
 b=wH4GJlnxeys4KCqT3HAYrZSFaR2J34Vlv5vvYpqGef8h8if9qJPqgDElcxfYWHFr/srgQMBCS
 usMygibwXm4CgBB/sMibCANGrbRM+G6StbJrwhFdo2ellKKTpZLxhQM
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aab7422 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dj5hHLeW_VTS2ukcrJ0A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: F2oRJVtBkaVcABkI09XNcVGnacNJau9f
X-Proofpoint-ORIG-GUID: F2oRJVtBkaVcABkI09XNcVGnacNJau9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfXzxL20iNweb0E
 iGnpdVcjjpkjOyFfxhwgo4eH6k4b8DTxJviBJRadZQP/ysGJlLMPwCDOMRebexFG1Z9sGgNVCdG
 8NCgtKsJwjwbvzEm42VFsEWk20J6FtB7P3Vj6OwqrS5cwD/EpEOzxPKrhWpwWUHZQuHecEqIXdq
 6AZMy/gk4JGP68KdGUug37rdMm/L9vuES7mjzMPzzXU14RcB9FCItaZtj1LdsY2URfdXy1BRMIs
 0MDzSD5UuxVItjitqbPJvuSWmt0SJCz9bNdAIMlHVRtl/NEu7RJlPC7t96W4eXtGSBs9apEn2zF
 T5uQbrDrAV8kOti0GcMyjCl5Xe3ahrYP0CfotDlSXXHXB1Kbn1sndBZ3/9wb9XnAyePSKCiCu+W
 ojF3C+PX09O/vH2ut+jZUuMLqg5wbiMR0ifaaBQxMzgkacwsPwy+FVS3RX69o/5YgsETRk7u2qj
 E0sueh2alMbBTLjcoEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfXx1ikoqJ1KpjD
 meWoqOJcJ6wTNeQ8VF4I0yqQrM0QsBMyPSdeVueJggz3nxCTHmadp8bFTiRA8DBSnSIIgpbbGcJ
 xvI7x2yI7QeHCTy/0JBtfKdH4fnLC9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170063

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence. The
current maxItems constraints for clocks, power-domains and non-pixel
iommus in the common venus schema were sized for platforms available at
the time of authoring. The glymur platform introduces a dual core
architecture that requires more clocks and power domains, exceeding these
limits. Raise maxItems for clocks, clock-names, power-domains,
power-domain-names and non-pixel iommus to accommodate glymur platform.
The glymur platform specific schema have fixed constraints for these
properties, so the common schema only acts as an upper bound. Since the
common schema now only acts as an upper bound, add explicit maxItems
overrides for the non-pixel iommus in the qcom,sm8550-iris and
qcom,sm8750-iris schemas to keep the fixed constraints as before.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 218 +++++++++++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   6 +
 .../bindings/media/qcom,sm8750-iris.yaml           |   6 +
 .../bindings/media/qcom,venus-common.yaml          |  11 +-
 4 files changed, 236 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..de4792f3b658
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec0_iface
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec1_iface
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 3
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: core_bus
+      - const: vcodec0_bus
+      - const: core
+      - const: vcodec0_core
+      - const: vcodec1_bus
+      - const: vcodec1_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "core_iface",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec0_iface",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec1_iface",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0c_clk_ares>,
+                 <&gcc_video_axi0_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "core_bus",
+                      "vcodec0_bus",
+                      "core",
+                      "vcodec0_core",
+                      "vcodec1_bus",
+                      "vcodec1_core";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffe00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>,
+                     <&apps_smmu 0x1944 0x0000>,
+                     <&apps_smmu 0x19e0 0x0000>;
+            iommu-ranges = <0x25800000 0xda600000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1943 0x0000>;
+        };
+
+        video-firmware {
+            iommus = <&apps_smmu 0x19e2 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cf..81d35be565f9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -81,6 +81,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   dma-coherent: true
 
   memory-region:
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index b6d5ded1aae6..6c1ed1b9fdde 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -43,6 +43,12 @@ properties:
   iommus:
     maxItems: 2
 
+  non-pixel:
+    type: object
+    properties:
+      iommus:
+        maxItems: 1
+
   operating-points-v2: true
   opp-table:
     type: object
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028..03b8b8992624 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 9
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -64,7 +64,8 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
         maxItems: 1
     required:

-- 
2.34.1

