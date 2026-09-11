Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E61538A702
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113881; cv=none; b=jZ3AjfmwgtLQ2oNqTokDkrNqGuzPYuhmatUoqfxzpQNfnJduVFAjkTC14Uoo/qwiJdgUxqb/lDoquVWKKOLRUrdyRvYqRbK/wHQVl/w3L87ffvAmIlXVFYV6UBn+rX8zBqNxvXfZ1rBPLFGpYRNKJ/k1LoIfQMgNUZl+J6PA+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113881; c=relaxed/simple;
	bh=8KSZ4Ns9Lw0fDoF4mbOWzzHnSr8NxHZw+VL33NFbCN0=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=tapCEznBrJ2r+VMkK77SDTMffiO8YmrlOyCBY0b4HvT3Z29eEIalezOcCzZUAyf+bWjiyJ7E04c+PMU0UkqHeNX2R0z16NfGqSseri596RDC5D7wjqiFgptC1Poksu1lnN4tF5hwRsP+JS71QtjAZwLEB5McbLW/8xtIpowZQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hh6Wy6T6vz8Xrrb;
	Fri, 11 Sep 2026 16:04:30 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 68B84Jf9021542;
	Fri, 11 Sep 2026 16:04:19 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 16:04:21 +0800 (CST)
X-Zmail-TransId: 2afa6aa3b605ff5-a4ff6
X-Mailer: Zmail v1.0
Message-ID: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
Date: Fri, 11 Sep 2026 16:04:21 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
        <surenb@google.com>, <rppt@kernel.org>, <ziy@nvidia.com>,
        <baolin.wang@linux.alibaba.com>, <nico.pache@linux.dev>,
        <dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
        <chengming.zhou@linux.dev>, <usama.arif@linux.dev>,
        <gourry@gourry.net>, <harry@kernel.org>, <vbabka@kernel.org>,
        <peterz@infradead.org>, <borntraeger@linux.ibm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: =?UTF-8?B?W1BBVENIIDAvNF0gbW0va3NtOiB1c2UgcGVyLVZNQSBsb2NraW5nIGZvciBmaW5kX21lcmdlYWJsZV92bWEoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68B84Jf9021542
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 11 Sep 2026 16:04:30 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA3B60E.002/4hh6Wy6T6vz8Xrrb

From: Xu Xin (ZTE) <xu.xin@linux.dev>

KSM scans VM_MERGEABLE VMAs and currently protects each scan with
mmap_read_lock(). Per-VMA locking allows KSM to read-lock only the VMA
it is actually interested in, so that unrelated mmap()/munmap() activity
in the same mm no longer blocks ksmd.

This series is organized as follows:

  Patch 1 removes an unused 'vma' member from struct folio_walk.  It has
  never been used since its introduction and is pure cleanup.

  Patch 2 adds a 'walk_lock' member to struct folio_walk and extends
  folio_walk_start() to assert the required locking mode.  Existing
  callers are converted to pass PGWALK_RDLOCK, so there is no functional
  change.  This prepares folio_walk_start() for callers that hold a
  per-VMA read lock instead of mmap_read_lock(), which is needed by the
  Patch 4. No functional change.

  Patch 3 tranforms the boolean 'lock_vma' into the enum 'page_walk_lock'
  without any behavior changed, which is prepared for the Patch 4 to use
  per-VMA locking. No functional change.

  Patch 4 introduces find_mergeable_vma_locked(), which uses the
  universal per-VMA locking helper vma_start_read_unlocked() to look up
  and read-lock a VM_MERGEABLE VMA without taking mmap_read_lock().  All
  KSM call sites that previously used find_mergeable_vma() under
  mmap_read_lock() are converted to the new helper, and the locking in
  get_mergeable_page() is switched to PGWALK_VMA_RDLOCK_VERIFY so that
  folio_walk_start() can verify the per-VMA lock is held.

A microbenchmark was run to measure the time KSM takes to merge a
victim region under mmap_lock contention. Under interference from 4 churner
threads, the merge time of the per-VMA KSM-optimized kernel is
significantly reduced by 50%.

Xu Xin (4):
  mm/pagewalk: delete the unused member
  mm: make folio_walk_start()'s locking asserts scalable
  mm/ksm: make break_ksm() more scalable
  mm/ksm: add find_mergeable_vma_locked() to use per-VMA locking

 arch/s390/mm/fault.c     |  4 +-
 include/linux/pagewalk.h |  2 +-
 kernel/events/uprobes.c  |  4 +-
 mm/huge_memory.c         |  4 +-
 mm/ksm.c                 | 85 ++++++++++++++++++++++++----------------
 mm/migrate.c             |  8 +++-
 mm/pagewalk.c            | 10 ++++-
 mm/rmap.c                |  4 +-
 8 files changed, 79 insertions(+), 42 deletions(-)

-- 
2.25.1
