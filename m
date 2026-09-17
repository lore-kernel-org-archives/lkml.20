Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58A447805
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627745; cv=none; b=GlNr48VmyQGzH7SXsVWxfNY6h3wcTTR8c9pRGL1u0EmE3Ii4WPkM0PVZ9ugUa919TNzj0umKRV/vFvdehHnRpoVonCkkDIWBXSYTFTzqPhbyweABFkngPrufIXvZgoivyJ5JR2WJ0sn6arXoL7DrrQAj4HP3IEiRRQ5gp11oCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627745; c=relaxed/simple;
	bh=uLP7EXQwdqW1Wf3X8HQiEkF/eLPer5ndJSlhzhjcnEI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uyoNzoBhnrYv7MhTAqburG8gFOnJ6iBD3YdtTKQ9J1iFeEfNts9HpIcojOZ+Df5WgbbVvkHKtyjiLQxxmHw3FqseQ/C25VgP4zsU+2c8Mqw2/KT4s2z94SBOj7K42K/RWdlTSQgFAGFjS+JupzkzOWCFNizSxdl0/jT47pcAKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cbf700ddccso183557b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627742; x=1790232542;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrjWaV4YmLkNWDi0qJu8YfAg3wjnBV6El9eP+RYwtSc=;
        b=yLUbnyyTa+DiAUC2amMcBb6sKJ7qBNVFhhmsq8LdJ28dLtxEwjBV1hQBChm+iehuDr
         MCyhAFVGF+up0KRbBxNFlwudR8ZtUtKhrsSN5MQKfET52E0sbG8Tt0eQRO+TzpJASmfM
         XX+wQmjwgpsLJPBGoJqGSYM7awW0w/HPOFTWo75VA0OHZwyGrUPDqMyx+6mNFuLl3mOh
         4+XECjibB/8AeROlsf4Fi3S5GHZo6xfNx5ENH9T9BGrG7KGomS68hVdspqTA2rQuc3I3
         wfXaFJq+MEbqTXCRkle47stLMOwiiERG6jV7mGEACt9EyQPFZPzaeeoO7zSJQri12gVE
         +oQg==
X-Forwarded-Encrypted: i=1; AKwUvBztULNtt5Y5Y1curk1EKB5JM/MzEjLJ+DBJZ1ICYKYkWYvb759dCBrqkyqSae83f9IaGrqOgq8dDFgtrFs=@vger.kernel.org
X-Gm-Message-State: AFuF++nq84q7dPrAqb/8Mgx0hCqc0rSaN/x3pSJFSsQMg+qYbchVRH4a
	VuMEqSa82BclJG4YkcW9rjD4lGkyyWioe8uud19pTWaz39dOLQdwJKbw8G3SsZnkLNktIsx7MUC
	8Z1dn/9UX1vgy0nFJ+m185/UlvqGrd9OByEqiYrF3050s3MBsB1rnCp9/lwQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8183:b0:6c2:21ab:ec92 with SMTP id
 006d021491bc7-6c7d1fc9f2amr5106163eaf.30.1789627742459; Wed, 16 Sep 2026
 23:49:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:49:02 -0700
In-Reply-To: <6aab45f1.70721e1c.396df2.be74SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab8d5e.71f81b7d.278072.0018.GAE@google.com>
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

INFO: task kworker/u8:11:3317 blocked for more than 149 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:11   state:D stack:23784 pid:3317  tgid:3317  ppid:2      t=
ask_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_dad_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5526 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7276
 __schedule_loop kernel/sched/core.c:7353 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7368
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7425
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

Showing all locks held in the system:
locks held by kthreadd/2: 1, last CPU#1:
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/0:0/9: 4, on CPU#0:
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
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
 #2: ffff88807ee51440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff8880296de640 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632
locks held by kworker/0:1/10: 2, last CPU#0:
 #0: ffff88806f171d40 ((wq_completion)wg-crypt-wg0#3){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88806f171d40 ((wq_completion)wg-crypt-wg0#3){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88806f171d40 ((wq_completion)wg-crypt-wg0#3){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88806f171d40 ((wq_completion)wg-crypt-wg0#3){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000f7c40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&peer->transmit_packet_work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/u8:0/12: 3, last CPU#0:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000117c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000117c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000117c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000117c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880580f07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880580f07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/1:0/25: 3, last CPU#1:
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88806f172140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
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
 #2: ffff8880296de640 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/1:1/30: 2, last CPU#1:
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000a57c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000a57c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by khungtaskd/32: 1, last CPU#1:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks=
+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:2/43: 4, last CPU#1:
 #0: ffff88807cc09940 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807cc09940 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807cc09940 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807cc09940 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000b37c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000b37c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000b37c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000b37c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
 #2: ffff888032a25440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff8880296d8d18 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/u8:3/50: 3, last CPU#0:
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
 #2: ffff88807bd00258 (&devlink->lock_key#7){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:5/60: 2, last CPU#0:
 #0: ffff8880331c4140 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880331c4140 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880331c4140 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880331c4140 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000201fc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000201fc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/0:2/89: 3, last CPU#0:
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880718fd140 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000208fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000208fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000208fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000208fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807bef5c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/u8:6/447: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002f0fc40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002f0fc40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002f0fc40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002f0fc40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880582507a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880582507a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/u8:7/1012: 3, last CPU#0:


Tested on:

commit:         7bc21b74 selftests: net: gro: fix OOB access when unde..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1153b925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D95af895ed08a9be=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc92af8613ad38696f=
f09
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D14b6dbf95800=
00

