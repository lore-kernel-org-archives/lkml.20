Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEDF47ACEC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983652; cv=none; b=M9ZL0bVvV/dW+cj/Di4rqn+qyU8s2ieqHYid7EciO6KyFE7Fs/vnJZPOhwQS17Zc0zw6NghhWRLjHb5U93ua1v4GZq8yh0ecvC00lveOjOP2HAeLvqz76yYfcEteTQ4JKpGmachquDVUtRuYUuZlr0AC2RWW2FOyQifUhd19s7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983652; c=relaxed/simple;
	bh=jsC2pQAyHszwvncz+uoLU1FcBTkldry2Z82F1l4wIEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsjQlwjSKIeeTWu0x/Z/D7w2Q5xZiUIn/TlgP15e8UZWTHoDhwY7/wnvF8W0Q1BIOfRGVBJ2h5aiyFEQu9NcXsxIPa78T43ox3ttwgEK/eg4sh8f7RJivMHecuIuPbusQUhYmrB5zZYnC9J7Y+ZcR3Glx2dE8wKNernPTi8nuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xGynv-005sVG-1B;
	Wed, 14 Oct 2026 09:13:59 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] mm/mlock: use a long for the page count in mlock_fixup()
Date: Wed, 14 Oct 2026 09:13:58 -0400
Message-ID: <20261014131358.780240-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mlock_fixup() adjusts mm->locked_vm, an unsigned long, by the number of
pages whose VM_LOCKED state it changes, but computes that number in an
int:

	int nr_pages;
	...
	nr_pages = (end - start) >> PAGE_SHIFT;
	...
	mm->locked_vm += nr_pages;

When a single VMA range of 2^31 pages (8 TiB with 4 KiB pages) or more
is locked or unlocked, the count is truncated to 32 bits and then
sign-extended, so locked_vm is changed by the wrong amount, while
munmap(), mremap() and the other paths that maintain locked_vm use the
full unsigned long page count.

Such a range is reachable on 64-bit architectures with a 47-bit or
larger user address space (x86_64, arm64 with 48-bit VA, riscv64 Sv48)
by a task with CAP_IPC_LOCK or a raised RLIMIT_MEMLOCK, which do_mlock()
checks against the full untruncated length.  It costs nothing with
MAP_NORESERVE and MLOCK_ONFAULT/MCL_ONFAULT, since then no page is
populated.  On x86_64, after

	p = mmap(NULL, 8UL << 40, PROT_READ | PROT_WRITE,
		 MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
	mlock2(p, 8UL << 40, MLOCK_ONFAULT);

VmLck in /proc/self/status reads 18446744065119617024 kB instead of
8589934592 kB; munmap() of the region then subtracts the true size and
leaves VmLck at 18446744056529682432 kB instead of 0.  With 16 TiB,
locked_vm is not changed at all, VmLck stays 0 kB, and after the task
drops CAP_IPC_LOCK or lowers RLIMIT_MEMLOCK, mlock(), mmap(MAP_LOCKED)
and the other mlock_future_ok() and account_locked_vm() users enforce
RLIMIT_MEMLOCK against that count, so they let the task lock memory
beyond its limit (or, in the 8 TiB case, refuse every further lock).
The error persists for the life of the mm; unlocking the range in pieces
skews it further.  The wrong count is per-mm accounting only: it does
not change which pages are locked.

The int has been there since before git history (the variable was named
"pages" until it was renamed in 2.6.28); every other updater of
locked_vm uses an unsigned long or long count.  Make nr_pages a long,
which holds the page count of any user range and its negation, so the
existing sign handling is unchanged.

Found by formal verification of mm/mlock.c against the kernel binary.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer: the program below, run as root from an initramfs on
    v7.3-rc7-28-g4056b3c9d3c9 defconfig (LLVM=1) under QEMU, x86_64 (TCG,
    -cpu max) and riscv64 (virt, -cpu max); a longer version also checks
    munmap(), a 16 TiB lock and RLIMIT_MEMLOCK enforcement.
    
                                           before                   after
      VmLck after locking 8 TiB            18446744065119617024 kB  8589934592 kB
      VmLck after munmap() of it           18446744056529682432 kB  0 kB
      VmLck after locking 16 TiB           0 kB                     17179869184 kB
      mlock() of 16 pages over a 16-page   succeeds                 ENOMEM
      RLIMIT_MEMLOCK, CAP_IPC_LOCK dropped
    
    // Needs root (or CAP_IPC_LOCK), >= 16 TiB user VA, vm.overcommit_memory != 2.
    #define _GNU_SOURCE
    #include <stdio.h>
    #include <string.h>
    #include <sys/mman.h>
    #include <sys/syscall.h>
    #include <unistd.h>
    
    int main(void)
    {
    	size_t len = 8UL << 40;		/* 2^31 pages of 4 KiB */
    	char line[128];
    	FILE *f;
    	void *p;
    
    	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
    		 MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
    	if (p == MAP_FAILED || syscall(SYS_mlock2, p, len, 1 /* MLOCK_ONFAULT */)) {
    		perror("mmap/mlock2");
    		return 2;
    	}
    	f = fopen("/proc/self/status", "r");
    	while (fgets(line, sizeof(line), f))
    		if (!strncmp(line, "VmLck:", 6))
    			printf("%s", line);	/* expected 8589934592 kB */
    	return 0;
    }

 mm/mlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index 39215a3eab1f..4fb43cddafa8 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -470,7 +470,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 {
 	const vma_flags_t old_vma_flags = vma->flags;
 	struct mm_struct *mm = vma->vm_mm;
-	int nr_pages;
+	long nr_pages;
 	int ret = 0;
 
 	if (vma_flags_same_pair(&old_vma_flags, new_vma_flags) ||

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.53.0

