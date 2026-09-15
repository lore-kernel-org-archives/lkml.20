Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542438D404
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436333; cv=none; b=M3rT5siVOPVWl5j7unbkPWKKtr/jD/6cMtmazDMAY8XtHU3m0gOsFRMYmtVkCEG1kDpoUho4Fv1FhqTq392nomVBYUmEJXj4ok8o1/P4D9w6FlURUOvgQh9R7ylQ3MWPrg4LYK5uOa9C5nbGmp2YmJBbZNv8MJpqF8oT8WrACk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436333; c=relaxed/simple;
	bh=QuBRdgWMM0aRwlb3Ji6Q1T7j0mF58GEjh1MmoCSJv0w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cO7uIbRZ1Fu58YYpMO21PNQz9fDpkl1z4q1Egy6N1KyXmIZ9fe//kd6Guit/8phLJCTNLHspWi9U2TiAO1vOsH/s2QF0IOdEkaxqEC5jH5CBU0xdgPV8umO6QtfbBCgVsm8H+b+rwC+AsxJjR2DPfV1wFzNhcVzSVjhFEsAUkxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-44899f99756so6187276fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436331; x=1790041131;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nMfenqqGmhzpT+KaQWMfl41wrXss7PdoL71bedTrOM=;
        b=qOT7vej/2f0ptvJYkkkJ0T8Cdus4i1RRFPjijeVqKgfxOGTowsP1hhdRht7rKylJvF
         WEvMdhSEWgP3mbt/bBtwChovFAUcQBAepNs8w0gw2G/aSoo7Nu/Ua0JyTa3dvWKi5nZ7
         R1RGukecZoPCwDweeOQYg5fOkPWPBX4TYvTUcLZh8BZBBz7f+3GwpqFeHfo/vuqYOihK
         BL68WWKppd/W4DQaZbqkGTCbsEoGtK2z7OhywRlbhiU//6eU5NABEpd8qfmx8DrrxqHf
         7kE7jW+IKk9AQIVdMIrVcfaZYwqLZ1X+8/OyVAqDDmxZZFpLA1qAbXH/XXvKsDt7MB5G
         JJIw==
X-Gm-Message-State: AFuF++m5yPFy5W+8o7Nfug9wb47u7SVaeda8+DErk11pUEvF8267cppJ
	pSQIBiiKcGGWKUpBK+DI4n1bBwI6kUlMo3OdnZHae2g+YYxv8/hHK18GOp6TS7oEmD4OSepsuXn
	Hqhzp9aQkDoljqQBR0440eET6VVSZ8nDzt9/RQkg1+0LbNgFePIgN4Q4Xvuo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de7:b0:6b7:8415:d78e with SMTP id
 006d021491bc7-6c542734fb0mr2723271eaf.57.1789436331436; Mon, 14 Sep 2026
 18:38:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:51 -0700
In-Reply-To: <6aa4291e.f81106d8.2ab401.001e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1ab.f670cee1.72fc4.0022.GAE@google.com>
Subject: Forwarded: [PATCH] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] KASAN: slab-use-after-free Read in v4l2_release (3)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 09d8c5f8d..4da6ad1c3 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -647,6 +647,24 @@ static int sur40_input_setup_events(struct input_dev *input_dev)
 	return 0;
 }
 
+/*
+ * Final cleanup of the driver state.  This runs through v4l2_device_put()
+ * once the last reference to the v4l2_device is gone, i.e. after
+ * video_unregister_device() and after every open file descriptor of the
+ * video node has been closed.  Freeing sur40 earlier (for instance
+ * directly in sur40_disconnect()) would let v4l2_release() access the
+ * already freed video_device.
+ */
+static void sur40_v4l2_release(struct v4l2_device *v4l2_dev)
+{
+	struct sur40_state *sur40 = container_of(v4l2_dev, struct sur40_state, v4l2);
+
+	v4l2_device_unregister(&sur40->v4l2);
+	v4l2_ctrl_handler_free(&sur40->hdl);
+	kfree(sur40->bulk_in_buffer);
+	kfree(sur40);
+}
+
 /* Check candidate USB interface. */
 static int sur40_probe(struct usb_interface *interface,
 		       const struct usb_device_id *id)
@@ -727,6 +745,7 @@ static int sur40_probe(struct usb_interface *interface,
 
 	/* register the video master device */
 	snprintf(sur40->v4l2.name, sizeof(sur40->v4l2.name), "%s", DRIVER_LONG);
+	sur40->v4l2.release = sur40_v4l2_release;
 	error = v4l2_device_register(sur40->dev, &sur40->v4l2);
 	if (error) {
 		dev_err(&interface->dev,
@@ -778,7 +797,6 @@ static int sur40_probe(struct usb_interface *interface,
 	if (sur40->hdl.error) {
 		dev_err(&interface->dev,
 			"Unable to register video controls.");
-		v4l2_ctrl_handler_free(&sur40->hdl);
 		error = sur40->hdl.error;
 		goto err_unreg_v4l2;
 	}
@@ -787,7 +805,7 @@ static int sur40_probe(struct usb_interface *interface,
 	if (error) {
 		dev_err(&interface->dev,
 			"Unable to register video subdevice.");
-		goto err_free_ctrl;
+		goto err_unreg_v4l2;
 	}
 
 	/* register the polled input device */
@@ -806,10 +824,17 @@ static int sur40_probe(struct usb_interface *interface,
 
 err_unreg_video:
 	video_unregister_device(&sur40->vdev);
-err_free_ctrl:
-	v4l2_ctrl_handler_free(&sur40->hdl);
 err_unreg_v4l2:
-	v4l2_device_unregister(&sur40->v4l2);
+	/*
+	 * Drop the reference taken above by v4l2_device_register().  The
+	 * last reference releases sur40 via sur40_v4l2_release(), which
+	 * also frees the control handler and the bulk buffer.
+	 */
+	input_free_device(input);
+	v4l2_device_put(&sur40->v4l2);
+
+	return error;
+
 err_free_buffer:
 	kfree(sur40->bulk_in_buffer);
 err_free_input:
@@ -827,15 +852,19 @@ static void sur40_disconnect(struct usb_interface *interface)
 
 	input_unregister_device(sur40->input);
 
-	v4l2_ctrl_handler_free(&sur40->hdl);
 	video_unregister_device(&sur40->vdev);
 	v4l2_device_unregister(&sur40->v4l2);
 
-	kfree(sur40->bulk_in_buffer);
-	kfree(sur40);
-
 	usb_set_intfdata(interface, NULL);
 	dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC);
+
+	/*
+	 * Release the reference taken by v4l2_device_register().  If the
+	 * video node is still open, sur40_v4l2_release() is deferred until
+	 * the last file descriptor is closed, so sur40 stays valid for
+	 * v4l2_release().
+	 */
+	v4l2_device_put(&sur40->v4l2);
 }
 
 /*
