Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166614A64EB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188397; cv=none; b=MBN4mRT2xRNVVCHaYl9J68qO5fdY77n1pc7hTL0i9efc5inrbpDwS2HE3a4HnthcpyR8NVjK0fOJfzpNJ5uhT7Kamg1nF2KUn1BNp97p6SltQuqvA1C+sYZwNIlyvCnSdBS99xukTXsgcAPLNso5hDnulSG+otITquF5GGz6Q64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188397; c=relaxed/simple;
	bh=kS1tkzLH3ddYQKnJlCyZ0TbDF/E2lNZ37hitw5bKQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbkbMLxZZ5l7si6n5DwgylLG5FTWiyw7VIeZd32ad9y7bvzrnCmSVcEZf7wNYpMQt2C5/GPlHP4jEuhi82j0I1es4d/TFadJSBsHLeY+M8nK8HpxXeB0YXtpo7jG0Tzs0wesaBeMWKGHiZlngYXN/Nc5dpfl7A9TR/FglNTM4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTrie+Rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODOzEy4R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTrie+Rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODOzEy4R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETPil3703662
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wEMOruUw6uy
	+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=; b=MTrie+RmGJcE4skw55IYzPEXDoy
	WekZAv4IWc86su4De+H914GY+wFehco1I2g6rC77XFyxfvmSMk5u7/WKjfGP6Rg0
	J0r+3XLClkzINEMSEGFgTzi8ezpkwko6lFodklavBbfMe9wIjK7iAM5aNml2KqDX
	Lv1fLhGCgscj4IC4DXgxg0Cm1gwGZwpjFHNnfoeuTDE3E0QCOrUN3LRNUd91/kYG
	op0YveQY0JBTn7Lkwb3D8MuQ7rHDP4AlgRcm1YcZN8f4CFtdKOfKPludnvTxVlbe
	Jk5CCuGkKU8v7PcS6VFRYfVpmNMkmUvC7uqP3DGSKMoJBccyZ2nqYC9Pv3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso452908385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188394; x=1788793194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEMOruUw6uy+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=;
        b=ODOzEy4RAtNB888QBfcgelFrqd9lRwA9Krme+i9jkiwsMvRVmKruOVcOcs6VzPVxf0
         5qN/1yEa4aJr+w9nHCR4Yn8hn576d1zo+adhPzjDbIpMw4EVYaexLupq2ZNESLbqfag2
         s0i8lQZDwkxxpuZ6bDMwh+0qP4ZCnyYTIxnwmjbtr/vJ5ZXBDQH84baCS6otS7rz7ZFg
         WvJ28VXCds+cooOIMOudsIZ6boFtowMA3c3WRKvI2+voEpIVZhb6lkiRWdfogaVBx+HW
         8foaQnD9AF1t2IpAXEUr+CO93yzCplb9w1ctVkXueGWWIXlSzsbewZQKpdCwTYPKI83m
         qV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188394; x=1788793194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEMOruUw6uy+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=;
        b=dI6XLdOLz8UKmdAmMCPUGo96qXTMQmKDLPvohOO+wrXVZdDyj19Obexcht2tO1oEyn
         TptpkVu3JN4ZXnkMsvQPthKi9GuuFfrhuoxVs6MzjF6ruL+EelUBOpVAUB4sRS4xzC+E
         7iAT7LCO1P1uDwvwARZVj59JUjP2K8iTzRz73TQS4g44CeFWrLXjsFrRyDA1RwxWMKLD
         yTIZoewptZbVZOrvEYZSOqMWEpgMpkNhWAa3vOIreyGnOEUosWkE7rvVCIWKdDR29eCj
         h4lT/dXMoKCiahL72u+XWsHIS6vw7zK/9tachVAtAuqCsms/NgSH1xsRvNjj3LGC8M0y
         nY+w==
X-Gm-Message-State: AFuF++mSifL//therjL+WUof2jJB9D+X6Kmkm0c+QPkwZvJKZ8eH2+b/
	HTUYa9SCSV4U0CpsHRB8TTCwtaSehVc+4rK9RB2Dqm1RERMMvf1pvH0FzuwCAHIz/Yr68ZS8rrS
	/BCxCeoYg/0+L1ag3CeSKwrwnSiTgg5yie+2dxNxbj0KkGdSkLssnUrEO3CZ03LIsh+k=
X-Gm-Gg: AR+sD11qPSP76wKANaed853dqAo3p+tFMQTsaZ9XxvcRImOnIrIuEKPQs87jHse2uJz
	PN1dUTp5iITV9nRoSY0g4320KpKcSu5OvOTMFa+b82BEP6arVZ/jOETb6ThcbzEWSlhCyfPTMfA
	G5w81CU/ArxOTeuJ44302JK35lsVuPlxgsXKlkfr0a3O3tm7Wzwaob6NoGbo5T81r9O22jMNUVY
	vS0AcaULXSQ+s1uOP3VaR4hVGNG7TNkrZ970Vgsj9P3RnBtsJz6JyYGEXM69GjF+6Zl8zrjINqB
	8FnSblRPr9MyG1tVrdltUIYmTaJJ0BMaGUjxiAEqzjf68nfx20Hr8XqC2HuKI7zr2uugp01RVQ7
	DkxcwAVz6bQwEjy4x42O65LHb+CDFg/O8G6k=
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1362971585a.19.1788188394109;
        Mon, 31 Aug 2026 07:59:54 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1362964985a.19.1788188393547;
        Mon, 31 Aug 2026 07:59:53 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm346414945e9.8.2026.08.31.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:52 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 05/17] iommufd: Prepare software MSI maps for address lists
Date: Mon, 31 Aug 2026 16:59:31 +0200
Message-ID: <20260831145943.313726-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXyibVCpCUCnTr
 lZ75rz8Lqh2Vg+NPCxm/yktT5OI5iw5up0cXkucDRDo9pkv7J4XtVER17rGVlrrSRFrZHK/2X4U
 HtOAbVJSvMR4siLQddZWhzxqN7SX48o=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=noCGlsY9V4GqTmqY_BAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/kvcFYGkWUG3
 nZNXb4GMT8qj9Uu7GI1lzuy13WthdqlRIryB6+e+FjtiOSkQvilZ2+xbrHv1ynTZc1kNl2K4jSS
 3o+2gi5BERdOAQS1d3JBtRLzEMPK9BQBguCvlSZ8rhbvK1pD6XFM67P7QfYtlH/5SgL7k2MvZS3
 tprN80ISZZU1Pg+0Fk7ae2UP7NnNRvSl1cjx4Y6QQ2YOx52ZPH9ZnUBRuC1mEbbrOqHVA7TIsQP
 6sV6vyR3ASMbQtb6M/kPDOPCrlOI2glAP2lrn7HwaawZr/CUeSRuGNTBpEl7+n5DkdJcQIujuc9
 j60MuliaZ+eU5T84tWheNieAW9Dawhz/NeQYbCu6koDVGoxx1eVDLuHsKezwW/j6mgor9XlUQY7
 7uEN8CNROjO6qkrMVxk8JQcwiOstrE6Q9pAPJxc5WOFerzaRGOjhjUMhQE10r8EgljrMX2wPSR/
 Fq81IXPmIRIc1Uo6Bkg==
X-Proofpoint-ORIG-GUID: yD7JEfqZ9dGT6UKxO2K7o1XgI56GWGTx
X-Proofpoint-GUID: yD7JEfqZ9dGT6UKxO2K7o1XgI56GWGTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Teach iommufd_sw_msi_get_map() to match an ordered physical address list
against an existing contiguous IOVA range. Mark the first map with the
range size so an identical list can reuse the allocation.

Teach iommufd_sw_msi_alloc_map() to reserve identifiers and offsets for
the complete list and build its maps on a temporary list. Keep the
existing scalar installation behavior and only publish newly allocated
maps after installation succeeds.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c          | 161 ++++++++++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   1 +
 2 files changed, 123 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 8bb47a81fed1..6a0527f4b058 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -179,35 +179,91 @@ EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 /*
- * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
+ * Get an iommufd_sw_msi_map for the msi physical addresses requested by the irq
  * layer. The mapping to IOVA is global to the iommufd file descriptor, every
  * domain that is attached to a device using the same MSI parameters will use
- * the same IOVA.
+ * the same contiguous IOVA range.
  */
 static struct iommufd_sw_msi_map *
-iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-		       const struct iommufd_sw_msi_range *sw_msi_range)
+iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
+		       unsigned int nr_addrs, const struct iommufd_sw_msi_range *sw_msi_range)
 {
-	struct iommufd_sw_msi_map *cur;
+	struct iommufd_sw_msi_map *cur, *msi_map;
+	unsigned int nr_found;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
-	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_range->start ||
-		    cur->pgoff >= sw_msi_range->length / PAGE_SIZE)
+	list_for_each_entry(msi_map, &ictx->sw_msi_list, sw_msi_item) {
+		if (msi_map->sw_msi_start != sw_msi_range->start ||
+		    msi_map->msi_addr != phys_addrs[0])
+			continue;
+		if (msi_map->range_size != nr_addrs * PAGE_SIZE)
 			continue;
-		if (cur->msi_addr == msi_addr)
-			return cur;
+		if (msi_map->pgoff > sw_msi_range->length / PAGE_SIZE ||
+		    nr_addrs > sw_msi_range->length / PAGE_SIZE - msi_map->pgoff)
+			continue;
+
+		nr_found = 0;
+		list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
+			unsigned int index;
+
+			if (cur->sw_msi_start != sw_msi_range->start ||
+			    cur->pgoff < msi_map->pgoff)
+				continue;
+			index = cur->pgoff - msi_map->pgoff;
+			if (index >= nr_addrs)
+				continue;
+			if (cur->msi_addr != phys_addrs[index])
+				break;
+			nr_found++;
+		}
+		if (nr_found == nr_addrs)
+			return msi_map;
 	}
 	return NULL;
 }
 
+static int iommufd_sw_msi_check_alloc(struct iommufd_ctx *ictx,
+				      const struct iommufd_sw_msi_range *sw_msi_range,
+				      unsigned int first_pgoff, unsigned int nr_addrs,
+				      size_t *range_size)
+{
+	unsigned long max_iova_pgoff;
+	unsigned int last_pgoff;
+	unsigned int last_id;
+	size_t range_pages;
+
+	if (!nr_addrs)
+		return -EINVAL;
+	if (sw_msi_range->start > ULONG_MAX)
+		return -EOVERFLOW;
+
+	range_pages = sw_msi_range->length / PAGE_SIZE;
+	max_iova_pgoff = (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE;
+
+	if (check_add_overflow(ictx->sw_msi_id, nr_addrs - 1, &last_id) ||
+	    last_id > IOMMUFD_SW_MSI_MAX_ID ||
+	    check_add_overflow(first_pgoff, nr_addrs - 1, &last_pgoff) ||
+	    last_pgoff > max_iova_pgoff ||
+	    check_mul_overflow((size_t)nr_addrs, PAGE_SIZE, range_size))
+		return -EOVERFLOW;
+
+	if (last_pgoff >= range_pages)
+		return -ENOSPC;
+
+	return 0;
+}
+
 static struct iommufd_sw_msi_map *
-iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-			 const struct iommufd_sw_msi_range *sw_msi_range)
+iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
+			 unsigned int nr_addrs, const struct iommufd_sw_msi_range *sw_msi_range,
+			 struct list_head *new_msi_maps)
 {
-	struct iommufd_sw_msi_map *cur;
-	unsigned int max_pgoff = 0;
+	struct iommufd_sw_msi_map *cur, *first_map = NULL;
+	unsigned int next_pgoff = 0;
+	unsigned int i;
+	size_t size;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
@@ -216,25 +272,38 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 			continue;
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
-		max_pgoff = max(max_pgoff, cur->pgoff + 1);
+		next_pgoff = max(next_pgoff, cur->pgoff + 1);
 	}
 
-	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
-	    max_pgoff > (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE)
-		return ERR_PTR(-EOVERFLOW);
-	if (max_pgoff >= sw_msi_range->length / PAGE_SIZE)
-		return ERR_PTR(-ENOSPC);
-
-	cur = kzalloc_obj(*cur);
-	if (!cur)
-		return ERR_PTR(-ENOMEM);
-
-	cur->sw_msi_start = sw_msi_range->start;
-	cur->msi_addr = msi_addr;
-	cur->pgoff = max_pgoff;
-	cur->id = ictx->sw_msi_id++;
-	list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
-	return cur;
+	rc = iommufd_sw_msi_check_alloc(ictx, sw_msi_range, next_pgoff, nr_addrs, &size);
+	if (rc)
+		return ERR_PTR(rc);
+
+	for (i = 0; i < nr_addrs; i++) {
+		cur = kzalloc_obj(*cur);
+		if (!cur)
+			goto err_free;
+
+		cur->sw_msi_start = sw_msi_range->start;
+		cur->msi_addr = phys_addrs[i];
+		cur->pgoff = next_pgoff + i;
+		cur->id = ictx->sw_msi_id + i;
+		if (!i) {
+			cur->range_size = size;
+			first_map = cur;
+		}
+		list_add_tail(&cur->sw_msi_item, new_msi_maps);
+	}
+
+	return first_map;
+
+err_free:
+	while (!list_empty(new_msi_maps)) {
+		cur = list_first_entry(new_msi_maps, typeof(*cur), sw_msi_item);
+		list_del(&cur->sw_msi_item);
+		kfree(cur);
+	}
+	return ERR_PTR(-ENOMEM);
 }
 
 int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
@@ -280,7 +349,9 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	struct iommufd_attach_handle *handle;
 	struct iommufd_sw_msi_map *msi_map;
 	struct iommufd_ctx *ictx;
+	LIST_HEAD(new_msi_maps);
 	unsigned long iova;
+	phys_addr_t phys_addr;
 	int rc;
 
 	/*
@@ -308,29 +379,41 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	 * assume the caller has checked that it is contained with a MMIO region
 	 * that is secure to map at PAGE_SIZE.
 	 */
-	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
-					 msi_addr & PAGE_MASK,
-					 &handle->idev->igroup->sw_msi_range);
+	phys_addr = msi_addr & PAGE_MASK;
+	msi_map = iommufd_sw_msi_get_map(ictx, &phys_addr, 1, &handle->idev->igroup->sw_msi_range);
 	if (!msi_map)
-		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
-						   msi_addr & PAGE_MASK,
-						   &handle->idev->igroup->sw_msi_range);
+		msi_map = iommufd_sw_msi_alloc_map(ictx, &phys_addr, 1,
+						   &handle->idev->igroup->sw_msi_range,
+						   &new_msi_maps);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
 	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
 					msi_map->id);
 	if (rc)
-		return rc;
+		goto err_free;
 
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
-		return rc;
+		goto err_free;
 	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
 
+	if (!list_empty(&new_msi_maps)) {
+		list_splice_tail_init(&new_msi_maps, &ictx->sw_msi_list);
+		ictx->sw_msi_id++;
+	}
+
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
 	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
 	return 0;
+
+err_free:
+	while (!list_empty(&new_msi_maps)) {
+		msi_map = list_first_entry(&new_msi_maps, typeof(*msi_map), sw_msi_item);
+		list_del(&msi_map->sw_msi_item);
+		kfree(msi_map);
+	}
+	return rc;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 4e2d32809695..797965557281 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -33,6 +33,7 @@ struct iommufd_sw_msi_map {
 	phys_addr_t msi_addr;
 	unsigned int pgoff;
 	unsigned int id;
+	size_t range_size; /* IOVA range size, or 0 if not the first map */
 };
 
 /* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
-- 
2.43.0

