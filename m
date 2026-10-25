Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894727;
	b=bFhtN/L+b8dFwtLarQ2Alh31defLzcS0/fwvWdeTLdvo3WQtZp1fUVRSQrS6qIPWjX40
	 4E6/66eyrdFEcEiTwEHEh5P0eD277Riihisx74NeRRBZf6lRQSVs2quNCzprTn/7uscUk
	 ltMTyID3AHhTS8G7QkZiw0VKay7VYOdNnO5q8ZdodStkgZILKlDSq9sZgeeyN7ANA88DI
	 SHGlVDl/BQN6F9wQPD0oj20Xs7h3XssTE9edhug3JtCCpYqt1QWMNQriB/yBfC5cpK/oD
	 sjMkYkgbe6AM52xQc7wU6eqemT8XtcIBYch2P8VOmsSVYA6sAKR64g4uIVG0OVXlIvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1r9lv2JLQ4NzTK9KfK4WRWnT+ABvHOtQg4UlHpt8dgI=;
	b=a2bw89Z/B/nAdf0BxgT6tn1d8Rrt+T8nQ6uZXgPkRmKJ58VRk2dT6EcC0hWEUj0JOTbV
	 VzhEwOdV2z0E6/Fu2twPPYvv/p8CwVDqGxPhk2PsumEMG8ScFqSyKK3glA55IeHDnbkD8
	 Y6h6EY2gE8bdxgrR3JXm/B+uSqgTyWX/xRTEYuCm41jviHAbRd0TXXdbKH/C+0TM6aaQF
	 MWbOQVUoI3o4cVMi2SEkSgfzZBh31witmyY8wPQkucG8Bmhejaz8VCD5ULMf8pvGZgRmn
	 mqXPZ/U9RXoijz0xnBWxQS60+B8OCdKzJ6nRc95+gaQ19vrIGlWEeG1R0v6gXu0l25A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X68vQEuE;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4C606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X68vQEuE
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59524so1122956c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894726; x=1793499526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1r9lv2JLQ4NzTK9KfK4WRWnT+ABvHOtQg4UlHpt8dgI=;
        b=X68vQEuERJj8MplXxgmix7A26xkVyeyRe+luYyOsjoF9SblunY8QDumbxEKhAwEJI5
         T84HSnNy7rpF4Tm+kSi9Ua4MQFAy3z08JVtvb4fCNYfqE6lw2T88HvCaxnZGqp8lbfT9
         NiaH7llp+1AM32Ofj4QrPTLl3o/gfLj2YzQvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894726; x=1793499526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1r9lv2JLQ4NzTK9KfK4WRWnT+ABvHOtQg4UlHpt8dgI=;
        b=RuYg06nI7SUBJvT1Ip4WYvGDWZd/sFHS+03msODWdRv3DccGgtK8HFTj4odSaujvM1
         LbmL5inCPnXcU6258R9U2u3ZfVHGpDHCgxA0e9ZyiYUsAYT4hUhUzruSPjv2jYlR8qoa
         Bp+B3rev583DdRo7CwM+YBiHRSL6odNPY38FLZeHLkmovskj5OFLIT6K31AwPgjtbZMh
         bNcDB6M2ycomBNEWjeHm4D1ZOmoPwU5GjtIxDDRTs59nJxqD4VzghDiAWOzs5/jVgy82
         IG4GsAE+gFss1Vj7S94HsENapKm6Ihjm9w/UFetKtUolqrFMk3vQn1PIGJ2rfn2M9+9Z
         1OIw==
X-Forwarded-Encrypted: i=1; AKwUvBxTOD5Jm74xXi80BHJF8LCxexQxf0x+Sdy02lffdm0pbXffMHDVxVf45l9GW9wdDjT3PZdayqt7csikVcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJniTkZUlrrQoBdKsjHPGPR5ap3e8W8jH9KiQR5mi92zyVn0QwX
	7msP+06h0Cuh0TCV2ErTJqe8ZLZBYcoCHrRxyXT9hz41O6R+B5Fvp8FFqK1j1KaYLw==
X-Gm-Gg: AYBFou1vW8t83CqoQb7SNkksX1eLTJaTa2SAeRdj3ejI3NM0U26t2nRWMCg/boKtkHT
	ldr1JeOmg6FPS692kUXUSvwu74rqvBwgC+/vkc088PzvoYnTeyJObV2E4s09M/tP/X4KtuMnQoa
	nRxhBtupar4zBhzryrNHKdYKZOZXhRLtjyuP/Yo+2/nhcsrhTDx4KS+xyssGa9M+GI32XWTro2z
	RNak3yTi0c75qYcU31rUmBlDde2ZBwrc/qk6AzAwjC0jSWdNwG5hg5a94aD4RbvOxRFU2GcnLON
	FreXjtX++ILwVToKssxeVEjgbrhwZVgBx9bmi1KKcMTNEA6R1Bf+rWqQs0ERxwp7Zj7b3k9UxNW
	QPaZXTvDA2HKZPELCzq6AAsNom13qgcqOauFWEHz99xYy1BpjFPmnnUtnFPHXaEXRfMWLg8L/hQ
	VJo3IvZgB60I8ks2JPHyKpA9mbVXHnjSAYeEAr4HAgfv1KbEMH2VDZFu3Rfr1O/26i8mK6j4/YA
	xT1CyTMoZwLsa5TD2nCVyDWagV2ZdZS6o7SeY3ZoGWW7HfI8bWV2P9mCwhGXPVQVKSJOzlzE7Y2
	+zpGpcWkRhUA9X4srAOZ3zHOvtUXrqhLyNoW1uwyF8X1UEC5LJbLb7E3lfrAyFMtWyK3t3UDtlr
	3j1OczAyFi3YPTNKjCg==
X-Received: by 2002:a05:7022:eac3:b0:192:bb26:19fe with SMTP id a92af1059eb24-199376e0828mr5839865c88.34.1792894725429;
        Sat, 24 Oct 2026 19:18:45 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:44 -0700 (PDT)
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
Subject: [PATCH v7 00/15] zram: redesign zcomp and rework backends
Date: Sun, 25 Oct 2026 11:18:16 +0900
Message-ID: <20261025021839.1542805-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
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

The series has a number of memory usage optimisations and fixes
that result in savings from double digits KB to triple digits
KB per-context/per-CPU, depending on backend and its configuration.
More details are in the corresponding commit messages.

The zcomp redesign and backend rework happen in the final five
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

Reader vs Reader priority inversion tests (fg reader, average of
3 runs):

  exclusive zstd
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        391k               1,064k        (+2.7x)
  Read clat max    3,208,867 us       5,881 us      (-546x)

  shared lz4
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        972k               1,466k        (+50.9%)
  Read clat max    2,204,467 us       6,442 us      (-342x)

Writer vs Reader priority inversion tests (fg reader, average of
3 runs):

  lz4
  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        642k               1,472k        (+2.3x)
  Read clat max    2,393,767 us       5,711 us      (-419x)

Proxy execution was brought up during v6 review, so I re-ran the
tests with CONFIG_SCHED_PROXY_EXEC=y in both kernels, 21 runs per
configuration (lz4, zstd level 3, zstd level 12).  Per-patch commit
messages have the full tables.  In short: with proxy execution base
catches up with patched on IOPS in Reader vs Reader tests, and is
still 26-28% behind in zstd Writer vs Reader tests.  What proxy
execution does not fix is the worst case: out of 126 base runs (R-vs-R
and W-vs-R combined), 108 had a read stalled for over 100 ms and 47
for over 1 s.  Patched never exceeded 8.4 ms in 126 runs.  One thing
to notice, Proxy execution is EXPERT-only option; this series doesn't
depend on it.

The final patch builds atop of decoupled Read and Write streams and
reworks the way secondary streams are handled.  Secondary compression
streams are only used from recompression, which is serialized by
device lock, IOW it's single-threaded.  However, we still allocated
secondary streams per-CPU (we needed to permit concurrent Reads
of recompressed objects).  Because we now have dedicated R/W
streams, we can allocate a singleton compression context (for
recompression) yet still have per-CPU decompression contexts.
This saves a notable amount of memory with some backends and
configurations (e.g. zstd, deflate).

v6 -> v7:
- tested against Proxy Execution, added the numbers to commit messages
- added "move mark_slot_accessed() under existing slot lock sections"
  and "remove stale WARN_ON() from zram_read_page()" patches
- updated commit messages

Sergey Senozhatsky (15):
  zram: prefix backends printk-s
  zram: remove debugfs entry on init failure
  zram: reset writeback state in zram_reset_device()
  zram: move mark_slot_accessed() under existing slot lock sections
  zram: remove stale WARN_ON() from zram_read_page()
  zram: zstd: do not allocate empty C/D-dictionaries
  zram: lz4hc: pre-initialize dictionary stream in setup_params
  zram: lz4: use LZ4_decompress_safe_usingDict()
  zram: lz4hc: use LZ4_decompress_safe_usingDict()
  zram: zstd: do not use kvzalloc() for zstd allocations
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
 drivers/block/zram/zram_drv.c        |  71 ++++---
 10 files changed, 546 insertions(+), 315 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog

