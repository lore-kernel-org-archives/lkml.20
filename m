Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03C4908A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585632; cv=none; b=a3VGlapRu8dAmBnBg9YURYEZQ0JYBTcpQtYkO5kHk4kfe80+nnOGrPC3woeo8I6RHqCNpSc1pt6irJ6h2jZoFVAOdv7iNUHgjP7KDo1qeUM9T9KNbLVa5GjbunluzvUVGM5QWi3lOHk+c3b3ktHBwmv7LIHkWzWAcTDiBpr/Y/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585632; c=relaxed/simple;
	bh=OI/zLBdcwWqcXJBcsdijqs7A/oYENRcAZRhIyGNfddw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GbDcEhqdZdE93Ojua66ekJ9xDbsS4rKMyCGmyEOuv/1vGGkB/3bxO/owI7dMfBbvvseFytEuXGf9GfYDPjM1QBdPD9AuwtZ/e043vo2ZIivIk7QkDI+kozSor9R8STcR+DQVuNPIYYNpAKIBcZhS9H1iBRIEiRt7WJlF410dSfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a49b13b745so19529b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789585600; x=1790190400;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIPY72zdQv/KP29Dl1qeIzc7ZNVmzi1pbkW7l8G4bEo=;
        b=A+x+nHh+oz9kQzsfsoGVaS+QvOTSr+mJGlybp0pyMhH5STvGXmKZT3x6dnDn+k2Ah3
         1lPacoT/YYpaF1ZQzHRQOzEB/TG4aWTPk0lUnQTa5yopiez8Tm6V7lFLW5nyaajfYife
         7KU8psgdN/Y7TaW/RMBhO/7Ws30Wr4lVCFyTw1/luWjAmK7y4b6nvTQ+dnzK/Imwq1FS
         LQ48KDuDERrMYLFqXSQ5lETWFoojtkTE1BouwTkuSVNAxKHXu/08YUxzwXBxsMrU/U3d
         tUHyDzpNQ9RyEFiwGYCbqRq3Zk4NhfCYEJazvoYEzU6VPZs4zqAfB/1rYD8JnHmq3MDP
         DSAg==
X-Gm-Message-State: AFuF++nX2y3OpUWnG77pPJuydejTkIwTcTnTgtW/WEinLBvcpZoPMB3D
	W4dcckNhU+rCSuAS6k1TiKlfPPD8RrGcSRl1Cqsm8PhrTZbTAa7WASjPe8UYtpA+q/t1P96zneC
	HGL7OnY7kqyR7ylMqmiCLEhV0cqHmKYE9hfuJM/BLfEwFmaLlBOlgGp1E2GPOrg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f94:b0:4c5:bdb8:e579 with SMTP id
 5614622812f47-4ca4ccde595mr6372904b6e.12.1789585599946; Wed, 16 Sep 2026
 12:06:39 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:06:39 -0700
In-Reply-To: <6a88eb8b.ae6ddae5.3da009.004b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaae8bf.e91c2013.3bdb06.0002.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] WARNING in vb2_video_unregister_device
From: syzbot <syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.szyprowski@samsung.com, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=151998c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=f26bc23e42eeb548dee1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ec93f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e15bf9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f26bc23e42eeb548dee1@syzkaller.appspotmail.com

em28xx 1-1:1.0: Registered radio device as radio2
usb 1-1: Decoder not found
em28xx 1-1:1.0: failed to create media graph
em28xx 1-1:1.0: V4L2 device radio2 deregistered
------------[ cut here ]------------
WARNING: drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 at vb2_video_unregister_device+0x1c8/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264, CPU#1: kworker/1:2/1094
Modules linked in:
CPU: 1 UID: 0 PID: 1094 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Workqueue: events request_module_async
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : vb2_video_unregister_device+0x1c8/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264
lr : vb2_video_unregister_device+0x1c8/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264
sp : ffff800094617a20
x29: ffff800094617a20 x28: dfff800000000000 x27: 1fffe0001945a826
x26: ffff800087610300 x25: ffff800087611620 x24: 1fffe00018d04aa1
x23: ffff0000c6825508 x22: dfff800000000000 x21: ffff0000c6824000
x20: 0000000000000001 x19: ffff0000c6824f58 x18: 00000000ffffffff
x17: ffff800083d9271c x16: ffff800083da2fd4 x15: ffff800083a47b40
x14: 0000000000000001 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000001 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff80008048e314 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800083b611c0
x2 : 0000000000000001 x1 : ffff0000c74cbb00 x0 : 0000000000000000
Call trace:
 vb2_video_unregister_device+0x1c8/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1264 (P)
 em28xx_v4l2_init+0x1320/0x247c drivers/media/usb/em28xx/em28xx-video.c:3085
 em28xx_init_extension+0x10c/0x1b4 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x24/0x34 drivers/media/usb/em28xx/em28xx-cards.c:-1
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
irq event stamp: 35758
hardirqs last  enabled at (35757): [<ffff8000804918ac>] vprintk_store+0x924/0xb94 kernel/printk/printk.c:2385
hardirqs last disabled at (35758): [<ffff8000869841d4>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:445
softirqs last  enabled at (35698): [<ffff800084c72d48>] __alloc_skb+0x1c0/0x610 net/core/skbuff.c:698
softirqs last disabled at (35696): [<ffff800084c72d30>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (35696): [<ffff800084c72d30>] __alloc_skb+0x1a8/0x610 net/core/skbuff.c:697
---[ end trace 0000000000000000 ]---
em28xx 1-1:1.0: V4L2 device video11 deregistered
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 1094 Comm: kworker/1:2 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Workqueue: events request_module_async
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 assign_lock_key+0xcc/0xdc kernel/locking/lockdep.c:1000
 register_lock_class+0xf8/0x31c kernel/locking/lockdep.c:1315
 __lock_acquire+0xc0/0x2a6c kernel/locking/lockdep.c:5128
 lock_acquire+0x150/0x370 kernel/locking/lockdep.c:5908
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:181
 __wake_up_common_lock+0x30/0x78 kernel/sched/wait.c:125
 __wake_up+0x18/0x24 kernel/sched/wait.c:147
 __vb2_queue_cancel+0x248/0xa78 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x34/0x13c drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:943 [inline]
 vb2_video_unregister_device+0x12c/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1279
 em28xx_v4l2_init+0x1368/0x247c drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x10c/0x1b4 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x24/0x34 drivers/media/usb/em28xx/em28xx-cards.c:-1
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
Unable to handle kernel paging request at virtual address dfff800000000000
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff800000000000] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 1094 Comm: kworker/1:2 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Workqueue: events request_module_async
pstate: 034000c5 (nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __wake_up_common+0xac/0x180 kernel/sched/wait.c:105
lr : __wake_up_common_lock+0x4c/0x78 kernel/sched/wait.c:126
sp : ffff8000946178a0
x29: ffff8000946178a0 x28: dfff800000000000 x27: dfff800000000000
x26: dfff800000000000 x25: ffff0000c682576c x24: 0000000000000000
x23: ffff0000c6825800 x22: 0000000000000003 x21: 0000000000000000
x20: 0000000000000000 x19: 0000000000000000 x18: 00000000ffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000004
x11: ffff7000128c2f04 x10: ffff7000128c2f04 x9 : 0000000000000003
x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff80008048e314
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000003 x0 : ffff0000c68257c0
Call trace:
 __wake_up_common+0xac/0x180 kernel/sched/wait.c:105 (P)
 __wake_up_common_lock+0x4c/0x78 kernel/sched/wait.c:126
 __wake_up+0x18/0x24 kernel/sched/wait.c:147
 __vb2_queue_cancel+0x248/0xa78 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x34/0x13c drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:943 [inline]
 vb2_video_unregister_device+0x12c/0x1d0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1279
 em28xx_v4l2_init+0x1368/0x247c drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x10c/0x1b4 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x24/0x34 drivers/media/usb/em28xx/em28xx-cards.c:-1
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
Code: f94002f8 eb17031f 54000500 d343ff08 (387b6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f94002f8 	ldr	x24, [x23]
   4:	eb17031f 	cmp	x24, x23
   8:	54000500 	b.eq	0xa8  // b.none
   c:	d343ff08 	lsr	x8, x24, #3
* 10:	387b6908 	ldrb	w8, [x8, x27] <-- trapping instruction


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
