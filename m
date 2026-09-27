Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68883B4E87
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790476657; cv=none; b=J5yJdPzYfEUA5YTs1cvgebtljxHFU2mLM694v6zAoFpsJOb5vMLyGMju293OegftvkRR2xNQoUZFqUTtth0rOK4r/lPbWsTyPk/fWIDlXgS04mrFXwYG83e16rd3P2gWhIxhTysc+0mt8QTMcs/a8j2RTIh9ybkZvLx27Rntyu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790476657; c=relaxed/simple;
	bh=Eur20OQzcfFnn6KG83k8Ry5pg9g03ljeQibCX7rOoek=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=j5qEXrXgYTYl6Pn1o8sG9wQ88pJBm+z4JJ1DTgDjVLF7csMpqyCZhGoESFBzvaPDvcYFA6dDpXTZB9bWIQXwP5KZ/EGcqFc/JtXG08YLhAL9ZEGAOBXd+FjyStP6uIZLSwONK0JGUWi6K71Eefvn358dRWnCqsBpcT6ZNeRGCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81b3ce9957eso536689a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790476653; x=1791081453;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxE2BeV571qMuwK9QLdc06rAeO+ylVG5D4miTZL5JaU=;
        b=t18n9FOx4KO7c3fvP3NZ0yw1Pj6EQ6jPivOMea2/S7ByGvLtg/kwnf/b71MeEb6o0m
         sJRJrmjmelo0d7GLmkxZ+ddszDEc0g2eTEleuBGPs6K/Rm6NTLOQ2/9hWRfcXjkkB0GQ
         VT+1y4gtxaex1WzCde6wkkHQgR8L14pDr2fF/xoT035d6BGLcW8m/thPbfiKBGOth8zh
         lKeK6ddCXEapCmsjkiyoin2npl/BmM9xyqGuRDKnC+D0PTZM3JBeVn+KGUIpd4bPO36l
         oIEMYDQb4oExvMdSyP9d4LexjMKD9G5bDD3Po+CGR1wZV2EtOgKPQnrVINrytU4LkBfT
         5hqw==
X-Forwarded-Encrypted: i=1; AKwUvByC4OsD1Qpx24qDrmr4qnYj17Rgqk+p9q5V3L/uir0R5E9eIIAQc9X30xByXfoVii069lZ1rcIw2xCn8dk=@vger.kernel.org
X-Gm-Message-State: AFuF++nzlMsAzRmzcOzxh/Uy84APJHIdKJnZWcH5uCYno5T0FyXkvgbO
	OkVvieoqqxeKY1rAFF/85NdkTsZycPZlZGBgiEPW3fPoyvgnLWcHDCUXotUqUUL7GJnisYFhwjo
	Oe5QbjHbXn7lfB+tlFUie3Z9d1L9/6cQ+U2JD2VYI/BI1PU4qCtI3jqxJ/Yo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23ce:b0:4ab:230c:5faa with SMTP id
 5614622812f47-4d728f23b4fmr10785113b6e.18.1790476652898; Sat, 26 Sep 2026
 19:37:32 -0700 (PDT)
Date: Sat, 26 Sep 2026 19:37:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab8816c.80e1c6cc.1e8e5f.004c.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in usb_deregister_dev (4)
From: syzbot <syzbot+298521257d5b782bd03e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    0a0d1d55dad5 Merge tag 'scftorture.2026.08.18a' of git://g.=
.
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D171a7179580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D88d1b3c2c7d46b7=
d
dashboard link: https://syzkaller.appspot.com/bug?extid=3D298521257d5b782bd=
03e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f4d456349b61/disk-=
0a0d1d55.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e1ebeb339f53/vmlinux-=
0a0d1d55.xz
kernel image: https://storage.googleapis.com/syzbot-assets/56275002bd43/bzI=
mage-0a0d1d55.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+298521257d5b782bd03e@syzkaller.appspotmail.com

INFO: task kworker/0:4:5694 blocked for more than 147 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:4     state:D stack:22888 pid:5694  tgid:5694  ppid:2      t=
ask_flags:0x4288060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x16d9/0x5700 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 rt_mutex_schedule+0x76/0xf0 kernel/sched/core.c:7643
 rwbase_write_lock+0x3cf/0x720 kernel/locking/rwbase_rt.c:279
 usb_deregister_dev+0x87/0x240 drivers/usb/core/file.c:186
 sisusb_disconnect+0x59/0x220 drivers/usb/misc/sisusbvga/sisusbvga.c:2921
 usb_unbind_interface+0x295/0x9f0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x4f5/0x880 drivers/base/dd.c:1372
 bus_remove_device+0x449/0x560 drivers/base/bus.c:664
 device_del+0x528/0x8f0 drivers/base/core.c:3965
 usb_disable_device+0x3d4/0x8d0 drivers/usb/core/message.c:1478
 usb_disconnect+0x32d/0x990 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb7/0x4cf0 drivers/usb/core/hub.c:5961
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
locks held by kworker/0:0/9: 6, on CPU#0:
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029e36210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #2: ffff888029e36210 (&dev->mutex){....}-{4:4}, at: hub_event+0x187/0x4cf0=
 drivers/usb/core/hub.c:5907
 #3: ffff88803b376210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #3: ffff88803b376210 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #4: ffff88802cec51d8 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #4: ffff88802cec51d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #5: ffffffff8ee79b60 (minor_rwsem#2){++++}-{4:4}, at: usb_register_dev+0x1=
42/0x5e0 drivers/usb/core/file.c:134
locks held by kworker/0:1/10: 5, last CPU#0:
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029fa8210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #2: ffff888029fa8210 (&dev->mutex){....}-{4:4}, at: hub_event+0x187/0x4cf0=
 drivers/usb/core/hub.c:5907
 #3: ffff888033a54210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #3: ffff888033a54210 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #4: ffff888040d881d8 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #4: ffff888040d881d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
locks held by kworker/u8:0/12: 9, last CPU#0:
 #0: ffff88806370f138 ((wq_completion)wg-kex-wg0#11){+.+.}-{0:0}, at: rcu_l=
ock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88806370f138 ((wq_completion)wg-kex-wg0#11){+.+.}-{0:0}, at: rcu_r=
ead_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88806370f138 ((wq_completion)wg-kex-wg0#11){+.+.}-{0:0}, at: proce=
ss_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88806370f138 ((wq_completion)wg-kex-wg0#11){+.+.}-{0:0}, at: proce=
ss_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90000117c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000117c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000117c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90000117c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
0
 #2: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_i=
p+0x3d/0x420 kernel/softirq.c:186
 #4: ffff8880607da240 (&peer->endpoint_lock){++..}-{3:3}, at: read_lock_bh =
include/linux/rwlock_rt.h:45 [inline]
 #4: ffff8880607da240 (&peer->endpoint_lock){++..}-{3:3}, at: wg_socket_sen=
d_skb_to_peer+0x6e/0x200 drivers/net/wireguard/socket.c:172
 #6: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: local_bh_disable =
include/linux/bottom_half.h:20 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh =
include/linux/rcupdate.h:902 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: send6+0x255/0x920=
 drivers/net/wireguard/socket.c:118
 #8: ffffe8ffffc9e4a0 ((&({ do { const void *__vpp_verify =3D (typeof((dst_=
cache->cache) + 0))((void *)0); (void)__vpp_verify; } while (0); ((typeof((=
__typeof_unqual__(*((dst_cache->cache))) *)(( unsigned long)((dst_cache->ca=
che)))))((unsigned long)((__typeof_unqual__(*((dst_cache->cache))) *)(( uns=
igned long)((dst_cache->cache)))) + (((__per_cpu_offset[(i)]))))); })->bh_l=
ock)){+...}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:45 [inline]
 #8: ffffe8ffffc9e4a0 ((&({ do { const void *__vpp_verify =3D (typeof((dst_=
cache->cache) + 0))((void *)0); (void)__vpp_verify; } while (0); ((typeof((=
__typeof_unqual__(*((dst_cache->cache))) *)(( unsigned long)((dst_cache->ca=
che)))))((unsigned long)((__typeof_unqual__(*((dst_cache->cache))) *)(( uns=
igned long)((dst_cache->cache)))) + (((__per_cpu_offset[(i)]))))); })->bh_l=
ock)){+...}-{3:3}, at: dst_cache_get_ip6+0xb1/0x260 net/core/dst_cache.c:14=
7
locks held by ktimers/0/16: 2, last CPU#0:
 #0: ffff8880b863c320 (&rq->__lock){-...}-{2:2}, at: raw_spin_rq_lock_neste=
d+0xb2/0x160 kernel/sched/core.c:685
 #1: ffff8880b8624548 (psi_seq){-...}-{0:0}, at: __local_bh_disable_ip+0x3d=
/0x420 kernel/softirq.c:186
locks held by pr/legacy/17: 4, last CPU#0:
 #0: ffffffff8e1b59c0 (console_lock){+.+.}-{0:0}, at: legacy_kthread_func+0=
x1a3/0x250 kernel/printk/printk.c:3718
 #1: ffffffff8e09d2b8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire =
include/linux/rcupdate.h:314 [inline]
 #1: ffffffff8e09d2b8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisaf=
e include/linux/srcu.h:439 [inline]
 #1: ffffffff8e09d2b8 (console_srcu){....}-{0:0}, at: console_srcu_read_loc=
k kernel/printk/printk.c:291 [inline]
 #1: ffffffff8e09d2b8 (console_srcu){....}-{0:0}, at: console_flush_one_rec=
ord+0xfa/0xb90 kernel/printk/printk.c:3246
 #2: ffffffff99e83118 (&port_lock_key){+.+.}-{3:3}, at: spin_lock include/l=
inux/spinlock_rt.h:45 [inline]
 #2: ffffffff99e83118 (&port_lock_key){+.+.}-{3:3}, at: uart_port_lock_irqs=
ave include/linux/serial_core.h:719 [inline]
 #2: ffffffff99e83118 (&port_lock_key){+.+.}-{3:3}, at: serial8250_console_=
write+0x17c/0x1b40 drivers/tty/serial/8250/8250_port.c:3344
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
locks held by kworker/1:0H/32: 3, last CPU#1:
 #0: ffff88813ff23538 ((wq_completion)events_highpri){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff23538 ((wq_completion)events_highpri){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff23538 ((wq_completion)events_highpri){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff23538 ((wq_completion)events_highpri){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90000a6fc40 ((work_completion)(&vmidi->output_work)){+.+.}-{0:0},=
 at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a6fc40 ((work_completion)(&vmidi->output_work)){+.+.}-{0:0},=
 at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a6fc40 ((work_completion)(&vmidi->output_work)){+.+.}-{0:0},=
 at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90000a6fc40 ((work_completion)(&vmidi->output_work)){+.+.}-{0:0},=
 at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
locks held by khungtaskd/37: 1, last CPU#1:
 #0: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #0: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #0: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks=
+0x2e/0x180 kernel/locking/lockdep.c:6793
locks held by kworker/1:1/49: 7, on CPU#1:
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90000bb7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff8880293e6210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #2: ffff8880293e6210 (&dev->mutex){....}-{4:4}, at: hub_event+0x187/0x4cf0=
 drivers/usb/core/hub.c:5907
 #3: ffff888036e92210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #3: ffff888036e92210 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #4: ffff8880359571d8 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #4: ffff8880359571d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #5: ffff888029d35a90 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #5: ffff888029d35a90 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #6: ffffffff8ee79b60 (minor_rwsem#2){++++}-{4:4}, at: usb_register_dev+0x1=
42/0x5e0 drivers/usb/core/file.c:134
locks held by kworker/u8:3/57: 2, on CPU#0:
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000123fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000123fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000123fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000123fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
locks held by kworker/u8:4/67: 10, last CPU#0:
 #0: ffff88805f582138 ((wq_completion)wg-kex-wg1#11){+.+.}-{0:0}, at: rcu_l=
ock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88805f582138 ((wq_completion)wg-kex-wg1#11){+.+.}-{0:0}, at: rcu_r=
ead_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88805f582138 ((wq_completion)wg-kex-wg1#11){+.+.}-{0:0}, at: proce=
ss_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88805f582138 ((wq_completion)wg-kex-wg1#11){+.+.}-{0:0}, at: proce=
ss_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000152fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000152fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000152fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000152fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
0
 #2: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_i=
p+0x3d/0x420 kernel/softirq.c:186
 #4: ffff8880607d8cf0 (&peer->endpoint_lock){++..}-{3:3}, at: read_lock_bh =
include/linux/rwlock_rt.h:45 [inline]
 #4: ffff8880607d8cf0 (&peer->endpoint_lock){++..}-{3:3}, at: wg_socket_sen=
d_skb_to_peer+0x6e/0x200 drivers/net/wireguard/socket.c:172
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_read_lock+0x279/0=
x4b0 kernel/locking/spinlock_rt.c:251
 #6: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: local_bh_disable =
include/linux/bottom_half.h:20 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh =
include/linux/rcupdate.h:902 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: send4+0x217/0xec0=
 drivers/net/wireguard/socket.c:38
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: ip_route_output_key_=
hash+0xd8/0x2a0 net/ipv4/route.c:2733
 #9: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #9: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #9: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: fib_lookup+0x76/0x44=
0 include/net/ip_fib.h:384
locks held by kworker/u8:6/770: 7, last CPU#0:
 #0: ffff88801d2fc138 ((wq_completion)writeback){+.+.}-{0:0}, at: rcu_lock_=
acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801d2fc138 ((wq_completion)writeback){+.+.}-{0:0}, at: rcu_read_=
lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801d2fc138 ((wq_completion)writeback){+.+.}-{0:0}, at: process_o=
ne_work kernel/workqueue.c:3352 [inline]
 #0: ffff88801d2fc138 ((wq_completion)writeback){+.+.}-{0:0}, at: process_s=
cheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90005a7fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005a7fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005a7fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90005a7fc40 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0},=
 at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff8880368cc0e0 (&type->s_umount_key#34){++++}-{4:4}, at: super_trylo=
ck_shared+0x23/0xf0 fs/super.c:688
 #3: ffff8880368b8d98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: percpu_do=
wn_read include/linux/percpu-rwsem.h:77 [inline]
 #3: ffff8880368b8d98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: ext4_writ=
epages_down_read fs/ext4/ext4.h:1887 [inline]
 #3: ffff8880368b8d98 (&sbi->s_writepages_rwsem){++++}-{0:0}, at: ext4_writ=
epages+0x205/0x3b0 fs/ext4/inode.c:3031
 #4: ffff88803efb8740 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: i_mmap_tryl=
ock_read include/linux/fs.h:523 [inline]
 #4: ffff88803efb8740 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: __rmap_walk=
_file+0x1a6/0x610 mm/rmap.c:3089
 #5: ffffffff8e309820 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at=
: __mmu_notifier_invalidate_range_end+0x67/0x400 mm/mmu_notifier.c:611
 #6: ffffffff8e309878 (srcu){.+.+}-{0:0}, at: __mmu_notifier_invalidate_ran=
ge_end+0x67/0x400 mm/mmu_notifier.c:611
locks held by kworker/1:2/998: 4, last CPU#1:
 #0: ffff88813ff22538 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff22538 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff22538 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff22538 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900064e7c40 ((gc_work).work){+.+.}-{0:0}, at: rcu_lock_acquire in=
clude/linux/rcupdate.h:309 [inline]
 #1: ffffc900064e7c40 ((gc_work).work){+.+.}-{0:0}, at: rcu_read_lock inclu=
de/linux/rcupdate.h:849 [inline]
 #1: ffffc900064e7c40 ((gc_work).work){+.+.}-{0:0}, at: process_one_work ke=
rnel/workqueue.c:3352 [inline]
 #1: ffffc900064e7c40 ((gc_work).work){+.+.}-{0:0}, at: process_scheduled_w=
orks+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffffffff8ed07af8 ("ratelimiter_table_lock"){+.+.}-{3:3}, at: spin_lock=
 include/linux/spinlock_rt.h:45 [inline]
 #2: ffffffff8ed07af8 ("ratelimiter_table_lock"){+.+.}-{3:3}, at: wg_rateli=
miter_gc_entries+0x5d/0x470 drivers/net/wireguard/ratelimiter.c:63
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
locks held by kworker/u8:9/1279: 11, last CPU#0:
 #0: ffff88805eb28138 ((wq_completion)wg-kex-wg2#3){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88805eb28138 ((wq_completion)wg-kex-wg2#3){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88805eb28138 ((wq_completion)wg-kex-wg2#3){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88805eb28138 ((wq_completion)wg-kex-wg2#3){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900070d7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900070d7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900070d7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900070d7c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
0
 #2: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_i=
p+0x3d/0x420 kernel/softirq.c:186
 #4: ffff88803bad1798 (&peer->endpoint_lock){++..}-{3:3}, at: read_lock_bh =
include/linux/rwlock_rt.h:45 [inline]
 #4: ffff88803bad1798 (&peer->endpoint_lock){++..}-{3:3}, at: wg_socket_sen=
d_skb_to_peer+0x6e/0x200 drivers/net/wireguard/socket.c:172
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #5: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_read_lock+0x279/0=
x4b0 kernel/locking/spinlock_rt.c:251
 #6: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: local_bh_disable =
include/linux/bottom_half.h:20 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh =
include/linux/rcupdate.h:902 [inline]
 #7: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: send6+0x255/0x920=
 drivers/net/wireguard/socket.c:118
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: ip6_output+0x11e/0x5=
40 net/ipv6/ip6_output.c:236
 #9: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #10: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: local_bh_disable=
 include/linux/bottom_half.h:20 [inline]
 #10: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: rcu_read_lock_bh=
 include/linux/rcupdate.h:902 [inline]
 #10: ffffffff8e1c3860 (rcu_read_lock_bh){....}-{1:3}, at: __dev_queue_xmit=
+0x294/0x3880 net/core/dev.c:4844
locks held by kworker/u8:11/1453: 4, last CPU#0:
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900074d7c40 ((next_reseed).work){+.+.}-{0:0}, at: rcu_lock_acquir=
e include/linux/rcupdate.h:309 [inline]
 #1: ffffc900074d7c40 ((next_reseed).work){+.+.}-{0:0}, at: rcu_read_lock i=
nclude/linux/rcupdate.h:849 [inline]
 #1: ffffc900074d7c40 ((next_reseed).work){+.+.}-{0:0}, at: process_one_wor=
k kernel/workqueue.c:3352 [inline]
 #1: ffffc900074d7c40 ((next_reseed).work){+.+.}-{0:0}, at: process_schedul=
ed_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
 #3: ffff8880b863c320 (&rq->__lock){-...}-{2:2}, at: raw_spin_rq_lock_neste=
d+0xb2/0x160 kernel/sched/core.c:685
locks held by kworker/u8:15/3082: 2, on CPU#0:
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000f92fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000f92fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000f92fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000f92fc40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at:=
 process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
locks held by kworker/u8:17/3338: 3, last CPU#0:
 #0: ffff88803bb23138 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88803bb23138 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88803bb23138 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88803bb23138 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000fd5fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000fd5fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000fd5fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000fd5fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
0
 #2: ffff88803f0a97b8 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
locks held by udevd/4952: 1, on CPU#0:
 #0: ffff888037ec1a08 (&ep->lock){+.+.}-{3:3}, at: spin_lock_irq include/li=
nux/spinlock_rt.h:96 [inline]
 #0: ffff888037ec1a08 (&ep->lock){+.+.}-{3:3}, at: ep_poll fs/eventpoll.c:2=
362 [inline]
 #0: ffff888037ec1a08 (&ep->lock){+.+.}-{3:3}, at: do_epoll_wait+0x80a/0xa6=
0 fs/eventpoll.c:2829
locks held by dhcpcd/5246: 2, last CPU#0:
 #0: ffffffff8e30ff50 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8e30ff50 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #1: ffff88813ffb7958 (&n->list_lock){+.+.}-{3:3}, at: spin_lock include/li=
nux/spinlock_rt.h:45 [inline]
 #1: ffff88813ffb7958 (&n->list_lock){+.+.}-{3:3}, at: __slab_free+0xf1/0x2=
a0 mm/slub.c:5682
locks held by dhcpcd/5247: 4, last CPU#0:
 #0: ffffffff8e29e470 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:=
1542 [inline]
 #0: ffffffff8e29e470 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm+0x10f/0x480 k=
ernel/fork.c:1595
 #1: ffff88813ff547b0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:562 [inline]
 #1: ffff88813ff547b0 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x18e/0x1d=
80 mm/mmap.c:1716
 #2: ffff888038f31f30 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_n=
ested include/linux/mmap_lock.h:552 [inline]
 #2: ffff888038f31f30 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x27d/0x=
1d80 mm/mmap.c:1723
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1192 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by getty/5338: 2, on CPU#1:
 #0: ffff88803633a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait=
+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900044c32e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_rea=
d+0x460/0x1360 drivers/tty/n_tty.c:2211
locks held by syz-executor/5574: 1, last CPU#1:
 #0: ffff888037c1e2b0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock incl=
ude/linux/mmap_lock.h:600 [inline]
 #0: ffff888037c1e2b0 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x1a4/0x9=
f0 mm/mmap.c:1299
locks held by kworker/u9:6/5606: 3, on CPU#0:
 #0: ffff88804e4fb938 ((wq_completion)hci5){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff88804e4fb938 ((wq_completion)hci5){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff88804e4fb938 ((wq_completion)hci5){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3352 [inline]
 #0: ffff88804e4fb938 ((wq_completion)hci5){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90005f3fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005f3fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005f3fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90005f3fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff88805ec54f80 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
locks held by kworker/0:4/5694: 6, on CPU#0:
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900061efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900061efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900061efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900061efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff8880291d8210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #2: ffff8880291d8210 (&dev->mutex){....}-{4:4}, at: hub_event+0x187/0x4cf0=
 drivers/usb/core/hub.c:5907
 #3: ffff888033ca4210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #3: ffff888033ca4210 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xe3/0x=
990 drivers/usb/core/hub.c:2336
 #4: ffff888026b0a1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #4: ffff888026b0a1d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock d=
rivers/base/dd.c:1171 [inline]
 #4: ffff888026b0a1d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_=
internal+0xb9/0x880 drivers/base/dd.c:1369
 #5: ffffffff8ee79b60 (minor_rwsem#2){++++}-{4:4}, at: usb_deregister_dev+0=
x87/0x240 drivers/usb/core/file.c:186
locks held by kworker/1:4/5708: 7, on CPU#1:
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880226d6538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000637fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000637fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rc=
u_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000637fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000637fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: pr=
ocess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff88802a01c210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #2: ffff88802a01c210 (&dev->mutex){....}-{4:4}, at: hub_event+0x187/0x4cf0=
 drivers/usb/core/hub.c:5907
 #3: ffff888063502210 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #3: ffff888063502210 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #4: ffff8880609761d8 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #4: ffff8880609761d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #5: ffff888033835a90 (&dev->mutex){....}-{4:4}, at: device_lock include/li=
nux/device.h:1104 [inline]
 #5: ffff888033835a90 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0=
x450 drivers/base/dd.c:1073
 #6: ffffffff8ee79b60 (minor_rwsem#2){++++}-{4:4}, at: usb_register_dev+0x1=
42/0x5e0 drivers/usb/core/file.c:134
locks held by kworker/1:5/5721: 4, last CPU#1:
 #0: ffff8880326e6538 ((wq_completion)wg-crypt-wg0#4){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880326e6538 ((wq_completion)wg-crypt-wg0#4){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880326e6538 ((wq_completion)wg-crypt-wg0#4){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff8880326e6538 ((wq_completion)wg-crypt-wg0#4){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000647fc40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000647fc40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000647fc40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000647fc40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_i=
p+0x3d/0x420 kernel/softirq.c:186
locks held by kworker/u8:18/5825: 5, last CPU#1:
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88813ff64138 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90006a87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90006a87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90006a87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90006a87c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888061d708d8 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff888061d708d8 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:527
 #3: ffffffff8e059240 (local_bh){.+.+}-{1:3}, at: __local_bh_disable_ip+0x3=
d/0x420 kernel/softirq.c:186
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __local_bh_disable_i=
p+0x3d/0x420 kernel/softirq.c:186
locks held by syz.1.465/7435: 2, on CPU#1:
 #0: ffffffff8ee79b60 (minor_rwsem#2){++++}-{4:4}, at: usb_open+0x30/0x1e0 =
drivers/usb/core/file.c:38
 #1: ffff8880315d6900 (&(sisusb->lock)){+.+.}-{4:4}, at: sisusb_open+0x99/0=
x420 drivers/usb/misc/sisusbvga/sisusbvga.c:2213
locks held by syz.2.643/8107: 2, last CPU#0:
 #0: ffff888033492758 (&sighand->siglock){+.+.}-{3:3}, at: spin_lock_irq in=
clude/linux/spinlock_rt.h:96 [inline]
 #0: ffff888033492758 (&sighand->siglock){+.+.}-{3:3}, at: do_group_exit+0x=
ff/0x2f0 kernel/exit.c:1137
 #1: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #1: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
locks held by syz.2.643/8108: 1, on CPU#1:
 #0: ffff8880316ef158 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_con=
structor include/linux/mutex.h:253 [inline]
 #0: ffff8880316ef158 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release=
_priv+0x48/0x170 sound/core/rawmidi.c:574
locks held by syz.2.643/8111: 1, on CPU#1:
 #0: ffff888033492758 (&sighand->siglock){+.+.}-{3:3}, at: spin_lock_irq in=
clude/linux/spinlock_rt.h:96 [inline]
 #0: ffff888033492758 (&sighand->siglock){+.+.}-{3:3}, at: get_signal+0x232=
/0x12c0 kernel/signal.c:2828
locks held by syz.4.642/8109: 1, on CPU#0:
 #0: ffff888034ecfc70 (&worker->mutex){+.+.}-{4:4}, at: vhost_worker_flush =
drivers/vhost/vhost.c:302 [inline]
 #0: ffff888034ecfc70 (&worker->mutex){+.+.}-{4:4}, at: vhost_dev_flush+0xb=
0/0x140 drivers/vhost/vhost.c:313
locks held by vhost-8110/8114: 2, on CPU#1:
 #0: ffff88803b336ed8 (&vtsk->exit_mutex){+.+.}-{4:4}, at: vhost_task_fn+0x=
3a8/0x4b0 kernel/vhost_task.c:54
 #1: ffff888034ecfc70 (&worker->mutex){+.+.}-{4:4}, at: vhost_worker_killed=
+0x57/0x390 drivers/vhost/vhost.c:470
locks held by dhcpcd/8115: 5, last CPU#0:
 #0: ffff88803f010358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: lock_sock includ=
e/net/sock.h:1713 [inline]
 #0: ffff88803f010358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: packet_do_bind+0=
x33/0xe90 net/packet/af_packet.c:3229
 #1: ffff88803f010ad8 (&po->bind_lock){+.+.}-{3:3}, at: packet_do_bind+0x58=
d/0xe90 net/packet/af_packet.c:3265
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: packet_do_bind+0x96/=
0xe90 net/packet/af_packet.c:3234
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1192 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by syz.0.644/8119: 1, on CPU#0:
 #0: ffff8880619d80e8 (&kvm->slots_lock){+.+.}-{4:4}, at: class_mutex_const=
ructor include/linux/mutex.h:253 [inline]
 #0: ffff8880619d80e8 (&kvm->slots_lock){+.+.}-{4:4}, at: kvm_vm_ioctl_set_=
memory_region+0x67/0xa0 virt/kvm/kvm_main.c:2146
locks held by dhcpcd/8117: 1, on CPU#0:
 #0: ffff888021a8a358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: lock_sock includ=
e/net/sock.h:1713 [inline]
 #0: ffff888021a8a358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: packet_do_bind+0=
x33/0xe90 net/packet/af_packet.c:3229
locks held by dhcpcd/8118: 1, on CPU#0:
 #0: ffff8880347c8358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: lock_sock includ=
e/net/sock.h:1713 [inline]
 #0: ffff8880347c8358 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: packet_do_bind+0=
x33/0xe90 net/packet/af_packet.c:3229
locks held by modprobe/8129: 1, last CPU#1:
 #0: ffff88803b4191b0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:562 [inline]
 #0: ffff88803b4191b0 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1e0=
/0x4e0 mm/util.c:579
locks held by syz-executor/8130: 1, last CPU#1:
 #0: ffff8880564d5448 (vm_lock){++++}-{0:0}, at: lock_vma_under_rcu+0x1d1/0=
x500 mm/mmap_lock.c:310
locks held by modprobe/8131: 3, last CPU#1:
 #0: ffff888037aa0430 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:562 [inline]
 #0: ffff888037aa0430 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1e0=
/0x4e0 mm/util.c:579
 #1: ffff888034236cc8 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: i_mmap_lock=
_write include/linux/fs.h:508 [inline]
 #1: ffff888034236cc8 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: vma_prepare=
+0x12e/0x470 mm/vma.c:317
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_mutex_slowunlock+=
0xbf/0xa30 kernel/locking/rtmutex.c:1430
locks held by syz-executor/8132: 9, last CPU#0:
 #0: ffff88804ddc2988 (&data->open_mutex){+.+.}-{4:4}, at: vhci_create_devi=
ce+0x33/0x6f0 drivers/bluetooth/hci_vhci.c:488
 #1: ffffffff8f976038 (uevent_sock_mutex){+.+.}-{4:4}, at: uevent_net_broad=
cast_untagged lib/kobject_uevent.c:317 [inline]
 #1: ffffffff8f976038 (uevent_sock_mutex){+.+.}-{4:4}, at: kobject_uevent_n=
et_broadcast+0x281/0x560 lib/kobject_uevent.c:410
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #2: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: sock_def_readable+0x=
ae/0x550 net/core/sock.c:3655
 #3: ffff8880342c6618 (&si->socket.wq.wait){+.+.}-{3:3}, at: spin_lock incl=
ude/linux/spinlock_rt.h:45 [inline]
 #3: ffff8880342c6618 (&si->socket.wq.wait){+.+.}-{3:3}, at: __wake_up_comm=
on_lock+0x2f/0x1f0 kernel/sched/wait.c:125
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #4: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
 #5: ffff888037ec1a08 (&ep->lock){+.+.}-{3:3}, at: spin_lock include/linux/=
spinlock_rt.h:45 [inline]
 #5: ffff888037ec1a08 (&ep->lock){+.+.}-{3:3}, at: ep_poll_callback+0x79/0x=
7e0 fs/eventpoll.c:1500
 #6: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #6: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #6: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #6: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
 #7: ffff888037ec18d8 (&ep->wq){+.+.}-{3:3}, at: spin_lock include/linux/sp=
inlock_rt.h:45 [inline]
 #7: ffff888037ec18d8 (&ep->wq){+.+.}-{3:3}, at: __wake_up_common_lock+0x2f=
/0x1f0 kernel/sched/wait.c:125
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kerne=
l/locking/spinlock_rt.c:50 [inline]
 #8: ffffffff8e1c3800 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1e2/0=
x400 kernel/locking/spinlock_rt.c:57
locks held by syz-executor/8133: 4, on CPU#1:
 #0: ffff8880368cc510 (sb_writers#4){.+.+}-{0:0}, at: mnt_want_write+0x41/0=
x90 fs/namespace.c:494
 #1: ffff88803efb8f70 (&type->i_mutex_dir_key#3/1){+.+.}-{4:4}, at: inode_l=
ock_nested include/linux/fs.h:1070 [inline]
 #1: ffff88803efb8f70 (&type->i_mutex_dir_key#3/1){+.+.}-{4:4}, at: __start=
_dirop fs/namei.c:2918 [inline]
 #1: ffff88803efb8f70 (&type->i_mutex_dir_key#3/1){+.+.}-{4:4}, at: start_d=
irop fs/namei.c:2942 [inline]
 #1: ffff88803efb8f70 (&type->i_mutex_dir_key#3/1){+.+.}-{4:4}, at: filenam=
e_create+0x200/0x370 fs/namei.c:5092
 #2: ffff888035beabb0 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0x1f=
bf/0x2200 fs/jbd2/transaction.c:444
 #3: ffff8880b8733f68 ((lock)#2){+.+.}-{3:3}, at: spin_lock include/linux/s=
pinlock_rt.h:45 [inline]
 #3: ffff8880b8733f68 ((lock)#2){+.+.}-{3:3}, at: __folio_batch_add_and_mov=
e+0x289/0xaa0 mm/folio.c:-1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 37 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT=
,(full)}=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 07/24/2026
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
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 17 Comm: pr/legacy Not tainted syzkaller #0 PREEMPT_{RT,=
(full)}=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 07/24/2026
RIP: 0010:io_serial_in+0x77/0xc0 drivers/tty/serial/8250/8250_port.c:401
Code: e8 4e 4c 67 fc 44 89 f9 d3 e3 49 83 ee 80 4c 89 f0 48 c1 e8 03 42 80 =
3c 20 00 74 08 4c 89 f7 e8 4f df d2 fc 41 03 1e 89 da ec <0f> b6 c0 5b 41 5=
c 41 5e 41 5f e9 0a 98 f7 05 cc 44 89 f9 80 e1 07
RSP: 0018:ffffc90000167a28 EFLAGS: 00000202
RAX: 1ffffffff33d0600 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: 0000000000000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff855ead90 R12: dffffc0000000000
R13: 0000000000000000 R14: ffffffff99e83140 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125bea000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc6db582c0 CR3: 0000000029cc2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_in drivers/tty/serial/8250/8250.h:128 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:150 [inline]
 wait_for_lsr+0x190/0x300 drivers/tty/serial/8250/8250_port.c:1982
 serial8250_fifo_wait_for_lsr_thre drivers/tty/serial/8250/8250_port.c:3235=
 [inline]
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3300 [in=
line]
 serial8250_console_write+0x113a/0x1b40 drivers/tty/serial/8250/8250_port.c=
:3385
 console_emit_next_record kernel/printk/printk.c:3163 [inline]
 console_flush_one_record+0x667/0xb90 kernel/printk/printk.c:3268
 legacy_kthread_func+0x1b6/0x250 kernel/printk/printk.c:3719
 kthread+0x38b/0x470 kernel/kthread.c:436
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
