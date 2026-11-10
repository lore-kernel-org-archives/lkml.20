Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333703;
	b=Z1Dsnkmgo7qWz046nwXimpLtLSpdX4KF8yb/f/Lfffyt9dnsjSZ8z0bxPZMxec7hFlzA
	 LiziSXxSHRu6N0fp+H8LubUTo+Fruqupl/a3KWSlxq6Ouxlcm9itLmjk+erN34yz8w14w
	 ztp0N7yB6SAoC/faVyRAj90fxum2geilN53TWv5nzqe2n0Vpd9n3GR3Kb1+kMn+Gp3M1T
	 C/BdOnMgQdgZGbgm5mgLyZHSn78b7hdCoc6NRyipbQ2VdboxcpZnghphv7hUHrp8AGgQK
	 mE7OIVxiqTiFuhz9/NivQEca38KuwdeD7s9Z8MpcH5tLxo71684Gfu0DNn/4y2EFNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ffkUJwZ8UkROiknRJlX9e5EvFD6tviWkRuBKEdkUb64=;
	b=hy58/0Cqc/jyy+u9OIJDHq9Ei2MtZxhCgIIVsjDbTOYpYJzudrE7cC1pH3W1lyXMRACt
	 GBh67fO7rz6YMxXDw+frQmF/DZSJeC8OxCZ+TNig0mp62nTYdaVvec19et3jUViV2IK3+
	 JyQqF/MkCADc0IXBrilKB6AUBJSAoQqGesSCDhneevNOIRHRhUgOsFGisUDX0BKuEP05r
	 DHQLzfIH+iR3CO1zGjqi8SVUBwvdq5c6LoBrnZT6usIujYTBvNWxFJrbo9tuEdUqjmoLn
	 etXIBnmhCyyrg+ScgCdiI0mIF9tCERbkv8zdsERdJqiyUdivK4fY6gsXaxUTnQGx0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsaXGNwR;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3398606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3398606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsaXGNwR
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1965225c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333702; x=1794938502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffkUJwZ8UkROiknRJlX9e5EvFD6tviWkRuBKEdkUb64=;
        b=IsaXGNwRGiLGSEslAzkOriLPlVf3gI6Gu5BUBkatLSf/XuN+1FbPCxwy/2d/AKfaUZ
         kVm0EuHE37R1eapYprlOAYUs+CfNjW5wAuJW8dtTf1sBMh2ql6xAThQ+P4ftxROgeI0a
         d9Kc5fbbqdZqB9oMKMz/ZppUxTUYEesnvYKmJqYJOIteDTWN0d5/GF+SwCbcumLtILHK
         ffnThYeDL0WxzjkFUtMfznzSMec5zWPJJGZlqJXn7LKWlGDfp+9c7SusbgGXI6K2CiUD
         u9c5TN4xmDxDVQzt/r70x3Qg+q3KJzkYugFeJ5ZAQTODhXIzur8tg3Qv1dPALVvyLhOy
         QHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333702; x=1794938502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffkUJwZ8UkROiknRJlX9e5EvFD6tviWkRuBKEdkUb64=;
        b=oN+D3TVWowoceFcSd2eQ856aX3P03ZbLWXYfudUxtLJQxmsoQmZMpdJOilBtt+qhBV
         ETXPtUPOW17ZCQ+YOyf1GVT3hX0xaE22VyqLfIMOK3of1uLP/ytjz92kN67pSfqZosRh
         RZzvUB9lHW2T1j7WpXojS9vHjLUO4Su1093z9gcj65CSHuvt0EsJvQiqAK7BsD1k2fEr
         3BD5+ugeHYZx9v/iXU+AkGPiIqyBlxTlsXRgp408x1e+z/DGsJw+tD9op8k3eDppxZ7A
         jPhSQEWHrEv81srJWSJ7XehqXyqqSzGHc0/pBnc14BZ+xEKw6Zmw6QAt+W1KCPpyJLCT
         N6Ag==
X-Forwarded-Encrypted: i=1; AL+hErE4LqsdBW5F+uJe3v46hc7Wy4TNAyGPNKcGWgm0n2bY4rS3ec7vSeCKJ0yB/ib5/UkDOvA+AuK3kwoyZPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KVIkeFxHM8KZtc23zWPF6R3eEYmx3eRCrX/2zgP1xWj8XZINK
	+dAbr1OLhcNtE0o+G70g1Tj0TJttdcERu1AsnKJFeGdwSarTOckLOwJL
X-Gm-Gg: AYBFou1k2dSs6L6fOaHFggn9px2Xsn68vsGXTxKeVB6Qzf46yJ4CNoTqzImjHoji6u4
	xxxJvE4QCZFuxTFknwiaae74AmZL3X/cBWzOR17MyFCpBHpm+Dl/x2cJERSDtjoECoPUH1jkTs4
	jCkG1owiWPqZuBp0wb7X38qHZxDsWjDpF4udnYnEp9dOQR9IQJ67gV0I4994OLuOFAmn+wHHNaO
	dmIwIlGo7CLNyKnAOSnAphLZHQkvRTws6kOQY7uqFCQDurHLdCqsPpZE4PleLYl9DlaOreqKCGo
	c7S3cv37heVhKcvkaElWB43f4Owq9UZgkIOnasnPEjnWy8YR23bNv+V4uSvx1hgrEsgYkIkRk1q
	lTzR3abBiJ2+XuUTJjuzMX8uYgY46rd5cPIdB85T3DccgWItcMpnheH3tetuBgOCb8c8G3CybpT
	osv8ktuvAhy2xIRiFF1ADJ7ifvN8WfBP4JXcjHAowyNjZLpxBoRvtimGaJ+U8yy0z3y65I5XrlN
	pz/Li4OrBA4UZQ37CgrmOmGiSBlZl0OZjafMtvOdi2f06fABojmtetYGeCPZrmyrEdOpoDhDTsB
	ly4MCbtEDFIB5R4z6eTWUvIlKGWtZBb7wrGMjP8/qCFZ1LbjMpfTzwP7C4U=
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr282228c88.12.1794333701814;
        Tue, 10 Nov 2026 10:01:41 -0800 (PST)
Received: from aig-kmd-01.. ([120.133.49.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm7624260c88.14.2026.11.10.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:01:41 -0800 (PST)
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
Subject: [PATCH RFC v2 9/9] mm/huge_memory: unify the migration and device private PTE loops
Date: Wed, 11 Nov 2026 01:59:24 +0800
Message-Id: <20261110175924.2945538-10-yintirui@gmail.com>
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
index 5eaf8a87f1ba..04571a6dec6c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3290,6 +3290,42 @@ static bool split_huge_pmd_anon_rmap(const struct split_pmd_state *state,
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
@@ -3326,53 +3362,14 @@ static void split_huge_pmd_to_ptes(struct vm_area_struct *vma,
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
-			 * Young and dirty bits are not propagated via swp_entry
-			 */
-			entry = swp_entry_to_pte(swp_entry);
 			if (state->soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
 			if (state->uffd)
-- 
2.34.1

