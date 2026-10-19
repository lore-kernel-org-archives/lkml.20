Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EA74A688D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400948; cv=none; b=obnYUSzWAkTFCl818KcXOcreFW46HI6gJREvpFazUBj1xacMsocT5TGuYWLL8kFgvmFJDyZCtU/YjTyHq1KdDLmNcDPhJkOvlLPtKk+wkqHzI6QK113a6fkZIaktL32+ZlvqCrYsE+Ajrpz6S2aK8qVm1DH6q4eZ2cmWPjmIgKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400948; c=relaxed/simple;
	bh=TfiuU59MNvL54WMbebXkORuEt7HqRjC7dQITwQ8gFi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJIEWUF+1DQNdUOskDZro6Y2VSdsuTe3QJ4kh0hYm5R/9Pkn1roYDj4Wo3b8kbp1Gb//tK1J0TUZKDwfC1GMwu+wWI6TNalGsDpU4y98OjVC6cxt2GDNXCGRH5DUENZrf06U1WMC/wWcJzfRiPqcGj7wfzbLzwzmd7BficsnHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Wk6PiAtx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Wk6PiAtx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8675375ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792400945; x=1793005745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MY99aGpYyrbJvUgE+53njDtXSNtzDrVyeLA7CiNpfcY=;
        b=Wk6PiAtxmTuJXtQ2D+IHT6zNZuyKf+qyjRAZ6+p/eKLW2RQnFIKoH56khlnOTP9h+o
         rzG2E/um7eSOmsxe6sQ5+Yz68Gk4hxh8SUZMM+ReAyRIUlvWB2qy0hG+BCD7P0eS9iwP
         4D4OLvhUVnezmxlzj0Jc+5eighnLokYAehFvbVgIQwVQRIltoTt/TZ3VzsS3nWb00ULj
         1FA6WSg83/Yb2RCFPHxbzTsGF04vuVIT4SL5Al2fES0cFy/pRYGNQsNTRoguAmRI2ebA
         fmro0MzB1Q5qWpBTTj2rdmwmPJgjquheQzTdbvgmMPPTXU+lsgfpiorxy/Sky0JB5RSS
         ZBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400945; x=1793005745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MY99aGpYyrbJvUgE+53njDtXSNtzDrVyeLA7CiNpfcY=;
        b=jVFusuIpPWNZtoOI9c82u5azyFmFwap6YRxF88MMnAHWUCUGM8HbZmvW1Ex3/2T+2d
         cmuuzOEMOER3Uu0rA68pfOystiigXCpH8C5W0AHYgz6nKiKaw+36PevEHmAdceRIggSw
         w++B03UGXIeRgb00GpSRtYgcL/1bc1JW46L8lxAhH7VAX0vn7ksbMLsxX7LZ706OnnYK
         kfWaeNodiyUT3DJXpG6AHRnvhp0L4Uzflm6GkZlvnaZcufsizbbErFnRTIbKDjYyqXom
         Q4a6IkHJ6vGhLCQ5pEFZjoA/P2L8cF/vjLxAHcQa8klTGY9/Sc3rOodt6B6VJEtgpukl
         BYhg==
X-Forwarded-Encrypted: i=1; AKwUvByCs+GGshscYnTDn75VxueifUrremYdGF3FAmR1qlE1cwu1+hjnCmTRcUHsITPy/I7l4BJuzu0lWZBf2y8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE3UpzXVwZ3+H+WK07pNBj84rR9c/7YdpMqSkygdr6bWow/WOb
	NZbGzQhVOzRLxgpNaInXvVj1YL2sTITP7083L1rTCCVrxvqtM+Ww/t2OUporjuOXzgc=
X-Gm-Gg: AYBFou1YP4Ur2kbAtQjZCNXGfjZrPljOs2PqiWUvphXSVH/6cdfmOO6RfLLVDBcI3yS
	xlsjMbTvFhuFjODhQbPd8aj2hatu8WBgAdjjot63IB24IONAnKQAHVgg83nI+KiaonqG5dqMDIE
	bY9qwYUmn2+UhBLk9lw/ssnRqXzFF2WYplNcYUaxQiapBo78Jp4qyatyY9Xb/yflyLKRlhgLSf8
	xTorH+sCapvwlCEl/v118ZH7FR6Wg2qYf6ZYmZfxlkQQCdVswIGl0sjAo2q2FWjBTBlbpSWeVRq
	6HAbrjxK64AB1MGgzTGqHAD18teXOaj1DnNllDiPeW3sf/hKt3dB/n9t2rFFmqC24lZaHpRmA9Q
	HlcwX5IxDwEgW7Oo0SLMEEU6EysxhMA+n3pPAymYK73x5ShN0Q2Nzj56gbBPFtVbON50zuUT35R
	kzdKDiLYblTH9CuyqavI04JosjBcyghHhhaNBF9wVZlXfwG9/BbazDk8ztd70xouOhkNqODkOnE
	530vX0+OoGiluKUPxg=
X-Received: by 2002:a17:902:ccd2:b0:2e8:1d5c:f6f9 with SMTP id d9443c01a7336-2e9a6f51258mr61061775ad.46.1792400945396;
        Mon, 19 Oct 2026 02:09:05 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e305f1dsm36707595ad.0.2026.10.19.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:09:04 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 4/4] mm/hugetlb_vmemmap: remove hugetlb_vmemmap_optimize_bootmem_folios()
Date: Mon, 19 Oct 2026 17:08:30 +0800
Message-ID: <20261019090830.1917657-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019090830.1917657-1-songmuchun@bytedance.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With vmemmap_wrprotect_hvo() removed, the bootmem wrapper no longer
performs any bootmem-specific work.

Call hugetlb_vmemmap_optimize_folios() directly for bootmem folios and
remove the redundant wrapper.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         |  2 +-
 mm/hugetlb_vmemmap.c | 29 ++++-------------------------
 mm/hugetlb_vmemmap.h |  6 ------
 3 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b37d7d0db7fc..64a21b7e820f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3297,7 +3297,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	struct folio *folio, *tmp_f;
 
 	/* Send list for bulk vmemmap optimization processing */
-	hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
+	hugetlb_vmemmap_optimize_folios(h, folio_list);
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
 		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 3d72346c2ca2..236e1db9517b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -588,19 +588,16 @@ static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *fol
 	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
 }
 
-static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
-					      struct list_head *folio_list,
-					      bool boot)
+void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
 {
 	struct folio *folio;
-	int nr_to_optimize;
+	unsigned long nr_to_optimize = 0;
 	LIST_HEAD(vmemmap_pages);
 	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	if (list_empty(folio_list))
 		return;
 
-	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -608,7 +605,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 		 * Bootmem gigantic folios may already be marked optimized when
 		 * their vmemmap layout was prepared earlier, so skip them here.
 		 */
-		if (boot && folio_test_hugetlb_vmemmap_optimized(folio))
+		if (folio_test_hugetlb_vmemmap_optimized(folio))
 			continue;
 
 		nr_to_optimize++;
@@ -626,14 +623,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	}
 
 	if (!nr_to_optimize)
-		/*
-		 * All pre-HVO folios, nothing left to do. It's ok if
-		 * there is a mix of pre-HVO and not yet HVO-ed folios
-		 * here, as __hugetlb_vmemmap_optimize_folio() will
-		 * skip any folios that already have the optimized flag
-		 * set, see vmemmap_should_optimize_folio().
-		 */
-		goto out;
+		return;
 
 	flush_tlb_all();
 
@@ -658,21 +648,10 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 		}
 	}
 
-out:
 	flush_tlb_all();
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
-{
-	__hugetlb_vmemmap_optimize_folios(h, folio_list, false);
-}
-
-void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list)
-{
-	__hugetlb_vmemmap_optimize_folios(h, folio_list, true);
-}
-
 void __init hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned int order)
 {
 	if (!READ_ONCE(vmemmap_optimize_enabled))
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 464192e32dec..d717d0d10960 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -24,7 +24,6 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 					struct list_head *non_hvo_folios);
 void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio);
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list);
-void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list);
 void hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned int order);
 
 static inline unsigned int hugetlb_vmemmap_size(const struct hstate *h)
@@ -66,11 +65,6 @@ static inline void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list
 {
 }
 
-static inline void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h,
-						struct list_head *folio_list)
-{
-}
-
 static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate *h)
 {
 	return 0;
-- 
2.54.0

