Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042831;
	b=uYRimq+fxDnn1+k3rlfKmzuO10KLWBJkOMW5ZlmZOC6VpM7yBTcUch1DjkBKHH6333T4
	 YfaMmLr/FC3PC10VDISJCBAw1PF2i2B9BH80V+nSWLCoatOAAVfMzxwRTm/vGUi8iRsDW
	 JwZ4ltRIkmQAX8+CXp/hKPyqHGsRtOdpWxLrp8Su1v2KlMSpO87+OdUdkAMZ8OfESjtOl
	 WJo45OBufj+HHCWjhE7JFe0v8axUZc8M7gfTY+iMuAASLyaLQA+Gyr0ZsQP+Vk99K8fsy
	 3au0/+QcW+KyfB4nX3ZEvlWrrZ2Ab/6rpX4xSJsw6/pCeX74i/MqWWscl9ochQo1IWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042831;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=PaKimVo4hnbicpErBECZydxL5Ui/oBiamdmnm3XZIR0=;
	b=JsounW76O3WWNWqmuGFEIFnO3AsMetFOI1jIyszhbejek4dybkOVSni/dUuC2Z9F77uD
	 ZyfGvCtq0dsoLvn6HIfp5TIIKYrv4U+OtDMWvy+yWLFjO84Xz6lT2/aOIqVDlF436fUa9
	 C70upWmTdP8LDS8JxO+RyjtHUvcAOvSUS+RaRsDetKBCCnSzCYms4Js98gCLbNz/nqLTL
	 PRp/KYR54uIFRRkglTdfJ+/5ruVqVMaQtUaJY6qPzO1pDxP5MM1S2Xh9jBDGEaGraNs/o
	 6BZijlqYbUDcHNP2FVt6md90QILEfxz+EHGtOLEd/ZR9Q1h+nPGglbdouqDM2cCxeaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BerEIIzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BerEIIzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09CE1F01828;
	Mon, 26 Oct 2026 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042831;
	bh=PaKimVo4hnbicpErBECZydxL5Ui/oBiamdmnm3XZIR0=;
	h=Date:From:To:Cc:Subject;
	b=BerEIIzOtxVPXCTSk7v7w54INP38C/IPuXU9Z4F2xuNcc8HQ3SdG9473KpZS3Bui/
	 VSQlD22DCf7bxQ0Ea2ovEkKu2Y0Ia/u/Jxlcc0tt1BLmk6NBdPoDjGQRRSFze/f4m+
	 ln4J+zR1o1P8vGVm/eLFtegzy1uRMLv+lPnwkg74SswWaiF71cvtOLB8Mck22G3UAp
	 vZ+qCNeSR9j8qILPeRW6VOsDcdu4INAfaJMrrrk3ph/Qb69WrDn56nsIZUGAL0UYfD
	 AmPAxaoFJi6rCsbE00Eor/Fp7txywysaqNh+7VBga2Oodl6qEINJlaIuNWdLsOrH2w
	 oX2STkGZfevlg==
Date: Mon, 26 Oct 2026 19:27:09 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Subject: [GIT PULL] f2fs for 7.4-rc1
Message-ID: <at-pjQ691G9O8-2i@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.4-rc1

for you to fetch changes up to ee17c0cd763b622012bc725253015b6a721b48f8:

  f2fs: compress: don't overwrite populated compress cache entry (2026-10-26 15:34:50 +0000)

----------------------------------------------------------------
f2fs-for-7.4-rc1

In this round, key enhancements focus on introducing a dedicated metadata
cache infrastructure and dynamically parameterizing on-disk block layouts
and geometry macros. Moving meta, node, and compress blocks out of the VFS
page cache removes the page == block size assumption for metadata, which
along with dynamic block layout descriptions paves the way for large folio
and page != block support in the future. We also opt in to multigrain
timestamps, add bio entry-count throttling for asynchronous write_end_io
completion, and expose the resizable_tail feature via sysfs.

Alongside these features, critical bug fixes resolve race conditions across
compression, mmap write faults, checkpoint/shutdown, and filesystem freeze,
prevent write bio splitting and GC holes on sequential zoned devices, and
strengthen on-disk sanity checks for SIT/NAT bitmaps, read-only curseg
entries, and device aliasing. Additional stability patches address online
resize, roll-forward recovery, atomic file operations, quota handling, and
dirty inode syncing livelocks.

Enhancement:
 - implement dedicated metadata cache for meta, node, and compress blocks
   to decouple metadata from page cache for large folio and page != block
   support
 - dynamically describe SIT, NAT, orphan, dentry, node, and xattr block
   layouts and parameterize block/sector/node conversion macros
 - opt in to multigrain timestamps
 - introduce max_atc_write_bio_entry_cnt sysfs node
 - expose resizable_tail feature via sysfs
 - avoid unnecessary reads in f2fs_update_meta_block()

Bug fix:
 - compress: force out-place update for all writes, allow pinning empty
   compressed files, and fix truncate/writeback and cache population races
 - zone: avoid bio split and GC target block grab failure on sequential zones
 - quota: convert inline quota files on quotaon, fix flush failure during
   freeze, and restore empty string mount options
 - atomic/mmap: disallow mmap write and data-modifying fallocate on atomic
   files, avoid truncate_inode_pages_final() on live inodes, and fix races in
   f2fs_vm_page_mkwrite()
 - resize/alias: refresh pinned allocation boundary and flush SIT journal
   during resize, and drop pending discards before reserving device alias
 - sanity check: bound SIT/NAT bitmaps by checkpoint pack, check all
   cur_*_segno[] on readonly images, and validate multi-device on device alias
 - recovery/cp: release removed xattr node in roll-forward recovery, invalidate
   curseg on change_curseg() failure, and return -EIO for lost inode block
   after cp_error
 - fix livelock in syncing dirty inodes and preserve APPEND/UPDATE ino entries
 - use bio_in_atomic() in f2fs_{read,write}_end_io()
 - fix 32-bit shift truncation in mount option bitmasks and defragment range

And, the series includes a number of minor bug fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      f2fs: quota: fix unused-label warning

Chao Yu (35):
      f2fs: parameterize node helpers and macros
      f2fs: fix to avoid folio->mapping dereference in is_{meta, node}_folio()
      f2fs: compress: fix to handle race between truncate and writeback
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
      f2fs: cache: pin cached block in f2fs_end_cache_writeback()
      f2fs: cache: pin cached block in f2fs_unlock_cache()
      f2fs: fix to check continuousness in f2fs_sync_meta_pages() correctly
      f2fs: fix to set sbi->log_blocksize in advance
      Revert "f2fs: skip node_change lock for inline data writes"
      f2fs: zone: fix to avoid bio split on sequential zone
      f2fs: cache: introduce metadata_cache sysfs node
      f2fs: cache: shrink meta and node caches in f2fs_balance_fs_bg
      f2fs: cache: wake up f2fs_writeback when exceeding threshold
      f2fs: cache: support asynchronous write_end_io
      f2fs: introduce max_atc_write_bio_entry_cnt
      MAINTAINERS: f2fs: add dev branch to git tree entry
      f2fs: fix to invalidate curseg if change_curseg() fails
      f2fs: fix to use bio_in_atomic() in f2fs_write_end_io()
      f2fs: fix to use bio_in_atomic() in f2fs_read_end_io()
      f2fs: fix to avoid potential reference count leak in do_garbage_collect()
      f2fs: zone: fix to don't fail to grab GC target block on zoned device
      f2fs: fix to fetch ino via ino_of_node() under cache lock
      f2fs: fix to update superblock crc in sanity_check_area_boundary()
      f2fs: compress: don't overwrite populated compress cache entry

Daeho Jeong (10):
      f2fs: drop pending discard commands before reserving device alias
      f2fs: fix livelock in syncing dirty inodes
      f2fs: cache: count the temporary pins apart from the regular references
      f2fs: convert inline quota files when turning quota on
      f2fs: disallow mmap write and data-modifying fallocate on atomic files
      f2fs: return -EIO for a lost inode block after cp_error
      f2fs: release a removed xattr node in roll-forward recovery
      f2fs: use BIT_ULL for mount option bitmasks
      f2fs: expose resizable_tail feature via sysfs
      f2fs: don't use truncate_inode_pages_final() on live inodes

Hengyu Liang (1):
      f2fs: allow empty strings for journaled quota options

Jaegeuk Kim (2):
      f2fs: rename page_count with cache_count
      f2fs: rename nr_pages_to_skip with nr_caches_to_skip

Jeff Layton (1):
      f2fs: opt in to multigrain timestamps

Jianan Huang (2):
      f2fs: quota: fix stale lock holder on remount failure
      f2fs: quota: fix quota flush failure during filesystem freeze

Jiucheng Xu (1):
      f2fs: force out-place update for all writes on compressed file

Joanne Chang (1):
      f2fs: allow pinning empty compressed files

Kaixuan Li (2):
      f2fs: check every cur_*_segno[] entry on readonly images
      f2fs: bound the SIT/NAT bitmaps by the checkpoint pack

Kelvin Zhang (11):
      f2fs: initialize sb_info early in f2fs_fill_super
      f2fs: describe SIT block layout dynamically
      f2fs: describe NAT block layout dynamically
      f2fs: describe orphan block layout dynamically
      f2fs: describe dentry block layout dynamically
      f2fs: describe {i,d,id}node block layout dynamically
      f2fs: describe xattr block layout dynamically
      f2fs: parameterize sector conversion macros
      f2fs: parameterize byte and block conversion macros
      f2fs: describe node tree geometry dynamically
      f2fs: parameterize block size and mask macros

Nanzhe Zhao (2):
      f2fs: remove mappedtodisk flag usage in mmap write path
      f2fs: read i_size once in f2fs_vm_page_mkwrite

Seongjae Jeong (5):
      f2fs: skip node_change lock for inline data writes
      f2fs: reject device aliasing without a multi-device configuration
      f2fs: fix termination of f2fs_sync_meta_caches()
      f2fs: avoid unnecessary reads in f2fs_update_meta_block()
      f2fs: fix submit accounting for IPU writeback

Wenjie Qi (3):
      f2fs: wait for inode record work before clearing ino bitmaps
      f2fs: flush SIT journal during filesystem resize
      f2fs: refresh pinned allocation boundary after resize

Zhan Xusheng (1):
      f2fs: fix defragment writeback range truncation on 32-bit

Zhiguo Niu (1):
      f2fs: fix to record both APPEND and UPDATE ino entries

 Documentation/ABI/testing/sysfs-fs-f2fs |   41 +-
 Documentation/filesystems/f2fs.rst      |    3 +-
 MAINTAINERS                             |    2 +-
 fs/f2fs/Makefile                        |    2 +-
 fs/f2fs/acl.c                           |   26 +-
 fs/f2fs/acl.h                           |    8 +-
 fs/f2fs/cache.c                         |  894 ++++++++++++++++++++
 fs/f2fs/cache.h                         |  252 ++++++
 fs/f2fs/checkpoint.c                    |  568 +++++++------
 fs/f2fs/compress.c                      |  195 ++---
 fs/f2fs/data.c                          |  657 ++++++++++-----
 fs/f2fs/debug.c                         |  100 ++-
 fs/f2fs/dir.c                           |  221 ++---
 fs/f2fs/extent_cache.c                  |   25 +-
 fs/f2fs/f2fs.h                          |  518 +++++++-----
 fs/f2fs/file.c                          |  241 +++---
 fs/f2fs/gc.c                            |  242 +++---
 fs/f2fs/inline.c                        |  293 +++----
 fs/f2fs/inode.c                         |  242 +++---
 fs/f2fs/iostat.h                        |   11 +
 fs/f2fs/namei.c                         |  114 +--
 fs/f2fs/node.c                          | 1343 ++++++++++++++++---------------
 fs/f2fs/node.h                          |  193 +++--
 fs/f2fs/recovery.c                      |  255 +++---
 fs/f2fs/segment.c                       |  445 +++++-----
 fs/f2fs/segment.h                       |  100 ++-
 fs/f2fs/shrinker.c                      |   16 +-
 fs/f2fs/super.c                         |  451 +++++++----
 fs/f2fs/sysfs.c                         |   44 +-
 fs/f2fs/verity.c                        |    6 +-
 fs/f2fs/xattr.c                         |  133 +--
 fs/f2fs/xattr.h                         |   23 +-
 include/linux/f2fs_fs.h                 |  140 ++--
 include/trace/events/f2fs.h             |   71 ++
 34 files changed, 4901 insertions(+), 2974 deletions(-)
 create mode 100644 fs/f2fs/cache.c
 create mode 100644 fs/f2fs/cache.h
