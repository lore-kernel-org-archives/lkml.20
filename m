Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D513E172E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902993; cv=none; b=AAGU6OwWn1BclRYmA+iVX6odgnC2RE4iWozTPZb2wdn3pZcHhqEITcZAsXES4J6aobqWRiePyFte8U/iXy+3z9Xh102LzFXRwENALKBHAYqoSSPqiSTb5g9QDKcwlMRDwD2M4FGk2tZBf4uIyngm4wat+wMOv91732haXP4MUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902993; c=relaxed/simple;
	bh=nWOf+il78/LiwKVUFIvF8m5GUdgNDmmBtNDNs1vRPtc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iXxzQq/iWIKTaxkOQmCThypX3b4j6yOWBCeUMi5TQlH+WiggKfwc/aFplGQRU+qYQCKkJ4SlyYBrvYDgutwnNWXZhgjYPw91d3y1Jq4PGk1Du1rqe7R3vmPrKG5Ybwpp4i0e6VuYi8e1718wVCPKq1lgIts5Ij3EqPbiuWj4ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1481215b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787902984; x=1788507784;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u8EgiEEfoy3bonJSYWmePJgO5EAyEU3zEqmbOTD/EwU=;
        b=NYoCyVSHJrpfzhSlNvgpqsjbj+PshRmdzyuSuuYBBQE/i19trszdDTgMmYd85biXzl
         3P2bqLgxCu1lRUd3EQsfYiYtB2LZM3M/IKlBGCKuVggkA8Qx6hlGJDPOpuFRL9PsSJqi
         ku44IJiZ2IebGk56P7naOmAeahrcwpd+ezpiHdjmmAPnrUiIFGL6sbt3+SNGuHa34VUP
         f/u0TXgHj1MqEE8a+45Dv0vuQr3Iw397K0SL3xsF/bF7lW4sNER268z+D8jCYOTp1Cf6
         LoKAtsDoAD7TJqX8cp3vUj2dW1fdl1Dwelgv6SsVIefCQq5PmlDUdQLNJLBkYQOgYz00
         CIpA==
X-Forwarded-Encrypted: i=1; AHgh+RpDODYm6ggpAHtRuhAe3V6t/F4Mw0zLgq4tTh3H9xfWKShS4g3l4KRPmBfRBkzHfmTDMlz8iIl2Td7BJHU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWSefnNYu/mI4U+mgyoqLUQabupplmYDeLvtLmHf4f+U3WZKtr
	9UNRfqw5xfTuW37DK2oKXKQS6tDUbDVfA+bLcB7PzIvpue35RwPD03NijfC2qNUo7MSTwR0Cooz
	vjeWrNO+NqMQl1duYTvEYdgx43V5cX7shtKXxyA5SVrl1Lqx/JS5DZdznLT0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1488:b0:4b2:8ea1:b9dc with SMTP id
 5614622812f47-4b397f0984fmr6094503b6e.3.1787902984335; Fri, 28 Aug 2026
 00:43:04 -0700 (PDT)
Date: Fri, 28 Aug 2026 00:43:04 -0700
In-Reply-To: <20260828065349.1876-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a913c08.4d659fcc.734b4.001b.GAE@google.com>
Subject: Re: [syzbot] [input?] possible deadlock in tasklet_action_common (2)
From: syzbot <syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in tasklet_action_common

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.2.59/6959 is trying to acquire lock:
ffff8880b86241a0 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:45 [inline]
ffff8880b86241a0 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: tasklet_lock_callback kernel/softirq.c:909 [inline]
ffff8880b86241a0 (tasklet_sync_callback.cb_lock){+...}-{3:3}, at: tasklet_action_common+0xc5/0x600 kernel/softirq.c:959

but task is already holding lock:
ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: spin_lock_irq_disable include/linux/spinlock_rt.h:102 [inline]
ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: class_spinlock_irqsave_constructor include/linux/spinlock.h:642 [inline]
ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: input_inject_event+0xab/0x310 drivers/input/input.c:419

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&dev->event_lock){+.+.}-{3:3}:
       rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
       spin_lock_irq_disable include/linux/spinlock_rt.h:102 [inline]
       class_spinlock_irqsave_constructor include/linux/spinlock.h:642 [inline]
       input_inject_event+0xab/0x310 drivers/input/input.c:419
       led_trigger_event+0x13b/0x220 drivers/leds/led-triggers.c:420
       kbd_propagate_led_state drivers/tty/vt/keyboard.c:1124 [inline]
       kbd_bh+0x1b4/0x2c0 drivers/tty/vt/keyboard.c:1303
       tasklet_action_common+0x31c/0x600 kernel/softirq.c:970
       handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
       run_ksoftirqd+0x53/0x190 kernel/softirq.c:1108
       smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (tasklet_sync_callback.cb_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3181 [inline]
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5253
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5886
       rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:45 [inline]
       tasklet_lock_callback kernel/softirq.c:909 [inline]
       tasklet_action_common+0xc5/0x600 kernel/softirq.c:959
       handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
       __do_softirq kernel/softirq.c:679 [inline]
       __local_bh_enable_ip+0x16f/0x2b0 kernel/softirq.c:325
       local_bh_enable include/linux/bottom_half.h:33 [inline]
       __alloc_skb+0x1b1/0x7a0 net/core/skbuff.c:699
       alloc_skb include/linux/skbuff.h:1384 [inline]
       hidp_send_message+0xb5/0x230 net/bluetooth/hidp/core.c:108
       hidp_send_intr_message net/bluetooth/hidp/core.c:140 [inline]
       hidp_input_event+0x2a4/0x380 net/bluetooth/hidp/core.c:172
       input_event_dispose+0xad/0x700 drivers/input/input.c:322
       input_inject_event+0x1fa/0x310 drivers/input/input.c:424
       kbd_led_trigger_activate+0xbc/0x100 drivers/tty/vt/keyboard.c:1080
       led_trigger_set+0x52b/0x940 drivers/leds/led-triggers.c:220
       led_match_default_trigger drivers/leds/led-triggers.c:277 [inline]
       led_trigger_set_default+0x269/0x2a0 drivers/leds/led-triggers.c:300
       led_classdev_register_ext+0x761/0x990 drivers/leds/led-class.c:596
       led_classdev_register include/linux/leds.h:274 [inline]
       input_leds_connect+0x4de/0x750 drivers/input/input-leds.c:145
       input_attach_handler drivers/input/input.c:1074 [inline]
       input_register_device+0xd08/0x1150 drivers/input/input.c:2451
       hidp_session_dev_add net/bluetooth/hidp/core.c:877 [inline]
       hidp_session_probe+0x1a5/0x8b0 net/bluetooth/hidp/core.c:1155
       l2cap_register_user+0xbd/0x1d0 net/bluetooth/l2cap_core.c:1754
       hidp_connection_add+0x1582/0x1a10 net/bluetooth/hidp/core.c:1427
       do_hidp_sock_ioctl net/bluetooth/hidp/sock.c:78 [inline]
       hidp_sock_ioctl+0x403/0x650 net/bluetooth/hidp/sock.c:125
       sock_do_ioctl+0x101/0x320 net/socket.c:1325
       sock_ioctl+0x57d/0x7f0 net/socket.c:1446
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->event_lock);
                               lock(tasklet_sync_callback.cb_lock);
                               lock(&dev->event_lock);
  lock(tasklet_sync_callback.cb_lock);

 *** DEADLOCK ***

locks held by syz.2.59/6959: 10, last CPU#0:
 #0: ffff88805ad5d370 (&conn->lock#2){+.+.}-{4:4}, at: l2cap_register_user+0x34/0x1d0 net/bluetooth/l2cap_core.c:1741
 #1: ffffffff8f97e420 (hidp_session_sem){++++}-{4:4}, at: hidp_session_probe+0x98/0x8b0 net/bluetooth/hidp/core.c:1145
 #2: ffffffff8f2414d8 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:255 [inline]
 #2: ffffffff8f2414d8 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa7f/0x1150 drivers/input/input.c:2447
 #3: ffff88802a7a8860 (&led_cdev->led_access){+.+.}-{4:4}, at: led_classdev_register_ext+0x45e/0x990 drivers/leds/led-class.c:554
 #4: ffffffff8ebf8ea0 (triggers_list_lock){++++}-{4:4}, at: led_trigger_set_default+0x7b/0x2a0 drivers/leds/led-triggers.c:297
 #5: ffff88802a7a8788 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: led_trigger_set_default+0x8b/0x2a0 drivers/leds/led-triggers.c:298
 #6: ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: spin_lock_irq_disable include/linux/spinlock_rt.h:102 [inline]
 #6: ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: class_spinlock_irqsave_constructor include/linux/spinlock.h:642 [inline]
 #6: ffff888040042270 (&dev->event_lock){+.+.}-{3:3}, at: input_inject_event+0xab/0x310 drivers/input/input.c:419
 #7: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #7: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #7: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #7: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0x400 kernel/locking/spinlock_rt.c:57
 #8: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #8: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #8: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1183 [inline]
 #8: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: input_inject_event+0xb7/0x310 drivers/input/input.c:420
 #9: ffffffff8e3c3740 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_ip+0x3d/0x420 kernel/softirq.c:186

stack backtrace:
CPU: 0 UID: 0 PID: 6959 Comm: syz.2.59 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2059
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2191
 check_prev_add kernel/locking/lockdep.c:3181 [inline]
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5253
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5886
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 tasklet_lock_callback kernel/softirq.c:909 [inline]
 tasklet_action_common+0xc5/0x600 kernel/softirq.c:959
 handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
 __do_softirq kernel/softirq.c:679 [inline]
 __local_bh_enable_ip+0x16f/0x2b0 kernel/softirq.c:325
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1b1/0x7a0 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 hidp_send_message+0xb5/0x230 net/bluetooth/hidp/core.c:108
 hidp_send_intr_message net/bluetooth/hidp/core.c:140 [inline]
 hidp_input_event+0x2a4/0x380 net/bluetooth/hidp/core.c:172
 input_event_dispose+0xad/0x700 drivers/input/input.c:322
 input_inject_event+0x1fa/0x310 drivers/input/input.c:424
 kbd_led_trigger_activate+0xbc/0x100 drivers/tty/vt/keyboard.c:1080
 led_trigger_set+0x52b/0x940 drivers/leds/led-triggers.c:220
 led_match_default_trigger drivers/leds/led-triggers.c:277 [inline]
 led_trigger_set_default+0x269/0x2a0 drivers/leds/led-triggers.c:300
 led_classdev_register_ext+0x761/0x990 drivers/leds/led-class.c:596
 led_classdev_register include/linux/leds.h:274 [inline]
 input_leds_connect+0x4de/0x750 drivers/input/input-leds.c:145
 input_attach_handler drivers/input/input.c:1074 [inline]
 input_register_device+0xd08/0x1150 drivers/input/input.c:2451
 hidp_session_dev_add net/bluetooth/hidp/core.c:877 [inline]
 hidp_session_probe+0x1a5/0x8b0 net/bluetooth/hidp/core.c:1155
 l2cap_register_user+0xbd/0x1d0 net/bluetooth/l2cap_core.c:1754
 hidp_connection_add+0x1582/0x1a10 net/bluetooth/hidp/core.c:1427
 do_hidp_sock_ioctl net/bluetooth/hidp/sock.c:78 [inline]
 hidp_sock_ioctl+0x403/0x650 net/bluetooth/hidp/sock.c:125
 sock_do_ioctl+0x101/0x320 net/socket.c:1325
 sock_ioctl+0x57d/0x7f0 net/socket.c:1446
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5154aade99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f515410e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5154d35fa0 RCX: 00007f5154aade99
RDX: 0000200000000200 RSI: 00000000400448c8 RDI: 0000000000000004
RBP: 00007f5154b43eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5154d36038 R14: 00007f5154d35fa0 R15: 00007ffcfefb8c18
 </TASK>


Tested on:

commit:         818bebeb drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13d95d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3ca844744f0010
dashboard link: https://syzkaller.appspot.com/bug?extid=b5d7ab56d43de3fd5aac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
