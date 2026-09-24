Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD141D207
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232855; cv=none; b=LyRaA3VP0cu7Sw09/1WMfNVjdEjyob9Dg4/7kr5pvbhcx9flGuIzI5nRmDlqTylIWBJ0GZxBHr3jjZFTjAuNQbiL7fYJNTj+hjUwUPa4uaWNZG0v/ucDiQeNZAoZ1jTOgnnCXM/T5yh8rNLvhZfLEQPuVpDp9K+g6T3Ss/Cy7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232855; c=relaxed/simple;
	bh=8pe60ShfWybuaCh7m4Hq1ZUgjlmzJ1u0Ok6lD6w1+c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjlavwvFhbneE69I8EcAHOsw1rOK2d0rusqijP5EuvrQdq7or4+LtSPJoKy9f7jUNnVDCgPwRCNhzrylEV2zIpeYk2dku1RvG70VflZL8idgzvgoGSe2jCve8R2ejAin7X9/QUIv0EsMR+MAj35TmKHYV3A/KMZMuw84+o+EK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ic87cHHr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmDFQ+2g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ic87cHHr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmDFQ+2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JpYqOYoRlVZdrcLlVTpkBL4vVH/KqUerRKv2x17E1pA=;
	b=Ic87cHHrTOGB6Eq4zxXvbshwClNbb9CmxHM8ynVkU/h1U2JrbyTkkL9GafXsm4irFYAMUN
	iKjSQwzNhLnZJylIFCzrlZ2dW+UaUFNecMv/hdPJw5X+YoPFre5jHuChTuathfS1CFj164
	1FbGytcyI3l2OQXW71vNPvI3jN9+zMk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-OnmJEGtQP4u5v0JD8soHEw-1; Thu, 24 Sep 2026 02:53:55 -0400
X-MC-Unique: OnmJEGtQP4u5v0JD8soHEw-1
X-Mimecast-MFC-AGG-ID: OnmJEGtQP4u5v0JD8soHEw_1790232834
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a5b062d0dbso3518731fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232834; x=1790837634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JpYqOYoRlVZdrcLlVTpkBL4vVH/KqUerRKv2x17E1pA=;
        b=EmDFQ+2g821EWhcS6eJUpxpeWtL4I501ijMTA6RbX8wdx1S0IPf3CJwJGRmwTS1ndn
         ka9OXC7R/tZLW5PnyXh657e+UKY4mEf8n5Aa8Q1B6klk5ZJJe8qjGr0vy4pcKEottyqs
         LGsZEhhmMWwZ0ZhCbLaL8N/nFFYxM2Ezzl6cmIYbwd9YFZTxWW5ZBXyHmYoIoMFgbMuS
         s1RE/dX0jD5jJgqQKewCoB5iCTILTrz/ljIGr8C0K/+ZrqlEhFEkoXmH07fbLjd+MPRe
         SGZVW0qvR2mCCNga6djaeV7zfLXbvQ19e8kEkxgk1KrqZ9qVoXkkPMMl/VbhJy3u6VuU
         MpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232834; x=1790837634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpYqOYoRlVZdrcLlVTpkBL4vVH/KqUerRKv2x17E1pA=;
        b=XUxNH9c2+SbsRDkk+NBGrfst2d9MG0+yccLnXFVnkAPevjImh2+KSfmPI47BMngVNW
         CK39T0qpeg4I3YkgLgFhI5CYSoLJAL42E58Fx4vAwlZl0C07dPtIYrVpIsqEvLutagxV
         O9IuQE+lKUHozVaFNXJdj9X+kzCmJJYqenBlb/IKaKKtOP+gLorzzwh/P+STC0TwU8uC
         oy8G3KfyeG55/bG6tOruJHXXn+YaCerlVT4/+ztKw48x1PogPK/pQuzri1JPfOZOzTYH
         v9Z9AJsXBaFEXdO0+X+77YhSJQ8m8P551B5npAa01voptn0LSfuErKHE4PhoiNt2CnjY
         eZcA==
X-Forwarded-Encrypted: i=1; AKwUvBw2znXyDEbGcELINWZlspNekAcK+nie6wXpQLXLHdoJVFUW3WDFmc235qSCDsC5Geplam1hnv4vyNBPtEc=@vger.kernel.org
X-Gm-Message-State: AFuF++nDoP6fjQGFQej2tcva5jMe8EEYQ4EhFNzRcY4HBVVsAVTgYDg7
	xxLkUbxK64V5Vy7NsbPDKoQdLb+dNxXf8JKBxo0ZbND+Hno729LFco7nHvKpx/6fQZx3jhwGaLe
	yQfvApHAxCj14QSMcLX7y9q/TBIJA3wFaxBKYGAnrNMeEQmIkQ9QF/A5cZ2JGg8U6
X-Gm-Gg: AYBFou02vX5/o9xYAqQR09dZTsecYPgCQQi1m28zEv+2V8zhpumUdgf9DxmgRPr6GrQ
	iAlwqTe0OV9DKb2Ojouf9Ula0wKi/bVFz2LkYRjRR3CEd97HjKD8s5ZuIVVNbbDnZnV3TRQ8tTs
	Rt58Jt6k//rowSWwb+h9M/mt5bdsJ2UyDBAL5IAqWhUEvnXruzBHWwBI90i8d4WTcl407EK0HaP
	tyV0TlMR73kuDOLkopEWeXOvTpZPxyMH5ZbqsF2TVSzhRUiSZGwPpStD+ri6EaYhzCPeJtsgl2u
	Jt3+3bWziJQQXaPKA2Q1LcbcAJVIU+lC0vRQSEwP+c3mvPbGxhaLvk0Yn4mH/GGefacJIRXnvFu
	JS4GikA0oIkB2FkALkfF+
X-Received: by 2002:a05:651c:54f:b0:3a4:9881:8de0 with SMTP id 38308e7fff4ca-3a63bf5cf4cmr3206521fa.7.1790232834180;
        Wed, 23 Sep 2026 23:53:54 -0700 (PDT)
X-Received: by 2002:a05:651c:54f:b0:3a4:9881:8de0 with SMTP id 38308e7fff4ca-3a63bf5cf4cmr3206461fa.7.1790232833678;
        Wed, 23 Sep 2026 23:53:53 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:53 -0700 (PDT)
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v15 06/11] mm/hmm: migrate collection in HMM pagewalk - pmd level
Date: Thu, 24 Sep 2026 09:53:08 +0300
Message-ID: <20260924065313.899730-7-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Implement the needed hmm_vma_handle_migrate_prepare_pmd() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_huge_pmd() function.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting,
and the pfn collecting part. hmm_vma_handle_migrate_prepare*()
do the migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

HMM pagewalk based migration is enabled in later commit, for now
now hmm_select_migrate() returns 0.

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
 mm/hmm.c | 173 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 151 insertions(+), 22 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index a60b66963049..ea77429c5178 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -492,31 +492,19 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 
 #ifdef CONFIG_DEVICE_MIGRATION
 /**
- * migrate_vma_split_folio() - Helper function to split a THP folio
+ * __migrate_vma_split_folio() - split a folio and move the lock/ref to the
+ * order-0 folio backing @fault_page after the split
  * @folio: the folio to split
- * @fault_page: struct page associated with the fault if any
- * @hmm_vma_walk: walk in progress
- * @ptep: pte_t * for unmap and unlock ptl
+ * @fault_page: fault page if any
  *
- * Returns 0 on success
+ * Returns 0 on success.
  */
-static int migrate_vma_split_folio(struct folio *folio,
-				   struct page *fault_page,
-				   struct hmm_vma_walk *hmm_vma_walk,
-				   pte_t *ptep)
+static int __migrate_vma_split_folio(struct folio *folio,
+				     struct page *fault_page)
 {
-	int ret;
 	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
 	struct folio *new_fault_folio = NULL;
-
-	if (folio != fault_folio)
-		folio_get(folio);
-
-	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
-	hmm_vma_walk->ptelocked = false;
-
-	if (folio != fault_folio)
-		folio_lock(folio);
+	int ret;
 
 	ret = split_folio(folio);
 	if (ret) {
@@ -548,14 +536,145 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio() - drop the pte lock and split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ * @hmm_vma_walk: walk in progress
+ * @ptep: pte_t * for unmap and unlock ptl
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page,
+				   struct hmm_vma_walk *hmm_vma_walk,
+				   pte_t *ptep)
+{
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	if (folio != fault_folio)
+		folio_get(folio);
+
+	pte_unmap_unlock(ptep, hmm_vma_walk->ptl);
+	hmm_vma_walk->ptelocked = false;
+
+	if (folio != fault_folio)
+		folio_lock(folio);
+
+	return __migrate_vma_split_folio(folio, fault_page);
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
 					      unsigned long end,
 					      unsigned long *hmm_pfn)
 {
-	// TODO: implement migration entry insertion
-	return 0;
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
+	if (!(hmm_pfn[0] & HMM_PFN_VALID))
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
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		folio_put(folio);
+		hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
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
+		}
+		for (i = 1, start += PAGE_SIZE; start < end; start += PAGE_SIZE, i++)
+			hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	} else {
+		goto split;		/* fall back to splitting the pmd */
+	}
+
+out:
+	return r;
+
+split:
+	spin_unlock(hmm_vma_walk->ptl);
+	hmm_vma_walk->pmdlocked = false;
+
+	/*
+	 * folio_get() above took an extra reference. For the fault folio the
+	 * caller still holds a reference and the lock, which is the
+	 * precondition of __migrate_vma_split_folio(), so drop the extra one.
+	 */
+	if (folio == fault_folio)
+		folio_put(folio);
+
+	r = __migrate_vma_split_folio(folio, migrate->fault_page);
+	if (r)
+		return r;
+
+	hmm_vma_walk->last = start;
+	return -EBUSY;
 }
 
 /*
@@ -958,8 +1077,18 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			hmm_vma_walk->pmdlocked = false;
 		}
 
+		/*
+		 * hmm_vma_handle_migrate_prepare_pmd() splits the huge pmd in
+		 * place when needed and returns -EBUSY to re-walk the range as
+		 * PTEs; any other error means the split failed.
+		 */
+		if (r == -EBUSY)
+			return -EBUSY;
+		if (r) {
+			/* Split not successful, skip */
+			return hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
+		}
 		return r;
-
 	}
 
 	if (hmm_vma_walk->pmdlocked) {
-- 
2.55.0

