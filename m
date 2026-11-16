Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813215;
	b=Dv6m+WHwLQ46dYJmXJCKfzztZqH1VKQwjqbsJsQOuU21CqKHjOEpTK3BXgOsFQ8LpFUO
	 Y1VhMlGtij1dgBeTS/WEGKp18tHFW2DDKOH1VWWKRDIQt1ZKsefhJzHwT24YTisITvq0P
	 0Oui2+OP8YTAQ9pggbz5YG13LR0b1RDzNzWsiCfBJmrr7YoPVnolkbp04SnatZO461DkV
	 0IXX9xAmqUA6v2qa4CZ0Cms3s2P5mWNjdhMqMk4cUpN1vU5O569L5wpLv+k6406qXzuZ0
	 ZiJcW61Gksvjs7rGQ8RedGzmZKnBrWXkYr/HX6RYItOZkKOP+kfkStYlVH2TC4cDn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813215;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OkgfjJfKGIx3ULtuBKyWwXSAvJnNVfF7lRvSAV7abaM=;
	b=KNgShPaYuUQzLSRiVFGl17QF+zE340Jxeph0aZFmC4IZzQS69FRjQMALsAhOihmEoLIl
	 f0ozgrzp3PnMfv74+zQqjMI8bZQrU3rZxYvX79H/U8kfgo025ZtAXWJthyhe2F4U4VJ5B
	 0TUwKuUoIJdIkH6qehwrkACN+z84JRoaEne57CMA6QgR8I/xSGee6lsMcKCcnmvcPaTxR
	 2ZcFp3GCNzFYKZLJBLN34hsKQ4XAgMqrTxWlpF0V4HX0z4/kb1ez1zRUogRSXQzqZEuzv
	 F8GoNMVVnw6LH2g0lv0fyaLYtc4Rldp1PhSjJpetMEjxhYTMIRT3sh7H+LMEIrxsnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Of4lsz3c;
	arc=none smtp.remote-ip=95.215.58.198
Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE15606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE15606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Of4lsz3c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m/Ac+mzRFeJIEx6vjbGzkyHImn4ediK/dODwPh9sWhI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813212; v=1; x=1795418012;
 b=Of4lsz3cWS4D1+2RzZ0YuO2qq8m9vzH9D4ohHHkX1LUolYMmrGPtNmcDVOW3nyylod4IMiyI
 PbLC48TuoyBZYroXhjPdCb1y8qQ0SEc0mEPaWtwk/mgKDGHXkctwTMqGsGoKStIaPsfCfbLnLfg
 tNu4JyqvgfNjbpk0aL2n5VwY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id afbccf1c33743f40;
	Mon, 16 Nov 2026 07:13:32 +0000
X-Mizu-Trace-ID: afbccf1c33743f40
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
Subject: [PATCH v5 00/11] mm/vmalloc: fix up vmap error handling
Date: Mon, 16 Nov 2026 15:13:14 +0800
Message-Id: <20261116071325.263682-1-hao.ge@linux.dev>
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

Patch 1 gives __vunmap_range_noflush() a can_resched argument, the
failure paths can be reached with a non-blocking gfp mask and the
undo must not schedule there. Patch 2 is the KMSAN part, the shadow
and the origin of a range are mapped by two separate calls, so the
rollback there has to cover both. Patches 3 and 4 reject an unaligned
range at the entries of vmap_page_range() and __vunmap_range_noflush().
Patch 5 only flushes the cache once the mapping succeeded. Patches 6
to 9 add the rollback to the mapping functions, one entry per patch,
vmap_page_range(), __vmap_pages_range_noflush(), the KMSAN metadata
and the batched vmap() path. Patches 10 and 11 drop the powerpc and
percpu cleanups that are not needed anymore.

Changes since v4:
- new patch 1, the unmap paths can run under a non-blocking gfp mask
  and must skip cond_resched(); it carries a Fixes: tag so it travels
  to stable together with patch 2
- drop v4 patch 2, the KMSAN-disabled vunmap skip. !kmsan_enabled
  does not mean no metadata was installed, KMSAN_WARN_ON() can clear
  the flag at runtime, on Suren's review
- v4 patch 3 now warns and returns -EINVAL at vmap_page_range(),
  instead of BUG_ON()ing inside vmap_range_noflush()
- drop v4 patch 4, the walk check. No in-tree caller passes an
  unaligned range to vmap_pages_range_noflush_walk(), the vmap
  allocator guarantees the alignment for vmalloc()/vmap()/
  vm_map_ram()
- v4 patch 5 warns and bails out instead of BUG_ON(), following
  Ulad's review of v4
- v4 patch 7 is split into patches 6 to 9, one mapping entry per
  patch. The batched vmap() path is covered now too, on Suren's
  request

[1] https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/

v4 link: https://lore.kernel.org/all/20261110112546.261415-1-hao.ge@linux.dev/
v3 link: https://lore.kernel.org/all/20261026080329.140244-1-hao.ge@linux.dev/
v2 link: https://lore.kernel.org/all/20261019054531.87652-1-hao.ge@linux.dev/
v1 link: https://lore.kernel.org/all/20261009063619.112313-1-hao.ge@linux.dev/

Hao Ge (11):
  mm/vmalloc: skip cond_resched() in the vmap unmap paths when atomic
  mm/kmsan: undo the shadow mapping when the origin mapping fails
  mm/vmalloc: reject an unaligned range in vmap_page_range()
  mm/vmalloc: reject an unaligned range in __vunmap_range_noflush()
  mm/vmalloc: only flush the cache after the vmap succeeded
  mm/vmalloc: undo what vmap_page_range() mapped on failure
  mm/vmalloc: undo what __vmap_pages_range_noflush() mapped on failure
  mm/vmalloc: drop the KMSAN metadata in vmap_pages_range_noflush() on
    failure
  mm/vmalloc: undo what vmap_pages_range_batched() mapped on failure
  powerpc: drop redundant unmaps of failed vmap mappings
  mm/percpu: stop unmapping the CPU that failed to map

 arch/powerpc/kernel/isa-bridge.c |   5 +-
 arch/powerpc/kernel/pci_64.c     |   4 +-
 include/linux/kmsan.h            |   8 +-
 mm/kmsan/hooks.c                 |  18 ++--
 mm/kmsan/shadow.c                |   9 +-
 mm/percpu-vm.c                   |   5 +-
 mm/vmalloc.c                     | 154 +++++++++++++++++++++++--------
 mm/vmalloc.h                     |   6 +-
 8 files changed, 151 insertions(+), 58 deletions(-)

-- 
2.25.1

