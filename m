Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719FB3AFAE6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895759; cv=none; b=Jrp8VXB9MUAMlpugL5s606ltGa8QRguevCkCM/nRDbGHIDwjwtnMOmjunpGu2bsucztyVuUVvvZqqqxx41xZPpRoGn3+bYZ4lYTBOldTLU/+SDiXP1TbKM/tDsCIHVmOD+ximbqI3noWcw+g7adshslPZ+Z+blgu/2zNfEWsdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895759; c=relaxed/simple;
	bh=0jQt3q4Z0Q3P0sK3akDGkCdE9MUuzQyf/05QS2hrvfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MYrAiUmhiS3d6R5gGTELuzkUimB7ptaoV8ZX3nUVPK3W3zuWdvnvlee8bFTUNZF9zTjPRk4UbKvH0Z1JYNcdwLYxeKlKZaA12w0qM+WukJvHTqhPi8Vnb5Xk6Uf4PXedyTpLkYwFIn3cw/AbEAC4vurIllWw57vGl7LHsCt7H/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H1POU4gl; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H1POU4gl"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso11247971a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790895755; x=1791500555; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8Tzv848Pm5Gww4Q9gyMfGArUUtsY1KzJi65qPBcWZI=;
        b=H1POU4glQENADGE+nhRaiWs63zalrgjS2KPiEe94M5N2GlZTdEyLkzEejFJUT2qH3Y
         HqeA2F9YeG4hmMK0Z1pHtNbdZIUYsQUrNGiZiUzZWwI2iSwjGqAhmAu3DA6Pw2B/MquD
         1QcrXkM7RWB6DocoZKIaTMqJ3KydsuLcd2nmHYWqqyQMayzU55x1g2Vdb82jKRwLmtdJ
         z4nZd5488hgmptdN0PzP+ylyig/tvxrH6QcS9vJhPegfluDvL6VX1ZBfqAWIMQLub7OO
         4WjtrNMFaFd5K1rySNkLb23WTOQwstX8ZRN0ewFWjJ+yjvnEXIoLlvGgOmpJtKcILeOg
         emSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895755; x=1791500555;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a8Tzv848Pm5Gww4Q9gyMfGArUUtsY1KzJi65qPBcWZI=;
        b=tZRn++cKyohVEJH+V9hHoiba3Aa4VpUQgBCYivaa06VH+2382xEj0r+5R0Rbr5p9Te
         XIyQ2M/QvnlXnMdGbbwpB0mgF9pmWAbH27/l1yylY5lZl/G6oOp8jkrf/Of+eIg2LAnJ
         7TgFYIudCwOGKpikmnn8C+fQKjPc/NYTY8AJxFgQPWdvzt4RBuST3QHeWJbJPHhKlPVC
         hxbGQdRE3/SSxakktQXRnYJ0bOLmPHRNtLTVh78scmaVlfotNrm7weeTudghekEbVTY3
         0piz4O/PJ0Ecg7hPoW3D0fMGilfJ0Hp5znZOVy4BMB0LkUuYZfDr5Vp3h5DyYILrXd1q
         mhJA==
X-Forwarded-Encrypted: i=1; AKwUvBza6odOjH98JE2sVh1OX5xClD4FHidBEzEvshodGJqIKquWRITeahId9eAr1QNJIESk5oSQ7b4wsKrfENk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPtacdGN7JbQebh/8vPsljZ031AR/NwqxNQHb70gJfBBKummlH
	eZHKngzgqPBecqm1vIniJn5dB5bpOZw8w38uRCn7IJGpEge0qyWftO2ikx2YSH9FjdwCpgjjKc3
	rKQ==
X-Received: from pgav22.prod.google.com ([2002:a05:6a02:2dd6:b0:cc9:f7f0:57ca])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33cc:b0:3a0:f2c8:9ad6
 with SMTP id 98e67ed59e1d1-3a6ce9a677fmr808338a91.64.1790895755297; Thu, 01
 Oct 2026 16:02:35 -0700 (PDT)
Date: Thu,  1 Oct 2026 23:02:19 +0000
In-Reply-To: <20261001230219.818128-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001230219.818128-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001230219.818128-6-praan@google.com>
Subject: [RFC PATCH 5/5] iommupt: Return real page count to the shrinker core
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Logan Odell <loganodell@google.com>, iommu@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Update the count op to return real nr_pages that can be reclaimed.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/generic_pt/iommu_pt.h | 1 +
 drivers/iommu/generic_pt/shrinker.c | 9 ++++-----
 include/linux/generic_pt/iommu.h    | 5 +++++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index e5ee419f2f0b..4386caf3f713 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -1115,6 +1115,7 @@ static __maybe_unused int __unmap_range(struct pt_range *range, void *arg,
 
 				xa_store(&iommu->domain.reclaim_list, range->va,
 					 virt_to_ioptdesc(pts.table), GFP_ATOMIC);
+				atomic_long_inc(&iommu->nr_reclaimable);
 			}
 
 			gather_add_leaf(&unmap->pending, &pts);
diff --git a/drivers/iommu/generic_pt/shrinker.c b/drivers/iommu/generic_pt/shrinker.c
index 66169fb5db71..a27e171b5e80 100644
--- a/drivers/iommu/generic_pt/shrinker.c
+++ b/drivers/iommu/generic_pt/shrinker.c
@@ -43,11 +43,7 @@ static unsigned long generic_pt_shrinker_count(struct shrinker *shrink,
 
 	mutex_lock(&generic_pt_domains_list_lock);
 	list_for_each_entry(iommu, &generic_pt_domains_list, shrinker_list) {
-		struct iommu_domain *domain = &iommu->domain;
-
-		/* TODO: Return real nr_pages here! */
-		if (!xa_empty(&domain->reclaim_list))
-			count += 1;
+		count += atomic_long_read(&iommu->nr_reclaimable);
 	}
 	mutex_unlock(&generic_pt_domains_list_lock);
 
@@ -78,15 +74,18 @@ static unsigned long generic_pt_shrinker_scan(struct shrinker *shrink,
 				if (iommu->ops->sever_branch(iommu, iova, virt_to_phys(virt))) {
 					/* Successfully severed, queue for freeing */
 					xa_erase(&domain->reclaim_list, iova);
+					atomic_long_dec(&iommu->nr_reclaimable);
 					iommu_pages_list_add(&free_list, virt);
 					freed_count++;
 				} else {
 					/* We raced with map, abort pruning */
 					xa_erase(&domain->reclaim_list, iova);
+					atomic_long_dec(&iommu->nr_reclaimable);
 				}
 			} else {
 				/* Not empty anymore, remove from list */
 				xa_erase(&domain->reclaim_list, iova);
+				atomic_long_dec(&iommu->nr_reclaimable);
 			}
 		}
 
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index 95bf9d4f0b6e..3c94745bded0 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -69,6 +69,11 @@ struct pt_iommu {
 	 * @shrinker_list: Node for the generic_pt global shrinker list
 	 */
 	struct list_head shrinker_list;
+
+	/**
+	 * @nr_reclaimable: Count of empty directories waiting in reclaim_list
+	 */
+	atomic_long_t nr_reclaimable;
 };
 
 extern struct srcu_struct generic_pt_srcu;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

