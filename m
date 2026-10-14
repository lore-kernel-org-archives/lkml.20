Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A2565112
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002642; cv=none; b=kfq88mUMKc1A823guCTj/fD2NkemkWV7rms9LQMKKFl21LnoUbT1uduFZHuiFBYhW/bGOIYCBnMrqdNEhqc1iAV/zI8UAVqZNb0ix0OvSFfT8eEfML2C4kC7ZlzUyI2O92LWhcyfmzPnJUBu8yRfjYY4Q/CYjBNyiGIMhpppUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002642; c=relaxed/simple;
	bh=JQc3liNbJkS6D9jh3fTfhJUbZklXqQ3ECDvw6JcNln0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1znG3zXetxgEG+plQsL6cIK+kw6K6NALxvFA4EbGkoKlkmnGQ/sccbRojbBUzp0KBJxfwwayOxlvkw4HhCmruCMkR334k/BiT09jYVSzUoOS5ITlnZCdesQRhF6JBhvhG9LDEzcSVwkaSBhv798JxcmlbO8gm81UVjX/xwX6s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D0vj2vQ/; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D0vj2vQ/"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e635220b9so314756385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002638; x=1792607438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oviJZuz7wJ3+WoQ9W/TGlT7rNjNMCITRK6EOVD5+7G0=;
        b=D0vj2vQ/ZXSHBan1ouWQRDFOHrOXy2vQxvPm5BO1YPgipFpBoGXdAoItfNKIZZyxaI
         Ag0QQyZ9jVtijPe3HEP/hrW4pjvpnvDfKKt+dfby1DFwNwWSKTRbUSWQXEH+sTwCdEhw
         2cCSdaOmJ1zGmM8OeGWbGQWdDQL0meEyQt+Xb6rw6gt4l6H6o4VSBc2Zibbzv/MoP8MQ
         ZAM9YaW6rV7WAjUa32sUsvoOUoUhYZtKwsqdd6tA5Q5aau1wQGrxYewhuGoBxvYseivA
         xJSASRoHDaOO5B6Zs9pQibzx9+YtVdxHU+EdXtoMrVEYZFMI48v9ls6uJNvXmUUt+wdH
         wYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002638; x=1792607438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oviJZuz7wJ3+WoQ9W/TGlT7rNjNMCITRK6EOVD5+7G0=;
        b=wd1gLP/m9n5jTaRK1vunUqEnY9b/mNU6favm+wAGe4ULQT5LXV/QQCDAGjpSv5Z823
         wMzG+N8HGlMtqSx9CK6ZpkGmlBp3ZqCNBp1foluWDxY4wMAQzEb7xweymrTwXpQQi4mO
         Py82hvKlGjQYGoEVEnrEfRMjGDi7/D0XfRO6PAqoanHXvw+4PIXtdlM2asAKeYeeUvsj
         N47h+SKW/Ocibf3qPz6UyA1lP7wZ6vOmRpr2k0liBFJ1xrH1iaWMIJA130gbPh3bFhSD
         oREb7SMmCqXMZIHak0BJMWn/tZzyWkDzUNST0l9EGm6ZgONt7wJOX7Lk8GFQuuk2HYjE
         SUlQ==
X-Gm-Message-State: AFq9FYLCc+W/vJrDcDhSgaFB28snBmo8tF3ImSlkyJz9d6NPP+MunXzY
	3e7CawnArJWb3ZB6aQzOM7QhVs1xes+NnYbeXu6KRS7ayxdbq3TlPbuD+p9N2GjijDc=
X-Gm-Gg: AYBFou2LotxXDxjuo4XpQnEnqly/n0TubFVhriA3TbeCzmCx8rUn4Nb9mZfFMbT1nQp
	St0QVonKne513Un6TPdGFhGNa7UOO1FSS5Q3QsitZsdiI6tNILt6Z3v7g8jtw4K40bI424eYwTc
	/3zDr2HSFglVsYCj4iCrPnpvJ80y2GbZ1eguMR0dUoX8FFXrMt6PZBmMyP5Eowh703kTIS92HPM
	Enx9a+NdnsBwfzDQbMtB+w0fTH5kQcc8kT32c8H3uZHDzf/LtGNEZpWMCTIbSqVmYrEv6sI6Otc
	QRp0GUmH1KFI9uY++fq6Il6faECt2EIMEhBh7ytaDGpvQpBLpl30ybZ9F7vONapaf1GthukPBTk
	7JzLVZrM3gWBoJFLMN4lOgZav37OA6fdg80fWZw8qqcTpxlGd6RTconmvtQNs6ke+bJ8WMB/GhA
	NYh/mjxaO8BnH+mvuha0dydisEMJON2h6ZjBZUq61lnme7vjgrz5mbz/DIFUzSztmL6IghX1ybD
	KPaU1u2VIOBmVlLOjL+Anamvowai+5BeKIBg0y0B7sUycHGyR60+vldPf/t
X-Received: by 2002:a05:620a:7106:b0:93e:c12c:f11b with SMTP id af79cd13be357-93ec12d0658mr2477753285a.71.1792002638192;
        Wed, 14 Oct 2026 11:30:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:37 -0700 (PDT)
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
Subject: [PATCH v2 06/10] mm/madvise: separate huge PMDs from the PTE walk
Date: Wed, 14 Oct 2026 14:30:20 -0400
Message-ID: <20261014183024.2075709-7-gourry@gourry.net>
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

madvise_lru_pmd_entry() still handles a huge PMD inline, and jumps
into its PTE walk with a goto when the huge-PMD folio was split.

The PMD lock, the split and the reclaim of the advised folio all
share a function with the PTE-table loop.

Move the huge-PMD path into madvise_lru_huge_pmd(), which takes the
PMD lock, advises or splits the folio and reclaims, and returns false
only when the caller must walk the new PTEs.

It uses the end address passed by walk_pmd_range(), which is already
clamped to the PMD boundary, instead of recomputing it.

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 97 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 39 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index f847dddada8a..a9e5a3e2fab4 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -436,6 +436,62 @@ static struct folio *madvise_lru_huge_pmd_folio(struct vm_area_struct *vma,
 		return NULL;
 	return folio;
 }
+
+/*
+ * Return false only when the folio was split and the caller must walk the
+ * new PTEs.
+ */
+static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk,
+		bool pageout_anon_only)
+{
+	const struct madvise_walk_private *private = walk->private;
+	const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
+	struct mmu_gather *tlb = private->tlb;
+	struct vm_area_struct *vma = walk->vma;
+	bool pageout = private->pageout;
+	LIST_HEAD(folio_list);
+	struct folio *folio;
+	spinlock_t *ptl;
+	pmd_t orig_pmd;
+
+	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
+	ptl = pmd_trans_huge_lock(pmd, vma);
+	if (!ptl)
+		return true;
+
+	orig_pmd = *pmd;
+	folio = madvise_lru_huge_pmd_folio(vma, addr, orig_pmd,
+			pageout_anon_only);
+	if (!folio)
+		goto unlock;
+
+	if (!spans_pmd) {
+		if (!folio_trylock(folio))
+			goto unlock;
+		folio_get(folio);
+		spin_unlock(ptl);
+		return madvise_lru_split_folio(folio) != 0;
+	}
+
+	if (!pageout)
+		madvise_cold_pmd(tlb, vma, pmd, addr, orig_pmd);
+	madvise_lru_folio(folio, pageout, &folio_list);
+unlock:
+	spin_unlock(ptl);
+	if (pageout)
+		reclaim_pages(&folio_list);
+	cond_resched();
+	return true;
+}
+#else
+/* pmd_trans_huge() is always false without THP, so this is never called. */
+static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk,
+		bool pageout_anon_only)
+{
+	return false;
+}
 #endif
 
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
@@ -459,46 +515,9 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
 			    !can_do_file_pageout(vma);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	if (pmd_trans_huge(*pmd)) {
-		pmd_t orig_pmd;
-		unsigned long next = pmd_addr_end(addr, end);
-		const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
-
-		tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
-		ptl = pmd_trans_huge_lock(pmd, vma);
-		if (!ptl)
-			return 0;
-
-		orig_pmd = *pmd;
-		folio = madvise_lru_huge_pmd_folio(vma, addr, orig_pmd,
-				pageout_anon_only);
-		if (!folio)
-			goto huge_unlock;
-
-		if (!spans_pmd) {
-			if (!folio_trylock(folio))
-				goto huge_unlock;
-			folio_get(folio);
-			spin_unlock(ptl);
-			if (!madvise_lru_split_folio(folio))
-				goto regular_folio;
-			return 0;
-		}
-
-		if (!pageout)
-			madvise_cold_pmd(tlb, vma, pmd, addr, orig_pmd);
-		madvise_lru_folio(folio, pageout, &folio_list);
-huge_unlock:
-		spin_unlock(ptl);
-		if (pageout)
-			reclaim_pages(&folio_list);
-		cond_resched();
+	if (pmd_trans_huge(*pmd) &&
+	    madvise_lru_huge_pmd(pmd, addr, end, walk, pageout_anon_only))
 		return 0;
-	}
-
-regular_folio:
-#endif
 	tlb_change_page_size(tlb, PAGE_SIZE);
 restart:
 	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
-- 
2.56.0

