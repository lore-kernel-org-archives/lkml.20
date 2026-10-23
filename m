Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788429;
	b=Dv1ZPkdVJ8w86l/cmfRxI4Myf2CBuQbANEpuFlW/3NE1dVimHUaZvjeWwkq72JUHyTDA
	 Nrk/4yAWw+dJ06gGennh70KK3c0PgxxwSRxObpAui/M3kce8vs5kjxwm7srC0YqgYcVxJ
	 K9LoreyrmQQimaCL1Xt+yhFWrlZK5N3hOV+hVqApByX/YtDaJGO1RY6Hkb8EdAAq0WaGO
	 xkZDt9DZFXjXZ7ppuFctoN8zjT2a5roFg+9ze6RSYfNxKsRBbWW15E/vbU3FhhQb3qq5w
	 LUP+H++pqB3md+NutIsr4KTk5AYGkcDSaoqfgU7LbTFh0+Vz8UIuxxKZYRFoWKASmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=IZesByycO+LPzFMOrxyzTveWeZ5n5x8B7eGfO0YnZQo=;
	b=3rvpVjt/71XquNcKCBaQgbPoyOzkrGhZ81ePSu/Zi6ZjaTlrt5DyIwWkk/kGSCOxCbqA
	 7qpqwOKFOOJ9x512nutmv6vtrPqhgTFIa63BEvhkybL6KiMlMFQxJYnQiVNFgov1QF/96
	 bqggTUWV095bDQDmPRTgMSBvHnc3YHBqtMAmfNIZqXWRsK4ABK2ZYOelq3y2es2OtIC7G
	 yQY2WhLXI8YUUMutvhxsVMtD5qYSwjmJDgoEcKwkJ1/ytvglommI5OtYrOkw3TjKq9vAb
	 4EI3x/vozR5jLZ5g1l602B/vqRiGW29vby7UCbk7IaRX6zjPfyd8XmN6tHYgTodxbgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oZ+hIKRO;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FBC606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58FBC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oZ+hIKRO
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so1233643b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792788428; x=1793393228; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZesByycO+LPzFMOrxyzTveWeZ5n5x8B7eGfO0YnZQo=;
        b=oZ+hIKRO191GjQKXstkXnFYzuhenkpuO8dF6SW4z/TXZy4waHZ1DepXeKFP9BOlq64
         w2kgh2WBL1Pcx1wPD57eCB7TrrZ9k4T84uposmk9fwbkjFdmxcy9ByQHhjUK17wzjdLF
         472VB0Ueit3PI7SRTTczNXP89KlCS9A4wHRBROIvR8feM7qmc1UTVGYarvnvYgIWhHmw
         iO9kXObgUyE3P4FV05nGPpAwExsdLgpw68JKu8Cg/rsWd4pws2JRW/U/bkBbgAgoQmtx
         EQvWQ/OvqNbYOXL8y3HqSfaE1i809bMdnLPbJffUDZ/dTKN8Ks5qaeRLErSfnOuVT0cR
         U5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788428; x=1793393228;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZesByycO+LPzFMOrxyzTveWeZ5n5x8B7eGfO0YnZQo=;
        b=vjIE9omtMeWgb0eJvtZ5MMGuruEPnH6Glb7Q880cW4oV//VI4F4HuML7GJOUNes3w1
         K3mnjL2+bygLxyRE09gwUXxP3qVzCeXUd1NVN+8NPegYv5FLQPB+QDkIbzc+9UIn/Ukg
         P2tve5fsmUFbnXPzhp5eEh+bOjs4r8FgprH0AajelkV3ouHpwciQJ1tAI6wmNxMAbk5e
         hiWkYYffHcEepeayj7X8QFq3QE2d0WOGqO8kxbkqzGupMu0h+3FpA33D2YUAmZLQV5Ah
         IZEgaLSc4TdSSeOhQ6lPCYBtROS1HhvHYKonJti/DW3+WRQ+LtA1orU220RtUn2dTI1f
         6mrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAFBHkHaNwaXZmLe4HAJ15XFkdZ8VJZJvCso0xe/V02SkMokcBQxZ3XsXJw/nIrkLzGCUNus0SzpJsB7g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy6wFFqCLBhKyGpGGkI0H/wisVCUE3i8EwVJ+43DxV1NrM4VNr
	dgw9009fLNdBDP131Bc7LFQhdQ9kPQPtgjLDu1fK9T+SiU9HXXDhs/QbEhb/OdxL1HCoWTURyGs
	qfMv8zpuK55rj5H3FQ3G5qs2qhA==
X-Received: from pfww6-n2.prod.google.com ([2002:a05:6a00:8886:20b0:890:ac21:250c])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3f95:b0:3e2:aa08:8040 with SMTP id adf61e73a8af0-3e7cd4f4b9dmr123609637.46.1792788428424;
 Fri, 23 Oct 2026 13:47:08 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:47:02 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023204706.3112215-1-hramamurthy@google.com>
Subject: [PATCH net v3 0/4] gve: Fixes for issues discovered via net selftests
 and Sashiko
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pin-yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pin-yen Lin <treapking@google.com>

This patch series addresses several issues in the gve driver. All four of
these fixes were either uncovered by running the net selftests or
suggested by Sashiko in the previous version.

The series includes the following changes:

- Patch 1 introduces a spinlock (stats_lock) to robustly synchronize stats
  queries (including ndo_get_stats64 and queue stats) against queue
  teardown and restart, preventing UAF and out-of-bounds reads. This was
  discovered by the drivers/net/stats.py selftest.
- Patch 2 fixes an issue where interface stats would go backwards when the
  interface was brought down or its configuration was adjusted. This was
  also discovered by the drivers/net/stats.py selftest.
- Patch 3 ensures the driver falls back to the default minimum ring size if
  the corresponding device option values are exposed as 0. This prevents
  userspace from configuring unexpectedly small ring sizes. This was
  discovered by the drivers/net/ring_reconfig.py selftest.
- Patch 4 makes sure ethtool configuration modifications are done
  synchronously before returning to the userspace. This was discovered by
  the drivers/net/ping.py selftest.

Changes in v3:
- Link to v2: https://lore.kernel.org/netdev/20260425002450.163421-1-hramamurthy@google.com/
- Protect all stats queries and queue lifecycle updates with a spinlock
  (Sashiko)
- Drop u64_stats_sync for the base stats and use the spinlock instead
- Save base stats in gve_queues_mem_remove() and gve_rx_queue_stop()
- Drop unused rx_dropped and tx_dropped accumulation in
  gve_add_base_stats()
- Fix the Fixes tag of patch 4
- Refined the commit messages
- Rebased to the latest net tree

Changes in v2:
- Add a NULL pointer check in gve_get_ring_err_stats() (Sashiko)
- Use local variable to prevent inflates from u64_stats_fetch_retry()
  (Sashiko)
- Add u64_stats_fetch/begin to protect base stats (Sashiko)

Debarghya Kundu (1):
  gve: Fix backward stats when interface goes down or configuration is
    adjusted

Pin-yen Lin (3):
  gve: Fix race between stats query and queue reconfig
  gve: Block invalid ring sizes when device options are 0
  gve: Fix link flap after ethtool ops

 drivers/net/ethernet/google/gve/gve.h        |   8 +
 drivers/net/ethernet/google/gve/gve_adminq.c |   4 +-
 drivers/net/ethernet/google/gve/gve_main.c   | 179 ++++++++++++++-----
 3 files changed, 148 insertions(+), 43 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.56.0.257.gf7497c7d27-goog

