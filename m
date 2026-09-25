Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0662C49EC78
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347357; cv=none; b=DJymXWxXNSheqpJeHvoK81b79LlZsA+0ottIXnRLjZPsLofGMl58hXrFt/2nKYDOMUrH0aBcZz9/U5Xu9oi3ETGLyuZMVomNk8qshnhUDUvOS525EutaDgPN99JqL5Kp41gdMj0tWmJG0r1UWe7ra8NZVWlmt+Y6zPXWcD7wOOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347357; c=relaxed/simple;
	bh=mJKMhoCyAtR0UxOKPvYGtqYhysF33pibPFssqwuToEc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=L3bTlS/juhjc+pfhA48yGyfMTp2YgMDeTSCxMPEc4Id4wV/DmUbCh2dmMfAcVpx82BiFhOrdwGBcgWRC3zlawE0v5E6hFQpbXjou7rby87CCRqzRLpt1u7eljN7//99GVWsti9z8N3NMrs7yfsWyr46JzS4UcwjXGJLLVnx/Z6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-466d41a1d9aso1182556fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347350; x=1790952150;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3plWnNTkUlR3THa6vSylFRM5p3cT0mVJsll5kMqLqrM=;
        b=K8vSwX9qn/pYvqPSDOmcLxi9lFpDq7MmBfshDgYYM9sO0zEqgwtn6tpCsWHL/TL1Q8
         FvG7mTkcyubNG7Td+nGz3r2Pk36D5KQQr8nakG5Zo2b4nMM1MPepx5jEWpWMmEx+pkVS
         gSatHBDM6sG+hMR6bZiwgA8qr0zOxgvG3C4vn3TmTyViUdpoY7pj1HAj/HIZv8tYxQgr
         IzQitOf3w6u5JUKoroTZLvbM+e0lp2thrE2PJh9HxDWYOKrsOU8hRUl5gWTiLVEU1+Aq
         rfV0DP84sXis1usLkhRCA3HiymRQ8un3g/ToLPOv5QWxnaBJjxNMyvI1Kwl3084Zwq74
         WajQ==
X-Gm-Message-State: AFuF++mH94iba3t/2P2m0WHj3yOmJNIvC7VgtUIuXS0qknAMZ2CGxvFw
	kyZPxKAttlsvwhlt/sya6OLPC1auIRElWcq/JTfrraFsFM3KBmElp1cXGipxl17WcLpQhQQbDZj
	kvzivhwGf2Uz/RzYaXov+20HpDRWaLuRQN0h0wLO7pI3lhe6rZ1D0Cu6Wtqw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1817:b0:4d6:92b3:c1b6 with SMTP id
 5614622812f47-4d73124cec1mr7631579b6e.57.1790347350434; Fri, 25 Sep 2026
 07:42:30 -0700 (PDT)
Date: Fri, 25 Sep 2026 07:42:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab68856.80e1c6cc.1e8e5f.0037.GAE@google.com>
Subject: [syzbot] KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f49a343b305c Merge tag 'pinctrl-v7.3-2' of git://git.kerne..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1244d205580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=181b8b439f5207144b16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10737c5e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event

write to 0xffff88811afe9be0 of 4 bytes by task 3651 on cpu 0:
 inotify_update_existing_watch fs/notify/inotify/inotify_user.c:558 [inline]
 inotify_update_watch fs/notify/inotify/inotify_user.c:632 [inline]
 __do_sys_inotify_add_watch fs/notify/inotify/inotify_user.c:769 [inline]
 __se_sys_inotify_add_watch+0x2ea/0x720 fs/notify/inotify/inotify_user.c:717
 __x64_sys_inotify_add_watch+0x43/0x50 fs/notify/inotify/inotify_user.c:717
 x64_sys_call+0xa19/0x2550 arch/x86/include/generated/asm/syscalls_64.h:255
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88811afe9be0 of 4 bytes by task 3653 on cpu 1:
 fsnotify_handle_inode_event+0x18a/0x230 fs/notify/fsnotify.c:272
 fsnotify_handle_event fs/notify/fsnotify.c:330 [inline]
 send_to_group fs/notify/fsnotify.c:378 [inline]
 fsnotify+0x16ae/0x1860 fs/notify/fsnotify.c:597
 __fsnotify_parent+0x2f8/0x3a0 fs/notify/fsnotify.c:241
 fsnotify_parent include/linux/fsnotify.h:96 [inline]
 fsnotify_path include/linux/fsnotify.h:113 [inline]
 fsnotify_file include/linux/fsnotify.h:127 [inline]
 fsnotify_close include/linux/fsnotify.h:461 [inline]
 __fput+0x1e2/0x630 fs/file_table.c:498
 fput_close_sync+0xad/0x190 fs/file_table.c:617
 __do_sys_close fs/open.c:1560 [inline]
 __se_sys_close fs/open.c:1545 [inline]
 __x64_sys_close+0x55/0xf0 fs/open.c:1545
 x64_sys_call+0x812/0x2550 arch/x86/include/generated/asm/syscalls_64.h:4
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x00002018 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 3653 Comm: syz-executor126 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
==================================================================


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
