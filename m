Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF7415F3A;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852716; cv=none; b=nkqkkA8SIPNIx8irXABC3jYfsrDzealg3SsRua+o879KsvM5tRtNDTH9CnPgdSGshp3iXtALuTYf80I8X/nLfn8ykj9pBZq2L9/+qTrcLkDfeySYOsESZFC1UugoOp9m6BwfE+YKaiOq4wddwIb2ckMLlUU3w2CDI1aYb6kFJ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852716; c=relaxed/simple;
	bh=0nLkNLQiZlNB6CfK+Dg2+ehqZKw66lrJWjoHTco88+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOgcPQaHY1DdBOC/SiGW/tXVZCtX39mi5+Nsd1rU4fHHnUJ2PGOjCPrNZISK7B9i/rOvCrrcVl/haJJo27nFF4EreztLzl+pqD+Bx1atoStQTbjvgnMpvKVySHmIX4+KZh9+574w0BMlfKmLT73TSJ36sdsRRqgXI9UNvsqCdLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g40V6t1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g40V6t1C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41AA8C2BCF5;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787852715;
	bh=0nLkNLQiZlNB6CfK+Dg2+ehqZKw66lrJWjoHTco88+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g40V6t1CWPTz6v9mLyHkDn7VDdrFxh3+In3HJzZEqKDJ7OYL+o+KiEyxZFxb/LH4Y
	 Zf+3NeG+D8osrIZDoRRBFeslJ6cPU5+2SC/K3Um1GEFHfjtl0o3xTXZR/Rilj3lo8j
	 XjlN7MbMWMWjU2aYRJaAQv/9TTnSgravi2w3a4Nd3hRLqZFyTJKSWGAz4T3v9ghX9g
	 5cByUJich006UTwsk46z1r6CYTGtmjgOdaLvdoectPHmSGIUcLs+/g9fXS/cGnjp/4
	 QfR4DDXmsyNzpQ+EmsT6gsg5DoL2yXzHOheLx3kbnq0JQCrIVkstRTMlgaKc4rTa54
	 GSOXClZSnsCfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C0FC61DCB;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
From: Nick Faro via B4 Relay <devnull+yux50000.hotmail.com@kernel.org>
Date: Thu, 27 Aug 2026 19:44:12 +0200
Subject: [PATCH 2/6] media: cx231xx: stop resubmitting URBs after
 disconnect
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-cx231xx-disconnect-lifetime-v1-2-7bbf946bbd36@hotmail.com>
References: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
In-Reply-To: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Faro <yux50000@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787852712; l=3674;
 i=yux50000@hotmail.com; s=20260827; h=from:subject:message-id;
 bh=2Ru5eg+WVX8Q1bap6mSISOc5AFov0+AcLBFgPkvKzfA=;
 b=uu6yy4V69LYNf4+ZbRl3wBC//XBslOO0v/du/JGOAy8HALqEsTJGO2Fg4QKF1ZVzO+aiqLNE+
 oSPqDporgUAAWZnO3Z3HeLnwIPgeArPwbxZUSWxq227UO0nwfCA+UXc
X-Developer-Key: i=yux50000@hotmail.com; a=ed25519;
 pk=FMSCCFHmUW8ylFpPOeaegUBqrRhzdMS2snqX/kNbLtM=
X-Endpoint-Received: by B4 Relay for yux50000@hotmail.com/20260827 with
 auth_id=979
X-Original-From: Nick Faro <yux50000@hotmail.com>
Reply-To: yux50000@hotmail.com

From: Nick Faro <yux50000@hotmail.com>

URB completion handlers normally resubmit transfers after processing. A
completion can race with disconnect after the device has been marked gone,
causing the transfer loop to continue while teardown kills and frees URBs.

Return from the video and VBI completion handlers once the device is
disconnected. Continue to kill and free existing transfers during teardown,
but skip endpoint resets and capture commands that require live hardware.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nick Faro <yux50000@hotmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-core.c | 16 ++++++++++++++--
 drivers/media/usb/cx231xx/cx231xx-vbi.c  |  6 ++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index d8312201694f..462eb4c7564e 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -785,6 +785,9 @@ static void cx231xx_isoc_irq_callback(struct urb *urb)
 	unsigned long flags;
 	int i;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	switch (urb->status) {
 	case 0:		/* success */
 	case -ETIMEDOUT:	/* NAK */
@@ -830,6 +833,9 @@ static void cx231xx_bulk_irq_callback(struct urb *urb)
 	struct cx231xx *dev = container_of(vmode, struct cx231xx, video_mode);
 	unsigned long flags;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	switch (urb->status) {
 	case 0:		/* success */
 	case -ETIMEDOUT:	/* NAK */
@@ -895,7 +901,7 @@ void cx231xx_uninit_isoc(struct cx231xx *dev)
 		dev->video_mode.isoc_ctl.transfer_buffer[i] = NULL;
 	}
 
-	if (broken_pipe) {
+	if (broken_pipe && !(dev->state & DEV_DISCONNECTED)) {
 		cx231xx_isocdbg("Reset endpoint to recover broken pipe.");
 		usb_reset_endpoint(dev->udev, dev->video_mode.end_point_addr);
 	}
@@ -908,6 +914,9 @@ void cx231xx_uninit_isoc(struct cx231xx *dev)
 	dev->video_mode.isoc_ctl.num_bufs = 0;
 	dma_q->p_left_data = NULL;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	if (dev->mode_tv == 0)
 		cx231xx_capture_start(dev, 0, Raw_Video);
 	else
@@ -954,7 +963,7 @@ void cx231xx_uninit_bulk(struct cx231xx *dev)
 		dev->video_mode.bulk_ctl.transfer_buffer[i] = NULL;
 	}
 
-	if (broken_pipe) {
+	if (broken_pipe && !(dev->state & DEV_DISCONNECTED)) {
 		cx231xx_isocdbg("Reset endpoint to recover broken pipe.");
 		usb_reset_endpoint(dev->udev, dev->video_mode.end_point_addr);
 	}
@@ -967,6 +976,9 @@ void cx231xx_uninit_bulk(struct cx231xx *dev)
 	dev->video_mode.bulk_ctl.num_bufs = 0;
 	dma_q->p_left_data = NULL;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	if (dev->mode_tv == 0)
 		cx231xx_capture_start(dev, 0, Raw_Video);
 	else
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index 338e10148465..b51955f1dd30 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -260,6 +260,9 @@ static void cx231xx_irq_vbi_callback(struct urb *urb)
 	struct cx231xx *dev = container_of(vmode, struct cx231xx, vbi_mode);
 	unsigned long flags;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	switch (urb->status) {
 	case 0:		/* success */
 	case -ETIMEDOUT:	/* NAK */
@@ -328,6 +331,9 @@ void cx231xx_uninit_vbi_isoc(struct cx231xx *dev)
 	dev->vbi_mode.bulk_ctl.transfer_buffer = NULL;
 	dev->vbi_mode.bulk_ctl.num_bufs = 0;
 
+	if (dev->state & DEV_DISCONNECTED)
+		return;
+
 	cx231xx_capture_start(dev, 0, Vbi);
 }
 EXPORT_SYMBOL_GPL(cx231xx_uninit_vbi_isoc);

-- 
2.43.0


