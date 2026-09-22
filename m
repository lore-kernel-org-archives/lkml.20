Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAE3E4506
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064498; cv=none; b=AjpmZLNbp4Kb0PrnWN/bq7qAUWR8/zBFa1nDE6o/a82+WTplw/qnaV5MCewsIE+e8dSX99kmTJym5t/hJJvhhDgMfYvdBbF/MDCT0/cA98BfTdTrljuUIdBJGwzyxD92xdnFJDeIqe0HjfY16isCVjnziDO74FZ2Wv3GJkGKenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064498; c=relaxed/simple;
	bh=zW4tU0Hdl/5gMKn9XkllskzCuEEOgUm0BrnNAYGDO2c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qixhJB57SonWTgUndE1ISWQy7Spjzh15XMz0yZ+hXKAES49E9QUHPuwUdmUdDUEG11iW/YXy5bDp465LE2CPz+AbVOrCWk4fFy4nvw8pueyW0ENZ759XDIgsux1Jmdl+leoUoYNhQL4bAbjG68Udduwf9WbZkgEjp3g5Lt65oL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80491594629so913966a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064482; x=1790669282;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M7h1wFfJeYRk3DhFR9lrlgsoGvCLUIByXzVD5xLA+yY=;
        b=t/HrsDk4GGR+JmUHA39gtGFRzPBEr2d18j5CKchPe8JAskM4bOh949ZzWXOwuBeaQf
         TbZscgDFllsz/Zxcc3clshFFUy0nxN/ymbPUDSDQ31TxXo8K7p0PkgcrVhMCp+MIZdOQ
         fmmKqZ0xAjKfRNiL+BspWpeWcYBVTx8GDoUKoYBBLBKSy0fmWnHGiMADdQbgfQCLqxrg
         pm6kuNCPOjGFdW1Df00CelU/Be6kgHbsHgFhgxnR+Wo3/chlIOuHIiqtpJqX5O31gSZP
         gu56LcF+RWMrGcOgZHn0en/tJV/ENe4vwK84lydPemI/N+iiY40l2rVD7z5x/2FtK0Xk
         ax+g==
X-Forwarded-Encrypted: i=1; AKwUvBw6Tt2G+xVC0Ms5SBQChYBrhZ9sL/jHOGRAi/XZ7ACdPctXbB3tzADxvqP4INynVdPNpWEGyWvwQOwdDTs=@vger.kernel.org
X-Gm-Message-State: AFuF++lGRGB4+7Gluq973NHu/eNA1/FYfrtuf3hCcRjYbgWsYuuctgQw
	eff5Azani9pU3ONMYogqtJG10vJAqAS7OLrlHpqBakVlCk+M3grlxA0y++bUVxbcac/HCtJLaGH
	tC1AiKMLMLTquf81yuwK3OitNUgPkr85m43H0GJ/gIYtR+EEtUfbhu6cIDdI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198e:b0:6c3:5bdd:1740 with SMTP id
 006d021491bc7-6d1588614f8mr1695597eaf.13.1790064482485; Tue, 22 Sep 2026
 01:08:02 -0700 (PDT)
Date: Tue, 22 Sep 2026 01:08:02 -0700
In-Reply-To: <20260922.164104.1303179719059786206.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab23762.e548f532.1ca396.0019.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] INFO: task hung in find_inode (2)
From: syzbot <syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in find_inode

INFO: task syz.4.199:7232 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.199       state:D stack:24904 pid:7232  tgid:7229  ppid:6196   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x1786/0x5710 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 __wait_on_freeing_inode+0x1f0/0x380 fs/inode.c:2615
 find_inode+0x3ca/0x6a0 fs/inode.c:1048
 inode_insert5+0x12e/0x5d0 fs/inode.c:1309
 insert_inode_locked4+0x74/0xc0 fs/inode.c:1944
 nilfs_insert_inode_locked fs/nilfs2/inode.c:296 [inline]
 nilfs_new_inode+0x4e8/0x7f0 fs/nilfs2/inode.c:350
 nilfs_mkdir+0x11a/0x380 fs/nilfs2/namei.c:234
 vfs_mkdir+0x40c/0x620 fs/namei.c:5410
 filename_mkdirat+0x285/0x510 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc9b55903b9
RSP: 002b:00007fc9b640f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fc9b5795fa0 RCX: 00007fc9b55903b9
RDX: 00000000000001c0 RSI: 0000000020000080 RDI: ffffffffffffff9c
RBP: 00007fc9b561b9d4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fc9b5795fa0 R15: 00007ffd4926ab58
 </TASK>
INFO: task syz.2.218:7338 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.218       state:D stack:24840 pid:7338  tgid:7334  ppid:6186   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x1786/0x5710 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 __wait_on_freeing_inode+0x1f0/0x380 fs/inode.c:2615
 find_inode+0x3ca/0x6a0 fs/inode.c:1048
 inode_insert5+0x12e/0x5d0 fs/inode.c:1309
 insert_inode_locked4+0x74/0xc0 fs/inode.c:1944
 nilfs_insert_inode_locked fs/nilfs2/inode.c:296 [inline]
 nilfs_new_inode+0x4e8/0x7f0 fs/nilfs2/inode.c:350
 nilfs_mkdir+0x11a/0x380 fs/nilfs2/namei.c:234
 vfs_mkdir+0x40c/0x620 fs/namei.c:5410
 filename_mkdirat+0x285/0x510 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x155/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd0fdd903b9
RSP: 002b:00007fd0febd3028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fd0fdf95fa0 RCX: 00007fd0fdd903b9
RDX: 00000000000001c0 RSI: 0000000020000080 RDI: ffffffffffffff9c
RBP: 00007fd0fde1b9d4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fd0fdf95fa0 R15: 00007ffe9081dc28
 </TASK>

Showing all locks held in the system:
locks held by kworker/u8:1/14: 3, last CPU#0:
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc90000137c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000137c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000137c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000137c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff88807c5ac258 (&devlink->lock_key#7){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:2/15: 3, last CPU#0:
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc90000147c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000147c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000147c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000147c40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff88802a3ba258 (&devlink->lock_key#4){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by pr/ttyS0/17: 2, last CPU#1:
 #0: ffffffff8e41b8b8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8e41b8b8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:439 [inline]
 #0: ffffffff8e41b8b8 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x30/0x60 kernel/printk/printk.c:291
 #1: ffffffff9a263378 (&port_lock_key){-.-.}-{3:3}, at: __uart_port_lock_irqsave include/linux/serial_core.h:613 [inline]
 #1: ffffffff9a263378 (&port_lock_key){-.-.}-{3:3}, at: univ8250_console_device_lock+0x67/0xc0 drivers/tty/serial/8250/8250_core.c:413
locks held by khungtaskd/33: 1, last CPU#0:
 #0: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6837
locks held by kworker/1:2/50: 3, on CPU#1:
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc90000ba7c40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000ba7c40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000ba7c40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000ba7c40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff888053b96650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_evict_inode+0x156/0x480 fs/nilfs2/inode.c:873
locks held by kworker/u8:4/60: 3, last CPU#0:
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc9000201fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff888071d11258 (&devlink->lock_key#8){+.+.}-{4:4}, at: lock_timer_base kernel/time/timer.c:1004 [inline]
 #2: ffff888071d11258 (&devlink->lock_key#8){+.+.}-{4:4}, at: __mod_timer+0x1a9/0xed0 kernel/time/timer.c:1085
locks held by kworker/u8:5/61: 3, last CPU#0:
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff88802a40c258 (&devlink->lock_key#5){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:7/158: 4, last CPU#0:
 #0: ffff888031a61940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031a61940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031a61940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888031a61940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc90002e8fc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002e8fc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002e8fc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002e8fc40 ((work_completion)(&(&forw_packet_aggr->delayed_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff888028f271c8 (&hard_iface->bat_iv.ogm_buff_mutex){+.+.}-{4:4}, at: batadv_iv_ogm_schedule+0xd4/0xfc0 net/batman-adv/bat_iv_ogm.c:1010
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_slide_own_bcast_window net/batman-adv/bat_iv_ogm.c:870 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_schedule_buff net/batman-adv/bat_iv_ogm.c:949 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: batadv_iv_ogm_schedule+0x41f/0xfc0 net/batman-adv/bat_iv_ogm.c:1011
locks held by kworker/u8:8/1171: 4, last CPU#0:
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe5c140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc90005607c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005607c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005607c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005607c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff888057dc07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_constructor include/net/cfg80211.h:6906 [inline]
 #2: ffff888057dc07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_work+0xb4/0x420 net/wireless/core.c:527
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by syslogd/4956: 1, last CPU#0:
 #0: ffff88803545b068 (&u->iolock){+.+.}-{4:4}, at: __unix_dgram_recvmsg+0x1e3/0xdc0 net/unix/af_unix.c:2587
locks held by getty/5358: 2, on CPU#1:
 #0: ffff8880285ec0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032232e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5b7/0x1a60 drivers/tty/n_tty.c:2211
locks held by udevd/6080: 1, last CPU#0:
 #0: ffff88807fab4378 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_downgrade include/linux/mmap_lock.h:594 [inline]
 #0: ffff88807fab4378 (&mm->mmap_lock){++++}-{4:4}, at: vms_complete_munmap_vmas+0x224/0xbe0 mm/vma.c:1420
locks held by udevd/6085: 4, last CPU#0:
 #0: ffff888012138460 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff888011dd6308 (&type->i_mutex_dir_key#5/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff888011dd6308 (&type->i_mutex_dir_key#5/1){+.+.}-{4:4}, at: lock_rename fs/namei.c:3785 [inline]
 #1: ffff888011dd6308 (&type->i_mutex_dir_key#5/1){+.+.}-{4:4}, at: __start_renaming+0x148/0x410 fs/namei.c:3878
 #2: ffffffff8ec54238 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:198 [inline]
 #2: ffffffff8ec54238 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:305 [inline]
 #2: ffffffff8ec54238 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock security/tomoyo/common.h:1112 [inline]
 #2: ffffffff8ec54238 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_path_perm+0x258/0x640 security/tomoyo/file.c:826
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #3: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by kworker/0:4/6175: 3, on CPU#0:
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc900034efc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900034efc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900034efc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900034efc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff888032928650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_evict_inode+0x156/0x480 fs/nilfs2/inode.c:873
locks held by kworker/0:6/6395: 3, on CPU#0:
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88813fe1b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #1: ffffc9000396fc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000396fc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000396fc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000396fc40 ((work_completion)(&sci->sc_iput_work)){+.+.}-{0:0}, at: process_scheduled_works+0x900/0x15b0 kernel/workqueue.c:3479
 #2: ffff88803432a650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_evict_inode+0x156/0x480 fs/nilfs2/inode.c:873
locks held by udevd/6545: 3, last CPU#0:
 #0: ffff8880290a5cf8 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:562 [inline]
 #0: ffff8880290a5cf8 (&mm->mmap_lock){++++}-{4:4}, at: __vm_munmap+0x163/0x3e0 mm/vma.c:3387
 #1: ffff88802a5ce8b0 (&anon_vma->rwsem){++++}-{4:4}, at: anon_vma_lock_write mm/internal.h:295 [inline]
 #1: ffff88802a5ce8b0 (&anon_vma->rwsem){++++}-{4:4}, at: vma_prepare+0x250/0x470 mm/vma.c:360
 #2: ffffffff8e6639d0 (kfree_rcu_sheaf_map-wait-type-override){+.+.}-{3:3}, at: __kfree_rcu_sheaf+0x21/0x6c0 mm/slub.c:6111
locks held by syz.4.199/7232: 4, on CPU#0:
 #0: ffff888053b96460 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff88805599efb0 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff88805599efb0 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #1: ffff88805599efb0 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #1: ffff88805599efb0 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: filename_create+0x200/0x370 fs/namei.c:5092
 #2: ffff888053b96650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mkdir+0xd4/0x380 fs/nilfs2/namei.c:228
 #3: ffff8880792f9288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_begin+0x364/0x710 fs/nilfs2/segment.c:221
locks held by segctord/7245: 1, on CPU#1:
 #0: ffff8880792f9288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_lock+0x24a/0x4b0 fs/nilfs2/segment.c:357
locks held by syz.2.218/7338: 4, on CPU#1:
 #0: ffff888032928460 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff88805254d160 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff88805254d160 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #1: ffff88805254d160 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #1: ffff88805254d160 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: filename_create+0x200/0x370 fs/namei.c:5092
 #2: ffff888032928650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mkdir+0xd4/0x380 fs/nilfs2/namei.c:228
 #3: ffff8880212c8288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_begin+0x364/0x710 fs/nilfs2/segment.c:221
locks held by segctord/7345: 1, on CPU#0:
 #0: ffff8880212c8288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_lock+0x24a/0x4b0 fs/nilfs2/segment.c:357
locks held by udevd/7602: 2, last CPU#0:
 #0: ffff888012138460 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff888011dd6308 (&type->i_mutex_dir_key#5){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff888011dd6308 (&type->i_mutex_dir_key#5){++++}-{4:4}, at: lookup_open+0x232/0x1790 fs/namei.c:4458
locks held by udevd/7603: 2, last CPU#0:
 #0: ffff888025451350 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_release+0x1b8/0x690 block/bdev.c:1173
 #1: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: is_bpf_text_address+0x26/0x2b0 kernel/bpf/core.c:749
locks held by syz.1.1068/10105: 4, on CPU#0:
 #0: ffff88803432a460 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #1: ffff8880559dc540 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff8880559dc540 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #1: ffff8880559dc540 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #1: ffff8880559dc540 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: filename_create+0x200/0x370 fs/namei.c:5092
 #2: ffff88803432a650 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mkdir+0xd4/0x380 fs/nilfs2/namei.c:228
 #3: ffff888071473288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_begin+0x364/0x710 fs/nilfs2/segment.c:221
locks held by segctord/10111: 1, on CPU#0:
 #0: ffff888071473288 (&nilfs->ns_segctor_sem){++++}-{4:4}, at: nilfs_transaction_lock+0x24a/0x4b0 fs/nilfs2/segment.c:357
locks held by syz-executor/10435: 10, last CPU#0:
 #0: ffff88807fe4c460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2753 [inline]
 #0: ffff88807fe4c460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888024893480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1e5/0x540 fs/kernfs/file.c:336
 #2: ffff888028825c38 (kn->active#59){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff888028825c38 (kn->active#59){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x238/0x540 fs/kernfs/file.c:337
 #3: ffffffff8f1cee20 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: new_device_store+0x13c/0x6d0 drivers/net/netdevsim/bus.c:184
 #4: ffff888028a41128 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888028a41128 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #5: ffff888028a43258 (&devlink->lock_key#11){+.+.}-{4:4}, at: nsim_drv_probe+0xfb/0xbb0 drivers/net/netdevsim/dev.c:1583
 #6: ffffffff8f93bf40 (rtnl_mutex){+.+.}-{4:4}, at: nsim_init_netdevsim drivers/net/netdevsim/netdev.c:1060 [inline]
 #6: ffffffff8f93bf40 (rtnl_mutex){+.+.}-{4:4}, at: nsim_create+0x832/0xf50 drivers/net/netdevsim/netdev.c:1154
 #7: ffff88805ff58e60 (&dev_instance_lock_key#23){+.+.}-{4:4}, at: register_netdevice+0x17b7/0x1ce0 net/core/dev.c:11540
 #8: ffff888057b18530 (&idev->mc_lock){+.+.}-{4:4}, at: __ipv6_dev_mc_inc+0x4e/0xa40 net/ipv6/mcast.c:944
 #9: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #9: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #9: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #9: ffffffff8e5401a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by syz.3.1227/10621: 1, last CPU#0:
 #0: ffff888025451350 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_open+0xde/0xd70 block/bdev.c:990
locks held by syz.5.1229/10624: 4, last CPU#0:
 #0: ffff88807b7320e8 (&type->s_umount_key#56/1){+.+.}-{4:4}, at: alloc_super fs/super.c:365 [inline]
 #0: ffff88807b7320e8 (&type->s_umount_key#56/1){+.+.}-{4:4}, at: sget_fc+0x8d0/0x17d0 fs/super.c:889
 #1: ffff888076463748 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_bmap_lookup_at_level+0x9a/0x3d0 fs/nilfs2/bmap.c:65
 #2: ffff8880b863b960 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:677
 #3: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x790 kernel/sched/psi.c:933
locks held by syz.0.1228/10626: 2, last CPU#0:
 #0: ffff88801b698460 (sb_writers#5){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2753 [inline]
 #0: ffff88801b698460 (sb_writers#5){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888076835d00 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff888076835d00 (&sb->s_type->i_mutex_key#14){+.+.}-{4:4}, at: shmem_file_write_iter+0x7f/0x120 mm/shmem.c:3430
locks held by syz.6.1230/10628: 1, last CPU#0:
 #0: ffff888077920bc8 (vm_lock){++++}-{0:0}, at: lock_vma_under_rcu+0x1d1/0x500 mm/mmap_lock.c:310

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 33 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0x16d4/0x1730 kernel/hung_task.c:561
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 17 Comm: pr/ttyS0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:io_serial_in+0x77/0xc0 drivers/tty/serial/8250/8250_port.c:409
Code: e8 ee 2b 88 fc 44 89 f9 d3 e3 49 83 c6 40 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 bf 84 f5 fc 41 03 1e 89 da ec <0f> b6 c0 5b 41 5c 41 5e 41 5f c3 cc cc cc cc cc 44 89 f9 80 e1 07
RSP: 0000:ffffc90000167918 EFLAGS: 00000002
RAX: 1ffffffff344c600 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: 0000000000000000 RDI: 0000000000000020
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: ffffffff853b3b70 R12: dffffc0000000000
R13: 0000000000000000 R14: ffffffff9a2633a0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881258a5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4bffa00400 CR3: 0000000079908000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_in drivers/tty/serial/8250/8250.h:128 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:150 [inline]
 wait_for_lsr+0x184/0x2f0 drivers/tty/serial/8250/8250_port.c:2013
 serial8250_fifo_wait_for_lsr_thre drivers/tty/serial/8250/8250_port.c:3270 [inline]
 __serial8250_console_fifo_write+0xcd/0x3e0 drivers/tty/serial/8250/8250_port.c:3345
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3378 [inline]
 __serial8250_console_write drivers/tty/serial/8250/8250_port.c:3429 [inline]
 serial8250_console_write+0xaa1/0x1200 drivers/tty/serial/8250/8250_port.c:3493
 nbcon_emit_next_record+0x4f0/0xa00 kernel/printk/nbcon.c:-1
 nbcon_emit_one kernel/printk/nbcon.c:1157 [inline]
 nbcon_kthread_func+0x679/0x880 kernel/printk/nbcon.c:1271
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12e1f45e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4c311f3405f3ed1
dashboard link: https://syzkaller.appspot.com/bug?extid=6646318bbcf419411bc5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c97525580000

