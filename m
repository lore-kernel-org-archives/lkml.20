Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91255547057
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731175; cv=none; b=lVwyUgqFeoeAVluN8FdoJkUMic7BDNCMQaYy8EV1b4fnQlLzREdaOji4iBCwWPfNy7sb1giIjFChB1gz7Jp1nlzCN1xB7H5D+W3kHUwB7j0TKKFfsLvhVDnXYxeSzdMFzOaPc7FMzi8hZ5OM+tO56kmNXte95It8nIylF8cn6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731175; c=relaxed/simple;
	bh=Sx3mIvZOij4yuG9u7zY1Emm/ZVMX2tjfa19RlKx236U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SEFneKaqR3awtFmj8T9zj6ieGlIehxjekRpQ+A6tSk7QxWbjgVBAo34QW+27YZuDRQU6+0kzhFXykEdRMx5wBXKC0FBl7bIGkH1v0cVtPCC9WEWmWRfjH1V/1srYzqOwwJ7ky/mHfPDzdETAvTs/0uB+AuQrRMv+ZfJ8958lPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z/Gydtpc; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z/Gydtpc"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1819688eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790731171; x=1791335971; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mw5rpolKjdxKa0DwTFTSUtjCYjZdhi+yaqdpG3z0Heg=;
        b=Z/Gydtpc/OMC1FVUNOItrhI4VxNN0F5V2jRrq+zD3aWOrJaivNlKpA6CM8S/QpUMzo
         JP+nBJsmvofDo915EsqOeSDS6ZhQRomId/f5CYQ/SbPEtTckBGIdl0/q0PlR6RkoSx8Y
         GM0xs+no+lDEXSrquBwa0E2ntDqH1k/2LRpnkacwbtui+uxR70AsP1IqSkzbi2dKifhD
         oU1iD+78KaGWXfazFvWEbot0lwzv1yNcbNqr0vevOVbEkKbIP25nU6wxi1kMmdGGzKxy
         U7DZ2aNN1bfo7udtJLJzMI8qFMxblahUr7WRbXCZAgIW6/53rkunBacCzRmt3Yklt6rS
         X30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731171; x=1791335971;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw5rpolKjdxKa0DwTFTSUtjCYjZdhi+yaqdpG3z0Heg=;
        b=f3XWYaD645TeXN7Jw3ZgqR0N6/V85pajecB+sMzVDkwi7RiIgxRG8QbloFkYSaNiQl
         G3F0yjF4Z6xakGt2NPha+yxTGgEizUGTGBj09x5qn/v3tgEV+aFhyYFn8ZEdTCKk6rBj
         oe/YCUqewdziu4Zb7bQ3kFsETfLaZBgboBHyR3PrDiERVO44W5TkQfXDkzNHPGZYDCWo
         ucZbo6k7nH6cEZP86RrlIr1Xpj0r5HXHeJwaXWsUSwZkg0ig0HhZ3ZkZDcWvCsrPoNCg
         mfLAwjwkx5eLi0MuzGnP9+dq9g9+wHjpxi255QXwCu4o3fzg0rPyercknf1c8rwnkGB1
         acNQ==
X-Forwarded-Encrypted: i=1; AKwUvBws/yYv4UpbHJt+SBj7kn4bE5Q8oJ9TWr5/KSm6qKrq6dpip4rD/9oaG6vhn9Ks7wiy/fJ5rJVCohk1BC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPZwgizOFiI8sJpqACZhBaMlgV2L60o3IXC2UbqY46DrzUAatc
	fNxi+cC46cqZ+LQ50Mo32x+yySf0b/TgD24+W6/m9ruDlBikAk4j6IqgA1bsMjYb4FByFwT4bII
	fCXaefATPWLivr+0KFtTBWc+UTFJn7wYBE54bGg==
X-Received: from dybpl11.prod.google.com ([2002:a05:7301:430b:b0:340:e357:7634])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:66d2:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-34cdcabe7c6mr11525eec.29.1790731170721;
 Tue, 29 Sep 2026 18:19:30 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:19:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011921.1188150-1-sarthakkukreti@google.com>
Subject: [PATCH 0/3] erofs: optimizations for 48-bit extents, shifted
 pclusters, and cache-disabled mounts
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

This series contains three optimizations for EROFS:

1. Patch 1 ("erofs: avoid redundant page copy for aligned shifted/plain
   pclusters"):
   - In z_erofs_transform_plain(), when an uncompressed
     Z_EROFS_COMPRESSION_SHIFTED page is attached in-place (rq->out[no] ==
     rq->in[ni]) at aligned offsets (po == rq->pageofs_in + pi == 0),
     kmap_local_page() and memmove(kin, kin, PAGE_SIZE) are currently invoked.
     On x86_64, arch/x86/lib/memmove_64.S does not early-exit when dst == src,
     executing rep movsb over all 4,096 bytes and dirtying all 64 cachelines.
     Skip kmap_local_page() and memmove() when input and output pages and
     offsets are identical.
   - In z_erofs_attach_page(), allow multi-page inplace I/O for page-aligned
     Z_EROFS_COMPRESSION_SHIFTED pclusters so multi-block plain extents read
     directly into target page cache folios without temporary shortlived page
     allocation or memcpy_to_page().

2. Patch 2 ("erofs: bypass managed_pslots xarray when compressed cache and
   dedupe are disabled"):
   - When mounted with cache_strategy=disabled and without global compressed
     data deduplication (!erofs_sb_has_dedupe(sbi)), mark allocated pclusters
     as unregistered (pcl->anon) and bypass the superblock-wide managed_pslots
     XArray lookup (xa_load), insertion (xa_lock + __xa_cmpxchg), empty
     MNGD_MAPPING scan (z_erofs_bind_cache), and RCU teardown (__xa_erase +
     call_rcu), freeing anonymous pclusters directly via z_erofs_free_pcluster()
     upon decompression completion just like inline metadata pclusters.

3. Patch 3 ("erofs: optimize 48-bit encoded extent lookup with O(1) hint,
   interpolation, and in-page search"):
   - In z_erofs_map_blocks_ext(), optimize variable-length 48-bit extent table
     lookups (recsz >= 16) via:
     (a) O(1) sequential continuation hint (z_extent_hint / z_extent_hint_lend)
         checking map->m_la == hint_lend on step 0,
     (b) step-0 linear interpolation div64_u64(map->m_la * (r - l), lend) for
         random reads, and
     (c) in-page binary search across all extent records [blk_first, blk_last]
         residing within the currently mapped metadata block (256 records per
         4 KiB page for 16-byte extents) before calling erofs_read_metabuf()
         again.

Benchmark Setup (Linux v7.3-rc5, kvm-xfstests, 4 vCPUs, 4 GiB RAM, fio-3.42)
============================================================================
Test image built with `mkfs.erofs -E 48bit -zdeflate,level=1 -C 32768`
containing two primary benchmark files:

1. `/shifted_mixed.bin` (64 MiB, EROFS_INODE_COMPRESSED_FULL,
   Z_EROFS_ADVISE_EXTENTS, recsz = 16, 7,237 extents):
   When a compressed inode contains both compressible and incompressible
   regions (e.g., embedded media, pre-compressed assets, or high-entropy
   sections within a container file), mkfs.erofs emits compressed pclusters
   for the compressible regions and uncompressed Z_EROFS_COMPRESSION_SHIFTED
   extents (fmt = 0) for the incompressible blocks.
   - Bytes [0 .. 28 MiB) contain incompressible data encoded by mkfs.erofs as
     7,168 contiguous 4 KiB page-aligned Z_EROFS_COMPRESSION_SHIFTED extents.
   - Bytes [28 MiB .. 64 MiB) contain compressible data encoded as 69 32 KiB
     deflate pclusters (which causes mkfs.erofs to assign the inode
     EROFS_INODE_COMPRESSED_FULL layout rather than EROFS_INODE_FLAT_PLAIN).

2. `/large_48bit.bin` (256 MiB, EROFS_INODE_COMPRESSED_FULL,
   Z_EROFS_ADVISE_EXTENTS, recsz = 16, 3,901 extents):
   A 256 MiB file compressed with deflate (32 KiB max pcluster size) into
   3,901 variable-length 48-bit extents (average logical extent length ~67 KiB,
   spanning 16 4 KiB metadata blocks).

Workload Definitions & Exercised Code Paths
===========================================
Before every iteration, the filesystem is unmounted and page/buffer caches are
flushed (`umount /mnt/erofs && echo 3 > /proc/sys/vm/drop_caches`), then
remounted with `-o ro,cache_strategy=disabled`:

- `seq_shifted_1j`:
  `fio --rw=read --bs=4k --ioengine=psync --numjobs=1 --offset=0 --size=28m`
  on `/shifted_mixed.bin`.
  Sequential 4 KiB reads across 7,168 Z_EROFS_COMPRESSION_SHIFTED extents.
  Exercises Patch 1 (skips kmap_local_page + self-memmove on aligned in-place
  shifted pages), Patch 2 (bypasses managed_pslots XArray), and Patch 3 (O(1)
  `map->m_la == hint_lend` sequential extent hint, replacing a 13-step binary
  search per 4 KiB read with a single probe).

- `rand4k_shifted_1j` / `rand4k_shifted_4j`:
  `fio --rw=randread --bs=4k --ioengine=psync --numjobs={1,4} --offset=0
   --size=28m --io_size=28m --norandommap=1 --randrepeat=1`
  on `/shifted_mixed.bin`.
  Random 4 KiB reads across 7,168 Z_EROFS_COMPRESSION_SHIFTED extents (1 job
  and 4 concurrent jobs). Exercises Patch 1 (skips self-memmove), Patch 2
  (eliminates superblock-wide managed_pslots XArray spinlock contention and RCU
  callbacks across 1 and 4 threads), and Patch 3 (step-0 linear interpolation +
  in-page binary search across 256 16-byte extent records per metadata page).

- `rand4k_48bit_1j` / `rand4k_48bit_4j`:
  `fio --rw=randread --bs=4k --ioengine=psync --numjobs={1,4}
   --io_size={64m,32m} --norandommap=1 --randrepeat=1`
  on `/large_48bit.bin`.
  Random 4 KiB reads across 3,901 variable-length deflate-compressed 48-bit
  extents (each random 4 KiB read decompresses a 32 KiB deflate pcluster).
  Exercises Patch 3 (step-0 interpolation + in-page binary search, reducing
  erofs_read_metabuf() calls per random lookup from ~12 to 1) and Patch 2
  (managed_pslots bypass).

- `seq_48bit_cold`:
  `fio --rw=read --bs=128k --ioengine=psync --numjobs=1`
  across all 256 MiB of `/large_48bit.bin`.
  Cold sequential read across 3,901 variable-length deflate-compressed 48-bit
  extents. Exercises Patch 3 (O(1) sequential continuation hint) and Patch 2
  (managed_pslots bypass).

Benchmark Results
=================
1) RAM-backed block device (`/dev/loop0` over `/dev/shm`, 5 iterations):

| Workload                        | v7.3-rc5     | Patched      | Delta   |
| ------------------------------- | ------------ | ------------ | ------- |
| seq_shifted_1j (4K read, 1J)    | 438,161 IOPS | 545,870 IOPS | +24.6%  |
| rand4k_shifted_4j (4K rand, 4J) | 474,261 IOPS | 539,127 IOPS | +13.7%  |
| rand4k_shifted_1j (4K rand, 1J) |  87,097 IOPS |  97,203 IOPS | +11.6%  |
| rand4k_48bit_1j (4K rand, 1J)   |  21,671 IOPS |  22,946 IOPS |  +5.9%  |
| rand4k_48bit_4j (4K rand, 4J)   | 119,018 IOPS | 124,459 IOPS |  +4.6%  |
| seq_48bit_cold (128K read, 1J)  | 439.9 MiB/s  | 443.7 MiB/s  |  +0.9%  |

2) virtio-blk (`/dev/vdb`, `cache=none,aio=native`, 3 iterations):

| Workload                        | v7.3-rc5     | Patched      | Delta   |
| ------------------------------- | ------------ | ------------ | ------- |
| seq_48bit_cold (128K read, 1J)  | 551.7 MiB/s  | 600.9 MiB/s  |  +8.9%  |
| rand4k_shifted_1j (4K rand, 1J) |  13,096 IOPS |  13,636 IOPS |  +4.1%  |
| rand4k_shifted_4j (4K rand, 4J) |  69,715 IOPS |  71,685 IOPS |  +2.8%  |
| rand4k_48bit_4j (4K rand, 4J)   |  28,578 IOPS |  28,999 IOPS |  +1.5%  |

Sarthak Kukreti (3):
  erofs: avoid redundant page copy for aligned shifted/plain pclusters
  erofs: bypass managed_pslots xarray when compressed cache and dedupe
    are disabled
  erofs: optimize 48-bit encoded extent lookup with O(1) hint,
    interpolation, and in-page search

 fs/erofs/decompressor.c | 24 +++++++++--
 fs/erofs/internal.h     |  2 +
 fs/erofs/zdata.c        | 33 ++++++++++++---
 fs/erofs/zmap.c         | 94 ++++++++++++++++++++++++++++++++---------
 4 files changed, 121 insertions(+), 32 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog
