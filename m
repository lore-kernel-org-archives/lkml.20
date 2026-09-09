Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B83AD53F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981100; cv=none; b=jy0izSsuD/ieKEfU0Ou7NTik2QP9wY7P3IfW4MHm+dJvc38A+UB4XqSAj18dLiJhhEIJhO+kcm5VGzbmfmtFmfpEJDhEoM7ObaJMmLQGStgBAAn1UlMq62F7Dl5ouOmD4vH0zxnExLPE5h5b0064obov9x/LfkStZlxn/BwnozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981100; c=relaxed/simple;
	bh=1/xnnu591Pdp9yuovipzpNQsLPugxzWuJoSOIxa70hs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YwclV+82TF0xXzh/6e9lR4UNoRe+7m8ME0zKhs7xI2x39jL9gFhNOEguwHLifTdDm/NolACs7Ha3WvTtvdIitzVm+bcrZczG1MSMH/QGqRE0pwjD7VjCKwrX0utw/WKZwNoLDOzhwt/qT5drqa6PB44hPI78LTPJKRthhuAbOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mHxCBd5I; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mHxCBd5I"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4107518a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788981098; x=1789585898; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBgvG785AfFM/VOj79CCPL3tGNM1lGOecSdx0YvOvuY=;
        b=mHxCBd5IWf54h/mf0Pg6KVWXCft/hTf2WJzG/+EHW8kEjWz0i4hu94GYWjKD4ZDp+w
         kpEmIcOflEHM7KY0noAQyr6NbRXsMPBpVdJsxt9+TSpkZz20fq3QihxwEg6cphdOvTAd
         xb2Am0sgy3MJzxvEQgj3d9FoKyWf9xjRmT+K+K4GibHetnJXvtrI9+DQacL3nvQJt4ML
         M729L+ZcI96KKry8xK9UV9gqDxvQ5qoIYBIxYarXLelkhSR7kLsJf41xi/UJZsXugeRh
         ROhkm/lz2FDTn22lQM3q7Q5aKbAaaIhV7Jrl3Ba25ZHBrvOa6AE2ragIKAd9mTLp6gam
         xjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981098; x=1789585898;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBgvG785AfFM/VOj79CCPL3tGNM1lGOecSdx0YvOvuY=;
        b=GXJEElgGkidOr564ejDqocaUHgYxC4piUF+me1Mm4xT4b7y12tnAnGHgUgn7MuF0k5
         HcedR1MBQvGAlEM+nWmIKFwWGxwOpzoiJ1RXSe5/VoNyMpe8mNfsZKK02WZ7Prt2kUwI
         D9vYSHSFMAHU5HX1isQ01Wf6GuXNI0Kq4is45HdyYOdcOjKpun2gAz0C1PJeu5hwAxkP
         6grPrfLI6wsfrqg+SYXm9I6dmsRAK6aHklbftelsvjXxtc8t1N6eEjO9/HX7ZJk8MHhV
         QHH25ZuugnPUWE0DM8vqnkZTEsRWos5ZsmHjDwwlwTDgLEnuxt2IU6KH1SKHEjl9FN7u
         BB9A==
X-Forwarded-Encrypted: i=1; AKwUvBwsLMNH2oA7BlNWRXcwAbcITGzi5ABy2ubqUMYZBMFaLFVvUARPL3Yf5OJPK8sW0EDf05wWGfsHzl4N/rI=@vger.kernel.org
X-Gm-Message-State: AFuF++kCLgzC1hrNgoRdb5D9NfNGsj4oYkzlIivHz4hz/5C4Lbbda7gh
	pyRZaxVWJvMRjwWulOsrvAvg0T5g+35VfPjrF2rGywfH7FhYQKHJJlrMedkUj57l8UukLG4QQIw
	BCbbMFQf5zXr90Y17Mc64J+cPVg==
X-Received: from pjbcu10.prod.google.com ([2002:a17:90a:fa8a:b0:39d:63bc:3af])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr3792495a91.10.1788981097465;
 Wed, 09 Sep 2026 12:11:37 -0700 (PDT)
Date: Wed,  9 Sep 2026 19:11:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909191136.3811892-1-hramamurthy@google.com>
Subject: [PATCH net-next v6 00/12] gve: AdminQ mode related refactors
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, jordanrhee@google.com, 
	willemb@google.com, nktgrg@google.com, maolson@google.com, thostet@google.com, 
	jacob.e.keller@intel.com, debarghyak@google.com, kees@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"

This series is preparing the driver for the addition of a new control
plane mode(MailboxQ) by commonizing and reusing as much code as possible.
MailboxQ is a new control plane infrastructure which uses mailbox queues.
This is a new control plane to communicate with the device when the driver
is running on bare-metal instances as well as newer versions of the device.

This series contains 2 main changes to the gve driver's existing control
plane(AdminQ):
1) refactor some initialization/teardown path methods to make it work for
   both control planes.
2) add gve_ctrl_ops structure to the driver for various control plane
   operations

The refactors are mainly around the init, reset and recover paths so that
functionalities could be moved into the control ops like 'set_num_queues',
'set_num_ntfy_blks' etc.

This patch series only sets the control ops for AdminQ mode. This is
intended as a preparation for adding MailboxQ mode in upcoming series
which will add the new control plane infrastructure and then introduce
the corresponding control ops for MailboxQ mode.

The entire list of future patches can be found here for reference:
https://github.com/hramamurthy12/linux/commits/gve-mailbox-queues/

Changes in v6:
- update commit message to be more consistent with code (patch 1,9 Sashiko)
- call out MTU validation change (patch 1, Sashiko)
- A few other Sashiko related fixes (error propagation in patch 2, drop double
  logging in patch 5, drop unintentional type conversion in patch 11)
- v5: https://lore.kernel.org/netdev/20260903215606.31633-1-hramamurthy@google.com/

Changes in v5:
- This series contains 12 patches since 3 patches from v4 were applied
- Picked up Przemek Kitszel's Reviewed-by tag
- Honor device provided default no. of Qs and max rx buffer size correctly (patch 1, Sashiko)
- drop unnecessary header files and __maybe_unused tag (patch 4, Sashiko)
- fix workqueue disable count, destroy rings before stopping Qs, stop queues in error path
  in gve_close, preserve ordering of gve_turndown->gve_destroy_rings->gve_queues_stop
  during close and reset (patch 6, Sashiko)
- drop double logging in all paths for queue creation/destruction (patch 11, Sashiko)
- v4: https://lore.kernel.org/netdev/20260814021406.3044324-1-hramamurthy@google.com/ 

Changes in v4:
- Reduce code churn by placing new functions directly in gve_adminq.c, introducing final tab spacing
  and using local variable (Przemek Kitszel)
- Fix kdoc formatting and drop spurious management interrupt(patch 9)
- Propagate release_db_resources naming change (patch 12)
- Remove double logging in destroy queues path (patch 14)
- v3: https://lore.kernel.org/netdev/20260803184630.3813311-1-hramamurthy@google.com/

Changes in v3:
- Fix driver compatibility verification in the reset and recovery paths (patches 2, 8).
- Mark gve_adminq_get_device_properties() with __maybe_unused ahead of its usage (patch 7).
- Refine error handling and resource cleanup in reset, probe, and queue creation paths (patches 8, 9, 11, 14).
- Keep IRQ doorbell allocation/release in control plane resource helpers (patch 12).
- Minor fixes: fix TOCTOU issue for link speed, correct kdoc comments, and remove redundant teardown calls (patches 4, 11, 15). 
- v2: https://lore.kernel.org/netdev/20260602235900.3050782-1-hramamurthy@google.com/

Changes in v2:
- Rebased against latest net-next to resolve apply failure for patch 5
- Fixed a few typos in commit messages of patch 9 and 14
- Fixed a kdoc warning in patch 9
- v1: https://lore.kernel.org/netdev/20260601175437.3767283-1-hramamurthy@google.com/

Harshitha Ramamurthy (6):
  gve: add struct gve_device_info to hold device properties
  gve: introduce control plane operations structure
  gve: introduce ctrl ops to set vectors and Qs
  gve: introduce gve_adminq_get_device_properties()
  gve: refactor gve_init_priv for reset path
  gve: add ctrl ops for queue operations

Joshua Washington (6):
  gve: simplify reset logic
  gve: add gve_ctrl_ops for gve initialization/teardown sequences
  gve: split up notify block allocation and setup paths
  gve: introduce new methods to handle IRQ doorbells
  gve: setup and teardown management interrupts
  gve: add link status/speed ctrl ops

 drivers/net/ethernet/google/gve/gve.h         |  87 +-
 drivers/net/ethernet/google/gve/gve_adminq.c  | 380 ++++++--
 drivers/net/ethernet/google/gve/gve_adminq.h  |  30 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |   5 +-
 .../net/ethernet/google/gve/gve_flow_rule.c   |  15 +-
 drivers/net/ethernet/google/gve/gve_main.c    | 881 +++++++++---------
 6 files changed, 870 insertions(+), 528 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

