Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6444A730
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755996; cv=none; b=iRBzJo9WzhBB5238hLaP/BX9CO1vUBlaGqeCFfloss0URzU6HHKjWqvyUaZhmdCIZaz4VrXzR/OM/N65Do4pAjtzQwzADElYeY8MdyIEBkIEuEXRtr+oTc/z4M/qChoejBevSfItJr+/qYuXv4ajaADcPQMhQrD3+axof3pLWcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755996; c=relaxed/simple;
	bh=VkDgGhf3pVTVVs4TjCIKO9ed3DJ83g7eqDMUmP7zsMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6VeAt8IQ9NEigtxtsQvb3rsMrO6ys5Lgt8dxOLfMCV0cAjvX8i6SixHtDCmi6EnE21q8TD+dDCSAAvS8SVFJ5b+06TFGiaijA87xHfpDGnYJRgCd4SGYNTILmZrRn/nrKCL1USG5whrufKJrLMRSksvtBEY4qP6x8E/efjtgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMeBJUN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWMVRAL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMeBJUN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWMVRAL8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDuriQ611961
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6jRs6t/MtD4
	/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=; b=jMeBJUN+cYzWGKvzAGZR9hebWzE
	CCSRinnEwpP0jnNaKo+qJVGyJvfzWovXTFAaxjTJSemT6MmLGo69sT2Q3GnRKwCy
	OVhS1WgE/+QD5+hIYGHiKU71V2TJFMhR/ZAnb62ajzmV5+kZgobs7owLEf+5JuQb
	x+K75sdwj9JaG4Mp58kiiGpUEsTOLAwaS6lWQQjoPQ9kAIOKcj11vbP/OLx727hv
	3NkdbclYHF+Kh03a/5yHyNzvUpIKSfIU41JB810WlgpRrnpCS6X6wzRC5p/xijOB
	X0eY1qyW7RK8a27hKtmvbAzo2gcWgGzT6NsIyMdFS4+wGRx8P8BY3G9yBSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxabet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f64c48bf2so4877051cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787755992; x=1788360792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=bWMVRAL8reET9Gc/5o51pJATHcaPvV808AUYcENF9uU3daUxZb1IYD+FA3yM68v0I3
         w896+JZnIb9kLUtZQjogk1Vy3w7xt+LqdKLze4rg4gsXQtKxxrLpvcaEwmQnXxISX5/I
         ANj/BPLnJ0do76tzfc6mNXZ1S9X4ft/LA8Rw4MhONl1d/b3EoWcVM6lL+ztbpHP19Qjj
         xanzDGuHSLuCPMPG86iBeD9OSYa/D+icYDiHY16G0GAYKl2gHTuHbYXsCOoftBbrdsnh
         1XYJPr75TVPOGvceiskCalTyj3obYN7/Ai9RzlS0pKYE3ZhOLNm1LpxWi6lZyEAP2JzL
         KOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755992; x=1788360792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=hsj9O57axrzC/hRsznCf+V7gHL2HI2Aq6HyXswshr2DCFlEWWR4SHHQMfhKC8xiUNf
         p4TTgG5G++BWootfnDcMp6kw1UW0pUOlWv5yz3z2ZhemDVMeUbpEe67Tc44HIvDQDARL
         ug2YZ8G1Ns0CRx0WpbZP9Ays25D5boSEnb+D60bdnQZapUXi3nEIaeIQevJJj41UYWgg
         9cRMqe26MeNF6E42FDy3uVYIZK04BBC6yWh6ZEB3whAsP8CJfecN5a7E0Rau71nE2o5A
         6ORmc326oUp55nMMWu6uwyLO2ZXkddQwaMvRCbPCgW4mE2o/AmhVBVLbJEW8HPZxe3m6
         XZhw==
X-Forwarded-Encrypted: i=1; AHgh+RoR38QMJrEnTHNrX6Qr0i6yJFsO0dAnhO2iiLEReZCB+p3M4TlbKzLqYX0YfS7Cjnn1mVTi6jQGf2UKLxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kVvBWld5P33q2g+pn9aMxKcZ98gBQeoi768dFkoGLEely+sIJf
	w8+s5xZp9oajDb+ywYMpqBimZfHMQwmC+RGEkYgM/QnQjg+UKpGLGwJ3v2CthQ33jZ2JX5sGjoJ
	RPaoCzFZ91EA9chZOY/ekiHRDXdoldhvR6n9Bh1XuCzUOV6JulRU8gK18NQ6yMtz1fl8=
X-Gm-Gg: AR+sD12uSjRM18Kp6AsAwcANPlCddSiJX9SQcWRal8s9Y3A/BX27QAA/RL4+WvGgKsZ
	K+WA2iRNVyEiEUwx56wTVrR3gGGleUSd3iGA3mEZQxfHfOEFbufioAWBn3qSjx3vnSZOO0K50xN
	+DtCSWI9PPhFIqsDu+3SP0ryslBtroFi0oqtpbEHgsN7BRSFci6N2cgu6O0oSONhXiy5eommqww
	87Rm3RK27hyDeiDlVx/2FGGuKwBC3ylVc8Vj1oaLyt+jyByS3FhJdE21Mb7weUAp3EkfmM352Ej
	REwlZpM64lcKXhsbfh1ikh9Q5xZNmDHfd1UYP4UOZfhVonOAvUlF+nC9QesvW0hkgCxtZEV1v1s
	Poow1DSwp
X-Received: by 2002:a05:622a:164c:b0:516:ed02:c85d with SMTP id d75a77b69052e-52e4228dbc1mr72187981cf.3.1787755991413;
        Wed, 26 Aug 2026 07:53:11 -0700 (PDT)
X-Received: by 2002:a05:622a:164c:b0:516:ed02:c85d with SMTP id d75a77b69052e-52e4228dbc1mr72186781cf.3.1787755990497;
        Wed, 26 Aug 2026 07:53:10 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc960e80sm30023145e9.1.2026.08.26.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 07:53:09 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: jgg@ziepe.ca, kevin.tian@intel.com, robin.murphy@arm.com, joro@8bytes.org,
        will@kernel.org
Subject: [RFC PATCH v1 3/8] iommufd: Split software MSI map lookup and allocation
Date: Wed, 26 Aug 2026 16:52:57 +0200
Message-ID: <20260826145302.449904-4-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8efdd8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_mR3RRazA89hjPCjrIEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: c_wCK3pycJQMSu0xFKeh5sLGbcRBLszE
X-Proofpoint-ORIG-GUID: c_wCK3pycJQMSu0xFKeh5sLGbcRBLszE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfXwGKyYNDK0bLh
 SAwvaEVRwp94kRm09Vm6G4b5EMz7hv28vQv7UgXdOhlQUdYOWigNid4AojWBBpcHk4PagqYfLMc
 EWthbtD5uVhNo4h87fUOii8+v8ygKwARJDuanbRDf1tA0RpdgYPMcb9AFyOAYEXw03G8KV7GRNu
 4vksniuy7MJYwgQS79qQLh8INLbGdvjGCYIRdFGOibCenAmuGgtCCUvDB5yMzPVWbNq1cXvDsiu
 VY6KMhY85ajBf2jq/OVJCIaeLPxu9ZMYYX8uS3Wlzn7Dz61aLEH+o4PfEhNiryhS2UOmtPIWoyI
 juxATXMU8sXUpUmXzsiAe3GGUVAs1MVo16u6wFnzrkvtcwAb3FrE3Z6R7OM4M5awf8pRcPEt8Zn
 WVQndIc+KMSq3bg15e9OoOA0zV4lrJAJCzFWnM7CQUSJJWrHQ0eZF7UuOktOCnXU7dPYsES8Dm5
 OqVngDqAYnlYDTf0k3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNCBTYWx0ZWRfX7t2EeWGvrMRr
 y4ba2y52UGnV2u7KhdAN9+LpwJgJ9GsHvt4PfdZ57squEXffK59838FLedh6U3sndlTB8nKdttx
 ZWlvBjZBwTNFjl4ecK/GDuP9KReABDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260124

Separate lookup of an existing software MSI mapping from allocation of a
new mapping. This prepares the code for allocating multiple mappings for
an MSI physical address list.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/driver.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index d0b05b1fda42..3856989f5c4b 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -189,6 +189,23 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		       phys_addr_t sw_msi_start)
 {
 	struct iommufd_sw_msi_map *cur;
+
+	lockdep_assert_held(&ictx->sw_msi_lock);
+
+	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
+		if (cur->sw_msi_start != sw_msi_start)
+			continue;
+		if (cur->msi_addr == msi_addr)
+			return cur;
+	}
+	return NULL;
+}
+
+static struct iommufd_sw_msi_map *
+iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
+			 phys_addr_t sw_msi_start)
+{
+	struct iommufd_sw_msi_map *cur;
 	unsigned int max_pgoff = 0;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
@@ -199,8 +216,6 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
-		if (cur->msi_addr == msi_addr)
-			return cur;
 	}
 
 	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
@@ -293,6 +308,10 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
 					 msi_addr & PAGE_MASK,
 					 handle->idev->igroup->sw_msi_start);
+	if (!msi_map)
+		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
+						   msi_addr & PAGE_MASK,
+						   handle->idev->igroup->sw_msi_start);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
-- 
2.43.0

