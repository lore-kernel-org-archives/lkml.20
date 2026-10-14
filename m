Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479783B71BB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950365; cv=none; b=JkoDoDV7h5yDQh/xQZBI0d7k6RMJf7upmXONaMcjA1bplPYnNfKZLemJRXBunFEea5kmyTbz/FrKmq9XZxwUsk/APeoOgd4RuC78qcJUWLuGsS5mneg2Ge+kjGvZk64H7WMntjAwC2E4EJJceJc2xVP6jFo0aExmu/e8Kf695UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950365; c=relaxed/simple;
	bh=A40w+35DIpgiCQxJt0/IC2OqyHnzNk9q/eF9E1VEJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFkXMmGsQASRkmJh6MPnmX2B5OyCXay62lGwKlgIBzl/kSKq++tV4VtkPtqFFWrA+M3dIeNzijic5YM4Zz86UtrSbcNlRiCIq6Y3rnl0jra/Z/3AEt8uNYL6yBJdInb8Pgd8alFye4Y0LwOZSpWGM5FUzxYutY6o/HHoLLG06LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BL3PFH8a; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BL3PFH8a"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso823028a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950363; x=1792555163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=BL3PFH8ajdp7Twcl+IfQr5q1xlW9qSiPjhSy3lFYfbK1ou55/7iwYdNLp9lccpAWTP
         iXbRYz1d1cRVJ0xnk98VQvvXZVIqk9qmg4cBw16k4O8xGBCCuYINZAk1jPMbHG53iRFi
         /LwMtICnQlHOnHWEZ13NWvvAYIyT1uJZIy494YsCtDO3xwzv+6uy44J3IbhSt7rM2Zqa
         yMEVpzzPPog6dy/gkbye3cR+0nyrmg7UczbyMpMXOLTKdLR4x9ZvJ9AWlQ/hpnhl4jIk
         wiB4hH6d1YC4yReHX/mI/pHU4uOBzBwIxjGnU8XxcCqe4bQZMDKHSdXU1vc3AvTWqMyp
         GNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950363; x=1792555163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=iCClDR7yzh1a3twRUaIPjeGgEH0509ANI2isERvUkHFIBgC47ZcqT5GeGc4LDA/hQG
         9ylVEdhrpqXeEni8dnvlek0dBXZ5imgtLXMkCG6NmtjZ9bQ1GCFvNv/aQfLVoAODJVNN
         808myb+q4WZJ12Yzu9RAdfjNy2FVY9lJx3n5SdjWYYHXWjolGDISB2hO/xlWAqW4QxDe
         icD87hJ797RYR1TbwH7Mpgo0QR+OU3SNKLpEEN8U2BiC7e+VqIAtA093VmYA9tIEZWym
         WoDn05Ys0lAVkGOWrUPT284ifrKsZ+hBS4UcDDax7AVgoDnoZqeG6f80AUpxYauxA6Hn
         urGA==
X-Forwarded-Encrypted: i=1; AKwUvBz2gWKT/R7M8D1E26jFKGxnXJw3hyxtnPR5fZCOCHv0biw55wUJuh08t5SWYM0uZ28IRFSIYIgVZQ8jCMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzqYfEDGYScvpMLdgKuZKzKvpFiOMot2qNPHib+KdE/QPqpDJ3
	F6HQ13836/PFv6HwdFMxYedZOqu+iP4ban7a0AayiBZejakVbCa8MFZH7Aa9OWTstug=
X-Gm-Gg: AYBFou3eQQsxpGUE5H/khiiZr88Jj2hnlZJAr44cMlpGkTJBqIOKra7L+Nm7G2LhJqP
	LnIvix3KoH9R2LuiMBAopt71rh/8ZF8xg7VBdm4jMp3zsjvVvfIWbuPdBeEOnu38y8lGQVCiywb
	wc6wrf1fq8oFecVPr8sl75/SzUJvuPdo8SJC4fhxZyDrILJAY6oUgG69Id+fYae9U/0gMOtF3MR
	V/IDg9o8I82+xc0wh3Hb+hQfKgWkZAuauUNjkhwWtQb0udE8Op3kg7t0ZCLXQe00b92/UWauBSQ
	f3sysYfVoaPNOHoUyB5s/R/c6EUFsSVr9s6S9+jUuZur00ThEmpQ6HAthY2AQ03lihDQ030pH4i
	GQK3kQMnaeAJom9Jas7USpBly+zYALl2gtjnxoh2+nl+RasWJy1KEYbGGkfYkd9Wagl0gYX7sSQ
	b7FMsbYKrh0qgbvBPYW/WhNbMAZ1CpMMeKePiHWIjTOqUbAKHRUs2D1lz2hW8SzbcVqGqRA0s29
	tOI6cKk07gV1BlplHsM
X-Received: by 2002:a17:90b:1dd1:b0:3a7:e0f4:2857 with SMTP id 98e67ed59e1d1-3ab3a359dd3mr10523369a91.1.1791950363442;
        Tue, 13 Oct 2026 20:59:23 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:22 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mm: generalize kernel PTE table allocation
Date: Wed, 14 Oct 2026 11:59:08 +0800
Message-ID: <20261014035910.687847-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014035910.687847-1-songmuchun@bytedance.com>
References: <20261014035910.687847-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures whose empty kernel PTE representation is not all zero must
initialize new kernel PTE tables. LoongArch therefore wraps
__pte_alloc_one_kernel() solely to call kernel_pte_init().

Call the architecture initialization hook from the generic allocator so
LoongArch can use it directly. The default hook is empty, so this does not
change other architectures.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 11 -----------
 include/asm-generic/pgalloc.h        |  6 +++++-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..a3f93a8b58be 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -10,7 +10,6 @@
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_ALLOC_ONE
-#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -45,16 +44,6 @@ extern void pagetable_init(void);
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	pte_t *pte = __pte_alloc_one_kernel(mm);
-
-	if (pte)
-		kernel_pte_init(pte);
-
-	return pte;
-}
-
 #define __pte_free_tlb(tlb, pte, address)	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 051aa1331051..a1de7d246754 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -19,6 +19,7 @@
 static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL, 0);
+	pte_t *pte;
 
 	if (!ptdesc)
 		return NULL;
@@ -29,7 +30,10 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 
 	ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	pte = ptdesc_address(ptdesc);
+	kernel_pte_init(pte);
+
+	return pte;
 }
 #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
 
-- 
2.54.0

