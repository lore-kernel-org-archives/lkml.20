Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F4385D99
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125886; cv=none; b=jvsjySk5KNIUl0gkVgIaUvV/gzeZVs+IC068Vqo5DHZj9Qbvs6WBRLTaBWgtAML2c7f1v8kAgLKqmwk4LP9ids3jTxHwgdePrQRYVzqxIQzIwg7y/PMmRcceNFvy3enBj+Kqjnf+EO+IFDuMlmCRuT34YQB+c8XsU96k5ZA79Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125886; c=relaxed/simple;
	bh=oup3/Nyj6xj77m7I8em0NMpusQ7mg2GpioVp9Gew6ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4UIYx9dm5i3rTwfm2sRU3wkS9BDO9GPIpGmGbUWWK6gOwGbMwbsKiygXGInnKAZq/RdvuNfdWSJmKKegA2VR2MYs7hANvMf3I0epUXsEYxZyGhHZB1tLgHTmRWAvSbCVQft8LBDckO0MaFQqsWfHhdl+DicDdEgi6/OK/ew+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YXN/3To3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YXN/3To3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so32708645ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125876; x=1792730676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBrnIo3XSNA4XGYMofOPHvvSVBtQNBIdSVaE9YyG9CE=;
        b=YXN/3To3blV/tz22gvAssI1DnRiLmL2j0ugSyo5opEjyZwNpStQDbb9cDK1SrGvCqe
         UUa9bJDskyGikuM1bu7A0hxPsRAoCHj1bDvVuwHEj08t8la4a2jCMCvoYxJVZUr9wgDJ
         KKa39zP5IfXIwJK19NZh4rPqCCgzfwuA9CvoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125876; x=1792730676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBrnIo3XSNA4XGYMofOPHvvSVBtQNBIdSVaE9YyG9CE=;
        b=MKZnVQ/Fe42qUHfOFq77x0HyHvFoncFyIJXl6Q6nO73siKSP+tJOL/x7Q5lAO46m3V
         HKq+76hqUI+iIUstLCNv4WCuV/jNLvC3QUvg4UwIkhLcX6+lCqMUNo0xlpMAh/HynN73
         gMoqT7/98gU7osPcJwJ7MpMBNNb4Tev1KGfavu7xmFHDjQtZUUwaSEZPA0NppVG/VAl1
         XtEtrXd5zRhPE/qr7cZsN0MMRkY875qaLLEkD0COsHkVYyN1aWspDSxt/RQUhfGccmWC
         ASfBOEcZzHA4Zn3DrsTbPwlVq3TpFd47/upHeeJlmpFpIBGb9nxC9v0nz+c/hnQr5M75
         jPPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHJLpcIk4SqHwPBSJrjaBO5Jr+JKBChULLb8CAVSMu1qjbWyQqL07alPI66ZE6VPf56lxUJIeB6ouziJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEDCZAe03aepPGESYqEApR0Nn+U8xEpzjMDf6r6QT2HWzSBbBK
	p8Hr0XS7W4KL33Qv6JPHBlqwxi7l9N4UzAFKoRLzkyaFstjyE2kbamKUftNFlNvz5g==
X-Gm-Gg: AYBFou07hJEVbw3fBFLw4QdH881JmRvF4QCuym3DwZHtyJgmuvnpKWbaaa1WdTKaOdp
	4/ihoHCno2EEDU8uqMWJmyO56O45zlCjYP2Mq/GeUUVghrmAr+yzacemz9m3QV9qrHukYv1Hf0F
	fgOcwkOKJEzsOxntizg2HOuT22VfCO/FAFawPprxpf7E/q26JJx5gKzfRCHF9fbuV9MHN8/KHOy
	vqrYFvIjRbp6t4Fh/SoqFtmF1juHfSRdfEhJpK8JYis/NcVkju3ZWa7PA4usxYC8oZZUlb8+81I
	EqfgWV4vKH3HY5KIdn1lJ0FIF24dZiZvc3BRGl9+6DyQD1638lefcuCHWKVrkNKKqa6+EB7YnzT
	2dBRZkfU+xVHPqWJwLaVmCcB+udgXhinK34l0IXwNOVPS+EMpRNfq6ASP7EUDkyR8NlL24+HTD3
	x6unpd0185PBz5DI5FlA18e3jMP2sQhf2DWIFTs81g9imLNZQYfQNXUGHfcp5BCDha5NLNkC0kN
	UYhBczGFqCWnq0y2Y5s1euPNFNCbdHpXYklL7LaZQtRKHR10lx/VA8640xzYIla
X-Received: by 2002:a17:903:1a0e:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2e842ab27c7mr190565875ad.33.1792125876506;
        Thu, 15 Oct 2026 21:44:36 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:35 -0700 (PDT)
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
Subject: [PATCH v4 00/12] zram: redesign zcomp and rework backends
Date: Fri, 16 Oct 2026 13:44:05 +0900
Message-ID: <20261016044429.1304561-1-senozhatsky@chromium.org>
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
decompression is stateless.  We also now allocate a per-request
(Read) bounce buffer for linearisation of spanning zsmalloc objects,
so stateless decompression contexts do not block each other.

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

v3 -> v4:
-- use a temp bounce buffer for read requests

Sergey Senozhatsky (12):
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
  zram: use a singleton compression context for recompression

 drivers/block/zram/backend_842.c     |   6 +-
 drivers/block/zram/backend_deflate.c |  98 ++++++----
 drivers/block/zram/backend_lz4.c     |  85 ++-------
 drivers/block/zram/backend_lz4hc.c   | 105 ++++-------
 drivers/block/zram/backend_lzo.c     |   6 +-
 drivers/block/zram/backend_lzorle.c  |   6 +-
 drivers/block/zram/backend_zstd.c    | 133 +++++++++-----
 drivers/block/zram/zcomp.c           | 265 ++++++++++++++++++++++-----
 drivers/block/zram/zcomp.h           |  50 ++++-
 drivers/block/zram/zram_drv.c        |  55 +++---
 10 files changed, 506 insertions(+), 303 deletions(-)

--
2.56.0.176.g3575e65682-goog

