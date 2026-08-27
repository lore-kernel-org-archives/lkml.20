Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D884CA284
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856694; cv=none; b=kL52Vgqb1ltjSBSwvEZv3nNIPMugzg+yQJMH2v1SXA8Vonq7AHkhmX7u43ceOB4FMdTHLHOB2i49Awd8BVpJelEIpgnCWTbDK7fUJMFXCCopz4NTi9Jjt+nI84JiHHQTOOXGRvURw2Q8MvlstF/e33cy2eFVN3MDb+dRVDZ8dXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856694; c=relaxed/simple;
	bh=T0zbqyrpRp1FvWAidlSqqYWCdrdXzxoIeclqnFv8mOc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a1xQGiRDqI2nXx2KdnJgqmsMx2N2Y5KEqIoc1NobrhMSC7NeL99jihZJe5RGwEygdMbnJLFOmL7Mh5qVURbr8K0/pTveYjOTFSnTAGsc7YeAUhby2qEr0S/xloOF8lw7fYXeGSQclXUP/voeKvEJqt2la8Pg9RJYYX2zxX77tfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-49ec9d117f2so6106b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856691; x=1788461491;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7ZvPJUSXVravWyacYbLAbOm1boAfna4m6XSSgskkGE=;
        b=eDkY06eGE2CweDIUaSsTp/cOqu3E/eJwbV+aXrgute4x/cE5t1RNgV9+oVNJpDjvFQ
         +V5DffIr1soEbim2xgK+kmfxSFD8kpTArKHSbR6Vc36UJuXXOXqrK9zuMxhJf6qUxz5Y
         Bfw7K3od96CUQYqK1CKyRURyEDdJ/aN0WnSfyM4kGNIFmxTRPlS/grJKCoq0VGd7evED
         ZEzFv+P64P6Axod3tiJDs82i5Tc2BvXGZTAibKmKJocu+tKBSEsvHr+GzeuuPnIlwefz
         s/amx+wmewaBcbVyRkUbZfKhsLS9caQphsU/Voi0ZVrzxy9PfipOLoKvnMOlY1uoldYi
         IEKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZmMf2YarvSpHb2a/jVCTD+TGpYgsF6ZE5E2pnwMW2tmZvARwfDgFp7oGsFgLe9HcbOOoZ6SQHc/jL3v8=@vger.kernel.org
X-Gm-Message-State: AFuF++mLBCbPst6UMkOmfNhCvxQV8TRSNc9Ix9Jc6gqOnyN++1AMhNc3
	Gk8ncPr73kveqfz7zadylGzqV3Q7IgSJmLWs9kG/8F7wf8ioypuFBtnpAO8YjQJRiuhXvJ4wVx8
	djQtNYq+AslSHkAmfx4kiqqvA1IKV0sd/b2Z6QvYskb/RWC4w5Da+KCSaFoA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f5e:b0:4b3:7aeb:1b73 with SMTP id
 5614622812f47-4b397f72c9emr1072227b6e.2.1787856690892; Thu, 27 Aug 2026
 11:51:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:51:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a908732.1d9ded08.62e62.00d7.GAE@google.com>
Subject: [syzbot] [usb?] [dri?] WARNING in drm_mode_config_validate
From: syzbot <syzbot+901485725495f4729987@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, rubenru09@aol.com, 
	simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10ad399e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9b0fc292fc5639c
dashboard link: https://syzkaller.appspot.com/bug?extid=901485725495f4729987
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17af0579580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17639625580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ac6556827073/disk-45c13f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/01ff014f18d2/vmlinux-45c13f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/77e9c6302a14/bzImage-45c13f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+901485725495f4729987@syzkaller.appspotmail.com

usb 4-1: config 1 interface 0 altsetting 0 bulk endpoint 0x1 has invalid maxpacket 0
usb 4-1: config 1 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 2
usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
------------[ cut here ]------------
[PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup
WARNING: drivers/gpu/drm/drm_mode_config.c:872 at validate_blend_mode_for_alpha_formats drivers/gpu/drm/drm_mode_config.c:872 [inline], CPU#1: kworker/1:0/24
WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate+0xfb4/0x1be0 drivers/gpu/drm/drm_mode_config.c:938, CPU#1: kworker/1:0/24
Modules linked in:
CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:validate_blend_mode_for_alpha_formats drivers/gpu/drm/drm_mode_config.c:872 [inline]
RIP: 0010:drm_mode_config_validate+0xfbb/0x1be0 drivers/gpu/drm/drm_mode_config.c:938
Code: 00 49 8b 57 18 48 89 f8 48 c1 e8 03 0f b6 04 28 84 c0 74 08 3c 03 0f 8e 00 0b 00 00 48 8d 3d fc 06 ce 07 41 8b b7 c8 00 00 00 <67> 48 0f b9 3a e9 fa fd ff ff 48 8b 5c 24 20 e8 31 3d 68 fe 48 8d
RSP: 0018:ffffc9000019edd0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888108692dc0 RSI: 0000000000000023 RDI: ffffffff8b1a99a0
RBP: dffffc0000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffed102175f9ca
R13: ffffed102175f9cb R14: 0000000000000001 R15: ffff88810bafcd60
FS:  0000000000000000(0000) GS:ffff8882684eb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000000 CR3: 0000000119ed8000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 drm_dev_register+0x56e/0x7b0 drivers/gpu/drm/drm_drv.c:1077
 gud_probe+0x17f4/0x1c20 drivers/gpu/drm/gud/gud_drv.c:646
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
 usb_new_device drivers/usb/core/hub.c:5833 [inline]
 hub_port_connect drivers/usb/core/hub.c:5580 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event.cold+0x51a/0xe9d drivers/usb/core/hub.c:5966
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 49 8b             	add    %cl,-0x75(%rcx)
   3:	57                   	push   %rdi
   4:	18 48 89             	sbb    %cl,-0x77(%rax)
   7:	f8                   	clc
   8:	48 c1 e8 03          	shr    $0x3,%rax
   c:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax
  10:	84 c0                	test   %al,%al
  12:	74 08                	je     0x1c
  14:	3c 03                	cmp    $0x3,%al
  16:	0f 8e 00 0b 00 00    	jle    0xb1c
  1c:	48 8d 3d fc 06 ce 07 	lea    0x7ce06fc(%rip),%rdi        # 0x7ce071f
  23:	41 8b b7 c8 00 00 00 	mov    0xc8(%r15),%esi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 fa fd ff ff       	jmp    0xfffffe2e
  34:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  39:	e8 31 3d 68 fe       	call   0xfe683d6f
  3e:	48                   	rex.W
  3f:	8d                   	.byte 0x8d


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
