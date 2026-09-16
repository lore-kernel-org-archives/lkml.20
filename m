Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5580A2848A7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539750; cv=none; b=TQqowlI+fx9VXaZXkFlbvC2esH7JyMmScoAizmzWTnj7nnVeO8dXdv65xek10TCwjoNXLSi1Pxapzqly8TG2pWOK2J7JmDKSBpFByvPKjaTQwKrb8tXHrqPLzMTrSsJ/eXvSuj6/d7h0E/zq9gkUJZhsiGrssR17FZ1ze8Pkj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539750; c=relaxed/simple;
	bh=IPAgThF9jC7bFh1055v5ZtbJ+nlwCQZ8xCiNPM47tqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHLARHwX6QQ//veVO80deTU5HZ+63e7W7DsX1va9gOEoqDi5btjlH08SVmBQDeu8opXhLdFA+brA80mv0sUTqGwiQSfrNRqmxL7P4lCq1/ocbTPEu0vS8I0ugsrK27L8xhFow6IDFYiv+wLbbB9LyHQLlhcM64u8QtYTFfyv7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=madHWNbH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="madHWNbH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso206533f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789539748; x=1790144548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WHX+dp2Boxju7SrcSzARyHP/hpDCqm9COAQ0KdyjLM=;
        b=madHWNbHIuPL0HgiuCJOwN0+lK6mQjHN1j5xJJhitMwybMpd+RPODJfQPbetXhGn9b
         FjiXfBQUf9tPUpOjGHkEjEPmO1LfR5UjyDLOZCvW99qLFFP1d8+jgTntXkJBXno9FLac
         RnD4wxU1A3/L7bUx/ztYFydzsjmAVElky4QuhtHffOpsqdP1Zz6ASCMIWPrB6VYZ/N2J
         5QonzydmEj0DCsfHcL6KpaxCu6okKGv4HZtjv6Wh2deP4WpT5PtiWhNSOhZhuYDFjJ6S
         K25y5SMoWMKhRP8yW0Mi/HuaAaOKcd0eLzPpKKW9I47VHJP/QqkDXvxkG99S29tuWmvT
         ygLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539748; x=1790144548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WHX+dp2Boxju7SrcSzARyHP/hpDCqm9COAQ0KdyjLM=;
        b=venMYbrGpGA81bkChwoEio6CnzPjHw2oGuAuBzTLvvPbHsOURFoQ7wlW8tD4Xihw05
         SE5m2GPShOTEFPFYdzpG35h71D59zWhE4ADpDg5AWuVgW6uRBgbGrPLhHNP89YBSyR0P
         oOvTIb1kwd4OafvvqulmhrLLOWW30Rjji6lFOxwhIA+rqgkSukCM57lEL+l0D6lwvt6k
         ZrgxA4FnuPeqZCdpqoV7FUd+NxrXYBFxIRRxZ95+2x0TzOVB2z9BP8xEroFuPqhyJsxL
         PiG3pa6fZ2tx676YnfWHP8y/l8PatW1EJrAWaDw059IKmw1HPVm+ZmKYGMztxAsYdQ6b
         Axmw==
X-Forwarded-Encrypted: i=1; AKwUvBwMyn+YWvLWg0kgZvPd0SajvrgGxgxov6nyZRYuMb3LSUoS2TqVGOMHqAIyxRxyGK/lxlxUZRuxzwfbbr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lLB5y2aijdf2DVhgh808PuLXsES9SweNJn1nBf+R9bNvppPA7R
	4wH/aroDKD5F6qAdEO7ow35oUeAk1rZUiE9Q8+4HB7nbILGzkOycdp1B
X-Gm-Gg: AYBFou1kZDsw+qx9TdiH5uxiYQDElcszPoD0xpmF4DJOLLz0VXwixGnKfmLCNZ+hUAe
	2INm+igNyJNpWNQOTL5nYP5meKYEBIO0s52hmrWgSrBQxiH+6zz2TFW3S+0EomuGi9JFgDVPYbO
	tynmgR/5OWBCi76pvuIQXn4aZ8r8hvb5WPASIXv8Rn3e5X+ZLHE49p9Lqqe/Fwhazd7+ssBaXkQ
	9sPTToAqYGbe4UoQtAe1FZNjCTswxs2t0ND6F86ZrUG+u66BI847ipXIjQbv4DK9Y69J3L06wES
	p3db+nlFYe3IZFL7ZipKdTBYS0gMEyWFpBvJVlQZdDFwRRGyeeI+x547Zhx0NgA3cMYDXJRsG6v
	4RW2DvX5JJQvy73jBbQl2hoI5dlf3Vq0DSywucDSXtcZalXUqk1G5hhQIDLA1xZ+QZtiRzTSidI
	WaVv9WOP8rtRyeSHQZf7CJuUo1VTzNN0bgCXFzsFp8hc2UgaziH3TW243c8eYlp8ZtbfFvevSBh
	9zeZb6696GNH4jFU5O9JBMWq7rsnV4iAMOSqqYEPcCvz2xAt88AFidMWgRILotWJwlWChw=
X-Received: by 2002:a5d:64ef:0:b0:487:765:46bf with SMTP id ffacd0b85a97d-4870cf2080amr1418487f8f.19.1789539747371;
        Tue, 15 Sep 2026 23:22:27 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm4336679f8f.6.2026.09.15.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:22:25 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Wed, 16 Sep 2026 11:22:22 +0500
Message-ID: <20260916062222.27347-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a box with a discrete GPU, lockdep reports a possible deadlock as soon
as kswapd shrinks the TTM page pool:

  WARNING: possible circular locking dependency detected
  7.3.0-rc3-f6e7b42bf05b+ #183 Tainted: G     U
  ------------------------------------------------------
  kswapd0/269 is trying to acquire lock:
  ((init_mm).mmap_lock){++++}-{4:4}, at: change_page_attr_set_clr+0x29a/0x4a0
  but task is already holding lock:
  (pool_shrink_rwsem){.+.+}-{4:4}, at: ttm_pool_shrink+0xb2/0x330 [ttm]
  Chain exists of:
    (init_mm).mmap_lock --> fs_reclaim --> pool_shrink_rwsem

The cycle is built from three edges:

  1) pool_shrink_rwsem -> (init_mm).mmap_lock

     The TTM shrinker restores the caching attribute of every page it
     frees, while holding pool_shrink_rwsem:

       ttm_pool_shrink()
       -> ttm_pool_dispose_list()
       -> ttm_pool_free_page()
       -> set_pages_wb()
       -> change_page_attr_set_clr()   [ init_mm mmap read lock ]

  2) fs_reclaim -> pool_shrink_rwsem

     The same shrinker, called from reclaim.

  3) (init_mm).mmap_lock -> fs_reclaim

     ioremap() installing a huge PUD mapping over an existing PMD table:

       ioremap_page_range()
       -> vmap_range_noflush()
       -> vmap_try_huge_pud()          [ init_mm mmap read lock ]
       -> pud_free_pmd_page()
       -> __get_free_page(GFP_KERNEL)  [ enters reclaim ]

Edge 3 is the one that should not exist.  Now that reclaim can acquire the
init_mm mmap lock, that lock must not be held over an allocation which can
enter reclaim.  This rule is stated by commit d5d8b8662e6e
("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
and honoured inside CPA itself, where split_large_page() drops the lock
around pagetable_alloc().  The vmap path took the same lock earlier, in
commit 26444eb71465
("mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF"),
and pud_free_pmd_page() still allocates its scratch page with GFP_KERNEL
underneath it.  Neither commit deadlocks on its own; together they close
the cycle.

Use GFP_NOWAIT for that page.  pud_free_pmd_page() already returns 0 when
the allocation fails, and its only caller, vmap_try_huge_pud(), then maps
at PMD granularity through the existing page table - exactly what it does
when its own mmap trylock fails.  So the failure path is not new, and a
failed allocation costs nothing but a smaller mapping.

This breaks the cycle at its source: no code holds the init_mm mmap lock
across a reclaiming allocation any more, so no shrinker-held lock can be
ordered against it.  The same cycle was reported from the i915 shrinker
with &vm->mutex in place of pool_shrink_rwsem.

Link: https://lore.kernel.org/all/80993b70-352f-4069-84c7-39a04c061e98@intel.com/
Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

#regzbot introduced: d5d8b8662e6e

Reproduced and verified on a Ryzen 9 7950X with a Radeon RX 7900 XTX
(Navi 31, 0000:03:00.0), lockdep and KASAN enabled.

On a kernel with a TTM driver bound the report above reproduces on
demand, no memory pressure needed:

  # cat /sys/kernel/debug/ttm/page_pool         # wc/uc rows non-zero
  # cat /sys/kernel/debug/ttm/page_pool_shrink

The second read runs the TTM shrinker with fs_reclaim held, so the
same cycle is reported from the reading task instead of kswapd.

Before (7.3-rc3-f6e7b42bf05b, #183): report within 105 s of boot,
2048 pool pages scanned.

After (same base plus this patch, #185): 1536 write-combined pages
scanned - the order-9 row of the pool went from 3 to 0 and total
node0 from 27650 to 26114 - no report, and /proc/lockdep_stats still
showed debug_locks: 1 afterwards.

 arch/x86/mm/pgtable.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index cb03f5a2b243..c79587962526 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -713,7 +713,7 @@ int pmd_clear_huge(pmd_t *pmd)
  * Context: The PUD range has been unmapped and TLB purged.
  * Return: 1 if clearing the entry succeeded. 0 otherwise.
  *
- * NOTE: Callers must allow a single page allocation.
+ * NOTE: Callers must allow a single non-blocking page allocation.
  */
 int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 {
@@ -722,7 +722,13 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 	int i;
 
 	pmd = pud_pgtable(*pud);
-	pmd_sv = (pmd_t *)__get_free_page(GFP_KERNEL);
+	/*
+	 * The only caller, vmap_try_huge_pud(), holds the init_mm mmap read
+	 * lock, which reclaim can take via set_memory_*().  Do not enter
+	 * reclaim from here.  Failing is fine: the caller then keeps the
+	 * existing PMD table instead of installing a huge PUD mapping.
+	 */
+	pmd_sv = (pmd_t *)__get_free_page(GFP_NOWAIT);
 	if (!pmd_sv)
 		return 0;
 
-- 
2.55.0

