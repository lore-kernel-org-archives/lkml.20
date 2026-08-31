Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6294A5EBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188394; cv=none; b=NM2+AwMdQYO3+t4PzLwSdjpsT1AybUqCTtRBtXNpW6M/DSXVG7qTakmrv+MLXmMAC62GqmC7uXZWDueufqaPr+CuQlUzRtPaosu57LsARxM9RLenIZZdteR+OfNd82f8QFi3Bn6P7O4qKi3Tzz5dYytd2W5+5Mld2wQmAcQxIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188394; c=relaxed/simple;
	bh=VkDgGhf3pVTVVs4TjCIKO9ed3DJ83g7eqDMUmP7zsMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWtRftciIwPAGdHrVxfYm9rPY5mJ+FO3+XjRy4XcLazN59gff57lunWl4SFGgT6xhZjjKMvbyLZXjTZCv50hjl3zHr2zYws/RUEbjs30Yh2qTtRpQ8EqfRFUdvgjUZdHxsgS8iy+EDx0CATiq2U+RfG6TCNKqxin5I6cj9p0ApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tvpmr3b/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKRYx0Z4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvpmr3b/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKRYx0Z4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETWoJ3296759
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6jRs6t/MtD4
	/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=; b=Tvpmr3b/n+gH1qkQjzEane+onHE
	HJl3j7XKS+R696JDcCDt4SHnUsqGxikRmmw1nK/2Fgqgap48ngrFUssta3/Y2a73
	umAiJmxB09hNcDqIjNIGCMwZy+P08Za92pZL5bp8U5LmkzgUNvhOK6WiBj6z4S0Q
	RU1GbGj/r3sipkXmtGr2BYAAIR1F2mRdt8TmPVQp7VtHrGgWiLe0PsyimsimfeXr
	qogjxLOPt1JhcXBdY4MSx0/w0da8nM5v9d8vAEk+jKLGje3IH2DOKXbOXILWDCT3
	hcnd5G+fsa6SxtAJgvBGEviLlSZTOUMvygIe5/3zoj1vDXXJRQGYuTRe/JQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayhhwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53018848232so10959801cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188391; x=1788793191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=GKRYx0Z4DlsvTnnp0GCrwEJNLz348bu10RwP4ouDHrPxgDByApM+wQWocLF7Rlntg5
         TpRVu+RoVlWEeabG+LDf2jIVA/6Q6zsqhS4XuzSmHaCcfJ1Ij2rm7UkPmcG89q6MUvI0
         k+35/FvnGjUtHSM+Wy35IY6awwNS5nMBubFB6GGMw7H7c5EygFtk/uUFCV8MnKS3uyum
         cdoiVe8EcICwPig+sHgmumX1WpV+10btNQedIAe2+UOCc37BpBEKKfQv7WRnpuMUVJCz
         hHYaQyI2JoYixzbRuHywXRl6pNYLLnKQ3n97/D6Pbnx+mYIqCj4zcYe+DkmU4SRV9sZj
         jH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188391; x=1788793191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jRs6t/MtD4/KvZkz6bTMmF94mAlAEjwCXwq5zwVULo=;
        b=egxPNrbRz/BMmk03c1PsdnlMje0XXPkg+jNiALxq5F6+Lk4Rbv6GBnMQ24umoQmd+w
         plYRvfOIyR5BzzHaD40SzHriz5JqHj5zqMydbMBhaZreqAkIp3UVNKElUrCoKcua7DK2
         YvrPFtDRHnCKui4xu0f7R5lNS4Tg70Kr51vnrdXUe4v/7GPR0ClbIwJkftQ1DVa8/uHd
         Za5sN856ABxGMJ3r2hizgIuOcBsH6zfsFKLrNBDs3pNmYcZWyY7/JqbKYtBlWflAM3Eq
         2gWhhH1e/4WEz25szO0O37QqaCMEaYJERXgrdpdGIX67JC0CJ1HRargXiyWF3M53FJQy
         wXIQ==
X-Gm-Message-State: AFuF++mdBcJ6stXueAKwHSGhZ36qTxqXKNyUsAqoxGrd8YSFf/AMau11
	bU1vqWf9/X+a1a+C51BnNdR2IYe9qrRNIMuhlHbNqVZ3bqLn1wEkpfRR4AMDREOTb8Sj/O9lwQA
	uLWdqrWchrRrtWOZST3PmUomzfMut/Ef5P8RfAgzqllS5dMVXonwVnePKB1A3bZetGNg=
X-Gm-Gg: AR+sD12PcjnjgcTw8ITwgJSeoNRC7lBzCtlt3XPlGEEIEmfQhulO3aGAZSMnDI3sRGj
	li/ZsXsO1l9wnaK3qFe3LP3U+ydMtRDflj7MiEnVPd6AC2ZC/c6dJZpKVwSAJf/3f2CRG6AO551
	VSDvK0iLsBIM26qXpacWnsXPLJSIYLeg270zCsOgPa1ym1gjBQFnEHJHhaKFFfNtApnOiIlxZSg
	mEwaSZDNtx3xQTtWGY1Z8l37C2Ssn5XfAuaMhxiZXjSs7KUsQ3fU1sQgO2KCsv/jYZdllhmYOaV
	gLkJgTdaEBNfI17iyDLzqQhDypCDoc4gMGvoHNYjwYV94xdfUKcgrx7W8xKG7XP60+O5zEjcmeM
	bxlgvBlQRzgbrYoLn2E6XtwzFQDwH6RHjFW0=
X-Received: by 2002:a05:620a:470c:b0:936:e99c:4fc0 with SMTP id af79cd13be357-939137c8742mr2984777485a.12.1788188390718;
        Mon, 31 Aug 2026 07:59:50 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:936:e99c:4fc0 with SMTP id af79cd13be357-939137c8742mr2984772485a.12.1788188390253;
        Mon, 31 Aug 2026 07:59:50 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33070sm23895053f8f.36.2026.08.31.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:49 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 03/17] iommufd: Split software MSI map lookup and allocation
Date: Mon, 31 Aug 2026 16:59:29 +0200
Message-ID: <20260831145943.313726-4-andrew.jones@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/wFhNR1saqQ6
 c5+0YuvGWVnN9ksfXR3YPTAem2ikDDw3SrsSu29So4AlJbQyWiGDq+Bs9SBFLCTf7eQD1k+h1Fr
 Oi98uGLzXSiC4r+eG0DH1ZlmWID6rCo=
X-Proofpoint-GUID: psYfwtiJPvIz2JBiIGvQdRP4mSkR9ale
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a9596e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_mR3RRazA89hjPCjrIEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: psYfwtiJPvIz2JBiIGvQdRP4mSkR9ale
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX48b0Bcr953wL
 ZZbTemABpeAovIw52WxDM+kStFEXKKHC3CnqiG7ZPpyxlo+Q1RsaFo69aoKOdYHsnDBV2Y2Mk6p
 1N/sAXVq68yly2diWjZzhZTSa6Nm3ZCmMWeJXlMezwwIOBhfosZWsIZOlYsF+zg+t4PNAM9foqN
 KjgYHBZIRzuKD8NnQ7O/EjFexLOcB7uJJhRnfgJwBUg+BhrIaK4RsxoZMMm4/yASJWaRNhozy+r
 9ouLs88izTW/4UmGYVuiTIjxh3pz6YazA3aSWmJsw9N1fBPImsBteyQL2V8+MyZYoK9fsQ+nTNH
 YzydWfsvgI67cJDHIp0hh9EvMdE+QhjNCvT9Xbxj2abRIY5RoNlBYlysA6nx+62TRh2phHV+e1z
 Zytjyh4cuZb7JmLNW2EiXE3IRRQZJXbztWs1Q7gW+8XIPGo2lOn8dAC2QOWT41uYfpOHed6SQWE
 qL8rbhAGiF1JI079Amw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

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

