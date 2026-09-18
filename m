Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FA44B44A8;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721841; cv=none; b=tfeVNRDenLs6NP3IENXPlVm3nPdBuitX43EylkQEUKswmrLQX5yQWehCYa34YWun7IRAe7srwiMPpVMrAVQarPwCMx1JoRkHC7oxZ6hFzXn/DwGiBzJnDuTdLlKQ6wpmPkMfMzj7vRAI+p5b+Vv4dfJHjH7wBhjH9vY/plUr3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721841; c=relaxed/simple;
	bh=/ldhIMFWu7DdQUmmy+rNousW8O/UMnToBE4wp8FaHPU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ji3wRVN7edVSMkvw3WcCMmqMjko3cKLI4uhut6+O4XVk5Xk7OvoO0bX2Xd5zCPlOSSkD/3lY1TaqsZSpU8chboNI/hXcGuG501pKbI371/b5Ls5N5ThT0CxfuYihAWfyzmHb23VUX/UsT2ygj6VdX5ahnMjXO0E2b0NNtvuAPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsfLbl8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsfLbl8m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BBA2C2BCF5;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=/ldhIMFWu7DdQUmmy+rNousW8O/UMnToBE4wp8FaHPU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DsfLbl8mTmQRv1g2aqzQTr+hzuZ1dVd9p5IvHKB0uqsPeU4weIOwUlkl43Do7SW59
	 fbKXGKpJgl5XosgNjnqNUyiZTNyu8l7YzoN9Z3nNzcwF5IiiOGKUXdmvQ2Z01yftFD
	 yjcsPnPmlxMxi3jxkXXf3QiKuAmhQRs403iaEnRKKK1Xq6zoIivhrs7jSvgP3K9/Ut
	 g9/SMH1rd/sGcRoVbKDc15pyRb/zzNVehvlk8gtzR88a5yMj6jEm6rt2L4eRZbeFZi
	 vyhAbaaaW7rl+mXPButE43FPfgHO45SXUgqzXAUUzNsPXR7irCGin/LUvuWVRgU+3W
	 M76IUK56vJvwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F5C88E75;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH 00/21] media: i2c: it6625: address review feedback and
 adopt subdev state
Date: Fri, 18 Sep 2026 16:57:15 +0800
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOv8rGoC/x2NQQqDMBAAvyJ7dsFEu61+RXqIca0LakKSakH8e
 4PHmcPMCZGDcISuOCHwLlHclkGVBdjZbB9GGTODrjRVrXri18cU2KwoiUg/cHLL4o6s0ZtkZxx
 eaqgbTWSbGnLFB57kdx/693X9AXgJcXhxAAAA
X-Change-ID: 20260917-upstream-it6625-follow-up-patch-b81b34266c43
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=3695;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=/ldhIMFWu7DdQUmmy+rNousW8O/UMnToBE4wp8FaHPU=;
 b=0pOHzX3dviMo7TqpQv7NpqGfe+U+IQ7p2ex7Z5hg8W/CuvptWU0bmMVlQQcWN2/+dPNE4np1k
 JIJtphwUqKiAFpaSjsyjC99s9TDrg0M7J5JjAtwJhCAMXf2lQR7qVW9
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

Sakari Ailus reviewed "[PATCH v10 2/2] media: i2c: add driver for ITE
IT6625/IT6626" and, separately, "[PATCH v1 1/2]" (the dt-bindings patch)
after both had already been merged into next. This series addresses
that feedback as a follow-up, since the original commits can no longer
be amended.

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
 - adopting the subdev active-state model: sharing the driver mutex as
   both the subdev state lock and the control handler lock, moving the
   current format out of driver-private fields and into the pad format,
   and calling v4l2_subdev_init_finalize()/v4l2_subdev_cleanup();
 - converting from the deprecated s_stream video op to the
   enable_streams/disable_streams pad ops, keeping
   v4l2_subdev_s_stream_helper for legacy callers.

The locking-model change is the one part of this series most likely to
need another look: it changes what the driver's own mutex protects and
who else already holds it by the time driver code runs. It's isolated
to its own commit with an explicit trace of every lock acquisition site
against the actual core locking contract, kept separate from the
mechanical/bug-fix commits that precede it.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Hermes Wu (21):
      media: dt-bindings: ite,it6625: document the default CSI-2 bus type
      media: i2c: it6625: propagate control-update errors
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
 drivers/media/i2c/it6625.c                         | 519 +++++++++++----------
 2 files changed, 282 insertions(+), 239 deletions(-)
---
base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
change-id: 20260917-upstream-it6625-follow-up-patch-b81b34266c43

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


