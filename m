Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759792;
	b=Uj4KBpIeenzfIjqZsZzEtoJ2u3ilV6krQkAzOzov0+lPbR1+HT2Ekds2vu2QkqXSqEh0
	 Wv2cn4F2dNQFXUbMvW4kKlEEUCpcrOUOeUQvQFpaHajBfWY0MGeoflcRPbJcuzQamc6hW
	 VJlnzs1qaCvhcMCxXZ3sklyScA+CSWzb5NXcK9gSZAtQRcMQOLq/ygeQO4xB/tvXgLaFD
	 so7HtwNAoyr16rhEeVMM+lyrjpp3QBID7s9K+B8NWh+FZkKJNde3FJMrT247JeqkPDdI3
	 sYRQ4kpn4pmAdiyI+SpI4mDmPNslgq4DZ4cYz6EtkXyRSL3Y1sBF3XOsEpiYGzzHBVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yzNBix1nrXAgkPziKzHxzDac28NAhHx2suDgNBU8pFw=;
	b=nK22Vyfkjtm/gBPoNZ1MKZXihQxufNXoN3F+3CXjctl6UxUaH6vPct0u9CyOw3ySGldC
	 G/8Y82AxqT2JGR9eUpMw2Chirotdi/nSUFhPhpyBem+iCWBrnr/cmjyv0NQB0BhmZp7kc
	 xud3RCR/pFFhV4Exs9kR4Gvg9zUPdadW1IWEFKpnJV7Xxl9rAM7Lt540KA5P+kibYBFU/
	 uedLYAEpnwd+pbq+6HXrIj9ZzrqF4JfmBj31iLa0es5QiiJv63tzd/O+341R5PBJVVUqV
	 BLSiYghbv0bPQhqORlWZsAOM/sodEumh8k08a6EL4Q6Ez2zLV3GMcORfo6d1o2KBqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AQjV32Jy;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F0A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AQjV32Jy
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso76503b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793759791; x=1794364591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzNBix1nrXAgkPziKzHxzDac28NAhHx2suDgNBU8pFw=;
        b=AQjV32Jyytj/RlhIkTrZ4NPM30U3euHI4VeE+Cr6NvOVH2Njc0Q13FMV/x2wWsct0v
         TuFhOus0POQZM2WZT+Xjnosx645rNSXU78m1kuKSEl+5Tk5ikPrfWju7u+8rgtkoF0/E
         B0OJBxNAGcSDmVp05idrYSrf4ZChEBflsOShp3fSp748DiIh7wFq5qC4GhBXM89x6qd3
         spuhTQFc+CJZGPuZCmOYGGyGy+5vP1rcR2Qa+7hZgk6kGEJPRObU3MWdpsnjUblus3ak
         eqaUzTh0tMDQmhu5HNyLWUKA1JNE9BOR4qbEv78z4KgEg+0/uWbJKoO2sy4fUdU1E9W7
         gqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759791; x=1794364591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzNBix1nrXAgkPziKzHxzDac28NAhHx2suDgNBU8pFw=;
        b=XUhEnm+v7npyMIpEFv8Qec8+YMymlIF0jGm1ZCm8j7EwU1o8Kn+5OKu7r4gT0wZKjf
         bxtui47FjWLkwCTK0M+RMquLCTuDwyPr5FBRxMUfis6JfXzgd0oET3rgQf2Gyd8y7+DF
         p+f4CMcgrufEnzjZzai1Kyz9LNddgAWgTE2KTwr6p7GRhzVuiD5nJ0jM7jV7YHhEvC5o
         7su6hPXTcq2n+jq87COMJ2N3Wuy+WKG7QyFDtwOCeMxxGwbYt4VuizEFrx4H+examB3f
         SaWBC04ncWY41bYPukIteRklQ6wZwwfekPZj9pwHft2YLkeQiVLEz4gzr6GORTD0U1g8
         EAgw==
X-Forwarded-Encrypted: i=1; AKwUvBxezsZTHRm08PEfxAeCusBeJ5XQ8G+XY5t7vLWfZLazRiJPI3UPbKmjTM+bwnQUZ3jmVmkGVJXukB0FkMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dgyw2EYZwchZa7ZUKYM02HN60qDrsgJ+KTGMfYxG0fTtIqdnm
	JuI/D1J4JRRhcY2lyOX+7lUKjgRQ/ASmuS5qXYvZGUd6k/2qAuuxQKm1mr9CZ86lWF8=
X-Gm-Gg: AYBFou1c5iv3PQmp8QniedYJ+FcQMd90Hkv0QqatEUR3178Ygu/bB117LAHayHrKBD6
	F5uy0Y0np6sa6JE0exjEEwJnPUEqC+mJ1PtUiE6Dhq23Ye+Lq73UPUbp1KkedKP3sg4KBj9r6i5
	Okq6U92AgpxsQLB8/yC3VJhGCzb8sXPyZppuIqFfANWKRTS9plYY0IbO0kR4cAi3vvRHku3nrFb
	jIfHNKtNjMMXk4yXbykfdAOMO79xgplaW/r9rMwvSVtmml1R/qam3a+xp9apjBhOP23NNYhXnkq
	5DgfdWUxoJ740a2Dz9xgFgZxBa/p/A0TDk8EWJ0KbUc9fKDEK/hKZY73VxPlaf3xYnoB6GTJHmh
	CEnP0KsizSkHH6peZPT+2zHBupzZbwR+gWziUx3KaWqbFRS9vwFedP0vxU2PjAPU9DwoF9w1kww
	4qzECwzOIoHlp1rRkdqaRcFbDt0SWsNL3gcrPOqJZ0GL0pyvQIeAPR3aN8Xm119QGKD5D6BhZex
	UaTosSJ8BtEhw8neMFV6CJGPougx+TJ8t9hCUdsHiPNTr+3bnZ3PDN8Ef8XwhDOirDBt5aH+gMC
	Ga8usBfx6x5+jlGH8T6emOxQwG3ljCc0D9rKW7s+yH0h2aL27A==
X-Received: by 2002:a05:6a00:1c85:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8a9c0b796d7mr11334632b3a.59.1793759790744;
        Tue, 03 Nov 2026 18:36:30 -0800 (PST)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bc3d1f2sm240815b3a.50.2026.11.03.18.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:36:30 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented
Date: Wed,  4 Nov 2026 10:35:10 +0800
Message-ID: <20261104023510.260766-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104023510.260766-1-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
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

Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
operation, but the current interface exposes a raw address range and
hardcodes deferred TLB flushing.  This splits the common mechanism
across layers and couples it to the HugeTLB batching policy.

Make the folio the unit of PTE conversion and let callers select the TLB
flush policy through the folio-oriented interface.  This keeps
HugeTLB-specific eligibility and batching outside the common operation.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Use two tabs for the new wrapper parameter continuation (suggested by
  Mike Rapoport)
- Collect Reviewed-by from Mike Rapoport

v2:
- Collect Reviewed-by from Lance Yang and Qi Zheng
---
 mm/hugetlb_vmemmap.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 0dcbc2b72384..17fac64d411f 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -300,20 +300,26 @@ static inline int vmemmap_restore_range(unsigned long start, unsigned long end,
 }
 
 /**
- * vmemmap_remap_split - split the vmemmap virtual address range [@start, @end)
- *                      backing PMDs of the directmap into PTEs
- * @start:     start address of the vmemmap virtual address range that we want
- *             to remap.
- * @end:       end address of the vmemmap virtual address range that we want to
- *             remap.
+ * vmemmap_pteify_folio - convert the vmemmap backing of a folio to PTE mappings
+ * @folio:	folio whose vmemmap range should be converted to PTE mappings.
+ * @flags:	vmemmap remap control flags passed to vmemmap_remap_walk.
+ *
+ * Convert mappings covering @folio's vmemmap into PTE mappings. If TLB flushing
+ * is skipped, the caller must flush TLBs after all pteify operations are complete
+ * before remapping the folio's vmemmap pages.
+ *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_split(unsigned long start, unsigned long end)
+static int vmemmap_pteify_folio(const struct folio *folio, unsigned long flags)
 {
 	struct vmemmap_remap_walk walk = {
-		.remap_pte	= NULL,
-		.flags		= VMEMMAP_DEFER_TLB_FLUSH,
+		.flags		= flags,
 	};
+	unsigned long start = (unsigned long)folio_page(folio, 0);
+	unsigned long end = start + folio_vmemmap_size(folio);
+
+	if (!vmemmap_optimizable_order(folio_order(folio)))
+		return -EOPNOTSUPP;
 
 	return vmemmap_remap_range(start, end, &walk);
 }
@@ -532,21 +538,13 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
-static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
+static int hugetlb_vmemmap_pteify_folio(const struct hstate *h, struct folio *folio,
+		unsigned long flags)
 {
-	unsigned long vmemmap_start, vmemmap_end;
-
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return 0;
 
-	vmemmap_start	= (unsigned long)&folio->page;
-	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-
-	/*
-	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end]
-	 */
-	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
+	return vmemmap_pteify_folio(folio, flags);
 }
 
 void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
@@ -571,7 +569,7 @@ void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_l
 
 		nr_to_optimize++;
 
-		ret = hugetlb_vmemmap_split_folio(h, folio);
+		ret = hugetlb_vmemmap_pteify_folio(h, folio, flags);
 
 		/*
 		 * Splitting the PMD requires allocating a page, thus let's fail
-- 
2.54.0

