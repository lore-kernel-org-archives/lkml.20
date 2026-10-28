Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202259;
	b=QEpXc7Ewy/JdY0Gzg/d72EYk+EllsdqG5XGVUZwhciDMxjfrXXxgyA5GpSOXiQHeinqI
	 xBIqTFFDHUo7Yhn1LjTUY10hL01FsuhqH3/Gc556jIqXRRQ4hmIPdTZQdeAhpCDnMtKFT
	 +rMDgkvdovMo3XI7Q1MO8NqNAJcFDPi+FJ/0XE6AQJCzWbzXTrb4DkDwruOBpbSfhyhpJ
	 XEHGQ4W5ZqNYt3vtlD4JZEJHpb8qhW+V+YhD7+ZqCLQJ1wsoJWB8k8aat/EjOkEX9EAgR
	 wPsdGtC8e184Tja/0p5qeaaIesZCWz+yrxi3BZsHZyuFROQYxZabpL0xFioTwToQY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WvvJjNewKYR1SRv+tuxb6RUDvDpK3KFT+CR8TO9HsGA=;
	b=zq55LQE+QO1alcoJYZD6BFg0l1O4l+9Cq479zidC8OiWzhHBBa1GUr9gSu5monXkRMpc
	 CYeSLWTEMG+u7Yrf5aYP1xW0qTGqolDGlmpvqVMEOG+nBrvbytxTpBi/UN8NmjjjjBhRs
	 eV5RpcgMduZHFljjgoF8Oa8n0tTj0obwY2ZWQYeuN9R+/9k2V6gYkZlFPLheRKKXD5pwe
	 4mbjMd8hhS2iK82vD2hMLByuUT6hW8ineUFQNqVr52SmMQ5shJPTGjrzUkp/cOjsxRitU
	 93/qCnpaowf0h/M7BhtGXuJLfzdCVu4LxQ5hsBHR/VnRFn7M8pDpq0IHGrhOQnxXRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSF0n0ex;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A282260A260B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A282260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wSF0n0ex
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so3055425ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202258; x=1793807058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvvJjNewKYR1SRv+tuxb6RUDvDpK3KFT+CR8TO9HsGA=;
        b=wSF0n0exdmpD81J4YNlfvOp48RmY9El5/Y1SsmhieBlt9bev6sY6V1RnArT7K5kX39
         HbR5N1pp0xXmqqGXG/ouz0PljqOIKbCQdrld4knsiKfm1GuEiEDPfQQS66Sbcv39Kepq
         XxL6LZkpTdOczHXGAQ/bWS1IPCKQM7YL8SVjkaK16+6LFmIq1hxG6PtHoDWwXiIx/+vu
         HjZw+hCA9ah300DUhsMuoxAgLedh73LPBzb4dcmCDD2tKBDUlKAmWy8mQnXC5SC7p5ZV
         BeKOFfnUpXn5MCl/7Hk3H0mdhnQv/H4L3Q1WFsZC29W7kSYztxU00+zrgUnHjnc/wM9p
         TFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202258; x=1793807058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WvvJjNewKYR1SRv+tuxb6RUDvDpK3KFT+CR8TO9HsGA=;
        b=KHXedzkCp3HKGFIAaUadhi4DXgdwuO/D0LRywWqrSI4tzyJI0ZC4bBSUZGfWF20Rt/
         v8iau6Xj0KeK+vsUgnm7KjToVne2ZLFjw2MI6+y8d5yRMsXnrzwIFz0fIWmg9B2Dw49g
         IpdrqAe2IJ1PlNObDBSRoI5M3H9PyfqnyOnzMpx1Rf72LNZdGh/dBZuYgWtoDh4pv2m3
         tAg8OBLtWMtTLZ9Mn/21vMbH08nkwhH/dbPpojUj7udPwmvf6FPKeTS22tBoukDJDz4r
         K9JLxuZd8siKSU+Osj0gvJPSxzbvW9Qz5hxPaN/Rh98EbTrTwQKbeXV25WC7knGscX6P
         KxNA==
X-Forwarded-Encrypted: i=1; AKwUvBweEHG3KUcX+DYwOS6mVPU6PojMQpkKkbVgcdX8QA3gw5GNTpnXJk8LHvmxk+MPVqTnMKpUhDdKhvyZRzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYY//06G76A0daOXar1wjrdM1OV9d5uC86o/xti9suI0iw+xnA
	pzzYkQdqNz+BMQNaImat6YSPruYDHndfsBLl9OcRqQm2wqYlGk0lAMjv
X-Gm-Gg: AYBFou2EmfzyfcRIOV84x428w7vYpLMOHd193ej9urZCm/5/oGxYrInwhQJvMOfZzZr
	8D9CtrMdCjRQuf45chLHvOyjzVR/n1FG66Te6FV0gGm5Ei8Iginl1M6OxZ1xlZC55i147xKKwoZ
	aFdhnjzVXtUB8db5yi7GW8ew/A9wcXWM0GTWXClfMzQO+diTPMDT2W02nqpo0kuBMtZrQcw/oDL
	c4xJyR5NpFD3sGS3SN33ReogeWJJsgYGNnexZNGBtwxBYHV4CEMXzLh4AnCVaA1A05lae6GLxPZ
	2bXda1GVGu14RXSaDibefpAN+j7lUXkRSaYvomH/2GMx4MCKS1S0xZRIil/Xzb0KkrrJKNC7LCq
	Vdn0hjGFgQ8R7FqQ3Ki3YfE2eztfcIpuYw8p1cFw0SRDHF6jr82C7JBRgRPXsWHD4el8Zcrgy1K
	YtE68fBjM4FMRD9l1mN38fg2gWe7E/I9vCsEsb82adewKD6M5U8GEfniK/2Bnyr4XgDxrYzDCur
	FMb7eoZTr+7J8N5rTdkMm3+WmA1r4v+MxvHDiObTLXdl/dqy0Qh5CJQuNMXEnaz/bkV5pE4RmTv
	X4dElH/RQF5wWGNbAzNF0WpA8K7Qtbr8Z4VpJPTOQ5NWSXT/PeG68C1zL7Vj4cYunJE=
X-Received: by 2002:a17:903:17c7:b0:2e9:3a86:b995 with SMTP id d9443c01a7336-2eb07406f2dmr9006645ad.15.1793202257758;
        Wed, 28 Oct 2026 08:44:17 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:16 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v8 00/15] f2fs: support & optimize large folios for writable files
Date: Wed, 28 Oct 2026 23:43:51 +0800
Message-ID: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

This series supports large folios for most readable/writable files
in buffered I/O paths, including normal files, block-layer encrypted
files, and atomic files except for inline-data files, compressed files,
and quota files.

It also extends f2fs_folio_state to coexist with f2fs page-private
flags and to handle large folio write path and partial truncate of
large folios correctly.  A valid large folio always carries a
f2fs_folio_state at its folio->private in the current implementation.

Benchmark details can be found in the RFC v2 cover letter:
https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com

Changes in v8:
- 01/15: add a sanity check in f2fs_folio_has_ffs(): if a large folio
  carries non-pointer private data (PAGE_PRIVATE_NOT_POINTER), report
  it with f2fs_bug_on() and return false instead of casting the value
  to a struct f2fs_folio_state pointer.
- 03/15: cache sbi before dropping read_pages_pending, so
  f2fs_finish_read_bio() no longer uses F2FS_F_SB(folio) after a sync
  reader has been woken up and may have released the folio.
- 05/15: clear the dirty bits of the whole folio on success, otherwise
  post-EOF subpages (e.g. fill_zero() with FALLOC_FL_KEEP_SIZE, or a
  block migration beyond EOF) keep the folio redirtied forever;
  - recheck cp_error after f2fs_balance_fs() or the trylock_op() backoff
    dropped the folio lock, and drop the folio instead of writing on a
    filesystem which can no longer checkpoint;
  - reset the per-folio submitted counter for each dirty range.
- 07/15: since the whole valid range below will be marked dirty, a large
  folio whose subpage was invalidated by a racing collapse/insert/punch
  hole is not usable; after folio_lock(), unlock it and return
  VM_FAULT_NOPAGE (-EFAULT) so the faulting access is retried instead
  of dirtying the stale subpages.
- 08/15: keep PAGE_PRIVATE_GCING on a failed GC write which redirties
  the folio, and clear it only when no dirty subpage is left; mark the
  target subpage dirty in f2fs_defragment_range() and
  f2fs_migrate_blocks(); and submit the cached bio before unlocking a
  large folio in move_data_page() to avoid an AB-BA deadlock with
  WB_SYNC_ALL.
- 15/15: make redirty_blocks() large-folio aware: allocate the
  f2fs_folio_state and mark the cluster range dirty.  This is mainly
  for the chattr +c (FS_IOC_SETFLAGS) case, where the compression flag
  is set on an inode that keeps using large folios until it is evicted;
  since F2FS_IOC_COMPRESS_FILE is already rejected for large-folio
  mappings, this hint state is only reachable through chattr +c.
  Without this, F2FS_IOC_DECOMPRESS_FILE and
  F2FS_IOC_RELEASE_COMPRESS_BLOCKS would find no dirty range and
  silently skip the rewrite.

Many thanks to Chao for the detailed v7 review; several of the fixes
above are folded in from his suggestions.

Changes in v7:
- 01/15: realloc the f2fs_folio_state in f2fs_get_lock_data_folio() if
  it was released while the folio was unlocked.
- 04/15: on an atomic buffered write repeat if folio was unlocked, check the 
COW block before reserving it again, so inc_atomic_write_cnt() is not called twice.
- 08/15: clear PAGE_PRIVATE_GCING if large folio has no dirty sub pages
 when f2fs_trylock_op() fails before any write is submitted in f2fs_do_write_data_page().

No other functional changes.

Changes in v6:
- Rebased onto the f2fs dev branch (fd106ada4dee).
- v5 12/16 ("f2fs: wait for folio writeback before ffs_detach_free")
  is dropped, because the lkp warning reported by [1] was caused by a
  write_pages_pending leak on the GC truncate path.

- Improve large-folio support in the f2fs_do_write_data_page() path used
  by GC:
  - 05/15: use __folio_start_writeback(folio, folio_test_dirty(folio))
    in both the IPU and OPU paths, so a single-subpage GC write does not
    clear PAGECACHE_TAG_TOWRITE while other subpages are still dirty [3].
  - 05/15: add f2fs_ffs_put_write_pending() as the common writeback
    completion helper; do_write_block() only ends writeback for order-0
    folios.
  - 08/15: move the write_pages_pending increment from move_data_page()
    into f2fs_do_write_data_page(), take it only after
    __folio_start_writeback(), and drop it on every error path.
    move_data_page() no longer adjusts write_pages_pending or clears
    gcing on error [1].

- 02/15: compute bio_offset/bio_len against the folio actually added to
  the bio [5].

- 05/15, 06/15: fix the order-0 dirty accounting leak in the cp_error
  path [2].

- 10/15: allocate ffs before f2fs_truncate_read_extent() [4].

- 11/15: move the existing truncated-page handling into
  f2fs_clear_truncated_page_state() and reuse it for the subpage-aware
  large-folio writeback path, including the -ENOENT/NULL_ADDR case [2].

Link to v5: [6]

Many thanks to Chao, Daeho and Jaegeuk for the reviews, and to the
kernel test robot for the report.

[1] https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
[2] https://lore.kernel.org/r/6be679d1-d8ab-41b3-9975-1f1bcd552579@kernel.org
[3] https://lore.kernel.org/r/fc101bc7-6ece-4a30-9e19-9b32376489a8@kernel.org
[4] https://lore.kernel.org/r/36220ef3-5b00-4aa1-ad11-60b10857a886@kernel.org
[5] https://lore.kernel.org/r/atA8dsZ35E6wTMD6@google.com
[6] https://lore.kernel.org/r/20261014064445.2835813-1-zhaonanzhe@xiaomi.com/

Nanzhe Zhao (15):
  f2fs: extend folio state for large folio write path
  f2fs: carry subpage offset and count in write IO
  f2fs: support regular file buffered writes on large folios
  f2fs: support atomic file large folios buffered write
  f2fs: support large folio writeback
  f2fs: account large folio dirty data at block granularity
  f2fs: prepare mmap write faults for large folios
  f2fs: make GC migration large-folio aware
  f2fs: optimize small block size large folio read
  f2fs: support partial uptodate large folio read
  f2fs: handle partial truncate of large folio dirty subpages
  f2fs: fix zeroing paths for large folios
  f2fs: handle block cloning within the same large folio
  f2fs: allow large folio support to writeable files
  f2fs: make compressed files compatible with large folio

 Documentation/filesystems/f2fs.rst |   10 +
 fs/f2fs/checkpoint.c               |   40 +-
 fs/f2fs/compress.c                 |    7 +-
 fs/f2fs/data.c                     | 1550 +++++++++++++++++++++++++---
 fs/f2fs/dir.c                      |    2 +-
 fs/f2fs/f2fs.h                     |  182 +++-
 fs/f2fs/file.c                     |  269 +++--
 fs/f2fs/gc.c                       |   51 +-
 fs/f2fs/inline.c                   |    3 +-
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +-
 fs/f2fs/segment.c                  |   13 +-
 13 files changed, 1869 insertions(+), 265 deletions(-)

-- 
2.43.0

