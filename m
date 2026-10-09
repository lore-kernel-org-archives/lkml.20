Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC5449B0B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527721; cv=none; b=X3b0Ju2UZOZBnifX9XrC6u9cJ9uWwagufLKvCVDDUQ7hWAIaOCXuQf/O/vKAivC0n1hHUXB2I5GGwf0wmOxUnLVnmlTPOR5pYYhy+lxqJxwFq/119J2hVnecPNPiHzCZnHwuc/Te774E+KYMzQglmisw3/wRZ7XgkBIRaZo9HRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527721; c=relaxed/simple;
	bh=tfre8IQfOGlwE6Sd6ZF0/CKAPq4d3X98BZ98KEdVsDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Osjw/QWPG+DGrhjiKujtISfClJkUVtk/36T2cFLngPpIXLUmBuYvqNTMztxAp19nOg5k7Fwt946/ob4/e+mkF7gEj+k6WD5pH+lJhX59lX5UJG8sm0QoyMyaqlXEg0LX0lsRkdN6vXASUWghAB0XkT0y8GUAyb3ZPOfZNyslhEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RD7OVw1p; arc=none smtp.client-ip=95.215.58.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RD7OVw1p"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tfre8IQfOGlwE6Sd6ZF0/CKAPq4d3X98BZ98KEdVsDo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791527716; v=1; x=1792132516;
 b=RD7OVw1p3g/fZrB+c6jIv99zK9knIbVlVoj8N7B2zOzL+7Vo9ldkQoPk/fZN5iTjLIUKn86L
 j59RoYV5EpKrDYaJz7ST/CAasyDSYfi2mHC4eiT0mv9W+wFsPvd16Y8Jx2uHf2xwYZXMtvcUTse
 aWsBoFmobaJyuuoIY6FVeROU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20cf8800623ca6ae;
	Fri, 09 Oct 2026 06:35:12 +0000
X-Mizu-Trace-ID: 20cf8800623ca6ae
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
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
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/4] mm/vmalloc: make the mapping functions undo their partial mappings
Date: Fri,  9 Oct 2026 14:36:15 +0800
Message-Id: <20261009063619.112313-1-hao.ge@linux.dev>
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

This moves the rollback into the mapping functions. A failed vmap
leaves nothing mapped, and the callers no longer clean up after it.

Patch 1 is the KMSAN part. The shadow and the origin of a range
are mapped by two separate calls, so the rollback there has to
cover both. Patch 2 adds it to __vmap_pages_range_noflush() and
vmap_page_range(). Patches 3 and 4 drop the powerpc and percpu
cleanups that are not needed anymore.

Hao Ge (4):
  mm/kmsan: undo the shadow mapping when the origin mapping fails
  mm/vmalloc: undo partial mappings inside the mapping functions
  powerpc: drop redundant unmaps of failed vmap mappings
  mm/percpu: stop unmapping the CPU that failed to map

 arch/powerpc/kernel/isa-bridge.c |  5 ++--
 arch/powerpc/kernel/pci_64.c     |  4 +--
 mm/kmsan/shadow.c                |  4 +++
 mm/percpu-vm.c                   |  5 ++--
 mm/vmalloc.c                     | 44 +++++++++++++++++++++++---------
 5 files changed, 42 insertions(+), 20 deletions(-)

-- 
2.25.1

