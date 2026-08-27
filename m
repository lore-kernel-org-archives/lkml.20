Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DCC4A33E6;
	Thu, 27 Aug 2026 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852716; cv=none; b=c83886W7Mwc2yF61Bw9WpqbPxsnpsysuUkNbjFLB2PW6vYv0Nyl/DAV+5H3tvCmbD9RjX34ACaXEXD1GO9nR3hDdd5G/9XsKHNWPV7oBAXFiNwWfTw05Cpm2q9Rl+g+xWp2aY0oBsl2gZfrE44jFisupXYK2TDGpvks0bHNu9gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852716; c=relaxed/simple;
	bh=XHM40DblLd0zIUb9AIb+d0er/7ZzbUhvpS2O6PBcn5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtBptL6gIi71urMql5BrBd58eC4nnQrpURQjxYvdJezqpu3z7dhILiAWkckMGscEl98xjMYU6wPfRGttsd55dj8+4zGkvfK3HzvhQuZDkcM9LjslXVn1pE+Qbc5YZIox64jMh6An8n8BKefmxq1Pni1/sTCmZ6Y2Gci2vyGDZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/Zl48jy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/Zl48jy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F518C2BCFB;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787852715;
	bh=XHM40DblLd0zIUb9AIb+d0er/7ZzbUhvpS2O6PBcn5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j/Zl48jye6zuxdh5fPNeqvDSbAKwSV7qgX3qT6tfKT4QwiyTw+j/EZyafzrBxiXaZ
	 Nv4p/C+r/6zqgaeUSgo7Iy9/vOo22Qjo54BRgokTFlihUBCTSitU6lojXhnY1LJ9ck
	 c/pCxB3cWD7Kd7jVVaoiBXPx1GEaBK5mxhOy4MJZcuU+h+COn/PyqrwgWNej6Lhrxt
	 5yTIXs7k0iNtnN5iXdFU0Dgqj5hlas34NG7xlpo2rdvfK0pyS8/08TV/XItx6zRxCp
	 aokUUsmh0/SVgj913frcapUll8RC0NVjzI7fsFvWJ6K7/sGErxkytqoA+M2zqqTd4y
	 vLSW5lZMWRcQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D368C61DCD;
	Thu, 27 Aug 2026 17:45:15 +0000 (UTC)
From: Nick Faro via B4 Relay <devnull+yux50000.hotmail.com@kernel.org>
Date: Thu, 27 Aug 2026 19:44:15 +0200
Subject: [PATCH 5/6] media: cx231xx: always unregister nodes on USB
 disconnect
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-cx231xx-disconnect-lifetime-v1-5-7bbf946bbd36@hotmail.com>
References: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
In-Reply-To: <20260827-cx231xx-disconnect-lifetime-v1-0-7bbf946bbd36@hotmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Faro <yux50000@hotmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787852712; l=5250;
 i=yux50000@hotmail.com; s=20260827; h=from:subject:message-id;
 bh=lfYMdUVPkBvAiiFLQfWpvqyr8TfO0f8rtCgH5KZb5Kk=;
 b=QcsLRD7jwBhZLD3x9enMGFZKq90mt713EljTrvGk0P4MwqGVCBZViLyEhidR+GLnjZieYsSA0
 1WoRYO08rwyDwEOkDm+Nh7ZfKcXMcsMWehf4Rb9Hf1g/K7OpFaENMeE
X-Developer-Key: i=yux50000@hotmail.com; a=ed25519;
 pk=FMSCCFHmUW8ylFpPOeaegUBqrRhzdMS2snqX/kNbLtM=
X-Endpoint-Received: by B4 Relay for yux50000@hotmail.com/20260827 with
 auth_id=979
X-Original-From: Nick Faro <yux50000@hotmail.com>
Reply-To: yux50000@hotmail.com

From: Nick Faro <yux50000@hotmail.com>

The disconnect path skips cx231xx_release_resources() whenever an analog
video file is open. No close path performs the deferred teardown, so the
V4L2 nodes and I2C adapters remain registered and a later probe collides
with the stale instance. The users counter also does not cover MPEG, ALSA
or other framework references.

Always unregister every device node and subsystem during disconnect. Use
the VB2 unregister helper for queue-backed nodes so active streams are
stopped, and serialize disconnection against in-flight file operations.
The v4l2_device references now keep the backing memory alive until old
file handles close.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nick Faro <yux50000@hotmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-417.c   |  2 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c | 11 +++++------
 drivers/media/usb/cx231xx/cx231xx-video.c | 10 +++++-----
 drivers/media/usb/cx231xx/cx231xx.h       |  1 +
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 3a509e55f61d..9bda68666b05 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1672,7 +1672,7 @@ void cx231xx_417_unregister(struct cx231xx *dev)
 	dprintk(3, "%s()\n", __func__);
 
 	if (video_is_registered(&dev->v4l_device)) {
-		video_unregister_device(&dev->v4l_device);
+		vb2_video_unregister_device(&dev->v4l_device);
 	}
 }
 
diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 1b1e7bca4c6d..8e23de4cddf8 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1946,7 +1946,6 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	cx231xx_close_extension(dev);
 	cx231xx_ir_exit(dev);
 	cx231xx_release_analog_resources(dev);
-	cx231xx_417_unregister(dev);
 	cx231xx_remove_from_devlist(dev);
 	cx231xx_dev_uninit(dev);
 err_init:
@@ -1970,7 +1969,8 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 /*
  * cx231xx_usb_disconnect()
  * called when the device gets disconnected
- * video device will be unregistered on v4l2_close in case it is still open
+ * Device nodes are unregistered immediately. Their backing memory remains
+ * alive until the last open file descriptor is closed.
  */
 static void cx231xx_usb_disconnect(struct usb_interface *interface)
 {
@@ -1997,7 +1997,7 @@ static void cx231xx_usb_disconnect(struct usb_interface *interface)
 
 	if (dev->users) {
 		dev_warn(dev->dev,
-			 "device %s is open! Deregistration and memory deallocation are deferred on close.\n",
+			 "device %s is open; disconnecting it now\n",
 			 video_device_node_name(&dev->vdev));
 
 		/* Even having users, it is safe to remove the RC i2c driver */
@@ -2007,17 +2007,16 @@ static void cx231xx_usb_disconnect(struct usb_interface *interface)
 			cx231xx_uninit_isoc(dev);
 		else
 			cx231xx_uninit_bulk(dev);
+		cx231xx_uninit_vbi_isoc(dev);
 		wake_up_interruptible(&dev->wait_frame);
 		wake_up_interruptible(&dev->wait_stream);
-	} else {
 	}
 
 	cx231xx_close_extension(dev);
 
 	mutex_unlock(&dev->lock);
 
-	if (!dev->users)
-		cx231xx_release_resources(dev);
+	cx231xx_release_resources(dev);
 }
 
 static struct usb_driver cx231xx_usb_driver = {
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 154bb4300392..c8c460da2b9a 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1561,21 +1561,21 @@ void cx231xx_release_analog_resources(struct cx231xx *dev)
 
 	/*FIXME: I2C IR should be disconnected */
 
+	if (dev->board.has_417)
+		cx231xx_417_unregister(dev);
+
 	if (video_is_registered(&dev->radio_dev))
 		video_unregister_device(&dev->radio_dev);
 	if (video_is_registered(&dev->vbi_dev)) {
 		dev_info(dev->dev, "V4L2 device %s deregistered\n",
 			video_device_node_name(&dev->vbi_dev));
-		video_unregister_device(&dev->vbi_dev);
+		vb2_video_unregister_device(&dev->vbi_dev);
 	}
 	if (video_is_registered(&dev->vdev)) {
 		dev_info(dev->dev, "V4L2 device %s deregistered\n",
 			video_device_node_name(&dev->vdev));
 
-		if (dev->board.has_417)
-			cx231xx_417_unregister(dev);
-
-		video_unregister_device(&dev->vdev);
+		vb2_video_unregister_device(&dev->vdev);
 	}
 }
 
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036a78d7..8fb1eb9d600e 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -873,6 +873,7 @@ void cx231xx_stop_TS1(struct cx231xx *dev);
 void cx231xx_start_TS1(struct cx231xx *dev);
 void cx231xx_uninit_isoc(struct cx231xx *dev);
 void cx231xx_uninit_bulk(struct cx231xx *dev);
+void cx231xx_uninit_vbi_isoc(struct cx231xx *dev);
 int cx231xx_set_mode(struct cx231xx *dev, enum cx231xx_mode set_mode);
 int cx231xx_unmute_audio(struct cx231xx *dev);
 int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size);

-- 
2.43.0


