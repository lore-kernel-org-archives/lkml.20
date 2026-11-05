Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910687;
	b=2oOMJRK3csOl7tl6sEwnuLN52hs4hAzRvrJqQQYNS39Pm1TvbXK1MOgYSgPB2jj6d8cj
	 3BNWpgt3ugnGRjQcb+lMwxWtLe/2enENwY8MSJ2MltZfNRCDc+y1Go3MIifG8glk1HZnL
	 DgDalJLI8W/u8dfd0q9hAV5s6ho0PIoVdeZ4Vn4vi1g78YD+GNjZRpGB2DYIJMaJwXFww
	 0/lrBiM4d/k/vli2bJOFEMcWYDZvmApYAHWYIIToKsnCiznYljNuFo/Hz/CEGM/wFG3yt
	 TyyTX2PAlp7ZPKn1+Y07mfYkSZizbyAItnVEWGXZdB9l77J6LoYHEwX5q43mUa4VNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910687;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=stGT56esE8ldyHlU0R7+XnbDGTUv/YMRPDFddSWJ7qU=;
	b=AQfEpDZ7z1JV4IVctOktJEHIbn2uAXAkRzD7jjkM6j7aVZ3GaZUtcn5aXBZ5+HHvuPJY
	 aT/eQAEdt0AS0p+0Gf5gqFnzFc2bil7vpG/yzS90wmymkCOKWAR0oVQ8uXV6eDCbyD/tv
	 +tdElXXQiZTBHzmCchbxkLT6v0p8Xn4bvFxXUXEY1H0xM/0IyhMDeEDeANap9g14VeZJ5
	 lexXH8yRPGglf4LD/V+jAtGkpNE7Fg3NSzd+Z8UtOXdu2NVtdFqvt2okRF41TAHf+LQD7
	 7t7B940cza87LuuI6AUqD0cR4Y/t40FZ5YrkqMCinbSunWTyxMGs8HFAo4JqxicGcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16108606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16108606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f8281066c4so2860997b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910686; x=1794515486;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stGT56esE8ldyHlU0R7+XnbDGTUv/YMRPDFddSWJ7qU=;
        b=HEJAx8l1Zfq1kxSYGLasV+BeLH8VUCjRJ/UopZNp6iTbavTXU/hCeDhxBhXaG6rLyN
         s7PIql1S/MWwCs/hj4ciNq/UBDmK+La+gNx/n5gOEuuff7+ZuZ0mdH5FqiVBnNFIQlXY
         LF7+HV5jHRui0qtFPsLZsVBz0HT/EtCnXhmdDUvWg3gid8fzWY5v4d3rwrhYKUc9Izp3
         tUFjX2sYsMpFPGvUmt0OIuaPLsA363RyfuIDQ5X/P8lA1cPI9kSmDFY16z2CLVcJNYIz
         qpSuMKtEpJL08/Fb/RGDb5CqnJ18lHfwKFA2DhVSuc28bi4wSunVgKyrN3mHAntlZZMR
         nfNw==
X-Gm-Message-State: APuU4Z+aTe2mf4zxzfzM8j1yoWQ7RTeSJnlOf0AVlnv4qsi5wqgxgqw3
	n4J3gEJGt4QPsp44pzP3aDq8cEHlaRaD5OFHOCFoOOnQNyiTxHZb9HPlxrK6zxqSFmtBvjLU0ZC
	oyc6bubFSroIVjmNTGdDpychCcqiXbeK88rWdRceZZuqgcG2xj453lANzGpc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2218:b0:564:4f93:709f with SMTP id
 5614622812f47-567e14af79fmr259117b6e.67.1793910686069; Thu, 05 Nov 2026
 12:31:26 -0800 (PST)
Date: Thu, 05 Nov 2026 12:31:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aece79e.382bd2ce.33e041.0001.GAE@google.com>
Subject: [syzbot] possible deadlock in wg_ratelimiter_uninit
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6c1c41effa34 Merge tag 'linux-can-fixes-for-7.4-20261103' ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13f231dd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d30e1495ee3ac817
dashboard link: https://syzkaller.appspot.com/bug?extid=72fceb8393e04ce876d9
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105ee98d580000

AI-generated root cause summary:
In `drivers/block/nbd.c`, `nbd_genl_reconnect_sock_cb()` invokes
`sk_set_memalloc(sock->sk)` while holding `mutex_lock(&nsock->tx_lock)`.
`sk_set_memalloc()` calls `static_branch_inc(&memalloc_socks_key)`, which
internally invokes `cpus_read_lock()` (`cpu_hotplug_lock`), creating an
acquisition dependency `&nsock->tx_lock -> cpu_hotplug_lock`. Because the NBD
I/O submission path (`nbd_queue_rq()` -> `nbd_handle_cmd()`) acquires
`&nsock->tx_lock` during direct memory reclaim (`fs_reclaim`), and core slab
cache management establishes `cpu_hotplug_lock -> slab_mutex -> fs_reclaim` (via
`kmem_cache_destroy()` and `__kmem_cache_create_args()`), this introduces an
ABBA circular locking dependency that can deadlock the kernel under memory
pressure.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=72fceb8393e04ce876d9

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com

 nbd0: unable to read partition table
block nbd0: reconnected socket
block nbd0: reconnected socket
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor411/6004 is trying to acquire lock:
ffffffff90094cc0 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:316 [inline]
ffffffff90094cc0 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4673 [inline]
ffffffff90094cc0 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:5011 [inline]
ffffffff90094cc0 (fs_reclaim){+.+.}-{0:0}, at: kmem_cache_alloc_noprof+0x5f/0x600 mm/slub.c:5047

but task is already holding lock:
ffffffff900771b8 (slab_mutex){+.+.}-{4:4}, at: __kmem_cache_create_args+0x59/0x470 mm/slab_common.c:350

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (slab_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       kmem_cache_destroy+0x73/0x180 mm/slab_common.c:565
       wg_ratelimiter_uninit+0x94/0xb0 drivers/net/wireguard/ratelimiter.c:218
       wg_destruct+0x223/0x310 drivers/net/wireguard/device.c:262
       netdev_run_todo+0xeb2/0x1090 net/core/dev.c:12033
       default_device_exit_batch+0x6d4/0x760 net/core/dev.c:13528
       ops_exit_list net/core/net_namespace.c:206 [inline]
       ops_undo_list+0x4d7/0x8f0 net/core/net_namespace.c:253
       cleanup_net+0x572/0x810 net/core/net_namespace.c:706
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #6 (cpu_hotplug_lock){++++}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x3d/0x160 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       nbd_genl_reconnect_sock_cb+0x69a/0xbb0 drivers/block/nbd.c:1377
       nbd_genl_foreach_sock+0x265/0x450 drivers/block/nbd.c:2152
       nbd_genl_reconfigure+0xbbb/0x1040 drivers/block/nbd.c:2477
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2584
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
       netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1361
       netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
       sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       __sys_sendto+0x408/0x5a0 net/socket.c:2283
       __do_sys_sendto net/socket.c:2290 [inline]
       __se_sys_sendto net/socket.c:2286 [inline]
       __x64_sys_sendto+0xde/0x100 net/socket.c:2286
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #5 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x373/0xff0 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2131
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2546
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_queue_rq+0xc1/0xff0 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2131
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2546
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:225 [inline]
       __synchronize_srcu+0xca/0x2f0 kernel/rcu/srcutree.c:1662
       elevator_switch+0x1e8/0x7b0 block/elevator.c:576
       elevator_change+0x2fa/0x480 block/elevator.c:681
       elevator_set_default+0x375/0x440 block/elevator.c:754
       blk_register_queue+0x404/0x4f0 block/blk-sysfs.c:992
       __add_disk+0x6b8/0xdb0 block/genhd.c:531
       add_disk_fwnode+0x100/0x3a0 block/genhd.c:600
       add_disk include/linux/blkdev.h:801 [inline]
       nbd_dev_add+0x733/0xb60 drivers/block/nbd.c:2026
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1419
       do_initcall_level+0x10a/0x1a0 init/main.c:1481
       do_initcalls+0x59/0xa0 init/main.c:1497
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1732
       kernel_init+0x22/0x1d0 init/main.c:1622
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       elevator_change+0x1af/0x480 block/elevator.c:679
       elevator_set_none+0xb5/0x140 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5114 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5159 [inline]
       blk_mq_update_nr_hw_queues+0x5ef/0x19e0 block/blk-mq.c:5224
       nbd_start_device+0x189/0xb30 drivers/block/nbd.c:1530
       nbd_genl_connect+0x167d/0x1cd0 drivers/block/nbd.c:2310
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2584
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
       netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1361
       netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
       sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       __sys_sendto+0x408/0x5a0 net/socket.c:2283
       __do_sys_sendto net/socket.c:2290 [inline]
       __se_sys_sendto net/socket.c:2286 [inline]
       __x64_sys_sendto+0xde/0x100 net/socket.c:2286
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&q->q_usage_counter(io)#49){++++}-{0:0}:
       blk_alloc_queue+0x544/0x690 block/blk-core.c:505
       blk_mq_alloc_queue block/blk-mq.c:4439 [inline]
       __blk_mq_alloc_disk+0x194/0x390 block/blk-mq.c:4486
       nbd_dev_add+0x494/0xb60 drivers/block/nbd.c:1996
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1419
       do_initcall_level+0x10a/0x1a0 init/main.c:1481
       do_initcalls+0x59/0xa0 init/main.c:1497
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1732
       kernel_init+0x22/0x1d0 init/main.c:1622
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __fs_reclaim_acquire mm/page_alloc.c:4360 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4374
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4673 [inline]
       slab_alloc_node mm/slub.c:5011 [inline]
       kmem_cache_alloc_noprof+0x5f/0x600 mm/slub.c:5047
       create_cache mm/slab_common.c:249 [inline]
       __kmem_cache_create_args+0x30c/0x470 mm/slab_common.c:387
       __kmem_cache_create include/linux/slab.h:402 [inline]
       ieee80211s_init net/mac80211/mesh.c:28 [inline]
       ieee80211_mesh_init_sdata+0x371/0x620 net/mac80211/mesh.c:1784
       ieee80211_setup_sdata+0x858/0xc10 net/mac80211/iface.c:1980
       ieee80211_if_change_type+0x141/0x940 net/mac80211/iface.c:2125
       ieee80211_change_iface+0xdc/0x4b0 net/mac80211/cfg.c:275
       rdev_change_virtual_intf net/wireless/rdev-ops.h:74 [inline]
       cfg80211_change_iface+0x40f/0x9c0 net/wireless/util.c:1368
       nl80211_set_interface+0x78e/0xaa0 net/wireless/nl80211.c:5252
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2584
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
       netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1361
       netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
       sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       __sys_sendto+0x408/0x5a0 net/socket.c:2283
       __do_sys_sendto net/socket.c:2290 [inline]
       __se_sys_sendto net/socket.c:2286 [inline]
       __x64_sys_sendto+0xde/0x100 net/socket.c:2286
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> cpu_hotplug_lock --> slab_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(slab_mutex);
                               lock(cpu_hotplug_lock);
                               lock(slab_mutex);
  lock(fs_reclaim);

 *** DEADLOCK ***

locks held by syz-executor411/6004: 4, last CPU#1:
 #0: ffffffff914f07a8 (cb_lock){++++}-{4:4}, at: genl_rcv+0x19/0x40 net/netlink/genetlink.c:1217
 #1: ffffffff9148c420 (rtnl_mutex){+.+.}-{4:4}, at: nl80211_pre_doit+0x117/0xfa0 net/wireless/nl80211.c:20140
 #2: ffff888146e80800 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: wiphy_lock include/net/cfg80211.h:6974 [inline]
 #2: ffff888146e80800 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: nl80211_pre_doit+0x6b2/0xfa0 net/wireless/nl80211.c:20189
 #3: ffffffff900771b8 (slab_mutex){+.+.}-{4:4}, at: __kmem_cache_create_args+0x59/0x470 mm/slab_common.c:350

stack backtrace:
CPU: 1 UID: 0 PID: 6004 Comm: syz-executor411 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
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
 __fs_reclaim_acquire mm/page_alloc.c:4360 [inline]
 fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4374
 might_alloc include/linux/sched/mm.h:316 [inline]
 slab_pre_alloc_hook mm/slub.c:4673 [inline]
 slab_alloc_node mm/slub.c:5011 [inline]
 kmem_cache_alloc_noprof+0x5f/0x600 mm/slub.c:5047
 create_cache mm/slab_common.c:249 [inline]
 __kmem_cache_create_args+0x30c/0x470 mm/slab_common.c:387
 __kmem_cache_create include/linux/slab.h:402 [inline]
 ieee80211s_init net/mac80211/mesh.c:28 [inline]
 ieee80211_mesh_init_sdata+0x371/0x620 net/mac80211/mesh.c:1784
 ieee80211_setup_sdata+0x858/0xc10 net/mac80211/iface.c:1980
 ieee80211_if_change_type+0x141/0x940 net/mac80211/iface.c:2125
 ieee80211_change_iface+0xdc/0x4b0 net/mac80211/cfg.c:275
 rdev_change_virtual_intf net/wireless/rdev-ops.h:74 [inline]
 cfg80211_change_iface+0x40f/0x9c0 net/wireless/util.c:1368
 nl80211_set_interface+0x78e/0xaa0 net/wireless/nl80211.c:5252
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2584
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
 __sock_sendmsg net/socket.c:818 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2283
 __do_sys_sendto net/socket.c:2290 [inline]
 __se_sys_sendto net/socket.c:2286 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2286
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcb7fbe801e
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007fff7765df98 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 0000555567b69400 RCX: 00007fcb7fbe801e
RDX: 0000000000000024 RSI: 00007fff7765ea00 RDI: 0000000000000003
RBP: 00007fff776600e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000007
R13: 000000000000002c R14: 00007fff7765ea00 R15: 0000000000000004
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
