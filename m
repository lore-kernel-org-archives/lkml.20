Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E25372B5A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942299; cv=none; b=dLtjSiWUch3Ro9PiXPvhAiS0fb+dGEMMDBigcqnYehKv2c74eHfH4uCd4WBpYQdSAFZomKNODuvbLWXgkEqnIrNbLEPmB8dxentnalqVdc0trCsARX3Iz0GYi4g+po7Ym/b5GzPuq/YQhi7qDFecvPycPptICGpSk/J+eMwOWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942299; c=relaxed/simple;
	bh=Rf485JwcWlHF+00e9hXUSMYaTdPU2gja5rXNVnGjo10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c80LTaw5ifax42GMc37QpJwqVMT1kDxkDQvcLcYFetDWghBSL/qltJyqJ6/C8c9KplZtvyuOQ5/cNacB2k6wt8MLgNQ6ehDqFroV4zWXa/IauuyKZTtLx25xnPtZRzyjggnGc0YIbeJL+8DUMpWM4ZelYW1JMv77Fw+PG1kr8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNV0OYvz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNV0OYvz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so1832334b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942298; x=1788547098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3nAcDLCkfTKlmodmQ0boAx10KLIo6Vy0ud2mfcvPW0=;
        b=hNV0OYvzATsAEJkY7fPSbN1Hi2uqcSrGqR5Xc3YItCPr5DwEeKKng8VFro5qM1Ixet
         EaEHW5yC7XNa4MqgonZC4qpfiDUmgBDNa3cMHQuL9HidbxOMpP7Xc0eeRflPvA9HQFew
         47zJDhyJV4KhpvCX4bzO9PO/2f47MATpgyzCZsiemoVUJ2rW1Q4HZACzmoqNbFaL28oU
         iwvKKhSLW9bH/c5puuaXqom+WoIb/yMAIFwh2O8klSGfzLZu4c4VM2vj6in1hZhMxgww
         5LR0/tSodgjNpBhxiw6keYGz7u2nmsIOlueSixwUHS7pewkDDchYlFjbanpdguA9Ennq
         yqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942298; x=1788547098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3nAcDLCkfTKlmodmQ0boAx10KLIo6Vy0ud2mfcvPW0=;
        b=BX1L0s7Gam3YnMGiPBUiGVrS4A5jb9wPMLzPPKkHKFQZB+iX8sK7j/xtL55N5JisCj
         cn8+FWmfpQvDqFF3bi6iieQ6Kkn1buuIPa1RpeWf6nSV/TpWpaUoyHz3kmtvLEXmVETB
         fGUZTkD8NkJWBZ8pQCoaHT/VuJvpRkeSVse8X+E2n4j4wG0bH/fe8jLgpTs21DuMdk+j
         YTG153Gsfm2hIttuvRk6pFe1cq0waa0ElO1wTBphpjJPFoDeZCKK20FB0042d9AWe9+/
         KNsTY5ClUyhFhf7EdVizf0Neja8SXhi+0LUIDm3XhHHEUtyipPyGsQ9BtaOTM9evUgpF
         esLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHFLwZTWwUw9xxT9DFQkgYE3lNYf6iTJFdT4vrdfBfw1I6L3Nn5oYz0BCXoIx8z724BjOADk3SoTE/5cg=@vger.kernel.org
X-Gm-Message-State: AFuF++mkjqaV69dPXCds2eKXIGjbGznTXXg0Uh9YVk25rKWSE2MoadH7
	ZtJ2IbLluBW0n5gvS3WkU5gMF5v7VSD3ISBmo7hY9lXZbw0asEOLNgSq
X-Gm-Gg: AR+sD13oXPTEcF01eJEV/IaAwboSdHkm2D7KuATWY8kznCgz+yOaxxcTW1LLTH1priX
	6Qe3FJSqHbzFQ+lEtEBS2UtpYDAqwESIOEA1fP4LN1YMU8L7hdMcB6QrQTIBecXM8vCWxVyIMjS
	evQPRf5JI4ezyA7sFVCpUr3vl52WKk714TdJWglrlTD9wV4rlzww3ADVJ12PxoGA/X2mOGyAzM2
	UwKD0vn8Vc4k0XSPwdNZPIduUn0Ncuqdx5Lir/LN7Z09vlTbHLASq7KxL69aTB3hVLLIsIikfHI
	1yVDPJIMdhQKFoA0+aa7yUM16qc6zlJMqihlvabCJZZMPtrvyM1iwcd/t1Jf8Lu0BLYdcywn2ce
	2E7M9kDPRX1SZq+XNddo7oxd1++uUuLxsC8aPEA2zLZ1dDeFwtfXQpoR0ycym0Qmthfjkl5aEpv
	+55D1uxsZWwZu2nEOoJpK9Y6T+Y3UGtclzWT/l1zX29tb2LoRnMyq1kE0nqkbEq445spYGIH6Tt
	3seKT7zHBFaTjTisA==
X-Received: by 2002:aa7:88c1:0:b0:857:726d:2708 with SMTP id d2e1a72fcca58-857726d2e5amr2500397b3a.20.1787942297709;
        Fri, 28 Aug 2026 11:38:17 -0700 (PDT)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fa3sm844230b3a.37.2026.08.28.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:38:17 -0700 (PDT)
From: Yin Tirui <yintirui@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	wangkefeng.wang@huawei.com,
	chenjun102@huawei.com,
	linux-kernel@vger.kernel.org,
	Yin Tirui <yintirui@gmail.com>
Subject: [PATCH RFC 9/9] mm/huge_memory: unify the migration and device private PTE loops
Date: Sat, 29 Aug 2026 02:33:19 +0800
Message-Id: <23d7c10efec57be848fd158f786473aa3b2f6e5c.1787941780.git.yintirui@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787941780.git.yintirui@gmail.com>
References: <cover.1787941780.git.yintirui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When splitting a huge PMD into non-present PTEs, one loop installs
migration entries while the other installs device private entries. They
differ only in the leaf entry they build. Build the entry in
split_pmd_make_softleaf() and use one loop.

Freezing still installs migration entries even for a device private
mapping, as before.

No functional change intended.

Signed-off-by: Yin Tirui <yintirui@gmail.com>
---
 mm/huge_memory.c | 89 +++++++++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 46 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index fdb751a1e525..8e0fd11da3d7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3245,6 +3245,42 @@ static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
 	return false;
 }
 
+/*
+ * Build the leaf entry for the PTE entry describing @pfn, for a huge PMD entry
+ * which is not restored as a present mapping.
+ */
+static softleaf_t split_pmd_make_softleaf(const struct split_pmd_state *state,
+					  unsigned long pfn)
+{
+	softleaf_t entry;
+
+	if (state->is_device_private && !state->freeze) {
+		/*
+		 * anon_exclusive was already propagated to the pages backing
+		 * the PTE entries by split_huge_pmd_anon_rmap(), and accessed
+		 * and dirty bits are not propagated via device private
+		 * entries.
+		 */
+		if (state->write)
+			return make_writable_device_private_entry(pfn);
+		return make_readable_device_private_entry(pfn);
+	}
+
+	if (state->write)
+		entry = make_writable_migration_entry(pfn);
+	else if (state->anon_exclusive)
+		entry = make_readable_exclusive_migration_entry(pfn);
+	else
+		entry = make_readable_migration_entry(pfn);
+
+	if (state->young)
+		entry = make_migration_entry_young(entry);
+	if (state->dirty)
+		entry = make_migration_entry_dirty(entry);
+
+	return entry;
+}
+
 /*
  * Replace an anonymous huge PMD entry with a page table mapping the same
  * folio at PTE granularity.
@@ -3281,53 +3317,14 @@ static void split_huge_pmd_to_ptes(struct vm_area_struct *vma,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (state->freeze ||
-	    (!state->is_present && !state->is_device_private)) {
-		pte_t entry;
-		swp_entry_t swp_entry;
-
-		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			if (state->write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (state->anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (state->young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (state->dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (state->soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (state->uffd)
-				entry = pte_swp_mkuffd(entry);
-			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
-			set_pte_at(mm, addr, pte + i, entry);
-		}
-	} else if (state->is_device_private) {
-		pte_t entry;
-		swp_entry_t swp_entry;
+	if (state->freeze || !state->is_present) {
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR;
+		     i++, addr += PAGE_SIZE) {
+			const unsigned long pfn = page_to_pfn(page + i);
+			const softleaf_t leaf =
+				split_pmd_make_softleaf(state, pfn);
+			pte_t entry = softleaf_to_pte(leaf);
 
-		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			/*
-			 * anon_exclusive was already propagated to the relevant
-			 * pages corresponding to the pte entries when freeze
-			 * is false.
-			 */
-			if (state->write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
-			/*
-			 * Young and dirty bits are not progated via swp_entry
-			 */
-			entry = swp_entry_to_pte(swp_entry);
 			if (state->soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
 			if (state->uffd)
-- 
2.34.1

