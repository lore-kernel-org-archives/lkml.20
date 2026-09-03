Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F2426ED6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788472571; cv=none; b=tPmGdeUt+1iZ+daXQEkSxc2iOjNp+KOng+pkerbMjS/ULgIRoYyj9JNs2uD33N6NMoeCDXVGCgEwenq3y42aDZuJKVDduC6JBjJeIU0wYOZu6zyvU42PqNuYhrqSB3XaxYOgNCw5KA3Pt5kCCLX29WjkMqEyT7RYMahQABXWiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788472571; c=relaxed/simple;
	bh=ycCRjh2oGFWd4/PfMmroNoXN1U3h8x8rpRHB/fNnBcE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ivGgLx62eg3Po1SW2RZs7da3MjCchMnLatlXvW0ZJxGy5c/L43NZ8HPl/VDB8OTL67D5+Q8YC3d9w0A6w4ehJ7ylvo0DW7bGtquJ5idJK0oQ/FP9ZcD2aHNdfWLpnf5AWq40RJBirjVPKDnKGRABKLJ5N5zDQtlrzAPQdj9ebxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OiX4N3PK; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OiX4N3PK"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso614847a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788472568; x=1789077368; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYSTpL4/e/dJxlW8BA73mMV2ir8Kqlp+jytcJ8MussU=;
        b=OiX4N3PKJ9ykalbFYOSJomAPePOHeTy3cp85POFD4VsOdtL5XjTYOkQzB7J8sAGTI7
         CY39bjp9innQrPCHlPrR+nDw6DUmOGOBf69kSeV5n+4NFNT+TVI4nXfSDRdCgeXeGcoV
         zmSAeYPCQyZa5eGrEqvslv1tuQjgCxsbdez6PkuuKsAyTkGb/RrYw5UHVH7sw3WaHSZO
         9+hr1oqUj0e89i4bdJmGACsZSElexE+Z3a9hojGPmI0Fc4YFvBs8sRC+5yUef34hn3tf
         rYu1lGnyjHdRja3q2sZxmKcSA6M9fF2+BhXntWDaGL9CxkNqzAn4GHPjYhNwAnh9R3xR
         kXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472568; x=1789077368;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYSTpL4/e/dJxlW8BA73mMV2ir8Kqlp+jytcJ8MussU=;
        b=gwu5hAppo/WL6PlDpP3JF7ERBRt2i2PFVtNbejR0I6BcaE/XbDdMziATglYYPdXTmS
         oZPe03uQNAAL8kwML20C7XZUZQQirkCwdrz8UdbbzrbUrwnBl4Wylbu++aGRWZY9j1Vi
         G2K/BUKFlHhs+vEH/wBDML3SblU/4YufNM0kreGcu0PPJ1gGgBKdGGtATuxuhz62A+jY
         uVqTbEAejDFktALv3xIkO90ypOjRIr0T9U7H23euBmNH7JUKbb1pbC5AJJus3hsW24Ab
         h8qCydcpcd2llmGqPmTDRhI9cyp4QIS9WWShue56EEwTBTN4xdYd13cKnbzSfrX9A9Ea
         c6/A==
X-Forwarded-Encrypted: i=1; AKwUvBw4atl8Nagw6nwRi3iFnvgstV77r33aArML37OKtFdVY0c9ZqgrXacL2Jnw/HnrdW5hdOJOd6khpdDqwhU=@vger.kernel.org
X-Gm-Message-State: AFuF++nRXkY8zilJuqBoKPbS8G9dbhJsLfQ4iEbribj027B/iydTJKOf
	0ZjageIxWvvWy2wfhwvNuPb88+c70Ia6LjRvGED4LSNsuTxxEnEABtFiv+C+bDyxKvU7DHUxHl8
	+BHNuIOuqYltmNQhQvesJOBtvUQ==
X-Received: from pgca13-n2.prod.google.com ([2002:a05:6a02:638d:20b0:cc1:c12a:92cf])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:db8e:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3da3a0f6709mr2412349637.21.1788472568266;
 Thu, 03 Sep 2026 14:56:08 -0700 (PDT)
Date: Thu,  3 Sep 2026 21:55:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260903215606.31633-1-hramamurthy@google.com>
Subject: [PATCH net-next v5 00/12] gve: AdminQ mode related refactors
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
  gve: add ctrl ops to for queue operations

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
 drivers/net/ethernet/google/gve/gve_dqo.h     |   2 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |   5 +-
 .../net/ethernet/google/gve/gve_flow_rule.c   |  15 +-
 drivers/net/ethernet/google/gve/gve_main.c    | 886 +++++++++---------
 7 files changed, 876 insertions(+), 529 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

