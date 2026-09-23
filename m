Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91B4519A7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149413; cv=none; b=LIg4TqAumxRSc4uVYa8ZBEoEWGAiQwWkT9i8X+ewaV6Ysd69OhPQfhQAGfdXa9I597o1kuIDJoh/pj7bTFosbGOvNwUbd8rrb/TgUGFlAwrNOmkAbueaW8E/RcDtYPHpOPrepZpU9kD2UjRNCS8W2KsiEepz945qmzHbxIMB2DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149413; c=relaxed/simple;
	bh=3ynPRFOw69zBjBhXGv5WUX93AMW2qHMo6hMQrCg0Zko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4RynaLgiAGSNH4gXAu/KIUivm9wHkNsokeSRvv/v91RCKhwGVoIfBmONFbYMV3tWrRb3p5u+F4jY0UpwEbE4bjRg2AntZZ7/CnzjzwIgIiPi4gaCXkUbBMwrTXYyaS8uxe8uaVA2pnnWzzvaGNcKmRHfh64GA9YipQl1Kik3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWqJQX5b; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWqJQX5b"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb3aea488so601915ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149409; x=1790754209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEwYnSIhHf9oeFrDmCKSYOnbIRlltkd0nAWN7h+lPkw=;
        b=GWqJQX5bqpgx4DZGBxAGlxY8sLNBaOojyG+3EkDon1uJ58xRR4QrW2fJBiGYaQVMS2
         QlCyOjAz1LSHZZUbAmGDch0xCCZ0WUTqFAb9cRyVNfazhVcR8jRlrKPUNSroEkXwuNDq
         GbT2vHlc2j+XMRnglpJ0aAN05H9g2K5ZZtJR9gG5vzdVUnFSkaP2gnrL1evYUN2K/ikQ
         W/AISyCYbmG28R9VrDE5ERJwIkk4qTDaozTJHP/Guo2nqOPp3F/YgnKbR8CkT9Ii9ena
         31nsrw5Q82rPXk3kSKZTw4f5vnHBOo/K1tR8TRpWh1Hz26lGn48WWNu6HNV7Hva5eV2e
         T2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149409; x=1790754209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEwYnSIhHf9oeFrDmCKSYOnbIRlltkd0nAWN7h+lPkw=;
        b=zwMLQv8dEeegPZHp72AkT1MCy1bVxZ/R12ik6zeylOPb0GYJDLmq4+2NDAWWkgSPbZ
         Yq5tRiuU0Z1AkgbQYy9Ma/gmExp4j6osjpZ7b99DRGalk87dh2BPvJxpGqra/oXZMoIu
         jlPbJXa6bgl74kwal6t3gCU5BvqQXaV+4mXejoNSmPYviSgWh5+sRlHNMjJAfK4tZtKZ
         uzBGYzEUSU9vKQ+FTJv0y74nrs9Lx7Uwghe+tZVn2bkXf0+nAbDyfUeF7jqCXQoP4wB2
         KJRJM7BQcpR+aixBGgX/Y4ConabB81hdxYlm1MkOJ1fp9IGgYEflUkYbe6kiZtem765v
         IQ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcMbGdURSgpr2NIThEGlmw+Ua1vmj2A6bNScIR7r7DS4p3D+K0xPRYoqWehJCd2qJL3V+Isz34oHB3t7o=@vger.kernel.org
X-Gm-Message-State: AFuF++k4862pllg+I6WqmPA8u23PPFK06BRWt+UbQm8mbAIX6kPhMdtY
	vDrWqR24TVXtwPpS8DkDIAcj6M98XCRmo+5oof0BiCalnsAtnq/3Wd9Y
X-Gm-Gg: AYBFou0JJo8uCbOMI6ei3P6DJ06r87IrdAvQopXTt7pL0n96c0GdBYntjQft1J6VzQF
	iJj/Wz8UfnFF4KB1hNPMhksgUCHber1upNPnho0OsoRIfEA/RVijspBgS51XMkHFDc5OyZnXuEQ
	ripKdZHOdO9J8yVucvi4o0B6V+P8MTwXi+Aum0vP1Y8ceft5ckpOBuYAQ4uFsCGddBWb78KnYe7
	HPGz37f8YDdAFS5h/lchipfs8Khm25aF3YjD9ePmhcCNO8kpClkix+2g+fPTyDQ3K//YkcJrlB+
	YtppaXK3TwS5e5RUNMZ3/BNLhRvG9PIoMoIccOgwCBzyRdpjFjwjo+5AeDSEDa0if4wCH/iTjaw
	IIw5rkpaiMeCjKo1uVXtD+jy1SrGsGwWB7Xa5a3tvh5mlH/6HzPN+TE1GJDpBkScq5SGqh13P7B
	b+1o3EjnAqMIG+MDiHvv11ZqDkk0wLr/3ccVYwPIfoi9KOnSZjJ51qvXYPE4aeMSfgL0GciuTv1
	EQsTap/06Rl56XBuuYtDPnF
X-Received: by 2002:a17:903:286:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2df69bec023mr25035305ad.0.1790149408727;
        Wed, 23 Sep 2026 00:43:28 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d9273sm6406785ad.50.2026.09.23.00.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:43:28 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [RFC PATCH v1 2/2] drm/msm: reject dma-buf imports without struct page info
Date: Wed, 23 Sep 2026 15:42:23 +0800
Message-ID: <20260923074256.9357-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923074256.9357-1-liujianfeng1994@gmail.com>
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

msm_gem_import() fills the GEM object's page array with the deprecated
drm_prime_sg_to_page_array() and stores the attachment sg_table for
later mapping into the GPU's own pagetables via iommu_map_sgtable().
Both need the struct page of the sg_table:

 - iommu_map_sg() maps sg_phys() of each entry, and
 - drm_prime_sg_to_page_array() iterates with for_each_sgtable_page,
   which walks sg->length.

When CONFIG_DMABUF_DEBUG=y, dma_buf_map_attachment() hands importers
a copy of the sg_table with the page pointers stripped and sg->length
zeroed.  In that case drm_prime_sg_to_page_array() "succeeds" while
filling zero entries, leaving msm_obj->pages uninitialized garbage
(kvmalloc_objs() does not zero).  The buffer is imported anyway, and
the first VM_BIND map of it fails asynchronously in the scheduler job
run - after userspace has already enqueued GPU work referencing the
mapping.  Userspace then observes arm-smmu translation faults from
UCHE, e.g. hardware video decode in clapper/chromium:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

Replace the deprecated helper with an explicit loop so that a missing
or short page list is detected at import time and rejected with
-EINVAL.  This turns the silent memory corruption into a clean import
error, letting userspace fall back instead of crashing the GPU.

Note that msm fundamentally cannot map a page-less sg_table into its
per-process GPU pagetables (it needs the physical addresses), so
imports of such buffers can never work until msm is converted to
build its GPU mappings from the attachment's DMA addresses.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>

---

 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81b..0d5a91181d05b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1307,7 +1307,8 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	struct dma_buf *dmabuf = attach->dmabuf;
-	size_t size, npages;
+	struct sg_page_iter piter;
+	size_t size, npages, filled = 0;
 	int ret;
 
 	size = PAGE_ALIGN(dmabuf->size);
@@ -1333,8 +1334,32 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		goto fail;
 	}
 
-	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
-	if (ret) {
+	/*
+	 * Fill the page array ourselves instead of using the deprecated
+	 * drm_prime_sg_to_page_array(), so that we can detect sg_tables
+	 * that carry no struct page at all.  Those must be rejected:
+	 * msm maps imported buffers into the GPU's own pagetables with
+	 * iommu_map_sgtable(), which needs the physical pages, so an
+	 * import without page information could never be mapped.  The
+	 * most prominent case is the page-stripping sg_table wrapper that
+	 * dma_buf_map_attachment() hands out when CONFIG_DMABUF_DEBUG=y.
+	 *
+	 * drm_prime_sg_to_page_array() would "succeed" with zero entries
+	 * filled in that case and leave msm_obj->pages uninitialized,
+	 * which later blows up as arm-smmu translation faults from UCHE.
+	 */
+	for_each_sgtable_page(sgt, &piter, 0) {
+		if (WARN_ON(filled >= npages)) {
+			ret = -EINVAL;
+			goto fail;
+		}
+		msm_obj->pages[filled++] = sg_page_iter_page(&piter);
+	}
+	if (filled != npages) {
+		DRM_DEV_ERROR(dev->dev,
+			      "import of dmabuf from '%s' rejected: sg_table has no/misaligned struct page info\n",
+			      dmabuf->exp_name ?: "?");
+		ret = -EINVAL;
 		goto fail;
 	}
 
-- 
2.47.3

