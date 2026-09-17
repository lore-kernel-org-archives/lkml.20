Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35983299A82
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625850; cv=none; b=IosjbFllNWaECHfYZl4UMfx7TYFwxGwjVXwZl3lSzPWCkO7Tsfnx0fGGstYkuVq6SoVVE7Egv5lGrnranJuQpqpORKfyg6IVhmuiXX/D5/cU8kADfaDhw1Xd2cVWARDSoWMgqzI9ZqsZzv2jGCG8ddnNJXFeu8v7Tlf15zJxmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625850; c=relaxed/simple;
	bh=AjTCgYaVAVMkU/dTP5gXL4N5jZ3SMy1grvjNfX+Kvd4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YDFeWNtf7SnzEb2ukniXbvTvZGj1sngMyCSjNtZQmiMkO1u2kwyEn/siuUU4YYY7/cnvi6F+03tnvE4E8fxMVJ0sn8unEh3XioW4Fp4UOHnGSF+vKqZPhMw5l24MIAwyUfkjCJd9rsJ8gmpnGjoAHaFlfOrAjA/dCPndUcCWQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so195424a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625847; x=1790230647;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QfBmKfleVcvd97u4dVk5uEX5YbOJ7drf2EVSXTGpRo=;
        b=Eq+B6XiKfo5nXGB2kazlZelk/NhnBO5n3aZvbxAGl/ozuaZ62Ql+zQM9lhNoznsr9q
         IPsRi/KrRWhBIi9RsuXX3u/FJPDp2mv/l5FAa1W3VRczSbkqjG9P1AOFaqNw2Fwqnl0j
         nbW9TRHVO18vubhFxJ5Q5I8cazWPRlbYiuB2+lTnGCwz6SFu90qBmiqCvlJM3wkd08ow
         r/r300zTX/hqEE2n/FPaiT/AaUZ8P/s9Pc7DH3thqCn30EE2OyE1JGAOmMrcqWVCnM6u
         /MlAc38CV0pzLGHGsmzZDXomOh3Rf4PFVpgXasjsTZx6bsab/WV6sYV7ND81+d77yYe6
         q0XQ==
X-Forwarded-Encrypted: i=1; AKwUvByPMozXA1UyzR8H5GkhirwkZmTc4x6bU1qX309K/FfxaXntJWPWYIv70nWsuj2ZEgGco138bjrR9WfgusM=@vger.kernel.org
X-Gm-Message-State: AFuF++kovfmQa7TZZ2H6MvJcxKrWCQgHaiPSmjFPQ7E5eZfYylhAT4qr
	eIpPQbs6rDK1EQ0nGZZxWb+94vV1jeAihMxEkI80M1vNpOiw1IR8+YfWzZFKiAMRG/7Romoh6fn
	BhD+4z2D20Uw/558StzZ2bqh//0Gy8DJ+YXLee0cjCsO/xySB139IU/KEJWw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a1b:b0:4c5:b120:9833 with SMTP id
 5614622812f47-4ca499bebeemr6520799b6e.6.1789625847029; Wed, 16 Sep 2026
 23:17:27 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:17:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab85f7.b398a7c9.1f86be.0011.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in __purge_vmap_area_lazy (3)
From: syzbot <syzbot+67db1b4d415d6d3ff440@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9b87fdc9af2f Merge tag 'sched_ext-for-7.3-rc3-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13746bf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=67db1b4d415d6d3ff440
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ebd934b8c7ff/disk-9b87fdc9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d23e7407725a/vmlinux-9b87fdc9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f0123d362dda/bzImage-9b87fdc9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+67db1b4d415d6d3ff440@syzkaller.appspotmail.com

INFO: task kworker/1:3:5692 blocked for more than 143 seconds.
      Tainted: G             L      syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:3     state:D stack:22824 pid:5692  tgid:5692  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events drain_vmap_area_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x1259/0x6920 kernel/sched/core.c:7277
 __schedule_loop kernel/sched/core.c:7354 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7369
 schedule_timeout+0x1b2/0x280 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
 __flush_work+0x7c7/0xcb0 kernel/workqueue.c:4448
 __purge_vmap_area_lazy+0x879/0xc00 mm/vmalloc.c:2427
 drain_vmap_area_work+0x27/0x40 mm/vmalloc.c:2452
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
locks held by kworker/0:0/9: 3, on CPU#0:
 #0: ffff88801c05b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc900000e7d08 (netdev_work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: netdev_work_proc+0x71/0x880 net/core/netdev_work.c:132
locks held by kworker/0:1/10: 3, on CPU#0:
 #0: ffff88801c05b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc900000f7d08 (deferred_process_work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: switchdev_deferred_process_work+0xe/0x20 net/switchdev/switchdev.c:104
locks held by kworker/u8:0/12: 4, last CPU#0:
 #0: ffff8880342b4940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90000117d08 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff88802c4ee1c8 (&hard_iface->bat_iv.ogm_buff_mutex){+.+.}-{4:4}, at: batadv_iv_ogm_schedule net/batman-adv/bat_iv_ogm.c:1010 [inline]
 #2: ffff88802c4ee1c8 (&hard_iface->bat_iv.ogm_buff_mutex){+.+.}-{4:4}, at: batadv_iv_ogm_schedule net/batman-adv/bat_iv_ogm.c:1005 [inline]
 #2: ffff88802c4ee1c8 (&hard_iface->bat_iv.ogm_buff_mutex){+.+.}-{4:4}, at: batadv_iv_send_outstanding_bat_ogm_packet+0x50f/0x7d0 net/batman-adv/bat_iv_ogm.c:1924
 #3: ffff8880b843bf60 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2c/0x140 kernel/sched/core.c:677
locks held by pr/ttyS0/16: 2, last CPU#1:
 #0: ffffffff8edd87b8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8edd87b8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:439 [inline]
 #0: ffffffff8edd87b8 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x49/0x60 kernel/printk/printk.c:291
 #1: ffff8880b8424568 (psi_seq){-.-.}-{0:0}, at: psi_sched_switch kernel/sched/stats.h:218 [inline]
 #1: ffff8880b8424568 (psi_seq){-.-.}-{0:0}, at: __schedule+0x2e0c/0x6920 kernel/sched/core.c:7271
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6871
locks held by kworker/u8:3/50: 3, last CPU#1:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90000ba7d08 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff8880581907a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_constructor include/net/cfg80211.h:6905 [inline]
 #2: ffff8880581907a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_work+0x92/0x550 net/wireless/core.c:526
locks held by kworker/u8:5/148: 3, last CPU#1:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90002e8fd08 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff8880246ca258 (&devlink->lock_key#2){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x56/0xd20 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:6/1090: 3, last CPU#1:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90005237d08 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff888029c8d258 (&devlink->lock_key#4){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x56/0xd20 drivers/net/netdevsim/dev.c:834
locks held by dhcpcd/5261: 1, on CPU#0:
 #0: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #0: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:366 [inline]
 #0: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xac3/0x2620 net/core/rtnetlink.c:4219
locks held by getty/5357: 2, on CPU#1:
 #0: ffff8880383650a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032262e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x14e0 drivers/tty/n_tty.c:2211
locks held by kworker/0:3/5597: 2, last CPU#0:
 #0: ffff88801c05b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90003a37d08 ((work_completion)(&vn->purge_work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
locks held by kworker/1:3/5692: 3, on CPU#1:
 #0: ffff88801c05b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc9000463fd08 (drain_vmap_work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff8efc25c0 (vmap_purge_lock){+.+.}-{4:4}, at: drain_vmap_area_work+0x17/0x40 mm/vmalloc.c:2451
locks held by kworker/1:5/5694: 2, last CPU#1:
 #0: ffff88801c059d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc9000205fd08 ((gc_work).work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
locks held by kworker/1:7/5714: 3, last CPU#1:
 #0: ffff88801c059d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc9000475fd08 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #2: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #2: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: gc_worker+0x21a/0x1a10 net/netfilter/nf_conntrack_core.c:1532
locks held by kworker/u8:9/5852: 3, on CPU#0:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc900048efd08 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: linkwatch_event+0x51/0xc0 net/core/link_watch.c:313
locks held by kworker/u8:10/5917: 3, on CPU#1:
 #0: ffff8880340da940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90004df7d08 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)){+.+.}-{0:0}, at: process_one
 #1: ffffc90004df7d08 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 #2: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_verify_work+0x12/0x30 net/ipv6/addrconf.c:4770
locks held by kworker/u8:14/6170: 3, last CPU#1:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90003b07d08 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff888037613258 (&devlink->lock_key#5){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x56/0xd20 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:15/7104: 6, last CPU#1:
 #0: ffff88801d2d8940 ((wq_completion)netns){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90005007d08 (net_cleanup_work){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffffffff90cb9c08 (pernet_ops_rwsem){++++}-{4:4}, at: cleanup_net+0xb8/0x920 net/core/net_namespace.c:677
 #3: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: ops_exit_rtnl_list net/core/net_namespace.c:173 [inline]
 #3: ffffffff90cd2700 (rtnl_mutex){+.+.}-{4:4}, at: ops_undo_list+0x7ec/0xab0 net/core/net_namespace.c:249
 #4: ffff88801d2c72a0 (&root->kernfs_supers_rwsem){++++}-{4:4}, at: kernfs_remove_by_name_ns+0x49/0x120 fs/kernfs/dir.c:1791
 #5: ffff88801d2c7180 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_remove_by_name_ns+0x51/0x120 fs/kernfs/dir.c:1792
locks held by kworker/u8:17/7666: 3, last CPU#1:
 #0: ffff88801c094140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3371
 #1: ffffc90003c37d08 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3372
 #2: ffff888057ee07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_constructor include/net/cfg80211.h:6905 [inline]
 #2: ffff888057ee07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_work+0x92/0x550 net/wireless/core.c:526
locks held by syz-executor/12986: 1, last CPU#1:
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: is_bpf_text_address+0x25/0x1a0 kernel/bpf/core.c:749
locks held by syz-executor/12988: 1, last CPU#1:
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #0: ffffffff8edec4a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0xbd/0x2090 arch/x86/kernel/unwind_orc.c:495

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 32 Comm: khungtaskd Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x21f/0x2a0 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xcb1/0x1030 kernel/hung_task.c:561
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 16 Comm: pr/ttyS0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:delay_tsc+0x6a/0xc0 arch/x86/lib/delay.c:75
Code: 00 44 39 e0 75 36 0f 01 f9 66 90 48 c1 e2 20 48 89 d3 48 09 c3 48 89 d8 48 29 e8 4c 39 e8 73 27 bf 01 00 00 00 e8 76 26 07 f6 <65> 48 83 3d 55 f4 bc 08 00 75 bb e8 56 11 a7 f5 eb b4 4c 01 ed 48
RSP: 0018:ffffc90000157950 EFLAGS: 00000093
RAX: 8000000000000002 RBX: 000002277a152601 RCX: 0000000000000000
RDX: 0000000000000004 RSI: ffffffff8c622e00 RDI: 0000000000000001
RBP: 000002277a151c46 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000000007f3 R11: 205d323354202020 R12: 0000000000000000
R13: 0000000000000af1 R14: fffffbfff378d7e9 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888123b59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5495a69ed0 CR3: 000000000eb96000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 udelay include/asm-generic/delay.h:62 [inline]
 wait_for_lsr+0xf3/0x210 drivers/tty/serial/8250/8250_port.c:2019
 serial8250_fifo_wait_for_lsr_thre+0x5f/0xd0 drivers/tty/serial/8250/8250_port.c:3270
 __serial8250_console_fifo_write+0xa5/0x290 drivers/tty/serial/8250/8250_port.c:3345
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3378 [inline]
 __serial8250_console_write drivers/tty/serial/8250/8250_port.c:3429 [inline]
 serial8250_console_write+0xf46/0x1330 drivers/tty/serial/8250/8250_port.c:3493
 nbcon_emit_next_record+0x8f7/0xa70 kernel/printk/nbcon.c:1070
 nbcon_emit_one+0x1a8/0x2b0 kernel/printk/nbcon.c:1157
 nbcon_kthread_func+0x613/0x7d0 kernel/printk/nbcon.c:1271
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
