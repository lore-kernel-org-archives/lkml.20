Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEED38B125
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892592; cv=none; b=fXaAy/W/pnLM1RUADxlvvFAu6/zVEfc//ffbhG+7cqg7Yq74Dw3ChzNJVMr/fW5dJ4gOLJ+zilTcFthFDRH23piAIrtNHJ8dTc/bZzYrEqJdpu3EF4ofCGHjyrgqyVJqRAY9ks/BztcmtgmNJ4J5BG1cS/Fk039Vhki9N50pppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892592; c=relaxed/simple;
	bh=NmAqq8IRsnxcz2DEc9IWBoeMjfPET7jEexflGztkL0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOJfmlgZURTMnhRs70a0skHegr+jN4LJDeMbx6d41m4BAmsI1ST3ZRV3i6Fnd1NcZm/VriaTsjb4qwfm6nt7vEstYpVkikllFhO+aznVC9Oq+4BwTgAEzCFrDqJa6XR76Zm2NGZO2WPXdFxcbPVzG7n/QSbK3r1/xtH7G5Kb6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyJbQ6jg; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyJbQ6jg"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so875855a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892591; x=1792497391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNPPKRILZbXlMO2+NBKwscyZliRaGEtAtX51K+80FQw=;
        b=OyJbQ6jgR3ytLJviER+znnnZNMJcN9Zzob/qzbcEbBRznwcmX7kczU9fMrTsfQYglI
         XllwNewyZIinuTWAJzXS7SvKb6CepmcYv1GcaM/i7Vwkkes5PoAHbi8CkUpo+ESvhaxd
         UIyEhGN3/M1kzJagDbEbt1lOm89ec63Wlabz+VECAuvN6u2FwR+Sb4cutafg5PwiUEHW
         8c5tyb+l9dIo5LRdG2pU0Y+YxU4kCop3/uNcN4dzM7xbG0zhcNbzTPv5LrDE9LkhVGp2
         tt3+aFRhXWXrvnnU5QVoOpOIhqiLZydgBq1cEfFRBv6M8z8QP307v7F9igrdDrDqW3k7
         3xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892591; x=1792497391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNPPKRILZbXlMO2+NBKwscyZliRaGEtAtX51K+80FQw=;
        b=na/vWXH6lSQ1KSgQZV+79uzNFytMwpcZMpk8wwOl0RN5M+vdg0PXCy0EBQylH3evCr
         wo6JX2SXmqxxjgpqsnlUAv5VjuapewJKAdlZOregLDnd3cw6nyvyu0l9xPjmCjWMGMCQ
         7WqTnMlN7OW3qBoulGzoHw443kIS0ixrqt9HN9kt1OIClPncy8LTKhSpfHphA/t3tO27
         Nd2nabr0uBtcercEVYZM1Rl4SuxtUrUoEpy5lE4HpkwbjVdMjcJ6EKBYlIzPuWMl2rmI
         ogwopPq/lIGiY8HMw9P/dp11Nm1Neh7YPU4agQFL/a7iMWDW9YgtTOYo2uglNa4caZYV
         QeQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY9O6m1JddztbzPagX3eTBwt1nRhU1a6LgvfP/eloHXGH/zjh1h06+AQHHGPBcYTL82iEtQocdvweNejQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfUxd9LKECjQ1V8K+QivF9gv0bhSIrjrphNWQgiXZIeFgEsVn2
	XqJuqaZIyZNSy/2UUv//TXRGggqcTuJWqRy8/3bMzafFLsr2Mjo+aCde
X-Gm-Gg: AYBFou3TF835SMJz9EZFbOtTl7jbTXbyF21yOub9Kp2driH00ci8RE1TGv980AEoTZr
	X7JpXRrxDXe/WY04h/HYArnFS5QX0bXGZPrtI/eJLuUQyp+E3JoQ36C/9OG2MfFv1Ewv4peIikv
	VR+vTylUUoUnTTj42556jxlHSJZVrx6Kd7GZDN8YE2F/b570vGkePiCvoVS17qQAXHJ3jkiYt4n
	jf9ki6h6fWk/Cvnlk6EresZ+M9pvQnRihBDQjsZwzBQ1nhF7IIRrUkhgZiY0d1yHiVMIEuE7Bvg
	Jle2i5oKExD5NjGiuadwPzzhIm6U57sUHuj1L/ISVcGM+WgJpj28/OgMIRtOQ27NLEj/7Rlkz2o
	UwdZgh1M4qXg5KPrQMTKxPNkZl5/zZFrxfMNd6NjiaMtILyjUZaOMvV6APYRczshaVpoB62MdLh
	Fmjw2n26Y2Xnft1gWw4wLaaiHguaw76oHkQs8EGt0lt4QZKG4Glth88OMloor+/DE3EIf38sCVg
	mGDsEQMi0AGZ7BOZrneKdBZ91wMOJEsHeWqmR2kOMcQLGc=
X-Received: by 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr9977247a91.45.1791892590569;
        Tue, 13 Oct 2026 04:56:30 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:56:30 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
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
Subject: [PATCH v4 00/18] f2fs: support & optimize large folios for writable files
Date: Tue, 13 Oct 2026 19:56:03 +0800
Message-ID: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

This series supports large folios for most readable/writable files
in buffered I/O paths, including normal files, block-layer encrypted
files, and atomic files except for inline-data files, compressed files,
and quota files.

It also extends f2fs_folio_state to coexist with f2fs page-private
flags and to handle large folio write path and partial truncate of
large folios correctly.

Benchmark details can be found in the RFC v2 cover letter [1].

Changes in v4:
- Rebased onto linux-next next-20261012 (4eb2586bd40d); its f2fs part
  is the f2fs dev branch.
- Added "f2fs: read i_size once in f2fs_vm_page_mkwrite" as a
  prerequisite (also sent separately).
- "f2fs: remove mappedtodisk flag usage in mmap write path" is kept as
  a prerequisite.
- Link to v3: [2]

Patches 1 and 2 are prerequisites for the large folio work. They are
also posted independently as bug fixes, and are kept in this series to
make it self-contained for the sashiko review.

Many thanks to Chao and Daeho for your extensive reviews and valuable
suggestions!

[1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
[2] https://lore.kernel.org/linux-f2fs-devel/20261009161224.4163796-1-zhaonanzhe@xiaomi.com/

Nanzhe Zhao (18):
  f2fs: read i_size once in f2fs_vm_page_mkwrite
  f2fs: remove mappedtodisk flag usage in mmap write path
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
 fs/f2fs/data.c                     | 1425 +++++++++++++++++++++++++---
 fs/f2fs/dir.c                      |    2 +-
 fs/f2fs/f2fs.h                     |  173 +++-
 fs/f2fs/file.c                     |  252 +++--
 fs/f2fs/gc.c                       |   38 +-
 fs/f2fs/inline.c                   |    9 +-
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +-
 fs/f2fs/segment.c                  |    3 +-
 13 files changed, 1706 insertions(+), 260 deletions(-)

-- 
2.43.0

