Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868856;
	b=oLLexrDEKKt8T2oabdFtdyLJe/tK6oNcycPwjEyoA++kUkGVtxBxsgVV8T2faiIFHZ3y
	 id+I/4Vr9QY50IxZPVmu2V+UVdbgrTG0gw1S+C2Yk4GBLtJrHqwGGKaEu1rj9XM/e7C2K
	 671CYtdsWZ7tC0p9Ph51U/8AO/2FEPmRXjiDmcr9Y98NMl15QJTdi7RGXOLNdPtxViRC8
	 2G4M2mU9Eqlgzz4leO4DhAnSh1O1C3oa1BcDE2zBo5vu+V7tUtmRYK/UfdeGrIHZT797J
	 n2/fFF863JWS0tqdcBewR7wR8UWgFzkkaEjTdcn1AsAi4bb5cDaOBRN0R3k4z5D2gDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868856;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=pV9crl2bRNBetBvvFA3ER0yhn3utBtqFVAs6V796Sv8=;
	b=Foe9wWge/JPMo9gpES5TpHgUsymMROzSpCK0+rbznfweXQfumNDzgX4bJ1goLzJCdYni
	 8/0NUjAjrUIzFGQoT/NehnkVL05VC5KarOIm7XbBuBjifoV2iVMvj/gLmB20gdA8NP89L
	 SFeD59gLyFkxPdBk6iAz9UYDJL/O0Wq2IjYSyPSNGCHY5wRf3hhEMlGeSVuBcws+VQADJ
	 O2zsrg8NCRSknLivZ7ejEZ8M2hbIyz95DmBP+GOZlJbILxU/jI4LjWb7N4KuoAs8EK8jF
	 MojmtbRDlFZwfPov2gwErAJYgTo4bhNcdBWlaQSSyAbB30DMsnhimzeMJrt0NMePmlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivUhPgUW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE9606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivUhPgUW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C661F01825;
	Sat, 24 Oct 2026 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792868855;
	bh=pV9crl2bRNBetBvvFA3ER0yhn3utBtqFVAs6V796Sv8=;
	h=From:Subject:Date:To:Cc;
	b=ivUhPgUWEGsBgz/I6J+l3oalvDnaTt/gSdZMGakLjoqU4bB2Tze+lcanG07YApmi/
	 auSbCDF57uw98UxYsnIgxuj6ZZjNhV+6KheIOoXZz745X/uTvbBmvGIKzqbPNGf/sI
	 e8ce8d/4SY9CZHcyNeUpd49j3k5azfc9PI3TOSQxyoa8fy0BZnNc07EMLRay2BUXq6
	 dSOlqu7EhjMQGv1f7pEcjNvnjwtwEajOUdUorKA2mteweZPppiDCtmWjgoWklshOki
	 8zECGMMlLZVpJlEod6sKIWb396el2szUjSwXOZQiO4wNx6nZBPqiZUjxa9C+FFmYaO
	 EJISm/3c4bkkw==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH RFC v2 0/8] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Date: Sat, 24 Oct 2026 21:07:22 +0200
Message-Id: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAOsB3WoC/2WNyw6CMBREf4XctTVtkaKuTEz8ALeGEKAXrJDW3
 AJKCP8uj6XLM5mZM4JHMujhHIxA2BtvnJ1B7gIonpmtkBk9M0guFT8JwXzT5Wlr7JASfhzV7Fh
 KFR60FnEWwzx7E5bmu14+4H67QrKFvstfWLTL2VJ7Gt86GlZxL9by5pDhv6MXjLOMo1I6ChXm0
 aVGstjsHVWQTNP0AxnAzq/IAAAA
X-Change-ID: 20260911-slub_tiny_rework-8f2634dd17a7
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
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
Changes in v2:
- Rebase to current mainline (with slab/for-7.4 merged)
- Stop triggering nohash pointers due to slab_debug=N (Harry)
- Stop preventing slab merging dues to SLAB_DEBUG_NOOP (Harry)
- Link to v1: https://patch.msgid.link/20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org

---
Vlastimil Babka (SUSE) (8):
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
 mm/Kconfig                                      |  16 +--
 mm/Kconfig.debug                                |   2 +-
 mm/slab.h                                       |  32 ++---
 mm/slab_common.c                                |  18 +--
 mm/slub.c                                       | 167 ++++++++++++------------
 9 files changed, 140 insertions(+), 136 deletions(-)
---
base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
change-id: 20260911-slub_tiny_rework-8f2634dd17a7

