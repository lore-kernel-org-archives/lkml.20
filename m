Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82AE24E4B5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202686; cv=none; b=NJAQYp61HNZF92c4WotZtU44ZBuU7LtLXVKUO8baClqiDO3xK7xYZI4YfuLnafgt9EDAmc8pTGP9IUPwvCjITdqbCVX08TdjhkYjoy4sm2brrnJGHpkYALbLXo0eIDOAGGl1TRVDr4ZmhLLkj+0UXmZflVqplhA6z6+/5UEMuqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202686; c=relaxed/simple;
	bh=3IkPa0CkyWtEwgHOkii+svYDyP1eAX7HouxoB6+tSic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjPG5lLU0O7dEcpzZziHpUFA0y10CU0LI+LSzfBW1n1tgNBBzB6sWrcoLEAqLokUVjAfm6R8DEY2KgIB4LWSUAxEa9LbvkKBuY9vRK9nidK0FIzxKatiUXGLod6ycE9CkHamQl8CTwK2eA+hlEQ/hg61NTcVzYYrYb9pufvFCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbJjJ9ix; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbJjJ9ix"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so1245722f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202681; x=1790807481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hA4prx5+Mh90St+jFwZr6K2H8VkXOm57pDkWzDzmfUA=;
        b=sbJjJ9ixJJO4gOOSkVjvkJ1v+EEiglYyPg69mvN4ksmtjexDbPxc9jqI24nlzcUAP9
         zszKW/QzTsXn1yymdYXALHaqkOcdEYD49tK2fWiQAv1OLwxAGmaBCejuwBwFkLXsQQAa
         hCo5MAgkKbmTZJKKJNsp9W3G3SmCDh17ug89vKuC5Ng6nI6j6oCKVxlhaQUQldGt7Vnn
         ozkTYO4cj58kc+yDs3igxAMA8RXm5qNMN+S3UyKwark0S/AABkYNP8oNGJclum63ZpcK
         5P3V/I3quG65FhgDuPQomlJoxAnIcSZW+o73rIXK/hfsx0vrrL7nGPxW+NYkuHiOuhI4
         Tzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202681; x=1790807481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hA4prx5+Mh90St+jFwZr6K2H8VkXOm57pDkWzDzmfUA=;
        b=C3Axf4CvVP6d2cNIQrVdpXfkiK1Z+V/LX0+u52b+IbLCu2MxVO/2PHdnR04XEiXZGW
         sly4bEmtiTby9i101WBr7F7jvcbdYNusMGvSNuXXtuNwP/XH5yPOg9yLrvrgn0fR9qw9
         MtjK+bjPXXl3/V4zsfLkg4vHk5OlsUSoIfcSKT3hfIsInvqWG9caXTMg3nY+X6ibxGcw
         u+9jp6ixg5G4+QXHbajxpRh6vSW7TwE2cztCjN5sfoJX/F5+x/8ENBF+GsIxwUGDF588
         jpZd3xShlf1YVh7udVg9lkgjkriYwyQQTBXqSgHmPKPCkG8tTw8LQwqjZoW6Re6aTDYz
         FJRA==
X-Forwarded-Encrypted: i=1; AKwUvBxesezyEh3K06yfxh/3Tp/GZKiWZjrApF6Wgtys880U6yCXF6lSXnG+5Pb4686neQThu/q3xmQFLa56VcY=@vger.kernel.org
X-Gm-Message-State: AFuF++mehXYhPeXBnFrA7vTGLJbQq1xH3gX/YimjCg+9Dzg1GbkYb0uJ
	i5+jltVplLIiFlYDp2BwMG68mRcnolo2Nq0D/x6NR6RjAdry79PUedGe
X-Gm-Gg: AYBFou34RBt/w6DICbIXgV6jx6VthTcrhwUymcz18611ZBRB2+0N3vCWFVevMUN2Tw3
	8Z0WaO6ulFJM2GlCuYScbmQSfSs76ieHfCuExBn8DPn6ux88YftKbOCrgpz7A0i+pJ/DyaR8WNK
	I27B7vYwK1EDxrXVpn3jrOPKkpGi7vs7Tu6DMue+WIlwnbRg4FBYmhazMjCU1Nv5nZT2t/tg6cw
	/UNP32HaT6sy/w3V/1A68RAOuEXGUaLrV3GO6i8h5pdyaTeypQqtKWcaJ4eE3U4e9eBywQNY+vK
	RghpQ7UDKfWJWA5/zFVhyLIAAM2D70VRZUqDke7oV3qe0drFSCvjOl3M/MKGP9VC5+ts+DYYNqh
	NZYJwlEPZGFQxXQn6MEj9Qn8GWiPYUDh9nG9uinPwwS6/AJiRJyCPW6lQYoYFd/rGWMyiEUNpzx
	Xw6MS5yaant3ItO9lJ418RTN1XEwjViUWN4rT0lvN6Niyl9z5DrW21QoqayWO83tNQrx2KOBI50
	M8TIkl8NlDr2ZRz9O+NN8qBXKTkcM/O5/iY4BEaI3iloAVEOK7Hchyb8X0KS4NY+63sQ/E=
X-Received: by 2002:a05:6000:1a8c:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-488717328e9mr817751f8f.22.1790202680711;
        Wed, 23 Sep 2026 15:31:20 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm10613192f8f.26.2026.09.23.15.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:31:19 -0700 (PDT)
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
	Pedro Falcato <pfalcato@suse.de>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2] x86/mm: Drop the page allocation from pud_free_pmd_page()
Date: Thu, 24 Sep 2026 03:31:16 +0500
Message-ID: <20260923223116.20090-1-mikhail.v.gavrilov@gmail.com>
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

Edge 3 is the one that should not exist.  Now that the attribute-change
path takes the init_mm mmap lock, reclaim can acquire it, so the lock
must not be held over an allocation which can enter reclaim.  CPA itself
follows this rule: split_large_page() drops the lock around
pagetable_alloc().  The huge vmap path, which has held the same lock
since commit 26444eb71465
("mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF"),
does not: pud_free_pmd_page() allocates a scratch page underneath it.

That page does not need to exist.  It only holds a copy of the PMD
entries, so that they can be cleared before the PUD is.  But the PMD
table itself is freed after pud_clear() and the flush, so the code
already relies on the table being out of reach of the page walker at
that point - and if it is safe to free it then, it is safe to read it
then.  Nobody else writes to it either: vmap_try_huge_pud() only gets
here for a range covering the whole PUD, and ptdump is kept out by the
init_mm lock the caller holds.

So clear the PUD, flush, and free the PTE tables straight from the
detached PMD table - the same order pmd_free_pte_page() uses one level
down.  With no allocation left the cycle is gone, and so is the only way
this function could fail.

The copy came with commit 5e0fb5df2ee8
("x86/mm: Add TLB purge to free pmd/pte page interfaces"), whose
changelog explains the flush but not the copy; the allocation itself was
already questioned in review back then [1].  The same lock cycle was
also reported from the i915 shrinker, with &vm->mutex in place of
pool_shrink_rwsem [2].

Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
Suggested-by: Pedro Falcato <pfalcato@suse.de>
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/20180529144438.GM18595@8bytes.org # [1]
Link: https://lore.kernel.org/80993b70-352f-4069-84c7-39a04c061e98@intel.com # [2]
Link: https://lore.kernel.org/20260916062222.27347-1-mikhail.v.gavrilov@gmail.com
---

v2:
 - Drop the scratch page instead of allocating it with GFP_NOWAIT: the
   PMD table can be read after pud_clear() and the flush (Pedro Falcato)
 - Capitalise the subject per tip conventions
v1: https://lore.kernel.org/20260916062222.27347-1-mikhail.v.gavrilov@gmail.com

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX (Navi 31), lockdep
and KASAN enabled.  Reproducer, on a lockdep kernel with a TTM driver
bound and non-zero wc/uc rows in /sys/kernel/debug/ttm/page_pool:

  # cat /sys/kernel/debug/ttm/page_pool_shrink

This runs the TTM shrinker with fs_reclaim held.  Unpatched
(7.3-rc3, f6e7b42bf05b) it produces the report above on demand.

With this patch (7.3-rc4, fe2ec83746e5): a boot-time kprobe on
pud_free_pmd_page() recorded one call from a udev worker during boot -
in the unpatched kernel's lockdep reports the same function is entered
from amdgpu_ttm_init() -> ioremap_page_range(), so this box reaches the
changed path without instrumentation.  In that same boot the reproducer
freed 354 write-combined pages through set_pages_wb(), with no report
and debug_locks still 1 afterwards.

 arch/x86/mm/pgtable.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index cb03f5a2b243..6a338d6e80e9 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -712,40 +712,31 @@ int pmd_clear_huge(pmd_t *pmd)
  *
  * Context: The PUD range has been unmapped and TLB purged.
  * Return: 1 if clearing the entry succeeded. 0 otherwise.
- *
- * NOTE: Callers must allow a single page allocation.
  */
 int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 {
-	pmd_t *pmd, *pmd_sv;
+	pmd_t *pmd;
 	struct ptdesc *pt;
 	int i;
 
 	pmd = pud_pgtable(*pud);
-	pmd_sv = (pmd_t *)__get_free_page(GFP_KERNEL);
-	if (!pmd_sv)
-		return 0;
-
-	for (i = 0; i < PTRS_PER_PMD; i++) {
-		pmd_sv[i] = pmd[i];
-		if (!pmd_none(pmd[i]))
-			pmd_clear(&pmd[i]);
-	}
 
 	pud_clear(pud);
 
 	/* INVLPG to clear all paging-structure caches */
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
 
+	/*
+	 * The PMD table can no longer be walked, but it is still allocated:
+	 * free the PTE tables straight from it, then the table itself.
+	 */
 	for (i = 0; i < PTRS_PER_PMD; i++) {
-		if (!pmd_none(pmd_sv[i])) {
-			pt = page_ptdesc(pmd_page(pmd_sv[i]));
+		if (!pmd_none(pmd[i])) {
+			pt = page_ptdesc(pmd_page(pmd[i]));
 			pagetable_dtor_free(pt);
 		}
 	}
 
-	free_page((unsigned long)pmd_sv);
-
 	pmd_free(&init_mm, pmd);
 
 	return 1;
-- 
2.55.0

