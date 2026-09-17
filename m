Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A4361951
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608365; cv=none; b=A1X4ZmcK0wXxUu6yoNmC1O+cLanbQ6KQkGxpOb39Xwv5LesoFPCg2+hkArblHUXiRlxJ1h32EyX7iihGLAsDaberP9WWuUCG02qnKQLSd4SNH5SmOn1+ZavYn+ZPiG/nJIq6nG0QoDR0o2sioNlgXbPmjcYSXO4V2R+pbvJPbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608365; c=relaxed/simple;
	bh=kdY2HYbAwe9ocKnvkyDwof50rabNoVZqFe1cNX2AYZQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Tvo1d3RcqdeSJiEJAjocod+2pAJUPi3QlW97TOMEDYRQPKw/rJ/L+ARdQMaSaRSYlcPHKNnlIxrKvAcpfYik5N3nWGqZ4naw0HSU+zLIvQX72fQMnaWDgX8XR2DJsLxeizxMew98xl+Dp+2z8hScOYxeuchWKkgRfe4j4EATZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c2549d0cbaso624330eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608363; x=1790213163;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zGA1GK+PjVQ9HeM+Q7Te74D4Fh+I5xSQ7vxwKtdUBTA=;
        b=Hovkq9Yxmfiwu2AY9CJ3bGj95f/x2j+90vGvJsnpkVZpKlt9eD9qPRvlpZMoEV08X/
         vvZ8kYgElQ6AeUJ0CIcB2xpUmWLBiClv+Kb4ygN0HrhUCefw+xWMp+U6qgRoGUfSeSqI
         b8MyAzhogWWpCyGZECAqQTPjE2oNfAkcNZpBg9JfUvnrUJXlbVOWGMo3zJxBlrjwUJWz
         OY5R3nrqzKOXv8cUT3cAqUrHiLJid/FqekncESz6zmE+HpI3rvzlpcXLqTW/U3lCUrks
         cD3oS6Q/YmSGMSP8B4xGhvFsWAUwqwX7M7VNJ1mOubyLWH+c3gN+E1bTk7DeVjIDl/2x
         dmPA==
X-Gm-Message-State: AFuF++m28thNVMYRUYD0b4QaKS04jMsluaxBCJTVtYern8FosISmQ715
	JKrcKSs+HIdKso44Uf9FjT0KuK5Nlfo9weAUd4ET0CPF308LThSHqNh8StueZYC9xXWcl8oz10O
	HxbNMunuPEAE0AgpZ+3rT4XINCjHDQhGYHox4FJUzBL3+r2P5VvbyswYfuRA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f035:b0:6b1:9e75:6fe2 with SMTP id
 006d021491bc7-6c7d15ce097mr5194248eaf.12.1789608362947; Wed, 16 Sep 2026
 18:26:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:26:02 -0700
In-Reply-To: <6aa4291e.f81106d8.2ab401.001e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab41aa.b398a7c9.1f86be.0003.GAE@google.com>
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
index 09d8c5f8d..39166161d 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -647,6 +647,25 @@ static int sur40_input_setup_events(struct input_dev *input_dev)
 	return 0;
 }
 
+/*
+ * Release the sur40 state once the last reference to the video device is
+ * gone. The video_device is embedded in sur40, so sur40 must not be freed
+ * while an open file descriptor can still reach it (e.g. from the v4l2 core
+ * release path). sur40_disconnect() only drops the reference taken by
+ * v4l2_device_register(), which frees sur40 right away if nothing is open
+ * or defers it to this callback until the last user closes the device.
+ */
+static void sur40_release(struct v4l2_device *v4l2_dev)
+{
+	struct sur40_state *sur40 =
+		container_of(v4l2_dev, struct sur40_state, v4l2);
+
+	v4l2_ctrl_handler_free(&sur40->hdl);
+	v4l2_device_unregister(&sur40->v4l2);
+	kfree(sur40->bulk_in_buffer);
+	kfree(sur40);
+}
+
 /* Check candidate USB interface. */
 static int sur40_probe(struct usb_interface *interface,
 		       const struct usb_device_id *id)
@@ -726,6 +745,7 @@ static int sur40_probe(struct usb_interface *interface,
 	}
 
 	/* register the video master device */
+	sur40->v4l2.release = sur40_release;
 	snprintf(sur40->v4l2.name, sizeof(sur40->v4l2.name), "%s", DRIVER_LONG);
 	error = v4l2_device_register(sur40->dev, &sur40->v4l2);
 	if (error) {
@@ -827,14 +847,18 @@ static void sur40_disconnect(struct usb_interface *interface)
 
 	input_unregister_device(sur40->input);
 
-	v4l2_ctrl_handler_free(&sur40->hdl);
+	v4l2_device_disconnect(&sur40->v4l2);
 	video_unregister_device(&sur40->vdev);
-	v4l2_device_unregister(&sur40->v4l2);
-
-	kfree(sur40->bulk_in_buffer);
-	kfree(sur40);
 
 	usb_set_intfdata(interface, NULL);
+
+	/*
+	 * Drop the reference taken by v4l2_device_register(). The state is
+	 * only freed from sur40_release() once the last video device user is
+	 * gone, so an open device node cannot use the freed memory.
+	 */
+	v4l2_device_put(&sur40->v4l2);
+
 	dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC);
 }
 
