Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49F56C64E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002646; cv=none; b=a45QMrj2oCjxyWIwm5EFs1oznLVSQmvoKf2jN8QxVpngYXDbb+z28snssv/iZmU4rj+lI+bx3ngnNVakKf56bHH2MSzvVb/UvTW7YzeurHZBdysIHIJUXz7vdMdJnhnszq1OCHonQBN5zCeaxHObr2ZFkZaHrWhNsKsJTAxQrnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002646; c=relaxed/simple;
	bh=+FE8bndYcmaIs/JKxn2Sau5uH/cgn+GtkHp3S1pwk0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJioTFyD/+kFybcbUo4HgvQ9/PsDP2erdWSy0SFKmeGFX2rT67f1vrAZ0OyuPAwSQam+3ZC9bK0q+ZmfnsXhO1IzCVquUC12L80yHyZiqpMRDuOsWTkhscVUlqIeCbYKmtx/3+yObOBhdMWCX2r/MShPY9yhuOgL8s5FJzB7ztM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UlyO7yIS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UlyO7yIS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ba702cceaso7797306d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002643; x=1792607443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z27Ij9K379BsUAXeMo35PAyhHA0HasTqw8AxKpcrJV4=;
        b=UlyO7yIS+w2tVam5T2O3NlmbvfcyavkVb/uQlnRsDNt+4IsLcD1NbnX92ddLpo1jhf
         VUfE/tB1GlDe+SjpBDCAD0uvCx+8397XVmKTf4IMAXW37ezsgbvA8/OmWt1YwzHPGQJY
         s1/2Qv7Qzkj62fbjtAMiP6Z8Wj5phqydFotZOgUXcrsS3RLBfOSoi3jMK2PQfD+ib/7a
         WJEEy14KvP/Rce/8IQ0nX0O+u7JMoS5jpuFqPxawLAYHRzqL4S4QNjQxRSN14j0KbWQ8
         tbVwmgEBbixM52HNfz6wzyHGKWLJefgaX9EGa3n0gu1XbMqZRFHu3SYgym6arCbN8A2R
         9wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002643; x=1792607443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z27Ij9K379BsUAXeMo35PAyhHA0HasTqw8AxKpcrJV4=;
        b=rvVJU+jEud3xqUqS1VuqjbYJhoMqCCNp6YK7o6NDwf0MyulV7Wo6Zsm+Grp3ix5neG
         YIlyi3NWV0unIN/emVbzIYvvk2SjD9A/vqFbCmbb5d0zLvkve1MKPC+Ivgyi1XC5Ek02
         ZWXsAgvMs42JZnEs2W4xk+7+1kaVvK78xdmSCZ/Pvp+IejqjeLiV1sCIFVjA+sR3dh70
         8dmvLYk9JlL7WtrBVmxM6SlWBx+IzDPIqnOhYJ2Vy5BrL0N3xSqPf8uFYO/cBcXQcpjf
         NZJOQ8y/MXnpcOjtZe3UqQFPKT65xTu6c1lAvJ8Ln0BoEPChjInzmQduvqD2YgBD7tYN
         LN4A==
X-Gm-Message-State: AFq9FYKyh6qR2TyDwbrRFisDY9rnQkOg14WfgV1egW8CvbV5ezS9VojO
	qgV+U+xL1nH6AQWV9X1xNWbMLWxuYUsgsfQBabHo189HoeteQhP41VK//VJbygq9+lcUwwlm3VY
	b3k0ASw8=
X-Gm-Gg: AYBFou0+vEJmNBHFI090ZmBXDpTfcp4mS/7IjM1pqbbc5W2kXmoknQxeazLfsFEjzHc
	AOPosKVSS7zIf69CdDHOOXkL2tGoJJUEQhZyekbg6Hsa6anugEEkD3n5XnhYVyybAjrfooBYjS+
	o05pAntBj2Q7ehFeCn2Nny8ANONJt9cP71cj/z4AsYraWfg3bGofYwoKdxaU2yz5g5vGSiJ+FBE
	YHymvlGe6Erq3YUEp/JGu9rY2QlaC8oaKtOQAsDDI+8qXSV0/GXMSfXQRgRNyLtC/h+H3UlaVpf
	TV58f3klMbSU4jgsNDS+JqYax6Y+pZPwaAeWyZ4j1dFj/ON308gCJhdpo33XUbGkXkNB0ifZtNY
	sWfmrz6JA86E4WCfYUj2osctAGDVPAt8YtLz7EjT0tfnBgIDAl2OxyJ+wXDAK4NRebZ2WiqgJ4X
	Lz9fjpDIMWSY1LIgcq19clhYeE78elsf9AM30Y2aNi0IpOg+QHAKzxpOVsX4arM+qFkMLCCfdgd
	fDk952+o1O03SpfYZo4MlT0JpHD9LD/beMqK2wzIFmSS9j5Vq6CigUVNWPt
X-Received: by 2002:a05:620a:270d:b0:93e:7939:43f0 with SMTP id af79cd13be357-93ebd247f8dmr2807496785a.32.1792002642732;
        Wed, 14 Oct 2026 11:30:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:42 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 09/10] mm/madvise: make cold and pageout PTE lock ownership explicit
Date: Wed, 14 Oct 2026 14:30:23 -0400
Message-ID: <20261014183024.2075709-10-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014183024.2075709-1-gourry@gourry.net>
References: <20261014183024.2075709-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_lru_pmd_entry() maps and unmaps the PTE table through a
restart label and an out label, so finding where the PTE lock is
held means following every goto.

Move the PTE path into madvise_lru_pte_range(), whose loop takes
the lock at the top of each pass and drops it before splitting or
rescheduling.

madvise_lru_pmd_entry() now only checks for a fatal signal, computes
the anon-only filter and dispatches to the huge-PMD or PTE path.

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 91 +++++++++++++++++++++++++---------------------------
 1 file changed, 44 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 3ebc14d30e0b..acfe5b945eea 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -592,64 +592,61 @@ static struct folio *madvise_lru_pte_range_locked(pte_t *pte,
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
-	pte_t *start_pte, *pte;
-	spinlock_t *ptl;
-	struct folio *folio = NULL;
+	const struct madvise_walk_private *private = walk->private;
+	struct mm_struct *mm = private->tlb->mm;
 	LIST_HEAD(folio_list);
 	unsigned int batch_count = 0;
-	bool pageout_anon_only;
+	struct folio *folio;
+	pte_t *start_pte;
+	spinlock_t *ptl;
 	int nr;
 
-	if (fatal_signal_pending(current))
-		return -EINTR;
-	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
-			    !can_do_file_pageout(vma);
-
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
+	tlb_change_page_size(private->tlb, PAGE_SIZE);
+	while (addr < end) {
+		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (!start_pte)
+			break;
+		flush_tlb_batched_pending(mm);
+		lazy_mmu_mode_enable();
+		folio = madvise_lru_pte_range_locked(start_pte, &addr, end,
+				walk, &folio_list, pageout_anon_only, &nr,
+				&batch_count);
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
-	if (!madvise_lru_split_folio(folio))
-		nr = 0;
-	addr += nr * PAGE_SIZE;
-	goto restart;
-
-out:
-	if (start_pte) {
-		lazy_mmu_mode_disable();
-		pte_unmap_unlock(start_pte, ptl);
+		if (folio) {
+			if (!madvise_lru_split_folio(folio))
+				nr = 0;
+			addr += nr * PAGE_SIZE;
+		} else if (addr < end) {
+			cond_resched();
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
2.56.0

