Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350647F3C9;
	Thu, 24 Sep 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251573; cv=pass; b=M5JpJo+o+CH1CayXhjnrytT+vqSpYouv/WTq+Hw2dAsFXJM5eCdH60CrShj3uBgYfu8lJ9EUGM7fyDkr+287Y4fhAZ+nQM8DCU7CDZSnIug5Jg7zRSRa3uePWh4vaOs0eQYY8pALu4w6TJHnQGPLt8Hy7mlERt4CCryz6OUg2bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251573; c=relaxed/simple;
	bh=XP3zumD/L1QQpquR189fzAX3qTcEJxNHjGTIGMrIrfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMonX2OOySbFS3wfQaZFRKV6GHpyc/WjTXuRIbqABYLMM+X+CJzD6aqWMVlr/syVn23rD7W27l/PZhjT1hs00tSngV4F6qaCcsGFrEJEsILIlRhcYo1rVZDPjrjuA2hD0nmCTRz8vzdmMp0iu36giuSIOA4s25AsM3v7kk3PlTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=IqTAQ5vx; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="IqTAQ5vx"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7180F20216B;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7PtOpKLfrElEMFnnpHNPtWOSa+HXAudL+cApfGFjcg=;
	b=IqTAQ5vxJ3fTb+roTTdR+vKvY1dGMFXoB+sGhNRGEbc2209YgckNjka70W6EpCXAX5GlH6
	/ECiBcqzCaDbH+o1K0FSRzyIoOj+YypIlQ9HdlJOV1dhINUt8n+LPFEmjpzu0ucyiCRiEo
	KNTodTr9WnjjFT3922xb5eMyHmjqFWy0cDoRMlXIWfuuXk2ITO1vX+HqpKQJ4YP5rmZ1/H
	a6+S2nctOV/jvohqXyzfxFQp2kp0rjtYQJmdkApUrtGnKQGSNwzADDZo5M8KGb8j3I4QSv
	QhhnAioBF7/DyapuvU/roXwyTsggbkKT67GC1jIws+YuKm+43jOryPe0ss+Wfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7PtOpKLfrElEMFnnpHNPtWOSa+HXAudL+cApfGFjcg=;
	b=BPllabdC1n/4NT+mILuN91SSk9WNQp2iPkXvrV0ipLiZlYKCjMFZb4nWrVcHt1q9jAdcy4
	sFvmscIY5z7I37CDrYDWkpmlschundhNEhJdQxwQFCeapIO/gbmT7iFNOy+LdVL6SXHCas
	fVG3trHmMw/j0hFBeu2MPIVZjULclDS+OkUfJGX1oG1UvtF2jOWrguS2nQ/BxRQynV3E43
	tIltZNlPCpF+g7CVlJZ/KFbz2xJroINUtUU05Ep/v3pDZ/xAoxiZSsLnYQfGIn4pHXsJPt
	tv2m+kiPsyJMML+33pn90zyxs7HhuoW58xMBSfktWjW+bPSENriMTHOseGCq1A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=AjDdXKHL+mXlCBOy4s7m+e7xuTrFvyGxANOEPNchYroXNxuN8A6Vzs2+2iFRwKe+9gexKa
	yViRlrRwahyvZD45Eyf5wgIEqCSI7LBUNVoj48CsGcUZ/O3qPmaOlxBT9m34YNRW+KCDKe
	sNm+8ks2xEHLyylVGRGGR9gqJzde3g/yIZepJmelsty3HSYsGNS72zOFt7AgFxXQSgU1/9
	AB50/oWZH4ccT/UMMJuJaLSFIEmJRrrkrHiyg/86TaQK1jJWUJAxkMadMBPZKZMlKZdUJz
	Iwps0IWi7JoEplJANyfBpBcmaeJWd8xfWbGKGky6TTfbldNPRUZi5eXa0Ll8kQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:06:01 +0200
Subject: [PATCH v2 7/9] media: v4l2-device: wait for notifications when
 unregistering a subdev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-7-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
In-Reply-To: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=9082;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=XP3zumD/L1QQpquR189fzAX3qTcEJxNHjGTIGMrIrfQ=;
 b=DLz2CsTO6MN7LSYkoaB4fo43jDNDrlEQ/84JnMz7eKKNytkkrRZZWvwbkTs8HbNT/WrFeLAEv
 QBa5Yk2NcoeADDP2ZK4FTmKjFOp3y5Ec1e0MZoGRpFYDvM1jZ9JXnip
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

v4l2_subdev_notify() reads sd->v4l2_dev without synchronizing with
v4l2_device_unregister_subdev(), which clears it. A subdev notifies from
its own interrupt handler or work item, and when it is bound
asynchronously that runs independently of the bridge driver, which can
unbind it at any time. A notification racing with the unbind then
either dereferences a NULL v4l2_dev, since the inline helper reloads it
after its check and nearly every notify callback reloads it once more
for container_of(), or calls into a bridge that has already torn down.
adv7180, tc358743 and lt6911uxe send V4L2_EVENT_SOURCE_CHANGE this way
to rcar-vin and rp1-cfe, both of which install a notify callback.

Protect the call with SRCU. A plain RCU read side will not do because
some callbacks sleep, such as cobalt's, which takes a mutex, while
other notifications come from hard interrupt context, cx23885 IR and
imx-media-fim among them. SRCU allows both.

The callbacks read sd->v4l2_dev themselves, so clearing it and then
waiting is not enough. Add sd->notify_enabled, clear that first, wait
for the readers, and only then let v4l2_device_unregister_subdev() go
on to clear v4l2_dev. The registration error path does the same. The
grace period is only waited for when the v4l2_device has a notify
callback, which few do.

The callback runs under the read side while the unregistering side
waits, so it must not wait for anything the unregistering thread may
hold: a mutex held by the caller of v4l2_device_unregister_subdev(),
the driver core's device lock, or v4l2-async's list_lock, which is held
across unbinding. Only sleeping locks matter, as a spinlock cannot be
held across the wait. The only existing callbacks that take one are
cobalt's, which takes pci_lock around a register update, and cx23885's,
which for the cx25840 IR block runs the IR work handler directly and
ends up in cx25840's rx_params_lock. Neither lock is held across subdev
unregistration. Lockdep models the SRCU read side and synchronize_srcu(),
so a callback breaking the rule is reported.

Document the rule, and bring the notify description in v4l2-subdev.rst up
to date: the helper has not been a macro returning an error for a long
time.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/driver-api/media/v4l2-subdev.rst |  8 +++--
 drivers/media/v4l2-core/v4l2-device.c          | 43 ++++++++++++++++++++++++++
 include/media/v4l2-device.h                    | 15 +++++----
 include/media/v4l2-subdev.h                    |  4 +++
 4 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 13aec460e802f..2e8ced276d212 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -345,9 +345,11 @@ e.g. AUDIO_CONTROLLER and specify that as the group ID value when calling
 that needs it.
 
 If the sub-device needs to notify its v4l2_device parent of an event, then
-it can call ``v4l2_subdev_notify(sd, notification, arg)``. This macro checks
-whether there is a ``notify()`` callback defined and returns ``-ENODEV`` if not.
-Otherwise the result of the ``notify()`` call is returned.
+it can call ``v4l2_subdev_notify(sd, notification, arg)``. This calls the
+``notify()`` callback of the v4l2_device the sub-device is registered with, if
+there is one, and does nothing otherwise. Once
+``v4l2_device_unregister_subdev()`` returns, the callback is no longer running
+for that sub-device and will not be called for it again.
 
 V4L2 sub-device userspace API
 -----------------------------
diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 67e3073de1321..5d7b7badaf2d0 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -10,10 +10,17 @@
 #include <linux/ioctl.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 
+/*
+ * Subdevs notify from their own context, unsynchronized with the bridge
+ * unregistering them. Readers hold this while calling into the bridge.
+ */
+DEFINE_STATIC_SRCU(v4l2_subdev_notify_srcu);
+
 int v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev)
 {
 	if (v4l2_dev == NULL)
@@ -108,6 +115,17 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_device_unregister);
 
+/*
+ * Stop notifications to sd->v4l2_dev and wait for those in progress.
+ * Callbacks read sd->v4l2_dev, so it must stay set until this returns.
+ */
+static void v4l2_subdev_disable_notify(struct v4l2_subdev *sd)
+{
+	WRITE_ONCE(sd->notify_enabled, false);
+	if (sd->v4l2_dev->notify)
+		synchronize_srcu(&v4l2_subdev_notify_srcu);
+}
+
 int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 				  struct v4l2_subdev *sd, struct module *module)
 {
@@ -131,6 +149,8 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 		return -ENODEV;
 
 	sd->v4l2_dev = v4l2_dev;
+	/* Pairs with smp_load_acquire() in v4l2_subdev_notify() */
+	smp_store_release(&sd->notify_enabled, true);
 	/* This just returns 0 if either of the two args is NULL */
 	err = v4l2_ctrl_add_handler(v4l2_dev->ctrl_handler, sd->ctrl_handler,
 				    NULL, true);
@@ -165,6 +185,7 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	media_device_unregister_entity(&sd->entity);
 #endif
 error_module:
+	v4l2_subdev_disable_notify(sd);
 	if (!sd->owner_v4l2_dev)
 		module_put(sd->owner);
 	sd->v4l2_dev = NULL;
@@ -274,6 +295,8 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 	list_del(&sd->list);
 	spin_unlock(&v4l2_dev->lock);
 
+	v4l2_subdev_disable_notify(sd);
+
 	if (sd->internal_ops && sd->internal_ops->unregistered)
 		sd->internal_ops->unregistered(sd);
 	sd->v4l2_dev = NULL;
@@ -293,3 +316,23 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 		v4l2_subdev_release(sd);
 }
 EXPORT_SYMBOL_GPL(v4l2_device_unregister_subdev);
+
+void v4l2_subdev_notify(struct v4l2_subdev *sd, unsigned int notification,
+			void *arg)
+{
+	struct v4l2_device *v4l2_dev;
+	int idx;
+
+	if (!sd)
+		return;
+
+	idx = srcu_read_lock(&v4l2_subdev_notify_srcu);
+	/* Pairs with smp_store_release() in __v4l2_device_register_subdev() */
+	if (smp_load_acquire(&sd->notify_enabled)) {
+		v4l2_dev = sd->v4l2_dev;
+		if (v4l2_dev->notify)
+			v4l2_dev->notify(sd, notification, arg);
+	}
+	srcu_read_unlock(&v4l2_subdev_notify_srcu, idx);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_notify);
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 25f69b1b8db03..cd3883e911840 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -234,13 +234,16 @@ v4l2_device_register_ro_subdev_nodes(struct v4l2_device *v4l2_dev)
  *	type is driver-specific.
  * @arg: arguments for the notification. Those are specific to each
  *	notification type.
+ *
+ * May be called from any context, including hard interrupts; the
+ * &v4l2_device.notify callback has to cope with the caller's context.
+ * Unregistering @sd waits for callbacks already running. The callback must
+ * therefore not wait for anything the unregistering thread may hold, such
+ * as a mutex held by the caller of v4l2_device_unregister_subdev() or the
+ * v4l2-async notifier lock.
  */
-static inline void v4l2_subdev_notify(struct v4l2_subdev *sd,
-				      unsigned int notification, void *arg)
-{
-	if (sd && sd->v4l2_dev && sd->v4l2_dev->notify)
-		sd->v4l2_dev->notify(sd, notification, arg);
-}
+void v4l2_subdev_notify(struct v4l2_subdev *sd, unsigned int notification,
+			void *arg);
 
 /**
  * v4l2_device_supports_requests - Test if requests are supported.
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f848..c1483a85d0c72 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -997,6 +997,9 @@ struct v4l2_subdev_platform_data {
  * @owner: The owner is the same as the driver's &struct device owner.
  * @owner_v4l2_dev: true if the &sd->owner matches the owner of @v4l2_dev->dev
  *	owner. Initialized by v4l2_device_register_subdev().
+ * @notify_enabled: v4l2_subdev_notify() reaches @v4l2_dev. Set on
+ *	registration and cleared before @v4l2_dev is, see
+ *	v4l2_device_unregister_subdev().
  * @flags: subdev flags. Can be:
  *   %V4L2_SUBDEV_FL_IS_I2C - Set this flag if this subdev is a i2c device;
  *   %V4L2_SUBDEV_FL_IS_SPI - Set this flag if this subdev is a spi device;
@@ -1054,6 +1057,7 @@ struct v4l2_subdev {
 	struct list_head list;
 	struct module *owner;
 	bool owner_v4l2_dev;
+	bool notify_enabled;
 	u32 flags;
 	struct v4l2_device *v4l2_dev;
 	const struct v4l2_subdev_ops *ops;

-- 
2.47.3

