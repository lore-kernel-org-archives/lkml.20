Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9A279DC3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295496; cv=none; b=d9b3bwNfDbij1DFP2rk2D4TCIeAAR4WAIj9io0VryoSJZCyYeaxT0R6Cn1GDaP7EDIcCnZHF46SJuuMz1hOQUtOILOL6qPMfmmW2mcu65VEng34b100s8hhUrlF31nqW8KOdutr3kOtPHS65K3SG3lJjrZLOOeesrkw1ihIO2FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295496; c=relaxed/simple;
	bh=hsYiPnm7Rcvnvtsa7Ytletl4GDQDTTq0grupd0EC1+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwXHeQLjvhjZfdMh2Jsx2dikrE2r8UYnGoxgzJyr2q2qtAaT8+VhXRMNPxU9Ec8H2lJiyZFgkkrwTranba0Bp9+U/m8cwRWYtaFORhZk8vd88V/SzjZZG4b5rchTNXeuAlo9btI7WxaCEylvXQRuKJk+vQM2HNRiDrL0iWAIB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c+sDOH1c; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c+sDOH1c"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so975663a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295494; x=1792900294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0b/AV3Wg+kLtcKm2wiFJRuBM+/NR2XvgAzeP+zBe6ow=;
        b=c+sDOH1cOtM6j0WYx4ztiFPFB4Ogq7Ho29/gGlZf2b84rUL/dh6wdqRcwoX7NvNIed
         h3gIDDzQB8IWH90VUMadKChkzAalUtNXUUF1WDSDKA6aBWDBNl96KUicxhbnl9UuyR5o
         KgB2Zl+q5HrvZP8mUAAZarl2FrNwki3mwLark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295494; x=1792900294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0b/AV3Wg+kLtcKm2wiFJRuBM+/NR2XvgAzeP+zBe6ow=;
        b=up4UdJGMOdbSLLV0KxcLqQTWhl9ctBD/f6EslT7gcEWuuMtbUC4dbiepYII20qvIFk
         2R/SVL0t0NhUgI04Pr/PpLLuZMt+p49I/LakIiG+0izRLOWt2D37Vp5aZZHJHgNNb3pt
         gh48uSvh+me4Qjch5j4oOPr3wcbs+alyeM/kq0dUQvlHocnNS6R1hSd/GBduJ2Sl+qBa
         flEmyORomBsrCVsRk55Eq/lmO8tPHSsfPKcKXy3M3+F6Pq114cEisHLrTUoZwlr10UZB
         wFcwB9CEWo3XFtX1xGfO2OAvl7My67Dpd9B+id1SIgbEwYF9q4daTskXJL09X6Mee15w
         egaA==
X-Forwarded-Encrypted: i=1; AKwUvByq2qYa1krlmQmfJkKXAyWYnK+A1MDBEK2vGRqmKYSOrPv4PDRSh7suOxuCAZJuqpCwe+OIx9Tv0HDIoaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3byOC0IZW+q5eVbI6bi+W+Bq7z5gSkE3fBpvi4y+fqlKOFee+
	XTGvDM4Z0ICIxXHkM7iLkZnXPoIWx81GJiJRFCxV0aj4C3OopgPsV1QTMggAwbtibA==
X-Gm-Gg: AYBFou1cogJmJbrjY+E6KM2YFbnqVKK1lnO7a0Oy9u3NZAJfEvLnw9ktwkxtpVH3QoP
	uQIxxA0ItnNnb7R2FNnF6jDQNt3CX5wFDcomghF49kdnCdHSHQqrmZr5dMZkutHKCeeV9evXkkI
	EfmEH3x0AD2Ln8RGfdLvXASPukd3Ue9kH7cgrXQwcOEygBeS0khnP5AJ0FOvvVhPMgU3Oat1MnK
	Fep6p1d4LsJawjhXNoVYrqvbzFbpMeWNE1XckuugZBSpMOlLCDRVakk6DCpw+xZPKrbFIAIplE2
	J7TxSC7ZSDlMwEDP7eBCe3OyZYbxmwqFe85SEpkk6kQ+tEA9uEknd2VaCVZcfXjYODeC2wPfO1b
	bSWEsExoVHnSGB+Tvoj+tmK1ra08La73cFrJqnf3SqLGEztFs+GjEt8aX6olAj45pENIKE5BmrE
	S3OXj/WuUJLNSR7GtT7JdTRSbTRnrhZUtWZ7Rb76kr88+FhhFouwZQ0D0umFtVNkvnyHGdX35tg
	I++J4FEADJ6euLYwQRzeRsmFAT1rwp+1SvLQ1h5Mj3bsDHZJQ8tBemUzGXTdQKBHibd+ZadZyn4
	SPhrevCG/hixWFLgg2V1K0QhCQdXT5YUoIuskJdmL8eS
X-Received: by 2002:a17:90b:28c7:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3acef3c3662mr3992376a91.53.1792295493775;
        Sat, 17 Oct 2026 20:51:33 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:32 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 00/13] zram: redesign zcomp and rework backends
Date: Sun, 18 Oct 2026 12:51:02 +0900
Message-ID: <20261018035125.3120704-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series has a number of memory usage optimisations and fixes
that result in savings from double digits KB to triple digits
KB per-context/per-CPU, depending on backend and its configuration.
More details are in the corresponding commit messages.

The zcomp redesign and backend rework happen in the final three
patches.  zcomp part, basically, attempts to address the priority
inversion problem, that is seen on some setups.  In zcomp, we have
always kept Read and Write contexts together in per-CPU streams.
With preemptible zram this becomes a bit of a problem, as a higher
priority Reader can preempt a Writer, which may hold a stream
lock, but since the compression stream is locked by the preempted
Writer, the Reader gets blocked on the very same stream lock.
However, we don't have any reasons to have Read and Write contexts
share and compete for the stream, because Read (decompression) and
Write (compression) paths are completely independent, they never
touch each other's buffers.  Thus, we can split compression streams
into per-CPU Read streams and per-CPU Write streams (Barry Song),
so that Readers and Writers don't block each other anymore.
Decoupling Reads and Writes results in noticeable performance
improvements on synthetic tests.  The Reader vs Reader priority
inversion is still possible.  To attack this problem we introduce
shared decompression stream (Brian Geffon) which can be used when
decompression is stateless.  There, however, stateful backends (zstd,
deflate) that cannot have shared decompression contexts.  For those
backends, we introduce a remote CPU borrowing of idle exclusive
decompression contexts, if an exclusive Reader get preempted on
current CPU.  We also now allocate a per-request (Read) bounce
buffer for linearisation of spanning zsmalloc objects, so stateless
decompression contexts do not block each other.

Reader vs Reader priority inversion tests:

  exclusive zstd (fg reader, average of 3 runs):
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        391k               1,064k        (+2.7x)
  Read clat avg    49.07 us           9.68 us       (-5.1x)
  Read clat stdev  7,179.16 us        30.64 us      (-234x)
  Read clat max    3,208,867 us       5,880.87 us   (-546x)

  shared lz4 (fg reader, average of 3 runs):
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        972k               1,466k        (+50.9%)
  Read clat avg    11.56 us           3.29 us       (-3.5x)
  Read clat stdev  2,738.84 us        16.57 us      (-165x)
  Read clat max    2,204,467 us       6,442.50 us   (-342x)

Writer vs Reader priority inversion tests:

  lz4 (fg reader, average of 3 runs):
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        642k               1,472k        (+2.3x)
  Read clat avg    23.97 us           3.28 us       (-7.3x)
  Read clat stdev  4,303.64 us        14.85 us      (-290x)
  Read clat max    2,393,767 us       5,710.53 us   (-419x)

The final patch builds atop of decoupled Read and Write streams and
reworks the way secondary streams are handled.  Secondary compression
streams are only used from recompression, which is serialized by
device lock, IOW it's single-threaded.  However, we still allocated
secondary streams per-CPU (we needed to permit concurrent Reads
of recompressed objects).  Because we now have dedicated R/W
streams, we can allocate a singleton compression context (for
recompression) yet still have per-CPU decompression contexts.
This saves a notable amount of memory with some backends and
configurations (e.g. zstd, deflate, lz4hc).

v4 - > v5:
-- borrow idle decompression streams in exclusive mode from remote CPUs
   when exclusive reader is preempted.

Sergey Senozhatsky (13):
  zram: prefix backends printk-s
  zram: remove debugfs entry on init failure
  zram: zstd: do not allocate empty C/D-dictionaries
  zram: lz4hc: pre-initialize dictionary stream in setup_params
  zram: lz4: use LZ4_decompress_safe_usingDict()
  zram: lz4hc: use LZ4_decompress_safe_usingDict()
  zram: zstd: do not use kvzalloc() for zstd allocations
  zram: reset writeback state in zram_reset_device()
  zram: split zcomp into separate R/W streams
  zram: introduce shared decompression streams
  zram: allocate bounce buffer for spanning objects
  zram: borrow idle decompression streams in exclusive mode
  zram: use a singleton compression context for recompression

 drivers/block/zram/backend_842.c     |   6 +-
 drivers/block/zram/backend_deflate.c |  98 +++++----
 drivers/block/zram/backend_lz4.c     |  85 ++------
 drivers/block/zram/backend_lz4hc.c   | 105 ++++------
 drivers/block/zram/backend_lzo.c     |   6 +-
 drivers/block/zram/backend_lzorle.c  |   6 +-
 drivers/block/zram/backend_zstd.c    | 133 +++++++-----
 drivers/block/zram/zcomp.c           | 298 +++++++++++++++++++++++----
 drivers/block/zram/zcomp.h           |  53 ++++-
 drivers/block/zram/zram_drv.c        |  55 +++--
 10 files changed, 542 insertions(+), 303 deletions(-)

--
2.56.0.176.g3575e65682-goog

