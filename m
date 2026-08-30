Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025EC33E367
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788086327; cv=none; b=lRshd8IFVMs5K9G2lWNBfkU1GbxFxc2n/XHwlJafiuRkOwZLlOaihoBLe5tt1FYlAsJbiiWsTa1pJY0TPLRxi90clbcLF/6ZgQdavc0kHEW0M2MoUMWD5wfKyAfQMkSOGap6GWhyb9r1qshGaZ1xO1K05Z5Zfi/KONSdzb+cxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788086327; c=relaxed/simple;
	bh=8WhZUa9XJihWcKf1b+Qv/MyKRhz1vj1pI+ttuZCRks4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf4sOIzWhwxVAXPvy4+Eogw5V0NQnpMrFJHTcjSyCg+Vy/UWQl35u6/LIKz3Wb1iltz+61CPhqmREFhy2o6/Dyt5qpuJHnzjDQXwCmoDdf3c/JRbGlxWlAI3M7HE95EcUYrr47akFuQyHTE9On29aSS5NZh3bTnbzGpOW+i0b/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id EAA2B1EAAE7; Sun, 30 Aug 2026 18:33:36 +0800 (AWST)
X-Spam-Level: 
Received: from sparky.lan (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id BBF811EAAE7;
	Sun, 30 Aug 2026 18:33:30 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Jim Cromie <jim.cromie@gmail.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	David Gow <david@davidgow.net>
Subject: [PATCH v2 2/3] drm_buddy: fix power-of-2 rounding errs
Date: Sun, 30 Aug 2026 18:33:16 +0800
Message-ID: <20260830103321.2042968-2-david@davidgow.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830103321.2042968-1-david@davidgow.net>
References: <20260830103321.2042968-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jim Cromie <jim.cromie@gmail.com>

The standard roundup_pow_of_two() and rounddown_pow_of_two() macros use
unsigned long internally, which on 32-bit architectures (like arm32) is
a 32-bit type.

drm_test_buddy_alloc_exceeds_max_order() uses these on a u64 value,
where they silently truncate the 10GB allocation, giving unexpected
success in DRM-CI.  (see below the snip).

Fix this by replacing the those macros with the safe 64-bit power-of-two
equivalents added in the previous patch.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Link: https://lore.kernel.org/all/20260326185413.1205870-40-jim.cromie@gmail.com/
Signed-off-by: David Gow <david@davidgow.net>
---

This should actually be version 13 or 14, I think, as it's just a rebase
of v12 here, where it was part of a large series of fixups:
https://lore.kernel.org/all/20260326185413.1205870-40-jim.cromie@gmail.com/

There are probably some other places where this is not perfectly 32-bit safe,
but this is at least enough to fix the KUnit tests.

The major changes since that version are:
- Add the helper functions rounddown_pow_of_two_u64() and
  roundup_pow_of_two_u64() (see patch 1) instead of open-coding them
- Rebase now that the buddy allocator lives in drivers/gpu/buddy.c
  instead of drivers/gpu/drm/drm_buddy.c

This is still breaking the gpu_test_buddy_alloc_exceeds_max_order
KUnit test on 32-bit systems:
[09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: EXPECTATION FAILED at drivers/gpu/tests/gpu_buddy_test.c:1429
[09:01:26]     Expected err == -22, but
[09:01:26]         err == 0 (0x0)
[09:01:26] WARNING: drivers/gpu/buddy.c:508 at gpu_buddy_fini+0x244/0x2e0, CPU#0: kunit_try_catch/1595
[09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:508: gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]))
[09:01:26] WARNING: drivers/gpu/buddy.c:516 at gpu_buddy_fini+0x284/0x2e0, CPU#0: kunit_try_catch/1595
[09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:508: gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]))
[09:01:26] WARNING: drivers/gpu/buddy.c:516 at gpu_buddy_fini+0x284/0x2e0, CPU#0: kunit_try_catch/1595
[09:01:26]     # gpu_test_buddy_alloc_exceeds_max_order: drivers/gpu/buddy.c:519: gpu_buddy_assert(!mm->used_scoreboard[i])
[09:01:26] [FAILED] gpu_test_buddy_alloc_exceeds_max_order

Changes since v1:
https://lore.kernel.org/all/20260821091918.1902032-2-david@ingeniumdigital.com/
- Rename round{up,down}_pow_of_two64() -> round{up,down_pow_of_two_u64()
  (This seems nicer and more consistent with what everyone else is doing)

---
 drivers/gpu/buddy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index a5553fcec28c..0c432719f8f1 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -1193,7 +1193,7 @@ static int __alloc_contig_try_harder(struct gpu_buddy *mm,
 	u64 modify_size;
 	int err;
 
-	modify_size = rounddown_pow_of_two(size);
+	modify_size = rounddown_pow_of_two_u64(size);
 	order = ilog2(modify_size) - ilog2(mm->chunk_size);
 	if (order == 0)
 		return -ENOSPC;
@@ -1440,7 +1440,7 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 
 	/* Roundup the size to power of 2 */
 	if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
-		size = roundup_pow_of_two(size);
+		size = roundup_pow_of_two_u64(size);
 		min_block_size = size;
 		/*
 		 * Normalize the requested size to min_block_size for regular allocations.
-- 
2.55.0

