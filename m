Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CA285058;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852716; cv=none; b=R0+1mqfXHufNsYOyyPnQLDTWCgc2HMmRS5buneomOjPWTGRCzTiRhnUWEIspRc4CL4rLcr/KHOYwJ+gLHsWW7bRdIyiRphaEL98A2sGnpMVvDolltSkeFibDxVrRm3Txp4bXTJC/HCFpEDaA9z2KJT2Kgt8A5vjCX24+SGl9wts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852716; c=relaxed/simple;
	bh=49hRGeJA5K9raDKlr6MHXea36nEmL7xchQhV5KXtNRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gd+HRFpPjsJXnN/kE72Q8+jG1ihRTvpd6hvl/U9iQ+rlTkbyKIKwhhqywe8ABiJ+Dya8L8Gnum20Gwumoqdu9zVEO1/KwHusvKPFVQ3MwMl52msRTitcPuEZdXMA8saB1M/CuzPMx+rJvxjpGfLMSjEvMTqwGQwBhbBJ2L4+hpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA3vJfvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA3vJfvk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B2A3C2BCF7;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787852715;
	bh=49hRGeJA5K9raDKlr6MHXea36nEmL7xchQhV5KXtNRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TA3vJfvkLfiyfQKL0ph42KMiFmhgc/ARWEemG8Hasp5rRVERoc4nQ6v5aHa2fG0we
	 8sqVR+HgdKRIkHDKVATqNLn8PZt0rGGza9sz+9YCTrsKlIWtV0trH0jK24l1/I0ICy
	 izl/asUy4xWIl3E13Tlxi0WUMSdpcaxZtURsQpNMAu3yqRSvZnq3RL2e2LfS8oWQpt
	 TYBsAHgd1rsjfTzNxW2fzOwzs93Whv6wiP1nJra94d06GuYfM8ypcorOT8kHoSn3Co
	 +tDm2Nde29aCIlxzR5r4VWLMsTYzBGeHxzLQTrV+V5ZDCbWiWPs/xUXS0bGfuzvILG
	 XXDFgj1Qgk0rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31359C61DC4;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
From: Nick Faro via B4 Relay <devnull+yux50000.hotmail.com@kernel.org>
Date: Thu, 27 Aug 2026 19:44:13 +0200
Subject: [PATCH 3/6] media: cx231xx: reject V4L2 operations after
 disconnect
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-cx231xx-disconnect-lifetime-v1-3-7bbf946bbd36@hotmail.com>
References: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
In-Reply-To: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Faro <yux50000@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787852712; l=5226;
 i=yux50000@hotmail.com; s=20260827; h=from:subject:message-id;
 bh=WUN+Os7QniMSebswPp2JQ6AqLYFuOZMfAt4jcJd3hok=;
 b=aqaY0I2Ks5ScoefqErcgF2lcgJNNCuFSx1MN+F9f7T2PxrIt6MhtY9AW5r0xFLuSJ1qaKbebL
 WjhkPFfAXYCByyxVcC6l77J+0lwzXPwt0zRInAgoRUCvKiM55CgiMZg
X-Developer-Key: i=yux50000@hotmail.com; a=ed25519;
 pk=FMSCCFHmUW8ylFpPOeaegUBqrRhzdMS2snqX/kNbLtM=
X-Endpoint-Received: by B4 Relay for yux50000@hotmail.com/20260827 with
 auth_id=979
X-Original-From: Nick Faro <yux50000@hotmail.com>
Reply-To: yux50000@hotmail.com

From: Nick Faro <yux50000@hotmail.com>

An open V4L2 file can outlive USB disconnect, and VB2 can invoke its
stop-streaming callback while releasing that file. The existing callbacks
continue into subdevice and USB commands even though the hardware is gone.

Reject new analog, VBI and MPEG opens or streams after disconnect. Let
stop and close callbacks return queued buffers and release file state, but
skip operations which require access to the disconnected device.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nick Faro <yux50000@hotmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c   | 41 ++++++++++++++++++++++++-------
 drivers/media/usb/cx231xx/cx231xx-vbi.c   |  5 ++++
 drivers/media/usb/cx231xx/cx231xx-video.c | 18 +++++++++++++-
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 2323584bf818..3a509e55f61d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1396,6 +1396,11 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
 	int ret = 0;
 
+	if (dev->state & DEV_DISCONNECTED) {
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+		return -ENODEV;
+	}
+
 	vidq->sequence = 0;
 	dev->mode_tv = 1;
 
@@ -1429,20 +1434,22 @@ static void stop_streaming(struct vb2_queue *vq)
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
 	unsigned long flags;
 
-	call_all(dev, video, s_stream, 0);
-
-	cx231xx_stop_TS1(dev);
+	if (!(dev->state & DEV_DISCONNECTED)) {
+		call_all(dev, video, s_stream, 0);
+		cx231xx_stop_TS1(dev);
+	}
 
 	/* do this before setting alternate! */
 	if (dev->USE_ISO)
 		cx231xx_uninit_isoc(dev);
 	else
 		cx231xx_uninit_bulk(dev);
-	cx231xx_set_mode(dev, CX231XX_SUSPEND);
-
-	cx231xx_api_cmd(dev, CX2341X_ENC_STOP_CAPTURE, 3, 0,
-			CX231xx_END_NOW, CX231xx_MPEG_CAPTURE,
-			CX231xx_RAW_BITS_NONE);
+	if (!(dev->state & DEV_DISCONNECTED)) {
+		cx231xx_set_mode(dev, CX231XX_SUSPEND);
+		cx231xx_api_cmd(dev, CX2341X_ENC_STOP_CAPTURE, 3, 0,
+				CX231xx_END_NOW, CX231xx_MPEG_CAPTURE,
+				CX231xx_RAW_BITS_NONE);
+	}
 
 	spin_lock_irqsave(&dev->video_mode.slock, flags);
 	if (dev->USE_ISO)
@@ -1593,9 +1600,25 @@ static int vidioc_log_status(struct file *file, void *priv)
 	return v4l2_ctrl_log_status(file, priv);
 }
 
+static int cx231xx_mpeg_open(struct file *file)
+{
+	struct cx231xx *dev = video_drvdata(file);
+	int ret;
+
+	if (mutex_lock_interruptible(&dev->lock))
+		return -ERESTARTSYS;
+	if (dev->state & DEV_DISCONNECTED)
+		ret = -ENODEV;
+	else
+		ret = v4l2_fh_open(file);
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
 static const struct v4l2_file_operations mpeg_fops = {
 	.owner	       = THIS_MODULE,
-	.open	       = v4l2_fh_open,
+	.open	       = cx231xx_mpeg_open,
 	.release       = vb2_fop_release,
 	.read	       = vb2_fop_read,
 	.poll          = vb2_fop_poll,
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index b51955f1dd30..6f28b969408f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -220,6 +220,11 @@ static int vbi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cx231xx_dmaqueue *vidq = &dev->vbi_mode.vidq;
 	int ret;
 
+	if (dev->state & DEV_DISCONNECTED) {
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+		return -ENODEV;
+	}
+
 	vidq->sequence = 0;
 	ret = cx231xx_init_vbi_isoc(dev, CX231XX_NUM_VBI_PACKETS,
 				    CX231XX_NUM_VBI_BUFS,
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 058e8eed2847..154bb4300392 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -767,6 +767,11 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct cx231xx_dmaqueue *vidq = &dev->video_mode.vidq;
 	int ret = 0;
 
+	if (dev->state & DEV_DISCONNECTED) {
+		return_all_buffers(dev, VB2_BUF_STATE_QUEUED);
+		return -ENODEV;
+	}
+
 	vidq->sequence = 0;
 	dev->mode_tv = 0;
 
@@ -791,7 +796,8 @@ static void stop_streaming(struct vb2_queue *vq)
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
 
-	call_all(dev, video, s_stream, 0);
+	if (!(dev->state & DEV_DISCONNECTED))
+		call_all(dev, video, s_stream, 0);
 	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
@@ -1499,6 +1505,10 @@ static int cx231xx_v4l2_open(struct file *filp)
 
 	if (mutex_lock_interruptible(&dev->lock))
 		return -ERESTARTSYS;
+	if (dev->state & DEV_DISCONNECTED) {
+		mutex_unlock(&dev->lock);
+		return -ENODEV;
+	}
 
 	ret = v4l2_fh_open(filp);
 	if (ret) {
@@ -1581,6 +1591,12 @@ static int cx231xx_close(struct file *filp)
 
 	_vb2_fop_release(filp, NULL);
 
+	if (dev->state & DEV_DISCONNECTED) {
+		--dev->users;
+		wake_up_interruptible(&dev->open);
+		return 0;
+	}
+
 	if (--dev->users == 0) {
 		/* Save some power by putting tuner to sleep */
 		call_all(dev, tuner, standby);

-- 
2.43.0


