Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279932F749;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852716; cv=none; b=FTujRDKIM/KeDuXZEH+hWACHaxRIdDjkZNEL/ZVtG8hMPZicoXTnFm+u0LPAQwAb7SCDRfRsuyIqFbEXgpkcKYRoDwuJhoOhBtEYU241iJUqEQJ5L8A7qvaH6s59UcHUGPMgmukZmMjIoCWDjWPYswmeef8cMyYzfOr5aN7k1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852716; c=relaxed/simple;
	bh=iU1lx59IPAGOqCIDngai7VZTcW11MzqHcWxhFppTU/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm8xKZM+vzC1PzkAG3XTXg0ord/ZeScMN1xWWD3GwjZCcTuPxV9xx0xsSELJV5d+NoYtU/+IKbHO5IF7WtEU2MWx8BGLD+1h0Cfe/ogzJvwXPmTDAG87OmtLBBrpiPSNB9xqxtTD/is0809zpzaMIcmXRUWMlXoWoQ1ASFu2pLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Grd53+SD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Grd53+SD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E8AC2BCFC;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787852715;
	bh=iU1lx59IPAGOqCIDngai7VZTcW11MzqHcWxhFppTU/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Grd53+SDRTjP7hb1kORXCrfhayLcZNwh/FwwkLpyau8y+9PswWLsn+qb6xvNE4xA4
	 7pJCqvnnu3Mo2eCtyLeDhBp16xlUW5sqCVQWa1R1INo7LimQgwYrhrb3dlDQ5w73l/
	 FP0x5Niq+s5IImK9LiaUWT+NORN/3Usy0dT3YoBILWhRVijPlTlGeWpQ5O9z0HhK6y
	 UmSM3YnltLVZUS359uJJuvJrsXMu0LUyGzMzv1RsUPQ523wOq/nDFAYak+oy3Eup70
	 MVL92p2WJmDxVMkxaycMuTYDqm9XMDeF0QyQQycScQldTy6vC4LYci1mRDmPNCmiOm
	 EqZzWkpW4BQxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED84C61DD3;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
From: Nick Faro via B4 Relay <devnull+yux50000.hotmail.com@kernel.org>
Date: Thu, 27 Aug 2026 19:44:14 +0200
Subject: [PATCH 4/6] media: cx231xx: make ALSA teardown disconnect-safe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-cx231xx-disconnect-lifetime-v1-4-7bbf946bbd36@hotmail.com>
References: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
In-Reply-To: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Faro <yux50000@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787852712; l=3100;
 i=yux50000@hotmail.com; s=20260827; h=from:subject:message-id;
 bh=2wJ7fv8GuAFzsZR7lLL6TpM9/IcmchnjsNHHBj9K50o=;
 b=oo4zrYhdeUJ7VUQxDmUUJjozwjG0+7VrfPlglj1FLeSZ/YhyF2DETdgIdlDDkLPqSXnuIgfF4
 RM8jj4GPt70BaO3VclaTVIhz5wz7NUMc/QwXlHFOZwvbcGZZDMOzGAd
X-Developer-Key: i=yux50000@hotmail.com; a=ed25519;
 pk=FMSCCFHmUW8ylFpPOeaegUBqrRhzdMS2snqX/kNbLtM=
X-Endpoint-Received: by B4 Relay for yux50000@hotmail.com/20260827 with
 auth_id=979
X-Original-From: Nick Faro <yux50000@hotmail.com>
Reply-To: yux50000@hotmail.com

From: Nick Faro <yux50000@hotmail.com>

The ALSA card and an open PCM file can outlive the USB interface. Work
items, PCM callbacks and close currently remain able to touch the hardware
after disconnect, and card teardown does not actively disconnect userspace.

Disconnect the ALSA card and stop its stream and transfers. Cancel its
trigger work before deferring the final card release. Make late PCM
callbacks report the disconnected state and let close release software
state without issuing hardware commands.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nick Faro <yux50000@hotmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-audio.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index dd819a546af9..a10b887edf51 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -448,10 +448,17 @@ static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 		return -ENODEV;
 	}
 
-	dev_dbg(dev->dev, "closing device\n");
-
 	/* inform hardware to stop streaming */
 	mutex_lock(&dev->lock);
+	dev->adev.capture_pcm_substream = NULL;
+	if (dev->state & DEV_DISCONNECTED) {
+		dev->adev.users--;
+		mutex_unlock(&dev->lock);
+		cancel_work_sync(&dev->wq_trigger);
+		return 0;
+	}
+
+	dev_dbg(dev->dev, "closing device\n");
 	ret = cx231xx_capture_start(dev, 0, Audio);
 
 	/* set alternate setting for audio interface */
@@ -485,6 +492,9 @@ static int snd_cx231xx_prepare(struct snd_pcm_substream *substream)
 {
 	struct cx231xx *dev = snd_pcm_substream_chip(substream);
 
+	if (dev->state & DEV_DISCONNECTED)
+		return -ENODEV;
+
 	dev->adev.hwptr_done_capture = 0;
 	dev->adev.capture_transfer_done = 0;
 
@@ -495,6 +505,14 @@ static void audio_trigger(struct work_struct *work)
 {
 	struct cx231xx *dev = container_of(work, struct cx231xx, wq_trigger);
 
+	if (dev->state & DEV_DISCONNECTED) {
+		if (dev->USE_ISO)
+			cx231xx_isoc_audio_deinit(dev);
+		else
+			cx231xx_bulk_audio_deinit(dev);
+		return;
+	}
+
 	if (atomic_read(&dev->stream_started)) {
 		dev_dbg(dev->dev, "starting capture");
 		if (is_fw_load(dev) == 0)
@@ -545,6 +563,8 @@ static snd_pcm_uframes_t snd_cx231xx_capture_pointer(struct snd_pcm_substream
 	snd_pcm_uframes_t hwptr_done;
 
 	dev = snd_pcm_substream_chip(substream);
+	if (dev->state & DEV_DISCONNECTED)
+		return SNDRV_PCM_POS_XRUN;
 
 	spin_lock_irqsave(&dev->adev.slock, flags);
 	hwptr_done = dev->adev.hwptr_done_capture;
@@ -689,6 +709,13 @@ static int cx231xx_audio_fini(struct cx231xx *dev)
 	if (dev->adev.sndcard) {
 		card = dev->adev.sndcard;
 		dev->adev.sndcard = NULL;
+		snd_card_disconnect(card);
+		atomic_set(&dev->stream_started, 0);
+		cancel_work_sync(&dev->wq_trigger);
+		if (dev->USE_ISO)
+			cx231xx_isoc_audio_deinit(dev);
+		else
+			cx231xx_bulk_audio_deinit(dev);
 		snd_card_free_when_closed(card);
 	}
 

-- 
2.43.0


