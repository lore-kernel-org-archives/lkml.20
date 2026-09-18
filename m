Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C13C73C1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710541; cv=none; b=pBopQTdSgDoL1e6eS4pLTlnjonHvJFiVZ05HBp/bsegFTgTMDplxe+Gp1sPryHDpOw195NUWnZHuyLJi6CChcij/fP0gVo7E/4z8sBVtwF3i9GOQJUECRhBk6HO2uQyL1ZTo4VVxvv4WQG3oELb0MtrovrWFvFxdyb2wKcojqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710541; c=relaxed/simple;
	bh=nto4tkX2dPIt2ga+eZHkQoGQW5hVv7ulZY2WUPfq8pc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rZOvlxtHc8dPk7vYnM36O26FTdiGHo2QXKeV4dtGRVzyJX6IxSEdFlFLvv757lCj20ba+e7NmZM23oT26nvj19IkgmMA2POiNCLjGjzU/8b1j6u/iJ4YTEFwDYPdO53+vSVAB0lknkzqvVbz2v6W3zku2lWvQKOYdyfdJNSEkDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcJgQp2u; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcJgQp2u"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so446277b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789710539; x=1790315339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGpbvCtpovb18NhzNwdD5CAHO3yyTfoxPLrbmEaPtEQ=;
        b=fcJgQp2uVGy8Rw5QEIRYO9VvIy29/Me+dFnAiJO6hFU2C/earlrUDJpKe3Yb8YfAkO
         mfZZdIq8S0mXM26JuSMuqfcGtiuauzBUrGhv8t4aWo7+q0i7w1N8yWOvwtnsE96wcNy9
         8/N8JwfKyr3A1MUSskEGrEuhVdtn59qQEhA10/MPvK5n4UEaQMHmv66GcNjkjRCyjZlR
         Hu+L1RgxWvEC+YjuhAud/ztCzebgBHgS9/CgEmMArpYsJAfWDEijFG0dklOwZVpf5zfE
         ez2bkqLf/cBqI9PLwmyHgOd1YA17Wz4fQZuEXCdJF8YUx5HBOwSzF6q6hj3A1qaoefsO
         MXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710539; x=1790315339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGpbvCtpovb18NhzNwdD5CAHO3yyTfoxPLrbmEaPtEQ=;
        b=hlW88dAYJB/luFPALq6SkyA3IL2DJxf1FJEIQKLqeBIh7aYaNUvUvAHvET7we1scN0
         OZfxr3pOjVqzxD/auh6q6yYNjvSm9q/7YpIUCM13uI6QqKX8+tQTZvr1y8F1gH/MOqIw
         0h7vO47Ga+KHzv7Q/ph5ECkvJyjJwWm2EFtOeTzTRyf0MN29a6bIY0XyPYrmmuv0z7WF
         zNf6t6Aymm58z+79AgsvWrhYYkk7v/7zMgufVsvbhuHcrcxVhBTQicpFiTHgRpG8a4WS
         1JWG87O2Cuqv2wArwxpsGwkU+Tbv1/TXHE7iFyfg29KsQY2M1BPYngQnKvVOhFg74sCf
         Szsw==
X-Forwarded-Encrypted: i=1; AKwUvBxY21R81rb/nDrb+SYqLqK3FDFyUe5dILm6l/0eEYaPFOoWUv80VY7g/auoSOjt9QhR3CN+IZb752Ap7bg=@vger.kernel.org
X-Gm-Message-State: AFuF++lcjq3SOtmp/yeHjESNTo12/+AVloPvIe9uCeC4dlKdSEg1jhwD
	nZzhtt1RfoXtqoVZhX1JMXihZCLISYgu3seK2py2Rjpht1+cJ98962qq
X-Gm-Gg: AYBFou0WPRF89084lcvpm7IOxlJa9uWkLEgGCSiEbUHNEChO5J/5+ASvll3yAjy9m7I
	awupKQzcgqninzGRpKwRkoTYarNzkMtC0bK6jdfTeXnHKHQdA1rq4fAOnVlC4DXko3x3VEdcDPZ
	iAnigijxc9ReOngtJIvdFqSAFHZroU7ioLT8+eZNSAW/Z9qhS2OF0g4oo1sINyuF/NxIAOOV/Ib
	HstI+EcHME+qY5L1RrYhDpE6KS3p1fxNDQepPFGS1FKTvM11m8qpluMQsK066LJOdYHs241i40r
	oy0N+htMqQoeP6rlpuJn5SHClAjiVy09ABxHtEbH68w+xxyf0WTWgMpwAFguNkJdlVfzNJ13svM
	vOPE6byt0UtJxYfaaqndZwWj4M+8X/QW8i2kLYTp89FX10fc4tXx6SW1fctCeBsWjufl/uEt47K
	XColT7P6E0gXblpvP7o1H3zRItpFJ32mTxbnphJBg/1GvR/+HoPa7JpMNxdviFVE1+jC4Uxa+U7
	+meAaMD6PyZ3JvNH5HuMFjX0eXopPrnaGo=
X-Received: by 2002:a05:6a21:32a2:b0:3cd:a1e2:f238 with SMTP id adf61e73a8af0-3dd8c47dc32mr3306490637.16.1789710539240;
        Thu, 17 Sep 2026 22:48:59 -0700 (PDT)
Received: from deepanshu.. ([2405:201:682f:383f:fd1d:e265:6e6f:358b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50ad2cbsm320020a12.15.2026.09.17.22.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:48:58 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: jarod@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Subject: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
Date: Fri, 18 Sep 2026 11:18:51 +0530
Message-Id: <20260918054851.26083-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ictx->dev is a raw pointer to the usb_interface's embedded device,
cached in imon_init_intf0() without taking a reference. On
disconnect, usb_disconnect() can drop the last reference on the
interface and free it while a userspace fd for /dev/lcd0 is still
open. When that fd is later closed, display_close() dereferences
the now-freed ictx->dev via dev_dbg(), causing a use-after-free.

Fix by pinning the device with get_device() when ictx->dev is
assigned, and releasing it with put_device() when ictx is freed.

Fixes: 21677cfc562a ("V4L/DVB: ir-core: add imon driver")
Reported-by: syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9bfac891bdd42eb708fc
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/rc/imon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 049a73b5f882..9341dbe03b57 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -502,6 +502,7 @@ static void free_imon_context(struct imon_context *ictx)
 	kfree_rcu(ictx, rcu);
 
 	dev_dbg(dev, "%s: iMON context freed\n", __func__);
+	put_device(dev);
 }
 
 /*
@@ -2253,7 +2254,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 
 	mutex_lock(&ictx->lock);
 
-	ictx->dev = dev;
+	ictx->dev = get_device(dev);
 	ictx->usbdev_intf0 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf0 = rx_urb;
 	ictx->tx_urb = tx_urb;
@@ -2314,6 +2315,7 @@ static struct imon_context *imon_init_intf0(struct usb_interface *intf,
 find_endpoint_failed:
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(tx_urb);
+	put_device(ictx->dev);
 tx_urb_alloc_failed:
 	usb_free_urb(rx_urb);
 rx_urb_alloc_failed:
-- 
2.34.1

