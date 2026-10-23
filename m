Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790971;
	b=2cuXLH/1PPBW+xWKf3+ve0kU4XMfvhstYQsbAI1ntDu8JTCAzGg3YMjTuBCiT14v9Hdb
	 KfC9g7svWl0i21Vk6A2BPHfWwc4OG3bd5b1pD9wlXiolkIeVlEAxdy+tEovEB0APHRhHL
	 bhI/JHBFLxLoCOSC9KIEuBR0/aX4shA3RifWp2tqBJrYJQBTlpR/9LZlYIWOId1ii3KI+
	 trZvOswfBfcnZYYmotgUerRVcnBXvrL5CDenWKxAqY2y/Smut+rkkiv0p0zJyUW47V1Wk
	 Ab2V3M0WeCqvV4Jjo+F1SkQ+15WInBQKi934XDpdyvwORtsc+e60Bwu0Hr0pt8yFGTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790971;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=apw8BuHAbhdnuawi78sJ7rVN/a/VQw9Cpb8eaXE2L1I=;
	b=jFblUITk7crFqcI/r+m2CclZ/pJ0hpra1CZOg+jpOnVfWG9gNQv9QYvCNGTVj0YkTUdf
	 bbDGBXsmRES+lX24D9u3untyygOqY1J3/j4leeLNEfTguqYg+Y0AqyDVGVZwRXqjW2fwv
	 wVJ1Yb3429AujmrNukRcJIl5/I7yhr+vYGWtHmK5o0C3HYPIpHw7uLBaspIwHGNUpC0gW
	 A6Aw8dT8OIcWTbkt9SW9LTWHsuf3vTvsdxjUzle0FRpLENF5/E6UXWGEF7L/0DvyvmOn+
	 KrvU3etMBxKEwZyu9RpII5VXc3iSnxNH6qrJwhtG+tkWiwwCelAnPnX1Ye8kvTKsnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BDD606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BDD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so2331026b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790970; x=1793395770;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apw8BuHAbhdnuawi78sJ7rVN/a/VQw9Cpb8eaXE2L1I=;
        b=BIQNlgFIZDmiHPsgL9mgPx2+GdP2qbOA0FkdiMWZbT7Arp1lqa5b0Vj4kUeLbiA1HT
         1dopaZk/Rui6rmYEIANEkTcF+uXOTyeJjDdGbndal0nmVSOuyMlVQfqQUVHjuVt/B1G7
         J9xmplNBCePLT+bRqJFyr7QY8v1sRQOhMyhs1sIj70bMZrN1vsbyHwrcO6caIloPScTS
         ++VtyFGymnB5+rCavFh4tprmbH4QrQykEn6syyZU3+zMj11citRo7wZct+yHiPBwA94F
         WFYhh3kPK5xDYuDWLOGqdwvy7OEqznygwgJQGwsozEGFaOSn+AvAj1haowhUzJtj3nGe
         amAg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ2DA9EX6iwTZtA3iLvSMeiWNqXCfiiqxWHUs5ISM0m4T5chcC64OxcWFuJ8ovzk1JXkbwu0J/t3ypnC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTyRPP9IYOytCBfxW2SzgM4AD4fXIZhAdew4P4Xpqwviby3q/U
	kysAdZDjz59m5qPg5msS6EVNnoL+v+bEN9cZqcPrl30rsw/9Fkx5ARqGIoKPgd7JSUkxuljVHSt
	G0x68SW/xUO4Vvu5LnAv7YYvct6kMMJapjZcS0YQH3r/6yiUm1LFk4x9RzSU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:4d6:9153:295e with SMTP id
 5614622812f47-55c0038dbc7mr369158b6e.47.1792790970472; Fri, 23 Oct 2026
 14:29:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:29:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adbd1ba.5b36369a.12654e.000c.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING: bad unlock balance in ntfs_readdir
From: syzbot <syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3d229ce89862 Add linux-next specific files for 20261019
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16e52e7f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a028e57b630bb4be
dashboard link: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e61831580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1099cc95580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/412cf9c202de/disk-3d229ce8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e186f12d19de/vmlinux-3d229ce8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7fa13a836daa/bzImage-3d229ce8.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c9aad314cb9a/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com

ntfs3(loop0): Failed to load $Extend (-22).
ntfs3(loop0): Failed to initialize $Extend.
=====================================
WARNING: bad unlock balance detected!
syzkaller #0 Not tainted
-------------------------------------
syz-executor416/5625 is trying to release lock (&ni->ni_lock) at:
[<ffffffff833dfc48>] ni_unlock fs/ntfs3/ntfs_fs.h:1266 [inline]
[<ffffffff833dfc48>] ntfs_readdir+0xac8/0xf00 fs/ntfs3/dir.c:625
but there are no more locks to release!

other info that might help us debug this:
locks held by syz-executor416/5625: 2, last CPU#0:
 #0: ffff8880741d62b0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x118/0x160 fs/file.c:1409
 #1: ffff888076ed7490 (&type->i_mutex_dir_key#6){.+.+}-{4:4}, at: iterate_dir+0x287/0x880 fs/readdir.c:106

stack backtrace:
CPU: 0 UID: 0 PID: 5625 Comm: syz-executor416 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5349
 __lock_release kernel/locking/lockdep.c:5590 [inline]
 lock_release+0x252/0x3c0 kernel/locking/lockdep.c:5964
 __mutex_unlock_slowpath+0x88/0x900 kernel/locking/mutex.c:989
 ni_unlock fs/ntfs3/ntfs_fs.h:1266 [inline]
 ntfs_readdir+0xac8/0xf00 fs/ntfs3/dir.c:625
 iterate_dir+0x3db/0x880 fs/readdir.c:114
 __do_sys_getdents fs/readdir.c:324 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3fff35c289
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe78a3d2c8 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f3fff35c289
RDX: 00000000000000b8 RSI: 0000200000000040 RDI: 0000000000000004
RBP: 0000000000000001 R08: 0000000000000000 R09: 00007ffe78a3d3f8
R10: 00007f3fff3acfb3 R11: 0000000000000246 R12: 00007ffe78a3d3e8
R13: 0000000000000002 R14: 00007f3fff404c80 R15: 000000000000000


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
