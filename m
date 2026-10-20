Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515813;
	b=kezJcrb1kO3gMdHEvKkMGv1p5wEvsLzOBgFUk//qMpdWhgz0sIY7TQPg4XCjmLl1IWEM
	 9u/M+aVTBSSHPUlqye4Jt0jCKNsAJgDjPA0FupPaTe45Zxa1pI2dFj6b0B4fD5qPGbg9V
	 U023Y+BwedWVTIekayzN1ekOYcQ9BOSFPk+Gng/jvCdcGLvFE2agBqj9t3p+Y+lNtIl4z
	 tuGLmiDBvbxrGhJxEELTPa3hYDdFi6gTOxRijGMFeNbsMsAyAQ2lTfy9PLfysxnTpbUmW
	 8+Lxcz6vnGNmIclz0AlJP8e6dvlNAmmIflc0NdddWbSH/yKSSPJjDA/48ODDgAzOx/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
	b=nJi7q/ivVqwkCa8l9pyyyGXs42agB1NBZsEMJ9sV5/b8QTeQ5qxs2lyfZg5lvAPza6oI
	 YQUr8PP+HyTtr7J0tnR8P+vYRCeoA/YESSUYZDZQz9KURBAaJ0v47uZARB++6QfFLFAs+
	 OHLITXJ0Cpxzc7b8sRhY2Pi1ijx/YJkRlFlUY/ZMQiXuGGp0SZ00ZR5PQxtBYU9s9U5Dc
	 K6CqkeiRaWvgMco4eWCrndt8aauT9enJeoqxMpQ4L3PWMOxiWnICT9XVxG+JoRfRMKSOw
	 wn/4nqVd5GxkwgXm9SWJgJj4oKNVu6xPh26AZ7q1QEOSiQKUzYCMzz9NmC8qATvEC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ea8L1762;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF2606A336
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6EF2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ea8L1762
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9178510f3bdso39391076d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515812; x=1793120612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=ea8L1762+Pgyp10eIpSuWBoRK2+QTDqo+y+ikCOhpKKFmoDN5ctpPMw2rrmmzVEYiL
         CJqe9UKNcgACd/qM+FAWqRaj0hy3bciPnidc+nEahpb8fDs1X3wYTf3Jd5TrAhJWR+D0
         Y2P6wNd4OwrZ59Zad+5PTSPJE+NcAzQ1zvTWZjIMJNHsSI2+MxkmNn83SIbpTsPM/Pjc
         Q/y8NMmzKKstrJnhXluZa7aHOBPOMfgoKvMzJO+Pjhr+h0Putk0RufkXto6LiGXAZclA
         owYZZr/w+RCkeUVJER25cSvN/gcs51/ImQM+ybxnNliGTRHOSwrCgPzCYsuA43fZTq8U
         6yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515812; x=1793120612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdL12cit1+z6d3jeLw0+naLR3nXNXmktozH9BnIvo4w=;
        b=Gx+5FhQM0xqXiai3lklNZJEGXZdISiYGHPAfgrHYL6oR0YuzITil9J+tMJayd4EjcP
         mhApklJi+dcPXDgoOqB5EWAzSWxmBQRqGzBah0AKT/u6xd08oJ4qy/HlJulPPWWugXYs
         oxU/3sgiBOiNkDXWZMbZXuMDyJlvYP4Nj0lcm+z3Jc46B45mCeZ6CvWdnLE/ZnNReSk8
         hla5WlTf23QRj53mnv07dZC7KnS47IJBL+Mm8W/orp5Q5M3BRjAnV45fNX9UMiloLpcb
         vOfRxnMp63UCcMhMvAkyIhEbGZcl8qESRkBmRvUOpt1NupHaCxtYYJi8HoAIOSJLNfEN
         VH9w==
X-Forwarded-Encrypted: i=1; AKwUvBwsx9kWcwE3h1jypgn9SKYDAHizPLVl7oABJ6RjaYyExtkD4YBkpw+VR9T8qLKCLYxT3kQX9ZgpkPUB1Qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMGJtgJQgpvqo/SMVShYl43DhD8UnoChJ95ZP+03Ctxjl98Xs8
	mpvoSnSOkystcGlpMzip3JaPY7QpjdlQqBp/ZcXlaGpUv8RDF/0kxjGn
X-Gm-Gg: AYBFou2LjXFpQLSef8KGIwQrDAAm/UgZO6oUNLanSakNwbbQwF8Q4QYsi7M0Ivd1kwu
	ANZg+dqLUqcsUatTDGYFARCmIeKE8k69jtn3hM7PO/oa4oncpQQ+CV82rq4BA93JvAQv+XI1CT1
	yOsXO1/AR5ij5+VKo7+ZFd2K8p83DL6ub4hVxpNW80Iq/dOt8jsFuxHOvLwMaVXrjEZN1rwAqXv
	vPXU+DSRXm1SQX+ABTMTsBnQBCJDxdKyXL4R96o3oiAAXa//m7nE9yfjNFoKTTpyIM1sZXmcxdE
	OHnWdbePWHyuueeXQx6t9ublK0ywkLheZpp/2bkCLSwIs9kXlVR8FbmOjAwHw26m7IAW11Ah1d0
	HGipI3de73WNC1sa18Qo4+kApq+EoSHS9lk/Xxzi1rtNYyg4Grl1wmhsVO8MwpDlfVjseKqnJEz
	nF/xtl2cGrKUvo/cJPHYwxAETBBBB0PhmWv41egeKqptRhYzUTuesg0hvU6dJuaLPuQrBaMeqIk
	L/lXDBwIMbKFiNQW/fLdQ==
X-Received: by 2002:a05:620a:294c:b0:93f:26f6:6bab with SMTP id af79cd13be357-93f29ccce99mr1849718785a.18.1792515811784;
        Tue, 20 Oct 2026 10:03:31 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6e030sm31479985a.1.2026.10.20.10.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:03:30 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/sun50i: Report TLB invalidation timeouts from iotlb_sync_map
Date: Tue, 20 Oct 2026 13:03:11 -0400
Message-ID: <20261020170324.1223144-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sun50i_iommu_iotlb_sync_map() invalidates the TLB and PTW cache entries
around a newly mapped range, as the IOMMU can otherwise keep using stale
entries for it (see commit e563cc0c787c ("iommu/sun50i: Implement
.iotlb_sync_map")). When an invalidation times out, it only prints a
warning and the callback still returns 0, so iommu_map() reports success
for a mapping that the IOMMU may not be using yet.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the result of the
invalidations, after still issuing all of them and restoring auto
gating. The page fault handler keeps ignoring it. The unmap path is not
changed, as .iotlb_sync() and .flush_iotlb_all() cannot report a
failure.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware; a timeout is not expected on working hardware.
Compile-tested only (ARCH=arm64 defconfig with SUN50I_IOMMU=y, W=1).

 drivers/iommu/sun50i-iommu.c | 42 ++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index be3f1ce696ba2..74ca3625ae25c 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -298,8 +298,8 @@ static void sun50i_table_flush(struct sun50i_iommu_domain *sun50i_domain,
 	dma_sync_single_for_device(iommu->dev, dma, size, DMA_TO_DEVICE);
 }
 
-static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
-				  unsigned long iova)
+static int sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
+				 unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -313,10 +313,12 @@ static void sun50i_iommu_zap_iova(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "TLB invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
-				       unsigned long iova)
+static int sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
+				      unsigned long iova)
 {
 	u32 reg;
 	int ret;
@@ -329,29 +331,36 @@ static void sun50i_iommu_zap_ptw_cache(struct sun50i_iommu *iommu,
 					reg, !reg, 1, 2000);
 	if (ret)
 		dev_warn(iommu->dev, "PTW cache invalidation timed out!\n");
+
+	return ret;
 }
 
-static void sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
-				   unsigned long iova, size_t size)
+static int sun50i_iommu_zap_range(struct sun50i_iommu *iommu,
+				  unsigned long iova, size_t size)
 {
+	int ret;
+
 	assert_spin_locked(&iommu->iommu_lock);
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, 0);
 
-	sun50i_iommu_zap_iova(iommu, iova);
-	sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE);
+	/* Issue all invalidations even if one of them times out. */
+	ret = sun50i_iommu_zap_iova(iommu, iova);
+	ret = sun50i_iommu_zap_iova(iommu, iova + SPAGE_SIZE) ?: ret;
 	if (size > SPAGE_SIZE) {
-		sun50i_iommu_zap_iova(iommu, iova + size);
-		sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE);
+		ret = sun50i_iommu_zap_iova(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_iova(iommu, iova + size + SPAGE_SIZE) ?: ret;
 	}
-	sun50i_iommu_zap_ptw_cache(iommu, iova);
-	sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M);
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova) ?: ret;
+	ret = sun50i_iommu_zap_ptw_cache(iommu, iova + SZ_1M) ?: ret;
 	if (size > SZ_1M) {
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size);
-		sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M);
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size) ?: ret;
+		ret = sun50i_iommu_zap_ptw_cache(iommu, iova + size + SZ_1M) ?: ret;
 	}
 
 	iommu_write(iommu, IOMMU_AUTO_GATING_REG, IOMMU_AUTO_GATING_ENABLE);
+
+	return ret;
 }
 
 static int sun50i_iommu_flush_all_tlb(struct sun50i_iommu *iommu)
@@ -409,12 +418,13 @@ static int sun50i_iommu_iotlb_sync_map(struct iommu_domain *domain,
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = sun50i_domain->iommu;
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&iommu->iommu_lock, flags);
-	sun50i_iommu_zap_range(iommu, iova, size);
+	ret = sun50i_iommu_zap_range(iommu, iova, size);
 	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void sun50i_iommu_iotlb_sync(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

