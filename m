Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C754825BA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157136; cv=none; b=ugGbURhGmMGtPFaHejlXODdmDZDbOFVNtx3SiBmFvuPZ16qTsRlYLynoY+/LQobV+CawBInhMNwBeXbRfoZlZLmCINuiNobrU6WgWNWW9ZpVhbpEE5VY9chplsDEzcsb7nUG1R44wVOS6bCmpaAxY/dX2uaPBnFxXvSnQfKQtX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157136; c=relaxed/simple;
	bh=AiiZ4DiR6tTRDnOKRO9Mgk5fgpd4Py7avti+Sgg9f6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fego0CbQt51kNfWJhl5k8sDkSUss1H3BRV3NLjbp6nW5rjfR0cFZFSSONiirTAHJIe6P6G6lkTVpHdwFTKsbkK8/ayJPG4JaLAHBS6K88SE/EZj15qYWn32mX0FXknzHOczGVENi7nxZkK7Rn3AUjA4twL6VGK+gnCrFoXHxPUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHhvr-00EzQh-2V;
	Fri, 16 Oct 2026 09:25:11 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] mempool: fix min_nr exceeding the elements array after concurrent resizes
Date: Fri, 16 Oct 2026 09:25:10 -0400
Message-ID: <20261016132510.789715-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mempool_resize() shrinks a pool by dropping pool->lock around every
free_fn() call and, once the pool holds no more than new_min_nr
elements, stores new_min_nr into pool->min_nr.  new_min_nr was only
compared against pool->min_nr before the lock was first dropped, so that
store assumes nothing changed meanwhile.  The kernel-doc allows
mempool_alloc()/mempool_free() to run while a resize is in progress and
the grow path also copes with concurrent resizes ("Raced, other resize
will do our work"), but the shrink path does not: while its lock is
dropped another resize may shrink the pool below new_min_nr and a third
one may grow it again to a size between the two, replacing
pool->elements with an array of exactly that size.  Storing the stale
new_min_nr afterwards leaves pool->min_nr larger than the elements
array.

Interleaving on a pool with min_nr = curr_nr = 10:

  CPU A: mempool_resize(pool, 8)
    takes the lock, 8 <= 10 so it shrinks: remove_element(), drops the
    lock, calls free_fn() and is preempted there
  CPU B: mempool_resize(pool, 3)
    completes: curr_nr = 3, min_nr = 3, elements still has 10 slots
  CPU B: mempool_resize(pool, 5)
    completes: elements = kmalloc_objs(5), min_nr = 5, curr_nr = 5
  CPU A: retakes the lock, 8 < curr_nr (5) is false, stores min_nr = 8
    while elements has 5 slots

Every later mempool_free() sees curr_nr < min_nr and add_element()
stores the returned element at elements[5], [6] and [7], past the end
of the 5-slot kmalloc allocation: a heap out-of-bounds write, i.e. slab
corruption, a KASAN report, or a crash in whichever unrelated object
sits next to the array.  The invariant that breaks is that pool->min_nr
never exceeds the size of pool->elements; every other path that changes
min_nr or elements keeps it.

An in-tree caller can hit this: fs/smb/client resizes the global
cifs_req_poolp from cifs_demultiplex_thread() (grow, when a TCP session
is created) and from clean_demultiplex_info() (shrink, when one goes
away).  The two are coordinated only through the atomic
tcpSesAllocCount, so mounts and unmounts racing on one client run the
resizes above concurrently; pool->free is kmem_cache_free() there and
the window is a preemption inside it.  The other callers
(block/blk-zoned.c, drivers/s390/scsi/zfcp_erp.c) serialise their
resizes.

The shrink path has stored new_min_nr unconditionally since
mempool_resize() was introduced, while the grow path has always
re-checked pool->min_nr after reacquiring the lock.

Re-check new_min_nr against pool->min_nr under the lock before storing
it.  If a concurrent resize has shrunk the pool below new_min_nr in the
meantime, keep that resize's min_nr (and whatever array it installed),
as the grow path already does; otherwise the store is unchanged.  The
elements the loop has already freed stay freed, which is right either
way because the pool's limit is now below new_min_nr.

Found by formal verification of mm/mempool.c against the kernel binary.
Reproduced with a userspace build of the affected functions in which the
free_fn() callback drives the interleaving above: before the fix min_nr
ends at 8 with a 5-slot array and the next mempool_free() writes past it
(AddressSanitizer heap-buffer-overflow); after the fix min_nr stays at 5
and the element is handed to free_fn().  Not reproduced on a running
kernel, where the window is a single preemption inside free_fn().

Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

 mm/mempool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/mempool.c b/mm/mempool.c
index cb74e718b2c6..95533e2975ce 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -378,7 +378,9 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
 			pool->free(element, pool->pool_data);
 			spin_lock_irqsave(&pool->lock, flags);
 		}
-		pool->min_nr = new_min_nr;
+		/* Raced, the array may now be smaller than new_min_nr */
+		if (new_min_nr <= pool->min_nr)
+			pool->min_nr = new_min_nr;
 		goto out_unlock;
 	}
 	spin_unlock_irqrestore(&pool->lock, flags);

base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
-- 
2.53.0

