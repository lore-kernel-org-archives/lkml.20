Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224B311C2D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888233; cv=none; b=LfSRu/Hov3MUrs6EwkMPZzS+QTN6U4gVOfyyElmckllChpw9DTCloeGFShK0QiE516FvaD9fsPJ3C2GMplialJSnVKN/tWgrtSwuNCbnW8DrvjBZAlPldnAtEoSy3sYMJ16mMvDuorNXV1Shi1oh2uGqThrKE9U8MVX1zrl66bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888233; c=relaxed/simple;
	bh=f7WV+5JRBH7+b0h8Wle29pWQgflTwoQSptZTR/oRVxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WGRneyOmCYqz7zVcOeJb+H8eBushXvDS0BqMCMAW+VCd4AIJAf69KvKNJTUmqsRCLp420RRq5r0pgYyfg7vfiQMbo5dqoBYW/OX2CGNRY/u9IZRU1M6SPUHgHTZELT+lpsB7hgbskDB7VCZ6vACpPGKofqX7dX9ru2bX3UfYK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuP09Cxz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuP09Cxz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so367225a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888231; x=1788493031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kClGC4Q1h2cpbmXDDO/Cni49gBRV6utUcLJ4NZAQIpg=;
        b=LuP09CxzqBR29isgye+UoveYCFTy74KRZ1sqIa/08LoLaEZuPjWySDU3+kCgabR6rs
         IZkppA+P7n04T0+ZyWFnyV7dGuqqxFnOU4/SDS63IZdkGWZ9vqFffDi7STtBciD4lpVe
         gt/CHzNZxC8d3ErFZDFt0BQBebjRzW+NJycPAX//FYAfC7dRABmP+4gLMAqGE9BYM48v
         dmJLl96jyqF5TJVCAL/6XlmHECChzxkN7mN1hNSqzWndZmlzGBHdQo2Lj/gzsb8a+zxN
         lrEoPoDhc0pOncRC0GGH8Z22Y6SJangjt5yN8fccVqhK4SfXYwYsbfQ1TPnsjX5a6z44
         mU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888231; x=1788493031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kClGC4Q1h2cpbmXDDO/Cni49gBRV6utUcLJ4NZAQIpg=;
        b=EPIB2HacCL0hb2b1CIBEzT+Ne7ofAXbSit9JgJrLOhdp3SUY66jdUzbhcjAQv0/pTQ
         z0r4S2NFwr5cqFeJQmU6EB1co8puT62Xq12UM2hjHKEjUQaq5x0/lN9nBkz1XZ2QEQBc
         IGsRGA3zUOgmH1NLf1bJAB/2pIWWvYzSsGja06VL3Q5TYI9U/hO/pVMAUP1q5zNSzgyy
         uQxVfAfLBDnQ85UW1O8/HyfcTeMgub9Gi3K/YbNHv10Zd0GdC8/9dPScYog4o8NuoImf
         0WmKMKQo5HjVUXs+0Ci79HbV6+2xjkNwdpuZHmAcm37R4c08GDdPnuLGUlJPz5OTZZqO
         MYKw==
X-Gm-Message-State: AFuF++nNTAfYaTgIC5MqR8I7MAezroIZf8HZnqKbH5QbTyIf4nVxmexP
	/8MMvyDVFgkoNshp85vFoQpy1utNyeLgSLJVIr7OJLLaRKY7iKPKIclJ
X-Gm-Gg: AR+sD11/ZUGnNEOXBKhdHWMurho0ck1swOG2SSd+IUjHVyf37mIpy8REkmXom3rBuPh
	PAg7LT6K6DXmwZ42Ui3Cl02zPk2cOATyEfmB3ueDi8R8vyAAEFlLQqA1QBOA/A/vkGW0ZHa6t6t
	f3zffDBNFuRlfEfOea8sAmmVhsXSR2z6xSX7BuCoRHNFj76NoJb8ZVHqA8+Bv8KjZu7gHORjhyS
	uNScpr6nuPoA2KHBVevyK/+Xtytd0zV43zYM3VjC5ppoeQUVaj4qnHvY/M8VGJ+pG0uGiq8hR7j
	VVTPTxUQA7nTDTafagPgRk6cj6zpw6GPUDRrTpz905dmoVZLasGnPAaWw3Y4WSNfq/S2BRyZoDE
	1ryO1nk1YJFMAGQgpdChHXgNwWd6hyduiFnypRYa+CDGqbxGqYP7bpmX4MWZgK7ByGIeCMGrcwe
	GCaq7bMHhouZAZnPxart1vduGK/4NxFVZXle6GqbL3omHcsg9Clop2S0pWaa1i8ZNeRH3czwuaY
	UI5hssKQoZa+SOF5ePUSjFB7IySvlAR+K3U+hRf/e2bGQ==
X-Received: by 2002:a17:90b:2886:b0:396:4729:43fa with SMTP id 98e67ed59e1d1-396d0bfc429mr9095264a91.0.1787888231214;
        Thu, 27 Aug 2026 20:37:11 -0700 (PDT)
Received: from lima-xfs.. (174-126-236-85.cpe.sparklight.net. [174.126.236.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992435sm5589943a91.13.2026.08.27.20.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:37:10 -0700 (PDT)
From: Eric Peterson <linuxinstalled@gmail.com>
To: Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Eric Peterson <eric.peterson@hpe.com>
Subject: [PATCH] xfs: add per-mount read/write I/O completion counters
Date: Thu, 27 Aug 2026 21:34:29 -0600
Message-Id: <20260828033429.4070267-1-linuxinstalled@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Peterson <eric.peterson@hpe.com>

Add two per-mount statistics counters, xs_read_completions and
xs_write_completions, to complement the existing xs_read_calls and
xs_write_calls counters. The existing counters count I/O submissions
(entries); the new counters count I/O completions. The pair (calls,
completions) lets a consumer compute outstanding I/O as a queue depth
(calls - completions) and, via Little's law, derive an approximate
response time in userspace without any hot-path timestamping.

The counters are plain monotonic increments (no clock reads), so they
add negligible cost to the read/write path. Per-op timestamping was
deliberately not used: a clock read on the hot path costs ~20-30 ns on
TSC but hundreds of ns to ~1 us on HPET, which would be a regression for
general users. Queue depth from completion counters is an approximation
(instantaneous depth); this is a deliberate design choice, not
a placeholder.

Completions are accounted at exactly the same sites where XFS already
accounts the xs_*_bytes counters, so their semantics match the existing
byte counters per path:

  - Reads are counted at the frame in xfs_file_read_iter and
    xfs_file_splice_read.
  - Buffered writes are counted at the frame, i.e. when data reaches
    the page cache, mirroring how xs_write_bytes is accounted for
    buffered writes -- not at physical writeback.
  - DAX writes are counted at the frame after the synchronous
    dax_iomap_rw copy returns, mirroring xs_write_bytes for DAX.
  - Direct I/O writes are counted at true completion in
    xfs_dio_write_end_io, which is async-safe and fires for both sync
    and async DIO, mirroring xs_write_bytes for DIO.

Caveat: async O_DIRECT reads are counted at submission, not completion,
because XFS has no read end_io today (iomap_dio_rw is called with NULL
ops for reads). This matches the existing read-byte semantics.

The counters are uint32_t and wrap like the existing xs_*_calls
counters; userspace diffs handle wrap.

The per-mount stats file gains a new appended "rwcmpl" line printing
write and read completions. The existing "rw" line is unchanged, so
positional parsers of "rw" are unaffected:

  rw     <write_calls>       <read_calls>
  rwcmpl <write_completions> <read_completions>

Signed-off-by: Eric Peterson <eric.peterson@hpe.com>
---

Notes for reviewers (not part of the commit log):

* Placement: the new "rwcmpl" group is inserted between "rw" and
  "attr" in the xstats[] table. The "rw" line itself is unchanged,
  and "rwcmpl" is appended after it, but lines below "rw" in
  /proc/fs/xfs/stat shift by one for strictly positional parsers. I
  can instead append the group at the END of the table if preferred.

* checkpatch --strict reports two CHECKs preferring u32 over uint32_t
  for the new fields. They are kept as uint32_t to match struct
  __xfsstats, whose every field is uint32_t; changing only these two
  would break local consistency.

* Testing: fstests -g auto on v6.12.74 shows baseline and patched
  fail the identical 6/1277 tests -- zero regressions. The rwcmpl
  interface was verified on hardware (rw >= rwcmpl, counters
  advance under load). This for-next port applies cleanly with no
  drift and compiles clean; a runtime -g quick smoke on for-next was
  omitted as the logic is identical to the tested v6.12.74 patch.
 fs/xfs/xfs_file.c  | 11 +++++++++--
 fs/xfs/xfs_stats.c |  3 ++-
 fs/xfs/xfs_stats.h |  2 ++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 426a67b813..3ecd4ed534 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -347,8 +347,10 @@ xfs_file_read_iter(
 	else
 		ret = xfs_file_buffered_read(iocb, to);
 
-	if (ret > 0)
+	if (ret > 0) {
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
+		XFS_STATS_INC(mp, xs_read_completions);
+	}
 	return ret;
 }
 
@@ -375,8 +377,10 @@ xfs_file_splice_read(
 	xfs_ilock(ip, XFS_IOLOCK_SHARED);
 	ret = filemap_splice_read(in, ppos, pipe, len, flags);
 	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
-	if (ret > 0)
+	if (ret > 0) {
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
+		XFS_STATS_INC(mp, xs_read_completions);
+	}
 	return ret;
 }
 
@@ -663,6 +667,7 @@ xfs_dio_write_end_io(
 	 * for it on submission.
 	 */
 	XFS_STATS_ADD(ip->i_mount, xs_write_bytes, size);
+	XFS_STATS_INC(ip->i_mount, xs_write_completions);
 
 	/*
 	 * We can allocate memory here while doing writeback on behalf of
@@ -1032,6 +1037,7 @@ xfs_file_dax_write(
 
 	if (ret > 0) {
 		XFS_STATS_ADD(ip->i_mount, xs_write_bytes, ret);
+		XFS_STATS_INC(ip->i_mount, xs_write_completions);
 
 		/* Handle various SYNC-type writes */
 		ret = generic_write_sync(iocb, ret);
@@ -1098,6 +1104,7 @@ xfs_file_buffered_write(
 
 	if (ret > 0) {
 		XFS_STATS_ADD(ip->i_mount, xs_write_bytes, ret);
+		XFS_STATS_INC(ip->i_mount, xs_write_completions);
 		/* Handle various SYNC-type writes */
 		ret = generic_write_sync(iocb, ret);
 	}
diff --git a/fs/xfs/xfs_stats.c b/fs/xfs/xfs_stats.c
index c13d600732..5b276666b6 100644
--- a/fs/xfs/xfs_stats.c
+++ b/fs/xfs/xfs_stats.c
@@ -40,7 +40,8 @@ int xfs_stats_format(struct xfsstats __percpu *stats, char *buf)
 		{ "log",		xfsstats_offset(xs_try_logspace)},
 		{ "push_ail",		xfsstats_offset(xs_xstrat_quick)},
 		{ "xstrat",		xfsstats_offset(xs_write_calls)	},
-		{ "rw",			xfsstats_offset(xs_attr_get)	},
+		{ "rw",			xfsstats_offset(xs_write_completions)	},
+		{ "rwcmpl",		xfsstats_offset(xs_attr_get)	},
 		{ "attr",		xfsstats_offset(xs_iflush_count)},
 		{ "icluster",		xfsstats_offset(xs_inodes_active) },
 		{ "vnodes",		xfsstats_offset(xb_get)		},
diff --git a/fs/xfs/xfs_stats.h b/fs/xfs/xfs_stats.h
index 57c32b86c3..608d12d0c6 100644
--- a/fs/xfs/xfs_stats.h
+++ b/fs/xfs/xfs_stats.h
@@ -93,6 +93,8 @@ struct __xfsstats {
 	uint32_t		xs_xstrat_split;
 	uint32_t		xs_write_calls;
 	uint32_t		xs_read_calls;
+	uint32_t		xs_write_completions;
+	uint32_t		xs_read_completions;
 	uint32_t		xs_attr_get;
 	uint32_t		xs_attr_set;
 	uint32_t		xs_attr_remove;
-- 
2.39.5

