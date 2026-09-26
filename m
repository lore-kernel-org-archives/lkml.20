Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542238DC6B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404480; cv=none; b=HDSSJ07gXUHlbGlEtnCNIxHc9frNeSlzNfxWm4/bdqMJbxeYYU67/h8vvYdf3h/DRpGL6iYOJk1SuxAIwllsy10Y1jb6j9Oo3mtoayUJdl3zHWj24i+gAGDfTCCwkNSndoQG+CSuGbyjIigK4wTTqLvlO8bD9I+mrPehORbIXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404480; c=relaxed/simple;
	bh=BW03Q4XvOkjro2dFuDlm8xAjUIoin9wCEv9Ej26ALtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOljy7/45CjENmdx9fSejTWrbsFnD5efkQTnPVmjBD5aAtoAfBdKIFV3TuVGYiWvasvBk7+PNvzvz3MhsVGhXxOLmUfYQaqAtjuuLI6j/hjiGbYDdKPeMmqWrESCEDM1rJyeXi5gMFltC++slZQ3jVj4BVDJn6fbYtxBS4xqJQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmJEdFAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsP33Loe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmJEdFAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsP33Loe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6Obfs1949870
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=; b=WmJEdFAaK6qVxXlb
	FoC5SpdYn0LMOL7s0ufLZAqHxMZ1hI3MTbhCsxrvTNEiS9VFMazfso+WIFAkvQZ4
	PMut7lw5FnuncEwCfsOZt6QgdJoe0O9N0VXELwa/+/SNF1a/+4D4uz3VyBwYqCgz
	Tz9S9nwtvecdXR/JEvGq96A/sUssSXh1oWS2ypwsLxiDolw3qH9t7Ys+xNelGgYD
	4LzTONvl+ikZLDdin+355zEKwh/2WwBYJ6M3rWoTDMcuIB9MXLzHN6MrqvfPExL6
	aQ620XmxNk+oNRMW1fUwqh2aOsmZF4bMbMCj73n9zBrXOS15Re6agAQNb68BoYJp
	rRVXQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jr5x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:34:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342b66c0b06so694941eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404476; x=1791009276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=;
        b=LsP33LoeliRfbR7QsEqD6/xatTMRH7WUwQ8o5Cudh0y/owiWZEymByA7YhFgkNPLSa
         5K5PaDaVNZeKGqnLn49lIji1n9Zh6vuOoPfuZR+BF6WIxOWTCfAKIaQ+/fc+YCVUhZqp
         bfdcvc8Jz7AGGxfnXxIF3qTqgpJWIQmJX9zp9PgmjwzVkX+UddiTZ4XjIf/14c41zWpV
         MzC8coBjR3Gi6oSDwCO62Wshyf0LGIxcpBKHED4jsOBmKD3GZTCVWxKcsOKOAn2KzS7O
         xeXB9dRGxn1QA2Q2vbeuGHe8kohceZw0xQL3GQRujhYF3IGNXQbriyuQhupP4b5gzmkU
         4fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404476; x=1791009276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fUCUMRhK9V9IecJSqtrmDpLhKg4IKuiveG0OpwaHrE=;
        b=eH1rrbxG06lc/CUO4LWdW2mejC66CdnBoBUvA38FYRKi8ploXCPgPrtX8GHM+SL6gb
         DpNHtXi/3gKA3v0lwOYvDzlR9Xi3kg8qGuo8Bb3XC4weKPgQuhnxUrtHpFi91xnYHU/q
         TgcAPvL2fNeFaD3khBK1tKax7jeD7fxlaka2KjEZN/h1OB68V4EB5Z8JFLPE9gWCL8IF
         kvwfa+yl5mLwRftMy435MB1pQZcLfkUadIPeggKHFozaaLBmmBad8kGh9ggmCrOEoh2B
         T6S7mE59mNXlY4VxZWOO0kKuv2gguAPgHDxu0uMwUryVH++1vtXP1K4oXpIyJSFCF/Qs
         EiFg==
X-Forwarded-Encrypted: i=1; AKwUvBxK0o/wUcFpampWThtiidOy5SITdmuIj9S0u63nMONy5fb/DZtynPrTTFZxuLLYgl+BQ0FjKJHnFymd49E=@vger.kernel.org
X-Gm-Message-State: AFuF++nc0htCi3Z0A0Yfbm/RTknNilU1m5ZJ+exRirGI9gj8B2tFuJKT
	S9WVcuSxKlAjkV1wPSdipER7WV+2kx9n7+MiPqKSdcaMpOKDODj1Uir+6tQ9FQHRvV6R/1zta9o
	8RVwGgXYY2xHqkyods2zCnveZdXhxMTV9oqtzPiPmA4TXQsBF5QPA7fRxMaa2f0d/RAk=
X-Gm-Gg: AYBFou2glyYOk7ZpVwsf96AaeUvOW6aV5UXpjUUHB8DJtKgdfnpu8E+nsungz0P3YYj
	idrpEibft3NbX8+r2L9yDg3Dr9LaCYzAI7/vpFgTN51ZRslQCQ2F3bQRgxUkeqZswQ12/77gcts
	wGTdtWfPAMonxc5umI0RYc9L258K/zKEAiRViolUMmlf3qInjzKw6/rKxHPy433+m8t7Ys2IrUZ
	CRhQ53vD5GLL20XZjsJP24kieQNvY/0/HJQl4KLnPjbF1QxhuehRmf1jX8b/n2A3jisPZkqtHLj
	m+IzqvAlR+HEBLMiNCuhaHzXRwGqj8edQIDkMiYsyrRhfbINqgXVkEInNYspZt3Nr+ErNqotQry
	Net7IZ+voAgLTsI27uPNUiaAaw/FTPgn2wQ==
X-Received: by 2002:a05:701b:424a:10b0:147:5261:ee2e with SMTP id a92af1059eb24-1475261f39emr930765c88.21.1790404474642;
        Fri, 25 Sep 2026 23:34:34 -0700 (PDT)
X-Received: by 2002:a05:701b:424a:10b0:147:5261:ee2e with SMTP id a92af1059eb24-1475261f39emr930717c88.21.1790404473888;
        Fri, 25 Sep 2026 23:34:33 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:33 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:00 +0530
Subject: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=6135;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=BW03Q4XvOkjro2dFuDlm8xAjUIoin9wCEv9Ej26ALtU=;
 b=A2S5PWq3v5NUF4IGC7aGSY5tOMrOuKKeAaeuLJse2Um9pyEP99pm2rjZdInulqjqkOcuo79cR
 iSepREQTIYnCYTaqvPVIutHe5mwWPr8e6yzUsCXXKsfd1zwCqu/uLjL
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX5lLbYntyR2Q5
 seLo3nyGVrq/kQ02fCrm6aRq6qEvs1Ub4XFDCeVPd3WJU9HCjFC9kZ2FuaZd0SAZ+FNlYEeHCS+
 05rQ0l844J8nj8fsJ8jDFc/DArY5weg=
X-Proofpoint-GUID: Rh0khoErRFgHvhN5iaOOz3DJUrUOwj0p
X-Proofpoint-ORIG-GUID: Rh0khoErRFgHvhN5iaOOz3DJUrUOwj0p
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab7677c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=weiu3rfF03DHpAy_C5IA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX4gDNor1iq/gY
 YVoGc2IO87Q/oMi0eYOpNPdcEYHvXICIpSSb3Oa71S6G/dvnQb8+ZBxwVMD3odtw+RwQDVWiP+k
 YjzOl1tLHQI0ivb0EWII9yzCezMQMEkM/4xMvt2xznvv2gSGLX8AxxG5FnbaHdeVdytByJHAiaO
 JfaIf0KWXcSIuNB58dyjQwgGeyeifA4p7y0fhS273EXsUd2+yaAymZuuPIafYzC5WZKRXMVaOnG
 dGIOWHPchM+Upa0iYeH8KmsLevYoLwXBf05vechuE73X2WpA3exl0uTA3DYxDfbbuPvM3lniwQ7
 0HmJwitw18lxXf+rM9pQQ8FG15IL073yL1eBkq7sQReYvEMugi8MoSOvRHT0yts/N9c3v+thZZv
 KNKnh0PtnR+eOhdrA4WSkU/VviQwvFcKgn2MU+A/xQRNNKJifXlb6a1h0OUMfVct+/mbicWKR/C
 G0rG5LQ2r3sUyn6VJYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,6 +47,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -55,4 +142,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

