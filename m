Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965083E40F0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620912; cv=none; b=eulg6tlSVL77AI+O4uwFpjFsSVtqEkiQPr6CqJPKGipi0nVMYWqgxc4IatnDvyQp5NzBeI8VejeI+G7T9YsA+TZh2s6Cn7tbqlT+Ta/w6D1Qkyms0OQQlDPN8NGkzxf6E6LYZpSxuxuYQ8urZza7TuIpHGyvKeZ7rcYCFgXsrw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620912; c=relaxed/simple;
	bh=oLJ3+GMciFGy01arKPOwGs26XvFdh7O7y454GL1ksvk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MuKVFIQwUsfSt/EXCBf+iV7WVp0Dm0KmwiN9uuiWsvawkc9RsYCPvVB+hMHYq8z9bNOPG4hSY9mZAJ/QrwSTnUAyRfWSI+A/4eA2s6zPFMwo+Y/RcsaCLoV0cRTGZQZNZn7pzXR3JffBUQvVFsW50FnpMlcLQrzmtR0vKKFcBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c324a0c0faso565002eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620907; x=1790225707;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYQo6MdE1iEdlbsn+abQ8Kq6kNSI3t/zeUZfMmdnIp8=;
        b=1nPXmF4VmaMS8e06zRuVrc+HdgVvh+u7jYVb+ZC4WKjKw8Xl7iSnjz2WjYRuQnYciA
         GBP8m898k63bsJYM9D8a+lxDVG04kvtVXhwZZpbdaQ4smXqtbQbSpL/mzf8TFKpeW897
         nOt+Ad9KDA09JQeu6kJpYHXG5eNDk3OJCm13nosB4J8VbUJe7GsQ1Qg5q32PEKml7fzJ
         ueRVWvnWRyVXRL9u12RMFMprO5O9Tq+RuNqf5NYbjfpks5l8lEY1m9ynYVTVExlbshmq
         nZdSISHiaRgjUFzbZ8Z3bsPWP2mRKaKN9f6bPp3XNr5FznxgRXLrBbDeKAULuWlO5p2s
         eKug==
X-Forwarded-Encrypted: i=1; AKwUvBwC7a2nzGLOqdWO85arXr4/aSXhaupZ90qmCx5nEt9F0lNA+IkQwNxI4UqqUH/opr6/v3OTs5Ivp7xAbPc=@vger.kernel.org
X-Gm-Message-State: AFuF++nkvbnGq8w5n/s5rias/CNytM5J4ns1YnhF/t6AWKoLX9UWGMUx
	Swa8S8UB8HaiK7FcYPos8uDo+sVdpAvZdpRkotWGYeOELZsvhAwAIZrp7/3mnPmbp8AEXHL0o3Y
	bdpD2Za+lMYfJGfZenIW9C2Jz8F3pveEL7ScKtkeOWPEF57d7TgGH3gNI6Qs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3098:b0:6c6:c098:ef02 with SMTP id
 006d021491bc7-6c7d38020f3mr5138847eaf.62.1789620907348; Wed, 16 Sep 2026
 21:55:07 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:55:07 -0700
In-Reply-To: <6aab40d0.e4eb6dfc.25e6ba.a960SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab72ab.71f81b7d.278072.0013.GAE@google.com>
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

INFO: task kworker/u8:3:50 blocked for more than 150 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:3    state:D stack:21800 pid:50    tgid:50    ppid:2      t=
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
locks held by kworker/0:0/9: 4, last CPU#0:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acq=
uire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_loc=
k include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_=
work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_sche=
duled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000e7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880330bb250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_wor=
k+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
 #3: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #3: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/0:1/10: 3, on CPU#0:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900000f7c40 ((reg_check_chans).work){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((reg_check_chans).work){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((reg_check_chans).work){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900000f7c40 ((reg_check_chans).work){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: reg_check_chans_work+0x=
ac/0x1110 net/wireless/reg.c:2469
locks held by kworker/u8:0/12: 3, last CPU#1:
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
 #2: ffff888059d707a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff888059d707a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/u8:1/13: 4, on CPU#1:
 #0: ffff88805d4a5140 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88805d4a5140 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88805d4a5140 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88805d4a5140 ((wq_completion)wg-kex-wg1#5){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000127c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000127c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000127c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000127c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
 #2: ffff88805d5e9440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff88807f3334b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/1:0/25: 4, on CPU#1:
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
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
 #2: ffff8880586f5440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff888076585270 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632
locks held by khungtaskd/32: 1, last CPU#1:
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks=
+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:2/33: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000a97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000a97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000a97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000a97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880595c07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880595c07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/u8:3/50: 3, on CPU#0:
 #0: ffff8880320b8940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_l=
ock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880320b8940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_r=
ead_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880320b8940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880320b8940 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000bb7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000bb7c40 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0=
:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #2: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x116=
/0x15c0 net/ipv6/addrconf.c:4235
locks held by kworker/u9:0/52: 5, on CPU#1:
 #0: ffff888031ff1140 ((wq_completion)hci1){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff888031ff1140 ((wq_completion)hci1){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff888031ff1140 ((wq_completion)hci1){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff888031ff1140 ((wq_completion)hci1){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90000bd7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807de30ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff88807de300b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5993
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_connect_cfm i=
nclude/net/bluetooth/hci_core.h:2163 [inline]
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_conn_failed+0=
x17f/0x370 net/bluetooth/hci_conn.c:1421
locks held by kworker/u8:4/59: 4, last CPU#1:
 #0: ffff88805d4a5940 ((wq_completion)wg-kex-wg0#5){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88805d4a5940 ((wq_completion)wg-kex-wg0#5){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88805d4a5940 ((wq_completion)wg-kex-wg0#5){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88805d4a5940 ((wq_completion)wg-kex-wg0#5){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000200fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000200fc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
 #2: ffff88805d5ed440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff88807f333ea0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/u8:5/60: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc9000202fc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff888029b6a258 (&devlink->lock_key#4){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:6/408: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900036afc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc900036afc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc900036afc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc900036afc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff888076472258 (&devlink->lock_key#7){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/0:2/943: 3, on CPU#0:
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90004f5fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90004f5fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90004f5fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90004f5fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807f334888 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/u8:7/1114: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005617c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005617c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005617c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005617c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888059c507a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff888059c507a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/u8:8/1146: 2, last CPU#1:
 #0: ffff888022ab5140 ((wq_completion)wg-kex-wg1#3){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888022ab5140 ((wq_completion)wg-kex-wg1#3){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888022ab5140 ((wq_completion)wg-kex-wg1#3){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888022ab5140 ((wq_completion)wg-kex-wg1#3){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005747c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005747c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005747c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005747c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
locks held by kworker/u8:9/1457: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90005bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90005bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90005bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90005bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880597a07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:6906 [inline]
 #2: ffff8880597a07a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x420 net/wireless/core.c:526
locks held by kworker/1:3/1816: 3, last CPU#1:
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88802b051140 ((wq_completion)wg-kex-wg0#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90006687c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90006687c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90006687c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90006687c40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807f334888 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/R-bat_e/3226: 4, last CPU#0:
 #0: ffff888032312940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888032312940 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888032312940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888032312940 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000e4d7c20 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000e4d7c20 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000e4d7c20 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000e4d7c20 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: local_lock_acquire i=
nclude/linux/local_lock_internal.h:46 [inline]
 #2: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: process_backlog+0x3d=
e/0x18b0 net/core/dev.c:6724
 #3: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: nf_hook include/linu=
x/netfilter.h:249 [inline]
 #3: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: NF_HOOK+0x9e/0x3c0 i=
nclude/linux/netfilter.h:323
locks held by kworker/u9:1/4931: 5, on CPU#1:
 #0: ffff88807f218140 ((wq_completion)hci0){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff88807f218140 ((wq_completion)hci0){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff88807f218140 ((wq_completion)hci0){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff88807f218140 ((wq_completion)hci0){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900071f7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900071f7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900071f7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900071f7c40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888031e24ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff888031e240b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5993
 #4: ffffffff8ed62c68 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_loc=
k kernel/rcu/tree_exp.h:311 [inline]
 #4: ffffffff8ed62c68 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rc=
u_expedited+0x2d0/0x770 kernel/rcu/tree_exp.h:966
locks held by jbd2/sda1-8/4944: 1, last CPU#1:
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by udevd/4982: 2, last CPU#1:
 #0: ffffffff8f4f0f78 (tomoyo_ss){.+.+}-{0:0}, at: srcu_lock_acquire includ=
e/linux/srcu.h:198 [inline]
 #0: ffffffff8f4f0f78 (tomoyo_ss){.+.+}-{0:0}, at: srcu_read_lock include/l=
inux/srcu.h:305 [inline]
 #0: ffffffff8f4f0f78 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_read_lock securit=
y/tomoyo/common.h:1112 [inline]
 #0: ffffffff8f4f0f78 (tomoyo_ss){.+.+}-{0:0}, at: tomoyo_path_perm+0x251/0=
x560 security/tomoyo/file.c:826
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/0:3/5348: 4, last CPU#0:
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900034efc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900034efc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc900034efc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900034efc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880587dd440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_response+0x14e/0x9f0 drivers/net/wireguard/noise.c:678
 #3: ffff8880765834b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_response+0x15f/0x9f0 drivers/net/wireguard/noise.c:679
locks held by crond/5355: 1, last CPU#1:
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by getty/5372: 2, on CPU#1:
 #0: ffff88803574c0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait=
+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_rea=
d+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/u9:2/5672: 7, on CPU#1:
 #0: ffff8880330f4140 ((wq_completion)hci3){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff8880330f4140 ((wq_completion)hci3){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff8880330f4140 ((wq_completion)hci3){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff8880330f4140 ((wq_completion)hci3){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003b1fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b1fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b1fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90003b1fc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88807e120ea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff88807e1200b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5993
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_connect_cfm i=
nclude/net/bluetooth/hci_core.h:2163 [inline]
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_conn_failed+0=
x17f/0x370 net/bluetooth/hci_conn.c:1421
 #5: ffff888029eab2f8 (&conn->lock#2){+.+.}-{4:4}, at: l2cap_conn_del+0x9f/=
0x550 net/bluetooth/l2cap_core.c:1816
 #6: ffffffff8ed62c68 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_loc=
k kernel/rcu/tree_exp.h:343 [inline]
 #6: ffffffff8ed62c68 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rc=
u_expedited+0x38d/0x770 kernel/rcu/tree_exp.h:966
locks held by kworker/0:4/5700: 2, last CPU#0:
 #0: ffff888025ba7140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888025ba7140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888025ba7140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff888025ba7140 ((wq_completion)wg-kex-wg1#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000400fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000400fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000400fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000400fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/1:4/5786: 2, last CPU#1:
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b069d40 ((wq_completion)events_power_efficient){+.+.}-{0:0}, =
at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000356fc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000356fc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000356fc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000356fc40 ((work_completion)(&(&tbl->gc_work)->work)){+.+.}-{0:=
0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by syz-executor/5978: 2, last CPU#1:
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1216 [inline]
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by syz-executor/6244: 2, last CPU#1:
 #0: ffff8880202d60e8 (&type->s_umount_key/1){+.+.}-{4:4}, at: alloc_super =
fs/super.c:365 [inline]
 #0: ffff8880202d60e8 (&type->s_umount_key/1){+.+.}-{4:4}, at: sget_fc+0x97=
c/0x1a40 fs/super.c:889
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by kworker/u9:3/6246: 5, on CPU#1:
 #0: ffff888029016140 ((wq_completion)hci2){+.+.}-{0:0}, at: rcu_lock_acqui=
re include/linux/rcupdate.h:309 [inline]
 #0: ffff888029016140 ((wq_completion)hci2){+.+.}-{0:0}, at: rcu_read_lock =
include/linux/rcupdate.h:849 [inline]
 #0: ffff888029016140 ((wq_completion)hci2){+.+.}-{0:0}, at: process_one_wo=
rk kernel/workqueue.c:3361 [inline]
 #0: ffff888029016140 ((wq_completion)hci2){+.+.}-{0:0}, at: process_schedu=
led_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900035ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900035ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900035ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900035ffc40 ((work_completion)(&hdev->cmd_sync_work)){+.+.}-{0:0}=
, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880727fcea0 (&hdev->req_lock){+.+.}-{4:4}, at: hci_cmd_sync_work+=
0x1cb/0x3f0 net/bluetooth/hci_sync.c:331
 #3: ffff8880727fc0b8 (&hdev->lock){+.+.}-{4:4}, at: hci_abort_conn_sync+0x=
a6f/0x1190 net/bluetooth/hci_sync.c:5993
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_connect_cfm i=
nclude/net/bluetooth/hci_core.h:2163 [inline]
 #4: ffffffff903d9080 (hci_cb_list_lock){+.+.}-{4:4}, at: hci_conn_failed+0=
x17f/0x370 net/bluetooth/hci_conn.c:1421
locks held by syz-executor/6253: 2, last CPU#1:
 #0: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #0: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: inet6_rtm_newaddr+0x667=
/0xe00 net/ipv6/addrconf.c:5068
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #1: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
locks held by syz-executor/6255: 2, last CPU#1:
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #0: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: page_ext_get+0x22/0x=
2e0 mm/page_ext.c:522
locks held by syz-executor/6258: 1, on CPU#1:
 #0: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #0: ffffffff90252520 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x470/=
0x19f0 net/ipv4/devinet.c:980
locks held by kworker/0:5/6484: 4, last CPU#0:
 #0: ffff88807de6d540 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807de6d540 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807de6d540 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807de6d540 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000366fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000366fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000366fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000366fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff88805d5e9440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff88807f3334b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632
locks held by kworker/0:6/6500: 2, last CPU#0:
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000364fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000364fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000364fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000364fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by kworker/0:8/6523: 3, last CPU#0:
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807f495540 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90002f2fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002f2fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002f2fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc90002f2fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff888076585270 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:822
locks held by kworker/1:5/6610: 2, last CPU#1:
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88807c399140 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000380fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000380fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000380fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000380fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
locks held by dhcpcd-run-hook/6615: 5, last CPU#1:
 #0: ffffffff8ee36330 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:=
1542 [inline]
 #0: ffffffff8ee36330 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm+0x10f/0x480 k=
ernel/fork.c:1595
 #1: ffff88807eef5038 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:562 [inline]
 #1: ffff88807eef5038 (&mm->mmap_lock){++++}-{4:4}, at: dup_mmap+0x195/0x1d=
c0 mm/mmap.c:1716
 #2: ffff88807ebf29f8 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_n=
ested include/linux/mmap_lock.h:552 [inline]
 #2: ffff88807ebf29f8 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x221/0x=
1dc0 mm/mmap.c:1723
 #3: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:198 [inline]
 #3: ffffffff8eeac370 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:305
 #4: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1216 [inline]
 #4: ffffffff8ed5c8a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by kworker/u8:10/6628: 3, last CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc90003aefc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:30=
9 [inline]
 #1: ffffc90003aefc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [=
inline]
 #1: ffffc90003aefc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [in=
line]
 #1: ffffc90003aefc40 ((work_completion)(&(&nsim_dev->trap_data->trap_repor=
t_dw)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/=
workqueue.c:3479
 #2: ffff8880329bf258 (&devlink->lock_key#8){+.+.}-{4:4}, at: nsim_dev_trap=
_report_work+0x57/0xb40 drivers/net/netdevsim/dev.c:834
locks held by kworker/u8:11/6629: 4, on CPU#1:
 #0: ffff8880797f2140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880797f2140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880797f2140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880797f2140 ((wq_completion)wg-kex-wg2){+.+.}-{0:0}, at: process_=
scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc900038dfc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900038dfc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900038dfc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3361 [inline]
 #1: ffffc900038dfc40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:347=
9
 #2: ffff8880586f5440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff888076585270 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/1:6/6630: 4, on CPU#1:
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3361 [inline]
 #0: ffff8880734f9540 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #1: ffffc9000357fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_lock_ac=
quire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000357fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: rcu_read_lo=
ck include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000357fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_one=
_work kernel/workqueue.c:3361 [inline]
 #1: ffffc9000357fc40 ((work_completion)(&({ do { const void *__vpp_verify =
=3D (typeof((worker) + 0))((void *)0); (void)__vpp_verify; } while (0); ((t=
ypeof((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker)))))((uns=
igned long)((__typeof_unqual__(*((worker))) *)(( unsigned long)((worker))))=
 + (((__per_cpu_offset[(cpu)]))))); })->work)){+.+.}-{0:0}, at: process_sch=
eduled_works+0x97a/0x1630 kernel/workqueue.c:3479
 #2: ffff8880587dd440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_initiation+0x1a2/0x9b0 drivers/net/wireguard/noise.c:598
 #3: ffff8880765834b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_consume_initiation+0x59c/0x9b0 drivers/net/wireguard/noise.c:632

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(ful=
l)=20
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
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 3226 Comm: kworker/R-bat_e Not tainted syzkaller #0 PREE=
MPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 07/24/2026
Workqueue: bat_events batadv_tt_purge
RIP: 0010:deref_stack_reg+0x0/0x220 arch/x86/kernel/unwind_orc.c:418
Code: ff ff 48 89 4c 24 18 e8 6e b1 bf 00 48 8b 4c 24 18 e9 f2 fe ff ff 0f =
1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <55> 41 57 41 56 4=
1 55 41 54 53 48 83 ec 10 48 89 d3 49 89 f0 49 89
RSP: 0018:ffffc90000006f78 EFLAGS: 00000287
RAX: fffffffffffffff0 RBX: ffffffff91a21370 RCX: 0000000000000000
RDX: ffffc90000007068 RSI: ffffc900000079a0 RDI: ffffc90000007028
RBP: 1ffffffff234426e R08: ffffc900000079a0 R09: 0000000000000000
R10: ffffc90000007078 R11: fffff52000000e11 R12: dffffc0000000000
R13: ffffffff91a21371 R14: ffffc90000007028 R15: ffffc90000007070
FS:  0000000000000000(0000) GS:ffff888124cd1000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000025d148fb9fff CR3: 0000000075b4a000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 unwind_next_frame+0x19bd/0x2550 arch/x86/kernel/unwind_orc.c:-1
 arch_stack_walk+0x11b/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0xa9/0x100 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6626
 nft_synproxy_eval_v4+0x36a/0x4e0 net/netfilter/nft_synproxy.c:-1
 nft_synproxy_do_eval+0x335/0x550 net/netfilter/nft_synproxy.c:141
 expr_call_ops_eval net/netfilter/nf_tables_core.c:237 [inline]
 nft_do_chain+0x48d/0x1b10 net/netfilter/nf_tables_core.c:285
 nft_do_chain_inet+0x360/0x4b0 net/netfilter/nft_chain_filter.c:162
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_slow+0xc5/0x220 net/netfilter/core.c:619
 nf_hook include/linux/netfilter.h:280 [inline]
 NF_HOOK+0x21f/0x3c0 include/linux/netfilter.h:323
 NF_HOOK+0x336/0x3c0 include/linux/netfilter.h:325
 __netif_receive_skb_one_core net/core/dev.c:6264 [inline]
 __netif_receive_skb net/core/dev.c:6377 [inline]
 process_backlog+0xa6b/0x18b0 net/core/dev.c:6728
 __napi_poll+0xaa/0x330 net/core/dev.c:7787
 napi_poll net/core/dev.c:7850 [inline]
 net_rx_action+0x61d/0xf50 net/core/dev.c:8007
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 do_softirq+0x77/0xd0 kernel/softirq.c:546
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x140 kernel/softirq.c:473
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 batadv_tt_local_purge+0x2d4/0x370 net/batman-adv/translation-table.c:1628
 batadv_tt_purge+0x35/0xa40 net/batman-adv/translation-table.c:4098
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 rescuer_thread+0x7c5/0x10e0 kernel/workqueue.c:3703
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         7bc21b74 selftests: net: gro: fix OOB access when unde..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-ne=
xt.git main
console output: https://syzkaller.appspot.com/x/log.txt?x=3D138fdbf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D95af895ed08a9be=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc92af8613ad38696f=
f09
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D11ffe1155800=
00

