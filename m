Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904054;
	b=5ckq3yTVMUXBNPNS58IcNTYROUKRa8yC5hAsjfD0E/PIi2YaGI326VzF2Kk2wwfTU4jQ
	 3a3nU4dHTG6t5r4TzrvTiYbRhSAeeYlXCFw65Mu6t7BCF/xR5OyxnGJrHznqEhdQzqceP
	 lgwriYMFtoSw9qESRnPXhanua425el9RDel2sWHZZqfrpU2x5JM5Ck2e0huA8uBzuwbIx
	 mPUlzySxuUtzKOLi7vMd3Q7p6gUtDaZZkdx/oUPNWrP9l/bNDfieiC0xr4IqvCS1Rao6i
	 a9+OpQr96an1FZMCnp2J3SV419uBS9I3MDbiOS4GsAxFI6fhhYuayrEEaGtHbjK3DMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904054;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pRke9NofnhxA5cWbmrI5yg/rv7Nj7oxJrxp6jL0TGAs=;
	b=HdXKz8xT0WCOgitjcK2NC9+ooTgKfh5MvJ/mBdYqUcidRAc9h4zEShXfjQ9+dXPrCaNu
	 uyLPniKMJwHjat0wkgfJCxaUrO9jp8WFFS1S+e8uHttnxUY6y9tfXm7QTJ+/8t1arA3er
	 EUBMfEkaaxjtLo0KFPQmDJ2ceXmcmO+XqjCRE2yaZ5xGCxK6pceWl+g9B9IgqzZ1zBGG9
	 ZpvACf0aqlG9lEgWaiHIUqGfQkjQIUp6ggzwPD2qa3SsXPLJCdA2GXxelyObgP91QEr8A
	 Tt3cvpW7bGUuw+QA+ifpVELTy4zCzumuq5tOfY/wzCggzI85yBIsz7YqzBTk+p31ESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TZsQdHtP;
	arc=none smtp.remote-ip=91.218.175.117
Received: from mta0.migadu.com (out-117.mta0.migadu.com [91.218.175.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92767606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92767606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TZsQdHtP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yqbRrj0HaVb260zeFB00lA2k9XcFopb5uVZAXfw5cDE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904052; v=1; x=1794508852;
 b=TZsQdHtPP7opRL3ZvwGtpMPmqdQO+Q5DPHw1c6ruPgMKxtBKHV53VV+0hTfeExlgHeYtXAEI
 wU+Xh6NXm9uXWxk2Kan3ozlkys9OydO50OKSbGEs4EiHWmTgHgYZGshTWwVcwAQe4SWR7QZB/NL
 Nbz7bk/bmC/nHS1K/8RFHsDg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 607661fc4bafeccc;
	Thu, 05 Nov 2026 18:40:51 +0000
X-Mizu-Trace-ID: 607661fc4bafeccc
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v9 08/32] mm: recognize PMD swap entries in the softleaf layer
Date: Thu,  5 Nov 2026 10:38:52 -0800
Message-ID: <20261105183940.2236717-9-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
before unmapping it, so an ordinary swap entry has never had to appear in a
PMD. Prepare for installing one there instead: the softleaf layer is where
every consumer decodes non-present PMDs.

Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
return NULL rather than interpret a swap offset as a page frame number.

Unlike migration and device-private entries, a PMD swap entry can also
carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
before decoding. Strip all three overlays unconditionally while we are
here: each clear is a plain bit clear, so testing first only buys a branch.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/leafops.h | 38 ++++++++++++++++++++++++++------------
 include/linux/pgtable.h | 17 +++++++++++++++++
 include/linux/swapops.h | 10 ++++++++++
 3 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 7c13c58a5e218..2871dabcf667d 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -98,10 +98,7 @@ static inline softleaf_t softleaf_from_pmd(pmd_t pmd)
 	if (pmd_present(pmd) || pmd_none(pmd))
 		return softleaf_mk_none();
 
-	if (pmd_swp_soft_dirty(pmd))
-		pmd = pmd_swp_clear_soft_dirty(pmd);
-	if (pmd_swp_uffd(pmd))
-		pmd = pmd_swp_clear_uffd(pmd);
+	pmd = pmd_swp_clear_flags(pmd);
 	arch_entry = __pmd_to_swp_entry(pmd);
 
 	/* Temporary until swp_entry_t eliminated. */
@@ -634,18 +631,29 @@ static inline bool pmd_is_migration_entry(pmd_t pmd)
  */
 static inline bool softleaf_is_valid_pmd_entry(softleaf_t entry)
 {
-	/* Only device private, migration entries valid for PMD. */
 	return softleaf_is_device_private(entry) ||
-		softleaf_is_migration(entry);
+		softleaf_is_migration(entry) ||
+		softleaf_is_swap(entry);
+}
+
+/**
+ * pmd_is_swap_entry() - Does this PMD entry encode an actual swap entry?
+ * @pmd: PMD entry.
+ *
+ * Returns: true if the PMD encodes a swap entry, otherwise false.
+ */
+static inline bool pmd_is_swap_entry(pmd_t pmd)
+{
+	return softleaf_is_swap(softleaf_from_pmd(pmd));
 }
 
 /**
  * pmd_is_valid_softleaf() - Is this PMD entry a valid softleaf entry?
  * @pmd: PMD entry.
  *
- * PMD leaf entries are valid only if they are device private or migration
- * entries. This function asserts that a PMD leaf entry is valid in this
- * respect.
+ * PMD leaf entries are valid only if they are device private, migration,
+ * or swap entries. This function asserts that a PMD leaf entry is valid
+ * in this respect.
  *
  * Returns: true if the PMD entry is a valid leaf entry, otherwise false.
  */
@@ -660,10 +668,12 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
  * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
  * @pmd: PMD entry.
  *
- * The PMD entry is expected to be a valid PMD softleaf entry.
+ * The PMD entry is expected to be a valid PMD softleaf entry that references a
+ * PFN, that is a migration or device private entry. A PMD swap entry is a valid
+ * softleaf entry but encodes swap slots rather than a PFN, so it has no folio.
  *
- * Returns: the folio the softleaf entry references if this is a valid softleaf
- * entry, otherwise NULL.
+ * Returns: the folio the softleaf entry references, or NULL if the entry is not
+ * a valid PMD softleaf entry or does not reference a PFN.
  */
 static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
 {
@@ -673,6 +683,10 @@ static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
 		VM_WARN_ON_ONCE(true);
 		return NULL;
 	}
+	if (!softleaf_has_pfn(entry)) {
+		VM_WARN_ON_ONCE(true);
+		return NULL;
+	}
 	return softleaf_to_folio(entry);
 }
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b7..70a302e6768e0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1917,6 +1917,23 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 }
 #endif
 
+#ifndef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return false;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return pmd;
+}
+#endif
+
 #ifndef __HAVE_PFNMAP_TRACKING
 /*
  * Interfaces that can be used by architecture code to keep track of
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 603f9e3f909cd..1742074d60100 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -79,6 +79,16 @@ static inline pte_t pte_swp_clear_flags(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_clear_flags(pmd_t pmd)
+{
+	pmd = pmd_swp_clear_soft_dirty(pmd);
+	pmd = pmd_swp_clear_uffd(pmd);
+	pmd = pmd_swp_clear_exclusive(pmd);
+	return pmd;
+}
+#endif
+
 /*
  * Store a type+offset into a swp_entry_t in an arch-independent format
  */
-- 
2.53.0-Meta

