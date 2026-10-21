Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562751;
	b=BAM3kV9w90poIDDpnnZntLZL/KQ8cIP4PE+4DR9yb5DbmkJ5B46VHqaLs8cl+fBm2/LN
	 19yY5cCzk3FX9K+C0lpwCei/h4z2Xdvq15JsadDXBANrTzJQnSOkRjPCISqA2p9Q4NfOa
	 rIfPfWUG9qmqT/4gxwV6NrXkKJQe/+owlEok8CTunqWIbzeHpoQwKw8GFS+PMGwFD85v8
	 q++0aCIdgxdnb21SXm2I139m0ccSZ3aivgrnxlGJsMbeunI/eX/38ySB/53lcjWqyEKqa
	 Ul5NzPce3828KShy1m+fzCsfMvlD8KyiH6Ag4yzIwZwo7zfM/x2dbeRSA/pkLfnggoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562751;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
	b=yQZnJOoeX7sIdKtJ2Of5o3jQT70QgJRTMDLaGsg1yPMYfGLq+HcMb2WTOPX4qApziSkM
	 bCbtmmfNpEHnvyKesQQ8Bnu5oefZ2aGyNUt1mn6h7iHkGbqKVwnqaGnjZJ0PSXYwl2cG9
	 YZUIWqmG5j6OmP6aKr7PB54642LtV2Ws+WHVl7ZOszfKAkEaYUW4kAAeCNa7TQv1encXQ
	 V960AT0iCXkmoSnNZRl+oPFQaDSGbMdBXRHqr0McQcPTtbR/MgANBbzPQ9/wNyHccuXni
	 /XSEKkUDsTPrFr/vEs3nlUXt3hLocvNMou62F+XRTQN5epmp0sxDW7pKFirPikGwbMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXeZI6kU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="g4L9b3/x";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2D60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB2D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXeZI6kU;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g4L9b3/x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
	b=EXeZI6kUf+QPsUzdPW3GT09nHdxQJTeM9T6ZcS1gPJx3ApcEHxUKAl+c0AOvY6LETf+eau
	GhASGBZ8zan7OIkH66x56Dv1kVKczDdJKcUIa6uQ+0eDbIcr6QMYsDYI8i9OnsIY1nmU//
	BF68yTpsnVeTHdWupTU3keKyTJrzBU4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-ZkG6G2ilOZKlg9wCOqFf_w-1; Wed, 21 Oct 2026 02:05:48 -0400
X-MC-Unique: ZkG6G2ilOZKlg9wCOqFf_w-1
X-Mimecast-MFC-AGG-ID: ZkG6G2ilOZKlg9wCOqFf_w_1792562747
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1dc95bd3bso2124215e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562747; x=1793167547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
        b=g4L9b3/xQ5KiOgbkEl7QVyjM4NsUs7f+OKEKuZ6fk+uLnw8bCTcL+HG3jei1tadIxP
         d7Lanje0CX77hOF1HXJrU/TSIo++iiV3njiuqpaRQRbSRdY1bd5qpofcLKXtIsFgJzaC
         HcL6oFhgKkZGSlMon4ASzCNE7wEQNZASx75dVf2vIuj9H5WV5Meuc08ELCEnTu6ntP9o
         sHI3kk+NOfcmo0bP+xmC92pDtWkV4GQ+17AHn6iq6g+J9MwX3JvvgYDE2B3ALkp7tRWd
         DGajT46HYSZPSMB2NHGxTtyZlTPsuBrTjeAU1QpbjhUmHXwFWD3lV2rXPArQca41g+vz
         1dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562747; x=1793167547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJkX/xjNUMT8lfIvEdgG314iYnxdnOBpym4KTOp3llE=;
        b=j2suIbzb5cCWV0JlLjNzHoqCZsBGEW9dtD0QuQetZ3dswgb/EOv6RoGqmKoLLtcMoM
         c7I59aMJXc8tmMjFd5ItaaYrpfRYE1NfNVDNKCrB+wmy0OPl0pmKDXnZH5H4qJroIjui
         7AMN+FLiOXh3olyX+DWZ7vsl8oadNe8QdWCZJDkp9uzHGHGKaKp/ZMSp/OI9FuhRD+s8
         LmM1W4/KZiBlXLS6tKvRmzDQCP/5N45oRyvWmAnSYksodvt4SiNrzGRlJfcdJQ9onfAM
         8ce7EhKCC5/6cIWKqP2uY0mnqhUavsG73+D1vtANiKfSGUWJkf6wnv750i//YNXOgi1r
         b4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBymqIOq6eCFHFJ2uz7d6gjwCvz7ujuFn1+P9H9UeAeLYofuaA+yru+KtDed9BTHOgU8+yFSSBMYSe+AQWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/YD8En7KTdaM5pyhzdjm4nzjGK946pzl+7L055/yGT2369sv+
	kacAdDdiSlGM2gYpRpZunUfFOHtXg5HISbp+w+weaRqLnmdiuwhGa+5jp5ONgP42evC8UGMPr9K
	GelplyNqN7ziFFlXsUMYzie2l6iAq/bHzirSU8yr4dMNyR9iRF3/XXIitWb+KuNMn
X-Gm-Gg: AYBFou0xHDly9FXi9BorqX6fbBqFezJybcjHXGZDvbHG0UB9GU8ow0o2etQDT1GluqZ
	Q+2dZZDbLgr64mr2rtnsO7gGGYV9tYoqmbWEMQp3N4kO71rCcwgmtjY22xhpprKBXYdNe5RW8ke
	+QRQvWSRYt6bc//M/wETRXRYnhmV/s4E8pzl0Ne1/y1tx3Bg0GYrRf+vVVGx4OLl/ErVy5ATxbg
	wsrrF3clvM13M5ptq554LVSpArEPhAgG68b04QD5zZuWxXKqK9NqLrs8EC99xieQtvkSQx/bOJj
	G9o3/vbljDP249jDjm1dm+6TaNpEUE7oy03iUCvukt0hhy6L3WTo1svx+OG6g7oiMZjX6JaJKkn
	b2UBZeSyrRZJXca5GRcC1CcZKjJ5tzVmkFAQK
X-Received: by 2002:a05:600c:8012:b0:4a1:ef1f:a27a with SMTP id 5b1f17b1804b1-4a1fdd396ccmr15655755e9.27.1792562747381;
        Tue, 20 Oct 2026 23:05:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8012:b0:4a1:ef1f:a27a with SMTP id 5b1f17b1804b1-4a1fdd396ccmr15655265e9.27.1792562746857;
        Tue, 20 Oct 2026 23:05:46 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:45 -0700 (PDT)
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
Subject: [PATCH v16 08/12] mm/hmm: implement rollback for device page migration in HMM pagewalk
Date: Wed, 21 Oct 2026 09:05:02 +0300
Message-ID: <20261021060506.2377545-9-mpenttil@redhat.com>
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
 include/linux/hmm.h | 22 +++++++++++++
 mm/hmm.c            | 79 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

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
index 36a4edde9823..5a1471fd5d28 100644
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
@@ -282,6 +289,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						end, hmm_pfns);
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
 		hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
@@ -412,6 +421,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 	new_pfn_flags = pte_pfn(pte) | cpu_flags;
 out:
+	hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk, addr,
+						addr + PAGE_SIZE,
+						hmm_pfn);
 	*hmm_pfn = (*hmm_pfn & HMM_PFN_INOUT_FLAGS) | new_pfn_flags;
 	return 0;
 
@@ -450,6 +462,9 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		if (softleaf_is_device_private_write(entry))
 			cpu_flags |= HMM_PFN_WRITE;
 
+		hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+							start, end,
+							hmm_pfns);
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be
 		 * inferred, because drivers which are not yet aware of large
@@ -568,6 +583,51 @@ static int migrate_vma_split_folio(struct folio *folio,
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
@@ -722,6 +782,11 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
@@ -769,6 +834,10 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
 		pfn = pte_pfn(pte);
 		if (is_zero_pfn(pfn) &&
 		    (minfo & MIGRATE_VMA_SELECT_SYSTEM)) {
+			hmm_vma_handle_migrate_prepare_rollback(hmm_vma_walk,
+								addr,
+								addr + PAGE_SIZE,
+								hmm_pfn);
 			*hmm_pfn = HMM_PFN_MIGRATE;
 			goto out;
 		}
@@ -897,6 +966,13 @@ static int hmm_vma_handle_migrate_prepare(const struct mm_walk *walk,
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
@@ -1117,6 +1193,9 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		if (ptep) {
 			lazy_mmu_mode_enable();
 			hmm_vma_walk->ptelocked = true;
+		} else {
+			/* The pte table is gone */
+			hmm_vma_handle_migrate_prepare_rollback(walk->private, addr, end, hmm_pfns);
 		}
 	} else {
 		ptep = pte_offset_map(pmdp, addr);
-- 
2.55.0

