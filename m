Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249D4854EC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390883; cv=none; b=Dr+8oT8kBSfqhq7MrVI2t96encY+hnucYfsd/tmzt4u+zaaETnBTGHQTC29SRfPSYoSG2yB1t0ttYZ0NeoYRRqfaDnSuoGBa04r8hEl4y49VtQLcumzsA96iNKnoIU1cvUqwEOt98zLT7N7F/wD9jVbZrl2kYpCGq9tb0reELQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390883; c=relaxed/simple;
	bh=emTQjKtF958VuRYhFu2t9A64DPRu8dA2BOz/r6vU5yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLO5xuDpBQJSxVHrjlpdvUKU86BHb75lTH3liqX53qxn+WlPxoWOcBlK/Q+7HCHYfe+7y4G6wtNixFoZ5MXTrTW3UV8+PgJ8284YIlMwRv+6x8xteydx8wN9x+qlCjqXKyRih0Wv7pr3EWIronz9BQei3qlqdC/1D3zoQtAtHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lyCgRki6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZbXoY0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lyCgRki6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZbXoY0A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Z7A3588187
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=; b=lyCgRki6e0lUGktd
	yOtDT/frP3tsimy95ST03kDn1/kxwUKrg37b30xTJjEVicA2/2nERpECgbAlxFxV
	RLrZwh1yqHGIq66ouWCrCQBNl4FcKU8d8lBxSeO11tEyiMIMJ1jd1oSONrEPTbZl
	YTgz1SUVVc0GWUEmi8X9WjDlsO3U7TB0KE+PrKZC31xo2Vv7xh57hQispjMEBKr0
	MkPDUp2ncKrBulrkFo2F8p6Cc2BQa+cCfHc7nrc53vwuqpXJGRRWW4JBRt4KpvEW
	E4VM98n4tywJYX8WqrvGp4oldF6kxwNEgPl9Q+QvLafKd1dzKg7QX48hk097dymj
	uDBjMg==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8q12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:01:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f8ab159abso4211753d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390881; x=1789995681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=;
        b=YZbXoY0A2HRE6QeFrmR8C9nw94dy2pEZT5LyhbdOAa6b8Tx5uFP3TLDiogd+z6DS7L
         rx3RPRQUxNICZZeznCg9l6dixmQxC5N18fsHfiSwgfiZ+0JZ1sS7nhqvj0D62UE59MyB
         t+I6RJKmiSWaQpI/Mkv7lEjewlGXM1+/9xL8FiVT59tx/3EW8QdYRzZHV7V1O3UPDyJx
         u3XUw+QyBa7ybw7Q0vEgU77jpNEa2PQ0bNqDH9lg+frCXeSKs9Qmn15SO3WbGUrXrR2z
         1W4xXGQE1iNA3y4m9hxLWfmBWQQ2uXIklHp1OBa3Z78YtgWaOlCYyDmw+qfAsj+nApCv
         nvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390881; x=1789995681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRz6VHQGiykBa0i3ogC19Dh3CgFydt4OqqNuW0NHehk=;
        b=RZqa6hAOr5LxlMLaYzWJRgIhfnYlkGinp3aeEFq9Q6hPnstWd3dCs2Wc/BpDZCeJZj
         3SpYcMHFha+VwJY2RRQ+yJ5Zk0M6rQI2MmPEolwTdSe5sR9n3QPHI2BmVWyrj3znMKkw
         lrPdjcLqrDiwI0rF2Dgiv7jd/CBAt9s685lTfyQnnW1+3fMo8XwE1NxPfm+fJnQGN8XU
         dRuzdJKLM6AXNjKZFXqMolmMYV7RoQ/9EPZjz3040Iv2DFgQsEQxT0rSlVIAIvmsZPCe
         rLrPiP+xiVTuPB6CSIsbpj7Vmqw9p93582rLMvh391LypNPitrhKb/iAMY39av2d3rMU
         +I+Q==
X-Forwarded-Encrypted: i=1; AKwUvBysmuaL8Rv0Z03tZ4bKbHGx4kVy/LVij8Mc+d2S6pEGg1+rbAaqCX7eN+7caa+00J+2DRx+c4gdAf0CSrI=@vger.kernel.org
X-Gm-Message-State: AFuF++m+MpPxkT4eT5e0X6ihHIVSRE8XnjpbHj49Wne9EVKuyEa8hjHl
	nQlbJhjoxasbRDwJT7uSlRUeViPuV3fblCanRgaNVYNcFnr+7gkla8z9Qn3j+HWmdzmlYhlw8jl
	i7Vzpk+6AoFgvKwrmhsF/wrxTyFfOExpdeysEntSCoJ+XsFtahIP4O87gySzWIUI36mCn09o2+y
	2zGA==
X-Gm-Gg: AYBFou2w+S1esf3yCMZ7uWSgY0lzN0rMKdnhBjVr0eL8lB8JzeuQeYXY53YBxEcNm/4
	WA6tfZCTHdvFIKcyL7kXlvelMwFzSzqtMGu5QJ5XtezR7//r2DCjIJFcwC8TeTXWK1LIekGgzUz
	8URYqgrSIHArOPGapXTnoIOU9FxbiJIBgLwH8skgfmVVyOA4tvfcDmrzmoSj9xuwP0jKRj/VtCu
	7ZAOuexksUEl/bVMCXL0TgSQc2H0ms1Q3HGS2HSdBrP5zO1nmY2zVqGecKn7BAwIhgxLoEoe4dQ
	vQ7ExAnf8xCOr6volnPjn4kghoathUDdB43F1HNZh/A0N8+xfvyzOPetQServZJhwY3I/JhNiK2
	Xp3RrGkl1qoLcMwmQk0NnvZmkKND8cN/iu6I3gzeHHT77MB+sHu5OFV5h6Lrf0Pp2AlxY2q8c1a
	M=
X-Received: by 2002:a05:690e:4141:b0:66f:c1be:3189 with SMTP id 956f58d0204a3-6714e1bb08emr505402d50.96.1789390878802;
        Mon, 14 Sep 2026 06:01:18 -0700 (PDT)
X-Received: by 2002:a17:903:2442:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2dd6c6e2c10mr51107335ad.10.1789390849810;
        Mon, 14 Sep 2026 06:00:49 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:49 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:25 +0800
Subject: [PATCH 2/5] dt-bindings: media: qcom,maili-iris: Add maili video
 codec binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-2-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=7864;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=emTQjKtF958VuRYhFu2t9A64DPRu8dA2BOz/r6vU5yk=;
 b=yHUXyrdeohNAMUShXLAoxEhjQGHj3fLl2f2QRkLimgobydlk0aqkWasPssOHb1Y96UPFRwkb3
 GCc3OCm5VY/DyxHZbUAVD8a1Z9cvdqBv226fei/qQzkx0pW1+Fr29tj
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7f021 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=4rOvIeOAciRA3S1PgUQA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 0ev4W_GrYGBL7YiJifp1zCzI7DmK4Nlm
X-Proofpoint-ORIG-GUID: 0ev4W_GrYGBL7YiJifp1zCzI7DmK4Nlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfXxAw6Kn6H7Oq+
 VNeMi+Hz2SlDHjYQCh1wXfbHq0Ag4rwAgFfm3vsvT890KN/vpgRyJHMWmKn/xj1jQAoVVnQI7u+
 o27JEtDja27Tb5GQWUDswN37isYJSSyJJ1Th9lXMxLh2yMc9ZoktzxGsM4vVVU240YH0I+akgSI
 n/79Rgq1l1yXqhYIoHTiGZiZXOu1suTzsQt+5ytv4FJY/4wUnbzFQSn86dgGDSJO3B7l7NCCJIq
 Ksau0O6j/u6wheS96MbHFg52WDyxXXB9luceFk1zzfrhyXF53R57kXV+ktMU8OL+G/bKDvcHTka
 qo4x1kTGty4mkYtfghdB5Y0ZIlV3H8Zxv6j+D9NNLd5yXUyDNcSBXt+SjYs5uvbIkA9Mwja1Ony
 vq6382zWY2b+MQ+dMddjNvQ0lcbiswNL01nzHnxKvNToGsVDzLzCmIJf5EpTlUwEVdFoTiz6ZMb
 8lrTedGtY0RSVC84huw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfXx3B8NYhaPNNR
 XdR/r1WQx94HguTZ1luGcYcdy6Xibbz0+1GBUZ6nlJkr7aLy3/dOvdxFn+u5Y2RquQPZn3MbewE
 7ZpZtnkF3VT+k6gMxkAqSr6GxjtokpQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

Add a devicetree binding for the Iris4 video encoder and decoder block
found on the Qualcomm Maili SoC.
Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,maili-iris.yaml | 235 +++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..58d241999824f3cdc85a1d644200be1e4916e324
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,maili-iris.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,maili-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Maili SoC Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Maili SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-iris
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
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
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+  iommus:
+    maxItems: 4
+
+  dma-coherent: true
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
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
+    #include <dt-bindings/clock/qcom,maili-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,maili-iris";
+        reg = <0x02000000 0xf0000>;
+
+        interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0_CLK>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+                  <&videocc VIDEO_CC_MVS0B_CLK>,
+                  <&videocc VIDEO_CC_MVS0_VPP0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0";
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
+                        <&videocc VIDEO_CC_MVS0_VPP0_GDSC>;
+        power-domain-names = "venus",
+                              "vcodec0",
+                              "mxc",
+                              "mmcx",
+                              "vpp0";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                  <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+                  <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xffc00000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1540 0x0000>,
+                      <&apps_smmu 0x1620 0x0000>,
+                      <&apps_smmu 0x1544 0x0000>;
+            iommu-ranges = <0x25800000 0xda400000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1543 0x0000>;
+        };
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d2>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 800000000 1260000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l3>;
+            };
+        };
+    };

-- 
2.43.0

