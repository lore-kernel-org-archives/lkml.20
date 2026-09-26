Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C9C391E74
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404504; cv=none; b=ZchWfSdD46jptp3CKXBVoiG3FjbQwS0bf4fQ8nSqi+BpWBWgCUw89s4GKFdPNt2WgmcZ2X4jtwLfEPCwwSyzfmXl6csUecfngGrjH2GsJGXraVuuxJRuG+IRkfLem9AJ7LfNG+B47hQP5YqzdM/bB9d0B31AL3kwU5wpVENM/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404504; c=relaxed/simple;
	bh=bhgyDGke3koS1MizdMPczRCrbOzmCGobg//o9T6bKb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hysgZvabTbIPHUipjDTX+uVulVnWGcQDKONv5LzmGe+buG/zSh9vfB8sZ85Tu4G92qn/cWKINYf+DvSDdivKyvKyPJ1vBkdEddEMCqwsBJdIri9k3DSkryORTbXLau8NtFUqK5QH2Oxw4N6Wezl6E6eTgwzQW8Hg/fhQt7hcE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePrX0HRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvKeW2um; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePrX0HRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvKeW2um"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6P3EA3901084
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BqdKXYsGBUJp6yLGQTe76rfehO/B008pqqdjGnEiBnw=; b=ePrX0HRxlJu1CxDm
	VuQ8WPUXwuud3HwQ327mmGxHwngyvuy/egEoICle/QtBGzIcJPnzLhA54c79tf76
	zS4a4YJ3T4RWO3WAIx5siRhqLV33riBBMZSY1uf8Ukbb9YwRGFTOwJltL5lmF6/9
	98RA0oQxeBAHjWCyfUpxzT1EEuICgv9JXAr8x+e2wrK5yf7LiFIqQjQMi00vp81X
	aMxixryR5EOfq7WQaTpfZFyhE8F6k1bZWwg9SKkG9r8Znc5Ymz20+GsW+E3JKPuR
	Z6/QVS35gidkmDcHcZjPFt4bSM/dN8LYCi1zYDb2311W/FvpuUCEjynBmtOX00mB
	bIlB1Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw8bse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso2118814c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404499; x=1791009299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqdKXYsGBUJp6yLGQTe76rfehO/B008pqqdjGnEiBnw=;
        b=fvKeW2umKbISXJl2JLD5KA8GYlq4fe9/N7EVQHsKJGKZxaXWC9oYW3aFHGi5ErhNPN
         KuCukkYsdTKRhpZVLrafcdUm+knM74huVk+/3VWz2CF6qSGG20QrezrHlwUSFsf6rEjA
         hYIqGjXfi0odWl1z2FBDqJx+beY/YHV3AogC/m4gJwyt+nUXeDH6pCutz4lQNnx2/nJB
         TygMjmP6HZSALoqkW7Jp+/RAmzY/aXjDhurqnnqfXnUC2LZ9Re2x49i126suNlQooUkE
         Fhp4qFxIIpVDZNJ6WHxNsZ7yKbPcVx+CkVCTIsoZTeb293fWKCEneEpAi2Km7Sz9A5ho
         yM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404499; x=1791009299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqdKXYsGBUJp6yLGQTe76rfehO/B008pqqdjGnEiBnw=;
        b=rHi1t2Th/0VK5srln5xTJ2mh/p11EcAyzGvssB1q+3PKfinBagVeiHtPV8gInMRYJl
         uotJS7sMb29PMbZzlqf40HIUXMY8nxJr48LxKOcrO+/H5SzeMq0dtRi6jPVcrsMik11q
         Zq9yEpFYlaHJ3swxsOpeMiL7gEHym+9uBY7LpwBkKC+w1FDdVMO+MMpQf8TyC3HQdiRS
         jL6m2KpsL7J7B6s4cDiKpBA0QZv+4BWCpEyGuYXkg1/dA3iZ764ZGCCUsmsuYEatX7Li
         4nuu7pVDX01DWY8WPwRYxO/RXITO3aNWKvI7LVxvpickHTsWzG3gjePNc0N+ICLL1LjE
         FrRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcKARJQQ6a8cwKs758PLCCnkZyH4VLTcQFQiph9TL23NqoBBfwn81tAgPAEzroZ9CXCwNk5/YJtsAl3ns=@vger.kernel.org
X-Gm-Message-State: AFuF++lmo1YaSmyW8vX62Wec6laDd9vQSiesJxV1Jt3Rku8pSdNS4Ajk
	yINnVkd9GOqsfhfz9kV4vO9TNVUQ0NhSeFFmg3mMbvHzJZd03Tm9foSMFl/84VfAiW9xHFPk3uA
	F6YGvXFY6BH/dsRv3jjNhkuAyUuYb5WPfzzb1PsSAIQ83R0f4ZMdQu5dEHEOaBZTPoEI=
X-Gm-Gg: AYBFou23qsek8tpU2eFJE7JnmN0kPF3GCg+XewJvYd46mrystwlyyfYl9z2CVyoCkK3
	MfbR03MlALFaSuB+RaRrXof5b/+6AvDJtyqaEa7x6WJt/SDzsHrQaQyvJm+1F6M7YpLdbvIcmZM
	IdAVoiClqRCREQv5RTS3N6y2JFaot5PbTRqb7KIsbrU9Yh9mzhIHkPp+M/cmyGgJIImzfXuxNiL
	OOuCYeD2oUf8i9nM7H0qFikJyH+4aJXMh3wEQ17zjof5jQXMHxYCbkIKMB0FuiEWTyMsqOP0qxz
	qkiLIt60H8CsPR077ai0MPVJj6HIcz4T85raLOMVAcR+gvdHemrcfKEbaTR61RWReupeqqBWgTg
	a1LmTfZVrlmlNqAbh6SiPEYLoJI9b4dQwNQ==
X-Received: by 2002:a05:7022:b044:10b0:147:9ad0:cf32 with SMTP id a92af1059eb24-1479ad0d333mr564411c88.31.1790404499074;
        Fri, 25 Sep 2026 23:34:59 -0700 (PDT)
X-Received: by 2002:a05:7022:b044:10b0:147:9ad0:cf32 with SMTP id a92af1059eb24-1479ad0d333mr564365c88.31.1790404498278;
        Fri, 25 Sep 2026 23:34:58 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:34:57 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:03 +0530
Subject: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=6156;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bhgyDGke3koS1MizdMPczRCrbOzmCGobg//o9T6bKb4=;
 b=Gxu+7jBjKnvIIrS6yx5auoiuKetzvusVO2qtkpZ8gTIL3+c9FPPku5WFoEPHC+jM+UnfAkbFK
 pWzrW7Z4iN2CPURJLJcqCCX4ZroyFvpOf857e1x+7Ww2RXQTxSuzi3p
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 7AkV7IXoJ8IiE7TqwtVGUfsso50eoczo
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab76794 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5d7BNXMnqyCmxenBVOsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 7AkV7IXoJ8IiE7TqwtVGUfsso50eoczo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7YIpq/LFKwOm
 ql21P42GEKq0D9XeJiO+XWxgSH3XOZeieVVwmlMl/i4p/VIHSbyxAWr43NfBT0IZPIWy2WoFoey
 Jn73u/I60tgc/OZhiXvJQASWMcpKU53iJKeKS2Qg3DV5gqt405phJVst+BstgTHpwrspNcO7qmj
 GOlhpTqU6hunblMpqDwJvb88LVf+v+RyovKw6hnHQ3HGw6/+/VD13yqcuycxYnlIym9vQuDfm6I
 G8hOBiK/P2mBTHKJyD/BGSyAaUqPxOS14Q1nGA2lyzK874jUwvFTdTTOLdpBustIQXKRf5LGw2r
 aylyelwOnOx6U9bYubj/9q93p8hXb4985Gc0MBOtDf3dadIagsd1NXfBIF/MJZAJsUJ96CwE+bw
 YbbiGfe1acXLY8D7lCETSDBFSCS0upax020T8jRcAOjVbnKT1OZZ1Gc88ucVKzi3Uk4vlM0uuxv
 ZxGJIDgTWODZOR3/ifw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX1vxv+mf7aFqE
 TB3C1nG/Z8n3K4mkZ2PvcmGT2E2o8y/t9Ocx/qjC1KKB8EIkwEQ2R0fIHAkoR9mRU3FHoAQ4G7B
 Lh5NbcPliI7rCOSguIXEaL9FiqEPH+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

Reserving an IOVA address using "iommu-addresses" requires it to be
placed in the reserved-memory node. But when "iommu-addresses" is the
only property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong under
/reserved-memory. A device IOVA range is specific to its own address
space, and does not describe the system physical memory to make it
qualify under reserved-memory. Given this, place "iommu-addresses"
inside reserved-memory only when it is paired with a "reg", otherwise,
define it within the device own node. It was discussed here:
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

Existing "iommu-addresses" property expects a phandle, which does
not make sense when the property is defined within the device node.
Introduce a new property, "iommu-ranges", to specify the device
specific IOVA ranges when there is no backing "reg".

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..9766a6944d0e11a6cd8b74b1b89428acffe3dfdf 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -190,6 +190,111 @@ iommu_resv_region_get_type(struct device *dev,
 	return IOMMU_RESV_RESERVED;
 }
 
+/**
+ * of_iommu_derive_resv_regions - derive reserved regions which
+ *                                are outside of iommu-ranges
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * A device can describe its own usable IOVA ranges directly on its node
+ * via "iommu-ranges". Everything not under those ranges is derived
+ * as a reserved region so the IOMMU allocator won't use it. Entries may
+ * appear in any order in the property.
+ */
+static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_iommu_range {
+		struct list_head node;
+		phys_addr_t start;
+		phys_addr_t end;
+	} *pos, *new, *next_range;
+	int size, prot = IOMMU_READ | IOMMU_WRITE;
+	struct iommu_resv_region *region;
+	const __be32 *maps, *end;
+	struct list_head *prev;
+	phys_addr_t next = 0;
+	LIST_HEAD(ranges);
+
+	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
+	if (!maps)
+		return;
+
+	end = maps + size / sizeof(__be32);
+
+	while (maps < end) {
+		phys_addr_t iova, iova_end;
+		size_t length;
+
+		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
+		if (!maps) {
+			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
+				dev->of_node);
+			break;
+		}
+
+		if (!length)
+			continue;
+
+		iova_end = iova + length - 1;
+
+		if (iova_end < iova) {
+			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
+				dev->of_node);
+			continue;
+		}
+
+		prev = &ranges;
+		list_for_each_entry(pos, &ranges, node) {
+			if (pos->start > iova)
+				break;
+			prev = &pos->node;
+		}
+
+		new = kmalloc_obj(*new);
+		if (!new)
+			continue;
+
+		new->start = iova;
+		new->end = iova_end;
+		list_add(&new->node, prev);
+	}
+
+	if (list_empty(&ranges))
+		return;
+
+	if (of_dma_is_coherent(dev->of_node))
+		prot |= IOMMU_CACHE;
+
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		if (pos->start > next) {
+			region = iommu_alloc_resv_region(next, pos->start - next, prot,
+							 IOMMU_RESV_RESERVED, GFP_KERNEL);
+			if (region)
+				list_add_tail(&region->list, list);
+		}
+
+		if (pos->end == PHYS_ADDR_MAX)
+			goto exit;
+
+		if (pos->end >= next)
+			next = pos->end + 1;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+
+exit:
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		list_del(&pos->node);
+		kfree(pos);
+	}
+}
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 
 		memset(&phys, 0, sizeof(phys));
 
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
+
 		/*
-		 * The "reg" property is optional and can be omitted by reserved-memory regions
-		 * that represent reservations in the IOVA space, which are regions that should
-		 * not be mapped.
+		 * "iommu-addresses" must be used in combination with a "reg" that provides
+		 * the physical address and size of this memory region, for an identity 1:1
+		 * IOVA mapping to that physical memory.
 		 */
 		if (of_property_present(it.node, "reg")) {
 			err = of_address_to_resource(it.node, 0, &phys);
@@ -226,11 +335,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					it.node, err);
 				continue;
 			}
-		}
-
-		maps = of_get_property(it.node, "iommu-addresses", &size);
-		if (!maps)
+		} else {
+			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
+				it.node);
 			continue;
+		}
 
 		end = maps + size / sizeof(__be32);
 
@@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)
@@ -265,6 +377,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
+
+	of_iommu_derive_resv_regions(dev, list);
 #endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1

