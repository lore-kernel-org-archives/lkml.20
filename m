Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985873;
	b=y+MHxnXPIElOdJidSATWesdtfYMcN9gbkQCmkkK2NVPqxvdGdvKliDGTC7mjSRgAPA6V
	 4dKOYozFNyB4rXTi55+9Y0jZRovIGQH1xR7gm1R4eH1zfS0mSkLR0wmzm+M2ldlfmXe0f
	 t2T34gWlVIS6w6Ra7iIag8a6LxvrRrhQXmOxvPMKWt/gU41JhLRZUoD7hdDzN/CGbT4wZ
	 D1eeexjOXgyCV4UIKxwh2oso8+ZNvmeebc+vonIA66mTsXd6/m4M9JJNq0eRocRh4YY1O
	 JjlSU+5oudRE+LOE66gDsbAPYTzoLSGdS7ZdLyK4HqL/ximu324jZNlgJAjLSaXcAtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g6sJ2KHYM+5cJSsULiN40H3/x+SoySCXlIwoNkQYZhU=;
	b=3rJ1XKF7liUC3m3lyvLrwem8OyDBLnGJeraoxCnSJlGyqHC9nC7sSTjqKQYu136ZkKu+
	 Ryaa+sIQw0a09noWK4HxvZQ+zyORDSC2HMtUaJJbin/d+jlQggTi8+b1ypX3KVowvTWGD
	 ZbXFF3A1RFSQCvMtKrWlvvYmMt78U8VVVLQ0PYz7mki9xUkAp5VAku9WMuzt08qpaf+w+
	 J1EsIFvljS6FkbdPQc+0THvpenI4zh0URqX+2s9VDeULUe8cahUuD2xk/BF+WAXwtLOZO
	 Ruqa/KQ2J3J7+Su4iuxY+m0dWILmuLjMmMn0ZPzWN1JUe/en9j+ycENynWIoV2iqHCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uh+Xf4q3;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9600606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9600606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uh+Xf4q3
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2e613f813b0so3878235ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985872; x=1793590672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6sJ2KHYM+5cJSsULiN40H3/x+SoySCXlIwoNkQYZhU=;
        b=Uh+Xf4q3sIaxcnpVZMWh+HxompkJCvfGKly/bXy7nv1ufAv2sMfcCCxXfRgbT49w98
         5xYIFM23Y/AOHYB15xY4wWJQN7gfKOuUxInGewYaxJaoLBzVHtOpxuJaaND+dRx/khfg
         PgXH3KrYZaXqEd4DGC4XdJEnGq9l0Z/f/MwR+H025Ux/Cl59I4dt+VoW61xgyp8ZLuaz
         qxLCrjNM4fpQRb/2JHczSw4lPJe18nELHY/33zgQgK+IufLK+olnSqR8UKdCQbpV/cCv
         +vzb+9oPhwKQ4JqdDjDTkD054sHRWWf7Bqt5eAF1hjSYR1Q5V0qZC9at54fLReiZ5IoV
         YsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985872; x=1793590672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6sJ2KHYM+5cJSsULiN40H3/x+SoySCXlIwoNkQYZhU=;
        b=0A6gdu/hpwjlNWMcLQo/OKxuRgi01malYeHB4xXGBgO19JBL8a0rfzjC2IYF9BTT7b
         tnALzaUrAFqcgIEQTkngdbSOXLMDIAO3RgzoTJYFKZiY14d5hkfTO8N32Mzs2CozSLPj
         JdPUJu2PFPZiYK+cc/Wz1op/N9q93PkAbdbgGJ5O7BwOJ4PdY+fe64ryCqfVbWfgmFBi
         ml2m+5enPsKE3+fplo/7Qk+ceNu8mgxWTBblCVZ/n+r3tZBrJ4OQbrAbaPXEOu8KUJPM
         u36L1lnlcDcE6tcDoVN1MiMw2oFU6mgLOIMohc98KOKHQy1SRxUT1ylgwUB4LjcPzqWT
         vSXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZTGA7ByGqhxpIQ2No7jdn8SRfglYbVY7JyYzGCjxwkZQJuPJbZa1bAIYO/GZoDGlvLmDte8VCw+fBAY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJNc3yO74G8M/WNHVrmnCEwbhPj79BOeAxXLmGDUzsJ2KZSUPh
	lh0CKcEyIPJOQdXhcAKoMjH8LlC+9CH8yskhJK/lGNvCYEc0rVBAeelq
X-Gm-Gg: AYBFou0rbAXy54E76YmY7Ws82VPXOtuHRfWwaHrAWAY9ykB+jzsPm7j9epIQ3ZsWD35
	0iHk6LdPHKNt5bsJG13CIiTMn7WjpxNnci3O6ObNC3MOKswqNPPkhvlPFnyggxpE1RLk1U7NLiq
	20CprXCTnkEbw0WbLCIGGvAUstAadRKmoyioF/IL2ZMrsdyBrDHRnUkeXzO89QSPaLFLbozVGOa
	e3pf7beFd7lx7xXelXxztpPsWUXrqdtyYDP6AYNawV69IFh1r4u6ybuZVSy68huB2WfAgruCIx3
	aU4QFLL3TFaqOSc2IW6IChlFaFH3jtNJEJESOZn8lJXghRSlS4S+x26U12Q4nN5TWB5Oj1i12yY
	CpTcMn8fuy+3Kxl4NpTWOQHsbYTthYoEvE3XjZw0UrOagU/2yaolY6NzC7PdD6fJNwmHKVnbGih
	0sISc4MFwQT0qnagdUsa3e5ll+z3W8SchylQKtUh7rg/X4w2Om3NBsopQ9+t50ijpmpGyxyjx+P
	ZFkrGAse0yvxsvCK82j3gPtXz+jHTJtIFjdMNSX8N1/TpmeRWsQ9tXvDOcrok62pyXxo7XO/QiE
	b66SL0TUZo8hAjCq6ilpjFzP7tZFfRDE9Br82x+5jFfY64zETXbEW+6bwvPRGzESDAI=
X-Received: by 2002:a17:90b:35c5:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3adeb64d3b1mr2989070a91.37.1792985872081;
        Sun, 25 Oct 2026 20:37:52 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:37:51 -0700 (PDT)
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
Subject: [PATCH v7 00/15] f2fs: support & optimize large folios for writable files
Date: Mon, 26 Oct 2026 11:37:30 +0800
Message-ID: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c                     | 1521 +++++++++++++++++++++++++---
 fs/f2fs/dir.c                      |    2 +-
 fs/f2fs/f2fs.h                     |  170 +++-
 fs/f2fs/file.c                     |  226 +++--
 fs/f2fs/gc.c                       |   32 +-
 fs/f2fs/inline.c                   |    9 +-
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +-
 fs/f2fs/segment.c                  |   13 +-
 13 files changed, 1774 insertions(+), 263 deletions(-)

-- 
2.43.0

