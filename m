Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DD448CF6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292222; cv=none; b=UCCajYInl+EbQMbMUliHdlpC+jU89bSiA+MnOLduEcpwPvEEBaaE9d99vxxRpOfgSkLalInzPDFVwweY3z9586MK2Z9ZBQZ5PR/cWUXU9ynGJcLHCv5SCeRzyK0ArO725DiJj2TcI3DferjJSBEVE/HJruvH3lVHviG0ze1sEno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292222; c=relaxed/simple;
	bh=Deel6G1vou2hQXcZdtMVgS/qy1xjkk9+uCukg4s0Qqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzRNl4xt0OJ9ZnPF7i58dRz7cgyFtUuVxMgozulI9O0FrPgXkH3YI80W09ThZYLPmkjWc+7lfO9XIFHQZ9aOTaAjU+DTYER8DddEREB0Cf6PTQmaovJn+PzJ3+EG9++J45pxJbLWd5AGRuEbpPsG03VbM2rltXRHPmWzn3Fa91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxwPwu2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSD5QeNq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxwPwu2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSD5QeNq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPE1C680877
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7qz+kphyBcY
	gVTQEMuJdZWHB+095CEstCSz1VAkJ91s=; b=kxwPwu2mUM0ysSQUtdvpW4sEsDD
	vqUj4yKc7bTrBe1MFSjT7/kI/AkLi2KSZfnyNxZ5/M/MOBqxezXraCQRB82Aq3zc
	7RLzNKxXL7iJuv6N5JZERriJD9QBf1SuCcHNgYILbyPoGh5LWu4B5+SzeqQowsth
	59K/qE7a02hTXyK66dqDGjNZMIYLUanE904VrukV9xP2nz8BlSheDVuUmnaajttj
	0BPK25tUVO1A8bDXVlK49oOOK8rBVOF4wthLI3O+FMa1YUJKFHbenwfKn82COLop
	8mdSARUVMsXySH2ELkR8VIFZzp0p0z+jeaGEdBiNxGrLDdztj7vK8a89eoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9rpvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:10:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4578787a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292215; x=1791897015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qz+kphyBcYgVTQEMuJdZWHB+095CEstCSz1VAkJ91s=;
        b=KSD5QeNqURdXpwGaBBvK3jKeC7Xfo3fAMV7lNjDkpxeP9dBjqLRvGAoTH84B4beOEr
         P0Q/GciL9/45UGRT1iB9TcskfynakqYqB8NV7lPjzHP5D46VuaPQNqLi75Uf6LvaHqrI
         1kNdQt9Jt14quu052zX2A6wyr1CI7h7NrLWttJiJHBBmHwI2nuTeeBfj0M3LMHsRcTng
         CmodXcWS0PDVMU7INyLXE8JMA8zO61o8usf02HYPIa9bkG9XcWcvfx2kyWbBKA1fGqrh
         Ye05+z4SmrML38N8FAyA7zD5OowTsF6QykNkAuKKYQpCYViNnmzxC4lW1GdNZa8udceq
         NvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292215; x=1791897015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qz+kphyBcYgVTQEMuJdZWHB+095CEstCSz1VAkJ91s=;
        b=MSbH62DqctGNwY+1fflx2y1/oUtKuBT6UFkB164+ZB32WDwt0bSuG4Z+I72we7/Nzg
         iipjnbaxOVVoOet7DynlXFM73Kk6X5KdzuYusKSY7jLOvngd4waYTj+JS4UWiI4rnnSr
         RRzmMxjzz8vdAui3/VBGyM/pFdoHrNuK4K8Uzakcsu/UI9AN4ehGTTgwZ+6mK48zMriE
         vKlQQIBxLiPTR5Gx5BmMeiOxC4dq/4ClZo2Eb/Fmv5iesKYlzMSgWE/ew2D5bO7RjYU9
         CMlY2M7BmoNB5VBD4Vk1AOIMmiHCgp7QtpdbF1KUG8eqdqO6NHFyVM9fcIBN0K3z2C5a
         3NNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx04/PLQ3iQB9HAUwcJDVKfcJM7dpPh02zOG0tB3Ji01O0Eyi4FBbIPP/rETMl9JOUQGugacRWBscYIx9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgIJ+Vr5/LojVaFM6mY8tR1i0DqrtX8PKTJMvwZp02IO5baYTM
	zilsHo4inPSQfBkBbkgr0HiUkJOBm4klCNtxXRzTSzsMZac/hXiqCpKK0Z7VGkAIMTvYkYP4vMO
	rnRgONkhz5OwzZWMgDE/T7dR/xsWBZadAfYz4odjfUtB+iIfMf1OPGKS7mJX16WOl86o=
X-Gm-Gg: AYBFou210kmGmlus350oRofELrsiroSdlxY0oBmlUyhNRG2KEPk4QcHYlMa0OXspwfo
	hqAGXuHbWkfgSPfIEI5noSOphO1S3sj5xzrDW7ZEi4c6jRnbNbqDZCi5A/TvWjsT4oEXCq1y1lb
	XTfXvRGT8FL5aMbaItpKT0CHL0qJEUDtJiwD4yYPLtR06a2zGSHpSqIEIsyM0soN5PjLiDpwX4d
	NHif66zqErUMci74iVk2hMKnKzLw2K4EgABawf8qd5RRkBVUTS6hJmsfeLiW0JcY5usyk8VymEW
	/kGqPjCRUycxVDZVL+LUDqV3cfuO7ADI8n7SMMaQnWoDbsxnHwC73SoPBRam3cLpPbqE65A1Oop
	doaorK8j7Jm9JCPJauSIAvrywp1tMUfcUmpgnf3btCZ/mXw==
X-Received: by 2002:a17:90a:d88b:b0:3a4:bc68:42b8 with SMTP id 98e67ed59e1d1-3a87353c17cmr967020a91.13.1791292214413;
        Tue, 06 Oct 2026 06:10:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d88b:b0:3a4:bc68:42b8 with SMTP id 98e67ed59e1d1-3a87353c17cmr966993a91.13.1791292213804;
        Tue, 06 Oct 2026 06:10:13 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5cb457c87sm10596705ad.68.2026.10.06.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFT 3/5] drm/msm: Extract out map/unmap helpers
Date: Tue,  6 Oct 2026 06:09:54 -0700
Message-ID: <20261006131000.81501-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac4f337 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=TlyCNyREkyh6uJHYreoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX6DXlSq6cit1w
 X3UycIEycw7vuVo3NF+yYXA533Yp9FxlCixiQprZ0pVbG/LVd/WRBZO8LcfUTV6tlypGdVvh94/
 YPsyeiN5xefskM2/hVSEOlu0di7SSNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX/UbzDRXpmjgI
 s+N6Imkb9eKGi5lI1kPaG+C/4pcJYpxPvbqYKrEsmanisS/s0g281Bxd4jMKfdbwwv0OSinMQiU
 fG7qe6qm1fohbvI5DsApYGoJa1+A7jMwbY4JX/El5duG2TzyEMenLd7Q/290H10nZQwvek8qJty
 vAibcm/7LEhs+xxrKlv/l0XzJgLr9MWrWxZ+IbUM5hE6+2Hk3TBNMGa/3PaTrTQsCPoV0n8gvGn
 8wRDAREmEIqe/sXyzdvgnntPqGpI8cDzT66ytCnmyvWLw8lBdZlJ7XfCgD0JbwMNwx0KitO+uLS
 W/omqdujW4WtnAk2JBGdY0RID1XUdpmbUHS5iQd3Z41Ek8ClC2L+cyymETxgG6zLi9mAzhhYzmb
 ZB1Naf5Drip9rXOTSzmDqiWiG8295MLU2krFpeKun8ak4VSCcY0khaiqYBVPh1TyKOcx+F3uPjF
 89LNNT2eeym14olhRwQ==
X-Proofpoint-ORIG-GUID: DgWjNPeK7slCC7hXV3ckl9GFhuZpNhHv
X-Proofpoint-GUID: DgWjNPeK7slCC7hXV3ckl9GFhuZpNhHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

We're going to re-use these in the next commit.  No functional changes,
just some ugly callbacks.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 150 ++++++++++++++++++++------------
 1 file changed, 93 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index da6782fca6bd..a658493f8007 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -52,9 +52,8 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
 }
 
 /* based on iommu_pgsize() in iommu.c: */
-static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
-			   unsigned long iova, phys_addr_t paddr,
-			   size_t size, size_t *count)
+static size_t calc_pgsize(unsigned long pgsize_bitmap, unsigned long iova,
+			  phys_addr_t paddr, size_t size, size_t *count)
 {
 	unsigned int pgsize_idx, pgsize_idx_next;
 	unsigned long pgsizes;
@@ -62,7 +61,7 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	unsigned long addr_merge = paddr | iova;
 
 	/* Page sizes supported by the hardware and small enough for @size */
-	pgsizes = pagetable->pgsize_bitmap & GENMASK(__fls(size), 0);
+	pgsizes = pgsize_bitmap & GENMASK(__fls(size), 0);
 
 	/* Constrain the page sizes further based on the maximum alignment */
 	if (likely(addr_merge))
@@ -78,7 +77,7 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 		return pgsize;
 
 	/* Find the next biggest support page size, if it exists */
-	pgsizes = pagetable->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
+	pgsizes = pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
 	if (!pgsizes)
 		goto out_set_count;
 
@@ -107,24 +106,27 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	return pgsize;
 }
 
-static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
-		size_t size)
+typedef size_t (*unmap_fn)(void *arg, u64 iova, size_t pgsize, size_t count);
+typedef int (*map_fn)(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+		      size_t pgcount, int prot, size_t *mapped);
+
+static inline int
+__do_unmap(unsigned long pgsize_bitmap, u64 iova, size_t size,
+	   void *arg, unmap_fn unmap)
 {
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	int ret = 0;
 
 	while (size) {
 		size_t pgsize, count;
 		ssize_t unmapped;
 
-		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
+		pgsize = calc_pgsize(pgsize_bitmap, iova, iova, size, &count);
 
-		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
+		unmapped = unmap(arg, iova, pgsize, count);
 		if (unmapped <= 0) {
 			ret = -EINVAL;
 			/*
-			 * Continue attempting to unamp the remained of the
+			 * Continue attempting to unmap the remained of the
 			 * range, so we don't end up with some dangling
 			 * mapped pages
 			 */
@@ -135,55 +137,18 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size -= unmapped;
 	}
 
-	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
-
 	return ret;
 }
 
-static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
-{
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
-	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
-	phys_addr_t phys = page_to_phys(iommu->prr_page);
-	u64 addr = iova;
-
-	while (len) {
-		size_t mapped = 0;
-		size_t size = PAGE_SIZE;
-		int ret;
-
-		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
-
-		/* map_pages could fail after mapping some of the pages,
-		 * so update the counters before error handling.
-		 */
-		addr += mapped;
-		len  -= mapped;
-
-		if (ret) {
-			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
-static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
-				   struct sg_table *sgt, size_t off, size_t len,
-				   int prot)
+static inline int
+__do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off,
+	 size_t len, int prot, void *arg, map_fn map, unmap_fn unmap)
 {
-	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
 	struct scatterlist *sg;
 	u64 addr = iova;
 	unsigned int i;
 
-	if (!sgt)
-		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
-
-	for_each_sgtable_sg(sgt, sg, i) {
+	for_each_sgtable_sg (sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
@@ -204,10 +169,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			size_t pgsize, count, mapped = 0;
 			int ret;
 
-			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
+			pgsize = calc_pgsize(pgsize_bitmap, addr, phys, size, &count);
 
-			ret = ops->map_pages(ops, addr, phys, pgsize, count,
-					     prot, GFP_KERNEL, &mapped);
+			ret = map(arg, phys, addr, pgsize, count, prot, &mapped);
 
 			/* map_pages could fail after mapping some of the pages,
 			 * so update the counters before error handling.
@@ -218,7 +182,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			len  -= mapped;
 
 			if (ret) {
-				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, unmap);
 				return -EINVAL;
 			}
 		}
@@ -227,6 +191,78 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	return 0;
 }
 
+static size_t
+__unmap_pgtable(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct io_pgtable_ops *ops = arg;
+	return ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_pgtable(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	      size_t pgcount, int prot, size_t *mapped)
+{
+	struct io_pgtable_ops *ops = arg;
+	return ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot, GFP_KERNEL, mapped);
+}
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
+
+	ret = __do_unmap(pagetable->pgsize_bitmap, iova, size, ops, __unmap_pgtable);
+
+	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+
+	return ret;
+}
+
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
+				   struct sg_table *sgt, size_t off, size_t len,
+				   int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
+	return __do_map(pagetable->pgsize_bitmap, iova, sgt, off, len, prot,
+			ops, __map_pgtable, __unmap_pgtable);
+}
+
 static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-- 
2.55.0

