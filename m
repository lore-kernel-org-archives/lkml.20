Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811638;
	b=HuhcJn413pOC4hycXrOYYxPJt9tRhRespNaEr4L1h7G6sqZbeqgFOJIS0YyO+6D+5VbR
	 0WW/6uyEMIVsDw/1UanQLTeCD8nqoApXqp/bt6jQYzvdx/9LgW0Vdx1MuS4YH4JxjzcUX
	 uNYSl5bkpCnLmb5X99NHdaBBot7dv16sKf6Usy31UbPMsqnL6JmxgghQVyLHB7LmlmWtk
	 XtKMi77/1rA2a84GDfdCArqHJh31V3BEbZjEel8WSLuGTdgS+l+U6Ny+ysMGrEk616UUV
	 et+ptYtnZr1y47lYknxlGMCswCRb2udTDsVffMr1FkbZm+nLqqxBmMjKDjZv0t/YtHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811638;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=Z1Rsc7DC+QVh5qdz58bbVw91gg+izy0lpOLfi/21S74=;
	b=2IH3bhyv1wdtwth/7Sf0J4/UghhrT36vgDKGfobUwj+PTTLnucup/okugdxww3QoidjP
	 UUQja1Acd4F4wI4CfsuNU4apXVpoa/m7w4dma1yK/GE1z2y28ixTMRf2bVbSGO6A/iunn
	 EAYhtC3dn+0jlucm+J8X7mVw4W3tJWZWTosXUXaNXXVe6bga+RZTfcQOD7WuAF6Mzwh9d
	 efo5qmrHGK7/FI/YALwIbgPHGRd2xtfpckrYTwWds4JKDKMvnVhpwunXtujwDwQclnXcE
	 VvA5O9s5csagCuhhsyxbQtfWiY/1MXsbVK3yFDZTO8xeWb39XQT4DRx2sNgpFMNBB6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJvV2uWi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC891606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJvV2uWi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197601F000C4;
	Mon, 16 Nov 2026 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811638;
	bh=Z1Rsc7DC+QVh5qdz58bbVw91gg+izy0lpOLfi/21S74=;
	h=From:Subject:Date:To:Cc;
	b=JJvV2uWiZqdWbH4MMiSRVO5D7yVWQMFmglhOIgBUqVU7+Ifnvfbc917cQi5vUPhxZ
	 nOi80n4MJIvFR/WG3/DMDvlGvpNVzagi1xaAs842ZJDg8hJ9ijtMz24d7B+OgYPsyS
	 lFqhctbXkIV5NBpuLdyTPYypfh0y3f9tNJL7eGi7XbihdtTSjdAI7DtU2xi1z/EuSB
	 ZZSja+7hQF9L20q9d4XC7UFiGyj7hAiLuFquwmZsr8xglbRuag5So1UOJ0b+cZz7Ch
	 Id3nasevFmOO1zmcrypPMyCK0usMTgpXKCoaPoiWaEp6YPGePjP2JyETHgwrNFwZt0
	 pRqhh37iuu5RQ==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH v4 00/10] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Date: Mon, 16 Nov 2026 07:47:08 +0100
Message-Id: <20261116-slub_tiny_rework-v4-0-227a4b3636a5@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOym+moC/23NTQrCMBCG4atI1kYy+dO68h4iJWkmGpVWklot0
 rubqiiiyxe+eeZGEsaAiSwnNxKxCyk0dQ45nZBqZ+ot0uByE864ZgUATcezLdtQ92XESxMPdOG
 5FtI5mJs5yWeniD5cH+R68+x0tnus2tEZF7uQ2ib2j58djLsXz8Uv3wFl1DDU2imh0arVAWONx
 1kTt2T0O/4WgHH5R+BZsB4kFMYq792PID4CMPVHEFlgciErVAUaa7+EYRjuX7yFEkcBAAA=
X-Change-ID: 20260911-slub_tiny_rework-8f2634dd17a7
To: Harry Yoo <harry@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0

CONFIG_SLUB_TINY was introduced to help tiny systems migrate away from
the SLOB implementation so it could be removed. Its main purpose has
been to disable all forms of percpu object caching (cpu slabs back then,
now sheaves), and being a compile-time config option, some extra minor
saving were achieved by code elimination or more agressive merging of
caches with reclaimable and non-reclaimable objects (keeping those
separate helps reduce high-order page fragmentation but not memory
footprint).

However being a config option brings issues such as incompatibility with
other options that has caused troubles in the past and Linus argued for
removing it [1]. Moreover, there is a use case for having full-blown
scalable implementation enabled and being able to disable it with a
boot-time rather than compile-time decision. That use case is the kdump
kernel which shares the same vmlinux but wants to minimize the memory
overhead (which has to be pre-reserved from the production kernel) and
does not mind reduced scalability.

Thus this series reworks the CONFIG_SLUB_TINY to be controlled by a
variable set by a boot-time parameter. The config option itself is
deprecated and only sets the default value of the variable, and all its
interactions with other config options are removed.

The conversion builds mainly on the fact that most SLUB_TINY specific
paths to avoiding percpu object caching are shared with slab_debug
handling, except doing any actual debugging checks.

Thus introduce slab_debug=N (for No-op) option to allow using the
slab_debug checks directly, and extract the underlying static key
handling from CONFIG_SLUB_DEBUG only scope. The decision to create
separate kmalloc-rcl caches is also made to be boot-time.

The parts of CONFIG_SLUB_TINY that can't be transformed to a boot-time
decision are related to dead code elimination and fast path inlining,
and ignoring SLAB_NO_MERGE for performance purposes (currently used in
networking). Those lost memory saving should be all relatively minor
compared to the savings from avoiding percpu caching.

To sum up, after this series:

- CONFIG_SLUB_TINY is a deprecated option that has no interaction with
  other options and only controls the default behavior.

- New slab_tiny boot parameter controls the functionality (and can
  override CONFIG_SLUB_TINY in both directions).

- slab_debug=N can effectively achieve most of slab_tiny and on a
  per-cache basis

- the implementation is simpler with many ifdefs removed

To verify, slab usage was measured from /proc/meminfo after a virtme-ng
boot with 16 cpus and CONFIG_SLUB_TINY enabled.

- before the series: 27700 kB

- after the series: 29804 kB

The difference turns out to be due to last patch making CONFIG_SLUB_TINY
stop blocking several options, but real tiny systems can still disable
those.

- SYSFS support can be disabled globally. When manually disabling it for
  slab only:  28992 kB

- Disabling CONFIG_SLUB_DEBUG on top: 28696 kB

- Disabling KVFREE_RCU_BATCHED on top:  27624 kB

Thus it's possible to achieve the same slab memory footprint with
slab_tiny. One caveat is that disabling KVFREE_RCU_BATCHED is now only
possible by selecting tiny rcu which means CONFIG_SMP=n. I attempted to
make rcu batching boot-time as well, but turns out it's not possible
anymore to switch to call_rcu() with kvfree_rcu_cb because struct
kvfree_rcu_head is now reduced compared to the full rcu_head.

In case some small (but SMP) systems notice this as a regression, we can
make KVFREE_RCU_BATCHED configurable, or come up with some other
solution.

[1] https://lore.kernel.org/all/CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com/

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
Changes in v4:
- Collect review tags, thanks!
- Fix missing migrate_enable() in the kasan test (Harry, sashiko)
- Handle create_unique_id() properly (sashiko)
- Drop SLAB_RECLAIM_ACCOUNT on cache creation with slab_tiny_enabled,
  achieving full parity with handling pre-series.
- Add memory footprint measurements to the cover letter (Harry)
- Link to v3: https://patch.msgid.link/20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org

Changes in v3:
- Rebase to v7.4-rc1
- Add SLAB_DEBUG_NOOP to SLAB_MERGE_SAME (sashiko)
- Prevent premature slab free in slab and kasan kunit tests by new
  patches 1 and 2 (sashiko)
- Link to v2: https://patch.msgid.link/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org

Changes in v2:
- Rebase to current mainline (with slab/for-7.4 merged)
- Stop triggering nohash pointers due to slab_debug=N (Harry)
- Stop preventing slab merging dues to SLAB_DEBUG_NOOP (Harry)
- Link to v1: https://patch.msgid.link/20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org

---
Vlastimil Babka (SUSE) (10):
      slab, kunit: pin test slabs by an extra allocation
      kasan, kunit: pin test slabs by an extra allocation
      mm, slab: refactor slab_min/max_order handling
      mm, slab: introduce slab_debug=N
      mm, slab: rework KMALLOC_RECLAIM handling of SLUB_TINY
      mm, slab: make SLUB_TINY handling dynamic for sizing decisions
      mm, slab: convert CONFIG_SLUB_TINY checks to kmem_cache_debug()
      mm, slab: remove remaining compile-time checks for CONFIG_SLUB_TINY
      mm, slab: add slab_tiny boot param
      mm, slab: deprecate CONFIG_SLUB_TINY and reduce its Kconfig effects

 Documentation/admin-guide/kernel-parameters.txt |   4 +
 Documentation/admin-guide/mm/slab.rst           |  18 ++-
 include/linux/slab.h                            |  17 +--
 lib/Kconfig.kasan                               |   2 +-
 lib/tests/slub_kunit.c                          |  36 ++++-
 mm/Kconfig                                      |  16 +--
 mm/Kconfig.debug                                |   2 +-
 mm/kasan/kasan_test_c.c                         |  25 +++-
 mm/slab.h                                       |  32 ++---
 mm/slab_common.c                                |  28 ++--
 mm/slub.c                                       | 176 ++++++++++++------------
 11 files changed, 207 insertions(+), 149 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260911-slub_tiny_rework-8f2634dd17a7

