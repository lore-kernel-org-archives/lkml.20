Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92ED37C92D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562422; cv=none; b=QANmAMhPwm7y5AYN3x7xzwpzSBQgY110J2h0Q9ZZW1eoMwQEfaZD5IvLd8p1t9FKCIXN4YtMz80Ck+adBAE30MgzPXjnzxxEMszbTQViDkOU4Gvq5a93wInPgS3pIp0nE766O70Jjk32fE50G+NYNS/wv83Tugj1IJSUCutJ0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562422; c=relaxed/simple;
	bh=tGcd431wzZ2M0TrsJhabjysTWVanXC/NKgfAjPAgEYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lvwF02u9orJxmDhEDXlLFOCNmK2ytqVVs0oFE2mMFNtk6aeIjwKmNjClYgEx5jVq1cGbVITgoPB7aap9Ga1WxxNRv7behiN10/El0CJ/la+v9fHraR9ZtJ04XhDe7+hrlQdp7pzS2TMNGbhiyHERYAjwHmF/QHlx5loYxdCi01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Oeydw+lD; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Oeydw+lD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ob
	tqnRZ2XT3fd0RMFoXHVLYidnghgsTYsU6R43rdvKw=; b=Oeydw+lDJ7WU6Fv0xI
	wmMo5NRjyOdPzI9Y7XlzcmDqlGcByoUiXf4L0J2w03rA64oeFdDVC1xjHjTaqL1e
	KEpzMCg4huju+RZ0Jod1AZ9UZuawRSDYRyI9UUDSytyeAfvCqRcEq98CJ1hyOjzW
	PlLZCLizbACIGoKeAKMxI5bCY=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V46AEslqHAsZBA--.38226S2;
	Sat, 10 Oct 2026 00:12:49 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: [PATCH v3 00/17] f2fs: support & optimize large folios for writable files
Date: Sat, 10 Oct 2026 00:12:07 +0800
Message-ID: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3V46AEslqHAsZBA--.38226S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4DZFWDXryrCw4Dur1kuFg_yoW5Xr1xpF
	WYkrZ5GryfGr47ZrsrA3WFqrnYq3yrG347ua4xXryIqFn8WF1ruF1kK3Z5XFyxJryxJw4f
	ta1UAry8WF1rJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UCsjbUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsAGxgWrJEoE9CQAA3F

This series supports large folios for most readable/writable files
in buffered I/O paths, including normal files, block-layer encrypted
files, and atomic files except for inline-data files, compressed files,
and quota files.

It also extends f2fs_folio_state to coexist with f2fs page-private
flags and to handle large folio write path and partial truncate of
large folios correctly.

Benchmark details can be found in the RFC v2 cover letter [1].

Changes in v3:
- Addressed the remaining review comments from Chao and Daeho; the
  fixes are folded into the corresponding patches.
- Added "f2fs: account large folio dirty data at block granularity" to
  fix the f2fs/006 and generic/363 regressions.
- Added "f2fs: wait for folio writeback before ffs_detach_free", fixing
  a use-after-free in the full-range invalidation path reported by the
  kernel test robot [2].
- "f2fs: remove mappedtodisk flag usage in mmap write path" is now
  included in the series as a prerequisite.
- Link to v2: [3]

Many thanks to Chao and Daeho for your extensive reviews and valuable
suggestions!

[1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
[2] https://lore.kernel.org/linux-f2fs-devel/202610081027.b13dcf10-lkp@intel.com/
[3] https://lore.kernel.org/r/20260915041909.2903887-1-zhaonanzhe@xiaomi.com

Nanzhe Zhao (17):
  f2fs: extend folio state for large folio write path
  f2fs: carry subpage offset and count in write IO
  f2fs: support regular file buffered writes on large folios
  f2fs: support atomic file large folios buffered write
  f2fs: support large folio writeback
  f2fs: account large folio dirty data at block granularity
  f2fs: remove mappedtodisk flag usage in mmap write path
  f2fs: prepare mmap write faults for large folios
  f2fs: make GC migration large-folio aware
  f2fs: optimize small block size large folio read
  f2fs: support partial uptodate large folio read
  f2fs: handle partial truncate of large folio dirty subpages
  f2fs: wait for folio writeback before ffs_detach_free
  f2fs: fix zeroing paths for large folios
  f2fs: handle block cloning within the same large folio
  f2fs: allow large folio support to writeable files
  f2fs: make compressed files compatible with large folio

 Documentation/filesystems/f2fs.rst |   10 +
 fs/f2fs/checkpoint.c               |   40 +-
 fs/f2fs/compress.c                 |    3 +
 fs/f2fs/data.c                     | 1333 +++++++++++++++++++++++++---
 fs/f2fs/f2fs.h                     |  170 +++-
 fs/f2fs/file.c                     |  230 +++--
 fs/f2fs/gc.c                       |   38 +-
 fs/f2fs/inline.c                   |    7 +
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/segment.c                  |    5 +-
 11 files changed, 1588 insertions(+), 253 deletions(-)

-- 
2.43.0

