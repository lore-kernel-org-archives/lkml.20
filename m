Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1392C027F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792298112; cv=none; b=fkPz258EGzkp03ZSofS6iaahodzs/21taQzc7Wlum/uzachX9C7p1JChDr3yfV9JN0eoAq2nPbFDSGZ8/yYksy+pWWAvGHT4nTHVzh5cVR367c3CmAjOd6euPn4qWH1/9OYE3Nt+7wc+pec+9i8thdTFt1Yq2DriWnKpMckZk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792298112; c=relaxed/simple;
	bh=AjBQmFyhsIuMBm3hPrg2M4zz8ssEzhjh4P/UkVsxEGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lTFhKLLa9YDi527/VfEfU+vB6dFL70gx57dGXqXxolqP1bEbdI1G93PctIj8nJ9cyY3O01524Qs9zI098KYbuwlqu2eHDRjlqPkVjb+dOox8jWh4qCW1hSRj0gecKOzgSDZPwftzkqPUCqP4UDBXdI7PeWAOutX/GyflbUKsGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RGJiau6B; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RGJiau6B"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso560613a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792298110; x=1792902910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UP34xPhDFhtAM+cWwkHeUJ1O9EQe7R6dx6I7BN7Iz7U=;
        b=RGJiau6BcKbK2nKCrmmKqEQ8ZtDSlPPv0xq2oydCcnu2CCHl2gV2b85I9n6pKK/8Me
         gelgcUPFUCrFGtzx8mdoj6YDKKtvmHAiWPh6s9rZUVdvevsQH0WJmBrVbqSsxen9Yy3I
         QI1WcBah+zTxLvgPcw0brRPIUpoqrfknXEsNIisjFU4DQFmwSJ/O7m7dIwO4dLXJNIKF
         689SNylQ0NhnMVlh29IOePHppQY0MvAZ9qzECC5ACM/0k/uSMzZ8dd3J1A+7NIsaRly1
         zzudPm/vKh/DqzWHNyGQxprwwDz0V6B2R0AvR+lG/xHKQb+hR3+DEtcJB0spACq6bgZ7
         tgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792298110; x=1792902910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UP34xPhDFhtAM+cWwkHeUJ1O9EQe7R6dx6I7BN7Iz7U=;
        b=F27Dnhn9Hn2uwhlgVKL/qzqFAkI0BVmxOyCENuFJenSHqaHRbo/QTEKyq8gv9pA8HJ
         87bsD9+3LS5ECkDNX642lShAYVbtLvETA5emnMQ2ZDXBITq0LYQGo2hnDukKctLfSiJ4
         xtLBibAFNMSzVfZDGPOlagoQSe3ESlLEBVim8CgRxZmHOWzljL23suaAocuvWjSZX3zh
         d8Iihey3kE21m+2KdWhlg0K0KIzDJVCynMjn+1YghxsN7u5eD2t2QT8Ew/YF5LLQcQoC
         3v+Pujk10H6JfdljHYXBHuOAvw5pqtGdItGUCbUZPG0FsN4mBTryicyuJfnOFCp77EOI
         f/gg==
X-Forwarded-Encrypted: i=1; AKwUvBw2YaVYn6HnbxyuzzJhhqlIpGTuP78dR+O0XFf2Bo49uMc0pGf9Qk9APh9eoMVPFa2kkQAAxrnR9FUXQ2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB0f6UKoT0ZssaJUu2x/KTPvJ2PW8R6UJu0x761wkBV1Be5JEA
	nbY/1A5jScATKzndPA8V/xjnb+8JUtTwHKHsgyWjqTTxCf6yk2daeXSPW0WgCgcHkTU=
X-Gm-Gg: AYBFou1OEc5/PvROH3uj97WSUlc0J0kdlt/OdeUjpp/INHpSthf0KYWEhc1bJWTeVdX
	SpslOnPEm58KBnrI0eYPEs4egLMHJyGExnPcx1ajHcQbKXkc76iHH20vq7QorabiwvzG/08gTaM
	fT6M2ZGKDmumRYFzsRZYNyzJPMxpTsZWXFB2Q/kX0omRlhJMjp/QP47UfMyLpPbuOMc6watIZPC
	nbyfjYZ8A73GlMvEcXR7p2yZpfDjXCTinsLrXiO6SnZREhqBmN2JZ4L/pAlOpjolXL6UUSj5u75
	wIoeAZuT1HEzc38qbgaJHIZRimg4xLo17zsYl5ZB0nGvU4Uyi20OzRAZimtPe4+uOR317VNY3ES
	fvLRwd5uGQ16WLs1uF8rtbauBE9pqoHec2z48s57eQulTLk/ZoTL3Kjrd3gQz33XL6sOEr6CyvR
	1D9Q6eKDRuiPdA8sjuYGAmdLx0M72ZymZa+QYhQ0+4duiJd+aI8I30P3qWpcMH4aLxkO9tsuFZF
	7WpuUncjtSp7u1poBQXpYuoDBn4NkfEQ3gBYLlaZ7aItoi8pt9rkPWEvawxXkwiQxbw/TZS5/EV
	yLSBm15indk1DmvKFZGo6GA=
X-Received: by 2002:a17:90b:55cb:b0:3ac:9c37:9431 with SMTP id 98e67ed59e1d1-3aceec251a0mr3458188a91.19.1792298109782;
        Sat, 17 Oct 2026 21:35:09 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487cccdsm10412082a91.8.2026.10.17.21.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:35:09 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Dan Williams <djbw@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v2] kasan: fix runtime shadow page table synchronization
Date: Sun, 18 Oct 2026 12:35:01 +0800
Message-ID: <20261018043501.3257632-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kasan_populate_early_shadow() is also used after slab becomes available
to install shadow mappings for hot-added memory. When this path allocates
a new page table at a level that requires synchronization, the new entry
is initially published only in init_mm.

On architectures that maintain separate kernel page tables, runtime
changes to the kernel page tables must be propagated to existing process
page tables. Otherwise, the KASAN shadow mapping can remain unreachable
and fault when the hot-added memory is accessed.

Use the existing page-table allocation tracking helpers to collect the
modified levels, then synchronize the affected kernel mappings once after
the walk.

Once synchronized, an entry remains in other process page tables. Clearing
only init_mm and freeing its target table during teardown would leave stale
pointers behind. Retain page tables referenced by synchronized entries.

Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Use the existing page-table tracking helpers and synchronize once after
  shadow population (suggested by Andrey Ryabinin)
- Fix aligned shadow population to reuse existing page tables instead of
  replacing them (suggested by Andrey Ryabinin)
---
 mm/kasan/init.c | 125 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 90 insertions(+), 35 deletions(-)

diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 66a883887987..f94f461d864c 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -17,6 +17,7 @@
 
 #include <asm/page.h>
 
+#include "../pgalloc-track.h"
 #include "kasan.h"
 
 /*
@@ -107,7 +108,7 @@ static void __ref zero_pte_populate(pmd_t *pmd, unsigned long addr,
 }
 
 static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
-				unsigned long end)
+				unsigned long end, pgtbl_mod_mask *mask)
 {
 	pmd_t *pmd = pmd_offset(pud, addr);
 	unsigned long next;
@@ -115,25 +116,26 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 
-		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE) {
+		if (IS_ALIGNED(addr, PMD_SIZE) && end - addr >= PMD_SIZE &&
+		    pmd_none(*pmd)) {
 			pmd_populate_kernel(&init_mm, pmd,
 					lm_alias(kasan_early_shadow_pte));
+			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
 
 		if (pmd_none(*pmd)) {
-			pte_t *p;
+			if (slab_is_available()) {
+				if (!pte_alloc_kernel_track(pmd, addr, mask))
+					return -ENOMEM;
+			} else {
+				pte_t *p;
 
-			if (slab_is_available())
-				p = pte_alloc_one_kernel(&init_mm);
-			else {
 				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
 				kernel_pte_init(p);
+				pmd_populate_kernel(&init_mm, pmd, p);
+				*mask |= PGTBL_PMD_MODIFIED;
 			}
-			if (!p)
-				return -ENOMEM;
-
-			pmd_populate_kernel(&init_mm, pmd, p);
 		}
 		zero_pte_populate(pmd, addr, next);
 	} while (pmd++, addr = next, addr != end);
@@ -142,80 +144,93 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 }
 
 static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
-				unsigned long end)
+				unsigned long end, pgtbl_mod_mask *mask)
 {
 	pud_t *pud = pud_offset(p4d, addr);
 	unsigned long next;
+	int ret;
 
 	do {
 		next = pud_addr_end(addr, end);
-		if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >= PUD_SIZE) {
+		if (IS_ALIGNED(addr, PUD_SIZE) && end - addr >= PUD_SIZE &&
+		    pud_none(*pud)) {
 			pmd_t *pmd;
 
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
+			*mask |= PGTBL_PUD_MODIFIED;
 			pmd = pmd_offset(pud, addr);
 			pmd_populate_kernel(&init_mm, pmd,
 					lm_alias(kasan_early_shadow_pte));
+			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
 
 		if (pud_none(*pud)) {
-			pmd_t *p;
-
 			if (slab_is_available()) {
-				p = pmd_alloc(&init_mm, pud, addr);
-				if (!p)
+				if (!pmd_alloc_track(&init_mm, pud, addr, mask))
 					return -ENOMEM;
 			} else {
+				pmd_t *p;
+
 				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
 				pmd_init(p);
 				pud_populate(&init_mm, pud, p);
+				*mask |= PGTBL_PUD_MODIFIED;
 			}
 		}
-		zero_pmd_populate(pud, addr, next);
+		ret = zero_pmd_populate(pud, addr, next, mask);
+		if (ret)
+			return ret;
 	} while (pud++, addr = next, addr != end);
 
 	return 0;
 }
 
 static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
-				unsigned long end)
+				unsigned long end, pgtbl_mod_mask *mask)
 {
 	p4d_t *p4d = p4d_offset(pgd, addr);
 	unsigned long next;
+	int ret;
 
 	do {
 		next = p4d_addr_end(addr, end);
-		if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE) {
+		if (IS_ALIGNED(addr, P4D_SIZE) && end - addr >= P4D_SIZE &&
+		    p4d_none(*p4d)) {
 			pud_t *pud;
 			pmd_t *pmd;
 
-			p4d_populate_kernel(addr, p4d,
+			p4d_populate(&init_mm, p4d,
 					lm_alias(kasan_early_shadow_pud));
+			*mask |= PGTBL_P4D_MODIFIED;
 			pud = pud_offset(p4d, addr);
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
+			*mask |= PGTBL_PUD_MODIFIED;
 			pmd = pmd_offset(pud, addr);
 			pmd_populate_kernel(&init_mm, pmd,
 					lm_alias(kasan_early_shadow_pte));
+			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
 
 		if (p4d_none(*p4d)) {
-			pud_t *p;
-
 			if (slab_is_available()) {
-				p = pud_alloc(&init_mm, p4d, addr);
-				if (!p)
+				if (!pud_alloc_track(&init_mm, p4d, addr, mask))
 					return -ENOMEM;
 			} else {
+				pud_t *p;
+
 				p = early_alloc(PAGE_SIZE, NUMA_NO_NODE);
 				pud_init(p);
-				p4d_populate_kernel(addr, p4d, p);
+				p4d_populate(&init_mm, p4d, p);
+				*mask |= PGTBL_P4D_MODIFIED;
 			}
 		}
-		zero_pud_populate(p4d, addr, next);
+		ret = zero_pud_populate(p4d, addr, next, mask);
+		if (ret)
+			return ret;
 	} while (p4d++, addr = next, addr != end);
 
 	return 0;
@@ -230,15 +245,19 @@ static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
 int __ref kasan_populate_early_shadow(const void *shadow_start,
 					const void *shadow_end)
 {
-	unsigned long addr = (unsigned long)shadow_start;
+	unsigned long start = (unsigned long)shadow_start;
+	unsigned long addr = start;
 	unsigned long end = (unsigned long)shadow_end;
 	pgd_t *pgd = pgd_offset_k(addr);
 	unsigned long next;
+	pgtbl_mod_mask mask = 0;
+	int ret = 0;
 
 	do {
 		next = pgd_addr_end(addr, end);
 
-		if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE) {
+		if (IS_ALIGNED(addr, PGDIR_SIZE) && end - addr >= PGDIR_SIZE &&
+		    pgd_none(*pgd)) {
 			p4d_t *p4d;
 			pud_t *pud;
 			pmd_t *pmd;
@@ -251,34 +270,46 @@ int __ref kasan_populate_early_shadow(const void *shadow_start,
 			 * puds,pmds, so pgd_populate(), pud_populate()
 			 * is noops.
 			 */
-			pgd_populate_kernel(addr, pgd,
+			pgd_populate(&init_mm, pgd,
 					lm_alias(kasan_early_shadow_p4d));
+			mask |= PGTBL_PGD_MODIFIED;
 			p4d = p4d_offset(pgd, addr);
-			p4d_populate_kernel(addr, p4d,
+			p4d_populate(&init_mm, p4d,
 					lm_alias(kasan_early_shadow_pud));
+			mask |= PGTBL_P4D_MODIFIED;
 			pud = pud_offset(p4d, addr);
 			pud_populate(&init_mm, pud,
 					lm_alias(kasan_early_shadow_pmd));
+			mask |= PGTBL_PUD_MODIFIED;
 			pmd = pmd_offset(pud, addr);
 			pmd_populate_kernel(&init_mm, pmd,
 					lm_alias(kasan_early_shadow_pte));
+			mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
 
 		if (pgd_none(*pgd)) {
 
 			if (slab_is_available()) {
-				if (!p4d_alloc(&init_mm, pgd, addr))
-					return -ENOMEM;
+				if (!p4d_alloc_track(&init_mm, pgd, addr, &mask)) {
+					ret = -ENOMEM;
+					break;
+				}
 			} else {
-				pgd_populate_kernel(addr, pgd,
+				pgd_populate(&init_mm, pgd,
 					early_alloc(PAGE_SIZE, NUMA_NO_NODE));
+				mask |= PGTBL_PGD_MODIFIED;
 			}
 		}
-		zero_p4d_populate(pgd, addr, next);
+		ret = zero_p4d_populate(pgd, addr, next, &mask);
+		if (ret)
+			break;
 	} while (pgd++, addr = next, addr != end);
 
-	return 0;
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(start, end);
+
+	return ret;
 }
 
 static void kasan_free_pte(pte_t *pte_start, pmd_t *pmd)
@@ -286,6 +317,9 @@ static void kasan_free_pte(pte_t *pte_start, pmd_t *pmd)
 	pte_t *pte;
 	int i;
 
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PMD_MODIFIED)
+		return;
+
 	for (i = 0; i < PTRS_PER_PTE; i++) {
 		pte = pte_start + i;
 		if (!pte_none(ptep_get(pte)))
@@ -301,6 +335,9 @@ static void kasan_free_pmd(pmd_t *pmd_start, pud_t *pud)
 	pmd_t *pmd;
 	int i;
 
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PUD_MODIFIED)
+		return;
+
 	for (i = 0; i < PTRS_PER_PMD; i++) {
 		pmd = pmd_start + i;
 		if (!pmd_none(*pmd))
@@ -316,6 +353,9 @@ static void kasan_free_pud(pud_t *pud_start, p4d_t *p4d)
 	pud_t *pud;
 	int i;
 
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_P4D_MODIFIED)
+		return;
+
 	for (i = 0; i < PTRS_PER_PUD; i++) {
 		pud = pud_start + i;
 		if (!pud_none(*pud))
@@ -331,6 +371,9 @@ static void kasan_free_p4d(p4d_t *p4d_start, pgd_t *pgd)
 	p4d_t *p4d;
 	int i;
 
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PGD_MODIFIED)
+		return;
+
 	for (i = 0; i < PTRS_PER_P4D; i++) {
 		p4d = p4d_start + i;
 		if (!p4d_none(*p4d))
@@ -377,6 +420,9 @@ static void kasan_remove_pmd_table(pmd_t *pmd, unsigned long addr,
 			continue;
 
 		if (kasan_pte_table(*pmd)) {
+			if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PMD_MODIFIED)
+				continue;
+
 			if (IS_ALIGNED(addr, PMD_SIZE) &&
 			    IS_ALIGNED(next, PMD_SIZE)) {
 				pmd_clear(pmd);
@@ -403,6 +449,9 @@ static void kasan_remove_pud_table(pud_t *pud, unsigned long addr,
 			continue;
 
 		if (kasan_pmd_table(*pud)) {
+			if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PUD_MODIFIED)
+				continue;
+
 			if (IS_ALIGNED(addr, PUD_SIZE) &&
 			    IS_ALIGNED(next, PUD_SIZE)) {
 				pud_clear(pud);
@@ -430,6 +479,9 @@ static void kasan_remove_p4d_table(p4d_t *p4d, unsigned long addr,
 			continue;
 
 		if (kasan_pud_table(*p4d)) {
+			if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_P4D_MODIFIED)
+				continue;
+
 			if (IS_ALIGNED(addr, P4D_SIZE) &&
 			    IS_ALIGNED(next, P4D_SIZE)) {
 				p4d_clear(p4d);
@@ -464,6 +516,9 @@ void kasan_remove_zero_shadow(void *start, unsigned long size)
 			continue;
 
 		if (kasan_p4d_table(*pgd)) {
+			if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PGD_MODIFIED)
+				continue;
+
 			if (IS_ALIGNED(addr, PGDIR_SIZE) &&
 			    IS_ALIGNED(next, PGDIR_SIZE)) {
 				pgd_clear(pgd);

base-commit: 63562804f25cb5b6f5e4f5e3a9f0d1c3c6868596
-- 
2.54.0

