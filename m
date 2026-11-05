Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868236;
	b=MR9ySIXqjiRQonJnpicP8Y699y5lXvtg4mCmrgTdmgC4OhAOaeJSPZDQnzZ/1HpFfItI
	 pyHqOzVmVTpk/er4+wS8dhUh2kl7bJnLHXVvDeDdJIzoGMue8QtubjexbApEiMQywVKa5
	 Ksx86E+/OTJ7bjAjFk+ix8Qk3BLOq5JlqxXSfMWXNa4jBJBZxAFBb+v1p4ZLo7clNM99g
	 Y8SoeoHCjj9AkRRmU6K7SfpE8F4z+VkOJd4neffle7Ex3P5uTvp+r0u/2R7nuUxBzxjlf
	 H6mdo4Hjl/S13GR21jLbZ3De7yGy9SheVUWkwQ4TILdyPVZ7k8TEhdjTlZxmgtOZDyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868236;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=xthhCC/mcTYZS02cMzlH9pIKp/bPBWf9wsEzlDqqUYg=;
	b=WI5YJiBvdGmmI+tVAn2uZjU6N60qArwBveSjB/eGVqhZpsU3a+LoBlX+TdYiNnTSW4cu
	 tJ+MChLU2Qfloz3Pcs/4xjbN3rkInJ+8IRdcJszuOhY8W7z6i4f0bO6ernq7Om4IB4KOO
	 AcBdVyPPv0NWcFFtZ/chaxWvKNP6oMRQwQuy7rGsqXzz8iVEQ/tfkB9i2/lHMLtWY6wNj
	 Z6eqjhFvI7fFL3N01J658bEHJ/PTYzWFoJ7Wh7G8xC5uVHOWY7NLZzMLNCdXfT010aZCR
	 AmaX2JF9RuS2Wr842et+SA0wj10OTpD2l0eMG5eIoEZF61lzIIAjc6GVxQLsUgf1BxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkxVW+Vx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB6606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkxVW+Vx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF041F00A02;
	Thu,  5 Nov 2026 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868235;
	bh=xthhCC/mcTYZS02cMzlH9pIKp/bPBWf9wsEzlDqqUYg=;
	h=From:Subject:Date:To:Cc;
	b=EkxVW+VxdxJn899uQCPstrsAk6REcE49Bzn9WNu/in8yFo8SoEJ/+rF3nPZaWtKOT
	 xsJ9Or8PWQwa5hGiPvo5IJmQoRpRxIDVTtErQjNxn5EpCo9MAUI4X2qDtQNawHHbth
	 zv2l3eijl50D+380ZMSxq9ktSpr/2jLpdrYU7Wp3+19zlYSJSVI2WAs/1cKdYi2T9t
	 VtowUeXw7/TirphtlGJfM/AiKtGvtQzBWhgNJ44q3KiS49KkyeHtApPLt3C8fQQHRq
	 pN/9jZPFLrEiIRFAe+2/bFamUgk0ZLmB6gbIMCbV/nTlr0H1h9yZkO9C/2qf6Daa2E
	 edJlIz2YKPCIA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH v3 00/10] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Date: Thu, 05 Nov 2026 09:43:49 +0100
Message-Id: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAMVB7GoC/23N0Q6CIBTG8VdxXEcDVMyueo/WHMhBSacNlHLOd
 0+stbW6/G/f+Z0ZObAGHDpGM7LgjTN9t0a8i1BZi64CbNTaiBHGSU4pdu0oi8F0U2Hh3tsGHzT
 jcaIUzUSG1rObBW0eG3m+vNqN8grlEJywqI0bejttPz0NuzfP4l/eU0ywIMC5SmMOMj01YDto9
 72tUPA9+wiUsOSPwFZBaprQXMhUa/UlLMvyBAM62cIFAQAA
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
footprint.

However being a config option brings issues such as incompatibility with
other options that has caused troubles in the past and Linus argued for
removing it [1]. Moreover, there is a use case for having full-blown
scalable implementation enabled and being able to disable it with a
boot-time rather than compile-time decision. That ise base is the kdump
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
merging of non-kmalloc reclaimable and unreclaimable caches, and
ignoring SLAB_NO_MERGE for performance purposes (currently used in
networking). Those lost memory saving should be all relatively minor
compared to the savings from avoiding percpu caching.

To sum up, after this series:

- CONFIG_SLUB_TINY is a deprecated option that has no interaction with
  other options and only controls the default behavior.

- New slab_tiny boot parameter controls the functionality (and can
  override CONFIG_SLUB_TINY in both directions).

- slab_debug=N can effectively achieve most of slab_tiny and on a
  per-cache basic

- the implementation is simpler with many ifdefs removed

[1] https://lore.kernel.org/all/CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com/

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
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
 mm/kasan/kasan_test_c.c                         |  24 +++-
 mm/slab.h                                       |  32 ++---
 mm/slab_common.c                                |  21 +--
 mm/slub.c                                       | 167 ++++++++++++------------
 11 files changed, 195 insertions(+), 144 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260911-slub_tiny_rework-8f2634dd17a7

