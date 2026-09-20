Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA0A3B47D0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871609; cv=none; b=e1/8eknmiNS4UCn1+2oTa853d1tyQ1av4mpNS+2AbBAFc8noWeEaHDV7se66qm+dk+3t8Kl3tpC6BoSHuQH+jTPsM2qfpKX+B7Kpmg0Ghf/gw4zWWEgtLiQxy62FfRDgRpXv6B4s8wIQJe0s4L+CdHJSa/98fFqaY8zMlHjz7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871609; c=relaxed/simple;
	bh=AIciJD7ZR0wQX72ob08+OdJjOe+jTPh+QkN3fU7AnV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WnAdyUl7z94O+TMpELwWqybkI0Tx4uQZqcpl8gHzJEnU26ENY1MmZq7FMuh14cKHevOFEnYFtMQ4CdmYKhSS0za4+p3BXKETTbtzkDhBm2gX6jTZEU9Nlx4r6TgXc0DqwgmvFjEmUMDEGRs0TfKDJvlT0uHtWPxAsLt1xQ7KyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFd2iUjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyEuv1TZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFd2iUjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyEuv1TZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mkAX978931
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1j6nqTITOk8SF7fJV0hjTN
	onoSPb53+oHpIjMalqk3M=; b=MFd2iUjjv8qQSBRfQmlBaLRsIuKVJyznWJFeEc
	61w3Sdmk4gOslOU2Vvpp1DDrwG6rpqIp9ZF3KYV0oewX8e5Mj+/qaq/SX5ez54xp
	48P/99AIUuL2gO5AXfLJFscas4z0xQdHCFx8CsSV8MjyqgZPn5aN/PzHiErToacJ
	FaCBreQDzEutaRMN1nrd50Jf3jw8MStFjo08AXIFRehReQWOIiJmfkCA4gFw2gig
	C64ChvyJnJ9p660ZOPKX8i7JLXBHTKVtuuxX27fiDgUEJS0wUgchhm54rCbnOzaN
	HytDKK5duiu/aLlJThR2Mz9nME1iE2f0frSPllHLUgfqq0vA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqft5fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:33:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3b126c9fso27032005ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789871606; x=1790476406; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1j6nqTITOk8SF7fJV0hjTNonoSPb53+oHpIjMalqk3M=;
        b=WyEuv1TZCsrE7/FpiBC3T52aMbLPxkKwLG54pBYNhnhoMWoeG3Lj/MfjY4w4wod4Yu
         NU4/FHJw9NrHuTLd9hRVVc4s7SinkS4M0oiShht37efJ4H7fsGy4witjzJL9kquB42Yk
         GYz82g0iDb9SLx1bH/2PNbMd/DQm5qQSY2aJW5CHfm2UCD7rUNk4xgfk3ppQz0Qhg614
         Ph+mM6LdCyyaKECvJpumVRJ/9ak5rzdiuqE194uKRjeurOuXETa2DJo9Mt3UewiAH1hs
         bmE6DwE4tPmvwsE+174Ntihjgen3MK+7zskMmuSe9DpAdKVIbBOjSws4nA1IoXsms1dN
         8yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871606; x=1790476406;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1j6nqTITOk8SF7fJV0hjTNonoSPb53+oHpIjMalqk3M=;
        b=N+h7O+sJBArf3nPl7r3rJeCD1rM5BMmlnYMC5hIPC1NY6q1XED1VS4aQLd8Gax6/4n
         TiATNPxc0DUhls/4GJbRUlfONdZYqW//IM3GLZi/408erZOi1VyTaAXUnVxE03ddilbu
         ssZvxJZRz3TtbHg0GTQCMfMaVqJCNmt0zfnRGtNeGuwQcFqaHnhxtaPdBGRDzhcb453g
         Hq/XBcDkQo33n9K370x4TGaPxihIvN0QacJtMbiMYrlgD1lq0UoPsHPrkJU9+scP9Tb0
         xKmgVMEku9ddmb0BIMplUvHMNFz+69yLU37pASGA1TkEViABjigzr23Net6pHKLIMBqr
         nI2A==
X-Forwarded-Encrypted: i=1; AKwUvBxkFWPTEkMSSHpfqevq09GZ+jMyPItmWoZ7FapVhtnTV8CJ3sHmuqH6y4+PTg9aGHu36rW6+DdTj095PF8=@vger.kernel.org
X-Gm-Message-State: AFuF++kvtgwaTdxSubCNE1XVARaCueX1qskj744I20+TQXvV9vsv6kAo
	l6Mww1A0x+xmtRg07gB4UNRqd/22dDRIRd2Zuakg416Qrg/DIAGuUK9pf3moKSyJH2aSYUi+WSD
	JDBlnd/f+h/dd6tr32GfHWj3sw3qFPzIS+xACwCuCdmlqnr7upKI8aIbi/uo/oRtDLXs=
X-Gm-Gg: AYBFou0/xqe5NNVoi7YrrFFqAxKL+qpE17gaiQ9j5YUPiFTJSehU5N0F5CPF4FzBqMR
	IrshHpKnudwS/dh1hW12/1ANzkmrlzMAUCtLfBvEsh1FQ1Q5EeXybB7rgqaVT1ejsNtpeqd9TtF
	47PMw0dNXp3Uyzso7sDCLKBm9KfFYEHHwrup+HS5sL+FUZt/+PkzEDta/Fv3viHbYRM9dgX+2pk
	qS+vp3OJNW9xQxsEgQgKAFZZTf4JyUuyQTc9sLWaEFzIzMrisnJ65VG4u41xWwOuSATbAqC1p0E
	tqy93KO/h+WmpWEv0BVrozYga6FGPmUYGlLOS+SwwXMOMraCNbddDLI5+sdZ0GJ1k8aFiaSao1u
	HwmXIKZv0gfcXosPzvdyC1HQM+Lc2ZBvHIgNM
X-Received: by 2002:a17:902:fda8:b0:2dd:87c7:a907 with SMTP id d9443c01a7336-2ddb1b7a312mr116771475ad.15.1789871605642;
        Sat, 19 Sep 2026 19:33:25 -0700 (PDT)
X-Received: by 2002:a17:902:fda8:b0:2dd:87c7:a907 with SMTP id d9443c01a7336-2ddb1b7a312mr116771175ad.15.1789871605121;
        Sat, 19 Sep 2026 19:33:25 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d5a21sm9045566eec.31.2026.09.19.19.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:33:24 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 08:03:05 +0530
Subject: [PATCH v2] dt-bindings: dma: qcom,bam-dma: Allow memory-region
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOBFr2oC/4WNTQ6CMBCFr0Jm7ZBSxBJX3sOwKO0gk1gqLTYYw
 t2tXMDNS76X97NBpMAU4VpsEChxZD9lkKcCzKinByHbzCCFvAhVnXE23mGvHVqnMTm2SOuCra5
 7W5vGCEGQu69AA6/H7r3LPHJcfPgcN6n6uf8WU4UCDQ2tMo3qlTU3H2M5v/Uzx12ZBbp9379g6
 dTFwQAAAA==
X-Change-ID: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789871600; l=2666;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=AIciJD7ZR0wQX72ob08+OdJjOe+jTPh+QkN3fU7AnV4=;
 b=PBW27f4qUH9Hvcj4x0CFOOZybT847Owl6O4ioQHJsMjHzGa7mZD5gBxbPskCnE0HkbpJWazrK
 j516oPwuXscAircVdd1TkN2FYIKMmlVeG2SiohiMucxT6XXYFMbT3S8
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAzMyBTYWx0ZWRfXx4E/Pf5xKGF+
 yf0aiYHWd2/VfCpKiWBVJ/k6/2aAuiq0ItO7xZWBUEBZ7H04SlloZbourusYtoQaL2EoR6OHCL1
 2pkignrOwmELt9ZnKZP1x3zEKOM3rDtyxSr2Wbjb++TIUqUwqTAxbYWye4i04FiAoim8G0cOd8Z
 IPTW/PDJ/SmG5MIN1l6L+7Y3xDoblS1YuwV24W8iuNpnUKA2CbBYMFKG3Ob9rDdCTqnZS2Vl+ii
 jKpR+spTm4YX0/CpO+6BmrNAaOla2Iv6FOBDYSp20sb6H8ffzVO3KJyiTFSuhfFGmnfGMPnS10Q
 8VULFxFXPoFnNoyaKIhW+ZnG6591zdRsNC/c4lR+CGuzncy5wAtFWpOUeirVxnVZqLmfeBRf1ou
 sa78/fEZy20qEimXuDX9zHAKEAgpikwO316CTLFZJo8T10oM76IA/xMYn48VGg6/Ca5hOmvDUGP
 xbcmrJd5Oh0WRmL6hUg==
X-Proofpoint-GUID: Pn6IPH-9W05I2DIVztJTWPYsKqOBDkGo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAzMyBTYWx0ZWRfX6l/+9TlQaEGm
 jCV1WTRdh/C8q1qM4wP1G5wAI2Jswsv8NsIhCMQkv79QwVC70qeEI8MHZj8+Vdu81HGzSUIgSp7
 45uiGp6ASJx1/96vE2MOMkBHTH0/B04=
X-Proofpoint-ORIG-GUID: Pn6IPH-9W05I2DIVztJTWPYsKqOBDkGo
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf45f6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_tQzNdYRXts5BJOlV6YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200033

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain, preventing it from accessing BAM descriptor FIFOs allocated from
arbitrary host memory.

Add an optional memory-region property to constrain DMA allocations made
by the BAM DMA controller to a restricted DMA pool. Access permissions
for the remote execution environment are managed separately.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v2:
- Replace the qcom,vmid property and BAM DMA driver SCM assignment with
  the standard memory-region restricted DMA pool mechanism.
- Rely on generic DMA handling to constrain descriptor FIFO allocations
  to the restricted pool.
- Drop the Shikra-specific BAM compatible and all BAM DMA driver changes.
- Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index e72adc172af102d8f400044ea0dc32db6b2365be..1e4324799f2b3b8a9ebf9f084e457e66aad20d28 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -50,6 +50,13 @@ properties:
     minItems: 1
     maxItems: 7
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM DMA controller uses the pool for DMA allocations, including
+      channel descriptor FIFOs.
+
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -137,6 +144,20 @@ examples:
             qcom,num-ees = <4>;
             num-channels = <20>;
             qcom,controlled-remotely;
+            memory-region = <&bam_dmux_pool>;
+        };
+    };
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        bam_dmux_pool: restricted-dma-pool {
+            compatible = "restricted-dma-pool";
+            size = <0x40000>;
+            alignment = <0x40000>;
+            alloc-ranges = <0x80000000 0x80000000>;
         };
     };
 ...

---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

