Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655630;
	b=yQ5uWK+ybYlHF4ikhTgwIHxMuO4tGm+vxgsz5Tx7vZjF/AdhcIbSXh6ZXZCYCttNu1mk
	 Rrm5o00aYFWbwKtP+Rq9nVeUuuDgSTvJWh9KCHXoU8UcyL6YGjGsMwDnTYxCkYu8LlYIl
	 5holYaEVZYhGw4i8njF9aPpVY8g5wLeAviVKWiQRVYL4+air6+SBgeV50UMNbzrpPSeHY
	 7lH0Dcg1FR5dqdxNZU9QRWfViTJmIvmppDB2NwoXUhJ/c5VCeN2J2HZHLxqBGCIoYSVF4
	 ENPZx1ypf+8P+dVMqpOW/Gjno5p+iukw+cKXiC/5FMfy1LuqZXWKy//mqnNwjR0UX7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lWX9UKTQZ4HQ2uDjvWK1vbkxuc7/mbUUmjQBZsDUXZw=;
	b=gm2Ses/09D83NVfT4DRtl/fEMeBjc93HuJRtSGKDQrGinb/qPL4el8C4Z4c9gm+ze1nn
	 QDsX1rqhDpgcJpMZtCZEDfO3X7YUokZ1++DUj0R3drzSpqYs1Sbi2I7LBH7+xx2bTaoCj
	 1iw4mXQa6SpNWId9F05I56709MBd+4VR4ER21o/GnYvnCnr1UeamjbVRXFIhaKEY85+AY
	 w4BW69ZjTd65afDEPh/3RwD3eQ3BeipT5LOLq3/C1RfobRiv/qv8rKdtGPUvwcWThixn8
	 RaP5Q2SljFwFcDQbB51jNhws97B0qH6uIGu4QzaVekM9Dp0YpJuSDEYD5tixzrgy1+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsCB1BW4;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04687606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04687606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsCB1BW4
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1125442a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655629; x=1793260429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWX9UKTQZ4HQ2uDjvWK1vbkxuc7/mbUUmjQBZsDUXZw=;
        b=EsCB1BW4IVbvHtbgOS0X6y6rBIlMVpn5vSy1sXje63PuhlxupxckqW7u5yzzWekqKP
         k7/206L7R4VBgXKWK7mlSBlh8Qf6xLd3sQswyqzjeGIZ1//wowWCffJPlGexpelh1lkJ
         7TM3emvSRP4K0RA7Zfg6PeMJMqmPueCwN8nn/lkiJB92DRKZwgT+JX/o9QokqLl3LqRq
         3q/3GhIhjXyI9VlQ2QCqHyneoFNcDIo9uY/7ILKiiLm9vuVzuorjKIM5da9//4MP0v3p
         z5sFHijZlOFrYrYnNcAYFbCExf5zu9sKvxU0ZrOxzmUoGFT2k1Mnw6AoxvqMqN0xh2eC
         fC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655629; x=1793260429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWX9UKTQZ4HQ2uDjvWK1vbkxuc7/mbUUmjQBZsDUXZw=;
        b=GrGC21yh9CipR5YHkNvzhpzQu/KlaP97xuvpHahBIjeysEQ1Tp61vDmfkyDmMLSd69
         REAmqIaH9gCmKbnRfG0dQyX7BvbTJvU87Ry4JxIQ+KvFvab9r/1MjYE+Eq8HnUFBqFhc
         h0jedLz16CPoVGNxzu0AnLWvFI7/088wmU0HVg+KJLXMV0BS+Rqq0IlhW1O4xfA8/dhl
         Nr1itv2LoInMWJtXhXvnmFVnnIr8o2K2xX7DNpwdBm2sRIrbD7S4ZvqzOIKVnJWH25wR
         7HNDZ2kH49M38DR4+5sRCVv+IJwdppsxeryJe/pNZZsOGo6EI4UKciXN1/5lTQVeDPq0
         qpMw==
X-Forwarded-Encrypted: i=1; AKwUvBzGqUtCyj5PwL2hTqa8ST19+fTsKghnW26GV/vsILcfEZ1hMPrP54qrjP13fuegM8+clS5SFTppftS8ABY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaFU55B/tvD0RkpbvPF9v7zIhxCm7Uoe+LL1tekwvNZUzOgrDC
	mVYueeLtSrX2+Yqxobp+kdEB/zQrIAzROn7sp67h/o9dUPQ5sw2LMqMm
X-Gm-Gg: AYBFou36ZI81ZOuhBEhIKozp04qJL3Zo5zydrpG8RU9k7HxhWUcOjx9F2fs1+Gb5pnK
	lPDQlXhlFWYXNZ66Zso15jTw004P3aeg6U/WZtuGgZUZxaef2cmJMb5EjgnCYLWl0Ixesc0Sha6
	b9ZCP0H60IAN/ub+AaCQ3/Hy3j195XF0RnlD4yExZWePQhjDuoeGHYDEvPRCfywD+SBkqvd27Th
	+XtaayOYL5p0RTPtJOdDj84Hp2krmgz4TPUZMwAOJACwG5MiY0J99iL1llMUSfnfdiwaFlxTJTc
	F6fGfRHxztksUlW9c9e1aYWuydtMpt+eWl6KugM5/BkpCLYPAHdmlr3KZo3XFjrB7Xd3pfXsCkW
	8++M5Xm3ghuXgzYTaykca4rQRZmIPSotKS35iDlzGI5Grr5h0hU3u/cRcEimrHFmgZYdSyOHDOa
	/GyVQBq3C59qn7knNnf/zwnx0l8c/qL65wiLj7ZrN4uaAB8xCuD0RaNkDJEBlPEmeJpugCP/Lap
	5tFo14RI6t8gPjD/J5Bs2R6wbUGjk6UTFmrjidvjiJ8oB0JCAzdMByqJ//SV5SsQpMdkHvK0Cxn
	w+zq3ChCqUfhsV6qDrI=
X-Received: by 2002:a17:90b:1c0f:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3ad86ee2c5emr3778475a91.15.1792655629217;
        Thu, 22 Oct 2026 00:53:49 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:53:48 -0700 (PDT)
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
Subject: [PATCH v6 00/15] f2fs: support & optimize large folios for writable files
Date: Thu, 22 Oct 2026 15:53:27 +0800
Message-ID: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c                     | 1486 +++++++++++++++++++++++++---
 fs/f2fs/dir.c                      |    2 +-
 fs/f2fs/f2fs.h                     |  170 +++-
 fs/f2fs/file.c                     |  226 +++--
 fs/f2fs/gc.c                       |   32 +-
 fs/f2fs/inline.c                   |    9 +-
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +-
 fs/f2fs/segment.c                  |   13 +-
 13 files changed, 1742 insertions(+), 260 deletions(-)

-- 
2.43.0

