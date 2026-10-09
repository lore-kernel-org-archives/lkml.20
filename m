Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322CF472558
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529930; cv=none; b=KnMyq9fsZMDZiyFbbmJBSskG1CQxceN29Xit9QJYBa+vZ0meUwaxvJg1oU0OePDZrGsrFOACwYN7cB8Jphkhte16ik6uSSAA3uL/Rvg0y9VBK99A7BDNhWhbRVHhx0CjTjpM5xb6MXwTjDW2NCVuehGhwu7S7uGZTsdBZUBIXM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529930; c=relaxed/simple;
	bh=X4DNJeH4NIWDGqEQUeTyIwAV6Gcd67RBpdsYRXRTbwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDTGbNE9gY13VwR/sXEbtbfsPLCQz4kxBKtAobFOn7BtPx6gXSUCF47jz43bB3aFk7OdlWbBnOIf+UeVVDLqlU7xVh5UfOgoFrSIvrIcMjLsADZB/6tCn7SXn1CVCtC/v6xpbId+gogTOs9pNii9Xl26OWqUycLDItvXfzQoWlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jLt355cs; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jLt355cs"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8455755f3so1546155ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529928; x=1792134728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aptDd8Np6uwn+I29ocduigmysLweAOQhXRAknslhT0Y=;
        b=jLt355csH4TuUq3r/8aTHjkJf4V0t5TiCVh+iFivaTWq69deuGz5+nEqssZrabIVVU
         4tYxMcUoCnZslqm0GGayRy+TqbJET/0HOkOiKi8IwHP2ynExpkvhWaWghzBiijKw1xBo
         qeH8+2S3MFp3aVon3tMve9Q+atfFaavyERv3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529928; x=1792134728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aptDd8Np6uwn+I29ocduigmysLweAOQhXRAknslhT0Y=;
        b=FOQB2ksP19Z/0RCYf3q3jDBcZLNQYMM4BYhxV90U5ddGIlykIPWJhB2oMS4ElnSwHt
         qMIPIA3UdsFYWD0Bu/rycrQV1tH6RBFVcNuMtaezBg0ufey/mMvAgiQGvQ9X0QdXA+Rt
         UtKvHaaX242KOO8rOWViI3PteksVGEavNSItA/tuk53SajPgES52Qz2b3J3CDiphDSzH
         hnqOTWk3sk2oOZqJipFYanNBRRIJUbG7IfhaCZO8C9hfesH/mIyZ+TTaPY+SgeZuXapG
         ygXwm5JPd0hxrhxbnZmkgXEVcQgCS2PQfLhT4yMYX9zPGtXT0fdOQWHjX0Jt7LSVPvlF
         FhNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy45z+VDfoOoKf0QIMHgCTMBWwn4TljjTPIuoXURiUd0zi6L7PArV2EEnoD6Ck1gcPoRsOzx2T2CdvoJVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM5mM8v9ZTUErrPgdxAXocZWM8IyQjeYtwrwHVgc4lMgK4Xzja
	6NlOMs3vY8NmO8u5hGVCmrGMEbxdWs6ymo29OSZ127NYOTPUxSejJk2TSwC/dqxHWA==
X-Gm-Gg: AYBFou1ZPVIlqQV0Hs8rQ7qsEIW2zHFOGwSDtv7lXHQIUu8+kzU/cTBgewTNowVFBgO
	/m9mHqECUI7rae16WBOTI8iqEhUxtzDv3IrnO7ch4IdvjYgz++3OLNBosmIkd2EDLtj9pUhi/bM
	A6NaxksRs/CeRW3BKyOKc+zzmaKwhRbHIiqG2TzEGGpwLtBp7ez2gwkPHXHzKbYeI/ll9T5kAEV
	AjoVcBh7BefCem9LWCRDZW+bX6epQ5idVUWB/aMmjASpyIjk8Jf/oLnzZtrqrHihVZNuLbfJSqG
	O4QoogL/7sBjTREPpc2E320HFAWrEpcGcWhKOEfOeX9znm2CvPcNX2Gwb68aQvNv8vgrh/EVbib
	Ylkua00qsV+UPLU48ad0+H2HrpxMfF9rB+D62wY6AZY7E31dzfFYi/taIjU2mMdoQhbBARNVpNt
	tfVts9ifMg8x53q0RKhVJp0493MZjEft9YLdYIQX/bZoGvraewIkPk0xAdsN0M68TxxYL/cSSZY
	MqtiLwBraKKTFdK90zyOPFe52zipoq1VhTzlc71hPLsGRFBYGkvSXU/EcsYp9M=
X-Received: by 2002:a17:902:f54f:b0:2dd:c100:b2c3 with SMTP id d9443c01a7336-2e842ce0ad9mr8639605ad.46.1791529928470;
        Fri, 09 Oct 2026 00:12:08 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:07 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 00/11] zram: redesign zcomp and rework backends
Date: Fri,  9 Oct 2026 16:11:23 +0900
Message-ID: <20261009071157.3730698-1-senozhatsky@chromium.org>
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
into per-CPU Read streams and per-CPU Write streams, so that Readers
and Writers don't block each other anymore.  Kudos to Barry Song
for the idea.  Decoupling Reads and Writes results in noticeable
performance improvements on synthetic tests.

"use a singleton compression context for recompression" patch
builds atop of decoupled Read and Write streams and reworks the
way secondary streams are handled.  Secondary compression streams
are only used from recompression, which is serialized by device
lock, IOW it's single-threaded.  However, we still allocated
secondary streams per-CPU (we needed to permit concurrent Reads
of recompressed objects).  Because we now have dedicated R/W
streams, we can allocate a singleton compression context (for
recompression) yet still have per-CPU decompression contexts.
This saves a notable amount of memory with some backends and
configurations (e.g. zstd, deflate, lz4hc).

The final patch in the series pushes performance gains even
further by switching to rw-semaphores for Read streams.  This
allows multiple Readers to concurrently decompress objects (with
some caveats).

v1 -> v2:
-- Switched to rw-sem for Read streams (Brian)

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
  zram: use a singleton compression context for recompression
  zram: use rw_semaphore for decompression streams

 drivers/block/zram/backend_842.c     |   6 +-
 drivers/block/zram/backend_deflate.c |  98 ++++++++-----
 drivers/block/zram/backend_lz4.c     |  85 +++--------
 drivers/block/zram/backend_lz4hc.c   | 105 +++++--------
 drivers/block/zram/backend_lzo.c     |   6 +-
 drivers/block/zram/backend_lzorle.c  |   6 +-
 drivers/block/zram/backend_zstd.c    | 133 +++++++++++------
 drivers/block/zram/zcomp.c           | 212 ++++++++++++++++++++++-----
 drivers/block/zram/zcomp.h           |  43 ++++--
 drivers/block/zram/zram_drv.c        |  55 ++++---
 10 files changed, 456 insertions(+), 293 deletions(-)

--
2.56.0.385.gd3acb90ef8-goog

