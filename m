Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2952449B22
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755992; cv=none; b=OF6+yU5VZ8O80lvj4PlU2CpaMRLxcLUUh5aT+aLqqSw8CbkcrpKnn5b1yCZRYqvyV384PFY/yj+PQztVlHkIWdWtYIpNjPgVwC5oLTYHRlvaVky1SuDsGJXL7oF+h9QZP2FzKclosEdI9yb8pSmNpyxp8BX8Uw1nikPiQsXW6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755992; c=relaxed/simple;
	bh=oZdcl+DcOpyx/BKBuDUugaTTS+5qNwFGceBtTaUP+qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5BQqhIoCQffufQysyR8qv7VULbcc5xZBvcIZZ7vcrAmTvfGQuiHq9uafSWSXuoSnzV3kSTDr8zvW8WG1iIkj/cA89HdVA9WlEQZg9PPPxE/s+T9qN5IHiW9rR40kz402HR2t5/gVg+WQIMOeGWGZ1/DeB9pFNWkSL0WtRQoSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFqbJTLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QL4WQu8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFqbJTLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QL4WQu8K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuweB1703340
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uRc0GuXWx07
	G3Ujbsxvy2twoM1JUOK8J6X/Sj4wclqI=; b=GFqbJTLXcJVmQsuheV+1rD9id76
	qb313CZZANCSNY5A3yWRaPQj1o2pbVaC9XABAr2/5XkAZpz4XeRwau0CnSiXjcSv
	kZTlEH4Z3ka7L86rSjG30a506WXuf8iXvEqUbW0Z7sUG2QjTvriXJnBqVP53Idiu
	4a8NWMlzvPz60QvnAtMahK5IRQiFEqtGYVsxj8mjav7Ewt8vdozyQ2fxqbKjWNij
	MwiJnZo+oIR9AaEThpNithYbpi/Ij694BPzdwRc/FI9HW/86zUj4IQTowpV8ZJ2c
	5ojtosufbCsHJrxjR40Ij0MfI43MzC//Y6NpP/boEbTArri7L+7fO5Bvz7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbrcns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d827597fbso10562071cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755987; x=1788360787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRc0GuXWx07G3Ujbsxvy2twoM1JUOK8J6X/Sj4wclqI=;
        b=QL4WQu8KV/PlZp+iAv8jjKpp9bDtRb2q+6aHFcJqszgsZemJ9NKET1pJsFqF1EIOOW
         vPSingAHXMD29kph+T5lYBFAP6tfEB6F7wyBXzkVNP4jI0jKr8e0+c77pV8TLFWQVJMB
         Qw/AHuF7x7IB+Wf6xYNwwJsFh5zdyn6aKaR/VPQJ/CHm1ir2xW4mqCZTAXi/IZHRGUqS
         0gdUaNVVRheFp8zWe+LX/WhRvYtNIas7VHIYyP4759163wS+TNhlGmRVAau9BzGSDaSH
         E1JlydS8nxTy96usEo7i9RN08mmYLRqfNhYW+y6+x7nP+D4bfHObFspfuq4geFD5QNem
         gRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755987; x=1788360787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRc0GuXWx07G3Ujbsxvy2twoM1JUOK8J6X/Sj4wclqI=;
        b=GZicbbaFW77y6KRPYKp1XC304yl3efseTYEj8eMI67vJAWQHtb/kYGuNyEROSlGHji
         jZvgpVDqAUpNPENG2LhQjVeCttNyY8zT2aKewalmwsF8qVmE5dVmdrUPrJywU2us+6+0
         zx12tdXE8UPvXnEDUsRfRMFnP0V2Wr5H4i9Rx6CGXwvdmQBVdq8l+KAFUIO5Eu6nrPd0
         qKhIcqnD7T0CNnfk14+fS1/OAy2Z/cUEtU4h5ePgRD8Qbsxx2ozSOPjtyZitP8auQEdB
         IEgmmjP8mGi26T8eS74TqDES96DRhUVhIqPG9D028VpFoBtLXZVplIPclFCwB0b6ep6o
         WlpA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Be5vMS54LNFfiOM1hpT2xp8tNMCOYXRGJW5dRWOQv2iBMk1q64ouaXTxGiKbAKfK5YVOyj6SMfpZwkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l8U0pFCJgkZrhPnKHedj8Jk1olWh4+4R44SqSMy5B9fLhnUdBi
	Q5GJMhoyijHVeeqjRsVAUxkUUrFgKP7YuAw27tM26q2XGdvGhaEulIzYmBffDmtNc9vr91e5OKM
	5Z+ByKnxtPPO5yvtzMNtKIYco7/GEwkiW6vXkaUP3rRa5nR0WGXqyf1Lusu5to15ES2c=
X-Gm-Gg: AR+sD11kP3PGiKxl5mZ0AE5BQNxfb9G7XLen1xNVwsUjtUcH3ne+BXnrYxn+VlVtk0K
	rAnQGQFr6/2YDScJzJ/zI4eyYr3Wkd5VTa2w68d7j2LuxjxaodmnduLIl2U4YIvv/pLe+0QpIvS
	ri+37MgdCeHOzeKN8pbj+wGZPYGOYA1b2UO4UMrOCgk3XHEmMdoblG9BeWkt7Xpg6jEzjWxfPKz
	C4RjWdtdzIc+qRY8iEhmswQ8NhUCQpWzj1qWVyEUvLmjwCQaRshCp8vq+/sxFJfsyY60Q3xPTSh
	wggFxhFP5UrWcYlwrMnC7dM5eKhlfViBd419Jlj025upUE/Z/QBvWucE9zxCNYluS4uEFUT1pBL
	Y+rNvXWzO
X-Received: by 2002:a05:622a:53c7:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52e42379a61mr86020851cf.34.1787755986886;
        Wed, 26 Aug 2026 07:53:06 -0700 (PDT)
X-Received: by 2002:a05:622a:53c7:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52e42379a61mr86020181cf.34.1787755986444;
        Wed, 26 Aug 2026 07:53:06 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm3060145f8f.6.2026.08.26.07.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:53:05 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, kevin.tian@intel.com, robin.murphy@arm.com, joro@8bytes.org,
        will@kernel.org
Subject: [RFC PATCH v1 1/8] iommu/dma: Prepare MSI physical address lists
Date: Wed, 26 Aug 2026 16:52:55 +0200
Message-ID: <20260826145302.449904-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826145302.449904-1-andrew.jones@oss.qualcomm.com>
References: <20260826145302.449904-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eI355BNQ_TOmzmawL_tR6eb4L9ujopQz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX7m6w2j6xNNDt
 nM1zH3AAlizA+GJXbHyn2R4YuwCsjfu5HRAu4ZbsaEaB/Xnd+B59iogI/hnzbEWVV/YlRer9CiA
 D3k7wGd5rNX0MBw2yqF07be2sOLE2hk=
X-Proofpoint-GUID: eI355BNQ_TOmzmawL_tR6eb4L9ujopQz
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8efdd4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kJPfLSheDWDr1nFXzE0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX9gymkCFvnBOb
 jV/ngTV4xTUOiiGmy32R69wOjzcvF5xKGeNkPlUbvPQ4qzzizGUep4GQ/f3hT6+MGKD9QtmQl6Z
 Nrjj/2nXw0lJCTV6KgROnWuVXJxPJPAHVfynOdIGPYUAiwBNBj7kILbBHTn5WuywFIRlsloiWsw
 M1pML9P+7RObGC4M/7v14ABxP/eUV5+Z6BIwDV89bpdQ45pQG5ZsYAxPYu0jCmJ9DkZhYYn3jw+
 tkUXkVDw3gWBvxmsn4hmEe5on2iMPWYK6MHFMeNalZgXpcEIr56oCZdaCWocuY9EMWuNBW4c8Kf
 k1eFaHdEtWY6rNT9CUt4rT/nPpGUWe9zjHBOfesK5f2IxPVKJszSCL58KmC8Y49GIb+yq6u18EP
 tfvcp+RkQiNjgiYObVkIgqDGyaoM7OZb6EeaTSpi5ERAZG88njcxwyWRMWdBG+pwHcdggf3f1yy
 /Pf/Z6v9ZGylsZyyAwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260124

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
 drivers/iommu/dma-iommu.c | 115 ++++++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 9a07eb39336e..c256531ff19f 100644
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
 
@@ -2196,15 +2197,41 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
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
+		if (!IS_ALIGNED(offset, granule) || msi_page->phys != phys_addrs[offset / granule])
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
@@ -2218,32 +2245,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
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
 
@@ -2252,19 +2307,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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

