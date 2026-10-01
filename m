Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B524A2A52;
	Thu,  1 Oct 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859344; cv=none; b=hi/ai/bkhSg+sbbGmWSIiPRvd3ms8WoZIcufxJ0PaFh7aLPchCdsWuDfNnes45mJ6A2evJSdDjTfXxDIQa6UbyOZ0pwX7rPFnGLXgsSXr2f/y9eNr2uyyeYqnWPyVSS7hXRBxx7Pzjg3VUdJlNeh4ydiOEr9BHEgF4IRpk80DWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859344; c=relaxed/simple;
	bh=9yscBsINFYk/upQ4hJY/64Pf8JRNTo9+nEycA2SxYIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUWVoxbEcv8LgwVa3+zb9g2fDPoHx/y7ppdDOLDHAWUG+nYr4LoqSG8BwXYmNWX97TPIxf6e8+UoC6YtQmpeakJowRVLrkJ49LgqdgIDN+jnc1ymetXJC4WGW0lxJH9C64ugIQWqVdd5kii7S6tZGZbgsNWYDIeTiwNe4keRc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZGYgjKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZGYgjKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F36A1F000FF;
	Thu,  1 Oct 2026 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859342;
	bh=Gxbu0TmzQbsIW1URMo7Utl8vXwGPGx+FmPPK8cmass8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BZGYgjKRJSK4feLLVipCXGB+G1auLA1zDT40pJ3HXY+p9Rgt/YEhDRICmCiFHj0+T
	 r+bYIgaGahvI7y3wx+hcuu8gxC8qFZFRf3l8eYNaf5zz1PIi0rWakgMS0XfsjNzh7s
	 dZP/MHOWJ4dgSEIpiGPBKdjwmWXvG52igKlq0SoW5dDXhC6NQrSyfB4zB7r0QrwRRG
	 QdZ/P1d5XaFd2hi7iLHG+e+noh5kkZBNJWCEf5wo0+F9fF2Pkwa5hDWMxePmWD0R6w
	 azda5p7krUT53XyhUKsx6HLRmk4SiaKB8TVZ4Mj3Xm+r06oJK5YWntUq8Nbo22zx2C
	 BcTFwm7EAXvwA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 01 Oct 2026 14:55:23 +0200
Subject: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=9yscBsINFYk/upQ4hJY/64Pf8JRNTo9+nEycA2SxYIE=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg/TsyZjeoNmz6x4NWRwjCK1GR8lsU6G+uTI
 mrkcJaoZhqJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPwAKCRAZDR20Zk4Z
 NQvWCADLtDTHBYnGqpjOfmYyRHiQXmj+cvKoT8e/J6mQK7gRqcmBQNUeQucYoK4g20fjgd8/4vx
 kj+ddr8dGhzodCrg3HrrR7VE081PiXqs9aBPpKb58bcc+pruLpdudqV5HdH0Hr96vI1Oae1vJ6Q
 YP6lMTV6nFWqNfyLPvu0veeUC7BbDyAy15pZaFNWJr9exlbVwl5ocIfcwhKWyPhFhsWn34Bhxiv
 OanWaTlMqUybTn3uqcdhvNKh0Ru9wriI+DOfUoSCuYRjsSRP4zU3NIiuiNfzKJNwYHGKzJ6Z/eZ
 sceFVxK3ziqYORuq5wFAjDWNBM+DQg+fQkPTSj5hqKEwSnJS
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Userspace needs to be notified when a sensor connection status
changes (e.g. disconnected at boot, then later reconnected) so it can
react accordingly.

Add periodic polling using a delayed work that calls .detect() every
2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
This mirrors the approach used by DRM connectors in output_poll_execute().

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e198d3fe99c6..76e578a8eab5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/workqueue.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -374,6 +375,9 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	struct delayed_work detect_work;
+	enum v4l2_subdev_connected_status_whence detect_status;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	return ret;
 }
 
+#define IMX219_DETECT_INTERVAL_MS 2000
+static void imx219_detect_work(struct work_struct *work)
+{
+	struct imx219 *imx219 = container_of(work, struct imx219,
+					     detect_work.work);
+	struct v4l2_subdev_connected_status status = {};
+
+	/*
+	 * All async notifiers should have been run before
+	 * we can use sd.devnode
+	 */
+	if (!imx219->sd.devnode)
+		goto reschedule_detect_work;
+
+	imx219_detect(&imx219->sd, &status);
+
+	if (status.status != imx219->detect_status) {
+		struct device *dev = &imx219->sd.devnode->dev;
+		char *envp[] = { "HOTPLUG=1", NULL };
+
+		imx219->detect_status = status.status;
+		kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
+	}
+
+reschedule_detect_work:
+	schedule_delayed_work(&imx219->detect_work,
+			      msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
+}
+
 static int imx219_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
+	INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
+	schedule_delayed_work(&imx219->detect_work,
+			      msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
+
 	return 0;
 
 error_subdev_cleanup:
@@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct imx219 *imx219 = to_imx219(sd);
 
+	cancel_delayed_work_sync(&imx219->detect_work);
+
 	v4l2_async_unregister_subdev(sd);
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);

-- 
2.55.0

