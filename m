Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363256C624
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002644; cv=none; b=Z1QHQMUSk3GOtrV3aUL/HrndyfoSKx2ucqVI5gGAbbtrMuNu9OLvPfGbJAchquFgyuRKdcyPJ6sZGQfKGU47wANKIkkzjxXaZx/cuyPSs1c9cCYAVoSWz0RClUnt0XqQ1xJNCeAC6NUUaAd9PRfrg1v8swUk+V1/2PO7Ncfb3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002644; c=relaxed/simple;
	bh=DJA4oQ46qzUlaXjLajvqMmqhIHbg/eu3yAEpqRirCfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UffTC4R+e8G6bN1az3M/TtDbEbHoErDjQ9ChWlOXGwZ/nqaqGhlhPmnIiZSkUKADg4NGXDV4SMEDKs6GtNN1vZL3Yng7/W6dFJizKw5sVYP9ft0GtpSuE6Og7sn8+FCEq1OaOdJWUIzWHdgQnbOQyJf61zH+v09blAhbD00syic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=E7xxucZN; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="E7xxucZN"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-930c0f9c1b1so467427885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002641; x=1792607441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ge1qlR5ZIuijZyTa8DlHKLyf7oJA6xVZ0symgBKYKis=;
        b=E7xxucZNpzum1LJ+YZDYKyXTjzcp/FVh2z2rSjpacERPCB7jwB0l0YylWYLQ0AOEuq
         wwVMFJDMzacVS6HwObi4qZLG/RdNIIwGzeDmOF+IlLZd+ZKkHN9yeExYJC9Dz2B8NW/e
         +zmi+vG6x0q/cWUFxndppdUr6zUQy6xTX0gkCRTvRT8amvetpmo4ttgU0Lx96CRZQh/A
         qw/m9lHg2evn54jnalGxrjIOBIAdUdpnAj+gYDE22XiiSkYwIDIjIbYhQtk3GtXGjZGo
         occ46aT4WowvMeS2QIeAiSW3vQG5HA6s8V7EQosiqd26HLR8dv8NYobqYSnCb2SmN2FS
         PZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002641; x=1792607441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ge1qlR5ZIuijZyTa8DlHKLyf7oJA6xVZ0symgBKYKis=;
        b=cFIcK6jbsSdyuRv4raejcsu47VMJdnIO+/HSmyJprpoWXSHvbYK5/lLKgQJtaSXca8
         BL727JOLF2ZmDRHpdHYVMFjgzAKHmVCfyg0ra4nSjpWVCTQIt2wTDhueU2OpSw5OdVYZ
         Q9TI6gx2NrYanAPAZEvwFMtQMwQcUTk/7kv7R8Bneuq0B+ZL++Ovp5pM4f3M8yWKtFHb
         5CPFWf3GnCvA5I/wQRjXPF5ksPOECuJzA0dfOxe5bRL9eLG+4j4QuDekMTB4u1SOLHwB
         S7T2cicz7hFNpGKYvuFTQqnJX2EVexNNd1SnAehqdXNMH552PQrB4PHauATW6Ugm98Lj
         8bAA==
X-Gm-Message-State: AFq9FYIRHzUUwh8tnCLKGOB4Z2fZEh21Z8vxliA5YX6YCSFd3BTom/RA
	PPNJJiuagEZ8XPWc0fK01LoHq488+Is9hvPdjfEXFw5zX+JkyeEirRBo5CCO5EEVFR4=
X-Gm-Gg: AYBFou1jdAZjsYFFxYwYmh1FxShnPk7qo5lcCEsudEniuLTZwV67F7BDHSEfDfkt5y5
	zxXvor4firiibe6vSzxErow0JFvnh63Ig+fP/UkgrbS4+dqk5k5f7M7NKqVznB8DyfJmRlfX8OC
	xP/ikQ9Pr1IKGlcMsShgElg/m6aQkcsqzT95lFUuCEoffwtGPWjvcqsMLhij69apnEXJdIATbkv
	fQxFKIHIifmT3dCxBJ3baDwPmITErmxcQWku4tjcUD35S6RgdZz0Buw/a5/6glkCYE9h+EaPmYx
	wNj3iJRvtRnqXWbImjb5Ij4ldWkVZMOtyfXoaSRJlhBg8nLvgPSs3f2DkQd6mOdIEpZ10qOMiLt
	ReLHmVKvktV/GnB12izaR8ghFYNK75e2mXPpFmV18vjhhugI/Ol2NiSewEf2+ENYBPBSLLKN5a0
	kk4e1ujYvvGpmwClY+bu/cDXOLvL1ehmXBykCiy8FUm+jAzijjpNuzm7cxZFmasKVbEfG4CpXOa
	l/YApqBuxudh9Rhpg48Bm5v4DhNLysvHWzgZewkN0mY620k7HIxjWlAozPt
X-Received: by 2002:a05:620a:3942:b0:93e:e531:b78d with SMTP id af79cd13be357-93ee531ba1cmr1506123785a.7.1792002641364;
        Wed, 14 Oct 2026 11:30:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:40 -0700 (PDT)
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
Subject: [PATCH v2 08/10] mm/madvise: separate the PTL-held PTE scan
Date: Wed, 14 Oct 2026 14:30:22 -0400
Message-ID: <20261014183024.2075709-9-gourry@gourry.net>
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

The PTE loop's scan is broken up by the two places that drop the
PTE lock: the periodic reschedule and the large-folio split.

Move the scan into madvise_lru_pte_range_locked(), which runs
entirely under the lock and stops either at a folio to split or
at the reschedule point.

Both lock drops now happen in madvise_lru_pmd_entry(), which restarts
the scan where the helper stopped, or past the folio's PTE batch if
splitting it failed.

No functional change intended.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 67 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 0c0a840102eb..3ebc14d30e0b 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -565,6 +565,33 @@ static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
 }
 #endif
 
+/*
+ * Scan PTEs under the PTE lock until a folio needs splitting, and return it
+ * locked and referenced. Return NULL at the end of the range, or earlier
+ * when the caller should reschedule. *addr is left at the PTE where the
+ * scan stopped.
+ */
+static struct folio *madvise_lru_pte_range_locked(pte_t *pte,
+		unsigned long *addr, unsigned long end, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only, int *nr,
+		unsigned int *batch_count)
+{
+	struct folio *folio;
+
+	for (; *addr < end; pte += *nr, *addr += *nr * PAGE_SIZE) {
+		if (++(*batch_count) == SWAP_CLUSTER_MAX) {
+			*batch_count = 0;
+			if (need_resched())
+				return NULL;
+		}
+		folio = madvise_lru_pte_batch_locked(pte, *addr, end, walk,
+				folio_list, pageout_anon_only, nr);
+		if (folio)
+			return folio;
+	}
+	return NULL;
+}
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -596,34 +623,24 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		goto out;
 	flush_tlb_batched_pending(mm);
 	lazy_mmu_mode_enable();
-	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
-		if (++batch_count == SWAP_CLUSTER_MAX) {
-			batch_count = 0;
-			if (need_resched()) {
-				lazy_mmu_mode_disable();
-				pte_unmap_unlock(start_pte, ptl);
-				cond_resched();
-				goto restart;
-			}
-		}
-
-		folio = madvise_lru_pte_batch_locked(pte, addr, end, walk,
-				&folio_list, pageout_anon_only, &nr);
-		if (!folio)
-			continue;
-
+	folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
+			&folio_list, pageout_anon_only, &nr, &batch_count);
+	if (!folio && addr < end) {
 		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
-		start_pte = NULL;
-		if (!madvise_lru_split_folio(folio))
-			nr = 0;
-		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
-		if (!start_pte)
-			break;
-		pte = start_pte;
-		flush_tlb_batched_pending(mm);
-		lazy_mmu_mode_enable();
+		cond_resched();
+		goto restart;
 	}
+	if (!folio)
+		goto out;
+
+	lazy_mmu_mode_disable();
+	pte_unmap_unlock(start_pte, ptl);
+	start_pte = NULL;
+	if (!madvise_lru_split_folio(folio))
+		nr = 0;
+	addr += nr * PAGE_SIZE;
+	goto restart;
 
 out:
 	if (start_pte) {
-- 
2.56.0

