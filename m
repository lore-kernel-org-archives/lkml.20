Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC974483B9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755994; cv=none; b=RBPBWPQah50Hzv6FkctPWdLOy5Fo19NqqCCYwn5FwozJIL+us0FlicQzfOSLLmpocvQ4COWeKbzjdqiBLvwCkexAXXLOiam5bXvvSq7BkM6is6e7kuPq8xfWi+igG3nwDaH7phtytG9D9G+YfSY33gLT5d2iSamzGJe9Xc70bfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755994; c=relaxed/simple;
	bh=LtlqMXm9zBkwSU5DtdkUgM+gIjTOqK4fl4LJf+WqFTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6TLaWYq4KtsGpPkYuwpEmlXIAcu51vZrqo7TAwrUXXtVW5JxGbSoccy0NiFyy3rB+eBjSDO8oU3GYus1dkehzbSStYdSj1CIa6LDYD5BMXfppJ9fFtu9glSDeTVSLAEYH5Pu0iRx3aCrZBO3g9DziQfbSu/SI/di8Em6QLs3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXQQ5H7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=To6+c2aZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXQQ5H7M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="To6+c2aZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuYa0502286
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4GHoWBlwh+Z
	DFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=; b=QXQQ5H7MbnmZLyvVpcu0bGo64/V
	LAZU0X/orBhUqJr16/Gt1iLWM59jG8ffHOljfRQrxikYdpgm3+cOhM3XuPN9gKYI
	KTi89IFVlKhLTx+BVhRLUgVCdEpI7I5M3JSKF/1ll6oPlhsAsDouPGmmssnowKhP
	dE6gX7CdVAVoA/QyjLdzMRUD+as6ZOrSqzptG86YdY4eKdqhCl8FoETKcPsG/8iI
	V1F0egDDLiZfRu/3QNQ0z5UcopLqWENfbf1vaJa/c45SfrkwMvriDyVcHA1+on/V
	yO/86+pvfdsh87aMOWDrIj+e0MEd6X5QyYa2FiGTd+a2THbPdY9RSy878sg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u0ka4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so18673531cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755989; x=1788360789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=To6+c2aZaK9MYTyLro6GzumPU/zuMNZgSXVSxhbqMLIeyr/fFNuoNa9zpVnKOn2RlY
         sCfLfiShnSdWQhd8akFdRdIJzAUE7nktcQPmK9bNCdzOpOir7ZG3OrxA2Al1pZ6F/kWQ
         A6Tb4eZU+YEVLYwDnO8JXP+ydXSN4hB9K8S0MbiBG/biWXyVapCAKkcGD4EOf8/NcJNr
         1EIYGmUQ7Jt9oogcVGYY0q0g+ALebupsuARTWGCWiv39NQFD8atEeRgWsFc/UTCAwKgU
         oXggNcbF9N9zEvDyGYXibwJZWgP1P21Jtee/4N572DJ3B3WdBCq0iXrUnN29AGuU/Nnm
         M1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755989; x=1788360789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=Wx1SZ7A+cnJKw9XSCHK7jwE+ZoVfv/xoOkHbjVuITr2NYXYYkOB8ydKL/4ZFJhA3NO
         iAS9iU9875jMDdPvSQkbw1kKorZerJP+acl1hkjGu/62h85dFtLCOVhax8rOuECsZqG7
         J/FCmwOUfVWRTBsLcs/NAz0804UDeia+zQ9Bu2cSLPrRFSeTOTYZ+Jl9+KXQzN0zwnwJ
         btzTuN9U5NqMigQlYAo5MmZfHqGi1FCxl+d4mpPdSJZhy5tgqT1WN+nMq4W26oiGSbsd
         ZgUBKbDqgeWexIMb2ovkbghJhj+7sBLtphoKe3t+ZDO5b+b4CKGolYpOX5RUKrYpVfnB
         rqiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCK0VsrhXgHKS7wmpCnWT91NA6KYHChnLjsKUPcUZbvKJoO9RgULw+U3pbkwS9filqzBYH0E/Nmjwsma0=@vger.kernel.org
X-Gm-Message-State: AFuF++lABh104zTMNGUHmkytjg1IYRc9f0Y2pPwapo1Flj3CVcE8+yNU
	0EFDyYm1GAw3ESnSF0wH7TW+tOkP3dDpYJvNlcFWE9fzjk/ff8/Pxkr1zHwBumrgLz8YkeGywGc
	Qf7YqwKg4HR5TejnXAWxTsjhZJLbehmIrhnNZgAuJxqAMsZZB5zpaEpGSDXTsGz7ph5I=
X-Gm-Gg: AR+sD10iBLoXDpLyExVaBUhMfNnxi0mSU/zyABBUc6i/KkyiSn6aOU7YgXb7sEh9mFO
	sNqkOvmwuacO1NIp+uzDiiUSTtJ3whEeV4bXJUwZESlDJ+e7xaNiMuMkMZyMNT8r91bPVVHVBJv
	9cdO6wXX55V/O6IJKPBqXE8PNQTX2650nmYsF8lFtTYsTOthfKOk13uq/0wIWxu1RhL9i6aW0yE
	CsOXu628bccKIRn/ntyZv/LnlWyrgijs4GeR0jd8LRnOLsiPyHo+K9fpIKN0WWnuJa+Bd0O/dA9
	S74a3g/2k/UCbaggznTrxGkcYe5jj8Vu1Z73gADcTZWJg4pMmQgWC+TS9QMNo2OsFIjbzqtqJcD
	SoCUc1ziS
X-Received: by 2002:a05:622a:1909:b0:51c:775:c175 with SMTP id d75a77b69052e-52e42472815mr70280721cf.40.1787755988947;
        Wed, 26 Aug 2026 07:53:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1909:b0:51c:775:c175 with SMTP id d75a77b69052e-52e42472815mr70279971cf.40.1787755988291;
        Wed, 26 Aug 2026 07:53:08 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm19147275e9.3.2026.08.26.07.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:53:07 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, kevin.tian@intel.com, robin.murphy@arm.com, joro@8bytes.org,
        will@kernel.org
Subject: [RFC PATCH v1 2/8] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Wed, 26 Aug 2026 16:52:56 +0200
Message-ID: <20260826145302.449904-3-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX3E8xdA/Hg5Y6
 Oo/1j6up7Qpe29NhDfh3NtsYr98a43bKW3dZwAErXGbISYbOtfah67JR5UTeZD3JPnFItas3Cc2
 dtb0dclCWneBu5zjU+yUKoKX3EnkyC7HGsFTpJhXJm0UBwhuIklJVZUW9i+TSh2QCYQsCirLqyp
 B2Bzh4ZJ7B/pmtm2pCR9MvpMB5CeJn252fHhSVL0POSI4JXPlN20hzqfB/GSWkhDaT7Z5J9uYVQ
 /T8BUGmnCTCkgHJ7iTYi9RUg6f4xSAg8/0wd6pAyVJsKu2CVu7qpzxRbv+HekOysOwsVBAvAhD0
 K1aL3T70adg2gj5DXthGMYsd3p/HTXE1Hdem6HQy+HdUC+Iy6060bbWexLchakdVGBJZmWKupGr
 3VR0OyBq+cLE148UmIsz3cBVQvBHca2cQ4/rm5nwykqR0rbhur7McSN2BNSZfLGlC1qnbqWOm+c
 WOKd1KlaqoHSww/GfoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX1xP2F641ugl3
 Ns4h0Ol8Pdq5phhFkMIQlX6tY30sHLfJm0lCcvs68zzJpP+8w7wlKJxeq/HcX3TP0AySPbq9SAc
 7Oeog8C+/H4co74YDMU6c4lPJlXqzvs=
X-Proofpoint-ORIG-GUID: ilETOPF_fRVnHM5kziAWHAacPrJnHxF-
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8efdd6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8L5tTrZ4L9qXjquGIIcA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ilETOPF_fRVnHM5kziAWHAacPrJnHxF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260124

struct iommufd_sw_msi_maps uses a fixed 64-bit bitmap, limiting each
group and hardware page table to 64 software MSI mappings. RISC-V
interrupt remapping needs a mapping for every possible CPU, so this
limit is insufficient.

Make the bitmap grow on demand and treat IDs beyond its current size
as absent. Cap it at 16K entries to bound allocation size while leaving
ample room for expected software MSI users.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 37 ++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index d488c23fd353..868f1e591208 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -34,6 +34,7 @@ static void iommufd_group_release(struct kref *kref)
 		   NULL, GFP_KERNEL);
 	iommu_group_put(igroup->group);
 	mutex_destroy(&igroup->lock);
+	kfree(igroup->required_sw_msi.bitmap);
 	kfree(igroup);
 }
 
@@ -384,7 +385,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 		int rc;
 
 		if (cur->sw_msi_start != igroup->sw_msi_start ||
-		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
+		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
 		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3b8067976eac..d0b05b1fda42 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -196,13 +196,15 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		if (cur->sw_msi_start != sw_msi_start)
 			continue;
+		if (cur->pgoff == UINT_MAX)
+			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
 		if (cur->msi_addr == msi_addr)
 			return cur;
 	}
 
-	if (ictx->sw_msi_id >=
-	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
+	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
+	    max_pgoff > (ULONG_MAX - sw_msi_start) / PAGE_SIZE)
 		return ERR_PTR(-EOVERFLOW);
 
 	cur = kzalloc_obj(*cur);
@@ -222,21 +224,25 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
+	if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi, msi_map->id))
+		return 0;
+
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
-	if (!test_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap)) {
-		int rc;
-
-		rc = iommu_map(hwpt_paging->common.domain, iova,
-			       msi_map->msi_addr, PAGE_SIZE,
-			       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
-			       GFP_KERNEL_ACCOUNT);
-		if (rc)
-			return rc;
-		__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
-	}
+	rc = iommufd_sw_msi_maps_ensure(&hwpt_paging->present_sw_msi, msi_map->id);
+	if (rc)
+		return rc;
+
+	rc = iommu_map(hwpt_paging->common.domain, iova,
+		       msi_map->msi_addr, PAGE_SIZE,
+		       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
+		       GFP_KERNEL_ACCOUNT);
+	if (rc)
+		return rc;
+	__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
@@ -290,6 +296,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
+	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
+					msi_map->id);
+	if (rc)
+		return rc;
+
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
 		return rc;
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 623cc608ca0c..54873de43eb0 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -32,6 +32,7 @@ void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
 	}
 
 	__iommufd_hwpt_destroy(&hwpt_paging->common);
+	kfree(hwpt_paging->present_sw_msi.bitmap);
 	refcount_dec(&hwpt_paging->ioas->obj.users);
 }
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 43fbc5bed8de..9ca5f9f92cdf 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -9,6 +9,7 @@
 #include <linux/iova_bitmap.h>
 #include <linux/maple_tree.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/xarray.h>
 #include <uapi/linux/iommufd.h>
@@ -29,11 +30,47 @@ struct iommufd_sw_msi_map {
 	unsigned int id;
 };
 
-/* Bitmap of struct iommufd_sw_msi_map::id */
+/* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
 struct iommufd_sw_msi_maps {
-	DECLARE_BITMAP(bitmap, 64);
+	unsigned long *bitmap;
+	unsigned int nbits;
 };
 
+/* Large enough for foreseeable SW MSI users while bounding bitmap growth. */
+#define IOMMUFD_SW_MSI_MAX_ID	(16U * 1024 - 1)
+
+/* Grow bitmap to accommodate id. Must be called under ictx->sw_msi_lock. */
+static inline int iommufd_sw_msi_maps_ensure(struct iommufd_sw_msi_maps *maps,
+					     unsigned int id)
+{
+	unsigned long *new_bitmap;
+	unsigned int new_nbits;
+
+	if (id < maps->nbits)
+		return 0;
+	if (id > IOMMUFD_SW_MSI_MAX_ID)
+		return -EOVERFLOW;
+
+	new_nbits = max(ALIGN(id + 1, BITS_PER_LONG), 64U);
+	new_bitmap = krealloc(maps->bitmap,
+			      BITS_TO_LONGS(new_nbits) * sizeof(unsigned long),
+			      GFP_KERNEL_ACCOUNT);
+	if (!new_bitmap)
+		return -ENOMEM;
+	bitmap_clear(new_bitmap, maps->nbits, new_nbits - maps->nbits);
+	maps->bitmap = new_bitmap;
+	maps->nbits = new_nbits;
+	return 0;
+}
+
+static inline bool iommufd_sw_msi_maps_test_bit(const struct iommufd_sw_msi_maps *maps,
+						unsigned int id)
+{
+	if (id >= maps->nbits)
+		return false;
+	return test_bit(id, maps->bitmap);
+}
+
 #ifdef CONFIG_IRQ_MSI_IOMMU
 int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_hwpt_paging *hwpt_paging,
-- 
2.43.0

