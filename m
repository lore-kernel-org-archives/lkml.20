Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001757;
	b=hSryauPyVErAF1M4WsgEyjQ20nrmpT8GSOwOzj/fZ/ms25rdBDJNVMojKM5hxFY19zzU
	 Umed+vjAE5j+ZXEHRp0FglPtPkXUOd4ZBczWcVqxT+b1zk2Ua7PqSwYtq3CRIhyN2SbBx
	 pdOsHYJxGzff/qix8eA14xPWWCubIApFnPNPl1fAvD3v+Ck2sVJNWl5AS/88q5+nR7QCq
	 Ba4tFqT+9CwOTkLUOANxFNP7uCmJlYjGrRCFiCGbuctyGAEfgcecee7XktUoDtawbSnJT
	 ATJa4JQNZmSNGzGn45Gyq8DkJlgODmAuyeknmXdXLlNcu4AMhnmK6CVeM8ecvrhzjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=s7UpNzJhxi6pbxSVCU4gh2Lq8z17O8RRANPyNHLrRsA=;
	b=WqvPr0qQr0fI6x6XBydbEp1VOmn745RYE5Ptx2JyD2qv424/jekyfe/YC/1m/CXrNJL8
	 JiEsJc/ZtE9sfEcAT3eo1VN2svpii0Sj2QGHlPlYXtfMaZ3rrcm5FzcGeFXLp8HC0IfhK
	 npgJDVsfNuUNigvsr2/+6Mq/zX4s3/z/+C6xj4aKqcINS2B/1hJVUsiU9SgwUtgb6yjxL
	 njJTWk9eLGcm/4nHR/SxC5v91K5vPCKntLfYzCo60yZri7G2PhqdM4Ot+twdVyxIfb2F/
	 LS8QZEZYhVL44VLerNos9rcDvBs68DHbHPcVlKIg6jRSPLfVLLVx54qJgwFaqb6oWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MzBYhwda;
	arc=none smtp.remote-ip=95.215.58.188
Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E86606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42E86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MzBYhwda
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L2pE27MmJcqFI/acr+I6vj36nyWahlUmHNuT0rwtvaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001752; v=1; x=1793606552;
 b=MzBYhwdazgqKxbT8ZAb4m6s2G9C1kFBWt1vRGp06s/GhtBMAiCv9s4PJjX9DLM/dGZ1KSfnU
 MtsBTVSdIDgeZmorvRomIHQop5G+IWdl8irPeO6s39z/0EJg/nEcuWxp05puVXVEitr6rj7bMYc
 3bu5yn2Z8lVWzX93zxJzCr4g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57ab905e822cd4de;
	Mon, 26 Oct 2026 08:02:31 +0000
X-Mizu-Trace-ID: 57ab905e822cd4de
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
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
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v3 00/10] mm/vmalloc: fix up vmap error handling
Date: Mon, 26 Oct 2026 16:03:19 +0800
Message-Id: <20261026080329.140244-1-hao.ge@linux.dev>
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
range is mapped again, the attempt hits the leftovers and fails, with
a BUG() in vmap_pte_range() for huge mappings and a warning on the
small-page path.

After discussing with Suren and Ulad [1], we move the rollback into
the mapping functions. A failed vmap leaves nothing mapped, and the
callers no longer clean up after it.

Patch 1 is the KMSAN part. The shadow and the origin of a range are
mapped by two separate calls, so the rollback there has to cover
both. Patch 2 is its disabled-KMSAN counterpart. Patches 3 to 7
clean up the range checks and error reporting: unaligned ranges are
clamped or rejected, the callers get the real error code instead of
a flat -ENOMEM, and the cache is only flushed once the mapping
succeeded. Patch 8 adds the rollback
to __vmap_pages_range_noflush() and vmap_page_range(). Patches 9 and
10 drop the powerpc and percpu cleanups that are not needed anymore.

Changes since v2:
- new patches 3 to 7 fix the range checks and the error reporting;
  the empty range check of v2's patch 3 moved into patch 6
- patch 8 (was patch 3) skips cond_resched() in the rollback when
  the caller's gfp mask cannot block
- commit messages reworded

[1] https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/

v2 link: https://lore.kernel.org/all/20261019054531.87652-1-hao.ge@linux.dev/
v1 link: https://lore.kernel.org/all/20261009063619.112313-1-hao.ge@linux.dev/

Hao Ge (10):
  mm/kmsan: undo the shadow mapping when the origin mapping fails
  mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
  mm/vmalloc: clamp an unaligned range in vunmap_pte_range()
  mm/vmalloc: propagate errors in vmap_pages_p*d_range()
  mm/vmalloc: reject an unaligned range in vmap_pages_pte_range()
  mm/vmalloc: reject empty and unaligned ranges in
    __vmap_pages_range_noflush()
  mm/vmalloc: only flush the cache after the vmap succeeded
  mm/vmalloc: undo partial mappings inside the mapping functions
  powerpc: drop redundant unmaps of failed vmap mappings
  mm/percpu: stop unmapping the CPU that failed to map

 arch/powerpc/kernel/isa-bridge.c |   5 +-
 arch/powerpc/kernel/pci_64.c     |   4 +-
 include/linux/kmsan.h            |   8 +-
 mm/kmsan/hooks.c                 |  21 ++++--
 mm/kmsan/shadow.c                |   9 ++-
 mm/percpu-vm.c                   |   5 +-
 mm/vmalloc.c                     | 125 ++++++++++++++++++++++---------
 mm/vmalloc.h                     |   6 +-
 8 files changed, 127 insertions(+), 56 deletions(-)

-- 
2.25.1
