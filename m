Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C44C9DE6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349453; cv=none; b=JBs5gERGHysn3MilXj3nn0mS7z3Q9Ro1NSemcb7m1HzyrR+G8dV0h103tlwGM9UXylYFZK1oFjjWvmWOkhz6ECHxAJ99YSt/jafrFLkn3Bey3pT5yj5ez9JAzIzxPl7PkugNBUCSsepH0AbKnfIAh1+vG9aasWIWVSEjgTy+HC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349453; c=relaxed/simple;
	bh=qg8zIqF3Y/sc6lh+Hxvi2X9SYiYHMSQIve++3OfyJnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bber0oMFIGVa0Hq6XHdyNAjCJvkCYFe2IX7xjtOUlc/TOOsSDVt5Sxufy2+nvyt9HJerag7zI8ytrBLdvVRhWkTLN1uvJrsTMxlnS1R6Csezpvhb1s+d8uE3Llsw/NC4kzngUCabGUxZHRxkAQ97RVtzZIjEAyNOVJ27ysoDKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZRITZ6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/qkiCL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZRITZ6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/qkiCL6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Brn609090
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1X0NVzHxbn4
	ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=; b=mZRITZ6HinHh8PGxb4S4TPBivG/
	Q9kg1OuqQsDA9Xx83GKYms8v2IOwsIrtH85NpvsShXZp2mVF4vHwkJu6fTJmgPTr
	8sBBh2kk6wOB7fpnaBIXhbpW7bYBGMXlNbgSEWR49vzsgWwzZHRci4SuHEhLizps
	quzhcq6ftjpgU73fxukulbvR8MkMu8RIF/NkMuP6XWZ/bLRQ54zXj09hJMArHx6v
	JgKTr9m4FonDT02VA+EYRgbJ0FCSNcz0yr0JuvpIy1iVczl1T/+OOVQz7VgNndh2
	M2Tff8tkv0aRjFm5yAD+VOZ59lwwtYQEabfNGGQnKzlj+HbXL00kH/gk0zQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns16g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-986dfa10ff1so30434241.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349432; x=1790954232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X0NVzHxbn4ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=;
        b=C/qkiCL6wVTcZzWsJwVNCRHm8fenSp8Nb0jPSmlpCQQnFAvyER8fnYrI8NPa7b6KHR
         IMHppMXzQSlQQblIOgS6QFBDXccwASY9VN0gdcYygl2Djv1/yQlO7tjA7ft8jD4tw/dD
         tN+zITc36ukDZ7i4YddTsk5Em8ah2eD5+CkigrBmjX+FahPDVD4kR2Z2gwPDvkQFgOgL
         DZuo0iEkZZ+y6ed7Ngvhjcx6zrEq58PDi/2e/enlVW/Ey/q0BNnNN3bPxeO/8zu7fndQ
         +gulrqyeeAld2nHfsDAr7EjgYC0ifzdFpnkoe8IZPeig/3Zx8Ad9SMLgk+AmJYEOSJq1
         ZBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349432; x=1790954232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1X0NVzHxbn4ywmQH+85Wj45+Tkg1X+lSCNdQaps1CnQ=;
        b=rs6+Y91k+oTWVFLrZoZhf4uriWBSy1/ggk1MWSgvNxB8HjjeDMantJaDpMTN+ivYgy
         py9ANRXr6wE+CJuXxB6V78jJDFzVYbsRGionExbInlbXFfM1xlFQwdu3pHuAG3vUpdDJ
         drnCNQrl4JRH1JE/SqsmgVu2WCeSmtxBE7x38fUwiZwsobauh63XAWEXEyj3lMktLF7D
         h6cCrmVtMYLxXV0HgoaYGY87w3m+T1J4bn6SYTs5HcEvp4bkSc/qRlGVHysoIh6HlUUz
         4u8P0JRkhrSy+mLatfF+IlNhXNJVx5ySNG55gFfHj6e+0+5U7Ql/PTZf9wGoJJ3dENm2
         vZZQ==
X-Gm-Message-State: AFuF++nidY8N/RjQMNZb96KUj493vhreisf2MazeVCb27aioUephPoym
	qKvxrh1+g4lAdW228UOWgDcbUOz0CoqMk8UO6t+czFC+A126NYUN9Vwu6ibDE7BC80Ec5xk2Q3m
	IeuvU1JLl+9GAMDifFNKHNbTVTvOgCHn5msIwabYtoxOdqrUNVurkSCQYlsqT15Bs2B0=
X-Gm-Gg: AYBFou0hflgtuIPF7eFVOFuYjHLDiC3brnKqZvfjxVc3DyTcIYY83jRnW3Ifgum1EDQ
	RvscjWhdDSH9M5ATecc814jTfw9ocmt8qooDTlQSATclCpdCGwyHSuhWMndtV1GDbgFKSKEz+Mc
	x4hKtsZsAIQo+L6R8JTRn+RqKVh7qwkjkqD8+xoVy9fb57jMHOGgoC9oWjPJ5cnC4xYb1xxPCRt
	tecDclCLwTeLKa0EWV3SSh+6gGZhP3u//iM7hlKRSXl3o0mr5gU9yO0/wBssGHwceVcpDHrPrqe
	eUSAkv59FlBNXUpNF5+R3miGghBSqGyp4SvkH9Os/8fb+bl7NekS4ifZzVpH38E3SfrBA8G5cl7
	olu8BzVJoTs2D65/C7+txeeiK9MpVcJzt3FcRLQ==
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2347060137.21.1790349432054;
        Fri, 25 Sep 2026 08:17:12 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2347031137.21.1790349431452;
        Fri, 25 Sep 2026 08:17:11 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm8249719f8f.1.2026.09.25.08.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:10 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 05/16] iommufd: Prepare software MSI maps for address lists
Date: Fri, 25 Sep 2026 17:16:48 +0200
Message-ID: <20260925151659.419512-6-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Cyrap3tYvSaQQ0CdzFT0-JiFW_Pc3X-B
X-Proofpoint-GUID: Cyrap3tYvSaQQ0CdzFT0-JiFW_Pc3X-B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX9riBaUHirNw1
 1Y03xmxEIP7o3tfNbu1ua3iUw0vhtVG6NFYYV/+YuNhmDYlaMI6JVs1E/rCnKg91SIOm41nLJOL
 n6F/crv6Wyh9V+Cu3a+taH/Ct74pX5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX7GIssbGxO4ZQ
 V+fZp/CMn4HwpwRQ7SoL2dlfQl2pxiykBiyxpfG00c+ciZibecNhnoitBZCp0/nzQNn/rVYttLV
 UXBsOspX1dUoG3DmW5bgQpvPGCMwlrXirX9/PWHjE4WwGLKEhfzseCbs8jK1weRpcsN45G1bJc0
 4Qjb2X1XKgqZlUq7/fovuWTMr3r3w0G/IhlXtpjGaWXugbfUAEy9SKsVSxIfpJOaAJYA3CpVbJo
 XaTnyuOirmZDABQOHfcx2U004DaBXt89FjDQkU9vJya4NRjn+JTnoVwuRUesEz+Hi/5MMcCD4NL
 VWjPU2prm51hm3Nv0UQ0tanysk+fNs3bl4Qkv8fgyHfmb1332j14xJAkDzoIbD6vtSEDapty/Bb
 miiAbLLnevDkrn61c3cgjPU1Vb18/fYo6yp2aV3FbqBJ0zzaHZax7a20Sg9SaqzhvcpOR6h2V+V
 kkmH5LDH4C33u2pLpXg==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab69078 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=noCGlsY9V4GqTmqY_BAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

Teach iommufd_sw_msi_get_map() to match an ordered physical address list
against an existing contiguous IOVA range. Mark the first map with the
range size so an identical list can reuse the allocation.

Teach iommufd_sw_msi_alloc_map() to reserve identifiers and offsets for
the complete list and build its maps on a temporary list. Keep the
existing scalar installation behavior and only publish newly allocated
maps after installation succeeds.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c          | 161 ++++++++++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   1 +
 2 files changed, 123 insertions(+), 39 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index c2ef15c2ca51..8b8f132ef3c5 100644
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
index af7df868dd4f..b54eba5c490b 100644
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

