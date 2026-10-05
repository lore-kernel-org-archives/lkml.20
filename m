Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52670449992
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202853; cv=none; b=sLPcDmY6Zl8c5KwdsJkTuxEwg2rxmSmz1OdDQmWLIv6Q01qhxe0M64EyjhSeTM4O0LcEUtmimz7X07Et6fPRRZXa1+qxEKzUf3qbJsgwiMyXmeBWrqylqUffvnHWLLWX7rDOuumGizzyGWcURlMvwhH8nf+LmcTrWhtVUOW2YDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202853; c=relaxed/simple;
	bh=zFTvQAxkM3SuPhSa2uIrosbgACuuPg4vv+RgSgCkJ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WdI3lfHwblY2M3v5ed83tNH9eQCQcdSUQI8Q9csjqOkGqbD5rqzyH8YX3SdKbVXUqq8bBANlSNMH0a5fAqTwJsPuit8QgvPDDOQc1DEqUecALV05MmaNyyw4j7jHz+zZoKLxeqP2Fs/3XwL9qgsAEiol51IvEPS1mDdYaBoaDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=obCpUzPS; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="obCpUzPS"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398beb616f5so633071a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202852; x=1791807652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kr2/73o+y15EzbO0RQo9G5wswmWW+XAsy0BXTjIVojc=;
        b=obCpUzPSCnYo8NvWMz8Jz551lkVmSXqKv9uFEPOCrFFD0MQ8R9T8Qsg4XJINS6bcCf
         UlZeEcPVH81OO3I5frgn2kii5RaB50jBWB1MELVDnCTVvwetfMMBavLHW0EEBgvlyfFm
         0XykiFNOmnsEsGHCcPbodI9g4wfUqfgJD7jO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202852; x=1791807652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kr2/73o+y15EzbO0RQo9G5wswmWW+XAsy0BXTjIVojc=;
        b=OsqHwrrLk+bAneU53fMDrafF/kAqEMa6LRcNaho4O4AZ9EOwH9OXBOLR1ERmrUJzgQ
         Pya+W2bXJoS6nXyUcmw6ac5/DKc0Y/aVTkoRBIydXX5eS9AN3FL9Qz6utjrGzCqhZ0w4
         2QOsCcIy8wIPLGwJmlP+qpqRyVi1VKEa5W4ePNiBFIAU9kG86Z6QUBgcQPBjwW4DfXVQ
         0JJ633T//uCPvO1qsxhnvxATTDkUFo5Uf4/iAfJckX0l1LSeiwDyJNQWXRG3ZeO52tCk
         GECu4kJXxeK0xxsXBFkchzZua1Y3OVhkOnrDIlXnW3e1Oo4ehXabmnUxn2Z5lZx5A703
         uU1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwos8K08vK2rZYkMsBdRADcek29fRzXtMlNSFfJKcSRgBd8+lBKEUJ//ferzV41mQ4hyziQByQnocmLTiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYG/QJSKOthaSi+IeuVpy+gF8e7jPPLkpg52xT0Trr2RNLhhWx
	a4Wh9RdLjOkx3TBfN6lYtBqe0nm+yFHu/74pli7gmDh+boKiC8p0WN1KxolRdkF0fQ==
X-Gm-Gg: AYBFou05xH2+LA2VGuVmqW0wHf5rCbaI5AFSCbfkpfd+W0rHZTnAcIfnCrSivUFb7T8
	IZwQzXj5mQ+3+0kQ8QE3lhtFDbJ1Je+Wdj/I5dWZPtLj6xngKrb9At+ATuv3HfTU0nHSg+9uwIy
	a4DjKvArquF2kkTYND8hJuD7I/9M9dcxjYlseV4MXA1MXTHuxzX/PJ5xsCm/WlF0c2xDJLcN6uX
	6/Fs1w9VftWKzhGmTdi4bUiuWpVnHFPKbSe37Qkln5GJAZba+o7T0Mr319+jM0Xev5A7jl9jh7P
	i/8JIZEXNYf0SUnGcqwz8vciL/qzudOWDu5IYTLrS20qa6a7lqNa03pN8yS06e4wkGDpt9Rbl86
	hxpLR6PEjYBBUTw5cCZbJPX2jbN0VLLlLZzGELWbjSTN0GxW2cbY1T40e+zcE2tHsuewyVFWtSQ
	H2VeO21A1lNejppgepc4T63xUJjc5xOBibokh6RA45O8oMuVg695g1tGI965iSp1KaVz4bPzHxw
	1H9NTlHfP9/klO2rQfHMF4siDvsY80MWLlbw2Gc8+hV+Pywh3tXxt85+ea2ZjH4
X-Received: by 2002:a17:90b:3ec7:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3a6cec20416mr6577046a91.29.1791202851545;
        Mon, 05 Oct 2026 05:20:51 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:20:50 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 00/10] zram: redesign zcomp and rework backends
Date: Mon,  5 Oct 2026 21:20:15 +0900
Message-ID: <20261005122036.718976-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
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

The zcomp redesign and backend rework happen in the final two
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
into per-CPU Read streams and per-CPU Write streams, so that Readers
and Writers don't block each other anymore.  Kudos to Barry Song
for the idea.  Decoupling Reads and Writes results in noticeable
performance improvements on synthetic tests.

The last patch in the series builds atop of decoupled Read and
Write streams and reworks the way secondary streams are
handled.  Secondary compression streams are only used from
recompression, which is serialized by device lock, IOW it's
single-threaded.  However, we still allocated secondary streams
per-CPU (we needed to permit concurrent Reads of recompressed
objects).  Because we now have dedicated R/W streams, we can
allocate a singleton compression context (for recompression) yet
still have per-CPU decompression contexts.  This saves a notable
amount of memory with some backends and configurations (e.g. zstd,
deflate, lz4hc).

Sergey Senozhatsky (10):
  zram: prefix backends printk-s
  zram: remove debugfs entry on init failure
  zram: zstd: do not allocate empty C/D-dictionaries
  zram: lz4hc: pre-initialize dictionary stream in setup_params
  zram: lz4: use LZ4_decompress_safe_usingDict()
  zram: lz4hc: use LZ4_decompress_safe_usingDict()
  zram: zstd: do not use kvzalloc() for zstd allocations
  zram: reset writeback state in zram_reset_device()
  zram: split zcomp into separate R/W streams
  zram: use a singleton compression context for recompression

 drivers/block/zram/backend_842.c     |   6 +-
 drivers/block/zram/backend_deflate.c |  98 ++++++++------
 drivers/block/zram/backend_lz4.c     |  85 +++---------
 drivers/block/zram/backend_lz4hc.c   | 105 ++++++---------
 drivers/block/zram/backend_lzo.c     |   6 +-
 drivers/block/zram/backend_lzorle.c  |   6 +-
 drivers/block/zram/backend_zstd.c    | 133 ++++++++++++-------
 drivers/block/zram/zcomp.c           | 189 ++++++++++++++++++++++-----
 drivers/block/zram/zcomp.h           |  35 +++--
 drivers/block/zram/zram_drv.c        |  51 +++++---
 10 files changed, 421 insertions(+), 293 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

