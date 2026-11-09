Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248440;
	b=ogoLcEYPymuaVOo96JK+YPfF2qq+iVa+Z6ra4bxeG5e3iiO1GtC9srf4Tv4hq0TmSD8R
	 evqMmoJLdqIV3L31bIxPLWyDpY1tSY5GgAAbxk7cxe3bUyigA6lSFKjUirltwEtqTyDwN
	 0CEkZyM6XE11ZXD0g4QTWdSvgh1ShVLsTII4D/nEPbYk2IdZUd3NzaR1R70sw2JYXPeO9
	 SON/72V3fzao0jrcxsVfu3EAwCALBgh2wnk5EbL+4Mtiqmr73tzCR1yat+imauQJuC5Z5
	 SsQA+48D9rFC1RroNckqIkM1zSIRMAcNn55Xm2gQhVlrsJCZNC+DqWSLsi+hGdzK7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0zC4kg1d94XJgDxpm3y5aLE00I5P0Sif6z7h4sr0uIA=;
	b=FkVmhy+WA1Z+cVd7/EU399hJtjwduGSOsK70RFSMpCwdmFrUnQEecRKjjM9M5XKDUMbz
	 qZlirY9ZRww5eJ0jKA/0E0DzRmSKhURX4mullJojPMdOMnMD3qFmG6xw/JLjGfb4oXM4g
	 bGbMu8EE6HJYNTJO2Xxptu1QnFAJNigoRyQyK1cYAHQzZPZHn+KWU1SUfnepYXI87Upwn
	 kPIX1onenNqP7l46BuN7/T1BwqlRV/aygjW6tPMSbaKYxaBT3saxb0uoWrxM2zSVfTBm0
	 3zgRxU2W+mn1IV0zF7MF9XAwE+VuberfjWbCEu6+XQCTfeJicvz1NdKJF6h0M65v0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIgEiMJY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC23606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIgEiMJY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso960037a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248439; x=1794853239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zC4kg1d94XJgDxpm3y5aLE00I5P0Sif6z7h4sr0uIA=;
        b=TIgEiMJYTwtZhSYQSj7k1sCWllUcHDrzR4eN7cj6pHvj8p6G3QjFvrdrxHi5E34jrD
         dRSJOszd27KfOqQqq/4yM1/qaAnrxzD4XbGS6LJ1Ew+87hyVciaDiZ456dLMQhZgNMKS
         aGzDzMpLMj0b1GidmFHmbj+58ooOJHbzj36K0HTqYMRHbaIBDyc7ptErkCRbhXmM6BFV
         jdkfRQQTOlV7uolNLn4EQ7wT3H1EL0MifYi5EBvKyFpDSLOlhjB16MKCsxxY5M/0lCME
         VvCr/fFqO10o07NMZUEC3dK9woIkGONwqLppvXS3rFuCNPwiSVzY3OMIj02Fs9UJOrLe
         2EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248439; x=1794853239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zC4kg1d94XJgDxpm3y5aLE00I5P0Sif6z7h4sr0uIA=;
        b=XdIVdidNVHRgDt1m0QiCWGpVsLTgEFwhzwtgNyxIOqZ/Oo8+A31QzlDJ3tJAJibZeH
         w2b9ydzOMUFg+Pzx4r0jlgSr9azTKzgKDJJH+aZBzRxGzhmz1kT+jsoYdKPGLgCGv6un
         6BKvfFN7h7aSVIFIZ0u39dHvyv2bfl44UgSIUJRhsZUANd6iQEgyH7mpig4VSWQcmIwb
         AMeXDGfTI1kkk+e32iz9TbAVHYeucOEJe6bvhoE6N4fTFFTc1cfl6dNipQ/WZQt0mIHs
         ZHjeV0er1bcxFDurNXhPXM8kNd8ckrBw2QhMkQxTqV7PdcYHsR34tr+jUF2Aof/RT1Ot
         mNfA==
X-Forwarded-Encrypted: i=1; AL+hErE8pjrGxBBtXrYMxKhSmpTNP4ZHRxTJhDicoNhCdaWBBeQmIAy4YcLfBmm3T+qrJgbg074/OKpeClh1odw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qN641jGM8hCym8qvsCYkCNfy4wmb/oBdVYgYImyd3rtwvyTvQ
	WJH27yu+eKDaVXZPHy/o6w/UTWV98nMoKdSlduOSXudA9r/XmCBuBVyl+c5hNcXpgit2yzrgPrj
	5ViuxCb+m9tXIsXet8I+GxfICXw==
X-Received: from pjbkn15.prod.google.com ([2002:a17:90b:480f:b0:3ae:b67:263])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a86:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b166d1edf5mr442976a91.48.1794248438888;
 Mon, 09 Nov 2026 10:20:38 -0800 (PST)
Date: Mon,  9 Nov 2026 18:20:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109182036.2910559-1-hramamurthy@google.com>
Subject: [PATCH net v5 0/4] gve: Fixes for issues discovered via net selftests
 and Sashiko
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, csully@google.com, jonolson@google.com, 
	lrizzo@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

Changes in v5:
- Link to v4: https://lore.kernel.org/netdev/20261029211634.2232784-1-hramamurthy@google.com/
- Patch 1: Also protect the single-queue restart writes with stats_lock
  (moved from patch 2) (Sashiko)
- Patch 1: Add a Fixes tag for 2e5e0932dff5, and clarify the commit
  message and the stats_lock comment
- Patch 2: Mention the ndo_get_stats64 counters in the commit message
  and add a Fixes tag for f5cedc84a30d (Sashiko)
- Patch 4: Keep queueing the service task after the synchronous link
  status update, so that resets requested during reset/suspend are
  handled once the queues come back up (Sashiko)
- Patch 2: Document that stats_lock also protects the baseline stats
- Patch 3: Explain the single fallback for both minimums in the commit
  message
- Rebased to the latest net tree

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

 drivers/net/ethernet/google/gve/gve.h        |  12 +
 drivers/net/ethernet/google/gve/gve_adminq.c |   4 +-
 drivers/net/ethernet/google/gve/gve_main.c   | 239 ++++++++++++++-----
 3 files changed, 199 insertions(+), 56 deletions(-)


base-commit: 787268686c64be60023743b527645a907e38ccca
-- 
2.56.0.455.g6c5a503b38-goog

