Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6A47F78F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388704; cv=none; b=t9RD7+XH6hDLVsaM0zcQHAPwWlyEcSxG0C4OmEYo0UGHCO1q8KZ8uOEFR8blBUeXPDSMhxMk3ujFOmm9odRgdCyMrsex3bVytGwzcE5lfr4N3Z6Ej2pQYmpcs5Y6c7h4jStDQxDjX1tEk+uMX77a7WbxD2fbxh32OvdNN7hUjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388704; c=relaxed/simple;
	bh=/fcqj4m3aIuWshJpvmCFywqs73fNC8e2m8IxJm9UhVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gM9ZCwg66EnxTHVxvMDrsz/QTBvy0GGVh+3L7PagAktlqVknkWkIQB16koF4phvzARLnN2C8hQm7HqRnSM9Mqvx9SixxzVFK2KdOL1kWrRuG3gfNRpp1Qo5/2a495b0ia8FxOtaOBWrATNqjUCH8KkWpu1WGCKjwa5bQVS/ka/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L1iXzGB8; arc=none smtp.client-ip=95.215.58.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L1iXzGB8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/fcqj4m3aIuWshJpvmCFywqs73fNC8e2m8IxJm9UhVM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792388661; v=1; x=1792993461;
 b=L1iXzGB8MgXBJes32c8pUMkR6QGc495686Fb3M4e/WS4kl432MCwRFb90MraL3UY52FsSOdB
 kg8gX69i2gxRtg4dzsUOEgHN7DI38ImxPA56Rx43onDahWkaAEn84BOga3EodVgkHd92FLAgw32
 ChH/tXF598lC+v7R4/pau8RA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c488493aed6b46f9;
	Mon, 19 Oct 2026 05:44:21 +0000
X-Mizu-Trace-ID: c488493aed6b46f9
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v2 0/5] mm/vmalloc: make the mapping functions undo their partial mappings
Date: Mon, 19 Oct 2026 13:45:25 +0800
Message-Id: <20261019054531.87652-1-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vmap_pages_range_noflush() and friends can install some PTEs before
failing and leave them mapped, and the kernel callers do not agree on
who cleans them up. pcpu_map_pages() and kmsan_ioremap_page_range()
roll back what they mapped before the failure, while
vm_module_tags_populate() and the __GFP_NOFAIL retry loop in
__vmalloc_area_node() rely on the mapping functions cleaning up and
do not call anything like vunmap_range() themselves. When the same
range is mapped again, the attempt hits the leftovers and fails, with
a BUG() in vmap_pte_range() for huge mappings and a warning on the
small-page path.

After discussing with Suren and Ulad [1], we move the rollback into the
mapping functions. A failed vmap leaves nothing mapped, and the
callers no longer clean up after it.

[1] https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/

Patch 1 is the KMSAN part. The shadow and the origin of a range
are mapped by two separate calls, so the rollback there has to
cover both. Patch 2 is its disabled-KMSAN counterpart. Patch 3 adds
the rollback to __vmap_pages_range_noflush() and vmap_page_range().
Patches 4 and 5 drop the powerpc and percpu cleanups that are not
needed anymore.

Changes since v1:
 - Add patch 2. Sashiko reported that an empty range that hits patch 3's
   WARN_ON_ONCE() trips __vunmap_range_noflush()'s BUG_ON() through
   kmsan_vunmap_range_noflush() when kmsan=0. Patch 2 adds the
   kmsan_enabled check the unmap side was missing.
 - Pick up Reviewed-by tags from Suren and Ulad on patches 1, 4 and 5.
 - Add Cc: stable to patch 3.

v1 link: https://lore.kernel.org/all/20261009063619.112313-1-hao.ge@linux.dev/

Hao Ge (5):
  mm/kmsan: undo the shadow mapping when the origin mapping fails
  mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
  mm/vmalloc: undo partial mappings inside the mapping functions
  powerpc: drop redundant unmaps of failed vmap mappings
  mm/percpu: stop unmapping the CPU that failed to map

 arch/powerpc/kernel/isa-bridge.c |  5 ++--
 arch/powerpc/kernel/pci_64.c     |  4 +--
 mm/kmsan/hooks.c                 |  3 +++
 mm/kmsan/shadow.c                |  4 +++
 mm/percpu-vm.c                   |  5 ++--
 mm/vmalloc.c                     | 44 +++++++++++++++++++++++---------
 6 files changed, 45 insertions(+), 20 deletions(-)

-- 
2.25.1

