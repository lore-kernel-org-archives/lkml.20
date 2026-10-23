Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776067;
	b=0eYkg4u6nrRCOlUGvXHQhjhWlBwNzymv03ENzpHohZCPHCod7/l60D4lpnV4qTi+MyYH
	 jT/FDcS8nP7+jZLpcVxoc0Bp6WUXLfaMYUgkEtsphdwwbGPEPQcPDypJCCDyxm4z/4Dod
	 nCbLoJeWXGtT+zyKG/YohuCIswkeU1oNZ9az2J8b5kqycahwnlRsi2LeKY7gNwgnRLY9z
	 WNwATUlK+IcuE5d+GIw//+BF+MuUuekSCXV0AuoRiDNXEYNOEHobB4vLcbl9rQX1C2nXO
	 4w2l4ggKoKR809iM7W9Wa61KYJ6MjyH30XfEJ+ScUjVrAdAypNTdmgpcXLDW3K9VdLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776067;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JJ/VDJaFv0nbRdXF0gUxcGYotqdYDug1Cb2PfpxNb08=;
	b=JDC7XrRVwGpmRh9NrXnpJ5vz+75qlDdCLjISsFC85O7eiyvZSGiygIf/9DDgcYbDm2BX
	 eFvi67gHDeejySV0JOIpv4YAg9nPbN2uV5+1zwlcpqf/zkd36kZgVcXervFWW91KM5CEr
	 WjLx7dFuXkIWI9/drw51QEzvFbrKUh5vY48EwhCk6aKcVsLtiZww6d+D06VlxGJTaKNms
	 v6OCqA3uRlJMJqFFCPh7KIKNY7EpW4iZUkikInCMuTgs2gccFskLYcPtPcyxaA0LmsQLX
	 kLwaXz4Wgtn6j6fffUDuLOvtuuYgB6xeB4GKn7osBTTVsx1VJ0Tu9jsMC0T3CO+Aabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZdyGF0a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A677606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZdyGF0a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ACC1F031E0;
	Fri, 23 Oct 2026 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776067;
	bh=JJ/VDJaFv0nbRdXF0gUxcGYotqdYDug1Cb2PfpxNb08=;
	h=From:To:Cc:Subject:Date;
	b=DZdyGF0anQ8brD6Zt/KWx4sy33yqPyyO2AqPHCJImdX4k9p5rIP3+gyBjRaQZB2Wn
	 BF2qBL2mPXYhNpc6kxN0ZfVjI/262p4u4vPnzPi0lWkBcoIO/6mWuBNwh6uAOuOXlS
	 eGROV6XXVmr64h3BVXcueBw2MlfQapi/cWG3f4HGr/W8RNXfWlenbQhGiFsabLAXNu
	 +3kLZygrM57U14SWzgNF8YbS5P2hTbOyQH2raaLODQRg9vYHMdu5e5xGETKWL+Jh8A
	 pYKZFCK0dmKyskDr5THtJ68AG96GxPRloKl+HLMPKO+bEo5tS2AvRkDzc1HIPGncUo
	 604NqXMD82XmA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [GIT PULL] Core MM updates for 7.4 (new MM tree)
Date: Fri, 23 Oct 2026 19:20:58 +0200
Message-ID: <20261023172100.49643-1-david@kernel.org>
X-Mailer: git-send-email 2.56.0
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

Hi Linus,

As discussed at the Maintainer Summit, this is the first pull request from
the new core MM tree. I'm a bit late due to travel.

This cycle was primarily used to set up the core MM tree, move some
smaller MM components into it, and establish the MM integration workflow
for linux-next.

For 7.4, MM updates will reach you through the slab, memblock, Andrew's
MM, and my core MM trees.

For the next cycle (7.5), we plan to route fewer patches through Andrew's
tree and start merging the MM component trees (memblock, slab, core) into
the new MM integration tree for upstreaming.

In subsequent cycles, we'll gradually move more components from
Andrew's MM tree into existing or new MM component trees, with the
eventual goal of having a single MM integration tree for you to pull
from.

I'm using merge commits to:

 - Merge patch series, with the adjusted cover letter in the merge
   commit message.

 - Merge topic branches, with a summary of the changes in the merge
   commit message.

The signed tag contains a high-level summary of the changes.

Please let me know if anything looks odd or if you would prefer different
summaries.

There are no known conflicts with other trees.

Cheers,

David

----------------------------------------------------------------

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git tags/mm-core-7.4-rc1

for you to fetch changes up to 07ae95d933b84db98696f23e24de078b251561ff:

  Merge 'memhp-7.4.misc' (2026-10-18 10:26:46 +0200)

----------------------------------------------------------------
Core memory management updates for 7.4

This includes updates to:

 - MEMHP (Memory Hotplug)
 - GUP (Get User Pages)

The main change is:

 - Reduce zone contiguity checking overhead during memory
   hot(un)plug (Yuan Liu)

Other changes include smaller fixes along with various cleanups.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

----------------------------------------------------------------
Aristeu Rozanski (2):
      mm: gup: move pmd_protnone() into gup_fast_pmd_leaf()
      mm: gup: cleanup the gup_fast_*() call chain

David Hildenbrand (Arm) (5):
      Merge patch series "mm: gup: cleanup gup_fast call chain"
      mm/memory_hotplug: make shrink_zone_span() more robust
      Merge patch series "mm/memory_hotplug: optimize zone contiguous check when changing pfn range"
      Merge 'gup-7.4.misc'
      Merge 'memhp-7.4.misc'

Greg Kroah-Hartman (1):
      mm/gup: honour FOLL_PIN in NOMMU __get_user_pages_locked()

Lance Yang (1):
      mm/memory_hotplug: fix missing rollback in __add_pages()

Sarthak Sharma (2):
      mm/gup_test: safely calculate GUP batch size
      mm/gup_test: report actual pinned bytes

Yuan Liu (1):
      mm/memory_hotplug: optimize zone contiguous check when changing pfn range

 Documentation/mm/physical_memory.rst |   6 ++
 drivers/base/memory.c                |   7 +-
 include/linux/mmzone.h               |  69 ++++++++++++
 mm/gup.c                             | 204 +++++++++++++++++++----------------
 mm/gup_test.c                        |  11 +-
 mm/memory_hotplug.c                  |  77 ++++++-------
 mm/mm_init.c                         |  64 ++++++-----
 mm/mm_init.h                         |   6 --
 mm/page_alloc.h                      |   2 +-
 9 files changed, 266 insertions(+), 180 deletions(-)
