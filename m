Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4B4C6EFC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349446; cv=none; b=QWd6CJegOXtq2gXM2owOQ+amWNyNZRlCzypRF6tkEs+wyCAybpz5ZZhEI/FHsztitmUaHeTZQs5KUBdz7sDkYmyuH0mjm4MCbR53zchJCfVia/ulFLSxdNWzo/bK87LfQy1HErxkt3c3w8dTN0w2/t45k2s2On8PgFTZQkrOqFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349446; c=relaxed/simple;
	bh=KxurCe6pgQSQsY1f+dOhy3ExgK0ecAyXvRk9c+RKIfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUIJw54Ripi+2f83bKkEs5jh1PH8OpUXW+A9WTVNNW9d5XBU5r299A015gMQI+iOsguu17R61caepM/KJCs7GoRgaOOAKgqDo/PD0KDp+dvITvPd9gQE8t13sSlHiY6CIXQAGBWFQ4xXHf+sn9RaIbJ/yDAuZGDpmWO1jUam8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcFLfWbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7Dr7TSH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcFLfWbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7Dr7TSH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD3UeT3532398
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t1fCrnwj5QJ
	BWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=; b=KcFLfWbnuA8QS9fwkAXrWsLhWHA
	8L11ss1tOZwqZoDQEkdlUaMj6ILXLvFhiMGGcfJcH6TCZ39qwC15MDV+IXpuKU0V
	AT6hPYLpK4ns1Bp/glA60FWSE734uatcUGc6OBmqb50icAAUGJGbn8BOc0f/EB87
	hGNkqDg5/mlblrpz0RKV09Y4PoUpwWkS6McAysrsqMt8ibuawQWSEfz/78Z/QOBE
	rMCNU4vQwu2wI9SyJt/YgP+huQOY38diVJpuOXDYIDkkhE0bORxHukeBeocmTOi0
	L4SRZAShrO9B9nvApSUvj5DyLvoN45VZ11ZX4bOyDv5VavXUFOXsbR3r6tQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbs3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-790de8f0cecso224984137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349436; x=1790954236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1fCrnwj5QJBWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=;
        b=G7Dr7TSHx6Gz5jxo3P+Ctcz/mF9C7CYkd/f/2FyHDMx8/JlLbeZkzmScBDYjZikOUX
         L6BUmXSnEUkIqPj/QSDkE1hQzt7+JSdOwWM7TZOTLzttaTwbExV/2NzXIRfygtoN40z9
         5C8VfIr5v4BiShoqznqxj2f3pWBdEVFMGipSL6omHaICEcRq2er/cdvyLOdnunhqwE8T
         uOcO57JpfeNnItOu4ERAG1NAac1zNuAOZQysTc+JtwYUeOdJc6EkklcytHpzOkAbYcER
         xps9fnghM7VJuQ+lmBdwIcjhPKXj82ZC3ACRB2hAMegDw1Zin/aKe0rL8kmtM6jaN31v
         YnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349436; x=1790954236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1fCrnwj5QJBWHsPw8FOuYqTuNXRMPlCtQWMjUzAOhM=;
        b=u7SzMAjWtrrx/X2JD1Jydm4RL6I8TaZcQm6aVK6Ydmo0kLD9SYVrobA2yTzDxfFkZN
         8wvVcnNM43V7ekhpMFvb2ySMXmji0HaDkCeVNs6aQPRGh/ltQCI8p8vsPgt3xBajQ65L
         dBuI0aZCAKdRb2iyhro+pdOXWsVLbuu7WIxMrbKSM1OK5LzbnzqfmhY+J1KJCbtSu7Q5
         V4bQOtMsL+LNZD1TmdfQ8Hs6touJHon1Vu0+h2Dm34+HN/7HEop6QZOuiWWr1rQQkz7Q
         bTzGGvpa3kijx3f4JYUZ7XY8D9LfULMI31W/MlSDgSAJZmszqpqGlxWJqVdGkrmUKtrt
         VsYA==
X-Gm-Message-State: AFuF++kYFv7PAA8ZX6dTvfkCcJlsemFw1lHkogLyC9Z2X321nbXe/DhK
	TKSEDZt8ojTBAhluykkjAyaQKh80SFApnMAHT2yxNSfqpIeZZ7N/0PWvuEFdlPmlE3OgdrG4qGE
	zjFwGiQxmw3qLAj71BKb/wJg8JWUkv3lb+8h7c9/THW8ve3H030yQDy/v9ni/p9N+GsM=
X-Gm-Gg: AYBFou0FzueOT1reOP9aC8YfZDdln1i75Fu4af0gXhy98ZZDAs5xG9e6OaViw9Sgnmg
	RNWbc2iABYi1exPIUnU91LZsVOogezkcXqqX+GfcWaqeGaCC29fPslILeVqbOYMgyC9avrpI0wS
	dNCdfOqzdE3IodU64zVfnA62AzcbkN7x4WISMgMW6McLI3t+ruRhvuGazbIKcMIjyJDE4TFfldU
	9aNXD7GMwllSNDewGoGhVQlX06HNe1QddG7W7lZKepZxkdcsjx1QO4wBuJS72q4z37Q5QkkGD1m
	/zwXQUkGJz1KWgOgw4Q4TiYN5RVi6kVrw93uUCi1WPhhhqlal7kgk1XHukavim+sTS+JIB0VLHY
	PeaB8J+W/9czfov4Q4wRpCvHMZikbwtEVkTvqdw==
X-Received: by 2002:a05:6102:2910:b0:7b3:21da:d255 with SMTP id ada2fe7eead31-7b321dad719mr335052137.32.1790349435932;
        Fri, 25 Sep 2026 08:17:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:7b3:21da:d255 with SMTP id ada2fe7eead31-7b321dad719mr335034137.32.1790349435442;
        Fri, 25 Sep 2026 08:17:15 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm153857745e9.7.2026.09.25.08.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 07/16] iommufd: Prepare software MSI installation for address lists
Date: Fri, 25 Sep 2026 17:16:50 +0200
Message-ID: <20260925151659.419512-8-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6907d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=fyE6B5mSzfnmm1qxREQA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: levnzbuOAlKcweU1rwl5qzS2nauacyO1
X-Proofpoint-ORIG-GUID: levnzbuOAlKcweU1rwl5qzS2nauacyO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXz3/ZPDxVbBWu
 idUDPLIijbNNaUobfkg6ltXtcUUm93UERYUMXKK4woHyrIWmpf/ZWKnG8ML9/ZgwMRFoDNZVJNm
 eABfmfdc+6203iBcWUY8M2vZH82I4Lky0QpTOel+n00xx4X7Ycrn6bMQObd50fghtp4IvgbBYR2
 1tBjjXk1MfyKn9c7vIvHvnSdhgEknfKNUHRLeOoCvho9HPRrs/9hySIjLHqzwP9fcQq6w/Qb0CV
 MXdeHX2KUJgl40ug76/nYa4JVL8tzYokZLt1KwLsoME31n4e5UzIOLmIjGHIuZReuopq6JXZjp0
 H45klmFpeFxGyRh5BBlzwUocvxwxIoaoab5dJCkKRS7VYOuG2sQJW+o7Rti6OuB+Podn0zEEaIj
 Di4ofWGdjVWw4mA6J4C1TMWBIeW2wXu0AAl1VULgoGLt/E6XvK8/fb+VLHWJj5dFHGojjmw410D
 o5F82uKob/evWKusc5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX5xSR4Nh5nkcP
 CRXpx/ewmPSxXx63XavIQ1jfgXh+9j5vq2lLHTUo785PdemiijVBm/ca9KySYTlJOHAkWqueRDV
 xsaxEe0hIHyOQchP2Fn7UAwEVSyXYxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

Teach the software MSI path to install every mapping in an address list
before publishing newly allocated maps. Mark the complete list as
required by the group and roll back mappings installed by a failed
operation.

Keep iommufd_sw_msi() as a one-address wrapper so existing callers
retain their current behavior.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c | 101 +++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3aff04d9dd04..f4e812e43822 100644
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

