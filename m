Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B953F824D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756009; cv=none; b=VfwsJHrYFgOLFVMUAJmdvFmCo3ojiRLh8/qbhh6+QLj2som9OwbiIBZCn/BQMkoKrTZw8eykM1YRhqpLIIG4gpZxHa9zWRXL1Ack839688FwEsKHnRA9qYnDbAtAuMVSdVnB+4m38Pe9g7/SAXNRU4R81YoIcgzz+xU+jQPrx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756009; c=relaxed/simple;
	bh=kS1tkzLH3ddYQKnJlCyZ0TbDF/E2lNZ37hitw5bKQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7WnxYEj1XizngqBbYdc+tWMSHWyLSU+kuK8eHESioUvP2S/T6tsiCXNM9j/ntVmAG23OqNml6FvVzxKp46iG83rd9YkRoVfH8e7ZrILbC/A7KZbF6gdGZ6gEJbZg6BR2OxR+O5OnAQsXCROInHFhHpjrbupvnldoq07MhIGwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mT+LAcre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXI9nBm7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mT+LAcre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXI9nBm7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDv16M026348
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wEMOruUw6uy
	+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=; b=mT+LAcrewBFDN8fB3RVlBGEBtmc
	C8NlgisPd2UNrNd9Wp0D57X18ceACxHNDPe/0xXWnpeLyxbokWRyvTVM3fmMwi4C
	2u9PMRadRZSQMMg7syqctgP0H8iKCV391UJQoPP7ABLAUPe5Zof+LcoxCOOR4ij0
	1GYFNFQLcgICa1mrMBX93VehlFv67lS+7KGriLC4E8G1Y+y9pCs+pcxJoXvukfOd
	nNuIWmanSrCrmLJJ8BAi2brjOkgu/SUCi9cySKCr44NFnvTUoXItvkZgulBNLuaj
	Drp+PzSJGaCWomdooPouwmobfbfML53kFCK9AIUkkKqyf6kj1vIhqtDXsyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqs87j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d9cef8d15so20415881cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787756002; x=1788360802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEMOruUw6uy+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=;
        b=OXI9nBm7cEGOW+eL1EnQ5se3zt0OTBZcyybPh6CUHnsci8c0l7sh72/HD3mNCMM4AA
         TftxNqd7TVGa5UmmLsBgiI+AFOjjHZrSaThil2GFo1FAn36h9Ft+hduNqsb3lS+D26Sl
         Eap6v4o0PCtayUqiqQPpVxkGPCOLeOXPvTabIcsf47FGpInTh3+iL1ur+Thfa+WwKq7a
         YT+FtX4/WGlnN+Gbx+ED/9cmA8e5QbzR29i1tM+2YNIHDH8QRnVeUexQ+L207JDLjiiN
         boZMK/e3ksWZZPM+OhdoF5rKZi2kP2Mud9Z+RXUM3DUBV/gLXr59/b4Uwt/dPSWe40k3
         BEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756002; x=1788360802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEMOruUw6uy+DR/OY+EcZA6MQrCulyKtnT95kQ7+Lqo=;
        b=IZ1kz4i6lsr4M5D0ku7NAvtVcxzVnFqj+zCSf5LM/4ypoIqRexkh0IDcrlie5L27jQ
         5jr/rRRooy5yzXFahdMtNYo5xy8CZ37rWZ06YVnjwxrx2gMZ+qNKTwJHndKnvXGeiKDk
         tu69F5H+u7S61jZGaQ/tBlSxkr0em6b+LcMXCgqc6gc+a3GcYynox5v3IbJTtMSvpPrL
         ylgOr/4r24jrW8YpJX3rh6yITnZHEoL1mhJ3vCYFjgAgtqYl9WFrqVLm3Rr5BodYmDf6
         amk4HyPQZUbeqPeqY9J2KdweXHbiYb5s1TXBTtntvEmg8vWHPnkygrK1nAK96gXm/gch
         Mh7w==
X-Forwarded-Encrypted: i=1; AHgh+RogpEDNwCdQCaSaww2tPTLZGpsGTS9q79YOO0THKdPlloWg6bpccC5MyO6ZQobNt9Aia+kJuZKdIAGn46E=@vger.kernel.org
X-Gm-Message-State: AFuF++konPyYCnbt2KikJLoRpdNFuq1z49RUVvuwYFzxhbTBdl1GCi2M
	pS5l6EECZyQjRNybK/elgE2l0l54WQPTIoimRCoGNSZhBEWbC4iG3AFTTJiRrUu8MoryoCUcQTd
	0L7EgQPQLVVxBAiUy/srNkxRTkdW+JY1mQCEEt5NUmXyTGXJtjCd6A9Klkub6LBpohG8=
X-Gm-Gg: AR+sD12DX+B3vU0/pmA0Ok+BPeNG6/2F733OPsiiiyXUQJejpn/k/hNmh5e8a0l1ScO
	HcBwS3xlk1Dl0UPa+MsbzKSewU0/2HsGVsZEcQIIIZC20cWQvTwl+WP8h1uDyGBnmZsjitkiZ1y
	OQ4SoXgz9d3tYmIq9fwy2BO1Jqhh/DOYUbUH7rKBEfmvyLo5rUdmX5wMbU7xjyQvaaD5Y7fTKqE
	7WujcVVnqMcOXx2HVY3vc8EjyLp1CwXlgP+Pvv1YXmQzawBeqr6NabPXFv16p7UYOv1o8rOhBzA
	4Bg7UnPMUYcjjA2EWDGWqM5WE2SQvufTRYQcx6kDbfeLltux4/vKeStVx0bfQxRD1EukHnWX5yC
	RvH/wbTUI
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr71180041cf.30.1787756001330;
        Wed, 26 Aug 2026 07:53:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr71173401cf.30.1787755994956;
        Wed, 26 Aug 2026 07:53:14 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef92csm539344066b.63.2026.08.26.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:53:13 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, kevin.tian@intel.com, robin.murphy@arm.com, joro@8bytes.org,
        will@kernel.org
Subject: [RFC PATCH v1 5/8] iommufd: Prepare software MSI maps for address lists
Date: Wed, 26 Aug 2026 16:52:59 +0200
Message-ID: <20260826145302.449904-6-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfXy6mkbEFbdK1i
 H0SP4g41cfiEciyupkHS3Zn4ONuB4aQ2VN9U/9m5ua5sj+cAiVyPgENyY1zc/pmhaNfJfPGv5WL
 UVSbojaR7cWjFTZdjhfCFDaYVGs7tBY=
X-Proofpoint-ORIG-GUID: l6VLOSt3E5euz5-p01zluM1f-S3PoNGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX2sfQOv0rie6/
 Ez0X2N2Gayi14znXzTSYDvPjssnPtmai32Tv7fa3LI8mXN6Eu2bhvDhu/n3VA1Fp7rVBZAzzcko
 xBTtc/axr4Srl06RBH4+0jPldRHvuxHgFIxWr3rfzm6r0UDK4e8wJ7ZPR6BDLYvqR+w3Rl37nC8
 KSzLUj1Cru1h4zOdZ+uhUULOo//piB1DjjQGSWxxLIKX5vHWxr2s6b6KElq4W7iWrAsv+MwCQU4
 wmzkVFDjT8cmK7OOdtyhWdNw8X5CXtb4ZVx3qTppifK2fAwBbHjoupznhEAIjk5NcRU7JfL/XZi
 +m5VA8tYxxNp9sj41k1aVds5MPU3rdON8oP5cMx8Tna70HpTDpvttLC1xqBUTgEBSoB2CmnIJRa
 5RqqroE1Joz3XbfOCjVz7jEcZteYe2lQU0yJdIv/W+5C5L0/HU6vkJrIku/onRFXKeo3bOzd84Q
 rIRKFsEsySfDNppeiMA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8efde2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=noCGlsY9V4GqTmqY_BAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: l6VLOSt3E5euz5-p01zluM1f-S3PoNGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260124

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

