Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686638;
	b=LatBsNEVwHfc9XNwooPzEn5qL143L0KuVHf3yyjydmi3eMW50r6zDGK2NtjV2FCf7061
	 i/YQZ1R+1FlI2T98E2qs75QrNa4b25SpQQWWdePp7ZXELjkNrUD7u0bwwItVeRQJjbfY6
	 1lldLYF6afhoQ3Na5AhABFP3OmBCUgopNTlwmoxS15gq/TCLnCLvDBqI+VvTVCkFY+x7J
	 Yn6rAFyA332k/NkuirvjZxIyhTqmOEiQ8RnZiM0J7266Drsf+mRo39240dopkmOFNmf/X
	 zEpfDhCEJvKd5GMt75xyGUG0XTEj9HZNZ962HTp4ExQGDZ6+NvLgxTq4tKKW29ZOYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686638;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jIc5h4IhkXIt4VgOmF6ym6QfRntQTchoUiwA4snRnC8=;
	b=y26/BZ5+apNwUY1JDpS18J9CTQE8G8VmaLMYthu5w/mcdHtRJiKapIpCoX1PLpevx1Fg
	 o7SEI7BHtuvjDXqS0LwKroetgDfhI0fqzR/IM/LYepF+qOuG/iGqUmMByXxGmsGjJqPM+
	 z7adIPrrzn5Ina2XYmYCxjm7M5Tae8jRGFFnt46f6jbia+Htg1EVnjlzaLrN21hHJSnhZ
	 gsuBFIhoaAzeMIowRo1AubawpqYoewr1CT22frLyH8mA/bsS8aH67QCCAxHD+N0hudcQ2
	 WyZ4xV+21B4KV4sz/8a50pYgt+VTZyJiWHgeFpctxMA96ZE3hTdItxbyO6Tnt8blm7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZDBgj1v;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U+JK0ddA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53370606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53370606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CZDBgj1v;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U+JK0ddA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jIc5h4IhkXIt4VgOmF6ym6QfRntQTchoUiwA4snRnC8=;
	b=CZDBgj1vzh6Kpwk3MSVJypcR1gmvM3LUGUq3i3mm573wwjZg8u1pmhyR6Tuw8FrydrDv4i
	vY4Adk25LKuz1pVr1ERdcD9yTAVAKBBa1HgU8OV3xrbZfVNz5ef3Je/WM04XCiCaTCNqm5
	B/F6p3pCJy8G4hq2fEbtCuFaizEA/LM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-i5cvd8eNOhGiqEs_Eq39sw-1; Tue, 03 Nov 2026 01:17:14 -0500
X-MC-Unique: i5cvd8eNOhGiqEs_Eq39sw-1
X-Mimecast-MFC-AGG-ID: i5cvd8eNOhGiqEs_Eq39sw_1793686633
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3accf0b1addso9816111fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686633; x=1794291433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jIc5h4IhkXIt4VgOmF6ym6QfRntQTchoUiwA4snRnC8=;
        b=U+JK0ddAa1ybBHFNf/t6EBIQNdgj5xWQlgWqZ0Rs5Dz/oavELYi2MnQYUGHc/Jr7x9
         5WmPVCPaX4BDddvWMa9xqio2ZRtgi6TIqs7MQLG9rvnJVtJz2akntn4IZAdKVGj3i3eI
         e2yXW33U8UMaDdHDeWy4xW5YitK3nxKo1djOFKt7WphFAZ/yC9WCY+kW93fitX6lWwF+
         P0kuK/xMOuNUnyACobbfOkuVC6ee9RqiHKWSpLxwELyF1Q6OHBugJgM1gXGDcIMdns6/
         ewOPMRjgQn2MEbpZqxzwsSM5+6CYpyQGPlUB1UsgJtQONk29jiI4fHZFlM8xMvRUIvXc
         NGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686633; x=1794291433;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIc5h4IhkXIt4VgOmF6ym6QfRntQTchoUiwA4snRnC8=;
        b=A8M9rrT4Y0RSFjoP+ehPGsxPyQSMWxl0JXXfrPjv90siAngbDNFa63ocYhqtGis8Wz
         CWMwdI/hJWxl5cXy1E4NvwqOH/n38HwIor1iAF2J1R6oncvTYMVmV97NL64+o2C2WEqk
         9axsDyUqNa5o0dCDj2OKLB4SCc7m+j782O29DhUzko91GVYvWrV4rzd43y8b38QL5rmU
         JmnDNFtPdx5pHEbKA2rKEwnwnBMkCHIMFMyTS9UgLwHFsGLyGhTB9bpWn0nnqJIjEx1C
         dMiTjN9OO2N5qiYMabAGLw4S99ZzpiJkdXcX2tk5TBUeBzQy0tEJLm53ZeyDg+ZHzSMo
         0VIA==
X-Forwarded-Encrypted: i=1; AKwUvByrHGgpzshrK6ZArsKY9mWd9t+spVjoCjnYoHcBEaK8C/VEPKoghGmvhibJ2RaLnb48jRO8sB/lwfWsR1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C2xR4DTKfIxiUQoO50wqIi+gy0iskCWw7v6fYhDO0m0GLsg7I
	RJyzmRUIYPRFUnl70QULCFt1rQFGaaBQOuCfHUaK0LSlgtp3zeFbYEmlzaPSYkwGEx3KqgXaBIb
	ch09iDg9/5sqQD396FcK8j9NzhnPiY2llDD4p2cNEpm3SoMroUQh62ruKQmG/YUR0
X-Gm-Gg: AYBFou2ddKFq3rIXR1Lg6WeW4AGvd8gpP7yP2wr17P8lruRWxoW3i8LQMZnzmsOYAhW
	8cS0IWR4Py8AA6HsDpNt/GMyeJstxQXJFuz1B7sA90Ear9xB8APvln4BDP2SliQ4cQKjte8u+RM
	qFG7LEu9YjXAvmHFrGiN//cptMIPhHguIN6raC2An6fWAh1vtwkMJBvOWD9FC+CHfHaZVHaFK8g
	ieGxohilArkR8beNSVvafxwkCirty2W4RX2SArpD0u0Iy2Ufg/K7nYRqZza7VTkNNquviEtHnRF
	+sXnbbGinWRGxrfoKSW+8+Hte6Q+2aRr59ZbMAncWhN4DVRqEThtk119TVKjURb9rffK/XkgkUs
	Brm5Ljyt1leWPGEnUUUIJe8XsCO6Y7nV+p8RCeBDfGzyWuwnmbJvdcg4aOuN6+1axOwmKjg==
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:51b with SMTP id 2adb3069b0e04-5bfe32c06cemr2651604e87.6.1793686632933;
        Mon, 02 Nov 2026 22:17:12 -0800 (PST)
X-Received: by 2002:a05:6512:ac2:b0:5bf:e32c:51b with SMTP id 2adb3069b0e04-5bfe32c06cemr2651592e87.6.1793686632449;
        Mon, 02 Nov 2026 22:17:12 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:17:11 -0800 (PST)
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
Subject: [PATCH v17 08/12] mm/hmm: implement rollback for device page migration in HMM pagewalk
Date: Tue,  3 Nov 2026 08:16:25 +0200
Message-ID: <20261103061629.972669-9-mpenttil@redhat.com>
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

During the migration pagewalk, the PTE table could be cleared and/or
changed into PMD leaf or even another PTE table while dropped locks.

In these cases the possibly inserted migration ptes are gone. We have
to however undo the collecting done so far, so unlock the folios and
drop reference taken.

During the pagewalk we notice such scenarios if going to recollect a pfn
but have already committed to migrate the entry with HMM_PFN_MIGRATE, in
which case do rollback. Rollback clears (HMM_PFN_VALID | HMM_PFN_MIGRATE)
which is safe, as migration is entirely driven by default_flags.

If we encounter migration ptes they are just skipped to allow for restart
own walks.

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
 include/linux/hmm.h |  22 ++++++++
 mm/hmm.c            | 127 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 4f56f3419cb4..b08ebc1343dd 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -111,6 +111,28 @@ static inline unsigned int hmm_pfn_to_map_order(unsigned long hmm_pfn)
 	return (hmm_pfn >> HMM_PFN_ORDER_SHIFT) & 0x1F;
 }
 
+/*
+ * hmm_pfn_collected() - is this pfn entry prepared for migration ?
+ * If collected the folio's refcount is increased and the folio
+ * is locked.
+ */
+static inline bool hmm_pfn_collected(unsigned long hmm_pfn)
+{
+	return (hmm_pfn & (HMM_PFN_VALID | HMM_PFN_MIGRATE)) ==
+		(HMM_PFN_VALID | HMM_PFN_MIGRATE);
+}
+
+/*
+ * hmm_pfn_rollback_collected() - undoes the collection of hmm_pfn
+ *
+ * Note for total rollback the folio's refcount has to be put
+ * and folio has to be unlocked.
+ */
+static inline unsigned long hmm_pfn_rollback_collected(unsigned long hmm_pfn)
+{
+	return hmm_pfn & ~(HMM_PFN_VALID | HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+}
+
 /*
  * struct hmm_range - track invalidation lock on virtual address range
  *
diff --git a/mm/hmm.c b/mm/hmm.c
index 690b73908f34..1c8a3fa29c4e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -95,6 +95,11 @@ enum {
 			      HMM_PFN_P2PDMA_BUS,
 };
 
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn);
+
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 			 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
 {
@@ -111,6 +116,8 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		}
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr, end, &range->hmm_pfns[i]);
+
 	if (migrate && thp_migration_supported() &&
 	    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
 	    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
@@ -239,6 +246,9 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 			spin_unlock(hmm_vma_walk->ptl);
 			hmm_vma_walk->pmdlocked = false;
 		}
+		/* Entries collected from a vanished page table are gone */
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr, end,
+							hmm_pfns);
 		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 	return hmm_pfns_fill(addr, end, hmm_vma_walk, 0);
@@ -274,6 +284,9 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	cpu_flags = pmd_to_hmm_pfn_flags(range, pmd);
 	required_fault =
 		hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, cpu_flags);
+	/* Entries collected from a vanished page table are gone */
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						end, hmm_pfns);
 	if (required_fault) {
 		if (hmm_vma_walk->pmdlocked) {
 			spin_unlock(hmm_vma_walk->ptl);
@@ -331,6 +344,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (!pte_present(pte)) {
 		const softleaf_t entry = softleaf_from_pte(pte);
 
+		/*
+		 * Our own migration entry, collected earlier in this walk:
+		 * keep the collected pfn, don't fault or roll it back.
+		 */
+		if (softleaf_is_migration(entry) && hmm_select_migrate(range) &&
+		    hmm_pfn_collected(*hmm_pfn) &&
+		    hmm_pfn_to_page(*hmm_pfn) == softleaf_to_page(entry))
+			return 0;
+
 		/*
 		 * Don't fault in device private pages owned by the caller,
 		 * just report the PFN.
@@ -416,6 +438,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 	new_pfn_flags = pte_pfn(pte) | cpu_flags;
 out:
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE,
+						hmm_pfn);
 	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
 	return 0;
 
@@ -427,7 +452,19 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	} else {
 		pte_unmap(ptep);
 	}
-	/* Fault any virtual address we were asked to fault */
+	/*
+	 * This pte needs a fault, so it is not our migration entry: a pfn
+	 * collected here earlier is gone, roll it back before faulting.
+	 */
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE, hmm_pfn);
+	/*
+	 * Fault any virtual address we were asked to fault. When migrating,
+	 * only this page: later ptes may be our own migration entries or
+	 * caller owned device private pages, which must not be faulted.
+	 */
+	if (hmm_select_migrate(range))
+		end = addr + PAGE_SIZE;
 	return hmm_record_fault(addr, end, required_fault, walk);
 }
 
@@ -454,6 +491,9 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		if (softleaf_is_device_private_write(entry))
 			cpu_flags |= HMM_PFN_WRITE;
 
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							start, end,
+							hmm_pfns);
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be
 		 * inferred, because drivers which are not yet aware of large
@@ -475,6 +515,10 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 				spin_unlock(hmm_vma_walk->ptl);
 				hmm_vma_walk->pmdlocked = false;
 			}
+			/* Entries collected from a vanished page table are gone */
+			hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+								addr, end,
+								hmm_pfns);
 			return hmm_record_fault(addr, end, required_fault, walk);
 		}
 		else
@@ -561,6 +605,51 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return __migrate_vma_split_folio(folio, fault_page);
 }
 
+/*
+ * Due to dropping ptl locks for splitting for instance, would we
+ * overwrite already collected pfns? This could happen when pmd
+ * pointing to a page table has vanished and been replaced with
+ * a leaf pmd, or another page table. In that case unref and unlock
+ * the folios, the pfns of which were collected from the disappeared
+ * page tables.
+ *
+ * Migrate mode drives fault/migration requests only via range->default_flags.
+ * (HMM_PFN_VALID | HMM_PFN_MIGRATE) denotes a collected entry and can safely
+ * be cleared from hmm_pfn[].
+ */
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return;
+
+	WARN_ON_ONCE(!migrate);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	for (i = 0; start < end; start += PAGE_SIZE, i++) {
+		if (hmm_pfn_collected(hmm_pfn[i])) {
+			folio = page_folio(hmm_pfn_to_page(hmm_pfn[i]));
+			if (folio != fault_folio)
+				folio_unlock(folio);
+			folio_put(folio);
+			hmm_pfn[i] = hmm_pfn_rollback_collected(hmm_pfn[i]);
+
+		}
+	}
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -731,6 +820,11 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 	pte = ptep_get(ptep);
 
 	if (pte_none(pte)) {
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							addr,
+							addr + PAGE_SIZE,
+							hmm_pfn);
+
 		if (vma_is_anonymous(walk->vma)) {
 			*hmm_pfn &= HMM_PFN_INOUT_FLAGS;
 			*hmm_pfn |= HMM_PFN_MIGRATE;
@@ -783,6 +877,10 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 		pfn = pte_pfn(pte);
 		if (is_zero_pfn(pfn) &&
 		    (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+								addr,
+								addr + PAGE_SIZE,
+								hmm_pfn);
 			/* Like pte_none(): only anonymous memory can be populated */
 			if (!vma_is_anonymous(walk->vma))
 				goto out;
@@ -929,6 +1027,13 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 }
 
 #else
+static void hmm_vma_handle_migrate_prepare_rollback(const struct hmm_vma_walk *hmm_vma_walk,
+						    unsigned long start,
+						    unsigned long end,
+						    unsigned long *hmm_pfn)
+{
+}
+
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
 					      unsigned long start,
@@ -1068,6 +1173,16 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			hmm_vma_walk->pmdlocked = false;
 		}
 
+		/* Our own migration entry, collected earlier in this walk */
+		if (minfo && hmm_pfn_collected(hmm_pfns_start[0]) &&
+		    hmm_pfn_to_page(hmm_pfns_start[0]) ==
+		    softleaf_to_page(softleaf_from_pmd(pmd)))
+			return 0;
+
+		/* Not ours: entries collected from a vanished page table are gone */
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, start, end,
+							hmm_pfns_start);
+
 		if (required_fault) {
 			/*
 			 * Someone else's migration: when migrating, wait in
@@ -1171,6 +1286,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		ptep = pte_offset_map(pmdp, addr);
 	}
 	if (!ptep) {
+		/*
+		 * The pte table is gone: re-walk from start, entries collected
+		 * from the old table are rolled back as they are revisited.
+		 */
 		addr = start;
 		goto again;
 	}
@@ -1192,6 +1311,12 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 				flush_tlb_range(walk->vma, start, addr);
 				unmapped = false;
 			}
+			/*
+			 * The pte lock was dropped and the pte table may have
+			 * changed: re-walk from start. Our own migration entries
+			 * are kept, anything else collected is rolled back.
+			 */
+			addr = start;
 			goto again;
 		}
 		if (r) {
-- 
2.55.0

