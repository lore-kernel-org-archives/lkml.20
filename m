Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56594C8FE6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349432; cv=none; b=gCCdePt7600lM+pfcnGJ2pNUBfsLzhEFt60zSebRYu2QfONNnijOsgblBjAP9aN7NhzzRhL5+b7liJCG73Nv8aCw3RoPkeTLDGOPMlJgyrS7JIJ5L9WCiXiDU1DHx6tJGOj7G28p4fHMyK12BIU8cUcGl4jZP0WvrbGIo6aAtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349432; c=relaxed/simple;
	bh=Z4KbGGHbIopPmkQPTA+5W2fw8gEPO8v6yje46iBjdmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWDUdjrw7BRcz9/y+tYI3q8JPmintLlFQLpHyefzUp5dxqdq6PC2mf3+y2FAsOxYMiakWKhJnT9V1BzPn8dOdXAiOytpcY9oOosm0ujqSiuf+M3j+X5zunCURvLZLsUdr2tu+dorEaNhlhNlMg48jX8HdCcCJVqvQhgWFBEATCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNMUMWhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpOSGAY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNMUMWhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpOSGAY6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDKdxR2911825
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hEPKavc8j9V
	N94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=; b=dNMUMWhL9s2tbL/mWLkBj+9XARj
	HE+G1BO7uzXxS5tTiZqW2ouCNsR+6HxGjcDXfeSexVJIUOgEf7VmE6LLOUoncHka
	vVfzCq8s2diX4TIKA519jd9BMS6Gn9bPFn/ieiq05tMDYBHxAAti0h4J6XT0y2xC
	F3bJ7WU+2g9nOZ80MlnVA85seqJvYyHWE25sPaUp9VQUF/5bEZ2mdTP935j4Kmzg
	0euS4816jwBwes3EGkxEX9LKi1ubcnSPrGG/ChALgaMo0o6tT0mVopI9eDBwaz8A
	th7EQSgzln/+kOOb7s8JthYgupT0/1Iqn7R+aBZmf/LI8R1TcIVdFNz0kkw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm523nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:05 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c990236604so224866e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349425; x=1790954225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEPKavc8j9VN94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=;
        b=fpOSGAY6zeM3CQ8qxk1ub3vdZt3kysWCXmsWWDuNyLqfRX4zLq2g2FKtIo35d36RUf
         IdC/DKH/3Dd5nkkGnyGX5NgKMQK7hE3BWHL9TaQF1jzYatrxRMNcISUBsOnke6iaUmAl
         N41xip5tLH2zEJ615qIozsUlWVOUoKDuC/zCFkXbKOq+4sByCVtI6K3OtPGnN2HBZGns
         FAniZkue4SVhnmlCRlOUyneAB7eldGztNHRPB/GA4FqP5zs9wyCtzFrTo/UnTY+z3QHL
         R6tv2BfPXL6rW7oO2M75twO7JHmh+umySfxoAHqCEReANqZ4yRxBzo9d04qrOXmtTIRD
         WsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349425; x=1790954225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEPKavc8j9VN94Q3baQAu9FNMxrJyRmn7Q8gFTEEhzY=;
        b=CJyxRRbcsUK6ECE09qrBeR5ZoNmgBKRWCT8iQ0pbNVOuYoY8whZRkKAoz1a0YQrmWh
         VgFX1W0UGBB5aHeuNs7u7o53SAFWOcWqvIfDmrp2XGxnh+bR6UjyB4NIqKsZiTEd66iw
         VbR9QPUnW6Bwu2Himgv6+5TV5yyPlZUV3n8jyT92+OFccNQYwPP4q9E9zgHp1lwltTiv
         nOjgYguSX68OwzkDp30Ol/gcNSjgv0aa/i9ncnY/IyVyygwCPSIYGvlR8S1L1qLfC2wV
         i4LIclbiWPV5DdnvX1SDqriGlaFDnfFWwsT45ZZ1MeZQW5cTaDUmjwheALTuihDTSYZJ
         2Rcg==
X-Gm-Message-State: AFuF++ndkNzyFrrr7xBeU23UBwf5QGKJapWja6G5s7QjstX8Ri+mB5Im
	znyC+k1CUtws/9YGnN2O1+et19geiVRS79+0lEtTs3Z5fAUVwGEmijtowMAEUFa1yMpe/HY3GYP
	+IqlUJXiEjTRJdUtS5nFsv0tTrJB1OK7nG4eW4tqkiJTTmg9MwSJ13BBbvWKHF25v2m0=
X-Gm-Gg: AYBFou2xUX6GUb95vl81qHHuGt7szjTtxzLyh4zf15LLt07zGC0H/ZPOZe9axRTNFIy
	iRvVupYsxWxqaT/fB9RKq+0tjp0kVL4dOJbu/bLx/l0/CtLe1fuAapZa08DQrK4Y5E2AYlnrrrn
	0xmFy2iPybexh49JewP196TdJimI5qjDleG8FenHa/H7RAFRwAoEVF33FYUI7QZpGfigamhDW5f
	HMWqgpTteu53wrDFT8DxQ9o3sHNEGbK7UNvNCfZCgpj0OKCuz907xgFGkDVE9BbmGLHfSmVU0bw
	37Uga0KUfU1m1HcEGwG1IGTGnaGthFSj3vFeTX/jaxkYrI7+dFmS3hQXvDwAy/kLFJWzZFB5V7O
	3jjNI3gjPDz/U5DipIUcP1pFcCIgBG26abtw5yQ==
X-Received: by 2002:a05:6102:61ce:10b0:7b0:3c13:9f09 with SMTP id ada2fe7eead31-7b03c13a338mr986711137.27.1790349424622;
        Fri, 25 Sep 2026 08:17:04 -0700 (PDT)
X-Received: by 2002:a05:6102:61ce:10b0:7b0:3c13:9f09 with SMTP id ada2fe7eead31-7b03c13a338mr986689137.27.1790349424108;
        Fri, 25 Sep 2026 08:17:04 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff21d6209sm30158645e9.4.2026.09.25.08.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 01/16] iommu/dma: Prepare MSI physical address lists
Date: Fri, 25 Sep 2026 17:16:44 +0200
Message-ID: <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w1wBGpCIWjOkRQO8Nzm2pQTnJrnhHbBM
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab69071 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=kJPfLSheDWDr1nFXzE0A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX+RAzi4A5dEsG
 I2YKa2PCDxcDbJgeLSUzoA51vM8ucZ40EU2qgSw+Qxkdz0KVFTT8LZOV5kJvyblrve/EXmhjpkP
 HZKusrSNSt1jBO/VQtV/1j6dT3gB3wc3Kh5lqwfigTHBR/tRjoRCdeRUNkdY9HNv4u1S5/w2P2o
 svyFUhkoN0tXDAusHwXIeeTy1S6y7ONlg/veUT+F77+YoW7wOfj31Ufr3c2rMubzrKXec2HfiG/
 sjmzKAFjq8rnl7tLmfvFFdJWPVDHv+j7vqHm3HHx9srwI/hRcKu2A4z0h6WNu8910b8ld1eBHA9
 2YP0EdGoc0dfUzTYBVUpiwAGfCPLQPsQR6QFRwDgVHnDjRviND58Mg+tQhHl+vPQ+nJzl8X7AJq
 Syx3pTRWDaaKH4RvoI5b0w1JrGeARjK/eQ2yNpG48RECIOlkzbafB+GcL9kwUmzcEeUWZF/6S2y
 o95Y16eVsT0zlWnUTbw==
X-Proofpoint-ORIG-GUID: w1wBGpCIWjOkRQO8Nzm2pQTnJrnhHbBM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX9+Hn5oYlZmke
 5u70vfAvuX8QC8yYxi0p2g0SlnSPTPvpFP+JsMij3ubTVgd0yqXo2TmnZZasWZKbA5G/UBE7qBU
 ot+aofn1jP1MmXIiIW5qAGK5ul0cxRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

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
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/dma-iommu.c | 116 +++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 58c624513cd4..0b4eb47d1a95 100644
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
 
@@ -2191,15 +2192,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
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
@@ -2213,32 +2241,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
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
 
@@ -2247,19 +2303,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
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

