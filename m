Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305138237A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278226; cv=none; b=SENr58rVlqUWvzhZa5V6EsmLhZ8PdtT6FeLz/owPAE+oZCFv32qyXbDgfpK9XtHGcnVSLbp7858fJpGv9R7znIEAEdSa9bX1U9TgNLvaEArYncZS3fFisIXzzfxIbVPL24MVDnvlP2KgGAVBPjZyhfW6CczhxCE4YvpcU5akmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278226; c=relaxed/simple;
	bh=IZuBGBoa2apa7G2ZujwB3FqU9rzmwChgGL5sU7KTFkc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qyWlGdIOH8/WXXxHI+wghTwdKeow8GeVY1VBqmTKs8A5nQ/R6fRHX2z3TvCqVHpU3cmIbnz+5AdRDVoRvF/MA8s01AUaeQU8xpLQlSDW4SW1/irqn0H7QhBJC1B5NIUnV7yhZQJ61z0qr76twe029jSo+FiZgr9h5OcqMwWZ76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so4043205b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278222; x=1791883022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qoNpLoqjckxr13z3FwyH1xgJaI/So0MmZPUHKo3qS8A=;
        b=SM+uYdeBERGvdcmraR5/KtEJDF6lcelTl4fjNT99egXTjFTutRHyBQqN6FfkWXX0bw
         B/2TW8atmsbcwf/7OL5mFxArgHHhyLibyuI8Eofz0ISSR1LRJwVb5rbKkk+EhMzGs5RS
         Vx4iWyWcAN+uWNCFGEvtM6ppauvWH01+Ia312ROXCQXxKmP8HqiUzmP4CDIC/GC3c1YY
         4+Gsu1HoxmoxU2eMZQtw+qX8qEglvSI+aG7RixbLuEMQuSrSDr1kyGtai0LnoJ69mM94
         EHLSvNiSHYR56CneQbomRK0abaZZ+I25bcNLhUtzZ4Ny67jJsV28v4yy4X+CAmc+nUDR
         LwIw==
X-Gm-Message-State: AFuF++l5HSkYBoATJi4uaSMjdS9uDh4iL//MHcb+ScpU97OoYAC1GNYt
	a92olrwC63n5rNhV5lmzwKc5pNierRzzTOsYIAe9++TNsiEnmVUkvswkL1NrTRMi+7/knEK15sc
	Dj5FpAfM6ntkpXy6ftBHaW+fAOo4ghKRqq6S24OYwCifcqpP42H/lmVHExTo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f1e:b0:4d6:92b3:5c8b with SMTP id
 5614622812f47-4fb424e2bc4mr709939b6e.65.1791278222265; Tue, 06 Oct 2026
 02:17:02 -0700 (PDT)
Date: Tue, 06 Oct 2026 02:17:02 -0700
In-Reply-To: <CAFJkwZxNvwciHZP=4MDScjabXro1rPzF08X3_pR+zY7rCN7Pxg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4bc8e.fe639fcc.32b100.0000.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in smsusb_term_device (2)
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
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
WARNING: mm/slub.c:6734 at free_large_kmalloc+0x97/0x110 mm/slub.c:6734, CPU#1: kworker/1:3/5087
Modules linked in:
CPU: 1 UID: 0 PID: 5087 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:free_large_kmalloc+0x97/0x110 mm/slub.c:6734
Code: 8b 43 30 83 f8 ff 74 13 25 00 00 00 ff 3d 00 00 00 f8 75 7a c7 43 30 ff ff ff ff 48 89 df 89 ee 5b 41 5e 5d e9 6a 99 fc ff 90 <0f> 0b 90 48 89 df 48 c7 c6 a7 90 88 8d 5b 41 5e 5d e9 73 3c 00 ff
RSP: 0018:ffffc90004326af8 EFLAGS: 00010206
RAX: 00000000ff000000 RBX: ffffea0001658c40 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffff888059631000 RDI: ffffea0001658c40
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10055d3561 R12: ffff88803ae5f000
R13: ffff88803ae5f428 R14: ffff88802ae9ab60 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125cc2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f55c6bef255 CR3: 00000000469dc000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 urb_destroy drivers/usb/core/urb.c:25 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb+0xd0/0x120 drivers/usb/core/urb.c:96
 smsusb_term_device+0x1e9/0x410 drivers/media/usb/siano/smsusb.c:352
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


Tested on:

commit:         6addb4f3 Merge tag 'edac_urgent_for_v7.3_rc6' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=152a01c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=150b1ff5580000

