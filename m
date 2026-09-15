Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF32EA754
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445998; cv=none; b=poYrpceniZp3c1V5F34H7AVVvKaHi2ow+IoPEYqxrZ7yPJjjpRQC9lm3XaEyiBgE1tagTQKnvxt2y2+MWwEYMK55yHhzNW84Rs7tOIFMvlUMec933ARAzysJjbPXoyTPELD1OxHhlSOzBlyzqj6FAOb9fLJvR5z/FjuI2FlCUNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445998; c=relaxed/simple;
	bh=Z51unG1foffy+2OGWETkgo2PyqIAFItR0wWDwgdn2PU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsKTWhXdvR2xloY3JspwoZBaIu35x2pXI1myIw6WDL6fP7qSDdbBMMbDsC38WF2wDOcSmdh+Hq7n41fuS56TZU2J2GF4h1Hs1OOjs1iCnIQD353QOp9VbR6MOmN5qaGEqN0gW8sAarnxIhgupts4gKH28iWHVTskqR3xgnjQiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=AesrpVbK; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="AesrpVbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YX
	+HIknL8n6VZjreq5xGVkE9hGJLekLhtxm24ds5FmA=; b=AesrpVbKW0Q7/KU31Z
	uQEkuU+S+OPxt19HBB4hruCxNjjChl4a1fPe+tVJ/RVGw0wLWc+veJSvwWyqeiIG
	j07T/SLxNDYQ4X+kjCen6n4UszSLhDJYOwXn+75lI0lbzt6/XeVONGzkfZbNgjq8
	vyjnDxfXSgTPqEVkTC+uRwUgs=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDXreo9x6hq3jBvHw--.36918S2;
	Tue, 15 Sep 2026 12:19:10 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v2 00/14] f2fs: support & optimize large folios for writable files
Date: Tue, 15 Sep 2026 12:18:55 +0800
Message-ID: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDXreo9x6hq3jBvHw--.36918S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyxur15WrW5JF13WrWDCFg_yoW8ZF43pF
	Z0krZ5GryfCr47ZrZxAF4Fqrn5t395W34UZ3WxXry2qF98WF1ruF1kt3W8WF4xJryfJw4r
	Aa1UAry8WF4rAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UCoGdUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB-FlWqoxz8XsgAA3g

This series supports large folios for most readable/writable files
in buffered I/O paths, including normal files, block-layer encrypted
files, and atomic files except for inline-data files, compressed files,
and quota files.

It also extends f2fs_folio_state to coexist with f2fs page-private
flags and to handle large folio write path and partial truncate of
large folios correctly.

Benchmark details can be found in the RFC v2 cover letter [1].

[1] https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com

Changes in v2:
- Addressed most of Chao's and Daeho's review comments.
- Updated docs for compress policy with large folios.
- Link to v1: https://lore.kernel.org/r/20260826082641.2007658-1-zhaonanzhe@xiaomi.com

Many thanks to Chao and Daeho for your extensive reviews and valuable
suggestions!

Nanzhe Zhao (14):
  f2fs: extend folio state for large folio write path
  f2fs: carry subpage offset and count in write IO
  f2fs: support regular file buffered writes on large folios
  f2fs: support atomic file large folios buffered write
  f2fs: support large folio writeback
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
 fs/f2fs/checkpoint.c               |    2 +
 fs/f2fs/compress.c                 |    3 +
 fs/f2fs/data.c                     | 1221 +++++++++++++++++++++++++---
 fs/f2fs/f2fs.h                     |  105 ++-
 fs/f2fs/file.c                     |  229 ++++--
 fs/f2fs/gc.c                       |   32 +-
 fs/f2fs/inline.c                   |    7 +
 fs/f2fs/inode.c                    |    4 +-
 fs/f2fs/namei.c                    |    1 +
 fs/f2fs/node.c                     |    2 +
 fs/f2fs/segment.c                  |    6 +-
 12 files changed, 1404 insertions(+), 218 deletions(-)

-- 
2.43.0

