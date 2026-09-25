Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FFB4C33CF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349444; cv=none; b=BbEvrj6IQiY1PwnBzybDJiuLHoIfnousG/l5NlQFwLf4zNVzhm6HE7u/DXeNXwnVN5uQJV3m60pxeYTinYjy08/yVEBUFCullAxnfaa6I8ohYtZPByv34JVHkWem2rtqduJzy5UXqFOlEwgXnuVm+QOhO4ozZBfsP4cil4z4Wgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349444; c=relaxed/simple;
	bh=SDUoeqvSzajvY32roYbZab9LFoIzSx5uPJqmyVedHHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFlZXX4Z9RRZiI/u/sMX3afK2glANmbbFSDiXTyIdDBDL8JE55MjnKOTTXwPRgHl4pW0+5HVZD5INlMB8U3IPLP2S4c/izCrz533N/5MBSvEg3sStXGgnYhRUWeHp0LiDUz6gD6UA1efng5+wn85cwUcgdVaCG+SSx2F+CxxTHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQ1Wo9Oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjJwybmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQ1Wo9Oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjJwybmi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDOK851055735
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Di7hXjezOC
	UALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=; b=VQ1Wo9OccKIVhqnOLCsJBz+TotK
	euZTwoFXCT+u8zdZvYN3t+mydoYsS5493vDLf4CROr/rCLtV/dmxw5bh40D4btyQ
	sEw8zVtraIU3nXKdeojYwkAWJ3oTQRbp3Zus3dk+/PqNsanf4DQi4zgtvHH/iRPc
	vrsGByVGc7cSt9SgbK0cQtCnxno09ziPqWYC/RuC1PSmN1LNC3ikLe/bP3ocbc4G
	DVx296DJvkoXyPPOAHe+JATV6S1m66adQ+j6m++vzq3qlOY2ZlwYa3d8RKKRrMs6
	D3zVYR/r7JGxgiokIHHoHNwxsk4VSpXoLTXt30qFEiuQ5WM4fv7BYvMgXMA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b0ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a5ed2517b7so217666137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349429; x=1790954229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Di7hXjezOCUALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=;
        b=JjJwybmi2uxeINOVYUXrK0Sbr9dkF5cXJIxCm07AMTq/fniAmuwBpF/RSpH73PN7WT
         M9Gq3OIPat28aGC4VyWcQbOrLYEAR+eZ9G/OPOXKqqlIx7n91AgXOqO8UZMczOniK+pz
         7jfirIt9F5CVM4pj3VnFB1i4lendNW6aExMqoSoruS1Ve4zJXbhaBFx9TDlsGWZF9GcB
         t8m/Y+1E7ZskZq5oWFvAHv0dPOzYL1k5MaRMAML2ZkZGPgHogZQo+AlauASRivKu33sz
         RHH/OUAUhZRAa9ilTxMVitygnx8vOB+rmjc+jBly2OwsrhzC6MRjgwpSFheb3Ct3bKMI
         MKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349429; x=1790954229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Di7hXjezOCUALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=;
        b=i+SoQo0iv6B/5/12idVl1khO0C4iHVJeruFozr8NMPQywTEaGgIddUEoc4wIBRnS7F
         EXKyvjIvJ77Cf5jIIsVYclxBLxF5+wcvT6zUw6+rhTgx9Vwyvbn+Fe1IbpzSPXZMsDmQ
         RdMuu+6auU0ItIPcgyfDTvCe6SsetCsTDUL+nRog9pA540M8LBsFu6ofILSyDPHY1Asf
         +WoFUpnS/iWrSjINGJaC66voET/l4/J/fTCmeRIZJI1gxlqM1SfS6fjp9FaqQhTVlWBH
         0nyR/744IK9sX7KBs2+oE0jlU5bABh9USC3fSpMfJNnPZxek08/3CXJq7dlLK/fMcNNM
         0wRw==
X-Gm-Message-State: AFuF++n8mZKVaCpq/p9jYbqRNuxtDj4v346wBiRyu8gDzSNvpVVv5Y1Q
	M10Nfyx2qtHzZRJ3GyegJhHHWfoEzMaEfiZrdo05st2DO4K12ZDan4iYvhltL/OKUABJy4/EjPA
	FVxfEsFRQraXuJvtLhGX8kec6IndeJhqfKKIYisITXI5GI0kgm3YLcVPWOCeN1lYv29w=
X-Gm-Gg: AYBFou2NqnpfZFK/FDDP0RDFsR5fqCSzOiwGMO34O965WUOosiu2xUIDT9qR4bFYH4W
	xT4Lgrels5715R0yXegGb831kSlQG7XKihjVlhyByRUl2Yrjx6EvFAe2I7rYKuHefZbLMZmG9fM
	iBNYgIQKSEkFJvYx3i/FrU+xp+rBNmRMfZDG9znvEfJ/sJUTrOIZaiCyMHLKWiL/kTsZOQPDKyN
	/LR3NofbStBpHGWrG3M+BDSej0Lb0m6t3if3tPR69io0MXBf7tKGEfILc7pmNKG1ziJ09/U2JHR
	HFhWV0v9YpRr6Oq13Gmae+cv7zJbR1McX4guKV7K0beuuHT+5i/ZjArZBuiekpB2q5wIiMkVngd
	UT/GPSH6tFGG0QchJ0wxlpBwF0u8Bo05pGh+V44UxxtfimSDa
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7b1d76ab79bmr910410137.36.1790349428621;
        Fri, 25 Sep 2026 08:17:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7b1d76ab79bmr910381137.36.1790349428007;
        Fri, 25 Sep 2026 08:17:08 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm7857424f8f.34.2026.09.25.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:07 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 03/16] iommufd: Split software MSI map lookup and allocation
Date: Fri, 25 Sep 2026 17:16:46 +0200
Message-ID: <20260925151659.419512-4-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-GUID: vmOabCRjHyOO8wLmiRY7ykPw5LQl_nF-
X-Proofpoint-ORIG-GUID: vmOabCRjHyOO8wLmiRY7ykPw5LQl_nF-
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69075 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=_mR3RRazA89hjPCjrIEA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzDUovD8cvueL
 du9FXCJUJS+vKdhf2t8YKSOsCV4NcBG51A3r2UWwJBGBCRx/cKeQFoYchzK2KP0S78WH+YbXtil
 E6HnesKo2yQrrehdbWigAhSy6MSG4itO73HG3ULwAx5J8mdGXvpqsCHwple1BzvuI2xsNkm06mV
 wTsKrRO1UENO7QDNzrjpAr2eoMWquwBsMIQvSxoVdzab18D4kVZmEJtzlIIUD3VLUsXEwGvknVN
 jxShFynoyxtuCRxXgwhFnz1Crv1/JH8jOR0o/LhlahB+XabQtbS1JryNzCWBhLOtACgCvg5t1Ed
 qKWcU7hjKXLDQm3dIfD55vGGWB32n9l2EQIgKVRyLN87zmA3ydHeYimUgPG2LUfP5ygr0ZJdq7+
 9Bh8jSsqhw0em6jx2WrZsv4bJcx2JM/4LQ322n01yr16YnbhIFERpxDzvmPZrIjvIzgjLe3BhJz
 tmed5/uOh4JPlpCUrOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX0PHb5VdBa4qV
 /Y2Achd7PE2082CSRxNUuOR5lBRj5zw4/XvCumKfBWsTW4A+VeXKMP+mFyZUfjzePfk8hfhpn+w
 Bhs7dBmo494EqOMg5Hu/WVZAe7h1JDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

Separate lookup of an existing software MSI mapping from allocation of a
new mapping. This prepares the code for allocating multiple mappings for
an MSI physical address list.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index ea705e416139..501f1e1f2797 100644
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

