Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3154707A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791423965; cv=none; b=LDhKkcojDbpZIz7wkLYH9hTTWGQ7JtWGnlmC1M+ZywmTDEq2yIP1nSetNSrc4UoE/HjU7s9Wn4w+RuXlLVXLfs96L99D8YpEpw3pr8Ng8QDXNIzKkPaE6ang7sMOu51L1bod38vvq3osJI6STKxB1vPhsOjHdWHUdO9Aek1J2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791423965; c=relaxed/simple;
	bh=bTtXvf2KRSgrf5tpg7YVaBhHXGeVtDTxAt6SKrQv36A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hqeZfmjhWz/HVsGFA9XpnFw+MPM/9t7X9oYpAFn69AaoFdIeTi08cUJrm8MxRF4qwnddYx1l09RuvpnyFBBbCJuoFvV5q4sfkM5ojC6sRtKcKbvrDtOQ4+rZ8ox46scHhkOZU8lS8IywpykztOtCWwFCaHzDvKRTGe/ISi0lQbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so6146360b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791423963; x=1792028763;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hIUFZxgA6EkPYz6CodENQgGndWuvAEFGBLXxg6PC5Aw=;
        b=pQL2ZtufBUvJZvBn49OnzOfrGcwfw/1ZWymumRoy/qXJVL1br1YhqJcMYCbPoHsIxB
         2CPIPtZs7n4YLpWSSGaa+bVWZOF9FxERprj+9Dk2NbGN4fpM2ta+8fNnbPaOw5sQB2QB
         2G/Cz8EfHBFk5hyhHhUJZcc0/a44vZRbINUb4ig1DUBCdO+MffEFJ7nsYxLEJ0xgKnZB
         Eq6H2nsYy1umbaGPfJUi/Qeg/2MBkrijuVprYEvQMS27iTwdPSYZcEgHFGdRE2FQpzlb
         oH6+1xIIVxG+oIpb73l5wRLERmMOl8w3AinwElxcopZUNepHD1FizxQKkmJJ8fDQ7cIb
         +pSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5nrfi66UL0O40c2iTRXO6gb0UFdO9Hsnm2MXglFUeM80h0h0+mMPfryiw6NTrJleZvOfFjuTK2+RCKyI=@vger.kernel.org
X-Gm-Message-State: AFuF++netNl8YHctpsaR172Sh1KrAXD7E2nlLfiobYVVgeYuxkcIZ8i3
	n1jGtS0ouCcGBf1US4Acmp56hXvgSHunKPxg7TsQXeRjSosHgP2LuAQpyJqqrnGPDOHuNQgNGmM
	K45eTCHdWku7z4YItEUOyECg0wQ+s/Fm7mio6QQBVthd11zU7okOkn7AJtmc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f05:b0:4f4:550a:3a86 with SMTP id
 5614622812f47-4fc4759d099mr3217483b6e.53.1791423962887; Wed, 07 Oct 2026
 18:46:02 -0700 (PDT)
Date: Wed, 07 Oct 2026 18:46:02 -0700
In-Reply-To: <20261008011158.15451-1-emmaonana18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac6f5da.a36481ec.1ba24c.0004.GAE@google.com>
Subject: Re: [syzbot] [net?] INFO: task hung in genl_rcv_msg (5)
From: syzbot <syzbot+2ad5f42cd6ca88f0107c@syzkaller.appspotmail.com>
To: emmaonana18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in addrconf_dad_work

INFO: task kworker/u8:11:2996 blocked for more than 151 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:11   state:D stack:25448 pid:2996  tgid:2996  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_dad_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 addrconf_dad_work+0x116/0x15c0 net/ipv6/addrconf.c:4230
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task syz-executor:6240 blocked for more than 151 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:21680 pid:6240  tgid:6240  ppid:6237   task_flags:0x400140 flags:0x00080000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 inet_rtm_newaddr+0x470/0x19f0 net/ipv4/devinet.c:978
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7137
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2575
 netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1364
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2281
 __do_sys_sendto net/socket.c:2288 [inline]
 __se_sys_sendto net/socket.c:2284 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2284
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f23f4f5e98e
RSP: 002b:00007fff58445c28 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 000055555b5bd500 RCX: 00007f23f4f5e98e
RDX: 0000000000000028 RSI: 00007f23f5d54670 RDI: 0000000000000003


Tested on:

commit:         7b63ef2d Merge tag 'for-7.3-rc6-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109df835580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e5acac5c98285f
dashboard link: https://syzkaller.appspot.com/bug?extid=2ad5f42cd6ca88f0107c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1531c00d580000

