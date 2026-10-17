Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013774A263B
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792280140; cv=none; b=WaJj8fu+LXbUkThL3KNeFxensXxWHHv5sjH1TNNa4O5inDhvLKPRAfGgd0ANSYgUIepKpWL6EFjH2neVMIc8QbBRV7GB1eJbk0NAyGl1xpZ0VLHU8oE8s/NtZcv18qLla6EeC6b7u2dJh2csHg2QHnnEH9xSgXpZk0LFiuu7L6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792280140; c=relaxed/simple;
	bh=UHtqiZLuYyqH67npR3H4I6SfzgHEB5rRh3Bi7cDoWAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKtYn6pRVwRUtsipeXN9bi813QARAw5+i3KtAUiCto+8zrG28qfNMuWyHORCPtkzS7PwSE28/fEw6ljHYd8LZzhZS7BT0//ZveVheaQzeRR7kz9n/FHB348aelM6G7o7vcdLLqSNxJRYq8CD6AHIlBAdsl/4FPSNUusCCTVcR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIDvz-003oqe-5T;
	Sat, 17 Oct 2026 19:35:27 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] mm/mremap: do not charge a shrinking move twice
Date: Sat, 17 Oct 2026 19:35:26 -0400
Message-ID: <20261017233527.797191-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since v6.15 every mremap() that shrinks an accounted mapping and moves
it with MREMAP_MAYMOVE | MREMAP_FIXED leaves old_len - new_len bytes
charged to vm_committed_as for good.  An unprivileged process that
repeats such a call keeps raising Committed_AS in /proc/meminfo; with
vm.overcommit_memory=2 it reaches CommitLimit, after which every
accounted allocation in the system (private writable mmap(), brk(),
fork()) fails with ENOMEM until reboot.  A loop of 1000 calls moving a
2 MiB private anonymous mapping to a 1 MiB fixed destination raises
Committed_AS by 1 GiB.

mremap_to() first unmaps the tail of the source with shrink_vma(),
which uncharges it, and then sets old_len to new_len so that the move
looks like a same-size one.  vrm->delta, the absolute difference of the
two lengths computed in do_mremap(), is not updated, and
vrm_calc_charge() charges delta pages for the move.  For a move that
does not unmap the source the charge only has to cover the growth from
old_len to new_len, which here is zero; nothing ever releases the extra
charge.  Before the vma_remap_struct conversion move_vma() charged
new_len - old_len with the updated old_len.

Recompute delta after the shrink.

Tested with the program in the notes under QEMU (x86_64 defconfig):
Committed_AS grows by about 1 GiB per run without this patch and stays
flat with it.

Fixes: b714ccb02a76 ("mm/mremap: complete refactor of move_vma()")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (any accounted private mapping; watch Committed_AS):
    
    #define _GNU_SOURCE
    #include <stdio.h>
    #include <sys/mman.h>
    
    static long committed_kb(void)
    {
    	char line[128];
    	long kb = -1;
    	FILE *f = fopen("/proc/meminfo", "r");
    
    	while (f && fgets(line, sizeof(line), f))
    		if (sscanf(line, "Committed_AS: %ld kB", &kb) == 1)
    			break;
    	if (f)
    		fclose(f);
    	return kb;
    }
    
    int main(void)
    {
    	const size_t old_len = 2 << 20, new_len = 1 << 20;
    	long before = committed_kb();
    
    	for (int i = 0; i < 1000; i++) {
    		char *src = mmap(NULL, old_len, PROT_READ | PROT_WRITE,
    				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    		char *dst = mmap(NULL, new_len, PROT_NONE,
    				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    
    		if (mremap(src, old_len, new_len, MREMAP_MAYMOVE | MREMAP_FIXED,
    			   dst) != dst)
    			return perror("mremap"), 1;
    		munmap(dst, new_len);
    	}
    	printf("leaked %ld kB\n", committed_kb() - before);
    	return 0;
    }
    
    $ gcc -O2 -o mremap-shrink-charge mremap-shrink-charge.c && ./mremap-shrink-charge
    before: leaked 1024000 kB   (every run; Committed_AS 3744 -> 1027744 -> 2051744 kB)
    after:  leaked 0 kB

 mm/mremap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index 444f37d7cd28..2dd41c611fdd 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1523,6 +1523,7 @@ static unsigned long mremap_to(struct vma_remap_struct *vrm)
 
 		/* Set up for the move now shrink has been executed. */
 		vrm->old_len = vrm->new_len;
+		vrm_set_delta(vrm);
 	}
 
 	/* MREMAP_DONTUNMAP expands by old_len since old_len == new_len */

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

