Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5D399351
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288875; cv=none; b=gOjDOjuOtIHkYoyvO7e23dp5q1pZU0spmlZIjrOSRKftDDW/+QnRh9TKnvJWo9HV3ylmQqi0cRA6qgnROUf1OSfuawyl1trds9dV93fTPZW1eLF7gG3zfgmzJFI/g+tdKlPAZKfGjuPaD/m4mSSAQyD8/FpgjM97MSmBoDlTCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288875; c=relaxed/simple;
	bh=6TPn1RE4+X8OQTNKxviJn2Ieeji6pdzLzuxMJDdolK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKFcNWMAczmvsLREpE4b6EZSZV1JntNSiXd5hu8IE0MtnhepdODO2gkuMVshbVfCmKStJheK9EIM0ibS8eS6I1/0d5LH9A7wmhxqsmY9Imy4lBhncCmURgbkPcgXqgQePVVZHbryp6+DdbIGmZuo3RBFr3w8F/xvvVqx9sFeBqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GBknKjmB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GBknKjmB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so826678b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789288873; x=1789893673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jabfOFZH7nclzlLV4JN+2R4So1RYw+NkC6onyGlhulM=;
        b=GBknKjmB/bEPP5a/lKGy6ldYIN8osUdzNy7mGk6vsbGmUfgDBl1KeiFYVca+CXIajo
         fp6HuCta8QARxFK8gd69iAUnI9RVZIvWvkf4QbA1Hcx6oTddV96gYN862G/7ik4nxyyt
         iKhVpBLUZHitBhoi7nLTKXEJNR6Rv6odyFmZ6Go0lFFJJXyW1sMbthvNXoCFxLb3rAqP
         XM43eKhgQPknLKK8qAkZyseKlVE5GgycPBtigvnK0HdXKWcK1OuORH8/0yZyJJqn6qdv
         tfgxrveTmrOeYu1QutIyvXUWUDXAz2PV7o7KjLleoADdBbqRMjcn2S7Y/R5bjmZ48Dg/
         TXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789288873; x=1789893673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jabfOFZH7nclzlLV4JN+2R4So1RYw+NkC6onyGlhulM=;
        b=TpQYM+NSVvy9CH/u9up6SQLc5uZLAoKTIJ/UFoWt60bS5p78w7CgQ+8MFFNTOvrtbT
         vZTNp02nzuEc6xhTK4gJMIRHuQwNQnPUr4EMEt/4qd09Xul+t4x2cPB0dULs1jui9slC
         AwBYTY8wh1O2ioIQs7zcU51q51BCjBBw9lEf8AC7Q15FR36TzsDBdPwk+1Vka1nEQA1B
         yfj10D783w5/5X70zfyQzvx1G5X3edGFjHdPxL7lqNyP3GA07/ecYwBD0INbXU2pn/Lx
         Y6vasT0g4PVJRqv3Bwpvtq6orOZoLp1MWc/IQ6+aoRLv3f7EPmQSjOBUzH827+EgbMjG
         vQjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/wSoVhh1pcyD8UGHX6zwA9lEUjAMMuGi3xqPAmzfFjdjuugdi509xyZzudO2aX+PmZvl6qwXlw4kWdXM=@vger.kernel.org
X-Gm-Message-State: AFuF++lO4B7n1N3nt/g2E/Ox63fLyghKtyb887x8T4/q1uQbL5LoLJR9
	Y+qi/k4ish5geWMqML0XLmW5Kl0vx0D4UOIkbepcBZgVK5daqTjdLcINFrE/VXa82oE=
X-Gm-Gg: AYBFou2pLD1EgmVBygFqOixETNgVEkjCtPvNa5qmYEBIAx+XaYHqxWhdo03Kn6uH02S
	w3WA4rpsBMdZbDWScUqcIbNhHHeP/Ci9117qo0Q0ySyc1FI6fwi7IKTvfgD5BxT3aPU7VS1XPvQ
	YC2NDtvTfXbhZak9rkdQusbzaZ42oHhCiZsBKu7/GoqT+ujrTr/GIMykrQAxcJfc2raJfLyct8X
	4EWpuJXdgtdsiYxiQ6V/XXzMxEN7yxJDHmuPUkbEh729RuwWotNjHMFfGGP4Y/bbqmJAGad6vOR
	NUVbiZxQtMDt6dG9N1Krj5Bdq2LO8q0co4Oo5V7Sfh4yQ4DtAmgY5MocqgcccXBAlCsVIQ3vnPW
	GHIAGaa+whnErc1TSNKKj4vtKVs/FjIMJcjymxA94nBZSZTwwo+pi8pofpUk+kOnWNVTGuczXF3
	bHM9PKowxL2DUlveHOwoma9cXw8BJfobE94ScytckjgP/hVpKrU0h6X8DVp2xU1nnGoJsb8J7jc
	MfByq6KXfY48eWHqDNi96nWbo4=
X-Received: by 2002:a05:6a00:c1c6:20b0:86c:52fd:fbdf with SMTP id d2e1a72fcca58-86c52fe0a64mr9440575b3a.20.1789288873401;
        Sun, 13 Sep 2026 01:41:13 -0700 (PDT)
Received: from G6L4RL2QG9 ([2409:8a00:1832:cf0:5137:990:100e:cc7e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb0d3sm3070531b3a.42.2026.09.13.01.41.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 01:41:12 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
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
Subject: [PATCH 6/6] mm/sparse-vmemmap: open-code vmemmap_populate_address()
Date: Sun, 13 Sep 2026 16:37:34 +0800
Message-ID: <20260913083734.86802-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913083734.86802-1-songmuchun@bytedance.com>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
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
---
 mm/sparse-vmemmap.c | 54 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 8b4904d9c65e..5e0e30c77431 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -303,8 +303,8 @@ static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
 	return pgd;
 }
 
-static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
-						  struct vmem_altmap *altmap)
+int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
+					 int node, struct vmem_altmap *altmap)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -312,48 +312,28 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr, int node,
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

