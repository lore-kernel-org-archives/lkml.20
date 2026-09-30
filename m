Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322E3644C6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760641; cv=none; b=idCAA2X21KVIJWAvnNQo8llH+kDwO80JPvC2Qeg2FX9kyWhQfvRMzgzKXJ/kypCLWLzH/pqBzyy6laJ59g5RBF4DilEjOA05MhqYeZuv9Oobd4oM3U2xrpmA3JwYIwFHXqrr6omgdJLfXvfsQYGXJ8wxMInhDNWPUB0aJr2sXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760641; c=relaxed/simple;
	bh=B6KQ7Q761wXAxkqO4A4KBxGTbhjvP4/JfP+EH6M3vPk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IvC5qqAeEoURnnxkG2x9cTn+e/k2MY5cRW3+Ieztb0I6oW4Xuk+735V/vqTcCrwrdV5zRg19szjifU1BBiZwYbKKC2Pv6RKRokVNwpWXPfeh2q5llGcKCaO/9gopUM+LwvEeUDaE6lDDQWAJDy4IW7SGxdLy8aspQyrRpD03XGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4d2f0f77124so6540530b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760638; x=1791365438;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c432cRXYhw32OvJykm5cpBGmNcdCuznarNCnC6pKqWs=;
        b=blU5n6/4kYCgCOaM0StP4SkVcZTYPG+5C3zMuKTvyqaGYVvqEcFtNqT16vj0VjRtl6
         GRnC+hpvO1F5lWi6Wm2Fw/xMqXciFcrZBHqHYnh5WhPTaeubfE/kFOFCfxjU9lPW0JKj
         Qn1H7b8VSORsQy0gUUbV4wyYm74wN84OBvTBZlbE0u0BhajgoUYVuodAOufnmuxick0u
         xXGqvwo8KMHf59/xpCj6j3Jrq9N+jw9ux1KAMv4QWsFKfcBbmsTmatAb5uY+h98tnyvE
         mTjAlnPVR6zHeaFBwhgqEqHb7RkohtlzS8uMrIVyki6r1QI/Ajq5M2yzWa/NSUQKubWe
         i9Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxx1OZDspvCksSwMb0kTSYOH/AwNYUjp8ctTTxZv0QtXGw1v2acrne6WliQGN5XiJ2Erhs5yp9/rSR1kCg=@vger.kernel.org
X-Gm-Message-State: AFuF++nQrK7nGVVr1Uw60iq+YEquQy8oN8ho/GUQwzexmw0XpX22hQc4
	R2P27ibjETwgEO/pEDaE8s/hXHLIvp+L7RjyTABAA9kZCRd35qwXrcORYTsyWK1kt4MTQKJ/MXc
	7HaPy1XvpRZJxCMmg+SNfLN/DcTtjDTekg/eC8NWzOSxaMMSGBiWdnNVha/o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6902:b0:4c2:13aa:fa13 with SMTP id
 5614622812f47-4f1b0d0ce54mr927548b6e.1.1790760638380; Wed, 30 Sep 2026
 02:30:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 02:30:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abcd6be.80e1c6cc.1e8e5f.0086.GAE@google.com>
Subject: [syzbot] [tipc?] INFO: task hung in tipc_net_finalize_work
From: syzbot <syzbot+920b21f1eb9357bab704@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jmaloy@redhat.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	tipc-discussion@lists.sourceforge.net, tung.quang.nguyen@est.tech
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c4e9f74da438 Merge tag 'v7.3-p5' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16609405580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=920b21f1eb9357bab704
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2d84978a00bd/disk-c4e9f74d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f8ae6a5a134b/vmlinux-c4e9f74d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a81070fe6b69/bzImage-c4e9f74d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+920b21f1eb9357bab704@syzkaller.appspotmail.com

INFO: task kworker/1:2:1218 blocked for more than 145 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:2     state:D stack:21560 pid:1218  tgid:1218  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events tipc_net_finalize_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 tipc_net_finalize_work+0x1e/0x90 net/tipc/net.c:148
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/u8:15:6369 blocked for more than 145 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:15   state:D stack:23624 pid:6369  tgid:6369  ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: events_unbound linkwatch_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x17db/0x58f0 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7376
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7433
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 linkwatch_event+0xe/0x60 net/core/link_watch.c:313
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3479
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3560
 kthread+0x38b/0x480 kernel/kthread.c:436


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
