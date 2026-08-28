Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1B286881
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933855; cv=none; b=Jhz4Nm5PNKywS5gmrjFmtjKLEdKKuMbRHIVGW7+EwNX4ggAtXSvR8gh0tcTetI0pqVWgw5rN0TUPNMI8DbJJrC59VLtqIvbZdxfvLQgx5w/3FH1x/DX461dH51X9zdcHF1wSX607Z/unukIIUZ+Zx2IInY9E0XMU7tc70BGFAgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933855; c=relaxed/simple;
	bh=BfrribnGuMzwkvLQD9y7CqY9uR8M04AC1QFP7/xLeeA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jXca+TGsTokks1LKF9YvI3SGd92G4AwiHpZ9QG9PDmksZhBTeYTdoZyFG4YT7NheHjPk5kOvJhc8F9+i6OQAKV810c05+fMxPpoVhUNopc8+dTebGHWZqgLIqz0i7F367kX0uLuJWCseZ6F/DVxWNBBzhKqm8T3RxNmL+QNzAYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4dd46ddeso806546b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933853; x=1788538653;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QDJAB0MlLwaSRAbJcdPI2iJDyC3FkSwhNBBT/P1D5cQ=;
        b=UPZiRNaK+fZb3ICQ7Dk2hUPNqqpI7kIX2LIXp1M6qcXcWOXaJr7nbVVe0P7PXtpxet
         yjU79vlfw4F+hpAh8yY6HmfU7SjtKNUfLYOVOZ8XV9/zdgvb/nx3zmgGe/t2MgkMpsvB
         ttahL2FbsUGQ5oLjgEF6OCY1vlGgiQn8OlvX/M0Pv0tFI/fVDlG3ohMx5xUrPQy5lvuG
         dN4LFGqAst/U1nXqfAv2ThsmB06dgAHJh/wbiaa/OFULaLDIDk9u3Hyu98sZ1P2FDkjl
         egbNznUaZp/p/zHBrrrVkrSUb5OqksNLmJ8yriQSRgJhImZj+pl3YNyoulAC2KZBJPNm
         JwBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWGTOrbnsHRNzqArRpXehzeu5f/pQz3zemJCYmTjnmNl8EB2e3y+cg5VM51QCBmrV5DvVlLTX1+1boo1U=@vger.kernel.org
X-Gm-Message-State: AFuF++ktamkx0jO/qw4rqDEJNpMfrPnuQWosFBrGVBenQqLL3yWcw9tT
	J0/8obWlHIKrT2xsGuAttWjKIhC+tdD8NsSitjZ9ZGn3LsWH1bFbugJlA8rHtF1NncexsYffWtI
	SqPmRhUr9wx090q3R+qJaPKPftjFFfy0MJg4PPx8amZY3n3q+WPi93Zx1sSE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b08:b0:4b3:941a:e7c7 with SMTP id
 5614622812f47-4b39828e6a5mr7927806b6e.15.1787933852953; Fri, 28 Aug 2026
 09:17:32 -0700 (PDT)
Date: Fri, 28 Aug 2026 09:17:32 -0700
In-Reply-To: <6a8a5f45.ae6ddae5.3da009.005f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a91b49c.1d9ded08.62e62.00f1.GAE@google.com>
Subject: Re: [syzbot] [sound?] BUG: scheduling while atomic in drain_urb_queue
From: syzbot <syzbot+919c31c248e8a37b89d1@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    1b78070aaef6 Merge tag 'net-7.3-rc1' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13016d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=919c31c248e8a37b89d1
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162add79580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+919c31c248e8a37b89d1@syzkaller.appspotmail.com

usb 33-1: config 1 interface 0 altsetting 1 bulk endpoint 0x1 has invalid maxpacket 64
usb 33-1: config 1 interface 0 altsetting 1 bulk endpoint 0x82 has invalid maxpacket 64
usb 33-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
BUG: scheduling while atomic: kworker/0:0/9/0x00010001
locks held by kworker/0:0/9: 7, on CPU#0:
 #0: ffff888023287940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3362
 #1: ffffc900000e7d08 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3363
 #2: ffff88802c0c21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c0c21d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bb/0x4420 drivers/usb/core/hub.c:5912
 #3: ffff888023ae91d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888023ae91d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
 #4: ffff8880348291a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880348291a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
 #5: ffffffff90bc96c0 (register_mutex#6){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #5: ffffffff90bc96c0 (register_mutex#6){+.+.}-{4:4}, at: usb_audio_probe+0x385/0x3b10 sound/usb/card.c:985
 #6: ffff8880268bc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
 #6: ffff8880268bc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574
Modules linked in:
Preemption disabled at:
[<ffffffff8bcf4ceb>] __mutex_lock_common kernel/locking/mutex.c:645 [inline]
[<ffffffff8bcf4ceb>] __mutex_lock+0x17b/0x1bc0 kernel/locking/mutex.c:821
Kernel panic - not syncing: scheduling while atomic: panic_on_warn set ...
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 vpanic+0x553/0x970 kernel/panic.c:651
 panic+0xd1/0xe0 kernel/panic.c:788
 check_panic_on_warn kernel/panic.c:525 [inline]
 check_panic_on_warn.cold+0x19/0x34 kernel/panic.c:520
 __schedule_bug.cold+0xc4/0xf4 kernel/sched/core.c:6076
 schedule_debug kernel/sched/core.c:6105 [inline]
 __schedule+0x4066/0x6920 kernel/sched/core.c:7119
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7362
 schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
 drain_urb_queue.part.0+0x303/0x470 sound/usb/midi2.c:246
 drain_urb_queue sound/usb/midi2.c:242 [inline]
 snd_usb_midi_v2_drain+0x79/0xb0 sound/usb/midi2.c:383
 snd_ump_rawmidi_drain+0x85/0xb0 sound/core/ump.c:294
 snd_rawmidi_drain_output+0x3b3/0x880 sound/core/rawmidi.c:282
 close_substream.part.0+0x3eb/0x860 sound/core/rawmidi.c:551
 close_substream include/linux/mutex.h:253 [inline]
 rawmidi_release_priv+0x210/0x280 sound/core/rawmidi.c:580
 snd_rawmidi_kernel_release+0x3a/0xd0 sound/core/rawmidi.c:596
 ump_request_close sound/core/ump.c:623 [inline]
 snd_ump_parse_endpoint+0x15f/0xb00 sound/core/ump.c:1135
 parse_ump_endpoints sound/usb/midi2.c:810 [inline]
 snd_usb_midi_v2_create+0x1b97/0x4070 sound/usb/midi2.c:1158
 snd_usb_create_quirk+0xad/0xf0 sound/usb/quirks.c:544
 usb_audio_probe+0x96e/0x3b10 sound/usb/card.c:1058
 usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3776
 usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2708
 usb_new_device include/linux/workqueue.h:715 [inline]
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
