Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308598;
	b=nPD/XPc6vmcaJTgxnneUd6IG/spCTP+erwZId77ozmoinoEocu2HCwUy/Sn3Op4b9zJV
	 bppUCtqapYxDNM1MdC8l6EnCHk5joPVXUVZ+CZ2d4tEMORmNc8Xoou20kRBnQQoSC4kab
	 oROAIIu8UqRSMw8F9xxlS0MiMDb6403QLP5xbkb0tzIFPQ8N120mHVq4FUpRT61flA/Uh
	 KfbJtDY3U0kUjsZP7LkJDjF4YQbfvPzG3GlTwz2lpDQ7PyEx8SqwFMuA1951XUwJI8zAn
	 lZArIYHYWXbceCE7ZurNrrAZIZkpOaJwDXHJz0IxyKB6WhkPW6O99e0HuRsc+jEUcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y5VoJFAtzQN0hpAVbuuN4XlRwqKEISFijkslQlRcjg0=;
	b=u7fqtb8HNiq11Snj5lbp/BOEaGIkT1ZWFXQY4Wq/ofBeMYCbNVl0ajm/NVGW/Qss+vd0
	 Asopp+vpfI6Tf22Zb7Hhz4V2EgV0ZJlddukHUKCnE/54DvSph2AG1sPZ811VEaYGPd5KI
	 Vz9qVFgtDrUjqdsxJwQiutUmHL5BFdTIiMspBPBohFfj5TGP3IH3h9U79stAedRgxKbRR
	 rS71LrKOHrSIw1teCpIaOHK9RHc08LF1OjQvUZaefbeZCmmlc8TEbKFOcFcBKUvcdGguZ
	 mifWKax+/iWWQKo0oP0BOxuYp33t8X8RCwHbG46GPWE14Q8clAuCtW3c08I3QzmhQIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="atZNhZ/U";
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA085606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA085606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=atZNhZ/U
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so2790522b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793308597; x=1793913397; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5VoJFAtzQN0hpAVbuuN4XlRwqKEISFijkslQlRcjg0=;
        b=atZNhZ/UYenKl9MgfO5lr4mCFScIBwntXXKKbhvgKGtqlXwccK1D9P/lDkCrP+QSFT
         Z9tJwyAKoSDWte1iCLZehkckSRknrdUTGW2HZWMO3JeiDPZeHEtwQKhr1A1xItiolSWb
         GXAaXRwgOTAZz3w+5rrBqqlCfG9/8JpzYo2dHSdKZHnDpkZeXTunNviYQ8egscW+HomG
         6J1VXxWr5XDX2+dtUz/6tHKcDyYcPBHaPdJcvUUqe6o2lCEVCp7pF7/mp9uU9ra+yb50
         KjruQdYv7mrOzYXzcX0kQQM6UadQVyp4/9T/1k1qHPTSUaMdQz49khQWt9Yv2fZTqG8R
         9OUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308597; x=1793913397;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5VoJFAtzQN0hpAVbuuN4XlRwqKEISFijkslQlRcjg0=;
        b=f8dDoT2qH19ZOM4y2N1zFX54v6ICIePGiLQ1RbG0OhCaRg4oNikIlP2ClUQFEE8/yS
         UAdmjwgx0Av6DTXI6TU0Yerjd5f6iv2Sw2FdHo1DmbVx0j122as4R2K5Xbeclf5NieDE
         ZZ7BCB3aLdS2da6BRL8Q7sPaaVu2vtyRWHvVSbujFDyy1Hd7fD4Po0KVuacULsvZzQ/i
         WNoS3Rj6dm2tVDuhAH09rZxoXP8faLnN3dL5+AbVxX2mkpXHhMkUgVUhINJdEznUbP5K
         dzM+3YUroql00TKveWmDLMkLaoIQ83CfDe9RdDsH0XDNg0j+ANK+8NDP1+RHsJdLc05n
         4PSg==
X-Forwarded-Encrypted: i=1; AKwUvBzah2JiMW/wdEj5Sb9BIw+MM5jLJ/2E83r5HXw3tvqrWPQS/OL+6VkXMNLW606TCk0/z+x/JFpK3F8+Qjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Ecdom/fj7rFIUnqwHEnXcFE1jFd/rXNkFiBOUzPd9A/eK4Lb
	T6etx2XYW0Bq+eQ74kxx7VyHm3INuj7lUzXwP/te1apTlAjAuFustksnCWRYoMet4UNOHx3R0ol
	GmIqwe/6bzSD9B6gbA9KR/SBfgg==
X-Received: from pfaq14.prod.google.com ([2002:a05:6a00:a88e:b0:89b:34dc:b094])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3b44:b0:3e2:8f5b:8ba6 with SMTP id adf61e73a8af0-3e9286461e6mr403587637.2.1793308596954;
 Thu, 29 Oct 2026 14:16:36 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:16:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029211634.2232784-1-hramamurthy@google.com>
Subject: [PATCH net v4 0/4] gve: Fixes for issues discovered via net selftests
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

Changes in v4:
- Link to v3: https://lore.kernel.org/netdev/20261023204706.3112215-1-hramamurthy@google.com/
- Patch 1: Clarify the commit message and change the Fixes tag (Sashiko)
- Patch 2: Report the live XDP TX ring counters in the base stats and
  take stats_lock around the priv->rx[idx] writes in
  gve_rx_queue_start() (Sashiko)
- Patch 4: Take netdev_lock() around the link status update in
  gve_service_task() (Sashiko)

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
 drivers/net/ethernet/google/gve/gve_main.c   | 236 ++++++++++++++-----
 3 files changed, 191 insertions(+), 57 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.56.0.307.g5fe7bd680c-goog

