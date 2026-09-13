Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403203F7A9B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325423; cv=none; b=lCNk7Xs2yzmPpzsAu8PozaQv4QedC/BsjydenYODL6i91S9U0idz4mUqloiMJ211vgLsivYDtJ+qT6WJRMlhp1hoQt81buO79NxHPwzgRAbR6DGbxLxhDtjqDyfH8Fg6Uwp/rqvgAPuIUscs0P2tdfGJ3gAiNiSaICeJ52VEnu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325423; c=relaxed/simple;
	bh=SotE3v19uTlQ096YvT10NlnX7cpT6wjYoiC6wIywFc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ocg161qJvtrAQDDJqmnN47IzAF/LcExgPsHALnCqsa2UjuCU7SgWeXBOnp3NMFHlVPu0NyWdDObTGGZuozKPsDIpfWqA5NqIt7HmwgDDNDlR54qvY0p4jm6PL1z/04s2rMRqkHaEYeC78jcipldptP9I1kOIXK8cfXddNn6u9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmBG+UUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDPCjQ4C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmBG+UUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDPCjQ4C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2kbK1192771
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWuI/WNDQwf1Ze/N0XRHCYa4glKdApgbQFIkuNsVpTE=; b=KmBG+UUgdcFiuabQ
	GKhxDBBEnBnPLu98dcfyTXu1y/7NMSyjyMTvBy/JnW7xpI7z3ru87phgSvg77JSE
	UPiNHiwWNENgFZ06qNFG9RK6HFUrywlmcjzC9iLGRLes2HDPklT1793y0Yem2HnA
	eNcM9s1EyKUBMKUae10DKXu50qUrfi5xx8bMu++BC07aVtDbsEOX6b3R+XXB3yGy
	yKoc4+PZgtBnD4LWNuNSU6I6NUItQGEAwVgnL2JvSCB+NhBCEiQNi6w4ytOxPps4
	kKIAGjHzK76/MZW8d0t7Sh89nuYR07z96mVF+nVPXdiQQYrUwhrsB1qVnRnORyxX
	i7rurg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3t84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so4718578a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325417; x=1789930217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWuI/WNDQwf1Ze/N0XRHCYa4glKdApgbQFIkuNsVpTE=;
        b=cDPCjQ4CB9q+RyLsp8MmCgrk8WClcxLy60cYN028HtcE54YfwIrtRf4y5HPtWWByUq
         RFQltM+pVdfX/WASI4L6urni1bs+dRPjVAfLoygaiGdPCaayshIFjzKhQa03fzOC5OWt
         UXfwaN2KB6ubREnrbb/Rb2S/bYshXUsv+ehXsxh6XdIDH5zD0fs/vbqDOfHGKbDVGp4m
         BgxlAUGXQENvBMdbASvGynKnfo8lzqUr4+wGar0cZf7Z6upHe/U3cr0T3goI4GVN/5hv
         puEefdoZBM7C+Ho7xoOLiiiFeLi54FW5CdJbaDqrKCxlpDTsMaOSH2/W9EdOfQDDVwf4
         GCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325417; x=1789930217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWuI/WNDQwf1Ze/N0XRHCYa4glKdApgbQFIkuNsVpTE=;
        b=lRR/l0BGqqPnVkwKZAdDDW6wC1OlfZYVrn1EeyHu+R/VjwTDRz5TJtvM+mHtigRE0s
         7DjbxcoljG9NqA0qXeN5GQGV+35ap1i0pqhhPob5qX1tv0KglpSzfjGUQvgYLFjoIHaH
         LvtGP/PpGTgBXM3g84mdcM8MXaa+6nSiOtOEhblnJe0GJMYpgfajiqkg7WL3jQO+VUTp
         aStxYIhBCHzahoxvRcRI9BjrzPC+xlZgbR4WMX2lg4C/1Yqy+lBqiOZxjhr7qFS0wWzU
         jDePbG8Rl2vaAxuO/A4Ldbao9ypGQP1BvqfI2DJs+GA3Lirpo4plHLrinzQOLmDoGTg4
         u9SA==
X-Forwarded-Encrypted: i=1; AKwUvBxvStmvkX1AW+dkfGp52okfnaVvoW+lV3ti8EWeW2dKr8JMpJ6Z0cdGch/kAp5+IYDBNgbzv9sGyhSmJkc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZFWwr3EERRwa48wloMGAHrKvxtMYaml9LRWG5BPtw4Ks+DP3L
	FTtv6c7oK8YHxaGRUeh7LFn8uuWD8oZ5Ynizd7nDwX74JffdOjwpir0j4x1Rz9zdASdtNmhKPnj
	2pbTqB8TEaNx0xQfLZx4jL1V1v1V9ZyXxCGdgobH/caeNF0JbzJ9zSo+0JMVun2b0ltA=
X-Gm-Gg: AYBFou2GjUsrm2QDJYMnkWFiJ8dstcz3tadqe0heOwS4v80C2GO6104jOYSFKIgT7n3
	8Zhjult2x3aPJuL6icEO5Yk9efTDSu7hQtShRjffI2RuI+DZ1EO6tn03LDZ8SW2lPzgAODMzVJY
	Fqr5bkOSe9b5WWoaeCdgKyLXNhplUgwcReQrsCywwjgQMFf2Er6sG/yWIpff7fnbtna9CKUCSfY
	UKXZtqnRogVb9LaB+jffSt0c945TiF30R/6kqXwNX+Fcy8wt/tFzYvrk5a5ymnj3UJIONRpvtHt
	P2m0JmZSZfGJqwsiNfsw2+8jOZFJYMXOze88jLgPshJxwge6rZ+rF657tCLsRjI+rElU3UYNYs1
	5YdcNedpEVjWVnCjZeAHci6HVhyPcpYFsKKM=
X-Received: by 2002:a17:90b:134f:b0:399:1b08:28de with SMTP id 98e67ed59e1d1-39d9beb0be4mr26511006a91.7.1789325417400;
        Sun, 13 Sep 2026 11:50:17 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:399:1b08:28de with SMTP id 98e67ed59e1d1-39d9beb0be4mr26510935a91.7.1789325416949;
        Sun, 13 Sep 2026 11:50:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:16 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:21 +0530
Subject: [PATCH v4 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-4-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=5912;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=SotE3v19uTlQ096YvT10NlnX7cpT6wjYoiC6wIywFc0=;
 b=KbtO+WjJsBKGHbk8Ef8lwgXtsXrFvcv2kA44jhpSPiwxZ0Z0YO5OtIGIfpNMFWsoas1fLZa3j
 /Kq8XjxatuDDbsIPxYDiSDC8a+z5pA1D5/b1pStcgy+Ewlbf9DV0H17
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 3fNGvWLMxUt2vfWt5m9_WhqBX-pS3W9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX9z03Kisymb98
 +RNp05Pci3BnUzX1TEur5+9EyQnYsPeaE0d9x+Wa2vNxA5eZBC0/LMb/Dl77h/lx1B9bkWUGZHm
 n8ItVncZSWAbdbkMLd/4TfPOQpaoru73UsCAcY+uyJeuhNesUHrQMf94l49xmRrnq7ZUTpuoB0Y
 fi/b869UdH3kdPjbYrdL0OsgIbe/rwLPjyl+mNywGI9pbXQ6Uzd/O38uXN96LFcOpMGvfeTwGuW
 TjhPcc2Y/S1UFelf8T8WI5qTNcjFMPkXs4y/XaNOx3hr3N23m5MvxTE6XH1HMG3S2FFBWWvKExN
 Mir9ZWRVwpBE0mworlN4IAA4PnStWDuG+HN0btj3mMUgvQM9WUp+4x8TQpf1R34nWwxsD6aLB28
 RBbyFlk+fVeps0gkY8Qh2z2FmSGHzAF83EDYOPT9z7WB04I2aUf1X+wRTTgh7hD7pmlr3DjqO/X
 5SRi2xddCxaP/1Q6FVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX9RmGQNU8E2U2
 5+6xkt+vmsLUp0YRYXHD4I2RJ/bZ3PzVX/Kx7mOl5ajr8HSu9DJHNstKoYgTbyfHL1KSL6bGzCi
 d6gI6j0FofXAkVWWJO1kbO5kVyy5lJQ=
X-Proofpoint-ORIG-GUID: 3fNGvWLMxUt2vfWt5m9_WhqBX-pS3W9z
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6f06a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5d7BNXMnqyCmxenBVOsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
 drivers/iommu/of_iommu.c | 115 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..baf74db838d6bc45df2b36c49eb47eeca21b4b7b 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -190,6 +190,98 @@ iommu_resv_region_get_type(struct device *dev,
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
+		phys_addr_t iova;
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
+		if (iova + length < iova) {
+			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
+				dev->of_node);
+			continue;
+		}
+
+		list_for_each_entry(pos, &ranges, node)
+			if (pos->start > iova)
+				break;
+
+		new = kmalloc_obj(*new);
+		if (!new)
+			continue;
+
+		new->start = iova;
+		new->end = iova + length;
+		list_add_tail(&new->node, &pos->node);
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
+		if (pos->end > next || !pos->end)
+			next = pos->end;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	if (!next)
+		return;
+
+	region = iommu_alloc_resv_region(next, ~(phys_addr_t)0 - next + 1,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+}
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -214,10 +306,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 
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
@@ -226,11 +322,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
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
 
@@ -258,6 +354,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)
@@ -265,6 +364,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
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

