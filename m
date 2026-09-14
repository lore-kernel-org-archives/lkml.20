Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5233547F771
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400648; cv=none; b=pYejY51vzmA36Gxcmri4XUpomePD1JjndPVGM+NUKNbrgr1BmJ85VMeryMWRN31vxWYhz1+8RhrArDKF93XXFUu7c/fw4Hdodk6YccKKs2F/5sDT5g013v2Gzo2W7cBTuZX6lwd1oSIPxA/RwiufcaRDLWg8Iv6m2u20ZPjUnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400648; c=relaxed/simple;
	bh=3+Ug05tt0ZqfwEp4ANmge+vI3FbdeUIUBG0O4/oKlbY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qtlsMG1pstxjR2noZ264NqpLZnCLvsrlFIgmkQehCWAku2DGd7dDjRFdcw05ZOW8o/DTWfvsJntnsCYalJBmw/95s8Bc8axjj5EwYz4dXKb7ADQ7yFmLxdtvKwG3Y4KwbWGfoAx5HoagdLmzLO9hQ2KEfQFR9HA/H3oOSFrOzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-804e6c7acb6so3615952a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789400643; x=1790005443;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2sDh3oemlL9VtHkOrRANWZgFLOLaKUsdoSWRF6YEWJI=;
        b=2GfEm0MriLhgDNGYC73VLmO02h1SkEC/FkSSGgznwQeHC98rIGKWKpDB+TWrPnqJ4P
         D0fFd797QxojOQ17AhEeZKI4g4d+VTNQj8iii60ThXfK6kBhlAHRLAVipBUM+rst3e1c
         c8lWU7p1K+cxTan7LjoefOEuDJvw+P4AKccAWSbYXNEi+uvcATXcRlwzIlKWg5kECvMO
         tNJ0bThcNsXlD+GeBE3WJF+T65IyUk3XzdND7H25XEd0hcnx1JshJ4JM+3yKe5j2pyT1
         yEildhQmwVcZxRFUJ3TbrL5da2F9DbOoceucsBZePbMxFLak7dNxeMxckSD8tyHBtB7h
         rf1w==
X-Forwarded-Encrypted: i=1; AKwUvBwUvVksDw5hrGrUN38pZaghoo0RC6UeVjW+Wb3s3FhMYKWdJat+V0qfaRdznv3typ0ocFR3d5OvXhXSDho=@vger.kernel.org
X-Gm-Message-State: AFuF++nIuR4b7c/psh1es5WLAZ4DzAOgMwsBAcbUbK3B/F4bQrCg5i9k
	jjl1JEuiJFaLkxDiRbmHBB+V1HK/Ug812UU7BFvTsfM8CV6CueB7RehJXB5Vz+Eyp3KXbjjieuC
	0EWndjebMQ8Rf/88tfKDPpaH6oQbD1hgi9S5cAbka1sYPGizmBOkHdJOeuyE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e90b:0:b0:6bd:f79e:501b with SMTP id
 006d021491bc7-6c54243eb81mr2730341eaf.28.1789400643008; Mon, 14 Sep 2026
 08:44:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:44:02 -0700
In-Reply-To: <6aa7d932.ab0bb76a.688f5.afb7SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa81642.f670cee1.72fc4.001e.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering=
 an issue:
INFO: task hung in addrconf_dad_work

INFO: task kworker/u8:2:38 blocked for more than 151 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:2    state:D stack:23552 pid:38    tgid:38    ppid:2      t=
ask_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_dad_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 addrconf_dad_work+0x116/0x15c0 net/ipv6/addrconf.c:4235
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor:6212 blocked for more than 151 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:21624 pid:6212  tgid:6212  ppid:6210   t=
ask_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 class_wiphy_constructor include/net/cfg80211.h:6906 [inline]
 reg_process_self_managed_hints+0x8d/0x160 net/wireless/reg.c:3195
 wiphy_register+0x230e/0x2ff0 net/wireless/core.c:1190
 ieee80211_register_hw+0x3d3d/0x4a50 net/mac80211/main.c:1626
 mac80211_hwsim_new_radio+0x3258/0x56b0 drivers/net/wireless/virtual/mac802=
11_hwsim_main.c:6138
 hwsim_new_radio_nl+0xd8b/0xf90 drivers/net/wireless/virtual/mac80211_hwsim=
_main.c:6957
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2556
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdb9115e98e
RSP: 002b:00007ffdb00d8b88 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 000055558f49c500 RCX: 00007fdb9115e98e
RDX: 0000000000000024 RSI: 00007fdb91f54670 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007ffdb00d8c04 R09: 000000000000000c
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000000 R14: 00007fdb91f54670 R15: 0000000000000000
 </TASK>
INFO: task syz-executor:6219 blocked for more than 151 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:21856 pid:6219  tgid:6219  ppid:6213   t=
ask_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 inet6_rtm_newaddr+0x667/0xe00 net/ipv6/addrconf.c:5068
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7132
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb745f5e98e
RSP: 002b:00007fff125cc3d8 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 000055557e266500 RCX: 00007fb745f5e98e
RDX: 0000000000000040 RSI: 00007fb746d54670 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007fff125cc454 R09: 000000000000000c
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000000 R14: 00007fb746d54670 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
locks held by kthreadd/2: 1, last CPU#1:
 #0: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/0:0/9: 4, on CPU#0:
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000e7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888075c99440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff888078324888 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x752/0x9b0 drivers/net/wireguard/noise.c:643
locks held by kworker/u8:0/12: 6, last CPU#1:
 #0: ffff8880353bf940 ((wq_completion)ext4-rsv-conversion){+.+.}-{0:0}, at:=
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880353bf940 ((wq_completion)ext4-rsv-conversion){+.+.}-{0:0}, at:=
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880353bf940 ((wq_completion)ext4-rsv-conversion){+.+.}-{0:0}, at:=
 process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880353bf940 ((wq_completion)ext4-rsv-conversion){+.+.}-{0:0}, at:=
 process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000117c40 ((work_completion)(&ei->i_rsv_conversion_work)){+.+.}=
-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000117c40 ((work_completion)(&ei->i_rsv_conversion_work)){+.+.}=
-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000117c40 ((work_completion)(&ei->i_rsv_conversion_work)){+.+.}=
-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000117c40 ((work_completion)(&ei->i_rsv_conversion_work)){+.+.}=
-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888035bb6938 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0x1f=
bf/0x2200 fs/jbd2/transaction.c:444
 #3: ffff88807087f7e8 (&ei->i_data_sem#2){++++}-{4:4}, at: ext4_map_blocks+=
0x77d/0x12c0 fs/ext4/inode.c:822
 #4: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #4: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #5: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #5: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #5: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1216 [inline]
 #5: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by kworker/u8:1/13: 2, last CPU#0:
 #0: ffff88803250a940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88803250a940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88803250a940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88803250a940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000127c40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000127c40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000127c40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000127c40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by pr/ttyS0/16: 4, last CPU#1:
 #0: ffffffff8ec362b8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire =
include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8ec362b8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisaf=
e include/linux/srcu.h:439 [inline]
 #0: ffffffff8ec362b8 (console_srcu){....}-{0:0}, at: console_srcu_read_loc=
k+0x30/0x60 kernel/printk/printk.c:291
 #1: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: local_lock_acquire i=
nclude/linux/local_lock_internal.h:46 [inline]
 #1: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: process_backlog+0x3d=
e/0x18b0 net/core/dev.c:6724
 #2: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #2: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #2: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: nf_hook include/linu=
x/netfilter.h:249 [inline]
 #2: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: NF_HOOK+0x9e/0x3c0 i=
nclude/linux/netfilter.h:323
 #3: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1216 [inline]
 #3: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by kworker/1:0/25: 3, last CPU#1:
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900001f7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888077045440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks=
+0x2e/0x180 kernel/locking/lockdep.c:6837
locks held by kworker/u8:2/38: 3, on CPU#0:
 #0: ffff888032280940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_l=
ock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888032280940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_r=
ead_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888032280940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888032280940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000ae7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000ae7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000ae7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000ae7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #2: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x116=
/0x15c0 net/ipv6/addrconf.c:4235
locks held by kworker/u8:3/50: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000bb7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc90000bb7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc90000bb7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff888058e66258 (&devlink->lock_key#4){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u9:0/52: 5, on CPU#0:
 #0: ffff88807b7b4940 ((wq_completion)hci3){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff88807b7b4940 ((wq_completion)hci3){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff88807b7b4940 ((wq_completion)hci3){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff88807b7b4940 ((wq_completion)hci3){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807f654ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff88807f6540b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5975
 #4: ffffffff8ed62aa8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_loc=
k kernel/rcu/tree_exp.h:311 [inline]
 #4: ffffffff8ed62aa8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rc=
u_expedited+0x2d0/0x770 kernel/rcu/tree_exp.h:966
locks held by kworker/u8:4/59: 4, on CPU#1:
 #0: ffff888020ad7940 ((wq_completion)writeback){+.+.}-{0:0}, at: rcu_lock_=
acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020ad7940 ((wq_completion)writeback){+.+.}-{0:0}, at: rcu_read_=
lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020ad7940 ((wq_completion)writeback){+.+.}-{0:0}, at: process_o=
ne_work kernel/workqueue.c:3361 [inline]
 #0: ffff888020ad7940 ((wq_completion)writeback){+.+.}-{0:0}, at: process_s=
cheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000200fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888035ba20e8 (&type->s_umount_key#34){++++}-{4:4}, at: super_trylo=
ck_shared+0x23/0xf0 fs/super.c:688
 #3: ffff888035ba0c98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: percpu_do=
wn_read include/linux/percpu-rwsem.h:77 [inline]
 #3: ffff888035ba0c98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: ext4_writ=
epages_down_read fs/ext4/ext4.h:1887 [inline]
 #3: ffff888035ba0c98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: ext4_writ=
epages+0x205/0x3b0 fs/ext4/inode.c:3031
locks held by kworker/u8:5/66: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000204fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc9000204fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc9000204fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc9000204fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff88807e82b258 (&devlink->lock_key#6){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:6/146: 2, last CPU#1:
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: rcu=
_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: rcu=
_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: pro=
cess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: pro=
cess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002dafc40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002dafc40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002dafc40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002dafc40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/0:2/190: 3, last CPU#0:
 #0: ffff888021fdcd40 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888021fdcd40 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888021fdcd40 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888021fdcd40 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002e1fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002e1fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002e1fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002e1fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807c151440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
locks held by kworker/u8:7/204: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002e8fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc90002e8fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc90002e8fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc90002e8fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff8880290ae258 (&devlink->lock_key#8){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:8/1011: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90004d97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90004d97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90004d97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90004d97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880591d07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880591d07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:527
locks held by kworker/1:2/1225: 2, last CPU#1:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900054f7c40 ((work_completion)(&(&tbl->managed_work)->work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900054f7c40 ((work_completion)(&(&tbl->managed_work)->work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900054f7c40 ((work_completion)(&(&tbl->managed_work)->work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900054f7c40 ((work_completion)(&(&tbl->managed_work)->work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/1:3/1226: 3, last CPU#1:
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005507c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005507c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005507c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005507c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888032dfd270 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/u8:11/1409: 4, last CPU#1:
 #0: ffff88807f235140 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807f235140 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807f235140 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807f235140 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005bd7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005bd7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005bd7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005bd7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
 #2: ffff88807b285440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff888032dfaad0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/u8:12/1428: 2, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005bc7c40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:=
0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005bc7c40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:=
0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005bc7c40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:=
0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005bc7c40 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:=
0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/u8:13/1465: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005de7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc90005de7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc90005de7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc90005de7c40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff88807ecfc258 (&devlink->lock_key#5){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:14/1509: 3, last CPU#0:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005f87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005f87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005f87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005f87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880595107a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880595107a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:527
locks held by kworker/u8:15/1538: 2, last CPU#1:
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: rcu=
_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: rcu=
_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: pro=
cess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ab940 ((wq_completion)events_dfl_long){+.+.}-{0:0}, at: pro=
cess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90006067c40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90006067c40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90006067c40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90006067c40 ((work_completion)(&(&ipvs->defense_work)->work)){+.+=
.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/0:3/2253: 4, on CPU#0:
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888028927d40 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90006ee7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90006ee7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90006ee7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90006ee7c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888025de1440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff888032dfd270 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632
locks held by klogd/4978: 1, last CPU#1:
 #0: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by udevd/4989: 2, last CPU#1:
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire includ=
e/linux/srcu.h:198 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/l=
inux/srcu.h:305 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock securit=
y/tomoyo/common.h:1112 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_path_perm+0x251/0=
x560 security/tomoyo/file.c:826
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by crond/5358: 2, last CPU#0:
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire includ=
e/linux/srcu.h:198 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/l=
inux/srcu.h:305 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock securit=
y/tomoyo/common.h:1112 [inline]
 #0: ffffffff8f4ef978 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_path_perm+0x251/0=
x560 security/tomoyo/file.c:826
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by getty/5375: 2, on CPU#0:
 #0: ffff8880358650a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait=
+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_rea=
d+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/u9:2/5714: 7, on CPU#0:
 #0: ffff88807b56b140 ((wq_completion)hci1){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff88807b56b140 ((wq_completion)hci1){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff88807b56b140 ((wq_completion)hci1){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff88807b56b140 ((wq_completion)hci1){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900041ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900041ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900041ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900041ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888079494ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff8880794940b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5975
 #4: ffffffff903d7300 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_connect_cfm i=
nclude/net/bluetooth/hci_core.h:2163 [inline]
 #4: ffffffff903d7300 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_conn_failed+0=
x17f/0x370 net/bluetooth/hci_conn.c:1421
 #5: ffff88802b010af8 (&conn->lock#2){+.+.}-{4:4}, at: l2cap_conn_del+0x9f/=
0x550 net/bluetooth/l2cap_core.c:1816
 #6: ffffffff8ed62aa8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_loc=
k kernel/rcu/tree_exp.h:343 [inline]
 #6: ffffffff8ed62aa8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rc=
u_expedited+0x38d/0x770 kernel/rcu/tree_exp.h:966
locks held by kworker/1:4/5741: 4, last CPU#1:
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880564ff140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900034cfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900034cfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc900034cfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900034cfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888075c99440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_response+0x14e/0x9f0 drivers/net/wireguard/noise.c:678
 #3: ffff888078324888 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_response+0x15f/0x9f0 drivers/net/wireguard/noise.c:679
locks held by kworker/0:4/5742: 4, last CPU#0:
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000347fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000347fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000347fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000347fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888059045440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff888078325c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632
locks held by syz-executor/6209: 1, on CPU#0:
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtne=
tlink.c:80 [inline]
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core=
/rtnetlink.c:366 [inline]
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0xc10/0x1c=
30 net/core/rtnetlink.c:4214
locks held by syz-executor/6211: 3, on CPU#0:
 #0: ffff88805a598ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_dev_do_close n=
et/bluetooth/hci_core.c:500 [inline]
 #0: ffff88805a598ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_unregister_dev=
+0x22a/0x5b0 net/bluetooth/hci_core.c:2681
 #1: ffff88805a5980b8 (&hdev->lock){+.+.}-{4:4}, at: hci_dev_close_sync+0x6=
1f/0x10c0 net/bluetooth/hci_sync.c:5581
 #2: ffffffff903d7300 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_disconn_cfm i=
nclude/net/bluetooth/hci_core.h:2178 [inline]
 #2: ffffffff903d7300 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_conn_hash_flu=
sh+0x99/0x260 net/bluetooth/hci_conn.c:2746
locks held by syz-executor/6212: 3, on CPU#0:
 #0: ffffffff902c17a8 (cb_lock){++++}-{4:4}, at: genl_rcv+0x19/0x40 net/net=
link/genetlink.c:1217
 #1: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: wiphy_register+0x1faf/0=
x2ff0 net/wireless/core.c:1157
 #2: ffff8880591d07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880591d07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: reg_process_self_=
managed_hints+0x8d/0x160 net/wireless/reg.c:3195
locks held by syz-executor/6214: 1, on CPU#1:
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: inet6_rtm_newaddr+0x667=
/0xe00 net/ipv6/addrconf.c:5068
locks held by syz-executor/6219: 1, on CPU#0:
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #0: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: inet6_rtm_newaddr+0x667=
/0xe00 net/ipv6/addrconf.c:5068
locks held by udevd/6223: 2, last CPU#1:
 #0: ffff8880121c5d00 (&type->i_mutex_dir_key#5){++++}-{4:4}, at: inode_loc=
k_shared include/linux/fs.h:1039 [inline]
 #0: ffff8880121c5d00 (&type->i_mutex_dir_key#5){++++}-{4:4}, at: lookup_op=
en+0x231/0x1a40 fs/namei.c:4460
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/R-wg-cr/6276: 1, last CPU#0:
 #0: ffffffff8ebf91e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2786
locks held by kworker/1:6/6399: 3, on CPU#1:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000391fc40 ((reg_check_chans).work){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000391fc40 ((reg_check_chans).work){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000391fc40 ((reg_check_chans).work){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000391fc40 ((reg_check_chans).work){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90250920 (rtnl_mutex){+.+.}-{4:4}, at: reg_check_chans_work+0x=
ac/0x1110 net/wireless/reg.c:2469
locks held by kworker/1:7/6444: 3, on CPU#1:
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888054197d40 ((wq_completion)wg-kex-wg2#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003abfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003abfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003abfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003abfc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888078325c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by dhcpcd-run-hook/6460: 5, last CPU#1:
 #0: ffffffff8ee35c10 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:=
1542 [inline]
 #0: ffffffff8ee35c10 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm+0x10f/0x480 k=
ernel/fork.c:1595
 #1: ffff8880330636b8 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:562 [inline]
 #1: ffff8880330636b8 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x195/0x1d=
c0 mm/mmap.c:1716
 #2: ffff88802ba69078 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_n=
ested include/linux/mmap_lock.h:552 [inline]
 #2: ffff88802ba69078 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x221/0x=
1dc0 mm/mmap.c:1723
 #3: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #3: ffffffff8eeabc30 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #4: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1216 [inline]
 #4: ffffffff8ed5c6e0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by kworker/1:8/6462: 4, on CPU#1:
 #0: ffff8880663a6d40 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880663a6d40 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880663a6d40 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880663a6d40 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003b4fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b4fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b4fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003b4fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807b285440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_response+0x22d/0xbd0 drivers/net/wireguard/noise.c:742
 #3: ffff888032dfaad0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_response+0x2d1/0xbd0 drivers/net/wireguard/noise.c:753
locks held by kworker/0:5/6496: 3, last CPU#0:
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888031c35d40 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003b3fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b3fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b3fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003b3fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888077045440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
locks held by kworker/0:6/6498: 2, last CPU#0:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003bcfc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003bcfc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003bcfc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003bcfc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/u8:17/6499: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003bffc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc90003bffc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc90003bffc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc90003bffc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff8880297a7258 (&devlink->lock_key#7){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:18/6500: 4, last CPU#1:
 #0: ffff88807a234140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807a234140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807a234140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807a234140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003c3fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003c3fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003c3fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361

Tested on:

commit:         6f157f39 Merge branch 'remove-comma-after-sentinel-ent..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-nex=
t.git
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1338bdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dba53f227359c9d5=
9
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc92af8613ad38696f=
f09
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D12a32df95800=
00

