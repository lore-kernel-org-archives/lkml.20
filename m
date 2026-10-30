Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395983;
	b=V/t3EPZunv/vE675dANn8Dq5WJuMVM8xDgiDoKdUiwB73w54ro6o+tl3dlJqD35n0vKQ
	 csTLpOu6eGKEzblQH68rjmy/mOL1FtYkMqEyeKaWLFEndPhvMkR0Heu2Un40GAfk9Mwp7
	 6CsUQrkHVKFmt+2YpWU/TfvgsXAIoMnDLiXD4CUVSbZjTZplvXvpui15af1Dh53UMlldl
	 I5Oac0wCC6mrN+g7Rij9kBz0MGpml4vpMuyw+KVVSMLtScI3ECPW8fV/HSANU2QuxnNJi
	 TgtujiwjKPFu8k7p59HKNrwWc/+CgsqN3CTOtJ1oIvNHBuioZXL/hOsTzxUZDAIOFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
	b=hp+c39KOLVDQNBQ+ajE1KZO4Fe/p/+GNvnMlLy/o/7pbpMD+Nx8XIgpbIbovEHkz7bBT
	 HB9pnslAM1nRH6OA9FAM7mMpQKW10rZ1FhrT7yXffeGHXxFB+iUIzaObDxQ7gCtCBP76T
	 dBgITVbRxwYnwY60bbaUvqXhMwWHNyKfe0xs4SudmV3YmgmKBlA3oWS2Cea6aGYnEYWMj
	 MqXowEVtn8nV5HnIkenBiNVYTtPzreV8NlxgsDFdimJPEO1tXhCRvCK8BNS/kHRndi21F
	 Y+9/bT7Ah03fpQfm8ak8IASaI9fv/1rbI87DtHiDPWHJc4E978Uiq+uRdVjX7dFjhxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJiTvZZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgvsTWkQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5799606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5799606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJiTvZZs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgvsTWkQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAVPY3367750
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3A6r6krJwA2
	+ooPkO/GTStseFtBhZbXE17EJlS5WROk=; b=DJiTvZZskbK/YCXyDDUksCMzFiU
	6SjB24Aq7E7atEApP4BgYf8ao0FbM3mPKZYesRRJlimHAlg0QuV7PjwjlUkqo/pQ
	gfsH7z6H8vkt93EnDkazLsPyruAtjSo/3b/VqZfg20vi7flRwdk7nSTfFImjDtzL
	DD8+BAElssF9xoOb8PL4iWXod1Sy7q5W0m5z+lTZIM2M16WpsDlVfY7eUQUfZeRt
	exIv2r/CkXZOVE0sNDiAHnmUsDxHWbsZf3KunQnUybarTcfOssq/ROvZU373BKmh
	bNsYHr9rJ4jB91ecBYpIRFPTo4c7/a3wl69ggN/bj+lPlhRi1hZ91vo3uzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0823v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso966060a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395981; x=1794000781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=LgvsTWkQ6n57BMbey73Ln1ZrC7w7ZRWBZRJrXqQQ17Kx3unb/a0El/JBwQ1MU+SRny
         E0oEkL1PNoldJoTMRC6NRbh6NvmU34tGKf+PilhRbQLUcjER3RoY9QHH4OW7cqWWaKUL
         vaD59VaIQEKn0LSZwVs2vQiUy71gmOEdeueK+zNGM5mZ3faMMPq96jMuOLUsRzEen79/
         wZE1H6jAh/MKf1SFutgx9yqhGfSDxpsOvLfUY+UVGySzSnSJTINm1g5lG4MMt6yusFI5
         P3SOm6Fx9IP3I2GUnPFjRnYglQ+PzYPsEBFePUcXhpOHxBx5BQWrAz4GrA3Zd6ehIKeY
         76Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395981; x=1794000781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3A6r6krJwA2+ooPkO/GTStseFtBhZbXE17EJlS5WROk=;
        b=v/Efrmo63H36Z7MRvQTsNwf4Sh4yVkmqATt6Ihxmcn8K2LUbIgVErgPkENGvMRbGPS
         WIUPAjZXpaiCHiFHtff4utLhXOx7yRpU+2594mNh/KSHxqDw/yAn79xMosnVvQzcWz2k
         52GYwBWuYTMBSDnt7/BaspQ+/53WaY6v3Dr3yMtIln7yl8pvw5mYk8DWi8kdVMWWSr7Y
         65616bI4KrCwoHAarMfrSOavxKAXs8GQ83cIpAcQTbt+23nQhjWDjWyaJruCp83c+RN4
         pQHZrwG6Rltrs3CAe7Ps+zrtu6dp5yymqaFohFG4fGu8Di53YdtmumhwppDwHMYHc6kV
         F4iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx15iUEuTOzKjqGAoHGAHS+mYD+3KV5i8oY39JjpquuBHIJK8d1QvrIGnTvZldzuhZ7aZh35RHofjb3MXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKatqg5twnpXHrVlgkeR/bNA2Gm3U5MT+p2q61f+v0DCtCEh9/Z
	PFmDTH1NcME/wCNjddUuFhm3B0fGnhY8dS1bI2lGtWcAqyXNMP0u01orQ7RDkDffmx0o/McUabc
	+23CjT9+iSl28na80Q7vK7tSlmwD5TGEGtVIIYQlzZuyXj7buCApDAQ6eEAVvh1fwkWMTQKGoQS
	bBGA==
X-Gm-Gg: AYBFou2gsHdMs86slenfTc8pkxRJAjrL5wIHfUU0ixRadRz5I9DALsHma6nK80e8gGO
	uwg0OuP+sRqb1oOVUbimDBAfAaLQm6hAk62gL4GlrBYbDfVuwa3gvVwPfmGaSxbuelNnGiE2J5F
	89GpPUHCAdjHdZYXMSgIOLFzCtKFjdwfGCR+s8KEyP67Vw1doCWklt8VCS8QQA2sgglrnHygUX0
	OMzg3RsC+ncSH6xmLweBxF/Ks75m+ZTW3LWBQZvqEoZjUOgeVpgSd6Q6PiIEArTJr5G07stBHum
	s96wWNIRa7XEQePB5IKaHDBIPL8+t7byd59cDeSY9Gopgb3/ilVfY51lvZpGl7xTPd9NUDPDumB
	My92GiRPuWTKcKNOVeYTCPGZouvYnrCV+Qw8FPJ4uryxozdEWjGN1paKKb/V3Kv0HV8Er4MXA7o
	+7zs4bfoN0mVLyfV+S3mnwEw==
X-Received: by 2002:a17:90b:5645:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ae897aa76bmr3031015a91.55.1793395980668;
        Fri, 30 Oct 2026 14:33:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5645:b0:3ad:6738:db14 with SMTP id 98e67ed59e1d1-3ae897aa76bmr3030995a91.55.1793395980208;
        Fri, 30 Oct 2026 14:33:00 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae841dd1b9sm5359367a91.0.2026.10.30.14.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:59 -0700 (PDT)
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
Subject: [PATCH v4 3/6] drm/msm: Extract out map/unmap helpers
Date: Fri, 30 Oct 2026 14:32:45 -0700
Message-ID: <20261030213251.55365-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: J5uyiUJV3qPd00LvK-b1nRopsWskkOAD
X-Proofpoint-GUID: J5uyiUJV3qPd00LvK-b1nRopsWskkOAD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXyODZMc/Z6zHr
 e/bgxo0MsyuK9BwOxrbwgRFCYBE1bEfGk+y/lDYEcQ6hRTyyjnEquZ09KR75FJLDE4PASBzDF7P
 PSIA0SCFF8xvnua8OAZG+TEMxaKEFxo=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae50d0d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=BsEuFZ40A6pGwezTnxoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXx8H7VPxTp6Zs
 Eapcncft9ZlVK+/R0VU7ms3L44wE8soEebzOT3S4vXvFayAX9u1P/+087/g0Ek6Zm99+GtDok1i
 M4DnN8/AfjEUs9Sa/fOl37hshM+542db9nB2UtYsVzJzG39Wr2FwcyEUeEkk+qkCTOMRmGtWhaR
 KBNXUzzdbYyhIzFzsnRcOz/L7lwuXSbUBUb4Y83+OAVmRnw9qRCK14FoqsxpTdC5ENm8YQlvl6y
 l6uIfRpfYJSnbizuymXGgOlPlIS2OtrBYOQC4VXaAc9yNHQscEiYK4e/iGg5ShE3epWjgQgWvpF
 h009b/ktVZ6Ti3hgPF21WtfsnP7OQvkKvaFT2KMYwW0RGu325q9venbkYDEx5PHG3XAcjJsx6Xv
 uwqijrgVp+OfX9AMTdcJKtY0eiEsai5PxwprepGHNOWEfFwX6Xut9aEQ7YKliKbZJdqPM7Ifls9
 dOABG+DI8orQAbqjBhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

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

