Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990B53B345
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121536; cv=none; b=GFWqdbM7w58bAy2RJcHmVKsojAt4HnVHwh7d3/CKKMevRv6VnVN0DdBnQ6GuczVBn4BQVppMNBFeiQx57grgkve0HbjxwiEKgCmczz7vevgDKacaoE5NwVYCMDLDtfjbIdj+za0ZCk8yjLM5SUNqmHStVSu0PBIyBk4ASlLp8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121536; c=relaxed/simple;
	bh=4tfxaowEwyLcwym1ubVvN+8S1jtOYuzn6GPPLRK9Vaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idDHIOo8g/Zflkoqy4G24E9xRWSqGIzqnEzlx43auKKhFKRPukXXyl3Pm+Jpio+A1sdw0l9xb0TDcX4MGzgKTYLuku8jBnx0mpq6hz+DmqFhKib7BEoabl7wFH7H0jERlyj6VJW3G2617Uv6noR8fwb+zcRzdg62ciLhnJ1tNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PLnFCRyG; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PLnFCRyG"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so4354461cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121530; x=1790726330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3xhM/OIBt/SuFbuoCQCsVkZeh3BpJl7fkoqP+MrWAM=;
        b=PLnFCRyG9XwSahqQaJvq0Fu5ThIzedEFNpa+UfG2Fw7NAJH7p9BJSOpShVDtFNPcr2
         BloihYSiRgceklrQsI2tRTTre+lky/GxWZVqCoIAaelx/YllZkk4o2NCerlzqW/WuERA
         uLcWdNMqwe5iGZMb7dUOrgn6CTcBSZVMeAwkImYOTiD9linvBba2Xze1C18omyWYo5jb
         m5ueaGqyI3gdE++U/lHQqf4KJcQCFmYHa8WS7Jl3g+FMTvjZvOR52lPd7LglYdmnF6gI
         maiHjTOMzyZSW8YOlG9nHr2BKYahUzEh1VaE6Y2RTF4F1Nd9c1aebWcjQXlgGv00b+4U
         s4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121530; x=1790726330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3xhM/OIBt/SuFbuoCQCsVkZeh3BpJl7fkoqP+MrWAM=;
        b=kLAdXhRH5ilQhN3JWKWw9Dpy2mXOQYg3vJ9WjMKxTCIhCrkE6dA11F7capkJEDVtHa
         L/xeEkx7pz+XxNzuseuW9c70IcPhAoOotvYxnGMjABqYyHuJjtkW9XDngqGkdTGhq3jM
         7/NlOFBG61y8exC4SH+wPBP3BWebxVsg0GDfC+Bee5oZUUiqZPoG80mY8bLe+RHknajy
         sauy7nbwSaCNtRr3g96M+qRitk3JACsVHIyULYkEBPNsrI9XFTB07LRofYdUR5lVJXS2
         cnA7MN1eS0IO1ml5DDEdholYD2QDna2wRmj7vQDL/2tqPcPtlwEqm8FtmFgBY7K05a+g
         NbIg==
X-Gm-Message-State: AFuF++mCnqHX/Woy+vYwMlLyNX7++ySQ67W35oKfgohnc9govCxu0fkJ
	JLDzACx5SdULETYJvF5CBIuBm6IXNNXpf/gB1ak0/gva46mF07/bGcu1uaeF9NVaiTg=
X-Gm-Gg: AYBFou29gciLQhMI2JOacMj1TP+ZWUHBDP3jmf7/TXhczOZopZ294YcQzOc6Uz/o7z8
	jSDPs9p+HMpWxMrgJ9HiTq7wAlaex4C7hsrNpi17nskuDg6UFoSPUKnMDbS/mf0IBFsWQhNuBmA
	Wt07suW4fOhUPg6npHY9o2vaFFGSnEvMNDEw9N0Lcs+FYRtcoJqXKJk8wjCHSxrSYkQGfuypYKQ
	8fV/ZkD7V1iKUkqSg27n4U91RvH1FokEgF58rd1vTjg8dYIoWwmDkwoD7whXKIAvJ6+WLw3v4wk
	jraHqhjdXc7FjCvf4VESG1cX//1e0r/hYrsE5ZRn347BjqxfbqIWLTJW0EZ+YAQi+K9+lTn6ZmC
	lKgabrzRRtcW/t1jopyWSBUyIsaoHbJsH/HL0t162G8jnbOChgIkOqI6KrI+gCAxVl03i98sAfZ
	BcufoBm7K9ysz5IxfjXsF65AkB3F7eeProrbrzYQQdwYExBfB8xi4uxCDcok3zmmCL1sqaaN0nr
	Iq5w0yKZogWjb3ubQVqrfZGWA5jsku795dGu+uzurYnUiiTye8CD02HSBziEe8LGcXLTfI=
X-Received: by 2002:a05:622a:411a:b0:52f:f73c:3269 with SMTP id d75a77b69052e-532ead1e0c5mr18771951cf.36.1790121530629;
        Tue, 22 Sep 2026 16:58:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:50 -0700 (PDT)
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
Subject: [PATCH 09/10] mm/madvise: make cold and pageout PTE lock ownership explicit
Date: Tue, 22 Sep 2026 19:58:29 -0400
Message-ID: <20260922235830.2350770-10-gourry@gourry.net>
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

The PMD callback still maps and unmaps the PTE table, drives split retries
and handles rescheduling after dispatching huge PMDs. This leaves PTE lock
ownership mixed with the page-walk callback.

Move that lifecycle into madvise_lru_pte_range(). Its outer loop drops the
lock before splitting or yielding and resumes at the current address,
leaving the PMD callback to select the huge-PMD or PTE path.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 94 ++++++++++++++++++++++++++--------------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index e3c3acfcd9b66..88a4a03dee04c 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -553,66 +553,66 @@ madvise_lru_pte_range_locked(pte_t *pte, unsigned long *addr,
 	return NULL;
 }
 
-static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
-		unsigned long end, struct mm_walk *walk)
+static void madvise_lru_pte_range(pmd_t *pmd, unsigned long addr,
+		unsigned long end, struct mm_walk *walk,
+		bool pageout_anon_only)
 {
-	struct madvise_walk_private *private = walk->private;
-	struct mmu_gather *tlb = private->tlb;
-	bool pageout = private->pageout;
-	struct mm_struct *mm = tlb->mm;
-	struct vm_area_struct *vma = walk->vma;
+	const struct madvise_walk_private *private = walk->private;
+	struct mm_struct *mm = private->tlb->mm;
+	LIST_HEAD(folio_list);
 	pte_t *start_pte, *pte;
 	spinlock_t *ptl;
-	struct folio *folio = NULL;
-	LIST_HEAD(folio_list);
+	struct folio *folio;
 	unsigned int batch_count = 0;
-	bool pageout_anon_only;
 	int nr;
 
-	if (fatal_signal_pending(current))
-		return -EINTR;
-	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
-				       !can_do_file_pageout(vma);
+	tlb_change_page_size(private->tlb, PAGE_SIZE);
+	while (addr < end) {
+		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (!start_pte)
+			break;
+		pte = start_pte;
+		flush_tlb_batched_pending(mm);
+		lazy_mmu_mode_enable();
+		folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
+				&folio_list, pageout_anon_only, &nr, &batch_count);
 
-	if (pmd_trans_huge(*pmd) &&
-	    madvise_lru_huge_pmd(pmd, addr, end, walk, pageout_anon_only))
-		return 0;
-	tlb_change_page_size(tlb, PAGE_SIZE);
-restart:
-	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
-	if (!start_pte)
-		goto out;
-	flush_tlb_batched_pending(mm);
-	lazy_mmu_mode_enable();
-	folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
-			&folio_list, pageout_anon_only, &nr, &batch_count);
-	if (!folio && addr < end) {
 		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
-		cond_resched();
-		goto restart;
-	}
-	if (!folio)
-		goto out;
 
-	lazy_mmu_mode_disable();
-	pte_unmap_unlock(start_pte, ptl);
-	start_pte = NULL;
-	if (!split_folio(folio))
-		nr = 0;
-	folio_unlock(folio);
-	folio_put(folio);
-	addr += nr * PAGE_SIZE;
-	goto restart;
-
-out:
-	if (start_pte) {
-		lazy_mmu_mode_disable();
-		pte_unmap_unlock(start_pte, ptl);
+		if (!folio && addr < end) {
+			cond_resched();
+			continue;
+		}
+		if (folio) {
+			if (!split_folio(folio))
+				nr = 0;
+			folio_unlock(folio);
+			folio_put(folio);
+			addr += nr * PAGE_SIZE;
+		}
 	}
-	if (pageout)
+	if (private->pageout)
 		reclaim_pages(&folio_list);
 	cond_resched();
+}
+
+static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	bool pageout_anon_only;
+
+	if (fatal_signal_pending(current))
+		return -EINTR;
+	pageout_anon_only = private->pageout && !vma_is_anonymous(vma) &&
+			    !can_do_file_pageout(vma);
+
+	if (pmd_trans_huge(*pmd) &&
+	    madvise_lru_huge_pmd(pmd, addr, next, walk, pageout_anon_only))
+		return 0;
+	madvise_lru_pte_range(pmd, addr, next, walk, pageout_anon_only);
 
 	return 0;
 }
-- 
2.53.0-Meta

