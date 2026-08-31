Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249B4A6CE4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188400; cv=none; b=fqWu5xIjDR6BckXd5M6LkJlyKViadJ0i7ZKoaX8g0WEC40m4pcbCnNXamyVYjFMA5jyItWOmSXuuvg7Fctt0+UJX1CWPpcXF011m4YVeVfmLcdbMRkFgSfyJqIpD88x17lksOQwy7+NV4qGNHRzZG85/grBZpM2toX31dtVjBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188400; c=relaxed/simple;
	bh=TGK0lhZfCfz2pIw4hd9TDxJ6q0dSM1jq7vGUA/EXfM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYEPY12f38QTM5MHiiY3Ay/BUfvvkoq1+ERL/alhlOtOuUUmGgtehaG73FtKHfN/laWLETG6jjaLnJWUukJUY+gq1A/TbI6ij8kuTFN0sVHrfqPZdY6lyG30aaUHJRZZy/0TH4JkIzWPZAt1nABAfEiGYJJad3Dcqd6PvErqfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvXpdNAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFyfbLj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvXpdNAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFyfbLj9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETgAq3808153
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fxkNrhhqMRA
	B4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=; b=RvXpdNAE2cruLbkqkfxY2uJJ7qe
	8YgKY+ej+HnChSaYZRAlqoMtNyrKigQ2JuoIEybQz72C+3L1+riY3eFIF4JJe9lZ
	z8ToTP/Ke0KDD1zQVySqvTtk41KeWwR02kEHQ9NB4LYvVaDyqdT0XFe2Efg0bNuu
	GBoJQVor8XzJWT+wKfvdFTjzlXCWLXi/hZRAgG3lweitmRd6JYeym0wMbP6iKuP7
	NZSPP6VbwIqhqrUQIC8BZmo7TFQ02iCjuvkI7p0nIkkZpqHTGvU226R649R2ErIx
	bIJRIcu85oJ9JWPGFqCD2mSdB+vuMY/0ry+GTb4+0cW/4Hwu3MwU2IgM0qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbajd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso482879885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188397; x=1788793197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxkNrhhqMRAB4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=;
        b=dFyfbLj9FI/Dvlz3MuiKl2xYmKCJIG926iL0BffM6a5fOcZ80+TYy5I+Apn1mGFYWO
         sX4M9BSPbXWUkNOUh3WEu6/X3srJqPJXUW78e46AKSZrI4rEKovlfdTmxacFeI5hqFmd
         y9h5ldQFvFw2cdmkXitxpFuKuTOfIDOuI+9rtBHljZTMgYI9BHjsgPqSYsnRl+kPf8Je
         7hHJQVNOC5kREhhU2Y8KaiLl5JUlDS+DKB47RCKCRw7u4z8Fr7Wwpm6GHQ6sOPhxrrGY
         2D7wGk9J04zrfnDLyWOTsir7KGEUDJQswBlka30p+zvrJf0icH34fN61Yv5sFIlK4vbg
         xDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188397; x=1788793197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxkNrhhqMRAB4rFIf0pTSCklWbzV8gUXV1JpOe0FY+8=;
        b=h9ZAZ58u6d1MD9r+yiNRY4UNWsmOvzEP6KfQZQPVdYPJdKShj5kZUhV5Yfd1zh+Ti3
         WpYHpRXZ9zlMeYK1byTKxMeLZbtBfmB+ow/OZJX4qv+PApIlHyr71PjZRQa4YLk/4tMK
         97jYLh1LkikMW0FSwaB2nRR0n08yokBGpVd8qYxBRScyHcGFJT7PlL4x2Hyn1i19ie8Y
         s28vh2P/NU9glFtXXTs4F1xUcavgFgshY6bAqauExnK928WzA5MVHFtTjzfpTVofwuoK
         zT9I+V7eu+kfRxaoo3OnmDmWTtNKs16xxXLzQdNmYZcwRSNpNYTYut7+hwE9rN2DpK8J
         l7MA==
X-Gm-Message-State: AFuF++ko0Gnc2ypGqZogjLQ38GDTe9hzw1TPBEisjIAcN5UUnQKpOpBK
	JQbEjChL0H4sEIf7xDR0W0PI7qXXD0jhFL7Yh0164GUTd2AtyLbDrAB8ThlhrB2WlTLpZpbtsHL
	FqHFYUTENTejsKFUNS+vo4NtzJO+mQsWVOf7/MU6bSHnl+iDi7tZoidqCcnNd6L+JhSc=
X-Gm-Gg: AR+sD13bGZsNeGEvAoNRDQ+s/QmwMPafI/+H3xXIX9ruWt2thphDCU7tVDwtwAYWC0n
	ZrV223txrtZhpWH5RZoun8A+v6J5uZ2iEhMOb16LNvwRWG1RUbkQxv7hA+SInsO6IH8fVv80Msf
	w9Ursj1Z6cD71Bp6uSq6z2/jM1xlCvwQfs5+e5z8Nmx+XsoN5NnVaF29IMOUm8xZYfdVeqssDAA
	7LOrdizGO4DjFd7O3sJaMqnM+sBBJPyHZvJA1gq9OHvyLHyhRY8YC8fYI5rT0IucLd+pwfr5bOL
	7zq/TjCdF1lbEkGtqssU2jTYpJLXUm+qg5QuJFeFNz1qK0F6kg6dOQQUaz6x0RKnRgrzV8NTqlJ
	X3mlMwMWNV1iyomDLrIZsGrEcmbgPCA76ejY=
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr2317226385a.36.1788188392448;
        Mon, 31 Aug 2026 07:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr2317220285a.36.1788188391905;
        Mon, 31 Aug 2026 07:59:51 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm526216835e9.10.2026.08.31.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:51 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 04/17] iommufd: Bound software MSI mappings to the reserved range
Date: Mon, 31 Aug 2026 16:59:30 +0200
Message-ID: <20260831145943.313726-5-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f1RXMQGm8Qq6PoD2gk0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX3GQI8giojD1T
 8EZmBd2U97XkgEj8HaAWkLkUBJ1ctEQq41FFhHbO6Z926L/JEKL/tSnuT+VQlurLly9QGlYWGVZ
 0mD6x3x6qjtOGkn0PO8olclCuqJqF5k=
X-Proofpoint-ORIG-GUID: jVgNotJ380QGYOKIgX2edY4wf0J-wve0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/4KH62xiQHuj
 +or84oNvFiV+3B3dc3leqGHtJ8yRYtR00pyZNDiDq4+OSpGSWrsoXoS2NzboLXZGA7QU/6NHRaW
 yFhaIj3H8yve9rk+S5ht6X6BuwDTR7WUzue205Vwt/kQ895pBjnaINtm+mX4lAzqWzGH6WfTQVR
 sfXwhUiwKJbPKD+1vxfV3M+GUBosEtWxOtZcV6v2a8dQQMdzWnmIsC2FVo91yW9FIuD06S+5qSi
 B/H4hhutLE4sIbiIxlq84hbLce72Gor2sk4xy/57/W6ASsM2gFwsw6Tk/Eg9etJH2TKoheJOhLS
 bMYHcnfikhT4i9eDTKKOdI17cuAjaO+B18JOk3aj/Eze5cMiXB6XcrWfnA4+LYUMgbZB6Y2xerK
 ghllQ0pESC2uZTq75PsUljUxUGpZaEf5mrh9tLojrxnKdbSJhVxIwvUZgjOxBeRIlFfh3JPTFFO
 1DNq5vNo1LOuNmj5uRg==
X-Proofpoint-GUID: jVgNotJ380QGYOKIgX2edY4wf0J-wve0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129

Track the start and length of the software MSI reserved region as one
range and pass it to the mapping lookup and allocation helpers.

Reject cached mappings outside the region and new mappings when no
complete page remains. This enforces the reserved region bounds and
prepares the helpers to allocate contiguous MSI address lists.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/device.c          | 17 +++++++++++------
 drivers/iommu/iommufd/driver.c          | 21 ++++++++++++---------
 drivers/iommu/iommufd/io_pagetable.c    |  9 +++++----
 drivers/iommu/iommufd/iommufd_private.h |  9 +++++++--
 4 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 868f1e591208..7b83810a1c90 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -97,7 +97,7 @@ static struct iommufd_group *iommufd_get_group(struct iommufd_ctx *ictx,
 	kref_init(&new_igroup->ref);
 	mutex_init(&new_igroup->lock);
 	xa_init(&new_igroup->pasid_attach);
-	new_igroup->sw_msi_start = PHYS_ADDR_MAX;
+	new_igroup->sw_msi_range.start = PHYS_ADDR_MAX;
 	/* group reference moves into new_igroup */
 	new_igroup->group = group;
 
@@ -374,7 +374,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	struct iommufd_ctx *ictx = igroup->ictx;
 	struct iommufd_sw_msi_map *cur;
 
-	if (igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (igroup->sw_msi_range.start == PHYS_ADDR_MAX)
 		return 0;
 
 	/*
@@ -384,7 +384,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		int rc;
 
-		if (cur->sw_msi_start != igroup->sw_msi_start ||
+		if (cur->sw_msi_start != igroup->sw_msi_range.start ||
 		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
@@ -414,18 +414,23 @@ static int
 iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
 				    struct iommufd_hwpt_paging *hwpt_paging)
 {
+	struct iommufd_sw_msi_range sw_msi_range = {
+		.start = PHYS_ADDR_MAX,
+	};
 	struct iommufd_group *igroup = idev->igroup;
+	bool first_attach;
 	int rc;
 
 	lockdep_assert_held(&igroup->lock);
 
+	first_attach = iommufd_group_first_attach(igroup, IOMMU_NO_PASID);
 	rc = iopt_table_enforce_dev_resv_regions(&hwpt_paging->ioas->iopt,
-						 idev->dev,
-						 &igroup->sw_msi_start);
+						 idev->dev, &sw_msi_range);
 	if (rc)
 		return rc;
 
-	if (iommufd_group_first_attach(igroup, IOMMU_NO_PASID)) {
+	if (first_attach) {
+		igroup->sw_msi_range = sw_msi_range;
 		rc = iommufd_group_setup_msi(igroup, hwpt_paging);
 		if (rc) {
 			iopt_remove_reserved_iova(&hwpt_paging->ioas->iopt,
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3856989f5c4b..8bb47a81fed1 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -186,14 +186,15 @@ EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
  */
 static struct iommufd_sw_msi_map *
 iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-		       phys_addr_t sw_msi_start)
+		       const struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommufd_sw_msi_map *cur;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_start)
+		if (cur->sw_msi_start != sw_msi_range->start ||
+		    cur->pgoff >= sw_msi_range->length / PAGE_SIZE)
 			continue;
 		if (cur->msi_addr == msi_addr)
 			return cur;
@@ -203,7 +204,7 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 
 static struct iommufd_sw_msi_map *
 iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
-			 phys_addr_t sw_msi_start)
+			 const struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommufd_sw_msi_map *cur;
 	unsigned int max_pgoff = 0;
@@ -211,7 +212,7 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
-		if (cur->sw_msi_start != sw_msi_start)
+		if (cur->sw_msi_start != sw_msi_range->start)
 			continue;
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
@@ -219,14 +220,16 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	}
 
 	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
-	    max_pgoff > (ULONG_MAX - sw_msi_start) / PAGE_SIZE)
+	    max_pgoff > (ULONG_MAX - sw_msi_range->start) / PAGE_SIZE)
 		return ERR_PTR(-EOVERFLOW);
+	if (max_pgoff >= sw_msi_range->length / PAGE_SIZE)
+		return ERR_PTR(-ENOSPC);
 
 	cur = kzalloc_obj(*cur);
 	if (!cur)
 		return ERR_PTR(-ENOMEM);
 
-	cur->sw_msi_start = sw_msi_start;
+	cur->sw_msi_start = sw_msi_range->start;
 	cur->msi_addr = msi_addr;
 	cur->pgoff = max_pgoff;
 	cur->id = ictx->sw_msi_id++;
@@ -295,7 +298,7 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 
 	handle = to_iommufd_handle(raw_handle);
 	/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
-	if (handle->idev->igroup->sw_msi_start == PHYS_ADDR_MAX)
+	if (handle->idev->igroup->sw_msi_range.start == PHYS_ADDR_MAX)
 		return 0;
 
 	ictx = handle->idev->ictx;
@@ -307,11 +310,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	 */
 	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
 					 msi_addr & PAGE_MASK,
-					 handle->idev->igroup->sw_msi_start);
+					 &handle->idev->igroup->sw_msi_range);
 	if (!msi_map)
 		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
 						   msi_addr & PAGE_MASK,
-						   handle->idev->igroup->sw_msi_start);
+						   &handle->idev->igroup->sw_msi_range);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 24d4917105d9..8bf2554af334 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -1501,7 +1501,7 @@ void iopt_remove_access(struct io_pagetable *iopt,
 /* Narrow the valid_iova_itree to include reserved ranges from a device. */
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start)
+					struct iommufd_sw_msi_range *sw_msi_range)
 {
 	struct iommu_resv_region *resv;
 	LIST_HEAD(resv_regions);
@@ -1520,10 +1520,11 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 		if (resv->type == IOMMU_RESV_DIRECT_RELAXABLE)
 			continue;
 
-		if (sw_msi_start && resv->type == IOMMU_RESV_MSI)
+		if (sw_msi_range && resv->type == IOMMU_RESV_MSI)
 			num_hw_msi++;
-		if (sw_msi_start && resv->type == IOMMU_RESV_SW_MSI) {
-			*sw_msi_start = resv->start;
+		if (sw_msi_range && resv->type == IOMMU_RESV_SW_MSI) {
+			sw_msi_range->start = resv->start;
+			sw_msi_range->length = resv->length;
 			num_sw_msi++;
 		}
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 9ca5f9f92cdf..4e2d32809695 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -22,6 +22,11 @@ struct iommu_option;
 struct iommufd_device;
 struct dma_buf_attachment;
 
+struct iommufd_sw_msi_range {
+	phys_addr_t start;
+	size_t length;
+};
+
 struct iommufd_sw_msi_map {
 	struct list_head sw_msi_item;
 	phys_addr_t sw_msi_start;
@@ -171,7 +176,7 @@ void iopt_table_remove_domain(struct io_pagetable *iopt,
 			      struct iommu_domain *domain);
 int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
 					struct device *dev,
-					phys_addr_t *sw_msi_start);
+					struct iommufd_sw_msi_range *sw_msi_range);
 int iopt_set_allow_iova(struct io_pagetable *iopt,
 			struct rb_root_cached *allowed_iova);
 int iopt_reserve_iova(struct io_pagetable *iopt, unsigned long start,
@@ -510,7 +515,7 @@ struct iommufd_group {
 	struct iommu_group *group;
 	struct xarray pasid_attach;
 	struct iommufd_sw_msi_maps required_sw_msi;
-	phys_addr_t sw_msi_start;
+	struct iommufd_sw_msi_range sw_msi_range;
 };
 
 /*
-- 
2.43.0

