Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802140;
	b=qWITc4+Qrh3dXpMRmG4sWHqwnMxBVqP5OHcFuR67fEoRSLcR6WZPTcQ2HOcsrkAa/SUF
	 xQk2T0tNoLebeWbjbrSAFW5lxz4zDWPprgtjKkqcD4cDe5WDrt0seKS/vgUwcd6ZgfVS4
	 xFpZoQa2bZDGe29yZSt3jwe+eBvr0YAaITU4Y1Lb2mZh19BqkDxET+dl/5R3PvF/Moocw
	 JY1I/rJOJgusMAUJDi64xfKNoktdGmcE36ixnoLR1MDBE5iUp50weo6H/gY9F4PaoWhWx
	 NLiD+3MLXCCsHrFKUb0YjRED90tui+na+x1QW33K7pfxZFvM7ODnF/koEiXgEm/O5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7RSTviWjtfe6XxNDFOAlD9904SKRkGSAvfsq7xFNryA=;
	b=qys2CvR7/KIhOiDKP1jpxkt7b91BO5aDe0NkPjLCCfzzpx5t7PYmScFw5IqnlcFTrUd4
	 DFLLCzshXxfwQClYmAOHlVh+CpPtnObyCNDZgfYBoCNcsjyG8GwhLR1HiM10kUv/Ailsp
	 ML64CRf7TjsURFT2xRVQ4qXEkXfaaM97yphs6l4k6zQyLTTI4Rd+Vms3O+ZovX2DfqWJ5
	 o+95RhUBuAJszOhdm0Mo5jn0OWkR1k8l/beNCB/6c4EsBp2FrL8idxJZGYg2p4A0+hVSG
	 M7KLfur7CmUPK8qBLJOwN7wgeRTQaHKlTozIqN1xcoVVN6B3EP8VxWXud85CxNdCcbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XTI/NMyr";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99119606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99119606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XTI/NMyr
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so13795745ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802139; x=1795406939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RSTviWjtfe6XxNDFOAlD9904SKRkGSAvfsq7xFNryA=;
        b=XTI/NMyreZ+MVuk3oBC+sDdY2OxWYk7a8A1uTF/xl9/eBwktN2ISKP0IsPO5OT/Cim
         Fcq78UOnomLCwa2/EfNfEGhr8b/bqTiU/V1AEModAvmJeo1PKKxjJhOaDkx7P3vqvDa8
         PsE1NMFcQ5f+aXDR9IWWnx3nW0KTt894VtLO0GxwUWH2HDy+WE4Ihw9+8LaBQesKNcKA
         m1IwrFO7ddjA0SDJVcF3a1U4FpiA8TJ0dAEOEi87MxCouj1btODLl6a6SPSBsGLG2nEh
         EvW/iuL0pJKeNT9sEUFab7q7lclIrQCyK0D77k/r6n4oXp3Jk4GcoeXDnuj/g7Ba33ti
         QgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802139; x=1795406939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RSTviWjtfe6XxNDFOAlD9904SKRkGSAvfsq7xFNryA=;
        b=jmy2QK/kAcUlY3rhWVjsm8trEtKa768YQvcwWzqFn0YJnmAtP+sUOwCsO4VTfHci9a
         3rRHV0QH3x0FFU8u0hVRmqwZMvqf7gbpLwQQDqItbJJSds3oGWs2e9zshrlnuL4ieG5e
         RO7kOnQL2iQ8stgYqCsoBNMhs4GtbUERQjtnJHPAFF20vlqgQ22zPE1DF4SCxIKZ2d2S
         /iXrpJGCp8Nr9qYsedvtqWX2vJD1osWYRD7hw88OG/5+LdLgL2J9EJyUjTMQsrb5h/As
         IA5Wufflr6hgWq1j1fIIcsGq5JGpHuAibgkOci1FS2ahkn7nI0HpmmUFu9LOVSvsDqkQ
         Hbng==
X-Gm-Message-State: APuU4Z8Bpn8z/MIYAoz1oJUeNPEvKb9GBk9hzTDrKOULcaNzeU9xteQY
	cRrMDGZyL++gI3MX3/6Huz3CkyDzzkCVRfc3Zz154qbGnf7XnZJea1b+NNOxFw==
X-Gm-Gg: AYBFou0V9pag6MQlR8XAC7gwaOK8RNJaR9uNXdIpX0tpXd7DMq0hYg9uVnK/dRiRCh4
	Mr8OW5UqiTs8v08pMFJ6/PIKfXYNj0ylx7QP+CPXmu1gh4my045GXsdVYY5p+xbzMXCeY+Ptphn
	ouMcUXYgF5k7Ltkplg0dVb1oROjypp/wDbZn4YgA6BBGGrACSddZoGE0UCtzczOMzWiuJ5Pe4/E
	BXu2bfvSS1ki0YGoBNBiKuSIa9F9d3lwMaQr0OmWcY0J+PQ5vX1jsH6IPDxiMLdo3WePpjSYLHA
	TAtXJwYQISPzVjSDG4+ljVbLt7pSD6ibTSfRLM/Kb3zZl+mLpnZPjguRBhZkqdxQy3vaCL6sTTB
	gDe70gb1AhLy0ztS/IaIp/KA2hClZ6K7A8L9LmiLH6e5M9odkfnyaFbUSDB7MCcIptnYw3EpKEX
	rT+qV5z4Aw7xRTwwWzeFR4IILqSAuvPDYSnnqae+WRBobAQmZ+7eSBPqYgBL65ttdYpocU9JzPn
	UBqt6Rgk/22ama3Xn2592Y55qr4P70f2WueWXwCqQIAgWtjKJ1ulVqY893wrhpHa6s4OU5DBa3b
	vKAA93DxkCQdPMcQGnltVLBVFrBFt3zu0KNZvVj7LZox666BE+Zvj3nd4AnWu/1bHalmhCZz2Ku
	ZoDlXs62cfDIemxor/wtvaLM/Lw7yBWkwijM9p+Qq1nIpoSw=
X-Received: by 2002:a17:90b:4ec5:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b1b0a0dd02mr8036664a91.30.1794802138723;
        Sun, 15 Nov 2026 20:08:58 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:08:57 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 00/20] f2fs: support block size smaller than PAGE_SIZE
Date: Sun, 15 Nov 2026 20:08:31 -0800
Message-ID: <20261116040851.2849696-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

From: Daeho Jeong <daehojeong@google.com>

F2FS has required the filesystem block size to equal PAGE_SIZE. On a
kernel with 16KB pages, this means an existing F2FS image with 4KB
blocks cannot be mounted, e.g. the userdata partition of an Android
device that moves from a 4KB page kernel to a 16KB page kernel.

This series lets F2FS mount and use a filesystem whose block size is
smaller than PAGE_SIZE, such as 4KB blocks on a 16KB page kernel. The
on-disk format does not change.

With subpage blocks, even an order-0 folio holds several blocks, so
the series builds on the large folio support from Nanzhe Zhao [1] and
tracks uptodate and dirty state per block in f2fs_folio_state for any
folio that holds more than one block. Most paths then work in blocks
instead of pages:

- Patches 1-2 convert more page based index and size calculations to
  block based ones, and add the superblock and mount infrastructure.
  Subpage block sizes are still rejected at this point.
- Patch 3 extends f2fs_folio_state with per-block state, identified by
  a magic number, and allocates it on demand with __GFP_NOFAIL.
- Patches 4-7 handle directories, the per-inode dirty counters, the
  read path and GC, and the write path and writeback per block.
- Patches 8-19 adapt the remaining features: range operations and
  mmap, pinned files, collapse/insert range, move range,
  defragmentation, swapfile, fs-verity, atomic writes, inline data,
  online resize and compression, and remove the -EOPNOTSUPP checks
  that patch 2 added for the features that need them.
- Patch 20 stops rejecting subpage block sizes.

When the block size equals PAGE_SIZE, the behavior does not change,
except for the fixes noted in the individual patches. The following
are not limited to subpage blocks or large folios:

- Patch 1: __complete_revoke_list() and __clone_blkaddrs() compute
  offsets in 64 bits on 32-bit architectures.
- Patch 8: an extending direct write updates i_size in ->end_io(),
  before iomap invalidates the page cache of the written range.
- Patch 10: collapse and insert range hold i_gc_rwsem[WRITE] and
  invalidate_lock until the moved blocks are written back and the page
  cache is dropped.
- Patch 11: move range zeroes the cached data past the old EOF of the
  destination before extending it, and drops the source blocks from
  the page cache also after an exchange that failed part way.
- Patch 12: defragmentation reads compressed files through
  ->read_folio(). A block of a compressed cluster that was not in the
  page cache was read without decompression and written back as file
  data.
- Patch 15: aborting atomic writes holds i_gc_rwsem[WRITE] and
  invalidate_lock.

A few of the patches adjust code from the large folio series [1]:

- f2fs_folio_has_ffs() checks the folio state magic instead of
  requiring a large folio, since order-0 multi-block folios also carry
  a folio state, and the page private flags can legitimately be set
  before a state is attached.
- f2fs_ffs_find_or_alloc() cannot fail with __GFP_NOFAIL, so the
  allocation failure handling of its callers is removed.
- The inode dirty blocks are counted from the dirty bits of the folio
  state, and ->dirty_folio() marks the uptodate blocks of a folio
  dirty, since mm does not tell which blocks were modified.
- Defragmentation and swapfile activation mark only the target block
  dirty instead of the whole page.

Changes in v2:

Addressed the review comments from Chao Yu and Nanzhe Zhao, the
warning reported by the kernel test robot, and the findings of the
Sashiko review. v1 is at [2].

- Patch 1 (block based calculations): rename the subject ("in more
  paths"). Use F2FS_BLK_ALIGN() in dir_blocks(). Compute the new
  i_size in __clone_blkaddrs() in 64 bits.
- Patch 2 (superblock and mount): probe the 2nd superblock from the
  smallest block size and stop at the first one found, so that a stale
  superblock of a larger block size is not picked, and return its
  error instead of the error of the last probe. Bound log_sectorsize
  by log_blocksize and remove F2FS_MAX_LOG_SECTOR_SIZE. Check the
  requested inline_xattr_size in f2fs_check_opt_consistency(). Do not
  set *recovery when no valid superblock is found. Report a failed
  read of a superblock again.
- Patch 3 (folio state): remove the unused variable in
  prepare_large_folio_write_begin(). Count the submitted blocks in
  nwritten also on error. Do not clear the uptodate flag of the folio
  of an inline inode in f2fs_invalidate_folio(). Explain the use of
  __GFP_NOFAIL in the commit message.
- Patch 4 (directories): read the name length in f2fs_delete_entry()
  under the folio lock. Clear the gcing flag of the folio when its
  last dirty block is freed. Simplify f2fs_dentry_to_lblk() and use
  f2fs_folio_lblk_address().
- Patch 5 (dirty counters): commit message only.
- Patch 6 (read path and GC): keep the folio state of a folio that is
  not fully uptodate in ->release_folio while the folio has other
  users. Read the block again in f2fs_get_read_data_folio() and
  f2fs_find_data_folio() when the folio state was released while the
  folio was unlocked, instead of failing. Do not map the blocks past
  EOF in f2fs_read_data_large_folio(). Read under memalloc_nofs in
  ra_data_block(), where GC locks are held. Rename
  f2fs_submit_page_read_sync() to f2fs_submit_block_read_sync().
- Patch 7 (write path and writeback): count the inode dirty blocks
  from the dirty bits of the folio state instead of per folio. Make
  ->dirty_folio() mark the uptodate blocks within EOF dirty, and add
  f2fs_folio_mark_dirty() for the updates made by f2fs, which mark
  only the blocks they modify. Keep f2fs_balance_fs_folio_locked() in
  write_begin instead of balancing after the folio is unlocked. Drop
  the pending write that a failed submission leaves behind in
  f2fs_convert_inline_folio(). Keep the folio dirty and accounted when
  flush_inline_data() fails.
- Patch 8 (range operations and mmap): update i_size of an extending
  direct write in ->end_io(). In page_mkwrite, reserve blocks only
  where it may allocate, i.e. not for a pinned file or a compressed
  cluster, do not balance with the folio locked, and read the blocks
  that are not uptodate after a partial invalidation. Check the dirty
  state of a reserved block only for SEEK_DATA.
- Patch 9 (pinned files): keep failing page_mkwrite on a device
  aliasing file with -EIO.
- Patch 10 (collapse and insert range): hold i_gc_rwsem[WRITE] and
  invalidate_lock from before the first writeback until the moved
  blocks are written back and the page cache is dropped.
- Patch 11 (move range): zero the cached data past the old EOF of the
  destination with f2fs_zero_post_eof_page() before the move. Drop the
  source blocks from the page cache also after an exchange that failed
  part way. Call pagecache_isize_extended() for the gap between the
  old EOF and the moved data.
- Patch 12 (defragmentation): read compressed files through
  ->read_folio() as well, and lock and redirty the folio that was read
  instead of looking it up again (f2fs_get_defrag_folio()).
- Patch 13 (swapfile): use f2fs_folio_mark_dirty().
- Patch 14 (fs-verity): stop the data reads of a verity file at i_size
  in f2fs_read_data_large_folio(). Do not zero the blocks past i_size
  on read while verity is being enabled.
- Patch 15 (atomic writes): hold i_gc_rwsem[WRITE] and invalidate_lock
  while aborting atomic writes, except at eviction.
- Patch 16 (inline data): redirty the folio and stop on any error of
  the inline writeback in f2fs_write_cache_folios(). Note the effect
  on inline inodes with large folios in the commit message.
- Patch 18 (compression): raise the minimum cluster size only when a
  page has more than four blocks, reject a smaller compress_log_size
  in the mount option and in F2FS_IOC_SET_COMPRESS_OPTION, fail the
  open of a file that already has a smaller cluster with -EOPNOTSUPP
  instead of failing its inode sanity check, and document it. Dirty
  every block of a partially dirty compressed cluster before it is
  rewritten. Attach a folio state to the multi-block folios of a
  rewritten cluster before they are dirtied. Count a read folio of a
  compressed file once in the iostat. Do not cut the range that
  redirty_blocks() dirties at EOF. Remove inode_inc_dirty_block() and
  inode_dec_dirty_block().
- Patches 17, 19 and 20: no change.
- The patches also use the F2FS_BLK_* helpers in more places, as
  suggested in the review.

Testing:

Built every patch for x86_64, arm64 (16KB pages), arm and i386.

Ran the xfstests auto group (excluding the clone, dedupe and thin
groups) on arm64 QEMU with mount options "discard,fsync_mode=strict"
in these combinations of page size / block size:

- 16KB/4KB:  default, compression (lz4, zstd, lz4hc, lzo-rle with
             64KB clusters and checksum), compression+encryption,
             encryption+verity, mode=lfs, atgc
- 4KB/4KB:   default, compression, encryption+verity,
             compression+encryption, mode=lfs
- 16KB/16KB: default, compression, encryption+verity,
             compression+encryption, mode=lfs

plus generic/019, 521, 522 and 780 for each combination, and a 24 hour
power-off recovery test with fsstress for each of the three
combinations.

There were no crashes or hangs, and the power-off recovery tests found
no corruption. Two failures are worth a note, and neither depends on
this series:

- generic/455 failed once on 16KB/4KB with encryption+verity, because
  fsync() returned before its node block was written. [3] fixes it.
- generic/551 was killed by the OOM killer in three of the compression
  runs. It is killed the same way without this series.

Also ran:

- The xfstests quick group with lockdep (PROVE_LOCKING and
  DEBUG_ATOMIC_SLEEP) on 16KB/4KB, default and compression. The only
  reports were in generic/574 with compression, where
  f2fs_decompress_cluster() may sleep in the read completion. This
  happens without this series as well, and [4] fixes it.
- 16 processes writing through mmap at the same time until the
  filesystem is full, on a 1GB image with 16KB pages and 4KB blocks,
  with and without large folios and with and without mode=lfs, as
  asked in the review of v1. They got SIGBUS only after the free
  space ran out, the data read back was correct, and fsck found no
  error.
- A 32-bit ARM kernel (4KB pages) with files beyond 4GB.

[1] https://lore.kernel.org/linux-f2fs-devel/20261028154407.1601430-1-nzzhao.sigma@gmail.com/
[2] https://lore.kernel.org/linux-f2fs-devel/20261102193952.3002018-1-daeho43@gmail.com/
[3] https://lore.kernel.org/linux-f2fs-devel/20261103101208.4550-1-seungbum.ju@gmail.com/
[4] https://lore.kernel.org/linux-f2fs-devel/20261112143355.2923939-2-jprusakowski@google.com/

Daeho Jeong (20):
  f2fs: use block-based index and size calculations in more paths
  f2fs: support subpage block size superblock and mount
  f2fs: extend f2fs_folio_state for subpage blocks
  f2fs: support subpage blocks in directory operations
  f2fs: convert inode dirty page counters to dirty block counters
  f2fs: support subpage blocks in data read path and GC
  f2fs: support subpage blocks in data write path and writeback
  f2fs: adapt range operations and mmap for subpage blocks
  f2fs: support subpage blocks in pinned files
  f2fs: support subpage blocks in collapse and insert range
  f2fs: support subpage blocks in move range
  f2fs: support subpage blocks in defragmentation
  f2fs: support subpage blocks in swapfile activation
  f2fs: support subpage blocks in fs-verity enablement
  f2fs: support subpage blocks in atomic writes
  f2fs: preserve inline data in subpage block mode
  f2fs: support subpage blocks in online resize
  f2fs: support subpage blocks in compression
  f2fs: count compress cache entries in pages for its memory limit
  f2fs: enable subpage block size support

 Documentation/filesystems/f2fs.rst |    7 +-
 fs/f2fs/checkpoint.c               |   67 +-
 fs/f2fs/compress.c                 |  569 ++++++---
 fs/f2fs/data.c                     | 1725 ++++++++++++++++++----------
 fs/f2fs/dir.c                      |  126 +-
 fs/f2fs/f2fs.h                     |  237 ++--
 fs/f2fs/file.c                     |  716 ++++++++----
 fs/f2fs/gc.c                       |  103 +-
 fs/f2fs/inline.c                   |   23 +-
 fs/f2fs/inode.c                    |    3 +-
 fs/f2fs/node.c                     |   26 +-
 fs/f2fs/segment.c                  |   14 +-
 fs/f2fs/super.c                    |  180 ++-
 fs/f2fs/verity.c                   |    5 -
 include/linux/f2fs_fs.h            |    2 +-
 15 files changed, 2494 insertions(+), 1309 deletions(-)


base-commit: b9d7379d10d43386b59082da8c9a0b111e054781
-- 
2.56.0.611.g1030f0b940-goog

