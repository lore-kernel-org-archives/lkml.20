Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C061535FC3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121537; cv=none; b=P+Oj5HR6MgNh06Eyyoq9yYBKJZjSZKMso+q/YuaDQGZKMJ/9v2TVXi5nCabw1BFn1DnhmgGeeiEB8Ac3ShvlqXIKOGFWCD1qFiqCGB9xgkdd6APhO/upd4tyMif2dj61JzZ0uVh1C63yu/yu55bRiLk9cY8zpNKEjBB0juL7uWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121537; c=relaxed/simple;
	bh=CXRsgxYB/5yutOnrrQ4y8UUCmA9/hvuTy++ixQDxir4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSxhv3X/PgRoJq3d/7WmvsaLR/7mzpaS5bjNmb9pLawxtouqWY6t6leKPES5mlV/qFhUWuLVPVooBblJQhLNgyqsaHXSfw6A0DicYzrTcy5mfV4u3v3U30em+3Hi26Fy9CLoxbzXy2Hlk31XjwEWFh2ZrQY+eE9lxqj5p15GGxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j1dHDMeR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j1dHDMeR"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d0d5ae11so4682801cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121532; x=1790726332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndNxVkCk5WMhyvlnx4WQtybJ1XuSLrgG5RrCZvpyS/4=;
        b=j1dHDMeRzTL7SoTAwFc6Z9lbnP0//XP+NF4ttqyc7E5YzHOMhWoid90cUvnRdtneqY
         HfrqDs4aYGdO6fZevuovqeLK1IuYLvocXBYZaX4k0MmgOhPLFKMbupb2j6UKrAUGdVo3
         L1jf2rWH0DjWWNUWWV2EJyp5bZrVqo1OZWV7obFgGTcC4how8zP/5t0D7Nz1AvDsa1cZ
         qeWDV++W+h6WBGaHSb0C7OIjQByHEXjBHyljQErpR8/VYAxRGw1b51RqdF9mfoZsoSLG
         XkIGVKWgyJyrJkPquky1oMN41rThNkD3Xp0Wz0I+hacXrzy04lvYTXwduiIdvxiLroSb
         fdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121532; x=1790726332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndNxVkCk5WMhyvlnx4WQtybJ1XuSLrgG5RrCZvpyS/4=;
        b=ZUzeo2KxG6Bz+tZkQNXHsPOhESb5/+GLD64SnTDT2MZCxHEu+YB925FYydsETHlN4r
         EP22ICi8HSh5mAaCLMvFcSz6BUD5pUEjKUA5Xk/uFWunJXu3c3vQYTqgjtD8CKhoG1an
         FN6Kz/o9T1gK7BXRD6jK5m1/rTJhlrUOl8a4SXseBbiJQrlJDS25yNqwk5+l4hakT7T3
         z7AMwTcvJHiBq6YDlxHxhTawsjbQOEpn3YqS9WHqJ0QWCWKWj4znDRr7Abjwrz8MOfZb
         oZ2vvZeBDDxnulZx2+vzkmczdogP4e+WAL8e1h/z0qTKVDblMCRwJnkwbcNcB5dz7wLx
         tyPw==
X-Gm-Message-State: AFuF++ldaZ6bniiLIKunE8pwdvMWC42Cl82zTOWxudeZp8HXuxYx8Q3M
	zBGRF7SqQ874smhA5xbQoFhMg/8ictIvdbY6YWvqBDxkaNvSbl3u5NMg8dpIiDe2mZE=
X-Gm-Gg: AYBFou1DcGyBfrEiVkEOBcRxBxOlB8duDfDOxSc0rnxFujonWdyPPh/dLTU+/C33KP5
	1lUiXy6syQzHCjCWsxZjIQPP88Ao4SSmD1n/jn6vDLwTtmhiPtsRs1rWFlVM4utuwt3g3gxYjb8
	oqNotUaKN4TrRAXg09363O/iu+BNutc3TVlP+O8uiN9H993y7SPmtGDr7FntriEk0ISbydmMfKa
	MST7SME8dtxUJWlcTAXzonJ9X69a+EQCviHuZoMgDi2gpLW4E4WSKxowi6YkA2yqPvcyHtFUDWS
	TKaoyL7Ln1YgfHnEAlZ2N4WrkojqjZTZAwCz0wXtoeYOv6Woghmorad4qs4G3No1wUCwHHF+Tjl
	5N+jb42fTtz+YV/35c/h9MYn8T18oA80h73QJ+Ey7HxqSQnu3pirL6gakGYKBWQtyl2h8+C8xl2
	eRyunvbW8WkzwniO+LpWxtrUqmIRYKAMP/88xiZK2cwA2mnHT4H+bJsnBEk1Z4SfjeOT8szXMAQ
	kFiTFcHCYlPxUCN/RSfOek933RbkedpA1ROJmnSG9arTcB0+tZCLyoeiZ2C
X-Received: by 2002:a05:622a:1e06:b0:532:9ade:b6ef with SMTP id d75a77b69052e-532eadc3523mr18790541cf.69.1790121532255;
        Tue, 22 Sep 2026 16:58:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 10/10] mm/madvise: share cold and pageout walk setup
Date: Tue, 22 Sep 2026 19:58:30 -0400
Message-ID: <20260922235830.2350770-11-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MADV_COLD and MADV_PAGEOUT entry points duplicate the TLB and page-walk
setup while initializing equivalent private state.

Use one madvise_lru_vma_range() helper for the shared TLB lifecycle. Keep
operation-specific validation and policy in the two entry points.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 49 +++++++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 88a4a03dee04c..37e3d3a205a76 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -622,21 +622,19 @@ static const struct mm_walk_ops cold_walk_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-static void madvise_cold_page_range(struct mmu_gather *tlb,
-		struct madvise_behavior *madv_behavior)
-
+static void
+madvise_lru_vma_range(struct madvise_behavior *madv_behavior,
+		struct madvise_walk_private *walk_private)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
-	struct madvise_walk_private walk_private = {
-		.pageout = false,
-		.tlb = tlb,
-	};
 
-	tlb_start_vma(tlb, vma);
+	tlb_gather_mmu(walk_private->tlb, madv_behavior->mm);
+	tlb_start_vma(walk_private->tlb, vma);
 	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			&walk_private);
-	tlb_end_vma(tlb, vma);
+			    walk_private);
+	tlb_end_vma(walk_private->tlb, vma);
+	tlb_finish_mmu(walk_private->tlb);
 }
 
 static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
@@ -647,39 +645,28 @@ static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 static long madvise_cold(struct madvise_behavior *madv_behavior)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
-	struct mmu_gather tlb;
+	struct madvise_walk_private walk_private = {
+		.tlb = madv_behavior->tlb,
+		.pageout = false,
+	};
 
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_cold_page_range(&tlb, madv_behavior);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, &walk_private);
 
 	return 0;
 }
 
-static void madvise_pageout_page_range(struct mmu_gather *tlb,
-		struct vm_area_struct *vma,
-		struct madvise_behavior_range *range)
+static long madvise_pageout(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_walk_private walk_private = {
+		.tlb = madv_behavior->tlb,
 		.pageout = true,
-		.tlb = tlb,
 	};
 
-	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			    &walk_private);
-	tlb_end_vma(tlb, vma);
-}
-
-static long madvise_pageout(struct madvise_behavior *madv_behavior)
-{
-	struct mmu_gather tlb;
-	struct vm_area_struct *vma = madv_behavior->vma;
-
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -694,9 +681,7 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 		return 0;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_pageout_page_range(&tlb, vma, &madv_behavior->range);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, &walk_private);
 
 	return 0;
 }
-- 
2.53.0-Meta

