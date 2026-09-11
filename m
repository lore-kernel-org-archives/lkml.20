Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F45678E4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156179; cv=none; b=rvfxyew9JVFub/7y3RYoO3nE0Sa7kocY8gFNHhmtglegHl57Seb1IagnaLgsgmzKg4oJouaO7iio+LN9y6mjfcjDYPUeR9j5vs+1Y+pb38VNXLHWih98sXWvFhzCjKjgV3BZUn9N7QiZy4vJqP7oiIYJJE5tFOOeRv2iGWIj3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156179; c=relaxed/simple;
	bh=bixuciEW2CXglJuCfbU2klhn2XdFr98KEkt5GDipyWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zu6/hDlTHudUiIe8bE0yBQGu51mQ/C2qW+bNY/x/g/ADpxFXJmlLd2ICb01DldtWhE3g6mU9Se8ooewajKQYPMlirGBwM73QxYSOiEm0QqMWQ8N00gTbBytmrppe6RgsycXBOIy9TlIE75AqugqUQxbdjVGWUaF4LqdrkPRaiHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4noeQWa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4noeQWa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so10072995e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156170; x=1789760970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7vNHc+PDcoqA7Nb9B7f6nJDa0YwMbh9jC5K9wOEGMs=;
        b=W4noeQWaDyu00LivU9V9A7Ew5eno2JhkJd5dcocFwwkgHUm2RUUqOXyvkoE66KeVof
         k5DekGQhnr0WIPyZHOeZhZb82Y/kjwXIo35JGXKFsM+4A7C6R3h8btrJweO1mc6ahCBm
         +MvposOMlvb99PyD9zxrp6pvi2AoztnWwypT8auh0/G83AaAKjSs16gCq9U85ADC+pvm
         5g6+WGwNdzFS0YIRAQ8bok9fJ4MtUDwvVhpxH9Bl9wjHWKqkLdYP3LzzABTq7bYfDASJ
         trP8aR1x2j4tCxl4VjN+1IWkV3MfvA4d9n3nHyYofpufKVvs5KyUp+S36JY1ezPI4TFV
         oD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156170; x=1789760970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7vNHc+PDcoqA7Nb9B7f6nJDa0YwMbh9jC5K9wOEGMs=;
        b=rU+uZqCFuu9CzzASOrUFmT/J/2LR/JeCSBFmVPj0vVKPTaaM1+xBkusClasxBH1mhb
         zC0MN3+opc2/1jv1kqf3YW6BA5/RPuNJ0APJH1SZwrqj5+iPnT7dhfLm460XWpJYYrvw
         UzzmsiaopJa7XMBKF+WpwwmcTiEkqVlMtiR+iHTpJV/9tezKGqWaTVQFK20ezReTW1LW
         AwmzS6Gxr07RhniSG7rQVzKT6SiDbmRTm1YG0LNIzdyKNm/ovuB0TjasFQxteEolJPRu
         bD+fAYgMLIiZfi22bs15JSxEJrfsX3/MyfOv5AB2WcOqnlf9OYA6mBO1U0Av9nFmYorK
         BDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4PU3bu3r3j5cfqGE8550vZ6FSXv3mbhM2a0KbwIKkyJRdpRaq6I2wlpJaBrz2o/XHGwBvpA1UeUd4aJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++k6l3VYPr2YafKjieLqkHBty0cmFJhb3sVwuk8zWvgm17/ge2J4
	avcmhQoZlGtJ8HiReBKQFGCCQEYMaoc4PjM4ed0Q/CzG2flvjC9ElP+L
X-Gm-Gg: AYBFou1gJ+A+CAkV75zm1IMoeYgMNN0UXfq6Pqu7hSMacM3r38+7+lnQjOws+w0lESL
	E9NDBr3Z7qEQkQVx7uIiBrjTU8pJo+oRjMTlLLEbDmccnCb1BM0CwDb9SYQ25rozWZ7IrB/eAW1
	Q1e/q8I+NiVxwnmBqQptqPjZdTJn75mv/5d3ZgseUHAqkPYCmeKASsoWhVYQLbVlNtog18Ztxjn
	NZlqia9lebY+9PYdDeDTCRTMr5cnlAEHmHbYfccsmSPjYWhh2owqghZ0oVWiO6rThy+MQ0GyZ1F
	XM+NZxUHXTeiI2egwjO7rfzPnk/i8K6Ae8GVXKCuyl+ulsbFdApHfGXfPeZdoCYAEpGCM85BT91
	TGTAPB4Ism7EMbjK2P+UqGvKXBiaBUpyFzkAAHLrnuPgPnx1U+dni2YI3RsFjEPYmBZOWjQERA6
	s17uatey/UUP/BszHPcYQBqxYmYyCe3T0knh+wng6QeHphk0afdiKLMre+O7cwbV2lSXefP6k9k
	qJc8Ud7NlKBX1Z9RJOkxJNgvuXeYMkcRzNcyPnR9QJqXAQ/go66lfaewkSkA0BASdkPpsaw4c3j
	68AGwSUCnYPsd8jeZDsj5YYbgx+aSEoLu2A7ckEuL2KiUiI16bQ/xMriCt1ybA79/NXHkKNH0hu
	Md6TCyFgotL2c9XDLCXaCX/JahYNEHfZxLdYfm039bga9D4MH
X-Received: by 2002:a05:600c:4455:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49e619bd1b2mr70461025e9.21.1789156169485;
        Fri, 11 Sep 2026 12:49:29 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:29 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 3/3] media: ipu6: Signal the video queues when a sensor is unbound
Date: Fri, 11 Sep 2026 21:48:54 +0200
Message-ID: <20260911194854.78894-4-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911194854.78894-1-nicfio@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_async_ops implements .bound() and .complete() but not .unbind(), so
nothing tells the ISYS video nodes that the sensor feeding them has gone
away. A capture that is streaming when the sensor is unbound stays
blocked in vb2_core_dqbuf() forever, waiting for a frame that can no
longer arrive:

  [<0>] vb2_core_dqbuf+0x362/0x1190 [videobuf2_common]
  [<0>] vb2_dqbuf+0xb4/0x210 [videobuf2_v4l2]
  [<0>] __video_do_ioctl+0x894/0xb30
  [<0>] video_usercopy+0x479/0xde0
  [<0>] v4l2_ioctl+0x198/0x220
  [<0>] __x64_sys_ioctl+0x134/0x1c0

The wait in __vb2_wait_for_done_vb() ends on a new buffer, on
!q->streaming, or on q->error. Tearing the sensor down sets none of the
three. The sleep is interruptible, so DETECT_HUNG_TASK stays quiet as
well and the process is simply stuck until something kills it.

Add the missing .unbind() and mark the queues of the CSI-2 receiver the
departing sensor was attached to, which is enough for DQBUF to return
-EIO. Only streaming queues are flagged: q->error is cleared by
__vb2_queue_cancel(), so flagging an idle queue would leave it in error
until the next VIDIOC_STREAMOFF.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) by unbinding the
sensor while v4l2-ctl was streaming, with both sensors of the machine.
Without this patch 3 attempts out of 3 hang; with it, 10 out of 10 wake
up, report "VIDIOC_DQBUF: failed: Input/output error" and exit. The same
run under KASAN reports nothing.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---

Unchanged since v1; the note below is new.

The check and the marking are deliberately not done under q->lock, and I
would rather say so than have it look like an oversight.

The lock of these queues is av->mutex (aq->vbq.lock, ipu6-isys-queue.c),
and taking it here is not possible as the teardown stands: isys_remove()
calls isys_unregister_devices() before isys_notifier_cleanup(), and the
former ends in ipu6_isys_video_cleanup() -> mutex_destroy(&av->mutex).
So on driver removal this callback runs after that mutex has been
destroyed, and taking it would be an OOPS with CONFIG_DEBUG_MUTEXES.

Without the lock there is a narrow race with a concurrent STREAMOFF (an
idle queue left flagged until the next STREAMOFF) or STREAMON (the hang
comes back). The unlocked read is safe in the removal path itself,
because vb2_video_unregister_device() has already released the queue
under the lock, so vb2_is_streaming() is false there and the loop does
nothing.

The proper fix looks like unregistering the notifier before the video
devices, which would also make teardown the mirror of setup --
isys_register_devices() registers the video devices first and inits the
notifier last, and its own error path unwinds in that order. I did not
put that in this series because I cannot build or test a kernel at the
moment, and changing the removal path untested seemed worse than leaving
this documented. I am happy to write it as a follow-up if you agree with
the direction.

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c9cdeb705..8055ae169 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/videobuf2-core.h>
 
 #include "ipu6-bus.h"
 #include "ipu6-cpd.h"
@@ -700,6 +701,45 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
 }
 
+/* The .unbind() notifier callback when a sub-device goes away */
+static void isys_notifier_unbind(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_connection *asc)
+{
+	struct ipu6_isys *isys =
+		container_of(notifier, struct ipu6_isys, notifier);
+	struct sensor_async_sd *s_asd =
+		container_of(asc, struct sensor_async_sd, asc);
+	struct ipu6_isys_csi2 *csi2;
+	unsigned int i;
+
+	if (s_asd->csi2.port >= isys->pdata->ipdata->csi2.nports)
+		return;
+
+	/*
+	 * The sensor is gone, so no more frames will ever arrive on the video
+	 * nodes fed by it. Tell videobuf2, or a DQBUF already blocked in
+	 * vb2_core_dqbuf() would sleep forever: nothing else in the teardown
+	 * path wakes that queue up.
+	 *
+	 * Only queues that are actually streaming are marked. The error flag
+	 * is only cleared by __vb2_queue_cancel(), so flagging an idle queue
+	 * would leave it poisoned until the next STREAMOFF.
+	 */
+	csi2 = &isys->csi2[s_asd->csi2.port];
+	for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
+		struct vb2_queue *q = &csi2->av[i].aq.vbq;
+
+		if (!vb2_is_streaming(q))
+			continue;
+
+		dev_dbg(&isys->adev->auxdev.dev,
+			"%s went away while streaming on %s\n", sd->name,
+			csi2->av[i].vdev.name);
+		vb2_queue_error(q);
+	}
+}
+
 static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct ipu6_isys *isys =
@@ -710,6 +750,7 @@ static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
 
 static const struct v4l2_async_notifier_operations isys_async_ops = {
 	.bound = isys_notifier_bound,
+	.unbind = isys_notifier_unbind,
 	.complete = isys_notifier_complete,
 };
 
-- 
2.47.3

