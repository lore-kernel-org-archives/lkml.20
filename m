Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D983F4DE9;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=XIs8Hc5tFe98fy4NOngOEeBpcgmf7aMAwNgwSpJXEXpQ42cJZAzuPsZnIeUWmiObU+a6ktnkXRcAWBAppyfbnD5VnSVWgCVQWp9JOilrcaspMlJV4EtDG4aVm7HoCakrj8pKK9P9J/nXvsTppHTWkWfKxj9FLYMv0xjhOwyF9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=oJxGDCqRUINuvrYZS1ZvOMtenx0yHNEZBIYLB9kWHlM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qTYmuqMxLdUtGGN+iXEQC/Uv1Qv2uO5O2WNIAMQnHwN2mQFIu1m3XYr4Uq4D57kpJnI1wa2Xs8f3slInO1YHj9KXrffM/Pqc7CpFIxH31mhv3aRCAyasjUXCpN7lEl6ljIYH9YK4LC5Z5MJKwOms+uH5oYraaod/+R0EgLLDPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwzUtY1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwzUtY1T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDB82C2BCF4;
	Wed, 30 Sep 2026 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750569;
	bh=oJxGDCqRUINuvrYZS1ZvOMtenx0yHNEZBIYLB9kWHlM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SwzUtY1T9zTu8gLNcm5INgRWTG/WCYSivJ8fc7ODmpPbZr5zAuddzPXrnI8SJWaiG
	 AMl/0uycP6wXWQ2wGyo+JJpgfmMT94FwY9Tqktyx1jCgsDgG+BIrAEhPKvt3cawdxv
	 QUV81y2JZvpzzf4mnzTMOWeH8y7efIajE8AGlkQhx2zVZxXZRvbhQ7yFkL2s3fQEEu
	 L27NmX4GkjBlvXEKx32hFDAWxCXmcq277aHY+QGqyQ+SaycroIz2OIKOcFBjrNBf32
	 6c4Qs3v8fffjxaWaAiA8V1NaMMcauKY5MKX8+mJqdxmHqsgtrvV37BRlDMKAtsv4MQ
	 LHMBQ2gyI0noA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B309BC9830E;
	Wed, 30 Sep 2026 06:42:49 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v2 00/21] media: i2c: it6625: address review feedback and
 adopt subdev state
Date: Wed, 30 Sep 2026 14:41:18 +0800
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6vvGoC/4WNQQ6CMBAAv2L27BJaoK2e/IfhUEqRTYCStoKG8
 HcriWePM4eZDYL1ZANcTxt4u1AgNyXg5xOYXk8Pi9QmBp5zkV+YxOccord6RIpC8Ao7NwxuTRp
 nHU2PjWJNUXIhTFlAqszedvQ6Dvc6cU8hOv8+hgv72l9b/W0vDHOUqpW8lUoJXd0o2sy4MYsr1
 Pu+fwDT9oCxzwAAAA==
X-Change-ID: 20260917-upstream-it6625-follow-up-patch-b81b34266c43
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=6541;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=oJxGDCqRUINuvrYZS1ZvOMtenx0yHNEZBIYLB9kWHlM=;
 b=7fvmbobX2xqTjmTHlOY3kIpDIDWzYiRoj0oelp6mygZIL11/8udP8kfAnpeUEPiraCj2RPC2I
 2jCqXYid+aRDIMVrxpGP8ekqhMEe4ah6lfsnRZA//mcSp9ocaBNpQW/
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

Review feedback came in on "[PATCH v10 2/2] media: i2c: add driver for
ITE IT6625/IT6626" and, separately, on "[PATCH v1 1/2]" (the dt-bindings
patch), after both had already been merged into next. This series
addresses that feedback as a follow-up, since the original commits can
no longer be amended.

Scope of this series:
 - one dt-bindings fix documenting the CSI-2 bus-type default;
 - one control-update error-handling fix;
 - mechanical and style cleanups (declaration ordering, unsigned loop
   indices, redundant boilerplate, unaligned-access helpers, an early
   return conversion);
 - a link-frequency reporting fix for one-/two-trio C-PHY configurations,
   found while implementing a related style request;
 - tightening DT endpoint parsing to require the documented endpoint
   instead of silently defaulting;
 - folding subdev initialization into probe() for explicit error
   handling;
 - adopting the subdev active-state model: moving the current format
   out of driver-private fields and into the pad format, sharing the
   control handler's own lock as the subdev state lock instead of
   introducing another private mutex for it, keeping the existing
   it6625_lock independent as the lock for serialized hardware/register
   operations and driver-private timing state (kept separate chiefly
   for the MCU host interface's own multi-step transactions), and
   calling v4l2_subdev_init_finalize()/v4l2_subdev_cleanup();
 - converting from the deprecated s_stream video op to the
   enable_streams/disable_streams pad ops, keeping
   v4l2_subdev_s_stream_helper for legacy callers.

The locking-model change is the one part of this series most likely to
need another look: it changes what the driver's own mutex protects and
who else already holds it by the time driver code runs. It was refined
during v1's review -- see patch 20's and patch 21's commit messages in
this revision for the current design (the control handler's own lock
shared as the subdev state lock, it6625_lock kept independent for
serialized hardware/register operations and driver-private timing
state), isolated to those two commits and kept separate from the
mechanical/bug-fix commits that precede them.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- Patch 02: propagate it6625_initial_setup()'s register-write errors
  and it6625_v4l2_sd_ctrl_update()'s control errors out of probe()
  instead of discarding them; probe() now fails via dev_err_probe() on
  either
- Patch 12: use HZ_PER_KHZ (kHz to Hz) instead of the wrongly-named
  KHZ_PER_MHZ -- both are numerically 1000, so this has no functional
  effect (found by sashiko.dev)
- Patch 13: define the detected-timings register-layout structs at file
  scope, immediately above the function that uses them, instead of as
  local variables
- Patch 17: demote -EPROBE_DEFER to dev_dbg() with dev_err_probe()
  instead of logging it as an error on every retried probe (found by
  sashiko.dev)
- Patch 19: add an err_clean_ctrl_handler label instead of freeing the
  control handler inline on a media_entity_pads_init() failure
- Patch 20: share the control handler's own lock as the subdev state lock
  (sd->state_lock = sd->ctrl_handler->lock) instead of a separate shared
  mutex for both, keep it6625_lock as an independent
  MCU/register-transaction lock, and take the active state's lock
  explicitly at every call site that reaches it outside a core-locked
  path (probe-time setup, an IRQ callback, and the two ioctls the core
  doesn't pre-lock a state for). Make it6625_init_state() seed every
  state -- active and TRY alike -- from the current it6625->timings and
  the default format index (so a TRY state opened after signal detection
  still reflects live detected timings, not frozen boot defaults) instead
  of branching on whether the active state exists yet, and unify the
  TRY/ACTIVE commit tail in it6625_set_fmt(). Trim the commit message and
  move the lock-interleaving trace out of it.
- Patch 21: take it6625_lock explicitly in it6625_enable_streams()/
  it6625_disable_streams(), since the core-held state lock is no longer
  the same mutex after patch 20's locking-model change.
- Rebased onto current origin/next (b38d06ad1e1 -> 2dcdfb625c3);
  it6625_set_fmt() now takes the unused const struct
  v4l2_subdev_client_info *ci parameter added by commit 7eef49c16461
  ("media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to
  pad ops")
- Link to v1: https://lore.kernel.org/r/20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw

---
Hermes Wu (21):
      dt-bindings: media: ite,it6625: document the default CSI-2 bus type
      media: i2c: it6625: propagate initial-setup and control-update errors
      media: i2c: it6625: default the debug module parameter to 0
      media: i2c: it6625: drop unused bus field from struct it6625
      media: i2c: it6625: drop stale GCC < 4.4.6 workaround
      media: i2c: it6625: use unsigned int loop indices in table lookups
      media: i2c: it6625: drop redundant parentheses in status helpers
      media: i2c: it6625: make the audio sampling-rate table static const
      media: i2c: it6625: tidy CEC buffer init and a continuation line
      media: i2c: it6625: clean up it6625_wait_for_status()
      media: i2c: it6625: use unsigned int indices in EDID read/write
      media: i2c: it6625: use unaligned/units helpers to decode pixel clock
      media: i2c: it6625: decode detected timings via typed register structs
      media: i2c: it6625: fix link-frequency reporting for one-/two-trio C-PHY
      media: i2c: it6625: use early returns in it6625_update_timings_if_changed()
      media: i2c: it6625: drop the private CSI-format name table
      media: i2c: it6625: require a DT endpoint and simplify endpoint parsing
      media: i2c: it6625: finish reverse fir-tree declaration order
      media: i2c: it6625: fold subdev initialization into probe
      media: i2c: it6625: use centrally managed active state
      media: i2c: it6625: use enable_streams and disable_streams

 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |   2 +
 drivers/media/i2c/it6625.c                         | 567 ++++++++++++---------
 2 files changed, 318 insertions(+), 251 deletions(-)
---
base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
change-id: 20260917-upstream-it6625-follow-up-patch-b81b34266c43

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


