Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D304A6CEE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188401; cv=none; b=AgkfU9yCVQT3utAhWrWpBMtb/Ouo6FTfI1C/UaMxGJZogcbK8F/pgd/nreVOhVowh7VadB9BYVF1WY8LueyQCDfVp2cfymLUchgoT6pSA8JNA/LPyNy6ladNMrgJ6RoaHfRbZccyqTBTw9jUYOGDIfE5F5srqapCNUUBsHNv75w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188401; c=relaxed/simple;
	bh=8HiNwjyq1vjwoAfAkbPp//4KpZ6m4wxpLdb5cYJtqFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mamXWuWsBDGG/g5xQvdM7S+BhDDlimkWh+t2aecGrReUz8t8xKi70fcTIzp0dj6rhAXNj6AUmZMNQlWHAXsuaz/hKNc5Rlp6YHQ6T20lJkZXg2CmjFDDHk1jn6HJXUm+5E9Cr+Qd6cvmMvZBqveqsXmK+3eiAKeKKLqW3S77lHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glyLadnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hg6KpITf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glyLadnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hg6KpITf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETPLB3703671
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l+wO2YNnEaL
	XrAQk2P5XKsnRLtuMJ3Ijr8ghrcqISrk=; b=glyLadnVtfQteledri6mEzwwDiI
	IoRauTHIAyauECNeinQ0XUxMGZQ+4D/KatKY2W8rufK/AcaaDD+ndizr5cpduIsC
	EKgKkuOI/kWryKFRDFr+A6nNzpjyhcs5A5XHWeGeptpK+Cglihio3e1rPtJ+IvgK
	TPBgLqxYT2B33G2vVABNuSWKwGDo5s9ibfuv+urmokGcCMHJU5A9z6ljbnl9qv5j
	6jkVyagqkxLqiafR7U20ZmtLPE5UY/chTemyWZaCHUkpNctWXLVasoG0Ca4ldCzp
	WEePGIMyBPjbJga9BIrgbDG7Wo0A9PTrIjptJaSoUE4IPSQo4ArytbwW7GA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so612704585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188398; x=1788793198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+wO2YNnEaLXrAQk2P5XKsnRLtuMJ3Ijr8ghrcqISrk=;
        b=hg6KpITfdtzxZ8wHF2wcydLt1k7mLcj7bdQM34/yCJLiLdG8DtKNIeinBZEIy1W2BC
         x7fkoY6xBF7YNnmSnwxfiR36Z6jnBVsQ/SefsPbW/91MollL//c3HOl6T/jQH9SPdsa9
         NaM1e6uZkEfV7ZzCPYbVxrbbvdrW1ny2BNNKshQS/BDEYRDrvzKdW2xY3Mb5u1ZYafQ/
         /WA9pLkecyekXiFyxLmGTs3qn5WSXs74K3VNlqpW6OGq9Hq9P4QwZOExSSHWjTfyCzT5
         XxK1WVHJsUnsPPR65O5rdftdBNf8XxmlU4Ahw7JWDffnPtg8CPZUlx/udwp6UXXt1H2y
         qDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188398; x=1788793198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+wO2YNnEaLXrAQk2P5XKsnRLtuMJ3Ijr8ghrcqISrk=;
        b=RcQ/RKdtuw85rAZzoUnua8bHdGu5dI3Jh5hHvyI//iod5rdr6/RHoC7T0jUN/jsM3k
         XtrfihROyBoQeRRBMaH4rRw7W3ujNhTN0wFx09dJVS+pPag92/WUSv8HuZ6RNLmQIOZR
         uS8rLAYCaIWUGsOlaVBLLJHU7L8HR5zZ59kVEk3nTS+xK4l8+lZzuMcbLDnLMsk8k2xy
         a4mulCR/KqClL4du7CvBwWAsq2zlb0oTZEfbynazqsD1OP8e37622pUUb9xHBdWXn1Hb
         hKDjG6hc/nVQvXve/NFiaizyUifZJGz27ZjTWOmx+Zwe+hpqVpR7v+eyF2Tny+sHYunr
         AILQ==
X-Gm-Message-State: AFuF++k17Pn8cwuuIVj+yPrBFP4xPTPUPLT3XGEqWfTu8qPjL7+kz7hp
	cH5y70EufTnfxXpe6nXKWAbrMRT/VGicDUDCVX6ARbk8zXzc4bszw7PSt4vn/BgvoanJgpLa9Dj
	MHBSJVM03RD78b/JeVchsKn65aL9hVOgmAtF3wkmWM/8CEkZeL7q1OQNwSA/XuPvPGCU=
X-Gm-Gg: AR+sD12agfYFAf62wo/nlI7QZF9JT7deCH4lKyos/r2L8NrnVwQpEjkAf426WOVUuSZ
	CqFUw7tY5yh3jheZzb0hYHUnmhd1wpyb+y4Y7nwMNjDkB9b8cikFKFiv8TyEle2oE0ABh0WpbLY
	PxHQJoHiNBZJt8EbkJs6TO3OTeC/uspyXjRE0ILtvHx4ToqDyrLsZpiWi+u1OfGqOChR4UEeXov
	RqgF/sS0HARS5TJ2d6dQIZVqUj210M1FdCqyWCPU6wKnADZ2/5C52LL6nk/3dD1uAmcTrSDqffc
	RrkidLDZEN4FUa37YH4JtFN3QSwrxwJ7g2gF3HXN7qPHSy19PZFKW3E97N1g4Y8Rw+G/dQ3b0yA
	loc/Xh7wl35/nK8167xPR+y+LQe/BvHlqg9k=
X-Received: by 2002:a05:620a:a404:10b0:939:209:c805 with SMTP id af79cd13be357-939138015b1mr2421459785a.12.1788188397622;
        Mon, 31 Aug 2026 07:59:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a404:10b0:939:209:c805 with SMTP id af79cd13be357-939138015b1mr2421451585a.12.1788188396956;
        Mon, 31 Aug 2026 07:59:56 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdb13f094sm40886845e9.3.2026.08.31.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:56 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 07/17] iommufd: Prepare software MSI installation for address lists
Date: Mon, 31 Aug 2026 16:59:33 +0200
Message-ID: <20260831145943.313726-8-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX05J7Qqt/2qVk
 QDec6B6jUESI3KDRREqVuDL+Zakd4SwCd2aVQwh9WIC5gGgjXNeDcyTo8IvIjVEdnLYy3rIfzHm
 PbLnUjQhFFJQ4fDilBvOuurrS/kuC54=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fyE6B5mSzfnmm1qxREQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX9wvE/PjwB2vI
 rDT4XUpsn/D1jO1chJz0zCVoqwwcau4NJNFmEHNA4OwhYsCdjrFCBTMogTVQkJ3wXOHI4Dntpvx
 Fm7ftM3eBmM2ILOjKY1fsbpxyLvvWOtVwKb825yJXjtWmg9KY8aY7UyH4AqMYDbn9QK1LmXgB/2
 3YaShHgCchftXr+RUnBZGO2YACxWUMqrqDVArhlj8hj5wRTJc38hphwb3GB84Sa4Z2bRHPiuSVw
 hVCw1U4FoOR5PlmFuoxwOh4qJLkQSRwL4ASFEtDt1+l11jBRnsRdneOMQTqSF57KmcRHnxe6WPv
 J1+3m8MfWv7794l7jbFpA1sAf0SIGFHreWmvcb+iwrBDv/m4ovaUmQvfPBSHADQdy5yy2soeKT7
 qXXnfwlo1rJJoi6o3+GRMikE9BXLbrDmBXMUrFRQVOCtRO3Cd1nt65XGLO+tL96p9SD3EjTi49a
 NwfCCLHwRZuZWhJQdlA==
X-Proofpoint-ORIG-GUID: K721EMGJ18Mke-t1mLZMMFQtrGfu4Pad
X-Proofpoint-GUID: K721EMGJ18Mke-t1mLZMMFQtrGfu4Pad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Teach the software MSI path to install every mapping in an address list
before publishing newly allocated maps. Mark the complete list as
required by the group and roll back mappings installed by a failed
operation.

Keep iommufd_sw_msi() as a one-address wrapper so existing callers
retain their current behavior.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c | 101 +++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index a43a25078f87..45278c11c688 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -340,14 +340,14 @@ static int iommufd_sw_msi_install_one(struct iommufd_ctx *ictx,
 	return 0;
 }
 
-int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
-			   struct iommufd_hwpt_paging *hwpt_paging,
-			   struct iommufd_sw_msi_map *base_map)
+static int __iommufd_sw_msi_install_range(struct iommufd_ctx *ictx,
+					  struct iommufd_hwpt_paging *hwpt_paging,
+					  struct list_head *msi_maps,
+					  const struct iommufd_sw_msi_map *base_map,
+					  unsigned int nr_addrs)
 {
 	struct iommufd_sw_msi_map *msi_map;
-	struct list_head *msi_maps = &ictx->sw_msi_list;
 	unsigned long *newly_mapped;
-	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
 	unsigned int nr_found = 0;
 	unsigned int index;
 	int rc = 0;
@@ -392,16 +392,36 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 	bitmap_free(newly_mapped);
 	return rc;
 }
+
+int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
+			   struct iommufd_hwpt_paging *hwpt_paging,
+			   struct iommufd_sw_msi_map *base_map)
+{
+	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
+
+	return __iommufd_sw_msi_install_range(ictx, hwpt_paging, &ictx->sw_msi_list, base_map,
+					      nr_addrs);
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
-/*
- * Called by the irq code if the platform translates the MSI address through the
- * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
- * allocate a fd global iova for the physical page that is the same on all
- * domains and devices.
- */
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr)
+static void iommufd_sw_msi_set_required(struct iommufd_group *igroup,
+					struct list_head *msi_maps,
+					const struct iommufd_sw_msi_map *base_map,
+					unsigned int nr_addrs)
+{
+	struct iommufd_sw_msi_map *msi_map;
+	unsigned int index;
+
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index))
+			continue;
+		__set_bit(msi_map->id, igroup->required_sw_msi.bitmap);
+	}
+}
+
+static int iommufd_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
+			       const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+			       size_t granule)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct iommufd_hwpt_paging *hwpt_paging;
@@ -410,10 +430,19 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	struct iommufd_sw_msi_map *msi_map;
 	struct iommufd_ctx *ictx;
 	LIST_HEAD(new_msi_maps);
+	struct list_head *msi_maps;
 	unsigned long iova;
-	phys_addr_t phys_addr;
+	unsigned int i;
 	int rc;
 
+	if (granule != PAGE_SIZE)
+		return -EOPNOTSUPP;
+	if (!nr_addrs || nr_addrs > SIZE_MAX / PAGE_SIZE)
+		return -EINVAL;
+	for (i = 0; i < nr_addrs; i++)
+		if (!IS_ALIGNED(phys_addrs[i], PAGE_SIZE))
+			return -EINVAL;
+
 	/*
 	 * It is safe to call iommu_attach_handle_get() here because the iommu
 	 * core code invokes this under the group mutex which also prevents any
@@ -434,33 +463,33 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	ictx = handle->idev->ictx;
 	guard(mutex)(&ictx->sw_msi_lock);
-	/*
-	 * The input msi_addr is the exact byte offset of the MSI doorbell, we
-	 * assume the caller has checked that it is contained with a MMIO region
-	 * that is secure to map at PAGE_SIZE.
-	 */
-	phys_addr = msi_addr & PAGE_MASK;
-	msi_map = iommufd_sw_msi_get_map(ictx, &phys_addr, 1, &handle->idev->igroup->sw_msi_range);
-	if (!msi_map)
-		msi_map = iommufd_sw_msi_alloc_map(ictx, &phys_addr, 1,
+	msi_map = iommufd_sw_msi_get_map(ictx, phys_addrs, nr_addrs,
+					 &handle->idev->igroup->sw_msi_range);
+	if (msi_map) {
+		msi_maps = &ictx->sw_msi_list;
+	} else {
+		msi_map = iommufd_sw_msi_alloc_map(ictx, phys_addrs, nr_addrs,
 						   &handle->idev->igroup->sw_msi_range,
 						   &new_msi_maps);
-	if (IS_ERR(msi_map))
-		return PTR_ERR(msi_map);
+		if (IS_ERR(msi_map))
+			return PTR_ERR(msi_map);
+		msi_maps = &new_msi_maps;
+	}
 
 	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
-					msi_map->id);
+					msi_map->id + nr_addrs - 1);
 	if (rc)
 		goto err_free;
 
-	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
+	rc = __iommufd_sw_msi_install_range(ictx, hwpt_paging, msi_maps, msi_map, nr_addrs);
 	if (rc)
 		goto err_free;
-	__set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
+
+	iommufd_sw_msi_set_required(handle->idev->igroup, msi_maps, msi_map, nr_addrs);
 
 	if (!list_empty(&new_msi_maps)) {
 		list_splice_tail_init(&new_msi_maps, &ictx->sw_msi_list);
-		ictx->sw_msi_id++;
+		ictx->sw_msi_id += nr_addrs;
 	}
 
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
@@ -475,6 +504,20 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	}
 	return rc;
 }
+
+/*
+ * Called by the irq code if the platform translates the MSI address through the
+ * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
+ * allocate a fd global iova for the physical page that is the same on all
+ * domains and devices.
+ */
+int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+		   phys_addr_t msi_addr)
+{
+	phys_addr_t phys_addr = msi_addr & PAGE_MASK;
+
+	return iommufd_sw_msi_list(domain, desc, &phys_addr, 1, PAGE_SIZE);
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
 
-- 
2.43.0

