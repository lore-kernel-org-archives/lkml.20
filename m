Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD68233958
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430492; cv=none; b=N7SXAlMk5MsItdywfwZxNxnSqVGD1W4efd5k3XJPF1/BaL1c9tJMcwoBuauCuOVyZbJOPVRS6dXsUj7rXDqsd6bB3iyJjX6UhZpDzIZ8nVdQ41jKLNqXxk1vUF5ynfvBWLb0DIEyu6iZiOr4vEKs5FVFgg7+ph2TakCT5hzSRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430492; c=relaxed/simple;
	bh=ndPHPcuNAgnFgwMbNlk2cpQ1dQPCvu0Zv4bqAH2RVuQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=avlBZNukD6Kv7v0vFZCHKd5n5A61wIlUyMpdlpHbUPuTdqrkEFWAqfUUBOR6h27zckUbjp5kSBFqIMUg9qRyfKSOiPhWY9OKQiE+TFKKHPEa/Gvm9Ygj77cFalatOpBGNGR2ZMUgYOxloeQ9wnAkiBOLUk8Y7q7VOtmYuZi24tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-4b3759b7ff0so2290358b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789430490; x=1790035290;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42pyn03/Is9WXS70Xy6ArOrkBnr87wlyvpkJlNs0NYA=;
        b=AOYzFvV+T4ryBcBHCU2FPYo6doWWqhhYVUDB6ej5rlhd8FUvBfO0ZZM8err0ZWE92G
         5Y2NJhi1MV0SDQiik+qesfXv7BiE3PC04/H0AkQElWGtEmuZPjoFYBfz2hXnOT7W3OSP
         zXaCZd2I1qRzED6wCkBTU3ercG3+Ke31xCybamG/iwJlxRBl68lBQOrP2bNvX1PHD5he
         xjSPy3kLJBpmXoAZsSF1JJZa+agiEe6964jCf84xM0mJ5D9GStNA71aCxjs0MYYdlE1M
         mmPrnIBMC9d+RcokbUdoRHSCollc7/KRQiz647dj1qR8gvjU91k26zq5UvT1DIVtUWg1
         U6sA==
X-Forwarded-Encrypted: i=1; AKwUvBwFh88co9Tgn3HhS6nIPuEiJlbF3pC4bgLKIqS4Us4MthgaxgpDBu7dotd1+o+5BbIReAk7N3uoQhDX40M=@vger.kernel.org
X-Gm-Message-State: AFuF++nX2wa5dELr1hy2qkeAmCIXWquN+Wp+0z64/EA4N9SN514K+w3e
	D7h4edvbke3pKHLi0H79pBHbBGKZlNYAlX/38yY/jN11QWKacBf9g06+J5kWCn2av6EI7+fzaBe
	iIIFDuZPBdZH25mJcZca8zFmw4WXRSEsQxIPn0Zx/xRo6sXZTJw76zJXnh/0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f6a:b0:4c2:c244:72f9 with SMTP id
 5614622812f47-4c7b52a80dfmr3904791b6e.24.1789430489924; Mon, 14 Sep 2026
 17:01:29 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:01:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa88ad9.4c28b7d0.c1bba.0024.GAE@google.com>
Subject: [syzbot] [kernel?] upstream test error: WARNING in rcu_tasks_verify_work_fn
From: syzbot <syzbot+9d7ab3bc11055d9740f5@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08df884136f1 Merge tag 'thermal-7.3-rc3' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15d8679e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=9d7ab3bc11055d9740f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/08145c70959e/disk-08df8841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5db70c770722/vmlinux-08df8841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ec39950e39cb/bzImage-08df8841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d7ab3bc11055d9740f5@syzkaller.appspotmail.com

call_rcu_tasks() has failed boot-time tests.
rcu_tasks: RTGS_WAIT_SCAN_HOLDOUTS(6) since 24 g:5 i:0 kCuUP l:25 
------------[ cut here ]------------
ret < 0
WARNING: kernel/rcu/tasks.h:1541 at rcu_tasks_verify_self_tests kernel/rcu/tasks.h:1541 [inline], CPU#1: kworker/1:2/56
WARNING: kernel/rcu/tasks.h:1541 at rcu_tasks_verify_work_fn+0x1b6/0x270 kernel/rcu/tasks.h:1553, CPU#1: kworker/1:2/56
Modules linked in:
CPU: 1 UID: 0 PID: 56 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events rcu_tasks_verify_work_fn
RIP: 0010:rcu_tasks_verify_self_tests kernel/rcu/tasks.h:1541 [inline]
RIP: 0010:rcu_tasks_verify_work_fn+0x1b6/0x270 kernel/rcu/tasks.h:1553
Code: 80 3c 10 00 0f 85 b5 00 00 00 48 8b 35 9b 91 7d 0c b9 64 00 00 00 bf 08 00 00 00 48 c7 c2 a0 8a 99 9b e8 ad 6c e2 ff eb 97 90 <0f> 0b 90 eb 91 48 89 df e8 7d 82 8f 00 e9 69 ff ff ff 48 89 df e8
RSP: 0000:ffffc9000110fbb0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffffff8edeb8a8 RCX: 0000000000000000
RDX: 1ffffffff1dbd715 RSI: ffffffff81e97409 RDI: fffff52000221f49
RBP: 1ffff92000221f76 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: 0000000000000bb8
R13: 00000000ffffffff R14: 0000000000000001 R15: ffffffff8edeb8a8
FS:  0000000000000000(0000) GS:ffff888123c60000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000eb96000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
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
