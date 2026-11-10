Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351200;
	b=Zju/K7O4cq7G3kXzyrV89fHCf9npmxkZuOpV43xPmbeqTysEbgsHn/u9RtsSCDMXs0zJ
	 ND5KlJUNMUQuXBUQ+n6ka4Elb5H70I3t+kx1jKcy+ONynyximQf7662Xuz5axY82cV1Ne
	 8j8f6Y+SFGot4753TQsZ3Ele3RLwab5bDbGw2YRqcaO0O+scH0aeQE5+JP4Gz6JWrXgWz
	 uTMsVdoxEWUkVb3VNZre3KcYOy8wXuYqdt/arHoc1ML+GGyL82iGIjiTnvMSHW/W91A89
	 SMyXshaK5Dz9tiJy+T3aFSXjhPXu8kTJIEojWY01SoIdIp14j5xiiqeiBTxXGzPx1Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351200;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UbcxFShisicA4cPdWs1hNTl2liz7wLMuWY62Qdts3tw=;
	b=awxh7GsMQBFW6ySM2CNzTWgfeJ97wspHTjyXXmhpqJzuoalgWVvhhrHN8AomDIma9psr
	 607qQKs4ew9i3HnU1QGimFv4G9qn76Vlub/va4pquBteA2m+ooq3sMqzTYumuQJTJnpzB
	 8NGnHyD+sJEt8L/lVs7MtFJ/y3AAtvcQuuauMp5doJuT3IzasOc1KvPTjbhuC4i27K6oG
	 HXHzcFiJ6xq47M9E81KgVNBZ93ZRPmNCYGTOiHZn1aWFfEPHYALvARCx/eojuqPI+F2VW
	 lRAR1o26tEyvF06+yCTnj+BlbPDu+ED3lMa1KJBGMKWZswmmv/SIugxzuFnrn2izioA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kE7S7aRa;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA08D606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA08D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kE7S7aRa
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3340C1477;
	Tue, 10 Nov 2026 14:53:16 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AC433F85F;
	Tue, 10 Nov 2026 14:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794351199; bh=4HlolDn2s9lvvHCEH5BsxXm+blGfSDIFm9T7XUOaaIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kE7S7aRaa4lPZF2xu2QJu0KowVuJThV9ILanVwBxAQwa48t3QvGd5HXPd5PQF9jZK
	 dpbih/IPLRx3IJ0tsISYTGmPgMmphUVXVLNd88UWzdHzVvi8NXuBA961EuzEFnsSkT
	 8er7Ni2v02Ie4cKdkgNy51K/gqK/flc3cL86y97s=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 10 Nov 2026 22:52:53 +0000
Subject: [PATCH v4 3/6] mm: gup: move gup_must_unshare() and
 INTERNAL_GUP_FLAGS to gup.c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-refactor_gup_fast-v4-3-e779a7674274@arm.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
In-Reply-To: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6232; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=4HlolDn2s9lvvHCEH5BsxXm+blGfSDIFm9T7XUOaaIY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq86BTaITMnZuXz2iWq65NmLKimaLIBA3D6V6EG
 LnDxZ0QFKyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCavOgUwAKCRBt1cPRWsUx
 M52KC/9FZh1ap2gl+irou0YmRVf46FuZMY0LDD8VvKO4+xX+FANh/nRIvpMTAYS10YG8H9wQJyQ
 WK+Pisvn5daet1SeqdYB21UmvVTZEAJAj3H2NsYnUfsp05G178JwOi08mJTTZmMzkjH36yMGCgT
 FhYQKkc4/YPCjlYaWpnvPAoWh8/ZRor9wKVW02X7Ep93TqBXIA3KJ95Do5f9ODVlp8ckRt6C22S
 WRx1Yu1CJveFEWUqH4NVQCyX/RvPmiWNI1HzPi26l03ujoGYWMihYOikx3Lp5KdQTS6PlFzYVX1
 rQHV6r9Hoz2WmlKKuDDnjQx6M925bfw38nEQ1Z/4yA+LSB0bODIH88VXluOYvGcAbpY3cMHbWn8
 K+/L1KcAia989Wv/kWWzVi7QHxBuf6G/xnD4KoORcONL5uw0f32hFmvRUs6/hlZDVLgeKafReLh
 nLcTnVWRa9WaOF/5Vyls97Kpz71i1Cwe0sDZBe0KWssEG61zf9WpHwP24q20IGg1Zs3iA=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

gup_must_unshare() and INTERNAL_GUP_FLAGS are used in gup.c only.
Move gup_must_unshare() and INTERNAL_GUP_FLAGS from internal.h to gup.c

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c      | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/internal.h | 70 -----------------------------------------------------------
 2 files changed, 69 insertions(+), 70 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 00dac03093a4..ccdce67ef300 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -633,6 +633,71 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+/*
+ * Indicates for which pages that are write-protected in the page table,
+ * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
+ * GUP pin will remain consistent with the pages mapped into the page tables
+ * of the MM.
+ *
+ * Temporary unmapping of PageAnonExclusive() pages or clearing of
+ * PageAnonExclusive() has to protect against concurrent GUP:
+ * * Ordinary GUP: Using the PT lock
+ * * GUP-fast and fork(): mm->write_protect_seq
+ * * GUP-fast and KSM or temporary unmapping (swap, migration): see
+ *    folio_try_share_anon_rmap_*()
+ *
+ * Must be called with the (sub)page that's actually referenced via the
+ * page table entry, which might not necessarily be the head page for a
+ * PTE-mapped THP.
+ *
+ * If the vma is NULL, we're coming from the GUP-fast path and might have
+ * to fallback to the slow path just to lookup the vma.
+ */
+static inline bool gup_must_unshare(struct vm_area_struct *vma,
+				    unsigned int flags, struct page *page)
+{
+	/*
+	 * FOLL_WRITE is implicitly handled correctly as the page table entry
+	 * has to be writable -- and if it references (part of) an anonymous
+	 * folio, that part is required to be marked exclusive.
+	 */
+	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
+		return false;
+	/*
+	 * Note: PageAnon(page) is stable until the page is actually getting
+	 * freed.
+	 */
+	if (!PageAnon(page)) {
+		/*
+		 * We only care about R/O long-term pining: R/O short-term
+		 * pinning does not have the semantics to observe successive
+		 * changes through the process page tables.
+		 */
+		if (!(flags & FOLL_LONGTERM))
+			return false;
+
+		/* We really need the vma ... */
+		if (!vma)
+			return true;
+
+		/*
+		 * ... because we only care about writable private ("COW")
+		 * mappings where we have to break COW early.
+		 */
+		return vma_is_cow_mapping(vma);
+	}
+
+	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
+	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
+		smp_rmb();
+
+	/*
+	 * Note that KSM pages cannot be exclusive, and consequently,
+	 * cannot get pinned.
+	 */
+	return !PageAnonExclusive(page);
+}
+
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 /* FOLL_FORCE can write to even unwritable PUDs in COW mappings. */
 static inline bool can_follow_write_pud(pud_t pud, struct page *page,
@@ -2507,6 +2572,10 @@ static long __gup_longterm_locked(struct mm_struct *mm,
 	return rc ? rc : nr_pinned_pages;
 }
 
+#define INTERNAL_GUP_FLAGS (FOLL_TOUCH | FOLL_TRIED | FOLL_REMOTE | FOLL_PIN | \
+			    FOLL_FAST_ONLY | FOLL_UNLOCKABLE | \
+			    FOLL_MADV_POPULATE)
+
 /*
  * Check that the given flags are valid for the exported gup/pup interface, and
  * update them with the required flags that the caller must have set.
diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0..177bd47045d1 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1326,76 +1326,6 @@ enum {
 	FOLL_MADV_POPULATE = 1 << 22,
 };
 
-#define INTERNAL_GUP_FLAGS (FOLL_TOUCH | FOLL_TRIED | FOLL_REMOTE | FOLL_PIN | \
-			    FOLL_FAST_ONLY | FOLL_UNLOCKABLE | \
-			    FOLL_MADV_POPULATE)
-
-/*
- * Indicates for which pages that are write-protected in the page table,
- * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
- * GUP pin will remain consistent with the pages mapped into the page tables
- * of the MM.
- *
- * Temporary unmapping of PageAnonExclusive() pages or clearing of
- * PageAnonExclusive() has to protect against concurrent GUP:
- * * Ordinary GUP: Using the PT lock
- * * GUP-fast and fork(): mm->write_protect_seq
- * * GUP-fast and KSM or temporary unmapping (swap, migration): see
- *    folio_try_share_anon_rmap_*()
- *
- * Must be called with the (sub)page that's actually referenced via the
- * page table entry, which might not necessarily be the head page for a
- * PTE-mapped THP.
- *
- * If the vma is NULL, we're coming from the GUP-fast path and might have
- * to fallback to the slow path just to lookup the vma.
- */
-static inline bool gup_must_unshare(struct vm_area_struct *vma,
-				    unsigned int flags, struct page *page)
-{
-	/*
-	 * FOLL_WRITE is implicitly handled correctly as the page table entry
-	 * has to be writable -- and if it references (part of) an anonymous
-	 * folio, that part is required to be marked exclusive.
-	 */
-	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
-		return false;
-	/*
-	 * Note: PageAnon(page) is stable until the page is actually getting
-	 * freed.
-	 */
-	if (!PageAnon(page)) {
-		/*
-		 * We only care about R/O long-term pining: R/O short-term
-		 * pinning does not have the semantics to observe successive
-		 * changes through the process page tables.
-		 */
-		if (!(flags & FOLL_LONGTERM))
-			return false;
-
-		/* We really need the vma ... */
-		if (!vma)
-			return true;
-
-		/*
-		 * ... because we only care about writable private ("COW")
-		 * mappings where we have to break COW early.
-		 */
-		return vma_is_cow_mapping(vma);
-	}
-
-	/* Paired with a memory barrier in folio_try_share_anon_rmap_*(). */
-	if (IS_ENABLED(CONFIG_HAVE_GUP_FAST))
-		smp_rmb();
-
-	/*
-	 * Note that KSM pages cannot be exclusive, and consequently,
-	 * cannot get pinned.
-	 */
-	return !PageAnonExclusive(page);
-}
-
-
 static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 {
 	/*

-- 
2.43.0

