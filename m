Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CC37AA96
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535961; cv=none; b=OB4KCpMweZvcF/wZR0akHaN5cFbrp723oyQMfmP/TYf2Yg0aAg0qYLVvOBUHyTGeFpCQAloir0GpvWHIvHHVFkLyif6AHpORIvujVAP+hG3wTCRcXaNVXxoVKA6r6lNrTYoWY61o3xCK5UsEkFliGWV9APxk444guMFXlwtDCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535961; c=relaxed/simple;
	bh=V/Ql69VGnfzIVESBUI6mXdFmWLuUvbDYYyjwzIKNw+A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uEGkS+hV6QqbByx7BlM7PPi5LnD+GVlTzC5lQQJbw5xgsq70tMq0UhLoKVh7iT/9T0WMZwrDaExL1y35QqPkKc5ipQgaZ61uNZeTyTDLI9f7xsgBcGoYq7MQSijXsaT7qwKGyoBqqElRD5/Sne8W5/Yzv0sEqIeQ1w7DbKIgWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso5834894b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535959; x=1792140759;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C6ZqRlPw6luZA9CZj6npWaM6J27E2GLTOqdvKYVlgA0=;
        b=ytkSu9D4bgzHQstNL105W8kk5IDGcH+XYSO01qmeQwE95kMVmGHCzd27JhweB2B4hH
         zmgG4ieLQStUV8539cm4b0k+gVGl/RtZRiKIbwGCss608VAG8kwdh8oMSji1PVLb/9Lt
         aZDlsNaeg6lCZRqxu8pYG/BdGxXJuUvTuionZfb/hi+UnE4bETzftmMayFKUjS6M4wwm
         YePHp1uD716jrJsqY5+uFmomnyPGViDL+yxAGbJx09/6Jto7AmrFJbQm9ETxvV4zW5QX
         781iojs1l/ianKCFAJCgpXVmBOhi92Gw3wX0G+xJ96W+COyDq0SApVmZ+osYZeJjh977
         VpWQ==
X-Gm-Message-State: AFuF++kk2eQji0x5hAlHCKD126umX0ASr5XP033/sHH2Y9BZoDvwnwwu
	vNatuVJHy9eSMEdq48AfKXWM3BX3r8bDvSOZFE1svWmFdSwrui1vut0iJ3JJxobfSSI+eOKJ+4g
	TvJJVHETidHIRVybegtf5pyxeAr0RchDnIZCe055p8N9mSCT+Q0Nt7UaSTEY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1918:b0:4f4:3f10:830d with SMTP id
 5614622812f47-50c5b27c152mr1227786b6e.53.1791535959234; Fri, 09 Oct 2026
 01:52:39 -0700 (PDT)
Date: Fri, 09 Oct 2026 01:52:39 -0700
In-Reply-To: <683199ed.a70a0220.29d4a0.07f6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac8ab57.8cdf6287.1eb53.0041.GAE@google.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master 

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

