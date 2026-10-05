Received: from danaos.cslab.ece.ntua.gr (danaos.cslab.ece.ntua.gr [147.102.3.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBD47FB0E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.102.3.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204927; cv=none; b=G1baWpKhWzpdiZ6DRsq+1xDht55eFUm8CZXC1X6GDHyHUIye00lGCuo+J3GsrJYS0q3b+ZBM2RLc3//a1tPWNMef70uCn0VmW2WG0JfsDNaSbYQoq4r20l74pAQIwavr1M7fhjbKcnWQt71GYMlEYOQMdqxqDrH0TV0p8lc9Cs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204927; c=relaxed/simple;
	bh=fXp7h2rHbHsWDFrqkaM8imFFBwCEum9UGuEfbc0UrnI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C0+0UheEEqVDGhjBNYWEzluYZx0/gBH+A8sKTStZcY0BwQtLHFBui75xa4VaiRS9lMgrirSJeR+QvPVJ5Hg1RiXkgbgVP2fBxqRBNK3Vi1M/tjW46FagOEfhM1r0NFRjA0PJxJAk78nyJKbXvDhjkaVXtWNr//MWL1I56zrUBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr; spf=pass smtp.mailfrom=cslab.ece.ntua.gr; dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b=rBHfoPJ5; arc=none smtp.client-ip=147.102.3.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cslab.ece.ntua.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cslab.ece.ntua.gr header.i=@cslab.ece.ntua.gr header.b="rBHfoPJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cslab.ece.ntua.gr;
	s=smtp-cslab; t=1791204479;
	bh=fXp7h2rHbHsWDFrqkaM8imFFBwCEum9UGuEfbc0UrnI=;
	h=From:Subject:Date:To:Cc:From;
	b=rBHfoPJ55o+ajFEUQvdu9OsjAWoX+mpWgDOGV007ng4iU+Z1hgdGbTBu2IBHgioOl
	 VemXHcY63Y8RWgYT/MMgMyQyLRxy1vOsuAeb4F1hESm6K2xtQe3eP8mTqULT7hCOAN
	 zN0g2exXPZs1OM96KV0xhDMEHfCZ5bUF7FLUuoIw=
Received: from [127.0.0.1] (armor.cslab.ece.ntua.gr [147.102.4.33])
	by danaos.cslab.ece.ntua.gr (Postfix) with ESMTPSA id 264E21200FD;
	Mon,  5 Oct 2026 15:47:59 +0300 (EEST)
From: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Subject: [PATCH v3 0/2] maple_tree: fix maple_range_64 crashes in RCU mode
Date: Mon, 05 Oct 2026 12:47:26 +0000
Message-Id: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6cw2oC/33NTQ6CMBCG4auYrh3SHy3iynsYF20ZoAkCmUKjI
 dzdQmLiwrB8J1+emVlA8hjY9TAzwuiD77sU6nhgrjFdjeDL1ExyqXkhJFT+BU8ztAgjIQKtG30
 CchNwWRlVSjwXJmcJGAjTesPvj9SND2NP7+1XFOv1y6o9NgrgoIQRilt7cba6udAam6HDrBsnk
 9XEVj7KX1LvkjKR3PKiRJWj1cU/clmWD8v1+6ofAQAA
X-Change-ID: 20260912-fix-maple-tree-range64-rcu-02fa3d2e59a7
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Dimitris Charisis <dchar@cslab.ece.ntua.gr>
X-Mailer: b4 0.14.2

The patch series fixes two RCU destroy path issues on maple_range_64
nodes. Both arising from the fact that a maple_range_64 node repurposes
the last slot to hold metadata when the node is not full. Patch 1
addresses the issues, and patch 2 adds a test used to catch them.

Currently there is no in-tree user of maple_range_64 nodes in RCU mode.
All in-tree users of MT_FLAGS_USE_RCU also set MT_FLAGS_ALLOC_RANGE
which makes the internal nodes maple_arange_64.

Below is the minimal reproducer used during debugging:

static DEFINE_MTREE(tree);
static int __init maple_fix_init(void)
{
        unsigned long i, j;

        for (i = 10; i < 4000; i++) {
                mt_init_flags(&tree, MT_FLAGS_USE_RCU);

                for (j = 0; j < i; j++) {
                        mtree_insert_range(&tree, j * 10, j * 10 + 9,
                                        xa_mk_value(j), GFP_KERNEL);
                }

                mtree_destroy(&tree);
                rcu_barrier();
        }
        return 0;
}

The splat for the first issue addressed by the first patch is shown
below. mt_clear_meta() runs after the slots have been rewritten with raw
pointers by mte_dead_leaves(), so it cannot recognize a valid last
pointer because the type information is stripped. On my 64-bit LE
machine, it clears bytes 248 and 249 of the maple_range_64 which are the
two least significant bytes of the last pointer. The lowest byte is
already zero, since nodes are 256-byte aligned, but zeroing byte 249
corrupts the pointer.

KASAN catches it as a double-free, because that corrupted pointer
happens to land on a node that was freed previously. The splat appears
at 226 insertions in the reproducer. This is when the tree has a full
root node on a 64-bit build.

  ==================================================================
  BUG: KASAN: double-free in mt_free_walk+0x138/0x3a0
  Free of addr ffff0000f3d40000 by task swapper/2/0
  [...]
  Call trace:
   [...]
   kmem_cache_free_bulk+0x5b8/0xc18
   mt_free_walk+0x138/0x3a0
   rcu_core+0x5d0/0x1638
   rcu_core_si+0x18/0x30
   [...]

  Allocated by task 1218:
   [...]
   kmem_cache_alloc_from_sheaf_noprof+0xa8/0x2f0
   dst_setup+0x210/0x630
   mas_wr_split+0x568/0x26e0
   mas_wr_store_entry+0x98c/0x1de0
   mas_insert.isra.0+0x3d0/0x5d8
   mtree_insert_range+0xec/0x1c8
   maple_fix_init+0x94/0xff8 [maple_fix_obj]
   [...]

  Freed by task 0:
   [...]
   __kasan_slab_free+0x88/0xb8
   __rcu_free_sheaf_prepare+0x94/0x360
   rcu_free_sheaf+0x30/0x138
   rcu_core+0x5d0/0x1638
   rcu_core_si+0x18/0x30
   [...]

  The buggy address belongs to the object at ffff0000f3d40000
   which belongs to the cache maple_node of size 256
  The buggy address is located 0 bytes inside of
   256-byte region [ffff0000f3d40000, ffff0000f3d40100)

  [...]
  Memory state around the buggy address:
   ffff0000f3d3ff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
   ffff0000f3d3ff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  >ffff0000f3d40000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                     ^
   ffff0000f3d40080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
   ffff0000f3d40100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ==================================================================

The second issue fixed in the first patch is in the mt_free_walk().
mt_free_walk() descends by checking if the corresponding slot[offset]
entry is non-zero. In a maple_range_64 node that has
MAPLE_RANGE64_SLOTS-1 valid pointers to child nodes, all slots will be
non-zero, since the last slot holds the metadata. Thus, mte_dead_walk()
dereferences the metadata as if it were a node and hits the
null-ptr-deref as shown in the splat below.

After fixing the first issue, the reproducer reaches this case at 3166
insertions. The affected node is the root on a tree with height 3 and it
has 15 valid child nodes on a 64-bit machine. The first fix does not
introduce this bug, but it exposes it for the root node because it no
longer clears the root metadata. On an unmodified kernel, the same bug
exists and is reachable when such a maple_range_64 node appears below
the root, where mt_clear_meta() is not called.

Second KASAN splat:

  Unable to handle kernel paging request at virtual address dfff800000000006
  KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
  [...]
  Call trace:
   mte_dead_walk+0x78/0x140 (P)
   mt_free_walk+0x1f8/0x3a0
   rcu_core+0x5d0/0x1638
   rcu_core_si+0x18/0x30
   [..]

Both splats are from an arm64 QEMU guest. The test_maple_tree and the
userspace suite pass after each patch in the series.

---
Note for reviewers:

* Before commit 790e1fa86b34 ("maple_tree: add RCU lock checking to rcu
  callback functions") mas_clear_meta() was called while descending the
  tree, so metadata was cleared on every node. That commit removed the
  call from the descend path leaving only the final call for the root
  node, and renamed it to mt_clear_meta().

  An alternative fix would be to restore metadata clearing for every
  node and fix mt_clear_meta() for full maple_range_64 nodes. I
  preferred removing the clearing and use slot_len to identify the valid
  slots directly.

Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>

---
Changes in v3:
- Combine both fixes into one patch, as suggested by Liam, to avoid
  leaving an intermediate commit where removing mt_clear_meta() exposes
  the second bug at the root node.
- Combine both regression tests into the next patch.
- Link to v2: https://lore.kernel.org/r/20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr

Changes in v2:
- Add one test after each fix.
- Reword the cover letter.
- Link to v1: https://lore.kernel.org/r/20260913-fix-maple-tree-range64-rcu-v1-0-31a130bb8cbf@cslab.ece.ntua.gr

---
Dimitris Charisis (2):
      maple_tree: fix maple_range_64 crashes in RCU mode
      test_maple_tree: test maple_range_64 node in RCU mode

 lib/maple_tree.c      | 43 +------------------------------------------
 lib/test_maple_tree.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 42 deletions(-)
---
base-commit: e2e54005e20fb42d4a5e140d70a65be4a2363045
change-id: 20260912-fix-maple-tree-range64-rcu-02fa3d2e59a7

Best regards,
-- 
Dimitris Charisis <dchar@cslab.ece.ntua.gr>

