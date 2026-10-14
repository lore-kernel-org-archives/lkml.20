Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A03A569F35
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002641; cv=none; b=cyjPIcKrHki1WUmQ4FMYYb6qc34gorA9kHmeQbWPjTrexlAFymNg9aRR8oSWBe5KrLiyaPS474qLiVZ/fB3TfS/ym3an6XLsJrWGEQK23jVsgwwA31qzrcTGcMjE1RhZ88xeZKpOb+jFK16b0wEUZXDIldm08dlMOBOdzbgZZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002641; c=relaxed/simple;
	bh=7hUDw895iis/f7DFhEno0C2kwpYd5firVWQqCbVJLxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyhaQCPtXtQyNVx0nGD8pgSPUaNwdy96DlP+Q9jY34vQuJeI3UpgHorjJSiIfEvfSY/+d4RO3DSBLQ4fwfexdF2rnIS9Kst5XgZge4DQx261iXypmLr0D59/oqyTfFSH+1fZS3fuPynhwPnvLdA9Ma9l6gXd7apEGYjxgG6tvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Tx+Nitt6; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Tx+Nitt6"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535199ac562so43466541cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002637; x=1792607437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ePueSrtTjxyoQqFiqutrxbbN437intRkGhhEYPkovE=;
        b=Tx+Nitt6zLmA6pWLd+bSjVUtNo6PIicc+agp21Pyb+fXlaxLyXSB/N8WmsyespRzdo
         Hm5dZhhFbINFfVn1yz3m5Qpjgak5CPUOtEJH/Og7+pxQu/FuP+qrr0r94on6Xi5U7npa
         AQXUyQV72ICtil7VD9cdbF+SjAMSW7jl2iiBzYJp2DhlrTJbW5VDWtPa/grLeXBToBoY
         rV3+bdhrhEM3duHFaSlQp/fhqWdCC/vBb9ThEjDZJ2rCHycpaCdrjvVs3e+8ouavKk99
         1dFea0lXmQi3RaxMNeuSZ2C9XPqLt3kqSGDTarY9BuPt3jrvv+ZZi6rm11Q0riG+9ayi
         PnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002637; x=1792607437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ePueSrtTjxyoQqFiqutrxbbN437intRkGhhEYPkovE=;
        b=Pn9vTrv6RYD+7KCmoGAsFq7PT5ntHAA+209Su8hE6inRm6WahCPGI0XwmfcqJ+38rW
         uGCCOvyWYlnAD6U3dSIYImXOFFG6uEaPsQCGptDScbST3Zl4l0YbVmNx7/eCQehQ/cT7
         g2n7JpZERPacHMj4Jl+9YVPaiDALLSXP4YNUO+M/vSI/Wun8J5/7cPJcS9cI752aD1JP
         vKMKHHDbRYFXxGMtMlHg5lzwDAiMoRlG6qSYTy4iBVBdDWj8Xwlzf4I9aSG++6CiqZAX
         XjGVUEbCkgZkd4ZOntodismpWWyZzSD3CrImx5k8iC7EK2zPD5Ap+IZ2K3FTSGVqJF0S
         g/8Q==
X-Gm-Message-State: AFq9FYIq6PY4FkUnyKWgqcsvx1/cF1kMgKDkqsQtOvuqPMY2rDDReMwU
	1nAf3J2BaFjT1s9WS5QmGmLoLmpgBzpkNUqYZncR8Eib5FC26pgN+tifdtgYdCa0iXk=
X-Gm-Gg: AYBFou10ALRLr+7LliKlDK6CYYaw4huDZObFOadsiNkZc5voOXznpU7z/PvTs2P1NFg
	eofJ9ZUq50dH6L2lD1nKLbyd9sWAOOaxuPqSEqUSgOoiOaXj0BRXvTYom6rBypJVuSkyAo7k7fW
	aFiCTfBkHQTZmR8yEE6BtBKfSGIl/9km/DP3o2xJwbO7H2w2YwFKXfosxatJ790HYyEjc5PF2oz
	Zhb8N1+TzqF9maS1DGZ7q7kI8pZpqd739wZWXHKZQV38XycOYYtZ4Pnja/spDBE34RN4ooaRogh
	U6GdlRtcl8Wm2+3nGRHZVcRkqCGsoiZIME2obcUV3/CxrIlpg+TRZZbTfNbGg5B072kMV8ZyPuH
	tv/h+55LWLzHsZ40pHpGw6O4FOQAHCbGIYCWIbE6YDi6s7hR+0U6LtM5FFZy3KY1wHAAdU8Ogxs
	Ib+8JZEBcZe/9Oj6iRfuTsSYJ9nav+diaLPV71+6JSQ1rDWtbk4aNlaF6XvgThXcE88jF5IFGDW
	DxUc8feHADHohWSl2mN+WgoWf5qovFvRIWf6TF4oERXRZnOR9cVgIgr1BAS
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr2938174385a.52.1792002636690;
        Wed, 14 Oct 2026 11:30:36 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:36 -0700 (PDT)
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
Subject: [PATCH v2 05/10] mm/madvise: factor huge-PMD folio processing
Date: Wed, 14 Oct 2026 14:30:19 -0400
Message-ID: <20261014183024.2075709-6-gourry@gourry.net>
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

The huge-PMD branch of madvise_lru_pmd_entry() decides inline whether
the PMD maps a folio worth advising: it checks that the PMD is present,
looks up the folio and applies the shared filters, all between taking
the PMD lock and splitting or advising the folio.

Move those checks into madvise_lru_huge_pmd_folio(), which returns NULL
when there is nothing to do, and move the MADV_COLD young-bit clearing
into madvise_cold_pmd().

The split stays in the caller, which owns the PMD lock that must be
dropped before splitting.

No functional change intended.

Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 55 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 1bb4f9f0e73a..f847dddada8a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -407,6 +407,37 @@ static int madvise_lru_split_folio(struct folio *folio)
 	return err;
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
+{
+	if (!pmd_young(orig_pmd))
+		return;
+
+	pmdp_test_and_clear_young(vma, addr, pmd);
+	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
+}
+
+/* Return the folio mapped by a huge PMD if it should be advised. */
+static struct folio *madvise_lru_huge_pmd_folio(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t orig_pmd, bool pageout_anon_only)
+{
+	struct folio *folio;
+
+	if (unlikely(!pmd_present(orig_pmd))) {
+		VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
+		return NULL;
+	}
+
+	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
+	if (!folio || folio_is_zone_device(folio))
+		return NULL;
+	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
+		return NULL;
+	return folio;
+}
+#endif
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -432,6 +463,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	if (pmd_trans_huge(*pmd)) {
 		pmd_t orig_pmd;
 		unsigned long next = pmd_addr_end(addr, end);
+		const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
 
 		tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
 		ptl = pmd_trans_huge_lock(pmd, vma);
@@ -439,22 +471,12 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			return 0;
 
 		orig_pmd = *pmd;
-		if (unlikely(!pmd_present(orig_pmd))) {
-			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
-			goto huge_unlock;
-		}
-
-		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
+		folio = madvise_lru_huge_pmd_folio(vma, addr, orig_pmd,
+				pageout_anon_only);
 		if (!folio)
 			goto huge_unlock;
 
-		if (folio_is_zone_device(folio))
-			goto huge_unlock;
-
-		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
-			goto huge_unlock;
-
-		if (next - addr != HPAGE_PMD_SIZE) {
+		if (!spans_pmd) {
 			if (!folio_trylock(folio))
 				goto huge_unlock;
 			folio_get(folio);
@@ -464,11 +486,8 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			return 0;
 		}
 
-		if (!pageout && pmd_young(orig_pmd)) {
-			pmdp_test_and_clear_young(vma, addr, pmd);
-			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
-		}
-
+		if (!pageout)
+			madvise_cold_pmd(tlb, vma, pmd, addr, orig_pmd);
 		madvise_lru_folio(folio, pageout, &folio_list);
 huge_unlock:
 		spin_unlock(ptl);
-- 
2.56.0

