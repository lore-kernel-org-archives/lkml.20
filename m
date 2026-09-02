Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CD37204A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392918; cv=none; b=hXZNsZstWcI9o1K0mbvHHn+rhU0fd0IqXV/HNGYCeu2J56Q/jXfNG9Rcux8VYf83kZr+TfJeYnhZEeKJXnKvl7VQWLBli/1oU9RmM4lbtUzy59hjOxFVSiOZbpRkYosRGjKQTivMP1pURli33GYmMBFY3l626GFCWazz/K7V4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392918; c=relaxed/simple;
	bh=o3HsFeQw1RRyMRRsQQkYpLCVx8+G1m4vFCYryGoS/Xo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iqINI+kJd/isBD3BjW5xLpf/TS9oNUKyXvk7wlMSahiL2932Id6m9s4wtjeN+Rd2Hzx7Cyz77f+1ycPLskeazyhLkGG4Bq9SHMZQEACt1pGN8dfeUjC3KACjtUiiO8ZLUVzyPq5jD85ATSBoJGVWTbBGrxvC8Ib0At9preV5z1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d9952a5so1953489b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788392915; x=1788997715;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=khu+90EbyKakPh+AEzLpxA1wJEZkV3aMHoPKv1nM4nE=;
        b=VIZP+XcDiCQxecoIyCDuW9uT9vuyKpj0HWO4WD6YCCUDof2/yPiSEu6kpH5kn/zeOx
         p6lUBVwBtOzMtlDoGtvqqBqbcJvdmaUvOwXPyozTmItutBFM0u2tHSLkn9EtQFboy3Yj
         V/v9eUK82icgtuQYRhLTkuv4xyQChaHGewZb0w45IzEB+vlJejs1i5DU8PhraoZagqky
         YzJp7tJGew4TnQ+6AaX5euK8EjvNa7wOI5eeJ4mPPUmaiVXHKKF88SyQq2aCOuRnVM0w
         +lf7MT0Oq80tEVDz49qme7aFjSylmLouhOxA9CFcfhOfyxWpZAozww1HzAkWOYBvhWIt
         urDg==
X-Gm-Message-State: AFuF++mNrtjnqvMI5KtX/NdmMxQI2l8WhLly2edgqNQzMtogEP/QEjh9
	qDDURqPsYtmKbIUcfcGbUyAC7yKls5f1mFLK4wuRXolXyIAb1lwx3CGq7weEJR98FEBpM2GHz9s
	zyNVknNnK3IhExHzEfVaGBN5xfQvW85w9mAZg7tz2Y/sZSSAudq4iULVO5qk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1693:b0:6b3:5475:4861 with SMTP id
 006d021491bc7-6b480a48973mr5533031eaf.18.1788392915098; Wed, 02 Sep 2026
 16:48:35 -0700 (PDT)
Date: Wed, 02 Sep 2026 16:48:35 -0700
In-Reply-To: <6a987197.9266084e.bf0d7.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98b5d3.2e567484.299ffc.0004.GAE@google.com>
Subject: Forwarded: [PATCH] HID: roccat: fix use-after-free and
 uninitialized-mutex races
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] HID: roccat: fix use-after-free and uninitialized-mutex races
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


roccat_disconnect() dropped devices_lock between reading device->exist
and later checking device->open to decide whether to free the device,
letting a concurrent roccat_release() free it first and turning the
later check into a use-after-free. Fix by keeping the whole lookup,
state update, and free-or-keep decision inside one devices_lock
critical section.

roccat_connect() also published the device via devices[minor] and
device_create() before initializing device->readers_lock and
device->cbuf_lock, letting a racing open() on the newly created node
take an uninitialized mutex. Fix by completing all initialization
before publishing the device.

Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/hid/hid-roccat.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..00499d6fa748 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -316,6 +316,14 @@ int roccat_connect(const struct class *klass, struct hid_device *hid, int report
 	if (!device)
 		return -ENOMEM;
 
+	init_waitqueue_head(&device->wait);
+	INIT_LIST_HEAD(&device->readers);
+	mutex_init(&device->readers_lock);
+	mutex_init(&device->cbuf_lock);
+	device->hid = hid;
+	device->exist = 1;
+	device->cbuf_end = 0;
+	device->report_size = report_size;
 	mutex_lock(&devices_lock);
 
 	for (minor = 0; minor < ROCCAT_MAX_DEVICES; ++minor) {
@@ -324,37 +332,30 @@ int roccat_connect(const struct class *klass, struct hid_device *hid, int report
 		break;
 	}
 
-	if (minor < ROCCAT_MAX_DEVICES) {
-		devices[minor] = device;
-	} else {
+	if (minor >= ROCCAT_MAX_DEVICES) {
 		mutex_unlock(&devices_lock);
 		kfree(device);
 		return -EINVAL;
 	}
 
+	device->minor = minor;
+
 	device->dev = device_create(klass, &hid->dev,
 			MKDEV(roccat_major, minor), NULL,
 			"%s%s%d", "roccat", hid->driver->name, minor);
 
 	if (IS_ERR(device->dev)) {
-		devices[minor] = NULL;
 		mutex_unlock(&devices_lock);
 		temp = PTR_ERR(device->dev);
 		kfree(device);
 		return temp;
 	}
 
-	mutex_unlock(&devices_lock);
+	/* Only publish once fully initialized, so roccat_open()/
+	* roccat_disconnect() never see a half-built device. */
+	devices[minor] = device;
 
-	init_waitqueue_head(&device->wait);
-	INIT_LIST_HEAD(&device->readers);
-	mutex_init(&device->readers_lock);
-	mutex_init(&device->cbuf_lock);
-	device->minor = minor;
-	device->hid = hid;
-	device->exist = 1;
-	device->cbuf_end = 0;
-	device->report_size = report_size;
+	mutex_unlock(&devices_lock);
 
 	return minor;
 }
@@ -369,15 +370,12 @@ void roccat_disconnect(int minor)
 
 	mutex_lock(&devices_lock);
 	device = devices[minor];
-	mutex_unlock(&devices_lock);
 
 	device->exist = 0; /* TODO exist maybe not needed */
 
 	device_destroy(device->dev->class, MKDEV(roccat_major, minor));
 
-	mutex_lock(&devices_lock);
 	devices[minor] = NULL;
-	mutex_unlock(&devices_lock);
 
 	if (device->open) {
 		hid_hw_close(device->hid);
@@ -385,6 +383,8 @@ void roccat_disconnect(int minor)
 	} else {
 		roccat_free_device(device);
 	}
+
+	mutex_unlock(&devices_lock);
 }
 EXPORT_SYMBOL_GPL(roccat_disconnect);
 
-- 
2.43.0

