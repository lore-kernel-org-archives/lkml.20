Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330565;
	b=H9aIRljV27OqkDYcMbwjyVWmr5lUS4z6xjZPWuXs6rpbGUBfJQ5bnJWx2QlqSX8bxPBJ
	 sjwVyQrJ72xZR5JQ4vE9UEZJU6TNfFt5l+cdIXE0CvItl8KMwDmsjOTKpZOv208JcCB1N
	 DH4ArrP8MzTb51H3XXIIPOwDCa68BKvG9c9PBPw46BqBQy8KeJj9XO51rG8K2xWyjYwKb
	 S+YJvvlR1KIzBAXcj/GjSshMjwMsqoB9jj69pTG30U24FxA03mo6kQbVLAWPvmPokH3no
	 6wraXBujZM+FThGz3XR3g8W22j8UIQ9PObelB4ABVTLlvXo7oyPjED8ht6jLnbLHKJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330565;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=wGkmHDCxPvMLuXEXbbcNNCir8/WxlRJTdgzegweYTdY=;
	b=Qf4SmO2TprHkLsiY0S8am4/4PvhbInvt0VIEp7FL8zyiWu54WalKnAjvnJRUA40Lurmc
	 Q1QwfHu9J929RMqnIFTt/uYLIck5z1SJKB8vLR3Lx8MUHa+YnW+6aEeoAAK4ZcPFSvWvA
	 qBYDdeFPq4nPAPfzyzC6GpyYgEaC7mIdAATtA8DFZ6N4/1iSBYYW3VxS17hs5Qrufp9SD
	 7OjuJmXeKiUV0V6mT885n/vX3mCALP2REmKIlWICyec9FGQ3qVCrsKqtXS7gd5MduGi6m
	 zRI7cecQp9hrqXFnc4+pnBrCdCmCTcFYxjXFsPwRlDbk7FsHzItZpO+ldEVxGQOWmag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F75606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so436988b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330564; x=1793935364;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wGkmHDCxPvMLuXEXbbcNNCir8/WxlRJTdgzegweYTdY=;
        b=vo5mpU0yQ0swK8brcIXpg2NoY21AFB2K4Doz22yo3ENtCHT/Iks5x/mBLGqYH8vyud
         c6U29IH7e1/VJjldwR1pAWWq7Fxz812HTvk90wuAEoyUMvqS+3cUhT9MmEC49tzvevnK
         WkungrVI1sBGsgndNMSgfh6/7K2oS6HTu0DwOGLh996WWeowf6wA7RBfPhLOJ5ErY5h3
         E3ddS8l1fgl8L06be/8QT2Mc/fs4aa7KSNjm7MAsHcLjMaJBVISG12EAuEpOtvvMTsIC
         8kmx1mAkb0zJ9Q2mjfDuwGbhgO9C60V4BhUa1f+gp+0Mh9y2i0bSqY43tFQMq5d4bxrM
         dCrA==
X-Forwarded-Encrypted: i=1; AKwUvBxFIsSxPlAzsXFWkSyC/J5oG5BD/C4U9RWeFlzPctjbZHWLy0SDjlhO/kfLu9lYJBPKKX9TgYFqIqt9bv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHmlFTmUSPP3RdywiXlY8eD7B/3a0IA1P9gvWtcZQYC1s18Bd7
	KJ1h6CIDKdhUusiu7317DHPE7bQAmjoROPAKe4QRLVMTo/eZ/1B6GsrWaKxeHt027z+F9P8AUjR
	GigwmUTk7FW28ef/wVpFwL+135G4jqLCVL4TzQrXEVVIZrZqdAc9GhjdBwvg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c49:b0:4c5:b120:9833 with SMTP id
 5614622812f47-5640d91b97cmr856492b6e.6.1793330564211; Thu, 29 Oct 2026
 20:22:44 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:22:44 -0700
In-Reply-To: <6a848afb.c8649fcc.3bb87.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae40d84.0c1d3ab6.e3d48.006f.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] WARNING: bad unlock balance in jffs2_do_create
From: syzbot <syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    4dd16e31135e Merge tag 'net-7.4-rc1' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=120d9b8e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=250fde257a3eebba4426
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dd8129580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com

jffs2: Write of 68 bytes at 0x0001e00c failed. returned -12, retlen 0
jffs2: Not marking the space at 0x0001e00c as dirty because the flash driver returned retlen zero
=====================================
WARNING: bad unlock balance detected!
syzkaller #0 Not tainted
-------------------------------------
syz-executor317/5670 is trying to release lock (&c->alloc_sem) at:
[<ffffffff834f8efe>] jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
but there are no more locks to release!

other info that might help us debug this:
locks held by syz-executor317/5670: 2, last CPU#0:
 #0: ffff888049484460 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:531
 #1: ffff8880144cd800 (&type->i_mutex_dir_key#8){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff8880144cd800 (&type->i_mutex_dir_key#8){+.+.}-{4:4}, at: lookup_open+0x246/0x1970 fs/namei.c:4462

stack backtrace:
CPU: 0 UID: 0 PID: 5670 Comm: syz-executor317 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5349
 __lock_release kernel/locking/lockdep.c:5590 [inline]
 lock_release+0x252/0x3c0 kernel/locking/lockdep.c:5964
 __mutex_unlock_slowpath+0x88/0x900 kernel/locking/mutex.c:989
 jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
 jffs2_create+0x1c8/0x320 fs/jffs2/dir.c:205
 lookup_open+0xedc/0x1970 fs/namei.c:4569
 open_last_lookups fs/namei.c:4768 [inline]
 path_openat+0x70c/0x20f0 fs/namei.c:5007
 do_file_open+0x23e/0x4a0 fs/namei.c:5039
 do_sys_openat2+0x115/0x200 fs/open.c:1442
 do_sys_open fs/open.c:1448 [inline]
 __do_sys_creat fs/open.c:1526 [inline]
 __se_sys_creat fs/open.c:1520 [inline]
 __x64_sys_creat+0x8f/0xc0 fs/open.c:1520
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3e047ea0f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff7c755290 EFLAGS: 00000202 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 0000555569e9a400 RCX: 00007f3e047ea0f7
RDX: 0000000000000000 RSI: 00000000000001a4 RDI: 00007f3e04827201
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007f3e04827235
R13: 00007f3e04827252 R14: 000000000000000e R15: 0000000000020000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
