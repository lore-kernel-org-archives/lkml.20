Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615876;
	b=SlDDXzXqPy3foxHS/vu0GnLHifdXkKplpnmWqMVOsaBDLiUhIGd+zucvNIhzABJFJKa8
	 Q5Yk0wsJFAq97odjluh5gqA5jxtYTBA+WFD/afm7L8HhdPHtFrvVbK1l9FpRTnJSxbAus
	 zLwrGEVWQYR/LPjCkiY7VRUX4FkCaykseUa6p9BSpECCIL+ebR4UUkAkhapDoVQtFzy+p
	 vXC+iKDoxXvcbPObA1YNqpfvH2PGSZ3sRX2eLni7T9iBLj5A7na2dEpXWwZrgG/K6fJEg
	 QMhk8ZlyczMrSGhIqIhAtFaSottLDJZcvtt5+hYD581sN61ZBja0STfzREzHxnjVZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615876;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Zo4e288ZQog2vQ8KDXy+da0HSyWChSUHwMuhnytcdBA=;
	b=lM4h+bzU4fuDS4n/i4odNmJCxm7BxgCa2hekRwQ7E9MPLvcP6BQk4MgIOiuY9jOtTYyI
	 23v58L2E1SV0X732k5d9pJ0rr9XOtdqu5N/YOnyJT7H6jAn16SKElPJp5R1KAbUmvZqCu
	 TGS5nyWe/ExJgOZF3ht5FYg94GTbHbnhWnGZLnl/MavBrVk1S9oB37Kg8Px+WWtcJY9sD
	 +XABDVIR2tkmyk+08ln29VNM1iHM+ObyOqlMlUDcUEGOm3YOyyUqziGzs7YFhCFVZGmgs
	 6ZoChJ9HVgklruiSFulEROrfFy0cyE9uGciucay3o8C/uVP3og24zw6FcHOWWVI7JbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF5CF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c7f887ac6bso4052604b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615875; x=1794220675;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zo4e288ZQog2vQ8KDXy+da0HSyWChSUHwMuhnytcdBA=;
        b=SHoH/C9T6Ql2IklF8ucFr/gHUeiuzj8I+dymsnuP/JFDHjg4lYDAv2FC9GKqDQQcaI
         zg9jYJCoTJ5IXkOs0zqx3vewgOjbsXTXxdEnZDG8OHzLORxrQGV70yaGQdAyeRJTCz5s
         nbd963I5cClUeexqum9EQyCogjQJieUjh6sv4LtwOuHn+9Y51erae92Qe6Grt/cenOp6
         DqiDoNAJTWIpWQ8yF9Hz3iYfn84XngI/zD8GFUBTuC/zgf4oAS/QwiXAtrhwWuLf3MTT
         rYUkrwAyM2dzf71JG95gb9tsXmacxZa610j9FXVSiAwpIRIMJkj79SQ+kFY773H6jyLH
         KL7w==
X-Gm-Message-State: AFq9FYK6wn3c5TGfaCy3YVZtRDf0JGojBexQMG4ffua8zVxsQx3An3zW
	/fXmkL6KycO1nPzYangLK7khIAvJ3mLJmmM0d1CFQOMVvhiIUhr0kuH9ghC+KZI6zdpJE3S8iji
	CSiIZdF7wEGluaexRyu95HtmI7IEU8Z9vi3I9YUWbY93G2mYebgurYBwRRqA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd1:b0:4c3:6c2:4f29 with SMTP id
 5614622812f47-5640dce8949mr5837312b6e.16.1793615874818; Mon, 02 Nov 2026
 02:37:54 -0800 (PST)
Date: Mon, 02 Nov 2026 02:37:54 -0800
In-Reply-To: <6ae78458.64e51036.15cf6a.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae86802.64e51036.15cf6a.0023.GAE@google.com>
Subject: Forwarded: [PATCH] media: em28xx: clear dev->v4l2 on v4l2 init failure
From: syzbot <syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: em28xx: clear dev->v4l2 on v4l2 init failure
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



If em28xx_v4l2_init() fails after registering the video devices (for
example in v4l2_mc_create_media_graph()), the unregister_dev error path
unregisters the devices and drops the initial v4l2_device reference
with v4l2_device_put(). However, it leaves dev->v4l2 pointing at the
em28xx_v4l2 structure.

If userspace still holds an open file handle to one of the video device
nodes, the structure stays alive through that reference. When the USB
device is later disconnected, em28xx_v4l2_fini() sees the non-NULL
dev->v4l2, treats the extension as fully initialized and drops the
initial reference a second time. This underflows the refcount and
em28xx_free_v4l2() frees struct em28xx_v4l2 while the file handle is
still open. When userspace closes it, v4l2_device_release() calls
media_device_unregister_entity() on a media entity embedded in the
freed structure, resulting in a slab use-after-free:

  BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830
  Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384

Fix this by clearing dev->v4l2 in the error path after dropping the
initial reference, so that em28xx_v4l2_fini() returns early and does
not put the reference again.

Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..ec4ed2b0e5fd 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	 * v4l2_device refcount to zero.
 	 */
 	v4l2_device_put(&v4l2->v4l2_dev);
+	dev->v4l2 = NULL;
 	return ret;
 }
 
-- 
2.43.0

