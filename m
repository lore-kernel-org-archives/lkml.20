Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333675;
	b=rQuU4UdT19MYmbd2Bm1voDPaby6mKFIfKHf1ZIFyWZrtpWfTijkpuM1l1F+VtzGvpV+P
	 AuzUyJjH0Me4i3gdlB5EbjHAb3YLqx7edmSAtSKysEgitnT5j722jic6x0YwAAqQeg97u
	 h4U7Ke/BsWsCXZI1hTt9Fu11ItwxiJJuciGObP8qlLgi3mjjfOjJXvpa/yWAC9wrFYMf+
	 V4X3S59Bp6zWceXpczV2ApNAxhD3tym+O1zOCZZm7kNWusl/Qp0C7QSwDsLQtrt1dR3w3
	 ut8/0ekhbntqTNMQswOHF7eRyjRa0ivzF36m3QZZktiMWD2haJ7uqmpPZZXtq3YPFMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pBX3osvzrvBpUa9EFYcJneROuN57Xe3Iwp54yQOPd4g=;
	b=gm0axd+tKAgx/3+xOA4mLRCPj7aLvQXq0HLnfRul6XwsNM/4gkVNL/yK/CpByH9ziTxS
	 NHZaksDAzTQY3e3gc7tOPBmy71gupbuFglAh4HZONNIG3t1zQUBlRG9IIoV4RhAWn/6Qh
	 ejCp4Tbr3rBUIGOslMLj5phTA5cL6bvuweJkGxnZgFliV4bRyq1TTApMa6Wmy6X2AXUvS
	 9F5JDs1WtoPqWNixfVWtC1E2JXdY6l4CHtVLW9bax1Y3UNKdYQDHzmTCryuHq/T6lx0k6
	 wkxvbhRhLDlH2pUGrc+WDC5ITe4zHUaMtn2tmLzMD6VBHZ2iizGqfn3BPoThwxcb+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xs3eFl7w;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FB606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xs3eFl7w
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso3618426c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333674; x=1794938474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBX3osvzrvBpUa9EFYcJneROuN57Xe3Iwp54yQOPd4g=;
        b=xs3eFl7wV90xFLUJdmKozfF8WywBn7xwdIBgsJCUaH53zXjfLutLDMYzyIUW3Rnx3k
         oESKIdVy5/tDuxihLRgCNzta5g6rH+KonKJYF05idsGNU9+sAbERoTXIXJ6JbbNP9BTr
         WtBAGoTWEJb+Zti1pgKkwtrfIpgccjzPmv2KGMt8yhQcOy/LDEGECpRhpdTAHfGmvBWH
         nJbBa+feWt3+f6ccgbjyjw72HTgshxzPmZTx6/ZESyc9AaB6dV4crpPAra78Nyi3nWta
         s8w0QRQ3LuqksWUDfGGYjVaqJUvcNzFCmu+jaeoGHEetyu5yJzs5A3qufpoBf0IpKsjD
         dskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333674; x=1794938474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBX3osvzrvBpUa9EFYcJneROuN57Xe3Iwp54yQOPd4g=;
        b=pEXRoAspsD26unOe2GIsQfSoFX2DMaObARHpJualkCvXrdKaF5wWsVhhhKdt+6UoEj
         X2GGp58cUw/kqZ3099zQvSeFVLq1xJqXS6066g5unmFwgkooNAXBkF7ryBlQDomo6yja
         p/5cM8UAZ24DGHxCzenrqa28vUiMadU0U00pb/upCyAmV9FJ9I/oIfnpsdkaRgtao8o6
         EhgSZT6iuTr66pmqS/iWnh5AfMKWREz+cYB5tQlYfWpikEhf/4qsxd5G4Ruub8cqcfFl
         GtaC8P+k9MjxRX8/vumoC/8w6+tEgEKJ5kV0OGSr/olah+A7GhE7lFCbQ62uU3UmPt0O
         0dOg==
X-Forwarded-Encrypted: i=1; AL+hErHIJCb5cI3vpPbP8BTPP97Q8XxzuAimgDq5K97cUGMSDMKdODvMMzd2r2s7LiI2SFdZzrxcU/uRGCZlmfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aWlP3GHQqgr3YwsHah5dDIjFL/RKriQ1kLzMOOUmhFxT02xJG
	yfU0pNMQ8tTiDVJdPQxNE3FmMRKoGzK5FzLdxPu66/2kzXdNvdTiqJ6l
X-Gm-Gg: AYBFou2WhmjYT+GQuyNZRO2IvV1SNK4TeULZpUFUgnOFDpRyvqSLnelXpKKDR5yqSwd
	3hPSsIMtkPWf8RNgBqrrqcWkImzVgk7Z8EHrhPAMmb8DeLNwrLH6S9SYsPDIVKZaw4UGDDtvhdM
	nrS8ZaiAP2G4GzgVSA3OfxG2CHKaJXIFjKPd2CtA+E/LzVUOHDpdqMNYZ703+2NrUB0KZYg9aEX
	MY0WR6sg9+q62HNarUVooPfypNAPhx5nBsiV4AaJpp7vFZQ8U+k1/lQYWcl/xhWOYQfEDQxF/aK
	elVQGuqKs8UU2xT9i5Jw69mMugVJ+AjRqwMnu0M/JtY+iukpxsWfTsflGE73QiIZ6UUb106MEi8
	H9m4YJQuDUkBjVag4xtujH96OqYJJ19BKyKwuvgdoEMPreQov8lX87ENXox1eF4VfVWBuY7jwOw
	UD9/nFMM2uY/3uPd693grBLWMNG7ckXnsN7CPdsj59K5IvRqVgSRKN3AGm4u54BCdttczzMuDMe
	ROBctyFn80+HUcF8eySRrHDW+ipRwvwEGP9xPYaKOc2SR5QgWkkxs0NV1AkLPVpYg+M92TgcxHW
	VbVlvXNDbLKDhYVGBkzSQg4WYaphKpmWxZC0Deub4Wgi62MXh8gx8Wh2zclledkcMnseI8osIzK
	OT7B2
X-Received: by 2002:a05:701b:42c1:10b0:19b:1202:77f8 with SMTP id a92af1059eb24-1b3b61801famr4896533c88.32.1794333673663;
        Tue, 10 Nov 2026 10:01:13 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:01:13 -0800 (PST)
From: Yin Tirui <yintirui@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com
Cc: ljs@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	nico.pache@linux.dev,
	usama.arif@linux.dev,
	liam@infradead.org,
	kas@kernel.org,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	yintirui@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC v2 7/9] mm/huge_memory: add struct split_pmd_state
Date: Wed, 11 Nov 2026 01:59:22 +0800
Message-Id: <20261110175924.2945538-8-yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110175924.2945538-1-yintirui@gmail.com>
References: <20261110175924.2945538-1-yintirui@gmail.com>
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

Put the state read out of the entry being split into one descriptor, so the
read and write paths can be separated without passing a long argument list
between them.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 160 ++++++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 72 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5abcd194bd4d..b179dc26dc8d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3239,6 +3239,20 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
 		folio_put(folio);
 }
 
+struct split_pmd_state {
+	struct folio *folio;
+	struct page *page;
+	bool is_present;
+	bool is_device_private;
+	bool freeze;
+	bool write;
+	bool young;
+	bool dirty;
+	bool soft_dirty;
+	bool uffd;
+	bool anon_exclusive;
+};
+
 /*
  * Convert the folio's PMD-level anonymous rmap into PTE-level ones.
  *
@@ -3258,37 +3272,38 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
  *
  * Returns: whether the mapping may still be frozen.
  */
-static bool split_huge_pmd_anon_rmap(struct folio *folio, struct page *page,
-		struct vm_area_struct *vma, unsigned long haddr, bool freeze,
-		bool anon_exclusive)
+static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
+		struct vm_area_struct *vma, unsigned long haddr)
 {
 	rmap_t rmap_flags = RMAP_NONE;
 
-	if (freeze &&
-	    (!anon_exclusive || !folio_try_share_anon_rmap_pmd(folio, page)))
+	if (state->freeze &&
+	    (!state->anon_exclusive ||
+	     !folio_try_share_anon_rmap_pmd(state->folio, state->page)))
 		return true;
 
-	folio_ref_add(folio, HPAGE_PMD_NR - 1);
-	if (anon_exclusive)
+	folio_ref_add(state->folio, HPAGE_PMD_NR - 1);
+	if (state->anon_exclusive)
 		rmap_flags |= RMAP_EXCLUSIVE;
-	folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR, vma, haddr,
-				 rmap_flags);
+	folio_add_anon_rmap_ptes(state->folio, state->page, HPAGE_PMD_NR, vma,
+				 haddr, rmap_flags);
 	return false;
 }
 
 static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		unsigned long haddr, bool freeze)
 {
-	struct mm_struct *mm = vma->vm_mm;
-	pmd_t old_pmd = *pmd;
+	const pmd_t old_pmd = *pmd;
 	const bool is_present = pmd_present(old_pmd);
+	struct mm_struct *mm = vma->vm_mm;
+	struct split_pmd_state state = {
+		.is_present = is_present,
+		.freeze = freeze,
+	};
 	struct folio *folio;
-	struct page *page;
+	unsigned long addr;
 	pgtable_t pgtable;
 	pmd_t _pmd;
-	bool soft_dirty, uffd_wp = false, young = false, write = false;
-	bool anon_exclusive = false, dirty = false;
-	unsigned long addr;
 	pte_t *pte;
 	int i;
 
@@ -3331,38 +3346,39 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return;
 	}
 
+	state.folio = folio;
+
 	if (pmd_is_migration_entry(old_pmd)) {
-		softleaf_t entry;
+		const softleaf_t entry = softleaf_from_pmd(old_pmd);
 
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
+		state.page = softleaf_to_page(entry);
 
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd(old_pmd);
+		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		state.uffd = pmd_swp_uffd(old_pmd);
 
-		write = softleaf_is_migration_write(entry);
-		anon_exclusive = softleaf_is_migration_read_exclusive(entry);
-		young = softleaf_is_migration_young(entry);
-		dirty = softleaf_is_migration_dirty(entry);
+		state.write = softleaf_is_migration_write(entry);
+		state.anon_exclusive =
+			softleaf_is_migration_read_exclusive(entry);
+		state.young = softleaf_is_migration_young(entry);
+		state.dirty = softleaf_is_migration_dirty(entry);
 	} else if (pmd_is_device_private_entry(old_pmd)) {
-		softleaf_t entry;
+		const softleaf_t entry = softleaf_from_pmd(old_pmd);
 
-		entry = softleaf_from_pmd(old_pmd);
-		page = softleaf_to_page(entry);
+		state.is_device_private = true;
+		state.page = softleaf_to_page(entry);
 
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd(old_pmd);
+		state.soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		state.uffd = pmd_swp_uffd(old_pmd);
 
-		write = softleaf_is_device_private_write(entry);
-		anon_exclusive = PageAnonExclusive(page);
+		state.write = softleaf_is_device_private_write(entry);
+		state.anon_exclusive = PageAnonExclusive(state.page);
 
 		/*
 		 * Device private folios are treated the same as regular folios
 		 * w.r.t. anon exclusive handling, see
 		 * split_huge_pmd_anon_rmap().
 		 */
-		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
-						  freeze, anon_exclusive);
+		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3390,22 +3406,22 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 * This must also happen before PageAnonExclusive() is read
 		 * below, see folio_try_share_anon_rmap_pmd().
 		 */
-		old_pmd = pmdp_invalidate(vma, haddr, pmd);
-		page = pmd_page(old_pmd);
-		if (pmd_dirty(old_pmd)) {
-			dirty = true;
+		const pmd_t pmdval = pmdp_invalidate(vma, haddr, pmd);
+
+		state.page = pmd_page(pmdval);
+		state.write = pmd_write(pmdval);
+		state.young = pmd_young(pmdval);
+		state.dirty = pmd_dirty(pmdval);
+		state.soft_dirty = pmd_soft_dirty(pmdval);
+		state.uffd = pmd_uffd(pmdval);
+		state.anon_exclusive = PageAnonExclusive(state.page);
+
+		if (state.dirty)
 			folio_set_dirty(folio);
-		}
-		write = pmd_write(old_pmd);
-		young = pmd_young(old_pmd);
-		soft_dirty = pmd_soft_dirty(old_pmd);
-		uffd_wp = pmd_uffd(old_pmd);
 
 		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
 
-		anon_exclusive = PageAnonExclusive(page);
-		freeze = split_huge_pmd_anon_rmap(folio, page, vma, haddr,
-						  freeze, anon_exclusive);
+		state.freeze = split_huge_pmd_anon_rmap(&state, vma, haddr);
 	}
 
 	/*
@@ -3422,33 +3438,33 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_is_migration_entry(old_pmd)) {
+	if (state.freeze || (!state.is_present && !state.is_device_private)) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			if (write)
+			if (state.write)
 				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
+						page_to_pfn(state.page + i));
+			else if (state.anon_exclusive)
 				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			else
 				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
+						page_to_pfn(state.page + i));
+			if (state.young)
 				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
+			if (state.dirty)
 				swp_entry = make_migration_entry_dirty(swp_entry);
 			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
+			if (state.soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
+			if (state.uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
-	} else if (pmd_is_device_private_entry(old_pmd)) {
+	} else if (state.is_device_private) {
 		pte_t entry;
 		swp_entry_t swp_entry;
 
@@ -3458,19 +3474,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * pages corresponding to the pte entries when freeze
 			 * is false.
 			 */
-			if (write)
+			if (state.write)
 				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			else
 				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+						page_to_pfn(state.page + i));
 			/*
 			 * Young and dirty bits are not propagated via swp_entry
 			 */
 			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
+			if (state.soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
+			if (state.uffd)
 				entry = pte_swp_mkuffd(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
@@ -3478,21 +3494,21 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	} else {
 		pte_t entry;
 
-		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
-		if (write)
+		entry = mk_pte(state.page, READ_ONCE(vma->vm_page_prot));
+		if (state.write)
 			entry = pte_mkwrite(entry, vma);
-		if (!young)
+		if (!state.young)
 			entry = pte_mkold(entry);
 		/* NOTE: this may set soft-dirty too on some archs */
-		if (dirty)
+		if (state.dirty)
 			entry = pte_mkdirty(entry);
-		if (soft_dirty)
+		if (state.soft_dirty)
 			entry = pte_mksoft_dirty(entry);
-		if (uffd_wp)
+		if (state.uffd)
 			entry = pte_mkuffd(entry);
 
 		/* Restore PAGE_NONE so an RWP marker keeps trapping */
-		if (userfaultfd_rwp(vma) && uffd_wp)
+		if (userfaultfd_rwp(vma) && state.uffd)
 			entry = pte_modify(entry, PAGE_NONE);
 
 		for (i = 0; i < HPAGE_PMD_NR; i++)
@@ -3502,10 +3518,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_is_migration_entry(old_pmd))
-		folio_remove_rmap_pmd(folio, page, vma);
-	if (freeze)
-		put_page(page);
+	if (state.is_present || state.is_device_private)
+		folio_remove_rmap_pmd(state.folio, state.page, vma);
+	if (state.freeze)
+		put_page(state.page);
 
 	smp_wmb(); /* make pte visible before pmd */
 	pmd_populate(mm, pmd, pgtable);
-- 
2.34.1

