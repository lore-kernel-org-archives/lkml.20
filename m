Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C154946A5F4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928760; cv=none; b=KdebV/3f/jmZemnYDByHjW64GxL4A+s5d/7ydcscBv+mcEqsNpA8FMDXKmnxa9ww+vHPpMR9UEGoJrpIv96cCXnYyXkQQzVWA+qgjE6MXMdRb2umIOc8e9h2mMhjZ+I8LI45u0f4R4HVy368XWtVxrGFArmW+ufhinpSUCFxXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928760; c=relaxed/simple;
	bh=0W3l5gzOf175HxrmQHRJO2uQtrDxox5gxDEtDwEOFE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tx9+nKUcKmnf0RlYruOu0XL7Bp4/H8xWXvZT4SZh6Icvvd38iYSAhUoB3kWCmGLHrIBbopBJgiujowJJrDKfS3uQurhZK0lhAlY6r8FfcczkeUDC1dvKPt++ENEg2BdhHvez371RGD2Fx0lJX4RlYApLhfQscb+n0eW53JtabfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJVzAIob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJVzAIob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6665B1F000E9;
	Fri, 28 Aug 2026 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787928758;
	bh=ELhljBAu15ROpmEaT8Yh7qydfeZbcelWQRMHhRVBiPc=;
	h=Date:From:To:Cc:Subject;
	b=ZJVzAIobQ8VTMLVwthiWeqOdq2KaEtJDkcBkAna8yjxaYGDfSL4JQql3gnxclxwvJ
	 AthXPcQsxO7fIBIO5pfTN67WGR9hRfOicMpTB2k0+Js4V602FxQCkyS9l/ae3j/yk4
	 +uh79hDG/SXDI9oissI84j1vYP+Bl00tYl6TxRaYhvnQB7FQZ8BZRmpxWT9wLUSH+q
	 EU8sDxC3dEhNqKrEfpYAB3U4F1evzR5nyvrItWIa/VL6QRUcw0mPhROO/99zLs8hpW
	 kGXs3O/u63mkaKuFHzOVUHpNPTGJ/6iZC8xlI7gKaUuvONBjlhF+WfUNJ5rMWzborH
	 PfzbEP/3mLeIQ==
Date: Fri, 28 Aug 2026 14:52:36 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] f2fs for 7.3-rc1
Message-ID: <apGgtMJ4mB-XRBlO@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Could you please consider this pull request?

Thanks,


The following changes since commit 62cc90241548d5570ee68e01aaba6506964e9811:

  Merge tag 'mm-hotfixes-stable-2026-07-27-14-18' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (2026-07-27 14:36:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.3-rc1

for you to fetch changes up to c966d29e01bbf829f8bb4a39a49811c56cdb49c3:

  f2fs: support resizable tail section and unify pinned allocation (2026-08-27 04:47:36 +0000)

----------------------------------------------------------------
f2fs-for-7.3-rc1

In this round, key enhancements focus on reducing inode management memory
overhead, introducing resizable tail sections with unified pinned allocation,
and boosting I/O throughput via parallel multi-device flushes and asynchronous
f2fs_write_end_io() execution. We also add dynamic device alias reservations to
allow on-the-fly space donation from user partitions.

Alongside these features, critical bug fixes resolve folio race conditions,
lingering dirty flags, dentry and block counter leaks, and potential deadloops
in f2fs_fsync_node_pages(). Additional stability patches address error-path
handling across symlink, sync, and rename/unlink operations, prevent pinned file
fragmentation, and correct segment migration and free section accounting in
free_segment_range.

Enhancement:
 - reduce memory footprint of ino management
 - support dynamic reserve/release for device aliasing
 - issue multi-device flushes in parallel
 - add a way to run f2fs_write_end_io() asynchronously
 - support resizable tail section and unify pinned allocation

Bug fix:
 - fix to pass folio->index to f2fs_sanity_check_node_footer()
 - fix folio_nr_pages() race after put in large folio invalidate
 - fix to clear dirty flag on folio in error path
 - accurately adjust free_sections during free_segment_range
 - fix to avoid potential deadloop in f2fs_fsync_node_pages()
 - fix the error path in symlink, device alias in rename/unlink,
   f2fs_sync_fs,
 - fix to migrate all curseg types during free_segment_range
 - fix to avoid pinfile fragment on fragment:{block, segment} mode
 - fix valid block count leak on data block allocation failure
 - fix dentry folio leak in find_in_level
 - reject overlapping move range after len expansion
 - fix some bugs related to file pinning, GC functions, i_size.

And, the series includes a number of minor bug fixes.

----------------------------------------------------------------
Bart Van Assche (1):
      f2fs: Run f2fs_write_end_io() asynchronously

Chao Yu (22):
      f2fs: drop FGP_NOFS in f2fs_write_begin()
      f2fs: quota: do not use GFP_NOFS in f2fs_quota_read()
      f2fs: embed f2fs_gc_kthread in f2fs_sb_info
      f2fs: fix to avoid potential section-unaligned pinfile
      f2fs: fix to avoid move_range and defragment on device_alias file
      f2fs: fix to return -EFSCORRUPTED in f2fs_get_node_info() correctly
      f2fs: avoid unnecessary shrink in f2fs_shrink_scan()
      f2fs: fix to clear dirty flag on folio in error path
      f2fs: print error information in f2fs_put_super()
      f2fs: fix to pass folio->index to f2fs_sanity_check_node_footer()
      f2fs: fix to off-by-one issue in f2fs_zero_post_eof_page()
      f2fs: fix to zero post-EOF data when extending file size
      f2fs: unify add/remove ino entry API for all ino types
      f2fs: fix to reclaim space in f2fs_allocate_pinning_section()
      f2fs: fix to shrink gc_lock coverage in f2fs_gc_range()
      f2fs: cleanup w/ f2fs_need_rand_{blk, seg, seg_blk}
      f2fs: fix to avoid pinfile fragment on fragment:{block, segment} mode
      f2fs: reduce memory footprint of ino management
      f2fs: use f2fs_{down, up}_(read, write}_trace() for nat_tree_lock
      f2fs: fix to reset all pinned status during fggc
      f2fs: fix to propagate error from f2fs_sync_fs()
      f2fs: fix to avoid potential deadloop in f2fs_fsync_node_pages()

Chen Changcheng (1):
      f2fs: fix valid block count leak on data block allocation failure

Daeho Jeong (6):
      f2fs: support dynamic reserve/release for device aliasing
      f2fs: avoid setting SBI_NEED_FSCK on transient resize failure
      f2fs: fix to migrate all curseg types during free_segment_range
      f2fs: fix error handling on device alias check in rename and unlink
      f2fs: accurately adjust free_sections during free_segment_range
      f2fs: support resizable tail section and unify pinned allocation

Guanghui Yang (1):
      f2fs: fix dentry folio leak in find_in_level

Hao-Qun Huang (1):
      f2fs: reject overlapping move range after len expansion

Jaegeuk Kim (3):
      f2fs: refactor f2fs_evict_inode having three major parts
      f2fs: call __add_ino_entry out of the eviction path
      f2fs: don't leave the hashed inode while it's unlinked

Joanne Chang (1):
      f2fs: dirty directory inodes on mtime/ctime update

Seongjae Jeong (1):
      f2fs: use adjusted write range after f2fs_write_checks()

Wenjie Qi (8):
      f2fs: validate MOVE_RANGE destination size
      f2fs: limit recovery filename logging to stored length
      f2fs: only redirty pinned folios in redirty_blocks
      f2fs: return writeback error from collapse range
      f2fs: reject invalid recovered filename lengths
      f2fs: avoid NULL checkpoint thread access in sysfs
      f2fs: protect critical_task_priority updates with s_umount
      f2fs: return symlink writeback errors

Yonggil Song (1):
      f2fs: issue multi-device flushes in parallel

Zhan Xusheng (4):
      f2fs: use the mount idmap for the owner check in f2fs_xattr_advise_set()
      f2fs: don't drop the top folio order in the f2fs_iostat tracepoint
      f2fs: Remove unused curseg_segno() and curseg_alloc_type()
      f2fs: fix i_size when pinned fallocate partially fails

Zhaoyang Huang (1):
      f2fs: fix folio_nr_pages() race after put in large folio invalidate

 Documentation/ABI/testing/sysfs-fs-f2fs |  18 ++
 Documentation/filesystems/f2fs.rst      |  43 ++-
 fs/f2fs/checkpoint.c                    | 123 ++++++++-
 fs/f2fs/data.c                          |  48 +++-
 fs/f2fs/debug.c                         |   4 -
 fs/f2fs/dir.c                           |   7 +-
 fs/f2fs/extent_cache.c                  |   9 +
 fs/f2fs/f2fs.h                          |  90 ++++++-
 fs/f2fs/file.c                          | 460 ++++++++++++++++++++++++++++----
 fs/f2fs/gc.c                            | 129 +++++----
 fs/f2fs/gc.h                            |  27 +-
 fs/f2fs/inline.c                        |   2 +-
 fs/f2fs/inode.c                         | 234 +++++++++++-----
 fs/f2fs/iostat.c                        |   6 +
 fs/f2fs/namei.c                         | 168 +++++++-----
 fs/f2fs/node.c                          |  81 +++---
 fs/f2fs/recovery.c                      |  55 ++--
 fs/f2fs/segment.c                       | 279 +++++++++++++------
 fs/f2fs/segment.h                       |  37 ++-
 fs/f2fs/shrinker.c                      |   3 +-
 fs/f2fs/super.c                         |  99 ++++++-
 fs/f2fs/sysfs.c                         |  34 ++-
 fs/f2fs/xattr.c                         |   2 +-
 include/trace/events/f2fs.h             |  23 +-
 include/uapi/linux/f2fs.h               |   7 +
 25 files changed, 1532 insertions(+), 456 deletions(-)
