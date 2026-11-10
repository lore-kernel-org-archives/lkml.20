Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309866;
	b=YpezD5e+cLONdQAJQK5RddiN+f1wwHQgF+yF6wuCTAQ0/C4sGPZ/KvDJRPH6K95yjCT6
	 gn5Kry2fl2/OG5ZW+tf5Q39Y9fBnIyOv4GS2IaidylxgBtpgkmS8pUGgZ+CdNqDJhNmDw
	 QbQtXPP0XMGsLz7/izY9zssaBsvNdVRktv7bPaDFj1XgbSzc4xL+cYrmdIIgZnVK/Gpkm
	 Ibzy+hLHmMtEGQlDPqYHPYDvU9SHb1fYHJIvlI7M8pM4y7DUBD/e83p/2/goTrlCZekH7
	 ufhaZHf+T/yjzrBynv//K8TCeg8oQ9kl/zxbO0kpkPn9zZLHNHnlU3PSmgkPFE8iDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309866;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jXkc4Pg22XsApi0R9EIbHkd3C60IxMCsWbohhWDu12w=;
	b=i/6qdTHoRl6WTZuXdkA1ZsOeVKh0IFRmoSpVn0ry3alFajW0AOhwWAU8Y035AOjZaTFh
	 F5N9ptBbDbFZpBkEPaQO34jUmILMaNAbr+En+zPc/R06AZ4l1F3bUDE+jghRhNz8eWcuq
	 tU7r1tO20dSpX65uheNvvGm+hYz8SGVeGKu5pUeuYwN4hS9xzdoS+iV3ZIeBxB8f9UvI4
	 3gMg/3snHhZaUTc92ssLQNp0oPKhWtP6OGW9gc/Q4ul06IqWezHZlpCrBBnqsFZ5K5nbU
	 2xX5ihLvucd4Ajz4cJm//7/bAjqUCwQvp+zhHkN7+ISOWen5PIrFGxpf63HGOjAXgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GPqeMPci;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D51D60A3804
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D51D60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GPqeMPci
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nFXXK04ww1DrtBAna3L3pCT6UTCtVZkSGjzMSb1SDQw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309863; v=1; x=1794914663;
 b=GPqeMPciOFNGyTY4nue/MBcE8VttIUU8w+tstDICqER3DfWu9vGO+mF1c0YpvPirnm8G9T24
 cMmiyhbeztZ3CA1I+xpC4R0aM02iDNjiNe3wu2gj/ZK/+eGia0E8PDV7OpENruPk5NHWj+xWx22
 TvqB2Uggo1eGyUS2/7HSWU08=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cb9491708f7d4509;
	Tue, 10 Nov 2026 11:24:23 +0000
X-Mizu-Trace-ID: cb9491708f7d4509
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
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
Subject: [PATCH v4 0/9] mm/vmalloc: fix up vmap error handling
Date: Tue, 10 Nov 2026 19:25:37 +0800
Message-Id: <20261110112546.261415-1-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
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

__vmap_pages_range_noflush() and friends can install some PTEs before
failing and leave them mapped, and the kernel callers do not agree on
who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
roll back what they mapped before the failure, while
vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
__vmalloc_area_node() rely on the mapping functions cleaning up and
do not call anything like vunmap_range() themselves. When the same
range is mapped again, the attempt hits the leftovers and fails with
a warning in vmap_pages_pte_range(). A leftover huge pmd is worse.
During the retry, vmap_try_huge_pmd() calls pmd_free_pte_page() on
it, and the x86 implementation cannot tell a leaf entry from a page
table and frees the mapped page.

After discussing with Suren and Ulad [1], we move the rollback into
the mapping functions. A failed vmap leaves nothing mapped, and the
callers no longer clean up after it.

Patch 1 is the KMSAN part. The shadow and the origin of a range are
mapped by two separate calls, so the rollback there has to cover
both. Patch 2 is its disabled-KMSAN counterpart. Patches 3 to 5 bug
out on an unaligned range at the entry of the three range walkers.
Patch 6 only flushes the cache once the mapping succeeded. Patch 7
adds the rollback to __vmap_pages_range_noflush() and
vmap_page_range(). Patches 8 and 9 drop the powerpc and percpu
cleanups that are not needed anymore.

Changes since v3:
- drop v3 patch 3. The clamp papered over the caller bug, a bad
  range now BUG_ONs at the unmap entry
- drop v3 patch 4. The reworked walk (24bbe1c56f63a) propagates
  the errors already
- drop v3 patch 6. The walk below checks the range already
- the map side checks moved from the pte level to the entries of
  vmap_range_noflush() and the walk, and became BUG_ON, in line
  with the unmap side
- rebase onto the walk rework, commit messages updated accordingly

[1] https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/

v3 link: https://lore.kernel.org/all/20261026080329.140244-1-hao.ge@linux.dev/
v2 link: https://lore.kernel.org/all/20261019054531.87652-1-hao.ge@linux.dev/
v1 link: https://lore.kernel.org/all/20261009063619.112313-1-hao.ge@linux.dev/

Hao Ge (9):
  mm/kmsan: undo the shadow mapping when the origin mapping fails
  mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
  mm/vmalloc: BUG_ON() on an unaligned range in vmap_range_noflush()
  mm/vmalloc: BUG_ON() on an unaligned range in
    vmap_pages_range_noflush_walk()
  mm/vmalloc: BUG_ON() on an unaligned range in __vunmap_range_noflush()
  mm/vmalloc: only flush the cache after the vmap succeeded
  mm/vmalloc: undo partial mappings inside the mapping functions
  powerpc: drop redundant unmaps of failed vmap mappings
  mm/percpu: stop unmapping the CPU that failed to map

 arch/powerpc/kernel/isa-bridge.c |  5 +--
 arch/powerpc/kernel/pci_64.c     |  4 +-
 include/linux/kmsan.h            |  8 +++-
 mm/kmsan/hooks.c                 | 21 ++++++---
 mm/kmsan/shadow.c                |  9 +++-
 mm/percpu-vm.c                   |  5 ++-
 mm/vmalloc.c                     | 75 ++++++++++++++++++++++++--------
 mm/vmalloc.h                     |  6 ++-
 8 files changed, 94 insertions(+), 39 deletions(-)

-- 
2.25.1
