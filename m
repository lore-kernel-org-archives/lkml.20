Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EE3D8122
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386416; cv=none; b=EQ8ng9wNcYQmQxz75NMYXfk1sMA9MrtnnhmQlKLAvwPoRBxm2TEGQjq4xHeOpFrfqMWFh5a3/7VOitGixY1taYUkuHttrp+z5pRiVO5DtgiGS1SgAd4nmma+gWTmCqHiXvPKNvDKjHqohSiVUNU8hUnDbiD9QjNZaFX4C8220tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386416; c=relaxed/simple;
	bh=t4NWASf+VT2ZbPFBf6toI5VMcXq6A6UymHW0HZb+4MU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MZbhPavJ3NLxXhC2A330tvYMckcAJ2CnlkXfkpzchRrs2HGTzc9YOfHeH3cPagE31L0oLSoigH6dsq/xwqRPZ31A1vCwOsFI3hYWoT1RH2vYDpfkheU6RhuSeZWm6SN3JARFISg+ZJ1zddRYe1P3SIJesiVw1pVZwqkaLuK+6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c2549d0cbaso3145552eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386414; x=1789991214;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0hv6YnMz1nh3AsQzOiSQwXzZr7z48BB8fNfr/cM9XX8=;
        b=bttnjff26Pq7x8lel2IilzwhA89BzfHGuz2VNaufOECaPxK06YCzWlfwEkTPE7+nPY
         q/g4OhppnrJJ94V8nWrdhyQsRqkHG0ca+OnBenma9GJxyQQRn64MCMdhuh3LQJbZEPhp
         koaEk5u9EtxYviBe8mOeVi3h5pSUKQMOEMXYMVzLRjKkFVvRbbwT3t4uPdcskrJd+fUJ
         wWYkdmWDLq3IGiUfzM+MlBxzH3rhxLDkyhx1MXIKlTbjOdeiQEmmtbUIJhinKPN2y93x
         fq1yLXxILQWP3gPe1pHYFxjrNm0JNIAG/moWm9z5WVIdI036ev7gdVsaGCI5Q7qE7Z78
         Bwlg==
X-Gm-Message-State: AFuF++maRYNv8bBMiBKqawB9sHy0xdrVllLDKWWn9O8bq8VNPQ9kv4GK
	NsUlIw8i9rb+aHKiMSFU4w3odhlNzyMl+DDRtDP75/Rf6fBC8lhc30uM+pgMS33bOEvIzyIE3Ml
	2ihn9ssFqBuXSuf0tDmOAkWfpjsfWCidDP2kp0nvCG8YwZb87xAUHToyDHyg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3083:b0:6aa:de29:651 with SMTP id
 006d021491bc7-6c5426359a7mr1035930eaf.16.1789386414222; Mon, 14 Sep 2026
 04:46:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:46:54 -0700
In-Reply-To: <6aa4291e.f81106d8.2ab401.001e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7deae.f81106d8.2ab401.004c.GAE@google.com>
Subject: Forwarded: [PATCH] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] KASAN: slab-use-after-free Read in v4l2_release (3)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 08df884136f1c1197bab2a27814404fd329d9aac

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
