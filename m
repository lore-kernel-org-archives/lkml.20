Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842385;
	b=tZL7wJRhnMXzBEJat1k7ud0HOLCdHMBgaSCTliXzP+thCUXXZyqn8MWYsmSXhWuuiFHh
	 wKEx1LUUSy1InNWqSHBSiUy4B00LZ6gGhQKybn25gGBZN3v/XZA5hRhP6psbWZr0KamaA
	 Y2rhygQAkGjx6/ToeXkS7pHJmziMto6IJMs0cp0v1sSxKI6DDLMtdUowvHu1WFusjzNz6
	 MRDtr32i7DdZy1abTC9Tl9vE1v5rvUunS40/lBDom1HnA5egsSPjVSecRCQP2J2Mr+tM7
	 CkU/vkALv6XzMNWJqr/23m7MF2Kp8WEjDNHBkb+YP1Dc0EW7sGK5D1Ehqiw1i+Eyz7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842385;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+0DWvg0OFaSPG3fgwqeFldN+LB9jq50j/DrDSDMXWsA=;
	b=1hRI4o+Qecl5zSCAKH0RsQ4+X2BBxMtQ04mPpq63UR89eufzd7h0kTRcyeX7lhII2lbh
	 9N7afXq1ryKNYhtZCAGwqSl5XAV8J20pN1YyXe/RV7ixHB3hiSY4qoaz/kmCV54NPGZGY
	 GCkbIgmrzcNa2ID8alj70aymmzN88qcBLfm+CMQvKgqszBg/XHWczqjd+o9LoYxJmaqnC
	 aDn4RaNs6Asjne+rD/5gWLugph4D7+f7xIgww1YGPbP6Vv9lJ8/YYiGHACEUoVtDhFU6a
	 FZ1U6oWM8MJOGY4SGjhIm1Lv4fB4N5B16CmiWnzeaxjO2lX08PwwcvGJU69+Cj2nqUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NFTzHGzX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F3606A333;
	Mon, 16 Nov 2026 15:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506F3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NFTzHGzX
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5d79:c700:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B2FD5205A32;
	Mon, 16 Nov 2026 16:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0DWvg0OFaSPG3fgwqeFldN+LB9jq50j/DrDSDMXWsA=;
	b=NFTzHGzXXbcAl1UL3DFBIp8QDeGWkPZuxjXKmqxe4zXOIuCuFVCSbSrbyyWY+wqfIvUAoP
	IH1TQDUFvHwSLVTkAEZajKdHz5x8H9uvV75z3kYJao2bdFtlCFsVBd1YZ0qTji8ny94zgN
	wAUEAUS/U6I2pqy+F5h8FTF8YdQ8Kp4WwECKYPd91Yd9TD045D/FhlPFArAXxKRJFltIGd
	ncv1JUIaPkgp5L3b8ki7aQHOq4OaFKO8AIaVLUSbsr/vNGpIqIEndOgmzRA/Rjxd0RFWpr
	h1coeirkPQbfD6nOqGjiN+tJdHY3C1QVB1Jtfzl6YpiZRl3/RFTA3zNKPARwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794842379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0DWvg0OFaSPG3fgwqeFldN+LB9jq50j/DrDSDMXWsA=;
	b=Cv3445UjZLRDfd+ChKuJJSAGzBibxP2wwrpW3u9ZAH5+vpQSny2BDiHCCreZ3RvB7VCMha
	tO/g/a8W9D5ZUJWsku5X8STlOo/rugviKf7DzC10Vo/4YAZ3zUnVdfbBDJR3svtLgF45Hu
	6cQot1H26ykiAcsTzQtjL6rBgHInjeQBiONFFrfEME74NldhjISxVm8MTHday7wraPyr9U
	KU+98aShnAv9fmMopP09r8TQtdZCpd538sjBAbGXz4LKZLtwRhqMbtFU95qXpwOvHkPVYF
	wlqMLhj1quzrP/yslbuHJGXxVAZXzIZQSF6R+k/KYLP3DkGPo6pxaYa6zbCTkA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794842379; a=rsa-sha256;
	cv=none;
	b=dU2rfzMmQyGiaYuHQmYvbWSQDjUWwNHi2d8k/G6y6S0JWRlq+agrsWdaIP4aROE3gZ44OX
	YsiwUs0NNeTc2XLz/wAGm1/7CG+EQLGkzlWqLEZvNu0AU16B0emET6YjfYXwkAAucgOCab
	UL5yj2xS5N5UHv9meKMD2fNJlwdNpxItPIXSEsSMyEw7WhkpPyUVfqoCvw3OVMDhWI+4Ua
	Y3TDJ3qtfAMjT9DhF7/4KzTwgbtm9DufNk+JbhsPnDY9+XtGPxZzgeNCLmXCQn8lrXhhiW
	gRiRxInHJa7rpSs7YGEPjgzJqdK9EVK5xFUfGhA3cggTJsrNnARGHLD5Hhr13Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 16 Nov 2026 16:19:07 +0100
Subject: [PATCH v4 7/9] media: v4l2-device: wait for notifications when
 unregistering a subdev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-hdmirx-media-v4-7-7aee4a0a273e@pengutronix.de>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
In-Reply-To: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>, 
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842349; l=9200;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=TiZQ4Ffn1hymLudZXkjYUItg16sPMtsDDReGv/2En98=;
 b=YzjyNvLOA7+buFvvmA7UbYyj4r6Ap3F8zWYsFzB8zz1Ax3lxYhuuHrvnORZiV+XD53fail9ZR
 it8dExsFxqYC5m6ni02j7k2JVqtTqUpMcb7O8QVQ0a7z0+iosqbuecd
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
wait happens on every unregistration, whether or not the v4l2_device
has a notify callback, since the reader has to dereference v4l2_dev to
find out. It is cheap: notifications are rare, and synchronize_srcu()
expedites the first request when the SRCU domain looks idle.

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

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/driver-api/media/v4l2-subdev.rst |  8 +++--
 drivers/media/v4l2-core/v4l2-device.c          | 42 ++++++++++++++++++++++++++
 include/media/v4l2-device.h                    | 15 +++++----
 include/media/v4l2-subdev.h                    |  4 +++
 4 files changed, 60 insertions(+), 9 deletions(-)

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
index 67e3073de1321..0eb02860eac0b 100644
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
@@ -108,6 +115,16 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_device_unregister);
 
+/*
+ * Stop notifications to sd->v4l2_dev and wait for those in progress.
+ * Callbacks read sd->v4l2_dev, so it must stay set until this returns.
+ */
+static void v4l2_subdev_disable_notify(struct v4l2_subdev *sd)
+{
+	WRITE_ONCE(sd->notify_enabled, false);
+	synchronize_srcu(&v4l2_subdev_notify_srcu);
+}
+
 int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 				  struct v4l2_subdev *sd, struct module *module)
 {
@@ -131,6 +148,8 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 		return -ENODEV;
 
 	sd->v4l2_dev = v4l2_dev;
+	/* Pairs with smp_load_acquire() in v4l2_subdev_notify() */
+	smp_store_release(&sd->notify_enabled, true);
 	/* This just returns 0 if either of the two args is NULL */
 	err = v4l2_ctrl_add_handler(v4l2_dev->ctrl_handler, sd->ctrl_handler,
 				    NULL, true);
@@ -165,6 +184,7 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 	media_device_unregister_entity(&sd->entity);
 #endif
 error_module:
+	v4l2_subdev_disable_notify(sd);
 	if (!sd->owner_v4l2_dev)
 		module_put(sd->owner);
 	sd->v4l2_dev = NULL;
@@ -274,6 +294,8 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
 	list_del(&sd->list);
 	spin_unlock(&v4l2_dev->lock);
 
+	v4l2_subdev_disable_notify(sd);
+
 	if (sd->internal_ops && sd->internal_ops->unregistered)
 		sd->internal_ops->unregistered(sd);
 	sd->v4l2_dev = NULL;
@@ -293,3 +315,23 @@ void v4l2_device_unregister_subdev(struct v4l2_subdev *sd)
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
index 5796e52678b90..698fbf6c86eb8 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1019,6 +1019,9 @@ struct v4l2_subdev_platform_data {
  * @owner: The owner is the same as the driver's &struct device owner.
  * @owner_v4l2_dev: true if the &sd->owner matches the owner of @v4l2_dev->dev
  *	owner. Initialized by v4l2_device_register_subdev().
+ * @notify_enabled: v4l2_subdev_notify() reaches @v4l2_dev. Set on
+ *	registration and cleared before @v4l2_dev is, see
+ *	v4l2_device_unregister_subdev().
  * @flags: subdev flags. Can be:
  *   %V4L2_SUBDEV_FL_IS_I2C - Set this flag if this subdev is a i2c device;
  *   %V4L2_SUBDEV_FL_IS_SPI - Set this flag if this subdev is a spi device;
@@ -1076,6 +1079,7 @@ struct v4l2_subdev {
 	struct list_head list;
 	struct module *owner;
 	bool owner_v4l2_dev;
+	bool notify_enabled;
 	u32 flags;
 	struct v4l2_device *v4l2_dev;
 	const struct v4l2_subdev_ops *ops;

-- 
2.47.3

