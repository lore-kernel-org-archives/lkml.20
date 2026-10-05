Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238631A6822
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236585; cv=none; b=ewLqcz0iQF4yPSmZio2re4WCbvoGFiRLPnxInqkor1TJsFFs845p3BhpmvuQbcEgJT4h61teQjpzgni/nOMV701CtuM+oM7Fd4uvQuw4nfmt+n+CCrElkH0rXlJ4+ZSBATfvepG6mvPzELrp2ZQ8mPsTU+331S6v6tNALJXe594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236585; c=relaxed/simple;
	bh=sl8/wqDthTr95NubhgGmiEaAhuVM2Tz+o1/fKzNtJXI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CQhnbmwcitOYqXJRJF0GweJSddojjAfvD1KjQukQemnKqDv7Nasp/bldV16baZ8XXPeuhrpSmpSsPhEfmPAra6krxKHTtmOa4jd0e/ncQNA7pK6dwMWTpXQOQrT/hZUg0uyIVJJy0BudoFWOgjpF0Yljk0BCUbzeg69tE9tBoyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dbf4197so3881896b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236583; x=1791841383;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3iux4BvdExCs+ytMH0XCrWFJqeBoGdTb6KamzzVoH+s=;
        b=wmiss0cmAiAYgYIw6QhUYbOy0Yx0tCZAVMYjIkR6AwFnZevzfpIvEZEPrhnonwuKrE
         lKlif5PtWOlMkmiVPr6XvMW7N/a3jwHqQqiVPRykHQVYRYvqKkBmytg6CPp99sj1bOZo
         iWrEzDw2HJWfl1+G5zUYp21/8pnVU9EKOdo/zpfLoBO1jzdGgFGv2iaSfJK5EBfHTU1l
         YItXN1L+mI7XqZS1Gbr8g0niDNj8vwDpB/Ij09F1nY0y5nJf0Mo25OhN5pr4CP2A097S
         vudTAZLRF2is0LFiUnA/yn9ytlElsRX09EJYUuOEo9YcQwlfpMyTap7B5XFLJE2w26es
         2v7g==
X-Forwarded-Encrypted: i=1; AKwUvBwnIJ23Xd3Y63bEYhMG5Nm+CE2BgpPW09m5sS5YnKHUpjVZxeIwc/D514AywlLNnnhaK7ZpoPcEn4uwtro=@vger.kernel.org
X-Gm-Message-State: AFuF++kz8eu41fDrkLWkuIjZU7vaqKljvVbxC3NWEG2D5txGCTxG+FYJ
	dMo2bKAwWIc07lAY+HWuWHU2WTgZHqwmawtJMq0/PKlbWHRzzfdKEPnHiSmAhmiGQqSrN7ogqrG
	a+1L4q+OBXSkj+NMaLJkCK7eZxMrQSBIu6lKu7haJ+FchxWXHnUn8UNcFiEo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:444c:b0:4d6:90d3:e18b with SMTP id
 5614622812f47-4f67ae2e07fmr7041219b6e.52.1791236583169; Mon, 05 Oct 2026
 14:43:03 -0700 (PDT)
Date: Mon, 05 Oct 2026 14:43:03 -0700
In-Reply-To: <20261005205339.6324-2-jakovnovak30@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac419e7.ae2c267a.265a6c.000a.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: jakovnovak30@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in usb_free_urb

smsmdtv:smscore_set_device_mode: return error code -71.
smsmdtv:smscore_start_device: set device mode failed , rc -71
smsusb:smsusb_init_device: smscore_start_device(...) failed
------------[ cut here ]------------
!PageLargeKmalloc(page)
WARNING: mm/slub.c:6734 at free_large_kmalloc+0x97/0x110 mm/slub.c:6734, CPU#0: kworker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:free_large_kmalloc+0x97/0x110 mm/slub.c:6734
Code: 8b 43 30 83 f8 ff 74 13 25 00 00 00 ff 3d 00 00 00 f8 75 7a c7 43 30 ff ff ff ff 48 89 df 89 ee 5b 41 5e 5d e9 6a 99 fc ff 90 <0f> 0b 90 48 89 df 48 c7 c6 b8 92 88 8d 5b 41 5e 5d e9 53 3b 00 ff
RSP: 0018:ffffc900000e6b08 EFLAGS: 00010206
RAX: 00000000ff000000 RBX: ffffea00010ffc40 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffff888043ff1000 RDI: ffffea00010ffc40
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1004f31c01 R12: 1ffff11007697a82
R13: ffff8880202cfe80 R14: ffff88802798e060 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125bc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb34c81ae9c CR3: 0000000038af2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 urb_destroy drivers/usb/core/urb.c:25 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb+0xd0/0x120 drivers/usb/core/urb.c:96
 smsusb_term_device+0x1d0/0x3d0 drivers/media/usb/siano/smsusb.c:357
 smsusb_init_device drivers/media/usb/siano/smsusb.c:502 [inline]
 smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:580
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1bb5/0x2260 drivers/usb/core/message.c:2274
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x99a/0x1680 drivers/usb/core/hub.c:2713
 hub_port_connect drivers/usb/core/hub.c:5585 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x28cf/0x4cf0 drivers/usb/core/hub.c:5971
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         67f0943b Merge tag 'selinux-pr-20261005' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10092f25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=100d4715580000

