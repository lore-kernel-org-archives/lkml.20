Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389885;
	b=tjeSr9ltuA7wgd+43h3nPQ0oBvnNPk67QW8xwQee8/Gi9WnqKF+gR1tO0O91oQhIK4OA
	 dZ+0gBf4u0iX0RE5Wd5TgwMGz680FbM2Kyw5rg5W8NPoj+BVHIzooRPpERYEYqKkwRyiv
	 4TkPf/yYEg8Gr9Z3PT9EoChUk48QykVCWlwRmfz10Ewr58e8jK1rjXwbMOMQ2Xue2yk+t
	 RA2pGVqU6XYzzO557tc6Dhn4ieueCIiOKsuKqa62EjQ3U091eJQ1nSvNTQ+cJe/R+Ac+c
	 2nyzjnUAbws22wEV99ZZDb36xvykhCNCj7PIs7xK6TK5DYet+9rnmWKXqH6e6f5A06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mlI2hSgARAsESdSujlJ/ayVkPK6G1sKTaez08nG/rjk=;
	b=pUs4JuuzelY/Yj3XhfbzQk8WfD9FmFsF21eutkf98PV7rO3Phaa+ud+jNUjuAEjFDqrR
	 aJn+BAON6h+kBJfn2GUCMiIlxTQwPHYAZpsQZUYEKBkMGEakQpOaQg8yNZLL12x4C4p2i
	 P/1boDP5zQb/psxXy3x3jt9ZSgk02Vn3xGBwuZVSOP+b8YNDbnZx8T0c7e7jXmWK70FK2
	 BmiwxB880CTuafEY3z6I9c8sXOROM2S5eJttboSntoJwpIZ9RB5ilLzk+g2m4x6PMAEp/
	 7JHtRPE2lWLu7n6Ef+IsEv2KFCD5K6vqPCU53b+shPhWjZ4C9ca9z77BXWMM3o+yAng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zgm48Ofx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF7606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CBF7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zgm48Ofx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5859651eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794389884; x=1794994684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlI2hSgARAsESdSujlJ/ayVkPK6G1sKTaez08nG/rjk=;
        b=Zgm48Ofxl21FGBkrlHF5gDrVbftQ+STGBI/4ooxBGqMSJbydCwVl6sCHL5nFtygXi4
         uGFNmpJ49L/NbICbOyiM36wpnxVf+MKDQn14BWDQdOYVJxvxfBt785yqWKlAJ5m9daCh
         H3zBqbdeLM3chDniXlZK/INvjPIv4mpA7Xs+zxEd56A/bHskYVLW+22DVLajn5qtRujz
         dYo+xyLgFT/M08FIImBdetnP0we98esiK3nmppdvt6ejCNLSqAPlq0+VOGkMgObThUST
         2yQKzHIg2zBEbTE+z2oSTU8DUePWZAfk9o+ObEVgzkAcYrw1JrHh0NIjr3j8g/LZBO9A
         KLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389884; x=1794994684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlI2hSgARAsESdSujlJ/ayVkPK6G1sKTaez08nG/rjk=;
        b=W+7H3Qs24GZ5CUZ23rN50A/7bZntoHN9HsJ7UpIgM0kLd98BzJZuT00ofcqzSM9w7D
         v/NwukDgClQD2w4wYt7knfpkxQIBj1kY/Rc7zNkpUWBdeNiV62l9bhl1gHCUNv45ijo1
         WwvGo5y/E7ZKwoSr1cWK3k+1l+67t6xTmM7CqQfNx0T1/mkGi8tC43G8yag7PBGfI+62
         1qDFBpviIRsycs60GpxttTbrxFMGVQ1jau6XohBO2AZhO5+VcuBOenmaIx0wjQc8+wrd
         V743NDLHHglsiQ5uU9X/SiIUVkgVMCWwwPyK6BytDcaRHA/lj48p5iCX7EQ601w2uVgG
         DZiQ==
X-Forwarded-Encrypted: i=1; AL+hErHkb5DeZdx91yepUEPPeCU6KM+1DSiYMpcN5lpa8IELrWevFu30eK+2p5CqZ7BslO9P6IS0bGRCtlMZVQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mxt0JVVu1G4VkRvAvmYOHWmcyfuut2UKjrpzQvNbMNNa/AFl+
	QkscPlo3GF/ltc57E5/GYo+1ixbF1CpiWWGrnHoOdD4JjVLlZLluKb5X6DOOhblGO1k=
X-Gm-Gg: AYBFou030IEEFPYddY3+lgPgmRe4F7bQKjprcRb/mO9qzsJpq04BeoWaH1KzoplWeDc
	K0jgY5ldt3HYwZYJqPZQN9h1m7D1V7mTdecG3OGA3nK+3kcgvcpbdQBQj99wBIF4Psb05qL1eAL
	3UKEsW1Lx7AWeaEp54vZEraYhRJ9HqEciXY5Zq0u1FEi4DlWb0qnvwFWYo2nlpRCzSK6OQfbOkj
	65/9ntIO4GWyMZVA9aJElkxc5pilXZmv7Qd/k/CGHVrdnfiCx2SlwCJ0gEhoFn/UjRE2VceUW/N
	aLMm9YYPODpd++z9DmYRa4eilCAprWtuw9dCYBwpX/Mxu6+hL6gCp8f47Ysx7BFpwtkDGnQV+Tc
	gZPmeRUe0aU/fIhl8osi1NlT2jFBP9zARsuVPrHqF/K3pcNHcZXpaJcF+EgA2RvHAaKQ3GDyXQA
	QpmgCkMcWtvQZXOck+jw1AVNzsZwToC400Pl96WxOGPJ9RPO7ETDhV08OEYckMVk20JKIHK2VNs
	7jrfkRg9uT1NMgMmUODGx5TzgTxqBN2KXimiHazw4qYoiehIVKykl9SWWdVSd6jwOXDlFZZMZ1J
	29Ld7WLSzEsLPqc0aKoJZSN+qAxBzAJmX+XCytndKRylLAdSYDoJe6E9Is0QAME=
X-Received: by 2002:a05:7301:dcd:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-37685c7a46dmr2269843eec.11.1794389884220;
        Wed, 11 Nov 2026 01:38:04 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm29016749eec.23.2026.11.11.01.38.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 01:38:03 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miaohe Lin <linmiaohe@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] mm/hugetlb_vmemmap: fix PMD split TLB flush race
Date: Wed, 11 Nov 2026 17:37:45 +0800
Message-ID: <20261111093747.50048-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111093747.50048-1-songmuchun@bytedance.com>
References: <20261111093747.50048-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bulk HVO optimization converts vmemmap PMDs for a list of folios into
PTE tables before issuing a single global TLB flush. After publishing
a PTE table, a concurrent single-folio optimization can observe it and
remap its PTEs before the deferred flush:

CPU0                             CPU1
hugetlb_vmemmap_optimize_folios()
  hugetlb_vmemmap_pteify_folio()
    vmemmap_split_pmd()
      pmd_populate_kernel()
      /* TLB flush deferred */
                                 hugetlb_vmemmap_optimize_folio()
                                   vmemmap_pmd_entry()
                                   /* sees a PTE table */
                                   vmemmap_optimize_pte()
                                     set_pte_at()
  flush_tlb_all()

Modern MMUs permit overlapping TLB entries with different mapping
granularities only when they translate to the same physical address. In
this race, the stale PMD translation still points at the original vmemmap
backing range while the new PTE can point at a shared or replacement
vmemmap page for the same virtual address.

Serialize deferred PMD splitting against PTE remapping with the HVO
rwsem. Hold it for write across the split-only pteify batch and its TLB
flush, then downgrade it before remapping the folios' vmemmap pages.
This guarantees that no PTE remapper can observe a newly split PMD until
the stale PMD translations have been invalidated.

Fixes: f4b7e3efaddb ("hugetlb: batch PMD split for bulk vmemmap dedup")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fbdc3410-a4cf-457e-88e6-684380fbadfe
---
 mm/hugetlb_vmemmap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 79ca68dff635..6fba3184356c 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -311,6 +311,9 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
  * is skipped, the caller must flush TLBs after all pteify operations are complete
  * before remapping the folio's vmemmap pages.
  *
+ * Note: The caller must hold vmemmap_remap_rwsem for write from the first
+ * pteify operation through the final TLB flush.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
@@ -321,6 +324,8 @@ static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 		.flags		= flags,
 	};
 
+	rwsem_assert_held_write(&vmemmap_remap_rwsem);
+
 	return vmemmap_remap_range(start, end, &walk);
 }
 
@@ -400,6 +405,7 @@ static int vmemmap_restore_folio(const struct folio *folio, unsigned long flags)
 	if (ret)
 		return ret;
 
+	guard(rwsem_read)(&vmemmap_remap_rwsem);
 	return vmemmap_restore_range(start, end, &vmemmap_pages, flags);
 }
 
@@ -568,6 +574,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	if (list_empty(folio_list))
 		return;
 
+	down_write(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -592,12 +599,14 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 			break;
 	}
 
-	if (!nr_to_optimize)
+	if (!nr_to_optimize) {
+		up_write(&vmemmap_remap_rwsem);
 		return;
+	}
 
 	flush_tlb_all();
+	downgrade_write(&vmemmap_remap_rwsem);
 
-	guard(rwsem_read)(&vmemmap_remap_rwsem);
 	list_for_each_entry(folio, folio_list, lru) {
 		int ret;
 
@@ -620,6 +629,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 	}
 
 	flush_tlb_all();
+	up_read(&vmemmap_remap_rwsem);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-- 
2.54.0

