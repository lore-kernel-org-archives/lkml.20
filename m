Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA744C0420
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349435; cv=none; b=QZTzJ86RXtKE2QVDYn5GiVMyhQYCNS49AcqIoBZ42TK7neG8HFN6xw2lwipa7SItPNC3Gn9i35hFH/2+zyXyz8SIhBviYZ0BGYQiNrXAZgNgjP8ImI4lgPZOs5DG0UDfBc2bCvSrx4l5Vv46oHPAiZw37b1Vh17I62HJ+b9JMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349435; c=relaxed/simple;
	bh=j/AaTRyIG1jV1jycm423PVB7itVLLJ16S5Vn45gt3Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGbGxaumQYOQQOYNp0i93AHfJId+NiOTR0B20+NqaPue2czmeNVv3wveSAGTmKjfpmHCHwsGWnNrllqdwLWLf0GalVLYAbgtQqGgVPuLmZdLBLeplBvqaUSSD+OF4NsbgDTedcsmXsnsg53U7Tyrdl5k6Teq3NcJKw3Q01tpWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtB4Ff7h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVUNeNbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtB4Ff7h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVUNeNbn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBVAKe426282
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=74iQNB8RUMX
	OEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=; b=jtB4Ff7hILDCdrFIrIiGa+IYf08
	sroVn2zma8vsUUe4ND6YKJDHHA3OK71vqB5blVOBaWdgT7pvvTT+0S0z1T9QHfVF
	06eZcYKc8ShCJEOS/1LCORUPez12OBfKFb82SzYnmBZBpq/AcGKUHVh7pQnLpzGg
	EUkAcvydKdRnsvawTxNjN5w0Fd9IXrqJoyIUckld7CAp3PSy2K1jFI7fNRYFBLLv
	gV9v8EtJJVhSaPSfd91W1iKvqQ+c39ochbHLhu4QTYU3xN1Sfuqjh9sm6aO9ZwvP
	RHRT16k5WeIai2mNMIg49I5gYLHlkvglGWuaUeNhTe/rlLhDc6QvPRWPHDA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e8ses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c7e1d8bbeso102406241.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349427; x=1790954227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74iQNB8RUMXOEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=;
        b=WVUNeNbnSNS0hZjrfmOWCPPjbtrx7J7QiE6rawd6PsX5il7tN0FWfE5vS4SuUFr/fy
         Kb1MNdKNIe0HJbOPqF5cgn8mKWg8cYNhrrPVLatUx7aCuXRp2g8YBiZFe6lCmcd5O8lq
         jIuwF7pYOVxA+EZJGFTPevo2HFdPFz5xH+6h9aLFqcZraxFKXLGghRfEKnFmDOBJttEq
         eM7KnTW3/hsMudHixs5cAxl1mQzIARdivvb7vX7NfTKwDsk4aKaJpCovMferJPoT1wkL
         zhq6SEfIHUQB1KvfvzkRoeLZ4VgL6QKEoNolHyktdbq6Xs4pwAXUdaCL7bzjfpOLY+MA
         8tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349427; x=1790954227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74iQNB8RUMXOEtUKhZVWnVdPbSa6Qnll3VofRt8K9nA=;
        b=s3HJ+vYd28qLx6bvsQZ+9adbXVYF8y8RdRthzmDFL46N8gjODuihONUp/RUxxHATPl
         F1tV/4c164vzcYxmtMF0V56I16CiZ4fuds/peQ9CjEvI/MU8jEFe22WBwTCh4jj75+sZ
         yuIcxjokafuu+EH/oD6cc1+krM6443ZzXkjrpGr/uTC3fxx0fOzfcnGmzuJ6SEciEj70
         3A22FzshVVMTvOHL4Ez1qelYoDbRLNIUXRpcEb6DT7YxVDb5DOybLmAtoRx2X2kJdvjk
         CNAam49vxCLHuKZbFO/zV2emJgWCUoTBpxHv44IFLqpHApktju2yd4B74jP1w438JlBI
         VImQ==
X-Gm-Message-State: AFuF++k8O0ksvTBeLz6i9cINdtygFspW8fTNPBLZOkdP421EbkydZHv1
	wPouoNKBXko0GMA1850ITGTDS8zs/me1veXA5VZSmvlgY67QWYAekF0wVK3GtnNZFcMbr9Cyl7E
	zZd/L9gDngXdoMAUuYpqDkHe8PvYapiuTgHgpMMjD4r9ZBPlHC94Wl3DAXuaUh6csUmw=
X-Gm-Gg: AYBFou3kab2LLO/nYRMJju0nnuW2BqiJAvhcN4euYMsEgwivNsGtQ+33W7nOPrCpqYx
	hHygd1Ta90h5mZGvp08S0nrNCiZdPMlZXbfOAWp1O6BOsPZ2yRowzAcU06tFSuchINDFxmn96F0
	allQTsOoy1jyOEX9Nc77vSSIWKj6GXkyVGNiBkECYuflZsZnrCEUZeaRqwnffIYHJciE7fbKVow
	CIiDoswdcTN+r/Ebq+bLbxd7AcekH02wLtYa66tEseauSseZH5a4obXkz8yBf8+nVTRgooo55oS
	46H3mGjSUZcIDZuRGSucXf4ycTx/dAOpQ0fZh/veCcjUAr7ol/mrSNbZGEVkUsGPb7xyRwU8Zg/
	UGSHgjrxP6cF8jLqScTirg+xo7rQlQjuC5lpVZQ==
X-Received: by 2002:a05:6102:3954:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7af7d6c4e35mr1497500137.1.1790349426970;
        Fri, 25 Sep 2026 08:17:06 -0700 (PDT)
X-Received: by 2002:a05:6102:3954:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7af7d6c4e35mr1497479137.1.1790349425890;
        Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm176766415e9.3.2026.09.25.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:05 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 02/16] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Fri, 25 Sep 2026 17:16:45 +0200
Message-ID: <20260925151659.419512-3-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX0mOb4GC1X7DQ
 pC1cU4DotzY5Zrt25s3bizqAvDuCYYduGxzQUqym7W+2zXi/fCGSJn/kKfVvCvlXI3h8/tLCY3e
 r92FJRhyNiLdX0p80/2JaKScE8lKVSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxm17heoL7pVq
 hdfFjLl+y+8a0j0lmze407ccBLmTi2JHmx+IE586uxskmmXs0H7WO9RrXk+edLxCIWWU1BJkUSt
 /aP3l8PSu7s4wk4n+4eZ6b/ul+e+lq++4tvm/vOaZN+yvXQTufUxikud7KrVIsWghhficiLoaiv
 /bHgnrXNpsIuHkulY9zV99klu1d/5ehk3uxh/hrsVirba7QYXhjI0r+C92mtCIICiec0LFrjRzy
 LMkFv7yHqyYersDNe6YEtiRVeRMJZVa02f56cH5/2Xl06QB8g4IFsJcAVxHGwwaagvm6eCBCKOS
 LPNPbUyoLMPCQAPQGaPfoXHPhhv5Zaw7Ni+Yfleee6Fr+6q6QpTkK8hLJtT5ZRFtf7RT1WRiFUG
 bXLn33s5wplXuB8kK0NYMBAQVXcsxPkPehSx0SICtHsOmiQBenXryhpY3cKb4kz//PFYO7suJPS
 Qs+bMvxJtZKf1dhABzw==
X-Proofpoint-GUID: Zu9w4L18g4W2hbyVN2TdmqER8NU6OdD8
X-Proofpoint-ORIG-GUID: Zu9w4L18g4W2hbyVN2TdmqER8NU6OdD8
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69074 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=8L5tTrZ4L9qXjquGIIcA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

struct iommufd_sw_msi_maps uses a fixed 64-bit bitmap, limiting each
group and hardware page table to 64 software MSI mappings. RISC-V
interrupt remapping needs a mapping for every possible CPU, so this
limit is insufficient.

Make the bitmap grow on demand and treat IDs beyond its current size
as absent. Cap it at 16K entries to bound allocation size while leaving
ample room for expected software MSI users.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 37 ++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index a664c70a6fe7..28e2c98ef953 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -49,6 +49,7 @@ static void iommufd_group_release(struct kref *kref)
 		iommu_group_put(igroup->group);
 	}
 	mutex_destroy(&igroup->lock);
+	kfree(igroup->required_sw_msi.bitmap);
 	kfree(igroup);
 }
 
@@ -450,7 +451,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 		int rc;
 
 		if (cur->sw_msi_start != igroup->sw_msi_start ||
-		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
+		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
 		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index e4d17a748178..ea705e416139 100644
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
index ef6e119c2a75..81f41d437c4c 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -41,6 +41,7 @@ void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
 	}
 
 	__iommufd_hwpt_destroy(&hwpt_paging->common);
+	kfree(hwpt_paging->present_sw_msi.bitmap);
 	refcount_dec(&hwpt_paging->ioas->obj.users);
 }
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index eb2e85b27e42..774cbe28cbaf 100644
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

