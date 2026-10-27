Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142317;
	b=ZF1GXxXo5q1sN00bpVGMLddJUWWCDyZfO9O1z4tg7XPmffNQHnrp5+X3TW5utsaBwHNh
	 hJMXTYFFT5XC31kFC/afGL4FtmdXKfHvFcTyFKylIGLpMncYstrxtVg0uehXdy2TjwWaA
	 XNij/0NHUEcThMJY2OaCzat94WpGGWqZmIHvweFkCxsjM6wDDkS6dL4XqZj7J/c3I9KbR
	 2tNgTKTg9i4X1QF79T5iq4ei2EaYcO5Lqr5mZlXcU4y3ae2v2k0znNmmB9ecLs7rP5h1z
	 58qZ82dF1X5xBm/SdnEP0ewmN15AgnimN83d3Mjut6r0ZVlBo1TTToMyBvdiwFlIZWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
	b=PgFXiHhr7uE/MIAhJ/vcQwBABgWXR0GU3/2+LYaGrdHA0UogNGwLhnfdOJIhiCSbsnbK
	 jesTyrnpbrhK/hYvOGWPqWsX06D4+8DRbWFFxONevAl5MBWr0qedcbT5xQqy3SRlTsCwg
	 0zOiU58GIfzyr/ry3zCk8nMOIdqpK0VOqQ0Qz91T6GHROWeKOqQF+yLfh+sCHPASjSX3s
	 CB81zSAoEcq3NFwUQ4xguN1uAJktnCdXwnFoJRqOx9Jbdv/kK9HIYCgz2wPmXeB/njzlA
	 B0GyJxn8xqld2/0C5zQohxqlhGM4AsWR3/CvCkN2IuIzS1ugKzLSW0fMsEI7DdObRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNrOcGbA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pql0CwyI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD6606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBD6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNrOcGbA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pql0CwyI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtF6x3823555
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3A6r6krJwA2
	+ooPkO/GTStseFtBhZbXE17EJlS5WROk=; b=RNrOcGbAtg8CSmQX7FShR0ZUyap
	25h1mNsJzerNfhVGtd/tXv4As9oD4PzSR0D+jLVfhSwZNG+gwptIRJilRzMEsSc5
	rL74S/tsAN3pXgXEOgq7GWvHOJKq14NTRFWvj/NASuamgyvCJh7ISI/t2EdbjFGL
	3W0K/aNz9lSJznGCgWIWAUOlbyrI6TT3MMpxsaH2oYSD4pesYtKQbeVJ3xNC3VIV
	VyMOrpVj6sllCkXp2ocZtZiWpm2xvAm51Pj0Tn7c3A5i3HzqEQSywfiqFu2Rtf6z
	v3aav1C22iERqtde7AySFD2csbPfgca4fXk6hnlYUAH3r0iUlinr7xNDxHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk2qe0hcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so1166837a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142315; x=1793747115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=Pql0CwyI5QyGg82tjXdFyr2XVFMqCvXEKsQUrcuepzPVC0fIpLShSN7SFvIjlLfloK
         NS+JO1NBsK3JMPnA8W1+N+VnC1j1cz5YuuPhFvKl4c7TgAu7HKT8eaDPVQVFOnfyiX+B
         Cm/DBYsK7JMofzXROiH6KmtJRq3uPD0G1/qZBMfKmxiL0FElX7z34oZmsQxNfZ7Zc/ST
         IUgJN3N5bwspKxDgoxWliqrmB71KcxpMFqaRVvssMYqNgwZVQwmwNhTpaYfqriEUczOz
         r5rJXk4Fa28m1DnQ585i4Qf3PCmuLzyM+XPaQc4m0/S3pM1nUCTXVQmlEP//ghrFPfYE
         KbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142315; x=1793747115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=eVu1Va8xYObEl+qU+Sml5ftoJtNNDu4D9bPgxNHy0CK82KBkUph5owJsdkT34zx5bV
         +0eyogGDn+/2N2UYlG0CyNe4m3DY7nDgGPnIRvUSE2qX11A4kD8RfhgB/LnmEzA2bDru
         SHhwn8oiMIoKyJCZ6Dh7mWrHHvvJt/8OW1vJ1uE9yUm80f4U9YOlusXEpS4E4DyQ+mSC
         +yUyWElO5eU79tr4gsJA67tFCGDaVKEyPJAiBdLTCTD7Hb39dlqARPL0T9+KkIYM4R9+
         P4mM0UZhjmRGos1tQ69cK7rfgOiw6pvi95Gt55/fqHWkQqEqxZMvadG8dI1DKTOxskPQ
         TPSQ==
X-Forwarded-Encrypted: i=1; AKwUvBznHpg9ujaP9DtNwUM3NqI6Nc8pcjePkJFz1EQZLLnk67VSTmG82RqDztGaZzA94Zbm11Z2pW18snmPeGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGvl+YyGItp+Y60UyJ1s32tqR+PgXAs66dX8qomh5EDg2M7h8M
	C1hRcARA3RvChic+WNKGZ/ruWaAtWdQoiAVCiJAuD3+EkeQ8zn+4WcwtsQg3QsPJXN9e1zrWqK2
	DAjgFhfEk00ux4K75dbJ51jTYfGNZ+t8h5ov3Ml9XN1FymULlcVDKi6jAckAMX3rxD2Q=
X-Gm-Gg: AYBFou0tvVoGbXx/E0As8Sm5m4afcSe91sRWmXUvdvhm+WvSwGeZRq95tt+flOPhCbG
	roJMBpL1tyc3gMmSKZ8sS2lLjC9yjSshl4y6whVPl6Dqu4/fEv1omQkxgZgRZP0cglebl7O62jY
	ls4Wyu7TkWNGIgGAL9nh+zeCwRtPoHBJTpsMXuWHecntTvkTfEftFkFbDAMAeewWg8MmxJ7aQhl
	5U0X7hZMMp5MhgeWSfTXzRC6PsCi5yKop7fWcyq388A5er/adk8LthM1tn6llNQMRNpny+cAGxs
	FYnxAAtqqi9c1eNWaCZvup3O8ZrUfBFhTEy2kv8UHbC7slMx4jbDTC0VS/+4YUtqg2iwCdywCH/
	d6QicoypcZio5e/GpgTHBg1+K8w7TkFh/t4vLVLOvwWl1Qh9SJw==
X-Received: by 2002:a17:90a:d00c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae58182be0mr247631a91.33.1793142314579;
        Tue, 27 Oct 2026 16:05:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d00c:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae58182be0mr247620a91.33.1793142314089;
        Tue, 27 Oct 2026 16:05:14 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm215748a91.16.2026.10.27.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/6] drm/msm: Extract out map/unmap helpers
Date: Tue, 27 Oct 2026 16:04:46 -0700
Message-ID: <20261027230452.130031-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BcbsfMuTP8hYwYusEq0TfTxKWPmn8oqb
X-Authority-Analysis: v=2.4 cv=YuGa1IYX c=1 sm=1 tr=0 ts=6ae12e2b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BsEuFZ40A6pGwezTnxoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX/g9v6q8OkzZl
 QOj6+rL3pfwrz9YgMfDDJr70TSIdv1FdFpxfMHtaE4MAO4G6xm6jHkwNh5L7qPl0ediESGj6dJh
 F1OgrDRuXodf+kg7L2xbraAxSw6h8+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9WY03tmURFP8
 VenjDSK2enf0nkbo7ul/CsfuORn+kJqZa14p8hI/JvLUzpahs9ZKfWowq6CWEI/2l6Vg6JuyxhY
 NvzyCV/frkBcJhSw+Wo6kd5r7Iu8kiXIrPXOZ5tEcLI9dqfUrjDQqFCcc4v6jWppzcs3tqNQzph
 O4CErQ/QxHDJGd7+p4oPpefc5QryiZ8OD7SRKKfrlhs4/vneonWd0GO/JQ1gAdqKaiaT9Cijaur
 7VH8k7Q+YBdjJgTs5tv3sf5K7F97vVceiFwcNkjwOrkgQ24pcmvHG99H467qh/RdUSe1OAwbZlH
 R+dprFvJnCLZdAkAiseTwxxdLXv37Kbe7fLUYxATNjjOh9fGZvDmT7aHIK3+x4nJh0wsaS8hTfC
 pSCKWhxQsQml9L7nKI6jmzyPtwpVQbgKCkIHhFaoBDfJl3gYZcEYd7IER+6rgUiSUs6z+PNwlGB
 JsBqZhongKsIYKTRotw==
X-Proofpoint-ORIG-GUID: BcbsfMuTP8hYwYusEq0TfTxKWPmn8oqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

We're going to re-use these in the next commit.  No functional changes,
just some ugly callbacks.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 159 +++++++++++++++++++++-----------
 1 file changed, 103 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index da6782fca6bd..5c13ad6d5a36 100644
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
 
@@ -107,24 +106,30 @@ static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
 	return pgsize;
 }
 
-static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
-		size_t size)
+struct map_ops {
+	size_t (*unmap)(void *arg, u64 iova, size_t pgsize, size_t count);
+	int (*map)(void *arg, phys_addr_t padder, u64 iova, size_t pgsize,
+		   size_t pkcount, int prot, size_t *mapped);
+	void (*flush)(void *arg);
+};
+
+static inline int
+__do_unmap(unsigned long pgsize_bitmap, u64 iova, size_t size, void *arg,
+	   const struct map_ops *ops)
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
+		unmapped = ops->unmap(arg, iova, pgsize, count);
 		if (unmapped <= 0) {
 			ret = -EINVAL;
 			/*
-			 * Continue attempting to unamp the remained of the
+			 * Continue attempting to unmap the remained of the
 			 * range, so we don't end up with some dangling
 			 * mapped pages
 			 */
@@ -135,55 +140,20 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size -= unmapped;
 	}
 
-	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+	ops->flush(arg);
 
 	return ret;
 }
 
-static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+static inline int
+__do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off,
+	 size_t len, int prot, void *arg, const struct map_ops *ops)
 {
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
-{
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
 
@@ -204,10 +174,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			size_t pgsize, count, mapped = 0;
 			int ret;
 
-			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
+			pgsize = calc_pgsize(pgsize_bitmap, addr, phys, size, &count);
 
-			ret = ops->map_pages(ops, addr, phys, pgsize, count,
-					     prot, GFP_KERNEL, &mapped);
+			ret = ops->map(arg, phys, addr, pgsize, count, prot, &mapped);
 
 			/* map_pages could fail after mapping some of the pages,
 			 * so update the counters before error handling.
@@ -218,7 +187,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 			len  -= mapped;
 
 			if (ret) {
-				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
 			}
 		}
@@ -227,6 +196,84 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	return 0;
 }
 
+static size_t
+__unmap_pgtable(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	return ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_pgtable(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	      size_t pgcount, int prot, size_t *mapped)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	return ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot, GFP_KERNEL, mapped);
+}
+
+static void
+__flush_pgtable(void *arg)
+{
+	struct msm_iommu_pagetable *pagetable = arg;
+	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
+}
+
+static const struct map_ops pgtable_ops = {
+	__unmap_pgtable, __map_pgtable, __flush_pgtable
+};
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova, size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+
+	return __do_unmap(pagetable->pgsize_bitmap, iova, size, pagetable, &pgtable_ops);
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
+
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
+	return __do_map(pagetable->pgsize_bitmap, iova, sgt, off, len, prot,
+			pagetable, &pgtable_ops);
+}
+
 static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
-- 
2.56.0

