Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DCB3B2D0F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148079; cv=none; b=UbvVeHpjnBWXXK8A+8EHMENGO/nqOsmmC7YRnqaUdnp3QyxetngiMdIUI6AtlhJO/ZjCB1MTi4ma7LyekOLUqW31KF+ZlpgGQvzm8bA1ITx/IIfuZ97bf7j/rdIcM/eWpgc/gKRqisJKvhv2zigbVMOZzZ7S6pVli8bAN79ftRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148079; c=relaxed/simple;
	bh=zeJoBkDleRSjbSqzpDOJtNbOrAqKvzYUhk6MDtksElU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E9nvOGD+7Ce1PKveq1icpm6+Phd8EXSORCA4+bAXneissroIvTzcVEsyBcODTkwRn2D8pclyd2GJF61W42tTxeIlv8PnXnJkywznTWXTJJrg65HtonHkxLk67o/8jgwhQuAga1UTxz2/PZFNUsk8BdvHy1Lh51g+uejJo8Srkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso1533729b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148076; x=1792752876;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/JBj3MmJHMpT9yD2od1DNiuMAIPBWwMy6BadKq63gkc=;
        b=UVtBrYjBf0iK4MZZtQ367Gm74QITiViPMc0TCYlMLzKjW9GTRrur+4YBGufMQdzJrd
         pb2ujHl4odQUEzOeDqkV7rLdP2cTzdPAsgPd9QtEdemVNR5aj5ELmqichFUT+p1OPOEt
         IgAcN84Jl2LhzDP7D7IAFsMlso7YvHWMg48WAdno7lx0NXz3iAK8Tw7GgQQ/1Xur4eQV
         xboI/DmRWqXDYZPhudzWkCbGRwDqI4Es77m6Woi8g3RBox+C26f1ImbnKmYl+yvDPR1a
         udE7JotsnwabRs3HyybDnJ7qQUMb7g84NuCYAcnhEYXBUHB5dC1K9JUAtxf/EqHS8wJc
         K89g==
X-Gm-Message-State: AFq9FYJ4jdOgDXEIA8Ku7ym6vNCDMhAAi7ZAr2zM3YyHT9TmNkoyrJEK
	KGGUe9pcjJ+uWK+cz/ec0A6viktZW0J9TEQ+j/mG0t/iMPioL6irDMtiV9ef0+7ZRWXRQX2Cm0F
	qcYxUuTfcJ/bsN1UjMl6HxUex8IsTizf5MIl1dA89NISrS3B85XSv/9zkx0g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6d92:b0:4b8:4703:db93 with SMTP id
 5614622812f47-536ff59a6demr1655947b6e.28.1792148076676; Fri, 16 Oct 2026
 03:54:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 03:54:36 -0700
In-Reply-To: <683199ed.a70a0220.29d4a0.07f6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2026c.a6d1a155.34a93f.0002.GAE@google.com>
Subject: Forwarded: [PATCH] HID: core: serialize report_descriptor_read()
 against probe and remove
From: syzbot <syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] HID: core: serialize report_descriptor_read() against probe and remove
Author: krishgulati7@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git next-20261014

Since commit 54f32fd5dff9 ("HID: Make report_descriptor available for
all devices"), the "report_descriptor" sysfs attribute is part of the
device's attribute group, so it exists from device_add() until
device_del(). It reads hdev->rdesc, but that buffer only lives from
hid_open_report() until hid_close_report(), that is, for the duration
of a driver binding. For a driver with a report_fixup() callback,
rdesc is a private copy that hid_close_report() frees, so a read that
races with the driver being unbound accesses freed memory. syzbot
reports this as:

  BUG: KASAN: slab-use-after-free in report_descriptor_read+0xb5/0x100
  Read of size 24 at addr ffff888078d61f00 by task fido_id/7281
  ...
  Allocated by task 10:
   kmemdup_noprof+0x2b/0x70
   hid_open_report+0x1fa/0xf00
   lg_probe+0x29c/0x890
   hid_device_probe+0x46a/0x870
   ...

Because hid_close_report() also clears rdesc and rsize, the same missing
serialization can make the reader see a NULL rdesc with a non-zero
rsize.

Hold the device lock in report_descriptor_read(). The driver core
already holds it across probe and remove, so a read can no longer
overlap with them.

Reported-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
Fixes: 54f32fd5dff9 ("HID: Make report_descriptor available for all devices")
Cc: stable@vger.kernel.org
Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 drivers/hid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..824557a02544 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2270,6 +2270,8 @@ report_descriptor_read(struct file *filp, struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct hid_device *hdev = to_hid_device(dev);
 
+	guard(device)(dev);
+
 	if (off >= hdev->rsize)
 		return 0;
 
-- 
2.56.0

