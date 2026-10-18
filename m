Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265033AD8C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289250; cv=none; b=it1RVaYAdm1C/tkb5YoqdT1Wfv8H5I1fJk+tLve7N1Awew7cFOk4Y8nJ+LSoEZfK0Wd3lR3r+xeGs0Jh6yeaVB5FEjgKQAe2O6AGihoqdKLN3V4XUXtg87vGOQsQ84/Hyo+l667caGFDglvsFVCxRb8zDIaWzaS8Yx620D5m5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289250; c=relaxed/simple;
	bh=FCxuUWFdE1bxI/wTxADxrVDuoRNMQQhH7wpxO0Neurk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RKqUcaHZHYed5HiLAMmQSAu1p3DKXGUwtQh0ddKSszBX0zbgPW0nx5JHmFHpbaxCcRbjbf5wP1PNSUwGWdxzmMVxQVWf37I2UpkxT/dfU4RR5SwD4eKD8FrNpVUgKoZzfmpugKXeXdM/VlHVAwjN/74P/QolVDBBX3fFs3IUpFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-83f6f9096baso1744607a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289246; x=1792894046;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0staK1toosvVTYdUZvQImybVckAdiMM5CzJz98ALkE=;
        b=k5xAjRFRjibnrA5Xtktu4ljdcYZXCd8eA8FyGxOybXJBjz4TF1SZhgGlO0xQU8KZkO
         bTdKkz/VaNfGB81lL5XZaFvsATcu2IjQX5QKod6qOpUUSTHA6XClC8ECDhLxZsb2ZHkj
         P1oRac/DL7GA5p4qbLvkU1I5DC9AE3C3OUYR9rotbQfFJfuDxEizoE35LO6cQkwfB8tG
         FZxE6d221w+ypbqv3XuWeraLTvcdhWSbZ3A3tWfcDuJfzrt7SaHYdcy0zhMh8S5Za3pS
         VrNEOVFtr3Y70SUDge3KSux15uyfI4A5dgfTl7l66877Q76Tftnzw39FRQr4PsyigCRy
         77Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzR3WS8kePtWDEbrqCrIM9fmEmQDJtFSFoGyhOHj8+eD4JlTyqdDjFm+b3M57gZJ5gdTFwJteNp3nFEqOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwA7edH/S/gu74Wxem6iKgjw0h03Pqc4k0wjPH4ma5VncjnBDY
	6cWil5+JtgjShSSsdZjg9uk64/3F44tDcXGdBqjIVYNkwxtY08dDuhAmVY14wgx1A2hOu0ZE67L
	nE6uwg7fDRBnS/ofD0GzQs4N+ZScQTendr0w28dryFpzoB0zIkSSppBPxfps=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:199b:b0:4f3:e931:9f27 with SMTP id
 5614622812f47-53cd1202ba2mr4493923b6e.53.1792289246314; Sat, 17 Oct 2026
 19:07:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 19:07:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad429de.7f4e89eb.3d59aa.00a9.GAE@google.com>
Subject: [syzbot] [arm?] WARNING in __run_timer_base (3)
From: syzbot <syzbot+c4582e7bc680cba1fcfb@syzkaller.appspotmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7a19f0cc94ad Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=128d8121580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d6221a572842ac
dashboard link: https://syzkaller.appspot.com/bug?extid=c4582e7bc680cba1fcfb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11904895580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113a2621580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/296cd4b77dbf/disk-7a19f0cc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e57669ed895f/vmlinux-7a19f0cc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c679c1ad76d4/Image-7a19f0cc.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c4582e7bc680cba1fcfb@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: kernel/time/timer.c:1786 at expire_timers kernel/time/timer.c:1786 [inline], CPU#1: swapper/1/0
WARNING: kernel/time/timer.c:1786 at __run_timers kernel/time/timer.c:2374 [inline], CPU#1: swapper/1/0
WARNING: kernel/time/timer.c:1786 at __run_timer_base+0x598/0x744 kernel/time/timer.c:2386, CPU#1: swapper/1/0
Modules linked in:
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/23/2026
pstate: 434000c5 (nZcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : expire_timers kernel/time/timer.c:1786 [inline]
pc : __run_timers kernel/time/timer.c:2374 [inline]
pc : __run_timer_base+0x598/0x744 kernel/time/timer.c:2386
lr : expire_timers kernel/time/timer.c:1786 [inline]
lr : __run_timers kernel/time/timer.c:2374 [inline]
lr : __run_timer_base+0x598/0x744 kernel/time/timer.c:2386
sp : ffff80008f7f7d40
x29: ffff80008f7f7e50 x28: ffff0001a4fdfd00 x27: 0000000000000000
x26: ffff0000c8d96970 x25: 00000000ffff98f0 x24: ffff80008f7f7dc8
x23: ffff0000c8d96988 x22: 1fffe000349fbfa0 x21: 1ffff00011efefb9
x20: dfff800000000000 x19: ffff0001a4fdfcc0 x18: 1fffe000349fbc28
x17: ffff80011b89c000 x16: ffff80008f7f0000 x15: 0000000000000000
x14: 00000000001e00c1 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000102
x8 : 0000000000000000 x7 : ffff8000819951c0 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff800080538560
x2 : 0000000000000002 x1 : ffff0000c1aa8000 x0 : 0000000000000000
Call trace:
 expire_timers kernel/time/timer.c:1786 [inline] (P)
 __run_timers kernel/time/timer.c:2374 [inline] (P)
 __run_timer_base+0x598/0x744 kernel/time/timer.c:2386 (P)
 run_timer_base+0x84/0x1b8 kernel/time/timer.c:2395
 run_timer_softirq+0x20/0x48 kernel/time/timer.c:2405
 handle_softirqs+0x324/0xcbc kernel/softirq.c:645
 __do_softirq+0x14/0x20 kernel/softirq.c:679
 ____do_softirq+0x10/0x1c arch/arm64/kernel/irq.c:78
 call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:901
 do_softirq_own_stack+0x1c/0x28 arch/arm64/kernel/irq.c:83
 invoke_softirq kernel/softirq.c:526 [inline]
 __irq_exit_rcu+0x10c/0x318 kernel/softirq.c:758
 irq_exit_rcu+0x14/0x84 kernel/softirq.c:775
 __el1_irq arch/arm64/kernel/entry-common.c:569 [inline]
 el1_interrupt+0x40/0x60 arch/arm64/kernel/entry-common.c:581
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:586
 el1h_64_irq+0x78/0x7c arch/arm64/kernel/entry.S:602
 __daif_local_irq_enable arch/arm64/include/asm/irqflags.h:26 [inline] (P)
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:48 [inline] (P)
 default_idle_call+0xa0/0xb8 kernel/sched/idle.c:129 (P)
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x1ec/0x450 kernel/sched/idle.c:355
 cpu_startup_entry+0x5c/0x74 kernel/sched/idle.c:454
 secondary_start_kernel+0x1d8/0x1fc arch/arm64/kernel/smp.c:275
 __secondary_switched+0xc0/0xc4 arch/arm64/kernel/head.S:400
irq event stamp: 286461
hardirqs last  enabled at (286460): [<ffff80008030a4e0>] handle_softirqs+0x1e8/0xcbc kernel/softirq.c:629
hardirqs last disabled at (286461): [<ffff8000868a164c>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:163 [inline]
hardirqs last disabled at (286461): [<ffff8000868a164c>] _raw_spin_lock_irq+0x28/0x70 kernel/locking/spinlock.c:189
softirqs last  enabled at (283904): [<ffff80008030ae24>] softirq_handle_end kernel/softirq.c:491 [inline]
softirqs last  enabled at (283904): [<ffff80008030ae24>] handle_softirqs+0xb2c/0xcbc kernel/softirq.c:673
softirqs last disabled at (286459): [<ffff8000800203f0>] __do_softirq+0x14/0x20 kernel/softirq.c:679
---[ end trace 0000000000000000 ]---


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
