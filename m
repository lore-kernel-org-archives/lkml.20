Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791E624DCF9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175020; cv=none; b=tQz8HacbwgTsRHySsuslufXhcAA+NMrmKShFnaoMw+NnZ+bgCp5GBRNyaiseBbqCvsvD5r0RtcdY0Of8ZV4OfrZuBbizL1iI0Pp+2aLKq2Ae1ZyWfZxf6LBqWAzEyyf5AqDOG+JZws5DfVZb5gsw1VCI0X5FzF5zXRObMxpYCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175020; c=relaxed/simple;
	bh=pGNKxrjCNphcniCv8tBdF8SNvI9xRkFNxjSxF74Ecjk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n8mJM5FeSN/MyqSB4Z5bdtnU09ffaVknhcaMQni3Oozo5ZkqdOoSRr+uVYeqFvAUWcYYujEwI4fg6npMISnib/7JaConVI6Ppc1gkQJtVr9dOcto60HM3wbySUP03maGWdH8dmkid05AIbcBLMYPTfzRx7Ok19qOLh3x5HG7Jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8048c813cceso1670175a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175017; x=1789779817;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=na/b8wxbKAfp1iA2ziFelOwLQ+W1QKRALCqAyIvdeOg=;
        b=OJXwsy3v+mRHclgMxE2sUHcqSmlFvY11U8o7xxaj6Cn9ksV5r1vPvRPFONUWGrspLE
         +bw3EY0RSVXL7LSmS4S4gdaLfkWYVZpKCMKdEI+VgXYyAuyNwNawUZatWT1GNCMCnrKA
         T9SfCGGN2p9nKmZTsCw+G2RHbGYQRKKurt/ITDue54h6RHrSk8Q4Xm9MMGop6WlF5C3L
         mB+/4/ievGCpoAcdwyTWdy7mIViupnUozIdq5v0oE1yg+MUVASzzajmkhi3rxx6LIwC4
         4ZKd+pyCLCse2ZSD1uvypsdcvAI5w9q30w4XiUYRvyaOMBz4t/rqNZzhxtWbexqmWwbK
         c0VA==
X-Gm-Message-State: AFuF++mLiqHrSDdhnv97lnRuBoZbZO6R6artHXg/wdiIs737NczTQ8k/
	3uZ65jf6JaTONavWzJo/4AG7zRjwxX7ZClNjGIqC94o1qlahAGGWOM+7/MKyUC3Hvd5ILJ4vE2k
	/h8LNNHAXdv6AB6FHtI32ygrfjb5+IVVljmy5V9zyyDgl1GhXzhcdzNj5LKQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:607:b0:6b7:8415:d786 with SMTP id
 006d021491bc7-6c0bcabfb07mr4936347eaf.49.1789175017242; Fri, 11 Sep 2026
 18:03:37 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:03:37 -0700
In-Reply-To: <6aa4291e.f81106d8.2ab401.001e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa4a4e9.f81106d8.2ab401.0025.GAE@google.com>
Subject: Forwarded: [PATCH] Input: sur40 - fix use-after-free in v4l2_release
 on disconnect
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Input: sur40 - fix use-after-free in v4l2_release on disconnect
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

sur40_disconnect() unconditionally freed the sur40_state struct
(which embeds struct video_device vdev) via kfree(), even while a
userspace process could still hold an open file descriptor on the
video device. video_unregister_device() does not wait for open file
descriptors to close before returning, so if a process closed its fd
after disconnect() had already run, v4l2_release() would dereference
the already-freed vdev, resulting in a slab-use-after-free.

Fix this by giving vdev a real .release callback (sur40_video_release)
instead of video_device_release_empty, and move the v4l2_device
unregister and the kfree() calls into it. This defers the actual free
until the last reference to vdev drops to zero, whether that happens
during disconnect() (no fd open) or later when the last open fd is
closed.

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/input/touchscreen/sur40.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 09d8c5f8d09f..bd8d9f6190fb 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -179,6 +179,7 @@ static uint gain = SUR40_GAIN_DEF;
 module_param(gain, uint, 0644);
 MODULE_PARM_DESC(gain, "set initial gain"
 	SUR40_PARAM_RANGE(SUR40_GAIN_MIN, SUR40_GAIN_MAX));
+static void sur40_video_release(struct video_device *vdev);
 
 static const struct v4l2_pix_format sur40_pix_format[] = {
 	{
@@ -750,6 +751,7 @@ static int sur40_probe(struct usb_interface *interface,
 	sur40->vdev.v4l2_dev = &sur40->v4l2;
 	sur40->vdev.lock = &sur40->lock;
 	sur40->vdev.queue = &sur40->queue;
+	sur40->vdev.release = sur40_video_release;
 	video_set_drvdata(&sur40->vdev, sur40);
 
 	/* initialize the control handler for 4 controls */
@@ -820,6 +822,16 @@ static int sur40_probe(struct usb_interface *interface,
 	return error;
 }
 
+static void  sur40_video_release(struct video_device *vdev)
+{
+	struct sur40_state *sur40 = container_of(
+                                                vdev,struct sur40_state , vdev);
+
+	v4l2_device_unregister(&sur40->v4l2);
+	kfree(sur40->bulk_in_buffer);
+	kfree(sur40);
+}
+
 /* Unregister device & clean up. */
 static void sur40_disconnect(struct usb_interface *interface)
 {
@@ -829,10 +841,6 @@ static void sur40_disconnect(struct usb_interface *interface)
 
 	v4l2_ctrl_handler_free(&sur40->hdl);
 	video_unregister_device(&sur40->vdev);
-	v4l2_device_unregister(&sur40->v4l2);
-
-	kfree(sur40->bulk_in_buffer);
-	kfree(sur40);
 
 	usb_set_intfdata(interface, NULL);
 	dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC);
-- 
2.43.0

