Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FCF3B058E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833549; cv=none; b=mJT8y4a1siNdMsdc/a6khYXMQ0hFwbSng7lZoTKbcmO7A2itC/xNVjC5ki0a2Q88jlJFy4Me4874FU5jt7CTcuQWLbO9XrlUpHtxBBpw2ZEJHBrwP73gwed2tpC+aAgFLv9PtSmWPjK07RZ/O5phnf8TZDrs39Z1/wqwxCebvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833549; c=relaxed/simple;
	bh=S0PEriRD7PdiDhqWx5Jbb6HAk6Hrw1dbeice1Dx7qYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lx6xWqRQFIke6Nn8TBVG3s0G6cCNknzcZ1VdVgUdhLxoSD8XxtBnYQpCpMRjBJrJPrhyjkY6ZuJ3OT7iSodwvFlTB2OBnkeMy7B99h+Y2z2AbkYOUPw9bHIV6PCJLZEJc7Rz/eoh0oMWYsyCvXjfk9C1482ZnHKdkLRUcS7SXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wox5Vee3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wox5Vee3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788291F000E9;
	Thu, 27 Aug 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833548;
	bh=i4Omt4VBYGC54Ur+IE8AVRjdaFAsfz7LGrPufKIFTIg=;
	h=From:To:Cc:Subject:Date;
	b=Wox5Vee3dQytkSiZvCZ++cOd0269YqofAbq4aNpj6J+kEJJ1aexYMsKH/E1IvVdMv
	 N/qQg5PMYrn0/mdiV9cNUMQwEjGkhSoCShgKjDwhc4biIqJzEZNcEO2hvbOtMzvtgH
	 GElXupQwTpW8EpnCvOhXk2SL+CuqbsmaOYIZEisbEKeI30HGGxsssFj/lA0FQS6YO/
	 bwr95EcZnJwx4NSCQVva4eDrKx4K6wmEf8jooZS5QF5uNhFvI/SvgvCOfuPVUOaMKG
	 9RAdpQD8GwUiZ1eN0NXPKAiGDbzD78tUll2yaS09tf26KcyBQNEi7QpgR9x2KaFuhY
	 wEvyiNQHpvnYw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v4 00/12] f2fs: introduce metadata cache
Date: Thu, 27 Aug 2026 20:25:28 +0800
Message-ID: <20260827122541.19967-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces a self-managed metadata block cache in f2fs,
decoupling meta blocks, node blocks, and compressed data blocks from
the Linux VFS page cache and fake internal inodes.

=== 1. Background & Motivation ===

Currently, F2FS uses fake VFS inodes (meta_inode, node_inode, and
compress_inode) to manage internal block caching through the VFS page
cache. Because of this implementation, the f2fs block size was
historically coupled to the kernel page size.

We now want to unbind block size from page size to support configurations
where block size <= PAGE_SIZE (e.g., mounting a 4KB-block F2FS image on a
16KB or 64KB page system).

One possible approach is to continue using the VFS page cache to store
metadata blocks. However, doing so introduces three major architectural
issues (illustrated by a 4KB block on a 16KB page system):

1. Memory Overhead:
   Metadata access patterns are typically random and sparse. Caching a
   single 4KB metadata block inside a page cache folio forces the
   allocation of an entire 16KB folio, resulting in 4x memory waste.

2. Folio and Sub-block Conversion Complexity:
   Using larger folios requires tracking individual sub-block dirty/uptodate
   states within each folio and performing index-to-offset conversions across
   function boundaries. Because core metadata structures (e.g., f2fs_checkpoint,
   f2fs_sit_block, f2fs_nat_block, f2fs_summary_block, f2fs_node) are accessed
   extensively throughout the filesystem, this sub-block management and offset
   calculation complexity would spread across the entire F2FS codebase.

3. Lock Contention:
   Multiple independent node blocks (e.g., dnode blocks belonging to
   different files) can reside within the same folio. Concurrent fsync()
   calls on unrelated files would contend on the same folio_lock(),
   serializing metadata updates and degrading multi-threaded performance.

Decoupling metadata caching from PAGE_SIZE by allocating exact
block-sized cache entries is the critical first step toward supporting
4KB-block F2FS images on 16KB/64KB page systems.

=== 2. Metadata Cache Architecture & Design ===

This patchset introduces a dedicated, block-size-aligned caching
infrastructure with the following key components:

- Block-Size Aligned Allocation:
  Allocates memory buffers matching exactly the filesystem block size
  (4KB or 16KB) via kzalloc(), fully independent of the host
  architecture's PAGE_SIZE.

- Radix Tree Indexing with Fast Tag Scanning:
  Each cache instance (META_CACHE, NODE_CACHE, COMPRESS_CACHE) indexes
  cached blocks via a radix tree (keyed by Physical Block Address for meta/
  compress cache, and Node ID for node cache). Radix tree tags
  (F2FS_CACHE_TAG_DIRTY, F2FS_CACHE_TAG_WRITEBACK) provide O(1) batch gang
  lookups for flushing and writeback without dual-list shuffling.

- Lightweight Bit-Locking:
  Individual entries use atomic bit locks (F2FS_BLOCK_LOCKED via
  wait_on_bit_lock() / clear_and_wake_up_bit()) rather than heavyweight
  embedded mutexes/semaphores, minimizing memory footprint per entry.

- Direct BIO Read/Write & BIO Merging:
  Decouples metadata/node I/O from VFS address spaces by submitting direct
  BIOs (f2fs_submit_cache_read / f2fs_submit_cache_write) with chained
  adjacent vector merging (entry->next_entry) and dedicated completion
  handlers.

- Memory Reclamation Shrinker:
  Integrates with the kernel shrinker subsystem via a 3-phase isolation
  algorithm (isolate unreferenced clean entries -> truncate from radix tree
  under lock -> splice un-reclaimed entries back to LRU) to safely reclaim
  clean cached blocks under system memory pressure.

- Background Writeback Kthread & Checkpoint Integration:
  Provides a dedicated background kthread (f2fs_writeback-X:Y) for periodic
  dirty cache flushing, combined with synchronous flushing during checkpoint
  commit.

- Fault Injection, Tracepoints & Debugfs Observability:
  Integrates FAULT_KALLOC fault injection, tracepoints for cache state
  transitions and batch writeback, and per-cache memory breakdowns in debugfs.

=== 3. Patchset Organization ===

- Patch 01: Implement the core metadata cache infrastructure & direct BIO I/O.
- Patch 02: Initialize and teardown META_CACHE in sb_info.
- Patch 03: Integrate metadata cache into the memory shrinker subsystem.
- Patch 04: Introduce the background writeback kernel thread.
- Patch 05: Migrate metadata block caching (SIT, NAT, SSA, CP, recovery, GC)
            from meta_inode to META_CACHE.
- Patch 06: Initialize and teardown NODE_CACHE in sb_info.
- Patch 07: Migrate node and inode block caching from node_inode to NODE_CACHE.
- Patch 08: Initialize and teardown COMPRESS_CACHE in sb_info.
- Patch 09: Migrate compressed cluster caching from compress_inode to COMPRESS_CACHE.
- Patch 10: Add fault injection support for cache allocation paths.
- Patch 11: Introduce ftrace tracepoints for cache dirty and writeback events.
- Patch 12: Expose per-cache memory usage in debugfs.

Changelog:

v3->v4:
- remove unused rn in find_fsync_dnodes()
- add sanity check in __has_merged_cache()
- introduce f2fs_cache_gang_lookup() and clean up w/ it
- avoid index overflow in f2fs_cache_gang_lookup{,_tag}
- relocate f2fs_truncte_cache change from Patch 09 into Patch 01
- use {META,NODE,COMPRESS}_CACHE to clean up in shrinker.c
- introduce F2FS_CACHE_ACCESS to update lru list for cache
- remove an unneeded local variable in f2fs_do_shrink_cache()
- update comments in Patch 04
- introduce /sys/fs/f2fs/<disk>/cache_wb_interval
- drop unneeded f2fs_sync_cache_wb() and check on cache_wb_task
- fix to check cache->num_entries correctly in f2fs_invalidate_compress_pages()
- add sanity check on entry->cache in f2fs_invalidate_compress_pages()
- use sbi->blocksize instead of PAGE_SIZE in move_data_block() and
  f2fs_cache_compressed_page()

Chao Yu (12):
  f2fs: cache: implement metadata cache
  f2fs: cache: initialize meta cache
  f2fs: cache: introduce shrinker
  f2fs: cache: introduce writeback thread
  f2fs: cache: use meta cache
  f2fs: cache: initialize node cache
  f2fs: cache: use node cache
  f2fs: cache: initialize compress cache
  f2fs: cache: use compress cache
  f2fs: cache: support fault injection
  f2fs: cache: introduce tracepoints
  f2fs: cache: show per-cache usage in debugfs

 Documentation/ABI/testing/sysfs-fs-f2fs |    6 +
 fs/f2fs/Makefile                        |    2 +-
 fs/f2fs/acl.c                           |   26 +-
 fs/f2fs/acl.h                           |    8 +-
 fs/f2fs/cache.c                         |  722 ++++++++++++++++
 fs/f2fs/cache.h                         |  228 +++++
 fs/f2fs/checkpoint.c                    |  398 ++++-----
 fs/f2fs/compress.c                      |  161 ++--
 fs/f2fs/data.c                          |  533 ++++++++----
 fs/f2fs/debug.c                         |   70 +-
 fs/f2fs/dir.c                           |  170 ++--
 fs/f2fs/extent_cache.c                  |   14 +-
 fs/f2fs/f2fs.h                          |  335 ++++----
 fs/f2fs/file.c                          |   78 +-
 fs/f2fs/gc.c                            |  185 +++--
 fs/f2fs/inline.c                        |  284 +++----
 fs/f2fs/inode.c                         |  205 ++---
 fs/f2fs/iostat.h                        |   11 +
 fs/f2fs/namei.c                         |  114 +--
 fs/f2fs/node.c                          | 1010 +++++++++++------------
 fs/f2fs/node.h                          |  109 ++-
 fs/f2fs/recovery.c                      |  251 +++---
 fs/f2fs/segment.c                       |  263 +++---
 fs/f2fs/segment.h                       |   39 +-
 fs/f2fs/shrinker.c                      |   14 +
 fs/f2fs/super.c                         |  143 ++--
 fs/f2fs/sysfs.c                         |   13 +-
 fs/f2fs/xattr.c                         |  123 ++-
 fs/f2fs/xattr.h                         |   12 +-
 include/linux/f2fs_fs.h                 |    3 -
 include/trace/events/f2fs.h             |   71 ++
 31 files changed, 3388 insertions(+), 2213 deletions(-)
 create mode 100644 fs/f2fs/cache.c
 create mode 100644 fs/f2fs/cache.h

-- 
2.49.0

