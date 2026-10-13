Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C903B4EA9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863531; cv=none; b=qKIf+3+GVh60IdIdMlZz+Om1Dg3ywk8O47wpkuQYfTz4fEzAPja5zrEU+0/GKAgtArqocUdRKHTbUgickVRV8UVPQJiFYY8oRrJTVeddBaXi93qTdEob0YD530YXV5L5O3+CAozzncny14UUW9zM/MNpP9bhgeeOXWnsuyYpz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863531; c=relaxed/simple;
	bh=FS5NbUz96kqEKd9onXqdt/fGw9h9fS/rjq2i4m92jtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZGTR2csWuiNvtpAo6PoTrPyLbvgFF/NAaPNzhKpYmDGNWkCBl2xE0gtwRu0IVo7BtAU80ZD0x2xDZTqfj8Re0KCJxXmnnW22aqRPUzsG5wXFDxTJm6zTwldlvUD+B3pwSlHs7A50t42M/EC0p7olhBmKFwGt3IF/Wo3B9pteso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m92PJcjH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m92PJcjH"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88bda150550so963336b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863529; x=1792468329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RirkidvU39UtoRFdOSmmCxiKM73vm7nm9nipwtgQMA=;
        b=m92PJcjHGKAeDqWiDrohqn6Ppxu5boIhpof48y4wIPl+tDx8rIxEAIosHmeN08cC6o
         ukDAjp+vuVhcrjwRB9F5godGEpvqc2uVsN4Ec0e13WSaQsf0vVvPOq7HV8+TqUbtlwKJ
         h8gNYZz6Y1Kdx9gPL7iOI3zhzNby87yRHKHlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863529; x=1792468329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RirkidvU39UtoRFdOSmmCxiKM73vm7nm9nipwtgQMA=;
        b=bU6tX80WREeWVDrQO49qn84ez+0jQkLyuOA11zeKjneEzX6iCsq/iBMgRFfabuNy7R
         vNiTOuYlKS9KbF2aEhw8rxKmj9R9QB5A+2n4VAcqyO0TQQoYMppwdRpQ4cFElR1nkWdI
         1klh9zYrokCOSFLFrfgwxmdatZH7mA9OShs4hojbaZ8DHGtUjbqQxf2qgsdODFb/7rFh
         RAVcTVn79Bj2GKgixetU4n/Wcf0ooCKaH6U20Pjp+ErzdMD2HVXJ1qkEgGgbs5KiUMiJ
         dk/SFFUMAXGqT4YrO7MRTB6LPa57LkjUTKTit7M3Ud4Sg8nqWVsR8hfmSWubO/JmPSP8
         zIsw==
X-Forwarded-Encrypted: i=1; AKwUvByVMY10h5avjAvYN3xqY8kqMpbieqpAQBjX1qW6+LNdURLFhnfhpCsunMVcsO9VFaAmZ7NqCQDHdg8TPg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuZeKORA7HjfEXcbCr3RzzwyZMpqQx96JrrSJ4P1YiT3X3uhKI
	kVedch6rAUe9AdeLr7URHfFE9Qw8T5x8h2LWJV+WnGmoNpWl/KOLSsZxBwcuzomozw==
X-Gm-Gg: AYBFou2tBwlIY0dnEY36XrQmin5/T3bjDNzq9ebl0pOiWQCIhk43jZeQsI8+vFBQ5t3
	eu9i5BEWBIuEyfX34n6iG8iGTAwHwo6qbpply0lKQAos//zVD3xTsslEVtfBmT9avaa0nr1Eu9v
	8G/iATjhpKhDe5sKtYbWQyJ2llhJYi0pHi1dnSDbo51SJ9A5TnLNRkoSyON/dsf91uj6Qcno0YG
	Lwa9l91s2u1pEElUbcWditNPF8Vw5HOx1DXffqF1/aLh5R5G0Z/ZtRKkFTYh18aHNeWd/cF3fE3
	yGiNBJuxwVZSvGHT5r6Zd/8ETMu3ssOiPSjte0hbMEis/BD78gFWhuTEeO7hB8PLKW9lLHtEd5U
	BaThEg/k72R0eXuvjPfRz/vgzVLJ7qpc2oQzZXMOw2d6r/njR7bpn0K8IpWrEYn+mnZCplmIvU/
	Yk/1ssPCN00h7Ewbse2kbK4cBSdOOpQCywuFg160V6/SYAgneEqmCQcLnRKWAaHwdz3Kn9Iaauw
	xXrHH4aESmNVyIwcbOui5oYk+o19k7sxebR+zd+j2MHt3lZsJbhIELIdj4Gmw==
X-Received: by 2002:a05:6a20:9d97:b0:3e0:d508:59a6 with SMTP id adf61e73a8af0-3e16bdaa122mr9096795637.13.1791863528987;
        Mon, 12 Oct 2026 20:52:08 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:08 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 00/11] zram: redesign zcomp and rework backends
Date: Tue, 13 Oct 2026 12:50:47 +0900
Message-ID: <20261013035201.2809924-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
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
decompression is stateless.

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

v2 -> v3:
-- reworked shared dstrm patch: new internal zcomp API for shared/excl
   dstrm and a mutex to protect ->local_copy bounce buffer and ->ctx
-- updated commit messages
-- reshuffled patches

Sergey Senozhatsky (11):
  zram: prefix backends printk-s
  zram: remove debugfs entry on init failure
  zram: zstd: do not allocate empty C/D-dictionaries
  zram: lz4hc: pre-initialize dictionary stream in setup_params
  zram: lz4: use LZ4_decompress_safe_usingDict()
  zram: lz4hc: use LZ4_decompress_safe_usingDict()
  zram: zstd: do not use kvzalloc() for zstd allocations
  zram: reset writeback state in zram_reset_device()
  zram: split zcomp into separate R/W streams
  zram: use rw_semaphore for decompression streams
  zram: use a singleton compression context for recompression

 drivers/block/zram/backend_842.c     |   6 +-
 drivers/block/zram/backend_deflate.c |  98 +++++++-----
 drivers/block/zram/backend_lz4.c     |  85 +++-------
 drivers/block/zram/backend_lz4hc.c   | 105 +++++-------
 drivers/block/zram/backend_lzo.c     |   6 +-
 drivers/block/zram/backend_lzorle.c  |   6 +-
 drivers/block/zram/backend_zstd.c    | 133 ++++++++++------
 drivers/block/zram/zcomp.c           | 228 ++++++++++++++++++++++-----
 drivers/block/zram/zcomp.h           |  50 ++++--
 drivers/block/zram/zram_drv.c        |  55 ++++---
 10 files changed, 477 insertions(+), 295 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

