Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562744;
	b=Aycp3dvlmb0SeaoxJD9eUsc41V70CLmwhc1iB0aYPLez9z8jBK+T8VGcdVqg9sgRAJz+
	 FB9CeBC8x+d9fH8+8+8z/TWUsSQzOyay5IFubuaGgJRFZXcSRtyGShJh4Sqb0TG/EcRJf
	 PJX1jUcEeZBoWtx9/4IytBbf/+XpXX0eQAzOQb1MapBtdCnBOYLK+ajEYEfJyrpRDjGWP
	 rLAlB+vmtk2mkTUZR0BKAdVfiMn61k/svB+mAcMNd6leoPzGFqrVO57suRSGjlWGp9oVI
	 z82KUE0+/cRleRLBTwno2I6laOBNxXq+R1p1MVRHF954y7w8cHU7oeJQAnSwiCjlLKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562744;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
	b=Mn+enYXqDrGxwssvLgguWLmPeZksGmbJWT27iXf5zWl9VDhfL2Ggm4yUZT+nFodt6deR
	 vx7JB18cAORzlzYALD/9BM3eAFImgCBxFEXlB9eZeb6j/aYwb4eLRVjUYKoBr8YdSh+6W
	 Ra2OYoCzH0jGPggJmwlwDLAk2zWjTBoLTKYJmVZbk4rQV6tiABoIgvGCjIGG+zbr9MgbS
	 jE6RhxJA3HwT1EZ7z1WdYlXhmS4madkmaiGU0qM0DvZUQqdHriIowJ31OfLN6v90/d5F0
	 LZ0ae37iRYwnkOYgMq9JwUMGDTGCpSqLW0BcJqa2qHQPHW1RAgb6DUcX5LoJo1uoLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZDtkU8iK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FRewMcef;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1373460A3810
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1373460A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZDtkU8iK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FRewMcef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
	b=ZDtkU8iKNVHNAEFD1LqYjsNCM4sP+2bL8xEMhP95JjcQMxPijXD80u6aHh1CQvdUPlG0p7
	8O05BjixGdROVWTh1O1sU8QeltRx6Y79XBzUYQS1DMI2uLA0FgSLRn82pl28yyWC/uVvOy
	61pEdOZBzkUegDYTg/1IFIVfZvIqNwY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-goJLb6X6NAmRcwLkJv9r8w-1; Wed, 21 Oct 2026 06:05:41 +0000
X-MC-Unique: goJLb6X6NAmRcwLkJv9r8w-1
X-Mimecast-MFC-AGG-ID: goJLb6X6NAmRcwLkJv9r8w_1792562740
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1dec05668so2433285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562740; x=1793167540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
        b=FRewMcef0oAUQTz0BCy9e/d6zB5pkiGWJZhHPtLWDswosgo4JTdR2z/cuaG85tfJC4
         IUuBp7DkyVplPCEfStzl9AD69mmqoXsGWG6m566ZNgpV3yQhA1r1+yylyNccYQboG2BQ
         h+2sAP/31DpuHQSMQxjY8wO8Y50nXq/fw1PrNqW8sEIKhJLBk2AnCUPgnMoURb/Zakzv
         LK40PDgbfIJDnK7ipwM5tHxRqbu6zC5EN/7XPGX4UvLEMNxX9aEPiVddkKhPQ8I5loxN
         6xtWpQgYU/Q9/VwcamAE05v1hRKNWW+gChPaIDMy5mPRKTDXK63wihnhogkuKarNj9w1
         ka2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562740; x=1793167540;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/7lyMAdO8fpbuawopvTUkUgysPqZTh82lxmIkmlslk=;
        b=FOOiUtkFCFljWUjljHyrU+32glgGImQypmV+XjdL0CD3hz/gNGwksxW6xtKeXevKEe
         0HRQsFWKid/uZNpnVefUCbz7imzHM3rNO5zpIXfTz9qk5Eh4svY/+WWTMUV8R2kCj4xH
         ydny+cjyRfGfD8AuX/XT1qhdFFU46068aQJq9Jydrhyo2wtnaiqc5jQjusRFAejxctcP
         kx58z59oUALPbRAgIR/yTRXSYCw0e8bGnX0accDJIanfHEdN9K925Pb74sOKw8VNn1IM
         ufF1BjD8No30JmBvxfoXGnSLkFz2883BtVz4ftl8KWz36t9hPmVrbEzGUJ7OyB9d5sVl
         /Ckg==
X-Forwarded-Encrypted: i=1; AKwUvBzBIZVu9LRbPlatWPBsWSRfg2uN8nuxYveS67a5mGxqOb4sc2JH+Zxyr5bzLFNpi0hlDcVIA4xrjtgkA2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKbuDm3XPzT9aUF3/SRc9e8YRCFpEhadpLq95bqPSy/JRDH4sU
	pZSRMtg9Zb10QhQctywODI2BGnaf0StMyH+ujQ0Zc53TSuRgYqq5uU7jwIcaT9QnksGwmN5PEqi
	1YcmdxVsUtMp5DTbnNXHkpyQts0nzgA/KQL6htkBLFsiwYHHoIYaJTvxESIF/hQmk
X-Gm-Gg: AYBFou3M+d2pu4itStRaWPnLAW6SQLxI5wfYyiVqvZmIJ8mXjkXJG0/wYMHiJwbglLP
	p+4IMZUK1TBC4J4Rk7fCynJ4tCbtYUn0D1wFBnpy/gJAI15ZgMNAxkOBqXZe50Neci2M68INia0
	N3jasOMPM5F1AIjJlr8INy0L5wMntDV74yshx+vVkK2qpDRyp0grPsbAlSlffrIwahFyNocCcfC
	PwqH7HkJvV+4g5U1w0H3EE9gshL8fmvDJl4ONGZxCS2QYGB73s3lF1tmeBgpOqNtiZZheU8WluQ
	I29SWVneRKnTWF41BvGb0Q5Pgh0GPR58aukGiRUY+XDtSn8qUavDSjMX2mxBbxY790VUgx5D6vj
	xP1MWpSCMGKOicbgRkQaDAfHejM3Nc0cYZnkd
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr14867875e9.12.1792562740256;
        Tue, 20 Oct 2026 23:05:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr14867095e9.12.1792562739786;
        Tue, 20 Oct 2026 23:05:39 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:38 -0700 (PDT)
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
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 06/12] mm/hmm: migrate collection in HMM pagewalk - pmd level
Date: Wed, 21 Oct 2026 09:05:00 +0300
Message-ID: <20261021060506.2377545-7-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
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
 mm/hmm.c | 172 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 151 insertions(+), 21 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 0ce947d0e572..5891efee3e18 100644
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
+		return -EFAULT;
+
+	hmm_vma_walk->last = start;
+	return -EBUSY;
 }
 
 /*
@@ -958,6 +1077,17 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
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
 	}
 
-- 
2.55.0

