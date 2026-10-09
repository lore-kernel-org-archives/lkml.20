Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD247605A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541711; cv=none; b=auwkYbbA9wg4yMmImrnjSIDeV3CpU1+kiGLCzPyV+h5PCQnEyOTlyC2njwwRVNBXDzxQecY+t6Y6U1GZNA0f+4U9fUgNUFIZGcdhk9mA+jMrcArgb9m8+skGs3nTxsemWrfQjpeDyKI3fu7SI0vdQYUTd+c8+4crrVlPH533bpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541711; c=relaxed/simple;
	bh=yOVTPJp9qxA5lLF364+JvUXV98S76nBEFr0WnEBHdac=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CC58L7UuwkOm2YDJ/IkLP78VDTx3KGecmT2jrM9qPAdlvxvLHdFN8X8AMncMHyne11/IWrXdviolVQ047UUWHKX6OHhYx4p85TEZzJF9NcK6nxxyWuc9R3gOtkpzLGPylVuKF6Bjb38/28OWEh0/+QKeMtoz+dk67h+o4zTlT7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f4612a1a5cso2201996b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541708; x=1792146508;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxN8WxZVMdmLmuCAhmZTJH8qZd7vgJyAa6Dc6LhPvBs=;
        b=jY8ByJJupRREnl4P/cdLqqLu5GCMMIvNaNsSltzVg5RLGlBhZGdQUFEfgVlRLo5vw1
         kTt5qhfhgB/5QdL9X/2pEI2xfeFwkvi15WzPANTTUMqxOV9oWDHW0UJyfAgIQgNuDWzE
         QwLp+dRYPgJ6dtmti/1Zjcf7pKoq4JnAzAdb+Bz6FT3CKiR5TUUw9pzQbaIfr4eQjIlu
         hsIXoBRudkX3rZAUCQW97MEnnpuE7xRNLiNwtuGL2xDBKjxa9gM9K944XWmnDnCvUk+8
         FXOYnuHswj/5pfuL9qIGtazjuOH2Q7aEbFN6SCtO8zcP6U4OmwVVbemjHeBkKZnFQzAk
         r6XQ==
X-Gm-Message-State: AFuF++m7b2F1uIggJ885c+n06bEEtJ+9FQT0zn8zXMa4V1DXqigXfzua
	FPfyaPI8uIIIrombInA2ik3S+igq3GIyx1v94dsEvB1RUcMaSfcYkkCvdz38a9n5er5TcVRC/NA
	OchXwwxzj+H5GIynL555aiLJ9ouDIUhNK97a1CDbOqv8tl8j5m3ZqfXtTT1g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c8b:b0:4d6:9133:cfea with SMTP id
 5614622812f47-50b68b3682bmr1320016b6e.47.1791541708690; Fri, 09 Oct 2026
 03:28:28 -0700 (PDT)
Date: Fri, 09 Oct 2026 03:28:28 -0700
In-Reply-To: <683199ed.a70a0220.29d4a0.07f6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac8c1cc.a150a118.27e199.0023.GAE@google.com>
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

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git bdab5605259b

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

