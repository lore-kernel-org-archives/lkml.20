Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A55214A84
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 02:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790994992; cv=none; b=rqHHQ2gBe7D5CS2Z3/8Q1FLI+fdyPKsqGFf65G5Qaj/Eg53HfAoJSGaKY0qUBy4PHLIDuK4ZduupEuc/OvQQxYLlkd/PPxOvpXgkuIKSD2iQvPtcPzkE9ZFABQsla4j8wgXJ/6f2j5+/rVnPYTSqdp4a/fnaP6FsHiS+9TKAha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790994992; c=relaxed/simple;
	bh=KNcbqMrALl7aMYhgsSOtyeru+oiGxpGaO1VMbrUQ5KE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eye56Q9EVzjdcy6e6lNm2c9fx1UNEVV315wOujrtV3S75G4LZs98132MaTRWfOxI34MzAciKtCbogyUYvcvnNlsolVt0Ty4qNTQ6C7sU1KYRgY14rec0R6k+Mj3/MySBWleQ/mZmmcpgQ0uWRevEejZrohCurgCaWUpbmgzkLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dab94dc3e7so209993b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790994989; x=1791599789;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACQlxslOuzPIbXuewMrLTvlOAlThRUPxLWuXinhH048=;
        b=MMWCdoyu9qgeFvMu4kFcCr/2Y2hQx8x9ztg11A9Zwzr+TVi3oODL5/p3rxP66A2AIE
         5acOFsHPuKaV6TjpqrXi4rBV/Hr0hqMGaybSQ1QQ8A1+ZqOkx6kMjRlg9qU8pKaXTjZW
         IU4nifR+xtdew9ridRfysLiL5F9D5kT2wvmpCkJkoxE7c6G2JHL+naPqPcae1XUIDbE3
         d/vAnzvIzXoFUTFlpphil04L5PdoKUAPKzNUikHpZm1PhAiVOPyFYNHGbGwlYV0k8mDQ
         SCmevETFftuNJJ/NW45liek6GEC2veQq4AiesgyaPMAmhuvSUf2KrBzlucf8HwmN94eg
         +Aog==
X-Gm-Message-State: AFuF++kYdB4QUu+am6ldpSdpecF29QfAguqsbAoIuWs7UoM92fxP1Rvq
	9aYxb+rooT9eViBAhe0UrY5LBH75Hwzp1/uhhN8zJOqKi0NjYNKCDN5QG91j3hhzbq42mTSCnzg
	svwbATq0UJs7Tfi5d+gw6wAvk8Vnds4i6mzcJ3931AdP/Ri2KmwOrtG41RZI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3502:b0:4d5:27da:a492 with SMTP id
 5614622812f47-4f67b0245d8mr1382262b6e.44.1790994989393; Fri, 02 Oct 2026
 19:36:29 -0700 (PDT)
Date: Fri, 02 Oct 2026 19:36:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac06a2d.34119e79.2f92f3.000d.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in mtrr_del_page
From: syzbot <syzbot+342762971f666337474e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    72d3fcf802c4 Linux 7.3-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d8ae05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=342762971f666337474e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dc3ad46af4b1/disk-72d3fcf8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/622cf26726fb/vmlinux-72d3fcf8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07dc9df89174/bzImage-72d3fcf8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+342762971f666337474e@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.9.5848/21744 is trying to acquire lock:
ffffffff8eba04e0 (mtrr_mutex){+.+.}-{4:4}, at: mtrr_del_page+0xf1/0x560 arch/x86/kernel/cpu/mtrr/mtrr.c:408

but task is already holding lock:
ffffffff8ebe9970 (cpu_hotplug_lock){++++}-{0:0}, at: mtrr_del_page+0xe3/0x560 arch/x86/kernel/cpu/mtrr/mtrr.c:407

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (cpu_hotplug_lock){++++}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x42/0x160 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       nbd_genl_reconnect_sock_cb+0x69a/0xbb0 drivers/block/nbd.c:1377
       nbd_genl_foreach_sock+0x265/0x450 drivers/block/nbd.c:2152
       nbd_genl_reconfigure+0xbbb/0x1040 drivers/block/nbd.c:2477
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2575
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
       netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1364
       netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1919
       sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
       __sock_sendmsg net/socket.c:815 [inline]
       ____sys_sendmsg+0x54e/0x850 net/socket.c:2713
       ___sys_sendmsg+0x2a5/0x360 net/socket.c:2767
       __sys_sendmsg net/socket.c:2799 [inline]
       __do_sys_sendmsg net/socket.c:2804 [inline]
       __se_sys_sendmsg net/socket.c:2802 [inline]
       __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2802
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #6 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x373/0xff0 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x16c/0x300 block/blk-mq.c:2532
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #5 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       nbd_queue_rq+0xc1/0xff0 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x16c/0x300 block/blk-mq.c:2532
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:210 [inline]
       __synchronize_srcu+0xc9/0x2f0 kernel/rcu/srcutree.c:1462
       elevator_switch+0x1e8/0x7b0 block/elevator.c:576
       elevator_change+0x2fa/0x480 block/elevator.c:681
       elevator_set_default+0x375/0x440 block/elevator.c:754
       blk_register_queue+0x3f3/0x4e0 block/blk-sysfs.c:992
       __add_disk+0x6b8/0xdb0 block/genhd.c:531
       add_disk_fwnode+0x100/0x3a0 block/genhd.c:600
       add_disk include/linux/blkdev.h:798 [inline]
       nbd_dev_add+0x733/0xb60 drivers/block/nbd.c:2026
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1362
       do_initcall_level+0x10a/0x1a0 init/main.c:1424
       do_initcalls+0x59/0xa0 init/main.c:1440
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1675
       kernel_init+0x22/0x1d0 init/main.c:1565
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       queue_requests_store+0x45b/0x5f0 block/blk-sysfs.c:124
       queue_attr_store+0x207/0x2b0 block/blk-sysfs.c:906
       kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x612/0xba0 fs/read_write.c:687
       ksys_write+0x150/0x270 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#66){++++}-{0:0}:
       blk_alloc_queue+0x544/0x690 block/blk-core.c:504
       blk_mq_alloc_queue block/blk-mq.c:4420 [inline]
       __blk_mq_alloc_disk+0x194/0x390 block/blk-mq.c:4467
       null_add_dev+0xe82/0x1d70 drivers/block/null_blk/main.c:2017
       null_create_dev drivers/block/null_blk/main.c:2114 [inline]
       null_init+0x1e3/0x390 drivers/block/null_blk/main.c:2178
       do_one_initcall+0x250/0x870 init/main.c:1362
       do_initcall_level+0x10a/0x1a0 init/main.c:1424
       do_initcalls+0x59/0xa0 init/main.c:1440
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1675
       kernel_init+0x22/0x1d0 init/main.c:1565
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       __do_kmalloc_node mm/slub.c:5413 [inline]
       __kmalloc_noprof+0xbc/0x720 mm/slub.c:5439
       _kmalloc_noprof include/linux/slab.h:995 [inline]
       _kzalloc_noprof include/linux/slab.h:1312 [inline]
       mtrr_copy_map+0x71/0x140 arch/x86/kernel/cpu/mtrr/generic.c:413
       mtrr_init_finalize+0x9/0x70 arch/x86/kernel/cpu/mtrr/mtrr.c:618
       do_one_initcall+0x250/0x870 init/main.c:1362
       do_initcall_level+0x10a/0x1a0 init/main.c:1424
       do_initcalls+0x59/0xa0 init/main.c:1440
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1675
       kernel_init+0x22/0x1d0 init/main.c:1565
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (mtrr_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       mtrr_del_page+0xf1/0x560 arch/x86/kernel/cpu/mtrr/mtrr.c:408
       mtrr_ioctl+0xcb8/0x13b0 arch/x86/kernel/cpu/mtrr/if.c:244
       pde_ioctl fs/proc/inode.c:374 [inline]
       proc_reg_unlocked_ioctl+0x1d6/0x2c0 fs/proc/inode.c:386
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  mtrr_mutex --> &nsock->tx_lock --> cpu_hotplug_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(cpu_hotplug_lock);
                               lock(&nsock->tx_lock);
                               lock(cpu_hotplug_lock);
  lock(mtrr_mutex);

 *** DEADLOCK ***

locks held by syz.9.5848/21744: 1, last CPU#0:
 #0: ffffffff8ebe9970 (cpu_hotplug_lock){++++}-{0:0}, at: mtrr_del_page+0xe3/0x560 arch/x86/kernel/cpu/mtrr/mtrr.c:407

stack backtrace:
CPU: 0 UID: 0 PID: 21744 Comm: syz.9.5848 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
 mtrr_del_page+0xf1/0x560 arch/x86/kernel/cpu/mtrr/mtrr.c:408
 mtrr_ioctl+0xcb8/0x13b0 arch/x86/kernel/cpu/mtrr/if.c:244
 pde_ioctl fs/proc/inode.c:374 [inline]
 proc_reg_unlocked_ioctl+0x1d6/0x2c0 fs/proc/inode.c:386
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f30e659e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f30e73e8028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f30e6825fa0 RCX: 00007f30e659e159
RDX: 0000200000000340 RSI: 00000000400c4d04 RDI: 0000000000000003
RBP: 00007f30e663506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f30e6826038 R14: 00007f30e6825fa0 R15: 00007ffc80c63678
 </TASK>
MTRR 1 not used


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
