Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849737C90B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223906; cv=none; b=ANtsNVyqVeBl+QKdaSVROlOJYf3dVceiiZWEbbJkAwU7VfOo0LVwf1K8hLRja7LivRBFC4OPAeyG7WhIZwqQOCvHXT4MbjV8YVLXKaVz1J3vxf4xdRRrBKpKy94HSPGqI9I0zUGA9scKpAalPC537H6MB9fStynJlYhJyYkfUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223906; c=relaxed/simple;
	bh=7M6JqBFmVYObMw81+ayTYfYKGAa+MbYsJELbdTc8VPc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=X2nrz5eqdK7/tY/dD/qasRxXV2w+Gi93srcxHM60mLpD3VBEm5CnjCi1ifWgaqBKTqvKQW19vIOWaJeADWoC896Co3Qz3ybPpGQoVF2pWyzBBmX23uDzUeieSRseujzX8Q8PfisX69OoGBh/3vICFF6sqvdZEAKtF8dVAbexJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28deb7ee3so6183692b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223902; x=1788828702;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr7/we1nt/7pqmTfAHVE2/HUt2f6+oxdTmORt1kXIG0=;
        b=tLnGrvCwQ5r+wxqd1xqlDvFUxuTaPgasLCEvtLB9xuxHnAfEYpLtDr6i+oqJuVtZbx
         r4OYB1+NaVNqd4e8b9oLqDMjgD1oMm+5LZnUOibxYYvwXzlrTYc6Jvt6jQFBeQq9nrV1
         Z/NtxA59L01vhYHif1GN3ko9PAdwPjTrNiIAh/y5tDQPTq+5s5FPnR5fSKuAUJUN4XwC
         lpBG/b2dKeipZ4NDQMfvpf1XqD5gnOaIgKb2yyBjHqBFAoY7WXLi5vfe+VqcwxHpC7jA
         7ja2VRCQaD2mJ5Zi3baA0XnZNjcsHPS8vHCcBNHbuGY6RkZ9GGWYWyfK6fzCqiiu6V1t
         KsZA==
X-Gm-Message-State: AFuF++kDWanDr/5VsGPxT4yN/74V/8Wuh86lGZYl5JgYn6dUbIsh3uLz
	UjTIBLaa5Y1Dh5WiYBhQttuLQiym30UJSvEmu404viMJBBLwPniOsIdpUiuJIBIQi9qXL7ELuWs
	AD2spJPIWMTOYNgx4v944K33u8LBrDydtDfNCK3gheqn52rsPV8iFgyJD11Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c2:b0:4b1:9f12:e2f6 with SMTP id
 5614622812f47-4b5b82e9198mr4746289b6e.19.1788223902483; Mon, 31 Aug 2026
 17:51:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:51:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a96219e.04428c52.29b18.0001.GAE@google.com>
Subject: [syzbot] WARNING in cfg80211_pernet_exit
From: syzbot <syzbot+74f338e09f1ef3ee6457@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    73ae59e97596 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=129c3979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2210e2522d526007
dashboard link: https://syzkaller.appspot.com/bug?extid=74f338e09f1ef3ee6457
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12008579580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+74f338e09f1ef3ee6457@syzkaller.appspotmail.com

------------[ cut here ]------------
cfg80211_switch_netns(rdev, &init_net)
WARNING: net/wireless/core.c:1871 at cfg80211_pernet_exit+0xd5/0x120 net/wireless/core.c:1871, CPU#1: kworker/u8:9/1160
Modules linked in:
CPU: 1 UID: 0 PID: 1160 Comm: kworker/u8:9 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: netns cleanup_net
RIP: 0010:cfg80211_pernet_exit+0xd5/0x120 net/wireless/core.c:1871
Code: e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 b4 ef 0e f7 4d 8b 36 49 81 fe 20 10 4a 90 74 12 e8 03 3d 9f f6 eb 85 e8 fc 3c 9f f6 90 <0f> 0b 90 eb cc e8 f1 3c 9f f6 eb 05 e8 ea 3c 9f f6 5b 41 5c 41 5e
RSP: 0018:ffffc900057a78f0 EFLAGS: 00010293
RAX: ffffffff8b287154 RBX: ffff88807ba72780 RCX: ffff8880213e8000
RDX: 0000000000000000 RSI: 00000000ffffffef RDI: 0000000000000000
RBP: 00000000ffffffef R08: ffffffff9024cc67 R09: 0000000000000000
R10: fffff52000af4eb0 R11: fffffbfff204998d R12: dffffc0000000000
R13: ffffffff904a1080 R14: ffff888144ed0008 R15: ffff888144ed0e20
FS:  0000000000000000(0000) GS:ffff888124de6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005642de0a8a70 CR3: 000000007a40c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x43d/0x8d0 net/core/net_namespace.c:253
 cleanup_net+0x572/0x810 net/core/net_namespace.c:706
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3470
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3551
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
