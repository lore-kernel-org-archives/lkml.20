Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2C3B4EAB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660033; cv=none; b=lYe6nA5B51Ytb9R2hdRR+Y34bRvABKNWf67lJ2RvaNmtHUAYt2FLNjEfvc/fVJ3tT/NoEdhqC2QNK5S8DfODy6hD6bELu4fhYuYLA11HWl/KmOOUDA5/cad9D0ZMWJwhlMaoFuh38AUtBcUQNxWyNuOr796BUhnITVvNfuAyJGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660033; c=relaxed/simple;
	bh=6RXL0D6WPYQaNKQ9GPvz4QnAFudnthn6KQXisNtKagc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il97on8DqdFjGQyykCdVl3wnnqNeDjG9AUex6HDqBzEySs4H9cH4sfBzprTmD852bLr03hloGPqYZ1Y4t1tHS8fhrX7fcVHYHq193KZYH7+oJiW6NBkCjkkXJx4YWWog0dRNemwoxYbs7MGBwzatXgsnXsfyHsIgwcsBdQFAxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=epgKdzPz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="epgKdzPz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso284977a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790660031; x=1791264831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mw8H//cBUjqDniGMsK1MLuH6vPH2dGolHqesV1qp9nQ=;
        b=epgKdzPz+LQ/eq4yWuzRKxWvIMdjtt8XP2/pMHzB00z6xsRIP/1Niv31nPPIgyVHyA
         /qFRgQ/o3utjdYH+L0MPhrM8oKvCYd0ZD+CybpbZpiepCqPCoVWVEu4ZH59xgwMloua7
         scDOh3psNApMbGJaeOTzPU9T1OCvRelMcvSCswKkri5TNBNp0VvQaejsQ8payWAaVK7j
         367cXHQUUiaPqHiroMrOkX7Cw25Ua3KP4eEMlZuq53F9SwIbdbqm5A3GZOKi72ve4/yY
         0ThSjV7AQ1tmgbFBlBNN0ov52tbKgx8QR1jvqLqG2Upm33VeDgRkjR3WwfYXULWNng80
         anWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660031; x=1791264831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mw8H//cBUjqDniGMsK1MLuH6vPH2dGolHqesV1qp9nQ=;
        b=XqonctTk2FgIsRnhwEfG2hjrtiw5j6NioracksEkksZhpZrjURpNAdeRrbephS8naq
         OXMUUK4cPvNfLHmESdtsGhQ4aU8DZXSlAfC+pFZkjdUdZ2gNVqbTM3XNT6mriGOBjuUd
         Ujvluc5fqQkaXgPTo+GBmiGqfCoK3rHHLsthqI7V6O1r9CitLgVnWuwz1jLm19G9t11d
         8uSCXtzXTkUWfFR5Fu34iX2liTR7qCao0K/k4r04SaFUjAGNxqF9yf7/gSv/u79iSJCG
         7ykeqVevYPbVWDKn4WGw4Xxjo1KcyOZ8ic59dkpvFyHtRBq+WBEjbHbEcB3N8sBAud5w
         lmLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd2tp7RzMeTbSTHtvMOxPWkXlrujsyDJijgqz4SY2Y+mJqEpRH9ZEAoeX5jFGb4nvn0LMBD9qFNW4PNHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4GS4SaiHfK33aj0Zun7mud0oEPpkLsOTnYTWmjyQSZwl2ge3I
	7yabFCMRZ2IFzXzjBpnPUO1lzCVTyTPLiU+5DR670Z7yYfzVc7cT8JorebJpKg8X5w0=
X-Gm-Gg: AYBFou03bjP2swbZGcEPUNQPhTBRjLQMUVfBshwHX4L1kCMIclAl2kg4Bmli6EPFH2d
	XoOb7U4aszvGGLrKey9YvC2Jtk2+HkM2CXQjcYAqK+ZgQAC7JvDIGQVuD1hKz9GEbKXq8FUCEk8
	mXYP9Dm49LSjnzJeo7t3jmQRNp6ba51NYnsbLa6BawAoMNwfA4bNPffDnFAcKqrz34zS83EonYL
	uw3xM0zBFDTucsqs22cudqTQxj6xliOujP5NgrtJ/yEDay6HmKAxDfi9OWBRYrJ0r6FrqQNZL9W
	/bvIcrjBjzk2AkdDpiympjUydJdSBQ3Uwww3X7rqqXKzX8LN9HIvqfTsX6CzZXcID9I7uA8t/71
	NnMZ/W5GPT9THyPdZj/8AEQUbnJUL93jr7y90ioE9AARkEfWcK5mD8dziPM0tcOQ06W/cRsnKSc
	KGkxY9NKjQ7SHoku1XQL1k3prkvH7CqOFtWo069IyAS25AzaRH7267/DuI9xUHZC9W4QnHuFMWn
	zE1fvA/097LFy5GDlc=
X-Received: by 2002:a17:902:f54a:b0:2df:3eaf:582f with SMTP id d9443c01a7336-2e2c49d6095mr8936165ad.32.1790660030889;
        Mon, 28 Sep 2026 22:33:50 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bafesm49251765ad.51.2026.09.28.22.33.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:33:50 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 5/6] mm/sparse-vmemmap: open-code vmemmap_populate_address()
Date: Tue, 29 Sep 2026 13:32:30 +0800
Message-ID: <20260929053231.66085-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929053231.66085-1-songmuchun@bytedance.com>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_populate_address() no longer has any callers that need the
returned PTE.  Its only remaining user, vmemmap_populate_range(), only
checks whether population succeeded.

Open-code vmemmap_populate_address() directly in
vmemmap_populate_basepages(), remove the now-redundant range helper,
and return -ENOMEM directly on failure.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 54 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 5fd2df2b516f..9a58323dd628 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -348,8 +348,8 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 	return pgd;
 }
 
-static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-						  struct vmem_altmap *altmap)
+int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
+					 int node, struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -357,48 +357,28 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
 	pmd_t *pmd;
 	pte_t *pte;
 
-	pgd = vmemmap_pgd_populate(addr, node);
-	if (!pgd)
-		return NULL;
-	p4d = vmemmap_p4d_populate(pgd, addr, node);
-	if (!p4d)
-		return NULL;
-	pud = vmemmap_pud_populate(p4d, addr, node);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_populate(pud, addr, node);
-	if (!pmd)
-		return NULL;
-	pte = vmemmap_pte_populate(pmd, addr, node, altmap);
-	if (!pte)
-		return NULL;
-	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-	return pte;
-}
-
-static int __meminit vmemmap_populate_range(unsigned long start,
-					    unsigned long end, int node,
-					    struct vmem_altmap *altmap)
-{
-	unsigned long addr = start;
-	pte_t *pte;
-
-	for (; addr < end; addr += PAGE_SIZE) {
-		pte = vmemmap_populate_address(addr, node, altmap);
+	for (unsigned long addr = start; addr < end; addr += PAGE_SIZE) {
+		pgd = vmemmap_pgd_populate(addr, node);
+		if (!pgd)
+			return -ENOMEM;
+		p4d = vmemmap_p4d_populate(pgd, addr, node);
+		if (!p4d)
+			return -ENOMEM;
+		pud = vmemmap_pud_populate(p4d, addr, node);
+		if (!pud)
+			return -ENOMEM;
+		pmd = vmemmap_pmd_populate(pud, addr, node);
+		if (!pmd)
+			return -ENOMEM;
+		pte = vmemmap_pte_populate(pmd, addr, node, altmap);
 		if (!pte)
 			return -ENOMEM;
+		vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
 	}
 
 	return 0;
 }
 
-int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
-					 int node, struct vmem_altmap *altmap)
-{
-	return vmemmap_populate_range(start, end, node, altmap);
-}
-
 /*
  * Write protect the mirrored tail page structs for HVO. This will be
  * called from the hugetlb code when gathering and initializing the
-- 
2.54.0

