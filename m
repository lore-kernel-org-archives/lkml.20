Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813256;
	b=whr1i1jP1LMkpaBZH/u2B0LbXNdGWRilcRUKksH0seChDYtRiSLh3WGKwLhCJoxLP/vc
	 W923bTm4tfg6hzs3DKHyP/VUpRHEIf2AgEqKaqQcDDlO2FhM1YdcISprQVaj7GAk7x1Bq
	 Tm7s/3xLA2mTOuB0wJMatqEb+yq11MxgXqqmcJTFNqCzP41wNrm9aKttVwlVaLI6azjoQ
	 voSsv3Z0SSbvoueFs012lEAT0oGxUL32w9qsaUZLslOwnkOxidtF2cbTzUkYlePyb+kYM
	 Zxk/a246A8cEslhmq9I4uHI9KEnLqiF8xkZAPCn2rcPWgOogNT93kRhlt4oH+WTrgag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813256;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RBfGRIbJnN+qNQ3rPfXmwqxNtkbzv2IUhJ3GYvE0c6Q=;
	b=aJWZw57wt76QKKxrgWqa46/Uq+kJwCXwsBp6X2ckL2Jc7vP98gTi9BVxKRqln3/9TblB
	 AuzChqoSnbTL+kGeWDOh5BPOzMhTfhOEhMY88mUi8Z80GUJKAyTc4luQ6QmgpYS0/hUWe
	 df8qLlBPYiIMSkZUqKSyI4feSQMmRBEH9uEy/MY1hcD1DKj+VNBoNKGwc/NeJfCfNjxj7
	 AE/lczEHnmqUMdO5IH7Koj0O5Gp09wpwTSPVtCQMEbv/aYOQY8svRC18o2FLHXlb3bf8j
	 QgdbSNJJvrphYr7LocOqyss+i8qv7xZJIUfYck3PqRr1aeRa0WMGyqFCPpXW5YRgHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z1mjNykn;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D79606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z1mjNykn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7IZMUSgTM4Km0OlppI5vIjCEjnCgOgbFSMjmVmeVMCE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813254; v=1; x=1795418054;
 b=Z1mjNyknmiSR9Cgi+Xmcso28T5prx1Y9RX3Ryn8z6FlJaK5z+s3vAxS6QT2yuzm5fXcuDhE+
 rtDFLaOSCYtEloVXMZvfFE2S9g6nUkPaTZiSiElj1TWU6pN+DL7E9EzimidIY/mXQYH1NCDjqYH
 bJYHRKsFHyDkrKH5fF+FYUzg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ab19dba70fd5e75;
	Mon, 16 Nov 2026 07:14:13 +0000
X-Mizu-Trace-ID: 3ab19dba70fd5e75
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v5 06/11] mm/vmalloc: undo what vmap_page_range() mapped on failure
Date: Mon, 16 Nov 2026 15:13:20 +0800
Message-Id: <20261116071325.263682-7-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
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

ioremap and arch setup code map their ranges with vmap_page_range().
When the walk fails half way, or the KMSAN metadata fails after the
walk, the ptes installed so far stay behind. The caller frees the
vm_area on the error path, so the next mapping that lands on the same
range trips the BUG() in vmap_pte_range().

vmap_range_noflush() now takes a mapped_end argument that the walk
levels advance as they install, and vmap_pte_range() BUG()s before
it installs over a pte that is already set. The ptes below mapped_end
are therefore all ours, while a pte above it can only have been put
there by somebody else, for example when the caller's range overlaps
an existing mapping. On a walk failure the undo is limited to
[addr, mapped_end), going further would clear ptes that are not
ours. If the walk completed and only the KMSAN metadata failed, the
whole range was installed by this call and all of it is undone.

All callers are sleepable, the teardown passes can_resched = true.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d99d7710e1ba..5c1eacc2a0ac 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -117,7 +117,8 @@ static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
 
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask,
+			unsigned long *mapped_end)
 {
 	pte_t *pte;
 	u64 pfn;
@@ -143,6 +144,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 
 		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
 		nr_pages = PFN_DOWN(size);
+		*mapped_end = addr + size;
 	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
@@ -188,7 +190,8 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 
 static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask,
+			unsigned long *mapped_end)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -203,10 +206,12 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
 					max_page_shift)) {
 			*mask |= PGTBL_PMD_MODIFIED;
+			*mapped_end = next;
 			continue;
 		}
 
-		err = vmap_pte_range(pmd, addr, next, phys_addr, prot, max_page_shift, mask);
+		err = vmap_pte_range(pmd, addr, next, phys_addr, prot,
+				     max_page_shift, mask, mapped_end);
 		if (err)
 			break;
 	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
@@ -245,7 +250,8 @@ static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
 
 static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask,
+			unsigned long *mapped_end)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -260,10 +266,12 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
 					max_page_shift)) {
 			*mask |= PGTBL_PUD_MODIFIED;
+			*mapped_end = next;
 			continue;
 		}
 
-		err = vmap_pmd_range(pud, addr, next, phys_addr, prot, max_page_shift, mask);
+		err = vmap_pmd_range(pud, addr, next, phys_addr, prot,
+				     max_page_shift, mask, mapped_end);
 		if (err)
 			break;
 	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
@@ -302,7 +310,8 @@ static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
 
 static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask,
+			unsigned long *mapped_end)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -317,10 +326,12 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
 					max_page_shift)) {
 			*mask |= PGTBL_P4D_MODIFIED;
+			*mapped_end = next;
 			continue;
 		}
 
-		err = vmap_pud_range(p4d, addr, next, phys_addr, prot, max_page_shift, mask);
+		err = vmap_pud_range(p4d, addr, next, phys_addr, prot,
+				     max_page_shift, mask, mapped_end);
 		if (err)
 			break;
 	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
@@ -329,7 +340,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 
 static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
+			unsigned int max_page_shift, unsigned long *mapped_end)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -346,11 +357,12 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	BUG_ON(addr >= end);
 
 	start = addr;
+	*mapped_end = addr;
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
 		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
-					max_page_shift, &mask);
+					max_page_shift, &mask, mapped_end);
 		if (err)
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
@@ -364,18 +376,32 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 int vmap_page_range(unsigned long addr, unsigned long end,
 		    phys_addr_t phys_addr, pgprot_t prot)
 {
+	unsigned long mapped_end = addr;
 	int err;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
 		return -EINVAL;
 
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
-				 ioremap_max_page_shift);
-	if (!err)
+				 ioremap_max_page_shift, &mapped_end);
+	if (err) {
+		/* Undo the part the walk installed before it failed. */
+		if (mapped_end > addr)
+			__vunmap_range_noflush(addr, mapped_end, true);
+	} else {
 		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					       ioremap_max_page_shift);
-	if (!err)
-		flush_cache_vmap(addr, end);
+		if (err) {
+			/*
+			 * Only the KMSAN metadata failed, the walk mapped
+			 * the whole range. Undo it all. The callers are
+			 * ioremap and arch setup code, always sleepable.
+			 */
+			__vunmap_range_noflush(addr, end, true);
+		} else {
+			flush_cache_vmap(addr, end);
+		}
+	}
 
 	return err;
 }
-- 
2.25.1

