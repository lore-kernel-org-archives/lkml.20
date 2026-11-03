Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686625;
	b=n9loOW8cZqi2VzeKM4U09bQh/azSav7DV4taoiYRodRcfKrQO/tN8iPuZoaeUEblMYFP
	 Baur5K09BgylS7SI2nP4c15ELERWaMadovj8pPaQPW2O0FYEwmhp3bnYDhgmD6O2OdAwm
	 gI4Izi4Eif2N1lC69a2SK2LJpf8C790pXpUXQXVlUWxQaL7DMjNm4+oJ/oE3P1oiivP8S
	 XL0bELst8OnAdLOfYZN/7pYWhJDT+DcRRMn1asK4Kz2jdCTaroJ41wnXQ6VVWZZaoI5W5
	 i+bFJQ8McsPCbKqOkKCUNHUVSt/QI7YdGaFo+3GHOvx2AJUb5pTzGb8fZsptE8A6KcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686625;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xPj1CmnBZuUKYsibDOO8F9tznIiNHrfeip0Ruho/ab0=;
	b=AKlYR9rNoQiO1bb4lwqgbJELukSKtEMF1JzUjBgJQYTAkTVp5jQJD5el9qDY1Ai6APbk
	 LDku0E70y79ArUTEimJqWTOHcMouRy+DvffoGMXz3S4jnJ1EAIt+BAixsBP6KO16yJuw5
	 3FsxMNuAVG7dWn/dXZpob6V8NHCx4IqEOECuyz+p6SQwg6iDgDB2VHXpzeq1KIIJd4+2l
	 PMEfYwk4RUTOUBIVINXQhDDfy59OJzplq7zJqpcHR6Iv7xLWhd52JwthAKuTBwe9z/w4X
	 3hLyRhI2wSW/46tf45WlApAcwBsguT3PyGpLOQiBfPPooBrlSKme6G5pFIlcIacgkUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIRP9pnP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qgw40oah;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C3606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SIRP9pnP;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Qgw40oah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPj1CmnBZuUKYsibDOO8F9tznIiNHrfeip0Ruho/ab0=;
	b=SIRP9pnP8oXaZmOGZi9ZPyfHqatAOwCUGvqP78lPxNKgIbm13jXJXsH6GZKmRN+4KMY0MP
	43eYd0A4/uBZzTvCnrrkubCTHcyvLGDrdMXClH45W3bAQyuB87SSYe7oV4ApQCqyLMFMru
	JrmnxADCTRGUG8/lhx0Q7eBq3zwWPBc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-KHtae4qoNgyIu-P6j_k6-g-1; Tue, 03 Nov 2026 01:17:01 -0500
X-MC-Unique: KHtae4qoNgyIu-P6j_k6-g-1
X-Mimecast-MFC-AGG-ID: KHtae4qoNgyIu-P6j_k6-g_1793686620
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5bccb762619so1432348e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686620; x=1794291420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPj1CmnBZuUKYsibDOO8F9tznIiNHrfeip0Ruho/ab0=;
        b=Qgw40oahI/jCd+O87uvGzTtlbTKUOJT/2wwlLoSKerEmnkFRyuEZQZkSPhUajZvzA1
         Ae+dp9Mo1/BZmpzbgUt9Wov8CqeKyaCbznHPNZChoHnv0lu6mNqMO8JTB3IRJxxA0F6W
         opQvGxCHeJhpS9AdWgZem3Nm2HPzop3ZglZs12JDaDUZqk0pY/MftQg5qG2RLdh6DQjY
         Jlp30XRE9D7M5lH6QWX8KMlApeZ7iWAl6kkjd7Y5PnJpu7reVk9bwKnKVGVRZh2oQOxF
         xO6gzWBYg8Mz71+3G3IFbTjwODonw51ReBZhzjEvYbyfYI3Q6nOORCTzq5unylWiq+wa
         Q2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686620; x=1794291420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPj1CmnBZuUKYsibDOO8F9tznIiNHrfeip0Ruho/ab0=;
        b=zlE+3sN8uSve8osMEZhT6SyiCRV+uef469wJNEIEXRLLL3K8+/hXDO6a8wdHy4w9io
         Uwj+8m16uYe9hTFT/u+D3PIApSce//mTeUOn6OYZGJ+/cf9JPdojvZ/fA8WJhs8RyHAX
         dzXIoa6gx+ScA7AuuXvtWwHxGwSFSosjBtleGfyc697AX+QNMhrnsQEMrFyU5+EIvupS
         W+tpRHPggq/uPaMIhSb8hztlUhmv7TWJG047PF/ypKYs1Y8/9IVhuWOC24iVjrRKiWPJ
         r5Ve/kawCTAbQduDoK+1wCPWKDpWFTxmn+uVsJ5T8zMzXiey9Gg56QjP4mhNLv65Z+lW
         PBIg==
X-Forwarded-Encrypted: i=1; AKwUvBzXP4boXa0J2l3wwDmOgxmmBAdDtghRySX7/QXslWE5tdms5brm4L8MvjC+PbfHtutGUK6DJv0X010P9Fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4zbzaewg9hBGHawwUD8eViAKIBWqXj/9d5qvwCOuNqxQFdZ3K
	a9CdoNvLtYgNvpIOuuMewHv6K8CjNUM+dS7eGuZ2T1mSFEnvoyMA36uZE6gcHOppji9pbL7Ve91
	CDloVOnNp1pl7cifVJQuPbDC67L77iMs96H7z5z/SwnWCwtxKJX2RVy8XEIfP+72D
X-Gm-Gg: AYBFou1fPfEbcB7A2AXAV9n4JXDPiA5APU05W/f5RJZqO1AZlkB+0W/fPAOzWUAfMsG
	plB2CE9B6mLiZzcBTg40h3+sSdzbiseUauAckeI5Weoili5xmuOnG3+V7SxGw8egjeyzphMlfWE
	BdqTziBSXYeSG/AjAMLyoqhPgi+f+xRAtE9Q78DWDG0gWdrkzQd8jN3M0aMDAGO9rxA5YxuoddX
	MLX8Vi3s+AxoTsGoZX4qIFB+gI8IdZ/H1K0GZiBGFhMcDtO9Au/uDJbTofbFSHpPROrrJKwgIOJ
	LEhGc6RrGnhtSNT/RZjRIkiaP6U337lB0akWIrDQyrWQ5i3SLYmPLDy/q35vea/laGrVN/qousX
	lr7AmvuR73V+Jaqs1hGjosK0B/GrwvG8MWPG+94cdTzgDCZqLl1KKr55/dFkGJVe8HutSvA==
X-Received: by 2002:a05:6512:3b0e:b0:5bf:ce41:8a61 with SMTP id 2adb3069b0e04-5bfd95662a4mr3992328e87.26.1793686620196;
        Mon, 02 Nov 2026 22:17:00 -0800 (PST)
X-Received: by 2002:a05:6512:3b0e:b0:5bf:ce41:8a61 with SMTP id 2adb3069b0e04-5bfd95662a4mr3992310e87.26.1793686619684;
        Mon, 02 Nov 2026 22:16:59 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:58 -0800 (PST)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 06/12] mm/hmm: migrate collection in HMM pagewalk - pmd level
Date: Tue,  3 Nov 2026 08:16:23 +0200
Message-ID: <20261103061629.972669-7-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Implement the needed hmm_vma_handle_migrate_prepare_pmd() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_huge_pmd() function.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting, and the pfn
collecting part. hmm_vma_handle_migrate_prepare*() do the
migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

Locking follows the same rules as at the pte level (see the previous
commit): the folio is only trylocked, a PMD-mapped THP is collected
whole behind its pmd migration entry (its only mapping in the vma), and
a swapcache folio still referenced by other swap entries is not
collected. On a trylock or split failure the valid pfns are kept and
nothing is migrated.

HMM pagewalk based migration is enabled in later commit, for now
hmm_select_migrate() returns 0.

Also avoid the problems present in the migrate_vma_collect_huge_pmd()
split fallback path this HMM path supersedes:

      - extra refcount for fault_folio makes split_folio() fail
      - wrong folio unlocked after split_folio()

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 mm/hmm.c | 183 +++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 152 insertions(+), 31 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index ec9280ef2682..cbde004fd778 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -496,7 +496,33 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 
 #ifdef CONFIG_DEVICE_MIGRATION
 /**
- * migrate_vma_split_folio() - Helper function to split a THP folio
+ * __migrate_vma_split_folio() - split a locked folio for migration
+ * @folio: the folio to split, locked and referenced by the caller
+ * @fault_page: fault page if any
+ *
+ * The fault folio is split at @fault_page, so the caller's lock and reference
+ * stay on the folio containing @fault_page. For any other folio our lock and
+ * reference are dropped, whether or not the split succeeds.
+ *
+ * Returns 0 on success.
+ */
+static int __migrate_vma_split_folio(struct folio *folio,
+				     struct page *fault_page)
+{
+	int ret;
+
+	if (fault_page && folio == page_folio(fault_page))
+		return split_huge_page(fault_page);
+
+	/* Someone else may have split it while we waited for the lock */
+	ret = folio_test_large(folio) ? split_folio(folio) : 0;
+	folio_unlock(folio);
+	folio_put(folio);
+	return ret;
+}
+
+/**
+ * migrate_vma_split_folio() - drop the pte lock and split a THP folio
  * @folio: the folio to split
  * @fault_page: struct page associated with the fault if any
  * @hmm_vma_walk: walk in progress
@@ -511,9 +537,7 @@ static int migrate_vma_split_folio(struct folio *folio,
 				   struct hmm_vma_walk *hmm_vma_walk,
 				   pte_t *ptep)
 {
-	int ret;
 	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
-	struct folio *new_fault_folio = NULL;
 
 	/*
 	 * Take the reference while still holding the PTE lock, so the folio
@@ -530,44 +554,136 @@ static int migrate_vma_split_folio(struct folio *folio,
 	if (folio != fault_folio)
 		folio_lock(folio);
 
-	ret = split_folio(folio);
-	if (ret) {
-		if (folio != fault_folio) {
+	return __migrate_vma_split_folio(folio, fault_page);
+}
+
+static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
+					      pmd_t *pmdp,
+					      unsigned long start,
+					      unsigned long end,
+					      unsigned long *hmm_pfn)
+{
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+	int r = 0;
+
+	// Do we want to migrate at all?
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return r;
+
+	WARN_ON_ONCE(!migrate);
+	HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, true);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	if (pmd_none(*pmdp))
+		return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	/* Like at the pte level, NUMA hinting (protnone) pmds are migrated */
+	if (!(hmm_pfn[0] & HMM_PFN_VALID) &&
+	    !(pmd_trans_huge(*pmdp) && pmd_protnone(*pmdp)))
+		goto out;
+
+	if (pmd_trans_huge(*pmdp)) {
+		if (!(minfo & MIGRATE_VMA_SELECT_SYSTEM))
+			goto out;
+
+		folio = pmd_folio(*pmdp);
+		if (is_huge_zero_folio(folio))
+			return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	} else if (!pmd_present(*pmdp)) {
+		const softleaf_t entry = softleaf_from_pmd(*pmdp);
+
+		if (!softleaf_is_device_private(entry))
+			goto out;
+
+		if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
+			goto out;
+
+		folio = softleaf_to_folio(entry);
+		if (folio->pgmap->owner != migrate->pgmap_owner)
+			goto out;
+	} else {
+		hmm_vma_walk->last = start;
+		return -EBUSY;
+	}
+
+	folio_get(folio);
+
+	/* Can't lock it: not migrated, the valid pfns stay as reported */
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		folio_put(folio);
+		return 0;
+	}
+
+	/* Swapcache folio still referenced elsewhere: see the pte level */
+	if (folio_test_swapcache(folio) && !folio_free_swap(folio)) {
+		if (folio != fault_folio)
 			folio_unlock(folio);
-			folio_put(folio);
+		folio_put(folio);
+		return 0;
+	}
+
+	if (thp_migration_supported() &&
+	    (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+	    (IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = hmm_vma_walk->ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		hmm_pfn[0] |= HMM_PFN_MIGRATE | HMM_PFN_COMPOUND;
+
+		r = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (r) {
+			hmm_pfn[0] &= ~(HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+			goto split;	/* fall back to splitting the pmd */
 		}
-		return ret;
+		/* Collected; a protnone pmd was not reported valid before */
+		hmm_pfn[0] |= HMM_PFN_VALID;
+		for (i = 1, start += PAGE_SIZE; start < end; start += PAGE_SIZE, i++)
+			hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	} else {
+		goto split;		/* fall back to splitting the pmd */
 	}
 
-	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
+out:
+	return r;
+
+split:
+	spin_unlock(hmm_vma_walk->ptl);
+	hmm_vma_walk->pmdlocked = false;
 
 	/*
-	 * Ensure the lock is held on the correct
-	 * folio after the split
+	 * folio_get() above took an extra reference. For the fault folio the
+	 * caller still holds a reference and the lock, which is the
+	 * precondition of __migrate_vma_split_folio(), so drop the extra one.
 	 */
-	if (!new_fault_folio) {
-		folio_unlock(folio);
+	if (folio == fault_folio)
 		folio_put(folio);
-	} else if (folio != new_fault_folio) {
-		if (new_fault_folio != fault_folio) {
-			folio_get(new_fault_folio);
-			folio_lock(new_fault_folio);
-		}
-		folio_unlock(folio);
-		folio_put(folio);
-	}
 
-	return 0;
-}
+	/* Split failed: not migrated, the valid pfns stay as reported */
+	if (__migrate_vma_split_folio(folio, migrate->fault_page))
+		return 0;
 
-static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
-					      pmd_t *pmdp,
-					      unsigned long start,
-					      unsigned long end,
-					      unsigned long *hmm_pfn)
-{
-	// TODO: implement migration entry insertion
-	return 0;
+	/* Re-walked as PTEs from start: drop the pmd-level output */
+	for (i = 0; i < (end - start) >> PAGE_SHIFT; i++)
+		hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	hmm_vma_walk->last = start;
+	return -EBUSY;
 }
 
 /*
@@ -1016,6 +1132,11 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			hmm_vma_walk->pmdlocked = false;
 		}
 
+		/*
+		 * hmm_vma_handle_migrate_prepare_pmd() splits the huge pmd in
+		 * place when needed and returns -EBUSY to re-walk the range as
+		 * PTEs.
+		 */
 		return r;
 	}
 
-- 
2.55.0

