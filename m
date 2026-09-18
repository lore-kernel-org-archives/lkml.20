Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766C43290C5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789708642; cv=none; b=QG+Jnoz9XEzKRciSkoMOtOjgcEBYKH+UOgjy9TBBe84aCjO7JT6iJBMmmSCSj/mESb39gtnlLTpjE9erzdUwclC4C2MPDNYb/MBA3d151l1012Q312OC8m10C10jPx7LIUbi/Xy+81Dcv0ncgZ27QFbszYhAx17b6tiy1COiW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789708642; c=relaxed/simple;
	bh=dBxg4YNAAM5cc+ObyG+Z/5BXggOKLAlUB8S2ueBL0dI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IJn2Jqf0pX8gEvbewNPTrCZPztt8XZBjkxBct8WpbFlbBQnxlWNt0GoRUCBMQzcUT3vEtQ7/ZA3Ou/rVHSER/h8nvVd0T+cqCdjCYnhXzRpxAkYrknjDKLrvo/MrSBllDk8PFP6XwHFCxxMcsNmK0A1taw/h3Z5QaGuN3QCHrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cb254da90eso559854b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789708640; x=1790313440;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gnQPX9mYqX/D4iayAEke5yiOe7T4XjSR1Fj/ZtsEcM0=;
        b=DS4I83TLD126ygcyRMFh73/zCsRnCdL3Dw2ToZV9sFUWuZSiqCNZoc5UpL0Va9wnTw
         cR5DTM3kjZMT/hr8/o3CN9lVsIt3JTwKGkp7OpKa8i2nUq/etlKgJf7KhIQkc8i7iLsu
         4+0XsIo/37FWIFtHcMq/EB0P1jwNFISfYSg5GZfnSz7T/oA9T/tvYWfaGc862oeiWPeu
         uQkoplAncA98mCYExpGt4mn9XMe4HorgYWg2rE2rwxTKEMCodB3g7CxFERLnoKBNnd4I
         Bvcz9f7ER4eyqBwSaWelonW1OFFZVoR3VLSlmawE/WNKp0H5cH3/5fJC8Gb1YW5ltjke
         wyzg==
X-Gm-Message-State: AFuF++kkL83nzlt8hpg3MaXq33fmkwNfh31uJDhQZ87VW/yYZ+RQdJDZ
	cP/VdysDpNp2SeWzmLXnthPS5Qo1u3f9tMWY+BaPgcpPSVeGNv42vXbvHvmJaBftjOO7C1lNs+2
	pZ4lkMGBd4i7j396zkQMeQCO1B5mlq9iWq7SAL3lBVwva6IHHPdEGQYICmis=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a0:b0:4c5:4eed:b447 with SMTP id
 5614622812f47-4ccf6a74ebcmr1926217b6e.1.1789708640433; Thu, 17 Sep 2026
 22:17:20 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:17:20 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aacc960.b398a7c9.1f86be.002d.GAE@google.com>
Subject: Forwarded: [PATCH] media: imon: fix use-after-free in display_close
 via dev_dbg
From: syzbot <syzbot+9bfac891bdd42eb708fc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: imon: fix use-after-free in display_close via dev_dbg
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



ictx->dev is a raw pointer to the usb_interface's embedded device,
cached in imon_init_intf0() without taking a reference. On
disconnect, usb_disconnect() can drop the last reference on the
interface and free it while a userspace fd for /dev/lcd0 is still
open. When that fd is later closed, display_close() dereferences
the now-freed ictx->dev via dev_dbg(), causing a use-after-free.

Fix by pinning the device with get_device() when ictx->dev is
assigned, and releasing it with put_device() when ictx is freed.

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

