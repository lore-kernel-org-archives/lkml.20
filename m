Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058E3BCD37
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335021; cv=none; b=UhlDqWL7C3ZOjsJX/Ap4JSPJePy/C2CH+NarUXo3foVtbPyqmCSqQ7DV4x7LIx9AfDcdkHwnSDguZOHP/jnUP346sigG1/wxRO5FBbuNIC0k/2fRvP8ji22b5hxqaNO5HLIWfwVeLQBANSPzWR7nWTe7LMTbsjyxjdZ9Gdgjibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335021; c=relaxed/simple;
	bh=RleU7cNN1wOfOHEFXMjowd8IIs6GlYKSm1VisDWm+6U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UlhXNXZUsnH4b3pBEim2XWaMYKJgbTMV78IVT2HS+xgQ0Vv57YyIKur8xQ1buR7cAzLFn6/huXLA3SPvs/GV1h7y0o5ob45tRhveKHEBWQjMAYML/R1d7bDNp0Xiqyjh/fO9gPzzLegxaExo0t7Xj4isGPakW3OVvmtUIcXanLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6b148096e48so128265eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335019; x=1788939819;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Fyr7GjnemiBK6OzWbgukemJrSOlrcphd1h+NIeU+Ak=;
        b=CLcUw3c5RjshIbOgHCORrUiN4wlwdpEpUAkUpTeIp+WVTnHLJrb7+kNF+hpx3bIzfV
         Aroxyft3RWWMYiXL8s1tgNusoc8Gwy/Cdgt2/t4TzP9RszEQd+M2N2kUVu3boaSS0zIt
         /PB3qumiA9pokYf/uBLkEdJBG7cIXAUEp+xxRFCIUnJsduKjlvuVa6IGblDHUiAbxquO
         5c3+vogbj/YlTbHjrCG/KX4msqN0YFBjWDWjsir+cu4cfrj9kU2MkUloLcxmbibXe+ru
         6lBnmIoWGpdRQux3edObimec4kMLFNKD/R9pStekuFTN1M4eLssRyGlXGWwEu4tf4h7e
         PpIA==
X-Forwarded-Encrypted: i=1; AHgh+Roq0CR2M8dJgzjcq/iPk7pHqv42QzeMJauGYCW7Uqztl1Cwr9vKMPZPAzB/00uFi9i+VOvWD9WJO6I6+lA=@vger.kernel.org
X-Gm-Message-State: AFuF++m3n3dsiYfodq9jWkMoZcM4vuk63M3Wz6298bcwp4sjkrrQqMPz
	qCEzXhCu1EWFK198iGSrd8TX04nC8TDsmFcQOofM+hRj5J1WiYEfKWfuqbVn9EKjTdilXlAkE1w
	+tVfHI2EgB+w6jrSHiqtpM3YO1Hfd8dTyHdo63KH1R1Rni7xMM5XZpAnE6N0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168f:b0:6b1:9f9d:79f3 with SMTP id
 006d021491bc7-6b47e7beac8mr2231224eaf.17.1788335018735; Wed, 02 Sep 2026
 00:43:38 -0700 (PDT)
Date: Wed, 02 Sep 2026 00:43:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a97d3aa.e163c37b.143a1.0007.GAE@google.com>
Subject: [syzbot] [openvswitch?] INFO: task hung in ovs_dp_masks_rebalance (8)
From: syzbot <syzbot+75ce0a9129024fa8cbf6@syzkaller.appspotmail.com>
To: aconole@redhat.com, davem@davemloft.net, dev@openvswitch.org, 
	echaudro@redhat.com, edumazet@google.com, horms@kernel.org, 
	i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a23cbb05744b Merge tag 'timers-urgent-2026-08-30' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1107a379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=75ce0a9129024fa8cbf6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eed599d932fb/disk-a23cbb05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/74e8c268c325/vmlinux-a23cbb05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aa91aebf1baf/bzImage-a23cbb05.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+75ce0a9129024fa8cbf6@syzkaller.appspotmail.com

INFO: task kworker/0:0:9 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:0     state:D stack:22128 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events ovs_dp_masks_rebalance
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 ovs_lock net/openvswitch/datapath.c:108 [inline]
 ovs_dp_masks_rebalance+0x2f/0xe0 net/openvswitch/datapath.c:2602
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/u8:1:13 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:1    state:D stack:22376 pid:13    tgid:13    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_verify_work
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
 addrconf_verify_work+0x19/0x30 net/ipv6/addrconf.c:4770
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/u8:2:27 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:2    state:D stack:23808 pid:27    tgid:27    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: netns cleanup_net
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 ops_exit_rtnl_list net/core/net_namespace.c:173 [inline]
 ops_undo_list+0x28e/0x8d0 net/core/net_namespace.c:249
 cleanup_net+0x572/0x810 net/core/net_namespace.c:706
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/1:1:31 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:22232 pid:31    tgid:31    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events ovs_dp_masks_rebalance
Call Trace:


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
