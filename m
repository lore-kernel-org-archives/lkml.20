Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0A4A6CCE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188399; cv=none; b=QUQyjKwbiWwIQwbfHsNZCpKe2SE7XRJ6K5feyxqdG5LAP5lEemTAzBc29hkRdF2Rjc3sNLVPAzSNX02Ca0cHl9YClUod1zh3COhnNbA9OW7QUrzy/0TanRnl1uH3Woxu0/Thl1fJTrLyg/EeOcHKbYdbVYpCGIDrVE1NfuRrgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188399; c=relaxed/simple;
	bh=syYRdbVVbpsICnzaj0fGfFWk/HbaKoaDsoQSpJEVM2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUJLGUGtpMz7GQKjTHY90cXMNr373OzFP9wgIknGJB2xPYvNodmAwVtRCtjBrj2WrCi6Qa3kNlENQccgu4JbZfRxCgOFGEP3pgE45R3/4khcaLKJJuHtD0fDGoDMOKBRvydx49rwgIWzwJmHkQ8zBRu8R1n5e+NgpeXWsALcEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+DM60uH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACQJU307; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+DM60uH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACQJU307"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETcZm121965
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JGkZKildlqj
	JzugtZJx0sJt2KViTlqK+7HFbST5CtPA=; b=g+DM60uHpxeekSrflg4yvKHlEGa
	ZWi7Q4MlQE/a18400XJqMQEt0pByHjfxLDlZFQg1gyVuGsniSVM522acNP81EU71
	FKhFD7EzGDze1G7hGx6f+OCSg+f52ehzY9gIxZWFE8rhAGd/+2POPnVZjTkSVVEe
	0dWUGAqh2OKvHFRSTfr5Ct/3q0MsJt3XsJyFMKqzA3Ihpcglnk9SX9uel4trmJhn
	aoaawgoRNOjpcF6LHJH5WR0L0NZK6TCvjeDH9uVV3vgyo7E39cxb6JBfqX5r2C9y
	BcJ1PddrwVrRL/OVW6NASTt0Kz0NOg6FxC63mdm/qVNxZJC4RWCUx/EjRag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pma2ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso39643561cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188396; x=1788793196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkZKildlqjJzugtZJx0sJt2KViTlqK+7HFbST5CtPA=;
        b=ACQJU307ggF8Cz7nQut5zOfzmz69b1viAlZSFtxWbrOXGozebQGkfOFgIF2u9KO+OB
         Nmq/JY+KUoDQyHa5z2P5zghrLKDW/xvQjDddRrr15UCpYOqLmL/rns60LCSb8MARJuSr
         sC1qflwTBdowqmcnqNH/ixu3sjlEj0ju0z6gLPyAhyoaes6pE1fMIjhQCtSqLRMuBMzM
         Qfvlbo0d0WzRdSX+JSYX4lGjF+iCxdIQ7+BSkXmctzbH5/ce5hAgtg3h7qC3FfTjE/j8
         30uxTXiRRJ5HfM07k1tz6rh1zIVA+UzIKq8/Lh+keuBP6ra4mc+JPoHYT+9ZuMIw+r5q
         f7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188396; x=1788793196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkZKildlqjJzugtZJx0sJt2KViTlqK+7HFbST5CtPA=;
        b=nvcZY8wMfZ9wJomD9KG5QHXR9X+h7YzokYaQCUiBZLIOwrkrKaqOyC+qQvp5GWnzG8
         YI0/37grUdd689r8O9B8VAPoYY0S3ILRbANH2BabMpgBQv78Et49OqtHKI2/HeMHo337
         +0+YIyXchsZrIHmz733TUtbwsmzHv3ffNC8iESyGquKkjrNCd43PnANprV0pM+evK0Nh
         kQ72ZSc/MugJ13WCabz71zggpY1yU5SvtY/2is1ENhG1HXZgX2xxZQIkHFfrp33F0O1m
         EYp6ZfZr5C0QuXQda1TUEY9Fhi1s7RDUlg4zDo8RHOjX7kQaFUINdrUbXMZhROhg7j8z
         akoQ==
X-Gm-Message-State: AFuF++kxpSGW6FKSkZEwDApK2EnpDkswOZM7shyudzut46sTk3Hkcnrp
	SRdoGUNAxzup/fN3zD+52uj5DAZyFTlHVOBEBG7MxEW8LKAeESS49c0wePtVcJxUSRMsonyIkPc
	KJkAGggqL+NJ/i7srS6HMAh2CuPONXrkzchfLzvHFk0zC0flXc9q8jWzSBEYBq7Ddbrs=
X-Gm-Gg: AR+sD11rd/8atezx0h/fhrXU8411YVyTsb0/J2vXeOt6DcrkYLJRNsOUnrQyhUw4hoG
	fWSt0xoh7kpgqehZbNO0iW+62MGtEnyUNw5/AYJsNhFxRp0TiHQY6OChYd9pTdj1255S4EmXOfZ
	4xWg5OjtrTk20M6CpFnW/beooasFJQyWniU87ysQE580EIG275/iVhbFPLFBrGshxwh8uu5npVc
	5bbh5bcRxsNzuzN76F9CD+BjEpfTqNCiElEKw0gC7DDmc1yIf3h0TOqEzlaOjF23YUjZnQEW5Hz
	6qOm/SB6OTxV4LaJStc2WnAw150Poa6bo6MYDaJ6SQM2Jhdf2Yp5J8RGLP5KSoiFe2P6moy3v/u
	ONtLobrVXiCSFIsOPbDuv6CTWNziNPv/x20k=
X-Received: by 2002:a05:620a:44cb:b0:939:15e:1a5 with SMTP id af79cd13be357-9391391a8a4mr3008740785a.35.1788188395791;
        Mon, 31 Aug 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:939:15e:1a5 with SMTP id af79cd13be357-9391391a8a4mr3008732885a.35.1788188395227;
        Mon, 31 Aug 2026 07:59:55 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm5323372f8f.33.2026.08.31.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:54 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 06/17] iommufd: Install software MSI map ranges atomically
Date: Mon, 31 Aug 2026 16:59:32 +0200
Message-ID: <20260831145943.313726-7-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 00UTNl2pPGlYqlfua6NFIMia0xZF6AhJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX7VlUwo0rwwx/
 24QR2w0tfIj7ar7MzQQxeo6qJZRukbs16D2UWRKKRnlqYo+BGhq783/kL82utYCU8LURMfRh+3l
 g8FhrBn29B3ILGTnpTZOEpnwXjNPCAvZcsIx5dE/6VyMdCYYmsKLNrlZFlG6hvuYYctBvKhd7h9
 0lzO47mHFgJw0lwy4lC5HR6u2CRFDHXFvIt0vWYBv4Z6hfc46r9alUmUY/5DN9lzrXy6TQWjg0m
 7ZCntknUL/KtTFxIBDotYsxC1lIzipj++CPhc1xjiIA53azyVO+j3mxH5lc7vcUQlVzUFsD083L
 8PRkNUNG2Yaqritaxvrb6mlhlTujb5L1I6nHl1t4sYf1oOtVLxwH4vTl19W6H7J9FrWyBoU1ZVu
 asGxYYefIuaPmqLI1Nmp7uvmZRLb5HvqJWHrQL0sHG4Xb846gH8GCR+Lbb2M62TrAqOZWxxaaHJ
 P9cmC+JpjcONrKvO05A==
X-Proofpoint-GUID: 00UTNl2pPGlYqlfua6NFIMia0xZF6AhJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX3Az4ONhQ+76y
 ZCkCp4+QhI0CgCs9gtozz4pDr7nJMzX6Hka/hAiLpyWd1eMTV94dfOJvcJdgaHuxZk/VK9Vu2Eg
 oaNuQRN0/MzFm/7vncWbsUR0IMVldwc=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9596ec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0NqqyPg6VgUUedX_kk0A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

Add a range installation helper which installs every map in a contiguous
software MSI range and rolls back only mappings added by the failed
operation. Use the helper when replaying range mappings into a new
paging domain.

This prepares iommufd to publish and install physical address lists
without exposing partially installed ranges.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c | 76 ++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 6a0527f4b058..a43a25078f87 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -178,6 +178,17 @@ int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 EXPORT_SYMBOL_NS_GPL(iommufd_viommu_report_event, "IOMMUFD");
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
+static bool iommufd_sw_msi_range_index(const struct iommufd_sw_msi_map *map,
+				       const struct iommufd_sw_msi_map *base_map,
+				       unsigned int nr_addrs, unsigned int *index)
+{
+	if (map->sw_msi_start != base_map->sw_msi_start || map->pgoff < base_map->pgoff)
+		return false;
+
+	*index = map->pgoff - base_map->pgoff;
+	return *index < nr_addrs;
+}
+
 /*
  * Get an iommufd_sw_msi_map for the msi physical addresses requested by the irq
  * layer. The mapping to IOVA is global to the iommufd file descriptor, every
@@ -207,11 +218,7 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs,
 		list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 			unsigned int index;
 
-			if (cur->sw_msi_start != sw_msi_range->start ||
-			    cur->pgoff < msi_map->pgoff)
-				continue;
-			index = cur->pgoff - msi_map->pgoff;
-			if (index >= nr_addrs)
+			if (!iommufd_sw_msi_range_index(cur, msi_map, nr_addrs, &index))
 				continue;
 			if (cur->msi_addr != phys_addrs[index])
 				break;
@@ -306,9 +313,9 @@ iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, const phys_addr_t *phys_addrs
 	return ERR_PTR(-ENOMEM);
 }
 
-int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
-			   struct iommufd_hwpt_paging *hwpt_paging,
-			   struct iommufd_sw_msi_map *msi_map)
+static int iommufd_sw_msi_install_one(struct iommufd_ctx *ictx,
+				      struct iommufd_hwpt_paging *hwpt_paging,
+				      struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
 	int rc;
@@ -332,6 +339,59 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 	__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
 	return 0;
 }
+
+int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
+			   struct iommufd_hwpt_paging *hwpt_paging,
+			   struct iommufd_sw_msi_map *base_map)
+{
+	struct iommufd_sw_msi_map *msi_map;
+	struct list_head *msi_maps = &ictx->sw_msi_list;
+	unsigned long *newly_mapped;
+	unsigned int nr_addrs = base_map->range_size ? base_map->range_size / PAGE_SIZE : 1;
+	unsigned int nr_found = 0;
+	unsigned int index;
+	int rc = 0;
+
+	newly_mapped = bitmap_zalloc(nr_addrs, GFP_KERNEL_ACCOUNT);
+	if (!newly_mapped)
+		return -ENOMEM;
+
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index))
+			continue;
+		if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi, msi_map->id)) {
+			nr_found++;
+			continue;
+		}
+		rc = iommufd_sw_msi_install_one(ictx, hwpt_paging, msi_map);
+		if (rc)
+			goto err_unmap;
+		__set_bit(index, newly_mapped);
+		nr_found++;
+	}
+	if (nr_found != nr_addrs) {
+		rc = -EINVAL;
+		goto err_unmap;
+	}
+
+	bitmap_free(newly_mapped);
+	return 0;
+
+err_unmap:
+	list_for_each_entry(msi_map, msi_maps, sw_msi_item) {
+		unsigned long iova;
+
+		if (!iommufd_sw_msi_range_index(msi_map, base_map, nr_addrs, &index) ||
+		    !test_bit(index, newly_mapped))
+			continue;
+
+		iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
+		WARN_ON_ONCE(iommu_unmap(hwpt_paging->common.domain, iova, PAGE_SIZE) != PAGE_SIZE);
+		__clear_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
+	}
+	bitmap_free(newly_mapped);
+	return rc;
+}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
 
 /*
-- 
2.43.0

