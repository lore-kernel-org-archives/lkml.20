Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84838B15E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178320; cv=none; b=O9q3wT2BDwZafnmB7iA3b9WvY/LZ0iGEWRVs4j3YCOWOQpO4YAk6tphyGcN0m2NlPYaLVPy2Jq1YrbH5JwNsTGIO2S6awdzW9KjesatbM2/B1JgNkqxptE7ysR+c0IJXFtEtIySLqRQokLL3C83c7RfoGWs44pituPrzNyv96FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178320; c=relaxed/simple;
	bh=B38R6Lxy2V3XamSf6i6541Wr5sFOQjuYdckuh1snBXM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WVVp9yt5QBCoBUdbIRSKBqih27fbdUW6UfSnoLL4WfP4iE9EFTHKikH7Gnkwmha2pawecIoDpaZCZqPRSpw3JREwAy1ADkJbkXONOinQ15eactrsadAQOCUFY7LV2hPYSFogSsgv4QgUcodIw3NeakE+ef2l2fqU6Qgxw59TbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1Hm8kXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1Hm8kXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493881F000FF;
	Wed, 23 Sep 2026 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178318;
	bh=efpMl5YXUfjthe3Hz2QBP8o+jOZW011OrS6pWOOuAYA=;
	h=From:Subject:Date:To:Cc;
	b=D1Hm8kXe9eJePiwRdjubTGJr5OUBxD/SUw/kewf49mok0qEJLiZszrYZcZxlbZrQp
	 n4b97y1iBOUMKbTnmzA/FaHQb5Ng7q5NL/Oc2twJriNFDXSq5AIZ9zhfd6HmkczECD
	 xBnG3iKKpWMTDr28iGxlECScUkT4VeumTHXeY9ISGkrMHoi+a34TpiS26u4KNPcStd
	 7pDXKDY7qZ729onc7bIiNE9PQblXCzfgEHG6XGTdq28Urhs69/mE4NQicNlpAH37KE
	 00Evi2kKkhGM+PtQIWZh5tfgzdbmk5h7XAljWK5+iaARkNjjrKM/LUsWg9ngN5scxw
	 SjEpCZFzwJP/w==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [PATCH RFC 0/8] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Date: Wed, 23 Sep 2026 17:45:05 +0200
Message-Id: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAH0s2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3eKc0qT4ksy8yvii1PL8omxdizQjM2OTlBRD80RzJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUASrEAjXkAAAA=
X-Change-ID: 20260911-slub_tiny_rework-8f2634dd17a7
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, 
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
 mm/Kconfig                                      |  16 ++-
 mm/Kconfig.debug                                |   2 +-
 mm/slab.h                                       |  32 +++--
 mm/slab_common.c                                |  12 +-
 mm/slub.c                                       | 149 +++++++++++-------------
 9 files changed, 120 insertions(+), 132 deletions(-)
---
base-commit: b4218126d498275444f315b0ed4cef6add6beabc
change-id: 20260911-slub_tiny_rework-8f2634dd17a7

