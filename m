Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CC2239E9B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791177454; cv=none; b=TAk2ntdyT9JxgZLE65DbRbNPPASo/7y+2r9XaQt6jQYti6pLs8jC5mvMN2gUhapKoWsFIk9Ulo4qRzEuj1I2MJ6JXOAZ1VWa+FdrspCTARpCdEDVbmusQafk3FXCoQkrd3pZcoeiC0PL8jGEqCiJK/M3b0PS4LyFH9R3Iyi8t0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791177454; c=relaxed/simple;
	bh=O43mM4fr02Xx/jsKGSTF4uneqSaUTIh4j9o8SiMa14E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oCyf7uTSyz5PRNICDYar2B5yrJcfjrT1N6huVonZRn71kHYi2gnX81wJXSa63j1sVNBxzjivZENpJ/D8rO+XsKphStRQd78J6CcNYwxWZR3t3L1GzB7G9Y0Hr6pypDM5UiHA3v2az3bhW9GU7p+T+6aDES+MpWaJ6di+TY7iS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81b20bea169so1487654a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791177451; x=1791782251;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPgY2QqAXkpTT8ue2JQI/5i8AHyd2xVyfOf3038fJ9Y=;
        b=BZ/5S6QbXhfnNV8Ap7T9MGeqUI/K43tWvp+8RoZuOv/m8Hj+IXeJBRNCpJS1f/i3Xt
         iWwB420j5F50X6HgFRByHKR7T3BbKNtVGbHiUeBMGSz+DWPAlcQmVpXMgEGtrBQITeY7
         dQm59/c8G59noKUguySCoLAQ1qcgIInl6eQ0TsIu/TmOOudF4PXfG2AjFA1jPXQCrN3a
         88TNsyyJsar1r69B1L15mZPolTEpDSsSyITW2P/0U3hJ6MIiYUru69a/OsfUUX7Q7lu0
         RJK0GymnDqqSm+UsStbWnM8YNVq+Yuu6v9WTfZFv/MXSDQSSJUVqCMPTRjkFyD4aMGjH
         AZOA==
X-Gm-Message-State: AFuF++m9bwi0sZurvFSIOGlMeRdJZh/m3Jl+Lxw7psLNIYZpzIPkyJlm
	fylClCjcYiuLiDB1Lgb83lwr5zL2KdwB43toVZTjO/SiQLLTK1QkfrlSc/bEHwZEKvF59udXRxb
	GT8Wyl8JGg2veHslRC1bbFIy6j9yjnGbSUN6idOgEr5EzmkiwwMinGYKdPS8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1924:b0:4f9:6348:cd3b with SMTP id
 5614622812f47-4f96348dac1mr1348428b6e.41.1791177451757; Sun, 04 Oct 2026
 22:17:31 -0700 (PDT)
Date: Sun, 04 Oct 2026 22:17:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6addb4f38557 Merge tag 'edac_urgent_for_v7.3_rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154b0f25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134b0f25580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10cb27f5580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/70aa10806ffb/disk-6addb4f3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/053f6eeab8df/vmlinux-6addb4f3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9427f05ec282/bzImage-6addb4f3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com

smsusb:smsusb_init_device: smscore_start_device(...) failed
------------[ cut here ]------------
data & WORK_STRUCT_PWQ
WARNING: kernel/workqueue.c:4425 at __flush_work+0xc8f/0xd70 kernel/workqueue.c:4425, CPU#1: kworker/1:4/5659
Modules linked in:
CPU: 1 UID: 0 PID: 5659 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:__flush_work+0xc8f/0xd70 kernel/workqueue.c:4425
Code: 38 00 90 0f 0b 90 31 c0 49 bd f8 f8 f8 f8 f8 f8 f8 f8 e9 2d ff ff ff e8 7f 24 38 00 4d 89 f4 e9 ee fa ff ff e8 72 24 38 00 90 <0f> 0b 90 e9 23 fd ff ff e8 a4 60 ca 09 e8 5f 24 38 00 48 c7 c7 80
RSP: 0018:ffffc900051ce960 EFLAGS: 00010293
RAX: ffffffff818eb3be RBX: ffff88813fe4a005 RCX: ffff88803a410000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900051ceb18 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f64590 R12: dffffc0000000000
R13: f8f8f8f8f8f8f8f8 R14: 1ffff92000a39d34 R15: ffffc900051cea08
FS:  0000000000000000(0000) GS:ffff888125cc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0e9993643c CR3: 0000000045a10000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __cancel_work_sync+0xbf/0x110 kernel/workqueue.c:4568
 smsusb_stop_streaming drivers/media/usb/siano/smsusb.c:183 [inline]
 smsusb_term_device+0xdd/0x3d0 drivers/media/usb/siano/smsusb.c:345
 smsusb_init_device drivers/media/usb/siano/smsusb.c:497 [inline]
 smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:575
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


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
