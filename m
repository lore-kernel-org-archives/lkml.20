Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6945DF7F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188392; cv=none; b=CXbnKp3oFWatk4mLhdOQZtJ+AuBB+DH2aABxm1SR4stQxx9KiSUqTotv010bYyNHNcZZ5YjoB4KXTrhNRAu8qSZPXCblabtAysjVSTLETp8e8S04Z6Z3gtJuGpCiwyaCAUq046Gg5U7G8PuD3sv9/NkvGJKkb0jsB63x2BOZhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188392; c=relaxed/simple;
	bh=/ijFACOXO4KJuqu0/jkjSkr/3WZZg+UEe0EN8Jrzfi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D09UPGaZmOhcVHTtnEn2N/fbRTrHWysqViCp1nREmB+c4Q8LLEuIaYekap3dqdbZpGlZb2FbGrPSKAuddG4qIR9S2YlrY1YlMoO0yvb6DLZcXA+wO9zMICTPsTmgz5rq6wZNinioo+dRXBLBkd0zQAxsZAlIrPUGF7i7hJ98kyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGDMOb2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVl7+mrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGDMOb2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVl7+mrS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETZAv121820
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6RkO5qSbU6o
	yY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=; b=SGDMOb2aqN+2Z5l+7Mzo8nMO/F4
	qcsJvwkuxeP633TU7o9U5eMNVJRTk/uew1loJ1ER2De3nnARJ0vQI4KGSZA+5ysm
	o0CzMILXUmEzYke2kxVaGu0eULx5k/SVrLz8rDjaAEUSPCne0bm/vx0UXEV46/RS
	FraYkLHIzdpJwYD7WC4uQQX/iIL1jcwbX4IyPW5LSfpsEN4/m1XCJ9lLD3l3ZvOD
	AqvY7jNYyNCXB2X86vXh+6NGCnEds+zsM1uG/Qha8BGqMjLfPyyCHdoCd3BhDUk2
	GHzOTVq0CRp13/fr6y5KQDX15soB9cueYiNU1Nx41n3LKQKa8j6Km1pXOmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pma2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso514106985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188387; x=1788793187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RkO5qSbU6oyY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=;
        b=dVl7+mrSSY/X7nF1oOe+GG+MTkhj6YYp2iuPDkkRlOeQY7xi0fz408zI9QmNSsd/x6
         vxJQNtvawPnL5haERmoDq3piNy+83t0fZ4WUZBBSYQ2IlpdL8GZwrCUQXZFrIRXeTgh8
         9PF/macDHxTHCXj+Dv6SG3Isp2kkzHRSigL9Uw0kr/5uxgW/hnZTYlOuknRodO+w8kPJ
         LP8RVctYU25KvUA3VIa3XipWiAltO7zu2Uq9IP5uDMnX8oY16rbcvns2QZeTqGJSi/vz
         2jkiviZx6VoB3JPLsHGTH1x5YUsXHwnDNgmqnW4H/pCvWlK+aZDuHA0B483b21RAv452
         wLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188387; x=1788793187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RkO5qSbU6oyY3PEkq3YPDDTYFB2jarHRGHy9kSvaIA=;
        b=b+DVyLjQUeSOGWqEROGIYDFQU8gG45rQBNWmKbxkxhhTs9JCPjU6T1FRnf37faGSrw
         iIua9VVh6n/ILniwnxQNYDqhfe9oNpqn1k4yimZKceS2uk0de13wgRwggvYTeUBFPYbf
         vm55x6Cl94zYrABmcE2F0K5psCg8ynZYKRtF1q70fzPzw2YKh2fCrxjNTh9BVJRgYExC
         NnsXdFnXRn6PWr9UxOFiu4sEO4LLIuzrDzJVPywT++7Ao6dJyC9QUbFqX2kqEZUL0YfP
         L1Jf36tl7OZB0gbefJTMSDYyeNCJwlQ7t6Fw+h2bagcHII2n2VvbggH0lSpABmsjLpVD
         Ti5w==
X-Gm-Message-State: AFuF++kSTiK1ymBuLk3rzxGwRCMIZdRS7cuxaA09s+7JLkGNANcr7uA7
	HlasgzBH5gEq+sTcMejerDtO3XSMuf0pOjAP1enfT9tF7p1Ozz9S8+2Xqg2qXEDTggE8QQf9w39
	FRDCfPGkpaU4xgOSqJIPhYed+v/fTfxyaOCdvN5RaXiRHX6Huq/lBoR1gsUpw9vpzb7A=
X-Gm-Gg: AR+sD12lml89DH/ane3ajjgRcc1gLbI89eQZ2MhkTbtyryCpwIgBRyZMxVBkhRDdsWu
	u+RcJhbGe6/V6y4RVisGN6CCtySsphi5umnoUoMyaHXSM3JoIpVqw6TA2oogkqg9bgZHQ5v+1PB
	L04mbyYTDlxgWmwxiE1+gKIBO4ebGkNpbT5kJMUN8NqOT7XKteBzW0mZVKSJHsnxoUo4/skoQfA
	9+FDq2sL7MWKHREx/vS5l0ZxMgIJYGpshIfru/F9cu3cU4QFtXb1FjKPEcLg+M9RcO5I8IkQ3PC
	2KabmGSnP4exzNwh5+eXdB5KofAVhgcCcNTh4+EGrksOj2ztCRliD20KDXCGHJJYTgeIyFJI9MJ
	AvjJHarUK/nhnm9X3ig7repeC8uznBPC4Y8Q=
X-Received: by 2002:a05:620a:1b9a:b0:939:cb6:997c with SMTP id af79cd13be357-93936cbe952mr224773685a.13.1788188387524;
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:939:cb6:997c with SMTP id af79cd13be357-93936cbe952mr224765385a.13.1788188387028;
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843ce8b015sm6235156f8f.13.2026.08.31.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:46 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 01/17] iommu/dma: Prepare MSI physical address lists
Date: Mon, 31 Aug 2026 16:59:27 +0200
Message-ID: <20260831145943.313726-2-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UvaWYjjkjSwQuFc9qtnCnctWbO7cZ_eE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX35ZgG0F8b6JO
 ue6Mhw3agIJu4o6HkFTukFlUasrwmHU3rIUUSUBdUBNxuAXE5w/NROYS/YKD3SSeby5RzernRAT
 NhNCHic9acbGzXw2YRFoGQs029ULCeqqZOTuVgDSuQDHJPYl/EFJ72o4Ek/mPc9a5ch2UgM3O5q
 XqPqbfhR5erw9drk6JyrhDscYUOZhhmLcqQZL1JGwPn9o2BIQ30Ngx4tQnZKz5QUElngOyFGEDZ
 D9pA0BRtGfZ9HAcjLDdU+7pgVhRi426j17MAbjpT0fuxtBGwREtHZjngI4DB0z0/Ntpy2Gm+DvX
 Eti+vY8JkZ4GK4Hsfu1yiszPplOPkJE7yLCYZlhG7TfA8+1GN5SBOb/aXzsP25ENKwYJBtCnzuU
 a+4fylEHz1yM7f0ypdtFEXyrafbY6WQ/KcSdYXDwzceURyJDgha1TIkyMJMaHgYYuLhASPOPMNE
 Fp5DZS+E4TDzdj0ZrqA==
X-Proofpoint-GUID: UvaWYjjkjSwQuFc9qtnCnctWbO7cZ_eE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/hAz5dyqi1zS
 5M9IL37GHb7NUN81ggglF8FNKAzWUp1xXd044oJzwmI+QLYJCgVzQ+qD/kLgMmsGzFpq+Avx9Kt
 AKJdT54mYmUo2aVK5K/C3VoTsH+X8xY=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9596e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kJPfLSheDWDr1nFXzE0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Software MSI mappings may cover an ordered list of physical addresses
which must be mapped into one contiguous IOVA range. Extend the internal
DMA-IOMMU mapping helpers to accept an address array, address count, and
required mapping granule.

Teach iommu_dma_get_msi_page() to map the list into one contiguous IOVA
allocation. Keep the existing per-page cache entries and mark the first
entry with the size of the allocation so an identical list can reuse the
mapping without changing the existing cache representation.

This prepares for the forthcoming iommu_dma_prepare_msi_list() API.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/dma-iommu.c | 116 +++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9a07eb39336e..38a0c4e244d6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -42,6 +42,7 @@ struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
 	phys_addr_t		phys;
+	size_t			range_size; /* IOVA range size, or 0 if not the first map */
 };
 
 enum iommu_dma_queue_type {
@@ -481,7 +482,7 @@ static int cookie_init_hw_msi_region(struct iommu_dma_cookie *cookie,
 	num_pages = iova_align(iovad, end - start) >> iova_shift(iovad);
 
 	for (i = 0; i < num_pages; i++) {
-		msi_page = kmalloc_obj(*msi_page);
+		msi_page = kzalloc_obj(*msi_page);
 		if (!msi_page)
 			return -ENOMEM;
 
@@ -2196,15 +2197,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
 	}
 }
 
+static bool iommu_dma_msi_range_matches(struct list_head *msi_page_list,
+					const struct iommu_dma_msi_page *base_page,
+					const phys_addr_t *phys_addrs,
+					unsigned int nr_addrs, size_t granule)
+{
+	const struct iommu_dma_msi_page *msi_page;
+	unsigned int nr_found = 0;
+	dma_addr_t offset;
+
+	list_for_each_entry(msi_page, msi_page_list, list) {
+		if (msi_page->iova < base_page->iova)
+			continue;
+		offset = msi_page->iova - base_page->iova;
+		if (offset >= base_page->range_size)
+			continue;
+		if (!IS_ALIGNED((size_t)offset, granule) ||
+		    msi_page->phys != phys_addrs[(size_t)offset / granule])
+			return false;
+		nr_found++;
+	}
+
+	return nr_found == nr_addrs;
+}
+
 static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
-		phys_addr_t msi_addr, struct iommu_domain *domain)
+		const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule,
+		struct iommu_domain *domain)
 {
 	struct list_head *msi_page_list = cookie_msi_pages(domain);
-	struct iommu_dma_msi_page *msi_page;
-	dma_addr_t iova;
+	struct iommu_dma_msi_page *msi_page, *first_page = NULL;
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
-	size_t size = cookie_msi_granule(domain);
 	static DEFINE_MUTEX(msi_prepare_lock);
+	LIST_HEAD(new_msi_pages);
+	dma_addr_t base_iova;
+	unsigned int i;
+	size_t size;
 
 	/*
 	 * Normally a device's default domain is only ever attached to that
@@ -2218,32 +2246,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	 */
 	guard(mutex)(&msi_prepare_lock);
 
-	msi_addr &= ~(phys_addr_t)(size - 1);
-	list_for_each_entry(msi_page, msi_page_list, list)
-		if (msi_page->phys == msi_addr)
+	if (!nr_addrs || nr_addrs > SIZE_MAX / granule)
+		return NULL;
+	size = nr_addrs * granule;
+
+	list_for_each_entry(msi_page, msi_page_list, list) {
+		if (msi_page->phys != phys_addrs[0])
+			continue;
+		if (nr_addrs == 1)
+			return msi_page;
+		if (msi_page->range_size == size &&
+		    iommu_dma_msi_range_matches(msi_page_list, msi_page, phys_addrs,
+						nr_addrs, granule))
 			return msi_page;
+	}
 
-	msi_page = kzalloc_obj(*msi_page);
-	if (!msi_page)
-		return NULL;
+	for (i = 0; i < nr_addrs; i++) {
+		msi_page = kzalloc_obj(*msi_page);
+		if (!msi_page)
+			goto out_free_pages;
+		list_add_tail(&msi_page->list, &new_msi_pages);
+	}
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
-	if (!iova)
-		goto out_free_page;
+	base_iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	if (!base_iova)
+		goto out_free_pages;
 
-	if (iommu_map(domain, iova, msi_addr, size, prot, GFP_KERNEL))
-		goto out_free_iova;
+	i = 0;
+	list_for_each_entry(msi_page, &new_msi_pages, list) {
+		msi_page->phys = phys_addrs[i];
+		msi_page->iova = base_iova + i * granule;
+		if (!i)
+			first_page = msi_page;
+		if (iommu_map(domain, msi_page->iova, msi_page->phys, granule, prot, GFP_KERNEL))
+			goto out_unmap;
+		i++;
+	}
 
-	INIT_LIST_HEAD(&msi_page->list);
-	msi_page->phys = msi_addr;
-	msi_page->iova = iova;
-	list_add(&msi_page->list, msi_page_list);
-	return msi_page;
+	first_page->range_size = size;
+	list_splice(&new_msi_pages, msi_page_list);
+	return first_page;
 
-out_free_iova:
-	iommu_dma_free_iova(domain, iova, size, NULL);
-out_free_page:
-	kfree(msi_page);
+out_unmap:
+	if (i) {
+		size_t unmap = iommu_unmap(domain, base_iova, i * granule);
+
+		WARN_ON_ONCE(unmap != i * granule);
+	}
+	iommu_dma_free_iova(domain, base_iova, size, NULL);
+out_free_pages:
+	while (!list_empty(&new_msi_pages)) {
+		msi_page = list_first_entry(&new_msi_pages, typeof(*msi_page), list);
+		list_del(&msi_page->list);
+		kfree(msi_page);
+	}
 	return NULL;
 }
 
@@ -2252,19 +2308,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	const struct iommu_dma_msi_page *msi_page;
+	phys_addr_t phys_addr;
+	size_t granule;
 
 	if (!has_msi_cookie(domain)) {
 		msi_desc_set_iommu_msi_iova(desc, 0, 0);
 		return 0;
 	}
 
+	granule = cookie_msi_granule(domain);
+	phys_addr = ALIGN_DOWN(msi_addr, granule);
+
 	iommu_group_mutex_assert(dev);
-	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
+	msi_page = iommu_dma_get_msi_page(dev, &phys_addr, 1, granule, domain);
 	if (!msi_page)
 		return -ENOMEM;
 
-	msi_desc_set_iommu_msi_iova(desc, msi_page->iova,
-				    ilog2(cookie_msi_granule(domain)));
+	msi_desc_set_iommu_msi_iova(desc, msi_page->iova, ilog2(granule));
 	return 0;
 }
 
-- 
2.43.0

