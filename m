Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B8A3DAAC0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705755; cv=none; b=Evla+pZ0v6btzZSLD1N/QtQurKLf330VILNW6Ne6vjgltrEghMn25MfBwU/qATLEfOcnpZZf5doDwz0PS2xg1t7H0rhBju+HMZ0REDEuY7jDVGPIxdGJdXcQBHKfbBBV4ZgX5wW82KcvNIGUI0jSMzf2u7Bpqo3rIx9bjqBSQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705755; c=relaxed/simple;
	bh=54FLL9iRc8kj3te2Nv7oowlynIqip7DIG+tP9u5qIsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zu/8wkWnqljBqz65pUQ6ygW/si/22tEvycMPXtk/7ADJ8+tvv72BMcdYg+7bZhxbt76Xf+kMvfU1Ig7H9mvBYlPoIWqMw3LwL409GHhT6XGa5Y2PKLtRysjB/h6H201xlv9KAAJJWPHXFFjNbFj4qwul/YYLfvJIjagFxRQUDYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftyLc6Rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V103Z0Ul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftyLc6Rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V103Z0Ul"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UItu457244
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsD6XZOf+vZtB4mF6qxwR1zn9GbLPaac34Hj4VScJ6M=; b=ftyLc6RqyZHdvF4G
	+2elqaADBfpTwsmBIAc273vkfhI2PFH3dhdaDMbjQLhn6Rsh6Mw2t9CnnGf3UgMj
	owW0YSRDt0hhycIulNuIqThsiwH19PX4hF+LBqNk1/803Xt4onLoVlY6MahSVaAD
	bl3tBnjgt/Ug3XWePcLD3fYpxea7K32IJohE+3wbW6910D+je2Al79iMU5pZnpr1
	8FiHPguJqNQvtFMhX1we/GuHXffFh0vYwh4+RRfP8C6zgjEPfoZdcK/y6cXFtOmT
	Hzyy22cnM6Y8/BMD1ENuCtpSjPItywLeEIMmUF67BYfaC4+d/zY8gNEtFx7h2Xy7
	8jVEEA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpru7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1994658b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705751; x=1790310551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsD6XZOf+vZtB4mF6qxwR1zn9GbLPaac34Hj4VScJ6M=;
        b=V103Z0UlWiOmteEolEjRO0hJqmjhAhO8hG6/sq0RlDw5R4xjQZs7RZNuLRwbGUalby
         1bfbExoiAgC9/9KIQGTzc3O3VX/sbN6Rtcg9XZD12vqNVA2EBn+sioidD9zeOd9E82GH
         50U2OWKD/WVm5Rd15YBXClIbv/31uSV6Bn9PAqxBxSV2DF+V132XYwh6wL/NPE3TNhj2
         Bpsr2lcJ2YJ8LaXPijVnpAhKSd/jFIdaFPFKt7GaxrrmN9q29b/OuyJAEitIQOhXh73u
         B1KyrAJL4e3d0JmsUDhZB1sQmb8s0anWEaI0l79fxIPzh5XFM7jzUmRfnV/hLoCyevnA
         26vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705751; x=1790310551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsD6XZOf+vZtB4mF6qxwR1zn9GbLPaac34Hj4VScJ6M=;
        b=Xoyp5b2eiCubd+2YApWjSiJ0+K7URfjkTtaJgMwCFn0BMqZJiUFip4vxrdwHqPGeCw
         Gk/gqU5iO+ZHHSvQ5DhrJKNfV3cj3rMmG7EGlgjrzxlfICF9XdEUonzELbT2wVTN06YX
         oGdmPWzsipwc88CAu2qfYvFLhy57Et/xUEHdABZYCG7m/1UiI3UKtxNh8Q7Ov3IMoER0
         7DYYdCtiiMWl3TW95g4xzydUrHJMMaSwAwBhctwzBAPzQMZj/dwTvrVMzExqIJqE9Ewj
         B5owwyrz/6BpWF8ISIPrjmZQV1J3Ohx3E9QHsQ1L6f5JAALXbGbjQ++OW7qcDNARvBFa
         01cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMh9I8zdOe8a1aniG9Hq/UlVYmacaD7tbomKDIRyg1Z8NZp8mQV3QUAYZHOs7Xlqxfqv/c/t0eXNEa15g=@vger.kernel.org
X-Gm-Message-State: AFuF++lpmA9XNGOIHBDQ9OuRFn+poXcWRr1935mstlEpb1owvh2Cw+E+
	VYC3Hnwc0Jpf13ABnLEcT3WwzKvpZnB0H0J+Go4V8Pz+s5LVD44NuEcmP2jRiG2n+ndyHWjLDw6
	8OQOFEh7rVLmCaG1rabd+nBzcy3sdxGNddf3VSYFYs6owLeXG2R3SFOAMr19ireYabX4=
X-Gm-Gg: AYBFou10Nm9iMW2ff16Z8uhrUtVzfHb8LPdOiFg0YcVJDQwZ1nmFHRXYk9j80z/9Sbd
	o+uPw3KARuJeXvB3ywqgaWpw9O2cp8WR4nGkwDauJKSb8V6NSOhgRHdpRCppuKcS4QP5yNTZxlI
	EreD1LieT8QzdWdKI034lKavpDwU/IZg2y7llcga/pJb+EyzWPLUdPHPTBli4B4HCKsFR3TfmRB
	2NaACMftw7fTbSdwPDlTaAJzDToIhSxwcu8tTP6H/QYu0vQTYTP5N/9rpsV/C9vL1vTET9+Rltx
	YnHxxX67vnqeg0X1YK8U+Wtoga1vBMMfjkFGt+pgIZ3GCikth1l/8gCw6Jnzx79MK+x8JVI+H1j
	H9VSR7diOnPcbmSqSmhLgaU4CXsBpy2Q=
X-Received: by 2002:a05:6a20:20c3:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3dd72522a1dmr8042906637.9.1789705751055;
        Thu, 17 Sep 2026 21:29:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:20c3:b0:3db:4bf:53fc with SMTP id adf61e73a8af0-3dd72522a1dmr8042879637.9.1789705750625;
        Thu, 17 Sep 2026 21:29:10 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:29:10 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:28:41 +0800
Subject: [PATCH 2/6] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-add_iris_for_hawi-v1-2-ac60fd15c98b@oss.qualcomm.com>
References: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
In-Reply-To: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=9201;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=54FLL9iRc8kj3te2Nv7oowlynIqip7DIG+tP9u5qIsA=;
 b=Tb/aXX0HfacRi1ExLolgr0K+3KJ+rLWF4/UpXdtHthzP690a+hSDh1QE2PxW3j1vdLqpyA6ev
 nTUzqX75CxVBm8gAb67Rn4c5rnHmwF9dHcRVEcId7ZLeknwH4fl9qH8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX1znUpX8kwQKx
 8K+SlRUS6+o/YJYsW6d5N0Nv1Bx0jNuPUjx8y4OINRUSuLF/NoD1EXamAayn43gNedsxUu3v4e6
 lPjgp5Jp0iI0j9fvXr2JTJN6HdpT++IVpmtQAznqbbLymLWtFRXnWlkqnRZOqLXBBqe5MW8KAXj
 rkpx/jduq7Keo9jY/2iovN6Db7QcO+l77zva5N6y0vUWkmoSKLKpzhKnbFkfs5moQ1aWQ41r6QR
 fMxAIfcrqdCpMrtDoD78RZaE70wByXf21+3YcaOB/W6fgUEGUuYA0ElH2V+gAR1/PuD2E+E+2+3
 oew9JuJ7p9F4u0HTfx4hfHdFZEo6j15MH1A7E9rRk4WhpdOLh+edZvxw4OWAVoSUI+p4nSa+mrH
 xkDz6lviK/gRunqU9BpYuREHbO+G8hAs+ZzpExu31TpN47NLQf+lWfwEgNJJWj4WfQnIYv9ev/U
 YehRsiDTDA5xSFpRyFQ==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aacbe17 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z9fkTJdRl1zmM-sw7WcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NiBTYWx0ZWRfX19aASZYAm3Zt
 ziPSU5gytJ2JzaiQ78gewkrbemU+ah8BkcMRFL7dkS0MEJRbJOxBeJlRmq5BbMgHBek7p2Tl1ig
 ExCdZyOCnn27ODt7So2gScmBmt73Ztg=
X-Proofpoint-ORIG-GUID: zKYq9NVeTeEa3-4nVaQiC9d9CeY11EoU
X-Proofpoint-GUID: zKYq9NVeTeEa3-4nVaQiC9d9CeY11EoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180056

Add a devicetree binding for the Iris5 video encoder and decoder block
found on the Qualcomm Hawi SoC.

Compared to the Iris4 generation, this block has
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 262 +++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..362911c6535c92bdc10b6d92b620d886acf6e502
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-iris.yaml
@@ -0,0 +1,262 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Hawi SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,hawi-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 13
+
+  clock-names:
+    items:
+      - const: iface
+      - const: ifacec
+      - const: core
+      - const: core_freerun
+      - const: core_ctl_freerun
+      - const: core_debug
+      - const: cx_iface
+      - const: vcodec0_core
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_vpp0_vpp1_gating
+      - const: vcodec_apv
+      - const: vcodec_bse
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  power-domains:
+    maxItems: 9
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+      - const: mm-int
+      - const: cx-int
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
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
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,hawi-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&gcc GCC_VIDEO_AXI0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+                 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+                 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+                 <&videocc VIDEO_CC_MVS0A_CLK>,
+                 <&videocc VIDEO_CC_MVS0B_CLK>;
+        clock-names = "iface",
+                      "ifacec",
+                      "core",
+                      "core_freerun",
+                      "core_ctl_freerun",
+                      "core_debug",
+                      "cx_iface",
+                      "vcodec0_core",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_vpp0_vpp1_gating",
+                      "vcodec_apv",
+                      "vcodec_bse";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                          &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+                          &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                              "video-mem";
+
+        memory-region = <&video_mem>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+                        <&videocc VIDEO_CC_MVS0A_GDSC>,
+                        <&videocc VIDEO_CC_MM_INT_GDSC>,
+                        <&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0",
+                              "vpp1",
+                              "apv",
+                              "mm-int",
+                              "cx-int";
+
+        resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                     <&apps_smmu 0x1620 0x0000>,
+                     <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x32000000 0xcdc00000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-150000000 {
+                opp-hz = /bits/ 64 <150000000 150000000 150000000 225000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d2>;
+            };
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-285000000 {
+                opp-hz = /bits/ 64 <285000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs_d0>;
+            };
+
+            opp-311000000 {
+                opp-hz = /bits/ 64 <311000000 338000000 311000000 430000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 557000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 634000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533000000 {
+                opp-hz = /bits/ 64 <533000000 533000000 533000000 782000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 928000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-714000000 {
+                opp-hz = /bits/ 64 <714000000 710000000 667000000 1060000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-826000000 {
+                opp-hz = /bits/ 64 <826000000 710000000 710000000 1170000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

