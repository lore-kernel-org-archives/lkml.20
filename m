Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648403;
	b=P1rnzphtmiZq6w4+3BsT8wDQRdnbzt/6yf4j2R2DfIdSN6Rm5lMiq2gEq9UrdNe63uOa
	 CS7g4Pr4Lo+/mfsmzzzVszHLv9W+/adNSEak0gKXri10qPzh5YH3/dQEL41vndzykTJeS
	 PJhY+lNEcfcV1N+jEHy4LfAQ4UcvVsU1eZsoRclMU6zRH94E3toK1GwlIhUkVsNdO66KL
	 9BZReJS4Lq+9xkRfTqddoGoZg026RKLSo/irySZ0IjxI6GvURGo119Vb8wwEeWv9gmOiD
	 S1dymH9Yiq8NrYnK9PE5xUiAzsor1JGaOKEGN52DwSXGZRrQhUA1wFfQcKs36jUgfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aAt/D2xAxDDJsgiaipx8quTUg87/88xSQ3Xpia9P9eU=;
	b=yz100gk5JpI9it948lc9+Mxip60xQk1B4K8sUcsFCFWfKahAtSlcxjnyNEl+d64PDQJx
	 hV9GRbUOq/sbudMWMfzLerlC2iEyQA4PmwlOCFHYNyJf2bFpilKf/I93iZkuyKVWxm6u9
	 OnA/fO/fUBuIHuTW/Fsy7eNDnP6J14NPir/mtchiHiW0kiIY9x4maeoyCF28JZj+rO1kM
	 dG6E043Oyjmj7DgaMoDtOvZgxDsJEZWSCl47QKPh6Lyy6OCi1Pr0AINGEMb6acbgRHvT9
	 XOpe6ki5Ob2YAlQph/LEssEgDJMuxgwdhpUXgEGlVmDfMYE2LwsqFDkoH5GTUk0azOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2DeksSV;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9650606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9650606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2DeksSV
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so2266101b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648402; x=1794253202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAt/D2xAxDDJsgiaipx8quTUg87/88xSQ3Xpia9P9eU=;
        b=A2DeksSV5ZzSIGXeAVSNotJO/IPlVI7y06CUSlZU+kiehpvqUFDCueAu1zDvHexYGF
         MhW65Q+qE8bcz0HcFSjrGnmmKCy7hHfWWEaw6uqvBB6NbnXVs6CPilElnQ2Djg429spl
         sgLa3PXW1yE2dvsul4o4Ray5dmxNi4D8Nr5O2F3KiHptY/yRbqd21f1HnCQ4E5QiBUHq
         1BCixxwBLnRsDerOYbJ/NkGpGByo37bTg7IwChUlR27+Pi5cBSBxtqAgWozLsi95IGMI
         Qoat7GvDNHKII9q/5bO0aMQsK8I7nCaHEMs56YuVurTAiAyBEA52ajRYn32lKK+Jdipk
         325w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648402; x=1794253202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAt/D2xAxDDJsgiaipx8quTUg87/88xSQ3Xpia9P9eU=;
        b=QKwxDhuY42joIW7h/80WhPPSCPEA+HRRFKWLgadQXCWN3H8bC0VWX0O73wNUywANnD
         fBuUGXT2kdepZdKaEXrt0JpZk4QRk64V8bCUNo8tCi3FX8yxFYddoaTuBOjjtLGphZFb
         /30ML6k2XQQmmdMYHDJWwOjpyhq/deOCCsaVLP+JQd2llwyb2Y8QRdmJHsx6hdlRI3+J
         vwOfRidqRLxDbfoO0Lf2lSlBLM4Gcju3osjRgPLftOOshlLISTuNIdEGUQUVeWXp1laA
         a5qAdix8BGyosIsLJgnPDqzAB4On/VgqOxTnALvOcYX132kFM4OgvEnFoCpB8Yc/qLGq
         L4VQ==
X-Gm-Message-State: AFq9FYJS1u2E8ih4esQTRalLUKev+gqwyJnA9kB32/6gjjUFFvIxa1NM
	A1XWHPhKmCyA6UKOqN0anZkcpTPIkyESAfqAVbCN7I7dBsd9Vhl5MeuYJTjlVGH+
X-Gm-Gg: AYBFou3XjZ3itJnaQbMUZ73aj0yOKjgtKlP0x5rTIcGKEkgSyu9Zcy90iXzs+qtJbnc
	+jhg72I8CdD6OzF7ebtNphIjh0p56yzQEufhRwooZRiQFb1lpAzEzBN2tfuBVnuDohVzLq/ImUd
	Ue35bIDZjQ9s3RdmAPL4ZLcmTPEmQI58y1+Dn/DSf08TFxOAGQ1TURI8T+fKUqeocnmMvuwm65A
	j0+fC54lQR+ZzLXtevbM/BUSrfGqpbi7dXUxnwGnKo5jSNFjBMoWLdtbZZ9frKrwrmIh/RwV/+0
	t2hk3KQY0DnS6zF6rQ3HzIz0FCwE9QhI1mnngCa4wMGcPXHXlw2KVUqZx3YhLPmvFl4+ardkif8
	IOQjGSSOdIuANvdga5l/r5cFWYSz3ofG97HCspKqj/fPHbITzPkzKL9Kdx2Qf1NurJtlj9d7KBU
	/0Z+o0d1b6gzCCKnGrlEElN+ZSbhf31We0305uX5gqf+gQnuoNBT4OtKNs21vBAShdSJITb7MUa
	Sw10ima927ZFj5bJUrzwZXyAp9QIJvF60r68QPHZrWiTWY7ZwL4+81RWqKhYUOW9tmRFHWgMxdp
	gVlC68/7VWmjLiqUTJ2/RXQ8vBDXH0CNt988Dv345uW1Swc8IKk+AYPmsmGyeRbUKaec5FS5iUf
	dc2rOAQGbVB7zMuf+zv1VP6AUii5pn82+ZlErU0GxGVc3sw==
X-Received: by 2002:a05:6a21:3945:b0:3e1:aa91:7134 with SMTP id adf61e73a8af0-3e928ace8d8mr9717391637.72.1793648402077;
        Mon, 02 Nov 2026 11:40:02 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:00 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 00/20] f2fs: support block size smaller than PAGE_SIZE
Date: Mon,  2 Nov 2026 11:39:32 -0800
Message-ID: <20261102193952.3002018-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

- Patches 1-2 convert the remaining page based index and size
  calculations to block based ones, and add the superblock and mount
  infrastructure. Subpage block sizes are still rejected at this
  point.
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
except for the fixes noted in the individual patches, some of which
also apply to large folios.

A few of the patches adjust code from the large folio series [1]:

- f2fs_folio_has_ffs() checks the folio state magic instead of
  requiring a large folio, since order-0 multi-block folios also carry
  a folio state, and the page private flags can legitimately be set
  before a state is attached.
- f2fs_ffs_find_or_alloc() cannot fail with __GFP_NOFAIL, so the NULL
  checks of its result in f2fs_get_lock_data_folio() and
  redirty_blocks() are removed.
- Defragmentation and swapfile activation mark only the target block
  dirty instead of the whole page.
- redirty_blocks() does not dirty the blocks past EOF.

Testing:

Built every patch for x86_64 and arm64 (16KB pages), and the whole
series for arm (32-bit).

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

plus generic/019, 521 and 522 for each combination, and a 24 hour
power-off recovery test with fsstress for each of the three
combinations.

There were no crashes or hangs, and the power-off recovery tests found
no corruption.

[1] https://lore.kernel.org/linux-f2fs-devel/20261028154407.1601430-1-nzzhao.sigma@gmail.com/

Daeho Jeong (20):
  f2fs: use block-based index and size calculations in remaining paths
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

 fs/f2fs/checkpoint.c    |   41 +-
 fs/f2fs/compress.c      |  518 +++++++++----
 fs/f2fs/data.c          | 1552 +++++++++++++++++++++++----------------
 fs/f2fs/dir.c           |  124 +++-
 fs/f2fs/f2fs.h          |  225 ++++--
 fs/f2fs/file.c          |  553 ++++++++------
 fs/f2fs/gc.c            |   89 ++-
 fs/f2fs/inline.c        |   13 +-
 fs/f2fs/inode.c         |    4 +-
 fs/f2fs/node.c          |   17 +-
 fs/f2fs/segment.c       |    7 +-
 fs/f2fs/super.c         |  162 ++--
 fs/f2fs/verity.c        |    5 -
 include/linux/f2fs_fs.h |    1 +
 14 files changed, 2078 insertions(+), 1233 deletions(-)


base-commit: 4c5e07aaeeb8a27d769a7e4e13d0b26aea0cb108
-- 
2.56.0.317.g454f8302e1-goog

