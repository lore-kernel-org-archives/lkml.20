Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119265;
	b=FRHm2JygwYcyYEy0VLDlwTTIQ1cmc1ln7EXFZOAmCehgYvN6Gd1vsVoELBWM/4tHlbEz
	 rr1aHO8TN70XsmngtYlG/VGMq96/Bzv03BhW0dAvPgKbf/aJT0uT1+hNsftJEFgZfI8Iq
	 wXT/c3ZYKv8UQ+3jpvt2xDYzbhOqs5yo+q5h2//H07BSaXj/opDrZjMYmQW8/2D2ZHCCH
	 qBL9ZAicYTu0i9zOcNWbwx/zexNFzjB6iOCK3eHDeNsN4BKxnqAc19Ux+SSBf07oLAO3X
	 JTvKOjBCQhljNBxkJF6EHL6HnDZw9QX0rTxAzFOVvovCOX+dex8dzd9hyejmhNawA6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119265;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=kPUc3KQAvHouFenG0FCj8Kc7EhekozjtsrCUYYp6YRY=;
	b=EjPJeMati/MIoyITZMe5reHCKrROYnHBkIpT2w3U1k00IENX5GuYyv4w4UIGsiNFXMLD
	 wbKBhCjbWwj1GdiWFeQlpO597u1KhXSORZHZRY/J4S2siaYMyWsmumx8MeXc9c+WtCkrt
	 nRd1GjOpdtOtFlRF/KWfUucflPhBnsZBurDtoMzVXIeRut1rGc2cws4pY7rAM9cSU16HP
	 CFkMYaMlBvtzdavSVhG8cFXpL3FA1+nzBP7RNeIFMWVkNXA+hjGZ3HQJIzo8FrRDuE1ra
	 vwdN1bCjH547416sYlgkfFs7Yo64GNVfBLdBFWrHHIlQFIT4a5OWiNylHrHCNH81E6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2ED5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbf700ddccso93355b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119264; x=1793724064;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPUc3KQAvHouFenG0FCj8Kc7EhekozjtsrCUYYp6YRY=;
        b=tPQcwJsmiz2gdGsEsZao7jJ1K3NA1/2LFs0HoMfcaAC83ntwBz5apMj2TPDuLVeHoo
         6QdknJNZQm7NRqyoJNWhtv6AwtSBlkV8urAyPrKYhdBaSApRlEb4wX8yDmevwc90G1+A
         rZWeMF66Of06FLzWWh1L3E5PAxXcCEIt5O+xHdnea4EHGrAyMw4oOLkbloQTIX/HqlwS
         WdKP2Pg6ukVZRGBjY7TdXMgdUR6yJKda2jXh2eHPngw1AWaBPUBycHIdyoRrl1fu6bH0
         W26VFK8xixAkDY7h+pd5DtRjgeHA4w49qn7HsurGgLX7nkVti/zChG9vu6/tdAfK0NZD
         4Gsg==
X-Forwarded-Encrypted: i=1; AKwUvBwYS+3CI/7G3rE4P9Mk31O5z4L3ist8oZUDtrn5n7qJORA/XuvjcAdtUiNkDXhjvF91lyneEDYTCEeifMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCkX2Sr7z4MWgPcafFZPwrEbZg/tbbpnHzeZT3h5gyp8PDjwoI
	+lb6rM8KjqB7GylNxTQ35TzjGNYppMZmP3MTjlbLnMIz/oNP4o4YbhBC0Q1/Vra6FJCTzhi4I28
	iiLyn7dyVWS0Sbd1Lo8ziH10uzOX9VFWZHEuNvlVHFrWDw/dEyCqIZB7YdrE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cb:b0:4f7:d324:bc5b with SMTP id
 5614622812f47-55c003f07a0mr6824533b6e.57.1793119263864; Tue, 27 Oct 2026
 09:41:03 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:41:03 -0700
In-Reply-To: <179311142878.187144.14168935384418059345@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0d41f.3a3d6196.2ecadf.0068.GAE@google.com>
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: harry@kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in enable_work

------------[ cut here ]------------
workqueue: work disable count underflowed
WARNING: kernel/workqueue.c:4691 at work_offqd_enable kernel/workqueue.c:4691 [inline], CPU#1: kworker/1:0/24
WARNING: kernel/workqueue.c:4691 at enable_work+0x1c7/0x230 kernel/workqueue.c:4862, CPU#1: kworker/1:0/24
Modules linked in:
CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:work_offqd_enable kernel/workqueue.c:4691 [inline]
RIP: 0010:enable_work+0x1c7/0x230 kernel/workqueue.c:4862
Code: af a8 39 00 4d 85 f6 75 48 e8 a5 a8 39 00 eb 47 e8 9e a8 39 00 90 0f 0b 90 e9 bc fe ff ff e8 90 a8 39 00 48 8d 3d 39 2e f0 0f <67> 48 0f b9 3a e9 d2 fe ff ff e8 7a a8 39 00 90 0f 0b 90 e9 1d ff
RSP: 0018:ffffc900001e6ae8 EFLAGS: 00010093
RAX: ffffffff818f4e50 RBX: 0000000000000000 RCX: ffff88801fa85dc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff917f7c90
RBP: 0000000000000000 R08: ffff8880b853b803 R09: 1ffff110170a7700
R10: dffffc0000000000 R11: ffffed10170a7701 R12: 1ffff1100ec47807
R13: 0000000001800001 R14: ffff88807623c038 R15: 00000000ffffffb9
FS:  0000000000000000(0000) GS:ffff888123b48000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff21fa87440 CR3: 0000000075588000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __cancel_work_sync kernel/workqueue.c:4732 [inline]
 cancel_work_sync+0xd9/0xf0 kernel/workqueue.c:4766
 smsusb_stop_streaming drivers/media/usb/siano/smsusb.c:182 [inline]
 smsusb_term_device+0xdd/0x3d0 drivers/media/usb/siano/smsusb.c:344
 smsusb_init_device drivers/media/usb/siano/smsusb.c:496 [inline]
 smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:574
 usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:623
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_set_configuration+0x1bb5/0x2260 drivers/usb/core/message.c:2274
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c3/0x3b0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __device_attach_driver+0x270/0x410 drivers/base/dd.c:1026
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:503
 __device_attach+0x2c4/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:623
 device_add+0x7d7/0xb80 drivers/base/core.c:3776
 usb_new_device+0x9aa/0x1690 drivers/usb/core/hub.c:2713
 hub_port_connect drivers/usb/core/hub.c:5585 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x28e8/0x4d30 drivers/usb/core/hub.c:5971
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	af                   	scas   %es:(%rdi),%eax
   1:	a8 39                	test   $0x39,%al
   3:	00 4d 85             	add    %cl,-0x7b(%rbp)
   6:	f6 75 48             	divb   0x48(%rbp)
   9:	e8 a5 a8 39 00       	call   0x39a8b3
   e:	eb 47                	jmp    0x57
  10:	e8 9e a8 39 00       	call   0x39a8b3
  15:	90                   	nop
  16:	0f 0b                	ud2
  18:	90                   	nop
  19:	e9 bc fe ff ff       	jmp    0xfffffeda
  1e:	e8 90 a8 39 00       	call   0x39a8b3
  23:	48 8d 3d 39 2e f0 0f 	lea    0xff02e39(%rip),%rdi        # 0xff02e63
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 d2 fe ff ff       	jmp    0xffffff06
  34:	e8 7a a8 39 00       	call   0x39a8b3
  39:	90                   	nop
  3a:	0f 0b                	ud2
  3c:	90                   	nop
  3d:	e9                   	.byte 0xe9
  3e:	1d                   	.byte 0x1d
  3f:	ff                   	.byte 0xff


Tested on:

commit:         5b0764a5 Merge tag 'drm-next-2026-10-21' of https://gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=176c7d31580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175c482d580000

