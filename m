Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36576456E1F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960321; cv=none; b=dwxbH+xrksOqcBq/Iv+7ItvI3KZTSgvO1hBbSVJizc05/EO1R4WZtm2uxlKgLqp8WkUKDFNoE9whbr3Tq7lZQewKxNtfRP4o6tR5Pmfqwl/q/KNYGyZdYEQmAJuZbF8xV+gq/9W1dpoEOkFZU9ojkNMx29zQie7oaxnMhKn9RuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960321; c=relaxed/simple;
	bh=OYX6g4scnEqGrQGjeUTw8Q6HEuDgXzlnxR53Hxu31+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ki7FY/atHb441HOpFwlC//KTAdEgzdp/CTkbz7QK3jlsGvo5/lSJWwyKbAy2Sg4g0zInttxQWr/68TuJCy7smtvD5ICN3uNNGqsZEdPsgK2v+CuRdZUjwNMtVd83Wyg9hM/OgQ4OaGjmaUHCWxaHeA6Eegg9K9vG8orC1lANRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgd73lcs; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgd73lcs"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so18666145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960312; x=1792565112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bc+Wvmw7gLliVJ4YZNhFuoyuWzBRp7BrASeo+vbZ3zg=;
        b=hgd73lcsfXShQjUdogXZA6X/rccBJaHWWeuS7ed7jd9kS0y9eNPABj3e9mMSC6bmKW
         Nsxk5LJoW2Zy6QCPZehkyBxW1SJ/a/M+RM+xJJeCB88Dmt195L2K1GFeWJm+EN3Lv5GH
         kkAXpq2aNwTLIyWlsG4e3P4MD3eWz2P2ofDeSPfnOIeY6kW5ziDBCTtbW44sAXjJUmke
         g/0yVifXLQ03kMUoow06a0LuuXvHcy9xP0kpiYrT50XzvjE9Ba2dedCJB2eA2wVQIIjW
         RKebZs4IzyIEy2ZW/lC++z2n3fyO8L10enqCxaOUV351rVQVsJHZPVIHMKTp0k/e+WON
         L6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960312; x=1792565112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bc+Wvmw7gLliVJ4YZNhFuoyuWzBRp7BrASeo+vbZ3zg=;
        b=t6HwTtkTg0mvjqY584MwKeFYl4fze7oTLbW43pRoQZBCKKpjPBtv+rkHYnJF8qWQDf
         92h7nYmjoJjymH2qui3+joohBOkFNdSy3MYjmOM7hHBTI+9zxsAKvww9pEjfk/VpvlcB
         0/RBell6rA6+bz1xaeGGL/x1tg6w0at+2fx5TXhZmnxJ7P81VBD6iaEQLxoDSXE5FDMh
         kADltV6EmdbyQMiKcPe5o68Y7SSvFWf5uWxxfPyVwgmJ5MXLY9OKONyikwbVOrijYytT
         ZDDsmOZlMiYyD8EIznbaCjl4cPVSqD8uUSlBOX0jgByqfJDgqzTDwEsziymwdXqjLf4M
         SiBw==
X-Forwarded-Encrypted: i=1; AKwUvBx3v9WSNcKc0ugKY/x7RfUHzNX0Iv3DSk1rluM0dIof7fm1T/OtXa4VHdsbKGv58NnmrJ/eU1uIrk8en+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKynCocenzXiL3aDUsZgjlcGU8exmvqSUzSDmlRoxJi4Cpippp9
	rjW2fTm7eXnm0BCnvGczOIfl/C5PagcI0rY8piM2Y8bPYmyOgWPhc8Hu
X-Gm-Gg: AYBFou2/7tIvEX5XmJOq1509mNTnsNsRlO6GM6c3De8gnrK4LIkv66dDw5qtlVAXott
	UMJj/P1CBxpCmveH9TkZMRoQ603XVHKomaQgp9UuBBGMpgapV1x0yB5Cqt7cqIInjmyoYwNVhVt
	T2z84zMeHfEM9D8Cwt9CyUwmKJwf6kXKGgnn2bjjeRLPvr48L6lh2pckzTBnTpMbNqqGGJTuDoi
	wezJLRAJ2lY7AfAB7Y6+gSgftYQq3rHed483PCc1qwAhxvHM5N9J1ee7hA4uPR0Z62Til+mf98h
	dOWsuClXT322s9abDkKi4WGsFXJ1Scz/TRYgddqigJ8fLzxuRS9wV/zALIWkK3KL2DXgoFzLBF2
	qE9EKcEwDpNJXrY6T6Y6Sscbn1S1mW5PfShkRcbucQ7NduCFGnXflzZNEH2cUE+Li6JGhpj48js
	bMQqLLbx7fr/73GhdQcyFy8VcjXB3QlMh8qTu5gfvvD9YcN8GTplk4frOhuzYdDgxf+Dw4SlBMt
	YKR7uwlLb3vQwmbNa5ddpyBPfb8h9IeaMYD
X-Received: by 2002:a17:90b:5343:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ab3a94f0dcmr12128126a91.14.1791960312024;
        Tue, 13 Oct 2026 23:45:12 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:45:11 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v5 00/16] f2fs: support & optimize large folios for writable files
Date: Wed, 14 Oct 2026 14:44:29 +0800
Message-ID: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series supports large folios for most readable/writable files
in buffered I/O paths, including normal files, block-layer encrypted
files, and atomic files except for inline-data files, compressed files,
and quota files.

It also extends f2fs_folio_state to coexist with f2fs page-private
flags and to handle large folio write path and partial truncate of
large folios correctly.  A valid large folio always carries a
f2fs_folio_state at its folio->private in the current implementation.

Benchmark details can be found in the RFC v2 cover letter [1].

Changes in v5:
- Rebased onto the f2fs dev-test branch (d1685c24b6c3).
- Dropped the two prerequisite bug fixes, which are now merged:
    c04f209773ec ("f2fs: read i_size once in f2fs_vm_page_mkwrite")
    b3c984358925 ("f2fs: remove mappedtodisk flag usage in mmap write path")
- Link to v4: [2]

Many thanks to Chao and Daeho for your extensive reviews and valuable
suggestions!

[1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
[2] https://lore.kernel.org/linux-f2fs-devel/20261013115621.968742-1-nzzhao.sigma@gmail.com/

Nanzhe Zhao (16):
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
  f2fs: wait for folio writeback before ffs_detach_free
  f2fs: fix zeroing paths for large folios
  f2fs: handle block cloning within the same large folio
  f2fs: allow large folio support to writeable files
  f2fs: make compressed files compatible with large folio

 Documentation/filesystems/f2fs.rst |   10 +
 fs/f2fs/checkpoint.c               |   40 +-
 fs/f2fs/compress.c                 |    7 +-
 fs/f2fs/data.c                     | 1467 +++++++++++++++++++++++++---
 fs/f2fs/dir.c                      |    2 +-
 fs/f2fs/f2fs.h                     |  170 +++-
 fs/f2fs/file.c                     |  226 +++--
 fs/f2fs/gc.c                       |   38 +-
 fs/f2fs/inline.c                   |    9 +-
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +-
 fs/f2fs/segment.c                  |    5 +-
 13 files changed, 1716 insertions(+), 265 deletions(-)

-- 
2.43.0

