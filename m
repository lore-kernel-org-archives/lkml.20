Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C24A1E01
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306965; cv=none; b=gdIkVYyAqriqpQK9ZkTembjPxkUyrN1EEZaBu3Ft65h4q0z1IoNKW26X/xvUm7NSNxB+DX9bFeiVDdgmuk3J2fUcDmSa79co7XZ2a392B8WWG/fIIih3xfZGSkEh45gNtVpYlZ0LGwy7u6aPCZEI8UvGFp8xNyzrj651NTOnMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306965; c=relaxed/simple;
	bh=2LhvKNfXjirIqU57oe2YY/T0W86EQijBsx+nVPG1t9E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WURH6fz4S5O7MDOI1HgDvq1CXv3ofPnzcyIZSn3PNXh+K/vWEsXy+eAFogei/OcIgYV0UAOT8dw76+FgngKCsNaaMrYq6Bb1HagSzdZheue4Bqz4MHshBcCpAxQeXn83vE3XSyzb08VqW9Qgv5f8M8BiW6g90rajAtoMXmZEY/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so3903281b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306962; x=1791911762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=siyiGTq0y6RwxOFicmUR5RZfSwiB5r+3P84mEp+5CPk=;
        b=EMRxPiXpaxuZcjFj1MPoT6S7cxO/Imlp0eFGCc/GtZfVMQEnAK5qEbHX9u7SwTh8vb
         KJ7NkyrRiyLggrwrDPHbHcws4U0RQssSRpAibbaqOBNYG3dlCPR0f16LDlHCsd5osS4V
         Hvh+g4fKLrS+aghMu6C9XQUsayP/GlzRM3+MWR1vkQJKcW8F7Hhw2EZhiPdoukha6sZu
         FIqbjp1a3TpFnO9MmZjCEfww5OaQMYZhCsxOLXZuxU5HDXtA1BdDUCLDv/KHf2NhEn+l
         /ikQhC2ekokK/Ze6ANXQfK8ZPHVqIjMjmcgi7v51cxvkmWKbC4Kvz5Ud5JMB/8kUi3ge
         NtKg==
X-Forwarded-Encrypted: i=1; AKwUvBwF82QIccf57hysCg5Rjcuj6v/h/4t4EDCOcRDwaOClkpF7vN5/jTmG8K+ekJQ6ya9GhAYiGWeJe8pmqOc=@vger.kernel.org
X-Gm-Message-State: AFuF++kL66jw6F1DK0xLip63RgQ1uSyKsjHsA12TJfLIKw2AaCPsn7nD
	dOL0OLp8Hf97ltj1xmbyK3PlvYmcqb0Ei6gK3LYCDIp1fJ7R2hGBEzyRCvB05DYH1EvfeP0Nzf2
	CdhOHyeGlHfzoCjMjN0lCjbvduvhiRlwTGjv7Vvn5x1nhjuYw9HDuotAgiuA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a0b:b0:4e7:8f9b:1191 with SMTP id
 5614622812f47-4fb40da837bmr1980959b6e.52.1791306962295; Tue, 06 Oct 2026
 10:16:02 -0700 (PDT)
Date: Tue, 06 Oct 2026 10:16:02 -0700
In-Reply-To: <20261006105153.8625-2-jakovnovak30@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac52cd2.9ad129c8.3ce5b3.0005.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: jakovnovak30@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in enable_work

------------[ cut here ]------------
workqueue: work disable count underflowed
WARNING: kernel/workqueue.c:4530 at work_offqd_enable kernel/workqueue.c:4530 [inline], CPU#0: kworker/0:1/10
WARNING: kernel/workqueue.c:4530 at enable_work+0x1c7/0x230 kernel/workqueue.c:4701, CPU#0: kworker/0:1/10
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:work_offqd_enable kernel/workqueue.c:4530 [inline]
RIP: 0010:enable_work+0x1c7/0x230 kernel/workqueue.c:4701
Code: 9f 1b 38 00 4d 85 f6 75 48 e8 95 1b 38 00 eb 47 e8 8e 1b 38 00 90 0f 0b 90 e9 bc fe ff ff e8 80 1b 38 00 48 8d 3d 99 1c 26 0e <67> 48 0f b9 3a e9 d2 fe ff ff e8 6a 1b 38 00 90 0f 0b 90 e9 1d ff
RSP: 0018:ffffc900000f6ae0 EFLAGS: 00010093
RAX: ffffffff818ebc00 RBX: 0000000000000000 RCX: ffff88801ca8be80
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8fb4d8a0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10170c7719 R12: 1ffff11005420c3f
R13: 0000000000800001 R14: ffff88802a1061f8 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125bc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2ccbc072c0 CR3: 0000000037316000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __cancel_work_sync+0xf8/0x110 kernel/workqueue.c:4571
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
----------------
Code disassembly (best guess):
   0:	9f                   	lahf
   1:	1b 38                	sbb    (%rax),%edi
   3:	00 4d 85             	add    %cl,-0x7b(%rbp)
   6:	f6 75 48             	divb   0x48(%rbp)
   9:	e8 95 1b 38 00       	call   0x381ba3
   e:	eb 47                	jmp    0x57
  10:	e8 8e 1b 38 00       	call   0x381ba3
  15:	90                   	nop
  16:	0f 0b                	ud2
  18:	90                   	nop
  19:	e9 bc fe ff ff       	jmp    0xfffffeda
  1e:	e8 80 1b 38 00       	call   0x381ba3
  23:	48 8d 3d 99 1c 26 0e 	lea    0xe261c99(%rip),%rdi        # 0xe261cc3
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 d2 fe ff ff       	jmp    0xffffff06
  34:	e8 6a 1b 38 00       	call   0x381ba3
  39:	90                   	nop
  3a:	0f 0b                	ud2
  3c:	90                   	nop
  3d:	e9                   	.byte 0xe9
  3e:	1d                   	.byte 0x1d
  3f:	ff                   	.byte 0xff


Tested on:

commit:         69f80fef Merge tag 'ata-7.3-rc7' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14efef25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=129b6f25580000

