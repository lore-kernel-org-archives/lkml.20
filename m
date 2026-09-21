Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F04582C6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006016; cv=none; b=My6fsLzjXzm3qknkMz7EGRlO8kXyCDUT5WHUsiIPBAftfVs6HoGXEgA27wuh0GwrKEvzi5DX8TJ4QPIdvHN9+ZxkCwDaPPqM8pRU2Yy8l7DuCJhy9hLAfbRT2R2KifDkdzTYgxa5DlDK43igGjEXtisnI3saZurQV/v42FHoMbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006016; c=relaxed/simple;
	bh=7b9OgmsthLwH950YCTSCwvwrxnPMk3GsnQZVIV0H+TU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sCUbtfQecQbBri6vi+xlLj+lQYsiEdDE4YP/rHpseRM8zqpBf0ignd7GrSKLKRTeHpsdJ34EHZCyv7k1mmIhjDkQ6xvGJPJtDEcjgMiTfcmnCf7x0cCZvOb+hZ/XCJUW2qJa4LK0Un+emFfEkfc3mvJrovEnhU98NCm/HHXW6Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f66624aa21so830632a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006012; x=1790610812;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gtsyxdku34MtgYHLN5PRsddXREDslwSuwpiTS5BZvwc=;
        b=sco9HdQIEwUermGtS4gfeSznfqI6NCRXy0YGaJHW0svetp8nWEiT5tlQ87ylvxH2bO
         W/AxiRhkvvbrwk2IcuF5ykRw/i5Vb9YGYWkRn1Yse3UQBik1rB7bviibkMGCsnPHEOED
         DZPHeUc3Pjob7MKv3UAmF+JFwG6gPBto9qxPbJGzWPSng1aV0cQ+oBKt3HWvWqoeIyid
         7829YaV+3G+I/UEPlxRcgBkB+sjQykjDmhGwQUkGcqvy2hGCzdKWtpf9rme3qGuwwzwK
         glRD9x4pbjQ9OPXU+VNGdJx+VkiNH0OiwLbYGqg+Evv+rQOsNvARPNQezk6FFRGjhP2R
         ZyOQ==
X-Gm-Message-State: AFuF++kRgbVL+ggOOVWOk/2lL+9CubiIpg8k7b+b8ycaXrIUZqHc82AX
	dD4L5gZVuhjQFT6AilA5QHlcwT5rdYknGXzCrqmDgiPrbEfP8HofvZxoZ/IFWRUw6Ulf+ceU9QT
	tVuVEVHT5HLm+5LcfCw7xEA/v8kqaXOdLtzMqq6RNzAtyue4m3vGw+6odeIC1nA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee06:0:b0:6be:4117:ae1e with SMTP id
 006d021491bc7-6ca99f26b25mr10478397eaf.14.1790006012413; Mon, 21 Sep 2026
 08:53:32 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:53:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab152fc.71f81b7d.15fa6d.002f.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in usbatm_usb_disconnect (2)
From: syzbot <syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e92005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca2c9f85bd8b5e46516
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158a64c9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e92005580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/daf497619736/disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/748fbd82f647/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e61c59099d07/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9ca2c9f85bd8b5e46516@syzkaller.appspotmail.com

INFO: task kworker/1:1:30 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:23656 pid:30    tgid:30    ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_timeout+0xc0/0x2c0 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2ca/0x5e0 kernel/sched/completion.c:153
 usbatm_usb_disconnect+0x111/0x620 drivers/usb/atm/usbatm.c:1227
 usb_unbind_interface+0x295/0x9f0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x4f5/0x880 drivers/base/dd.c:1372
 bus_remove_device+0x444/0x560 drivers/base/bus.c:664
 device_del+0x524/0x8f0 drivers/base/core.c:3965
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1478
 usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5420 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/0:3:5785 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:3     state:D stack:22304 pid:5785  tgid:5785  ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_timeout+0xc0/0x2c0 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2ca/0x5e0 kernel/sched/completion.c:153
 usbatm_usb_disconnect+0x111/0x620 drivers/usb/atm/usbatm.c:1227
 usb_unbind_interface+0x295/0x9f0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x4f5/0x880 drivers/base/dd.c:1372
 bus_remove_device+0x444/0x560 drivers/base/bus.c:664
 device_del+0x524/0x8f0 drivers/base/core.c:3965
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1478
 usb_disconnect+0x346/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5420 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
 port_event drivers/usb/core/hub.c:5884 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5966
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
locks held by pr/ttyS0/16: 1, last CPU#0:
 #0: ffffffff8ec364b8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8ec364b8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:439 [inline]
 #0: ffffffff8ec364b8 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x30/0x60 kernel/printk/printk.c:291
locks held by kworker/1:1/30: 5, on CPU#1:
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000a57c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a8311d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a8311d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88802a7c01d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802a7c01d8 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xfc/0x9a0 drivers/usb/core/hub.c:2341
 #4: ffff8880262161a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880262161a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
 #4: ffff8880262161a0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb9/0x880 drivers/base/dd.c:1369
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:7/159: 4, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002e5fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002e5fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002e5fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002e5fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_report_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888058bf4258 (&devlink->lock_key#6){+.+.}-{4:4}, at: nsim_dev_trap_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
 #3: ffff8880b873bb20 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:677
locks held by kworker/1:2/1219: 2, last CPU#1:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900055f7c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900055f7c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900055f7c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900055f7c40 ((work_completion)(&(&gc_work->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by getty/5374: 2, on CPU#1:
 #0: ffff8880362860a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by udevd/5666: 4, on CPU#1:
 #0: ffff88802be1ebd8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff88807a98b080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880783b7788 (kn->active#27){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880783b7788 (kn->active#27){++++}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff8880798bb1d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff8880798bb1d8 (&dev->mutex){....}-{4:4}, at: manufacturer_show+0x26/0xa0 drivers/usb/core/sysfs.c:142
locks held by udevd/5682: 4, on CPU#1:
 #0: ffff88807c253ab8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff88807a959080 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff8880764c8878 (kn->active#32){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff8880764c8878 (kn->active#32){++++}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffff88802a7c01d8 (&dev->mutex){....}-{4:4}, at: device_lock_interruptible include/linux/device.h:1109 [inline]
 #3: ffff88802a7c01d8 (&dev->mutex){....}-{4:4}, at: serial_show+0x26/0xa0 drivers/usb/core/sysfs.c:143
locks held by syz-executor/5784: 1, last CPU#1:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: hrtimer_run_softirq+0x71/0x2e0 kernel/time/hrtimer.c:2138
locks held by kworker/0:3/5785: 5, on CPU#0:
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000337fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000337fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000337fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000337fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a78c1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a78c1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff8880798bb1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880798bb1d8 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xfc/0x9a0 drivers/usb/core/hub.c:2341
 #4: ffff888034dc71a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888034dc71a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
 #4: ffff888034dc71a0 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb9/0x880 drivers/base/dd.c:1369
locks held by udevd/5795: 1, last CPU#0:
 #0: ffffffff8f4f0b78 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:198 [inline]
 #0: ffffffff8f4f0b78 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:305 [inline]
 #0: ffffffff8f4f0b78 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock security/tomoyo/common.h:1112 [inline]
 #0: ffffffff8f4f0b78 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_path_perm+0x251/0x560 security/tomoyo/file.c:826
locks held by kworker/1:6/5912: 5, on CPU#1:
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000302fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000302fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000302fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000302fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a8671d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a8671d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88802fc3c1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802fc3c1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807c5561a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807c5561a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/1:7/6008: 3, on CPU#1:
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ae4940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002fafc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002fafc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002fafc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002fafc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88802a6e61d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a6e61d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
locks held by speedtch/6052: 1, on CPU#0:
 #0: ffffffff8ebf7d08 (umhelper_sem){++++}-{4:4}, at: usermodehelper_read_trylock+0xfc/0x2c0 kernel/umh.c:212

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
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
 watchdog+0xfd7/0x1030 kernel/hung_task.c:561
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 1219 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events_power_efficient gc_worker
RIP: 0010:__this_cpu_preempt_check+0x0/0x20 lib/smp_processor_id.c:63
Code: f5 48 8b 74 24 20 48 c7 c7 00 9b 6d 8c e8 88 ac 42 f5 e8 23 ab 4d f5 eb ae 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <f3> 0f 1e fa 48 89 fe 48 c7 c7 80 9a 6d 8c e9 0d ff ff ff cc cc cc
RSP: 0018:ffffc900055f7938 EFLAGS: 00000046
RAX: 8000000000000000 RBX: ffffffff8a0040de RCX: ffff888029898000
RDX: 0000000000000000 RSI: 0000000000000200 RDI: ffffffff8e4e3f89
RBP: ffffc900055f7ad0 R08: ffffffff8a010014 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff20f4570 R12: dffffc0000000000
R13: ffffffff818f9aba R14: 0000000000000200 R15: 0000000000000e5a
FS:  0000000000000000(0000) GS:ffff888124dd2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000579c31ec CR3: 00000000727d2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 lockdep_hardirqs_off+0x8e/0xd0 kernel/locking/lockdep.c:4539
 trace_hardirqs_off+0x12/0x40 kernel/trace/trace_preemptirq.c:104
 seqcount_lockdep_reader_access+0x6e/0x100 include/linux/seqlock.h:72
 nf_conntrack_get_ht include/net/netfilter/nf_conntrack.h:343 [inline]
 gc_worker+0x31b/0x1890 net/netfilter/nf_conntrack_core.c:1534
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
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
