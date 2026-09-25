Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F1377A9E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349455; cv=none; b=dUMBF9mzT+APT0Z1kQcYXE0UfDis0UhaaWhnshUAt664X5rOxGWF6ozGuBvBUtKmK6UxtuTcH3eqdLSd0MeU50C1EUZwbLmOQ1gAWfw/kn/ix3/dH31pexCVYEDX2QWJOujV3MM8/8MLFF5zOw5Ooe/sLbA50hmk86PAg1HkfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349455; c=relaxed/simple;
	bh=sJ7VHEB7FrqBZH5VpqofyNQVpDCo2b2GEziR07ioZ28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2RXPwi7gCAFimTyzTyecjs2fb83RIx7AXnDV7QN3VmNxh0hG8TYVCe98HYtxLUEDjxexa6OqQycOs1AtmwMVbYD0eTKUxZW7KHUJx+VyktYEZx5mN7CRZXkddQ7AgeWL2wMGmOSDBLEeS+o7Ru3raZCISQA+vHMi/3nZf8RtdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J78HlcoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDysepP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J78HlcoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDysepP/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD3UeU3532398
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NTwaPL4Dp1v
	FW8X8002/lW5aU0ci45P33TDroxwlDNw=; b=J78HlcoWZwErPBzzScxXyZmS3ov
	ddiE2n34x00soTrrpLQM885PUB42CknwGl4vdLaAqe2FFTGGm5Ih8MD8Jy4Ken7u
	HVDkqUxZW406774EstxMSaenmgsoaKI8E65lYE96VVmoSIZeOlZv4M/vAZhuJy4n
	rMglcNfP2PZE6jzshSpL9eIvYg/x7pxg/lqu77dfL8jNL3XyxKF/ZDNelrQ9atHp
	O7G4CsGmQoy66I2MGAeBenRxgxVKXeJDOV7sXfNC2sZ8mAHRsnokjyGCuVoXpBzq
	2eIToCkqUP/XppjgchmLNRC3bknfXJtmSpWoDljw46OOwVZHONMThkd9Jeg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbs3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-788e076423aso190393137.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349438; x=1790954238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTwaPL4Dp1vFW8X8002/lW5aU0ci45P33TDroxwlDNw=;
        b=gDysepP/VbXEkJJPHFtF+/cDebX54JLndqOtAYk+rOEtERQWxcTTkkIdKGvUUdlVk6
         MGLjiNz371lJXY0aLz5vYlgvCBlL0hKYds2VLa0RT9oKNVRJ7LCgDVPUdJzqebgsXz+b
         RZv24nzScAvIM4cVVR5DM5SKxN8i6QWdMfo14tnZCRq1nzom9N+Unei3DeQw42D8vY73
         3qm02NVrQizSxdcS33STn9Ty5WucNE2SSsgBJzAah6dxy7qiGjQub8dqso/eC7hMtGmm
         PnGdjFLhWG7vWpCi+7JYYQ5wxwfL9B+iGgHE3jSgWf03xg/JCRaQFlI/zaHw9ArrTC8+
         BQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349438; x=1790954238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTwaPL4Dp1vFW8X8002/lW5aU0ci45P33TDroxwlDNw=;
        b=WZVky2+EUKugtphDWfDzEZ5UfPZK41sSYAK+/l9RnlXtu7mg6cSZuZd/7UUVmSFaJL
         pWSVGBA0vm/RWUZfEQQ0CVzlklkM5WXe3hTK9iTQCGAi8E2PFCym2V1RlEfXdRFI4jGX
         pllNg44zfOMzeumLWp0Wf4+/k2Uh31B+2Fg9ulPO0MAt42d6rpdRvUDw1Sa+d7vJU0Wd
         3fPnE1POcz+EeLAR59Bd2FhINTPtQPIDoIVU57AWcCBjr++BLMT3PPRfWQdcry3C9Lg+
         b9adJgafeuVG8QtOHDP7rfp2edmaun5VFvUxkUZXpLy0VE96D+OHR7LkWggZcOyyP852
         VlGA==
X-Gm-Message-State: AFuF++nVnlzIfwS453xVICApgDNrLkJkllx39h/EyZOqkVDiOSrCAy8h
	AZCQqOt0nXHJk7boUvUqhsDYk633TPYV6Sm/tx7sp0nn1MOGqrRZeJMqWJ3OiFgW6F/dPZ+A969
	EfCQUmnB+aaXwMA25EWQlRvK5fWOGBIHiW2WltBQ0hTW2KawWTIbaScBXEbzx3dh/NlM=
X-Gm-Gg: AYBFou2DQhWsj2YdCPfPkx8g03ciLMb8mzkE0JQWaHScwefUc+toFTynS0LPL/VbDIV
	K7potMKl4RH/C9VQdJ1A8ICFkx5qc/1C+bhdlBsFHu25ItyE+Ccwbk5pLPi8St7XlvHEmN4cqt4
	8vRXo8h76W+G5LsVtstrcEUaZWFgAbG0//1tJevksXjadWX3OoizqKuKpC6ZH3RA4mKTAq3Gz9n
	yaaTuYXwNocCE+cALM9eBd0FM0769OLfXFo55rcL2R95lHub3SNwU187jlm9ym+yDC0Xpia9GMu
	/QqDfD83wzJYZ5zX+yDTgJvcR3qXVucZaN0ltoLI3zqZ1FbLJIcIAGJjGDEmfZMtRzrQzX36Ext
	Og+TzQMXVtHE/W/Ngyhvj7apVJgLVW3n86YeIzQ==
X-Received: by 2002:a05:6102:b07:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7af1d4b7b6amr2384252137.24.1790349438272;
        Fri, 25 Sep 2026 08:17:18 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7af1d4b7b6amr2384222137.24.1790349437553;
        Fri, 25 Sep 2026 08:17:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff023f12esm66909405e9.0.2026.09.25.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 08/16] iommu/dma: Introduce iommu_dma_prepare_msi_list()
Date: Fri, 25 Sep 2026 17:16:51 +0200
Message-ID: <20260925151659.419512-9-andrew.jones@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6907f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=2ceW4JgIosI8Fxwmn1gA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: y1LL3xSR4eFFtxp9sX15E98Ri6Wjruyw
X-Proofpoint-ORIG-GUID: y1LL3xSR4eFFtxp9sX15E98Ri6Wjruyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxY4UV3CV0uZf
 tq6iD8tW0FeQX2wzyculeiTiZ+sZ9rp1+fOYrhhDfdAGrPlbbv0OdhNXkeJX3CII4v4mqAWsih3
 APWEnn7SvcmAHbMUzitca9Hpwd5KjBPlq+XztFqn6vklk+8azujA6mybV2Jf8fW+TYBu5fBaUN5
 0NFX4Jhp3t7aYm/P28KE735MRpQi7stKFbgTpqRtMB6Z4I9yji0OxAp7+RPJXk222ZEkcZU7zKK
 pgjQ8dKrVAvBiliV23pSiqOg+VW4ThS2DSSyc3Axk3i61/l3ZzC+RO4FF2wznoso5ZriwTbO9fR
 q+41MR1BjgcvtA8FyyjkCB+/6ptznWRJc7B3Zuds31yDQRqdp0zlwSA9ThWOOA4FT65RWgiqbZE
 er96kbpunldJV6UYuyHDRmURIs2DyebNoel3IsTETTv4uhPBRngQZkQT6wko/IVFPWsaNAlaH8h
 dSdbMWN9qziZ837g4Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX4Pf/fdJRPRSu
 FqIjZ58h6aMw547BwVILHeUVh3BwVPao0YngmrkM3b6F8zt3kaQX1yTWPzk1kUg43KPN7hTViTA
 HoJY8kD+cHAex4RgSk34cyGQ5i+ngXc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

Add iommu_dma_prepare_msi_list() to map an ordered physical address list
through the current domain backend. Validate that the requested granule
is a power of two no smaller than PAGE_SIZE and that every address is
aligned to it.

Refactor iommu_dma_prepare_msi() to obtain the backend granule and align
its single address before using the same list dispatcher. Convert the
DMA-IOMMU and iommufd backend entry points to consume address lists
directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/dma-iommu.c      |  13 ++--
 drivers/iommu/dma-iommu.h      |  13 +++-
 drivers/iommu/iommu-priv.h     |   7 ++-
 drivers/iommu/iommu.c          | 109 +++++++++++++++++++++++++++------
 drivers/iommu/iommufd/driver.c |  24 +++-----
 include/linux/iommu.h          |   8 +++
 6 files changed, 126 insertions(+), 48 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 0b4eb47d1a95..dc7b369792e4 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -2168,7 +2168,7 @@ static bool has_msi_cookie(const struct iommu_domain *domain)
 			  domain->cookie_type == IOMMU_COOKIE_DMA_MSI);
 }
 
-static size_t cookie_msi_granule(const struct iommu_domain *domain)
+size_t iommu_dma_msi_granule(const struct iommu_domain *domain)
 {
 	switch (domain->cookie_type) {
 	case IOMMU_COOKIE_DMA_IOVA:
@@ -2299,23 +2299,20 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 }
 
 int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr)
+		     const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	const struct iommu_dma_msi_page *msi_page;
-	phys_addr_t phys_addr;
-	size_t granule;
 
 	if (!has_msi_cookie(domain)) {
 		msi_desc_set_iommu_msi_iova(desc, 0, 0);
 		return 0;
 	}
-
-	granule = cookie_msi_granule(domain);
-	phys_addr = ALIGN_DOWN(msi_addr, granule);
+	if (granule != iommu_dma_msi_granule(domain))
+		return -EOPNOTSUPP;
 
 	iommu_group_mutex_assert(dev);
-	msi_page = iommu_dma_get_msi_page(dev, &phys_addr, 1, granule, domain);
+	msi_page = iommu_dma_get_msi_page(dev, phys_addrs, nr_addrs, granule, domain);
 	if (!msi_page)
 		return -ENOMEM;
 
diff --git a/drivers/iommu/dma-iommu.h b/drivers/iommu/dma-iommu.h
index 040d00252563..bf9cd4102d35 100644
--- a/drivers/iommu/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -19,8 +19,9 @@ int iommu_dma_init_fq(struct iommu_domain *domain);
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
+size_t iommu_dma_msi_granule(const struct iommu_domain *domain);
 int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		     phys_addr_t msi_addr);
+		     const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule);
 
 extern bool iommu_dma_forcedac;
 
@@ -53,8 +54,14 @@ static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_he
 {
 }
 
-static inline int iommu_dma_sw_msi(struct iommu_domain *domain,
-				   struct msi_desc *desc, phys_addr_t msi_addr)
+static inline size_t iommu_dma_msi_granule(const struct iommu_domain *domain)
+{
+	return 0;
+}
+
+static inline int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+				   const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+				   size_t granule)
 {
 	return -ENODEV;
 }
diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
index aaffad5854fc..1122c99566d5 100644
--- a/drivers/iommu/iommu-priv.h
+++ b/drivers/iommu/iommu-priv.h
@@ -54,10 +54,11 @@ int iommu_replace_group_handle(struct iommu_group *group,
 
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER_CORE) && IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
 int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr);
+		   const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE || !CONFIG_IRQ_MSI_IOMMU */
-static inline int iommufd_sw_msi(struct iommu_domain *domain,
-				 struct msi_desc *desc, phys_addr_t msi_addr)
+static inline int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+				 const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+				 size_t granule)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..07602b467582 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -4223,21 +4223,89 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 EXPORT_SYMBOL_GPL(pci_dev_reset_iommu_done);
 
 #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
+static int __iommu_dma_prepare_msi_list(struct iommu_group *group, struct msi_desc *desc,
+					const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+					size_t granule)
+{
+	if (!group->domain || group->domain->type == IOMMU_DOMAIN_IDENTITY)
+		return 0;
+
+	switch (group->domain->cookie_type) {
+	case IOMMU_COOKIE_DMA_MSI:
+	case IOMMU_COOKIE_DMA_IOVA:
+		return iommu_dma_sw_msi(group->domain, desc, phys_addrs, nr_addrs, granule);
+	case IOMMU_COOKIE_IOMMUFD:
+		return iommufd_sw_msi(group->domain, desc, phys_addrs, nr_addrs, granule);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int iommu_dma_validate_msi_list(const phys_addr_t *phys_addrs, unsigned int nr_addrs,
+				       size_t granule)
+{
+	unsigned int i;
+
+	if (!nr_addrs || granule < PAGE_SIZE || !is_power_of_2(granule) ||
+	    nr_addrs > SIZE_MAX / granule)
+		return -EINVAL;
+
+	for (i = 0; i < nr_addrs; i++)
+		if (!IS_ALIGNED(phys_addrs[i], granule))
+			return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * iommu_dma_prepare_msi_list() - Map MSI pages in the IOMMU domain
+ * @desc: MSI descriptor to update with the base IOVA
+ * @phys_addrs: Ordered MSI target physical addresses
+ * @nr_addrs: Number of addresses in @phys_addrs
+ * @granule: Mapping granule for every address
+ *
+ * @nr_addrs must be nonzero and @granule must be a power of two no smaller than
+ * PAGE_SIZE. Every address must be aligned to @granule. The addresses are mapped
+ * in order to one contiguous IOVA range and may repeat. The list is consumed
+ * synchronously and is not retained.
+ *
+ * When a software MSI mapping is required, the backend records the base IOVA
+ * and granule shift in @desc. Otherwise, @desc is left unchanged.
+ *
+ * Return: 0 on success, -EINVAL if the parameters are invalid, -EOPNOTSUPP if
+ * the domain backend cannot provide the mapping, or another negative error
+ * code from the backend.
+ */
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct iommu_group *group = dev->iommu_group;
+	int ret;
+
+	ret = iommu_dma_validate_msi_list(phys_addrs, nr_addrs, granule);
+	if (ret || !group)
+		return ret;
+
+	mutex_lock(&group->mutex);
+	ret = __iommu_dma_prepare_msi_list(group, desc, phys_addrs, nr_addrs, granule);
+	mutex_unlock(&group->mutex);
+	return ret;
+}
+
 /**
  * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain
  * @desc: MSI descriptor, will store the MSI page
  * @msi_addr: MSI target address to be mapped
  *
- * The implementation of sw_msi() should take msi_addr and map it to
- * an IOVA in the domain and call msi_desc_set_iommu_msi_iova() with the
- * mapping information.
- *
  * Return: 0 on success or negative error code if the mapping failed.
  */
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct iommu_group *group = dev->iommu_group;
+	phys_addr_t phys_addr;
+	size_t granule;
 	int ret = 0;
 
 	if (!group)
@@ -4248,21 +4316,26 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 		return ret;
 
 	mutex_lock(&group->mutex);
-	/* An IDENTITY domain must pass through */
-	if (group->domain && group->domain->type != IOMMU_DOMAIN_IDENTITY) {
-		switch (group->domain->cookie_type) {
-		case IOMMU_COOKIE_DMA_MSI:
-		case IOMMU_COOKIE_DMA_IOVA:
-			ret = iommu_dma_sw_msi(group->domain, desc, msi_addr);
-			break;
-		case IOMMU_COOKIE_IOMMUFD:
-			ret = iommufd_sw_msi(group->domain, desc, msi_addr);
-			break;
-		default:
-			ret = -EOPNOTSUPP;
-			break;
-		}
+	if (!group->domain || group->domain->type == IOMMU_DOMAIN_IDENTITY)
+		goto out_unlock;
+
+	switch (group->domain->cookie_type) {
+	case IOMMU_COOKIE_DMA_MSI:
+	case IOMMU_COOKIE_DMA_IOVA:
+		granule = iommu_dma_msi_granule(group->domain);
+		break;
+	case IOMMU_COOKIE_IOMMUFD:
+		granule = PAGE_SIZE;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
 	}
+
+	phys_addr = ALIGN_DOWN(msi_addr, granule);
+	ret = __iommu_dma_prepare_msi_list(group, desc, &phys_addr, 1, granule);
+
+out_unlock:
 	mutex_unlock(&group->mutex);
 	return ret;
 }
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index f4e812e43822..99104be956ca 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -419,9 +419,14 @@ static void iommufd_sw_msi_set_required(struct iommufd_group *igroup,
 	}
 }
 
-static int iommufd_sw_msi_list(struct iommu_domain *domain, struct msi_desc *desc,
-			       const phys_addr_t *phys_addrs, unsigned int nr_addrs,
-			       size_t granule)
+/*
+ * Called by the irq code if the platform translates the MSI addresses through the
+ * IOMMU. phys_addrs are the physical addresses of the MSI pages. iommufd will
+ * allocate contiguous fd global iovas for the physical pages that are the same on
+ * all domains and devices.
+ */
+int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
+		   const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule)
 {
 	struct device *dev = msi_desc_to_dev(desc);
 	struct iommufd_hwpt_paging *hwpt_paging;
@@ -505,19 +510,6 @@ static int iommufd_sw_msi_list(struct iommu_domain *domain, struct msi_desc *des
 	return rc;
 }
 
-/*
- * Called by the irq code if the platform translates the MSI address through the
- * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
- * allocate a fd global iova for the physical page that is the same on all
- * domains and devices.
- */
-int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
-		   phys_addr_t msi_addr)
-{
-	phys_addr_t phys_addr = msi_addr & PAGE_MASK;
-
-	return iommufd_sw_msi_list(domain, desc, &phys_addr, 1, PAGE_SIZE);
-}
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi, "IOMMUFD");
 #endif
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ac43b8b93f14..bf08be172e40 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1561,8 +1561,16 @@ static inline void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 #ifdef CONFIG_IOMMU_API
+int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+			       unsigned int nr_addrs, size_t granule);
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
 #else
+static inline int iommu_dma_prepare_msi_list(struct msi_desc *desc, const phys_addr_t *phys_addrs,
+					     unsigned int nr_addrs, size_t granule)
+{
+	return 0;
+}
+
 static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
 					phys_addr_t msi_addr)
 {
-- 
2.43.0

