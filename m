Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C54A5EAE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188393; cv=none; b=KfWNndlR9FNznGxoFmOZNnKU54Zw0iIbxrU+X35YIi4S99d67XFdEVM6/aIf4ZoIElHcuPMTQdawYf4yW8kC8LOGWwX2BUqprgcT1tbBeUudPAvEjvo5Pt5rey4Dwym65sRLbAMZTJgnBl2Kj2uGXt8uVLEtbS2ieO0gsyGXFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188393; c=relaxed/simple;
	bh=LtlqMXm9zBkwSU5DtdkUgM+gIjTOqK4fl4LJf+WqFTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRqB02NQIrWGArKZ3q0+GkhRP4G1bFBnCNxfX2BO9a1VUSs4krbUSGuEw7vJDD65B9ogV2ZxW0z4B4owREP2mz63/as1hIrn8rwbh/SkOMw2le3wC75lsTm9B4/bfHeZp1rdUkdYJ0nHvf33Y6/R6ZcbtUy7AyxvogoT/nDis+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWKFtOR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKyEjp2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWKFtOR3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKyEjp2e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETPij3703662
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4GHoWBlwh+Z
	DFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=; b=WWKFtOR3UPCpEXNS/clvIkda4ms
	qH3YTzhPwYSzkDmsNy4hULkg6/anMEgbJeSZ5U4SnzkD71jbYGq6GrDFxYmXUd6y
	n6AH39e8p/HwrN9KJn7Pn91kFWEAaMbs2Z5X4jGfdNLUHPYaCIzC/+mKHwG5z9BN
	r+S0NCCoyZ/Dli083bJJz6L8GtcsddjiVdVw1RcwgQ2qA67i3dchTEB9vQ6Uz0GU
	hf3aVEgWMB4vnYcXuaiOBwtDeYrXWSlW/cMngcd1njtCGD4KFF/at2CgZPvi5dWH
	LUTFTP8I47c5h+poQ1hoO0YRRPL0qpuTbXaMi/H3q2HxWqQVY9HKRXj1eFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390ca1a9abso522262685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188389; x=1788793189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=AKyEjp2eBTa765Z0n6g/dOfzxA2lSgnFNKDUT35j9X+6wd7CUMHprMQsQ8lQWZl3mS
         VfH0wIHNHucHGksnRaSs9BqBCmeMes0nKOgHt3H3aPrizAxuJi6F5w1Gw8tgFtArDq1b
         Xdul2W1AarL4KbpBu2hIn6kvZIHh3OVif0GvsuVSPYT6hvvBXOmwTUAmM+cNxy6GFCYB
         4nRQseFPi1MutR+GIPEzxS0qE2ZXmeAc1z9W8mW6BnAcrCz6XGhzDMVXMPyEM1Twxtq8
         jW8qxRWCKTJIuQ7Bd/DSx1Lq3SLxV2EhdF1EhuiXzI1nPN/i1TLYjYYVu6+lruYxvtFn
         ENYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188389; x=1788793189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GHoWBlwh+ZDFPbKlbwwLkJp6XL3wIYVeEUFlrZWxZg=;
        b=n9qrnGU+vJVc4xmqTO0i+38NcatN28PujfQrs+a4XVA+Dp620dBQ4TKQgyP/RVob1t
         QdZNH2rvsSrP8LuJIyWdKFnrMwEowhZhHMlTDSy5/BRNQIg7l2nLaPSZeqF7y+1hPdov
         GwAsVnkzIQ7BGORgdhPqCosAHyNc8eI5SVO9CIVWewBskblLQ/QbwyNcQHO6VnA9du4m
         tW8GqTEujS4QqhUjuBHFhhL3D9EwbOpClQg25Oa+/OyJqMHZQafHpRP6UAlbIn06+4MV
         SpgMX8dlwy1dDJ2cIl/VGc/34BJhBuzeWaHK5Otn/XWXwt85wnOAc+gVHva86EA6jKSq
         uydw==
X-Gm-Message-State: AFuF++kH6BBPqfBKhgeSWAYGa2+q+BF1+TsCp25nkARoo9gIOUGwKnUU
	ek00y8XBUCA+br4uKseSPZJJDJ1XHEsRp0TrDQDD2Az69GqElN2QGIqegGdGFHL2DroU7vxqZKl
	h06+g08MNYPCjoDN9apO/UtdZ4+G9+N3/G2nJntOL+UHdBPSyCdh78H8N4dMuNMvSJWw=
X-Gm-Gg: AR+sD11skbU0I1xpvXrmAcH9L2hDU0qUWsrhkRc8dmdeSXbKT83SGTlKiOoTRPNXLzF
	T9J3fJmWvZinPgobE0gIC+zOtFH28nHEEGf5VaDkwDk4Gn8578d6tuzR84Qw4J5kNhRWSSprH/F
	ZaeCjAKwUe80zcGV0AvXCQcFMHza1fcWtBLyUuJvlMGhIDqyN5Rxw4Tjab5edtLiaRJmnFReoi1
	vTx+X7kqCnDWpxWjDmxAQk5yXBUN3daMziI+76C7KYOOyAFE+0+h3eizNh18RmAqG0OQguBzxs8
	IVhi+gJZH9IWmT7u6Sgq48qGHe1R6d8DjT9nNEZEY2yQqDU3dkgzDuo4uhyfzkcgzUU0xrc/lif
	b8+P8/Ft9DOdrzQOrLLOteVo+/gWvP4CpnCU=
X-Received: by 2002:a05:620a:8394:b0:92e:5cfd:154e with SMTP id af79cd13be357-93913801d90mr3156798685a.14.1788188389249;
        Mon, 31 Aug 2026 07:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:92e:5cfd:154e with SMTP id af79cd13be357-93913801d90mr3156788985a.14.1788188388672;
        Mon, 31 Aug 2026 07:59:48 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm22270269f8f.21.2026.08.31.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:47 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 02/17] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Mon, 31 Aug 2026 16:59:28 +0200
Message-ID: <20260831145943.313726-3-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxVp2TFLDTDc7
 UC7xKN/T7PyQG5lpt6jlCCOdZzTSrBoRiXD95/Z58Kw5ND5wvkii0crB/i+RHDMXRwLgk7T1tU7
 KKZO3LmIQcuIA6DZ+/ThOZ46B1ZkTeY=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8L5tTrZ4L9qXjquGIIcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX1vQqszePTWlW
 cqHy4TXBVQJA0HCFBnIS9zF0pHo8nq5HNHiLVbs9hsG8EV3Zyfu4i4byVdzji6+CgVj6XDVrZ93
 G8e0l/fVCElvEpOlUBk9xHqwYVpgOgb1UOIucnC2m3z655o5H+b4akM1gWSxpFu/XTQ5GnlGuL1
 pYrS7KKUb8uE9JcajyKCQl5bmH8TScXw9Jfyg03KhR0NCsU2PwjDuQSODtVQ82x7U6tB5+3wn9Y
 nRTCayqXzO2UnYZFOzUuz5w2U6OSgctC/AwYg8k9GF2pwOjGEimPW0wx7Gne2+JR7FRAkfXu64D
 vam77s1MzvNgqnfSbQyS8u3nA/qjmDW1YqqXGyfpW6DaVU6PoN4ImjBj3kFqi7b2G9q5B+kshIe
 asU+/pU/sCD0sj+stax63jqgI3BFIyNCYhvsm93/aaFvuqNKtJw9nhogDaPMKFIsFU8kwaWioHM
 BVHdGqqSxweQgGGXDhA==
X-Proofpoint-ORIG-GUID: TRJlnozOCyK5S-70Bkts9Q1UJ5QPnFNT
X-Proofpoint-GUID: TRJlnozOCyK5S-70Bkts9Q1UJ5QPnFNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

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

