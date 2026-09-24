Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84F33B6D1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226039; cv=none; b=K/s4gtXgp4Y6GqPK0vCakch8pYb8HxM6EhNYmQ3tlaL2VfO1qsZ5FTarcA30d3UMwZkZcrwWNM4W5lqmbpPa/t2NW6ixfnuQ9bFt0+4KU8HPYFlfm6dJGctFxBlAxsrn46LP5ilLIoAqKWirBjvHdYskumfdw7OOTwg2Jfm6VJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226039; c=relaxed/simple;
	bh=0j3hIcgGwLSa1MtIiVBt3ya1Z7k7JOFyFuzIo3c7esU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fvKQ+d7nnP6vG9epJa8Dh/RAlZ7vLH9c5yclEHLAPNXL2//hvFNMHgOOdAGuAYwVo8rSBsO9lC2qN0m6M+bF1xkrqGz3C8kda29ZYZaRkZNI4vLcSi6bRyPawcSD1P3XaL9ot1MFMQC5mWJ7A6XsWGpichplHMozsBynWqVCf6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4b3780fb4f5so635381b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226037; x=1790830837;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqqgurFUBuh0v3CWe8T+W2CgMloyuUVeURTr7IePVEU=;
        b=mPFdmPkVpMDfUzfVH1Doj0Q+kbECrygIEFiiXBSrO+LqoN6a99hMSWF7VIfNbdNs59
         gDdyPKWWsuimRcJF3T+TiX5P3Vz0Qbei7c4AeZmLiYFX+lF4eZEfm48tMH47JZu+HTso
         CFETHhfC2ktN96MFWtwqYSz/7KwRqjsPN74wbC7eIh6u2/3a2HzTprFJET+v2/eyR7+O
         Aq0Ngb4Xj4JAMwPGvhG0qpUyyvaoimBPWkg+YS7KIw+ejTD8T29kN8PFiy/51oA7LPEq
         wechlswa6WWDRd8cilX5+J4aLsQibhxwSGGMi3fgPVhLgkTaGM5nS6EWx0OkLKqul4BL
         D9KA==
X-Forwarded-Encrypted: i=1; AKwUvBzYzGll0QKzQdSJ2Ik0BTocaSrJLBJAtZujQ22pGc5FXeIizXNQCHg10LJfi0RMfkgISLv4pZkL7sJNioI=@vger.kernel.org
X-Gm-Message-State: AFuF++n5fESG7tXpNku6xCOp1+bC6J9swNoksuSSQstlo0vgya/uUf58
	vms89ZuAbR+gQRtF0rcdkAvMqsXwv2eqwODMKsZQmYsBwKbdL7Vy6tDPMiYYCc+f3REI3pQkFTJ
	jcS8IbVQHXOeG7GDksHc1ith6kqPLzuzE/WiPHTN2ZpJY/tRw6gBnetCj6Gg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a06:b0:4c6:7ce9:1bf0 with SMTP id
 5614622812f47-4d72cb3f361mr1448749b6e.20.1790226036854; Wed, 23 Sep 2026
 22:00:36 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:00:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab4ae74.80e1c6cc.1e8e5f.000c.GAE@google.com>
Subject: [syzbot] [f2fs?] UBSAN: shift-out-of-bounds in __f2fs_commit_super
From: syzbot <syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a8c591ed6b67 Add linux-next specific files for 20260922
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16f98405580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19be71c9d7429efd
dashboard link: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f98405580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148ea515580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/08a28cd722c6/disk-a8c591ed.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e1c983b28f94/vmlinux-a8c591ed.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ff7b15260591/bzImage-a8c591ed.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3e937ffb1f11/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16029405580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 40427
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/f2fs/super.c:3950:27
shift exponent 4294967287 is too large for 64-bit type 'sector_t' (aka 'unsigned long long')
CPU: 1 UID: 0 PID: 5622 Comm: syz-executor329 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
 __f2fs_commit_super+0x43e/0x4d0 fs/f2fs/super.c:3950
 sanity_check_area_boundary+0x7c5/0xe20 fs/f2fs/super.c:4040
 sanity_check_raw_super fs/f2fs/super.c:4215 [inline]
 read_raw_super_block fs/f2fs/super.c:4625 [inline]
 f2fs_fill_super+0x1920/0x7fa0 fs/f2fs/super.c:5160
 get_tree_bdev_flags+0x430/0x4f0 fs/super.c:1872
 vfs_get_tree+0x92/0x2a0 fs/super.c:1932
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3848
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4394 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4371
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2eb02deeaa
Code: 56 53 b8 9d 00 00 00 0f 05 83 f8 ea 75 a2 c7 05 e4 5b 09 00 00 00 00 00 eb 96 e8 51 05 00 00 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcaf01ba78 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcaf01ba90 RCX: 00007f2eb02deeaa
RDX: 0000200000000080 RSI: 0000200000000000 RDI: 00007ffcaf01ba90
RBP: 0000200000000000 R08: 00007ffcaf01bad0 R09: 0000000000000000
R10: 0000000000200000 R11: 0000000000000286 R12: 0000200000000080
R13: 00007ffcaf01bad0 R14: 0000000000000003 R15: 0000000000200000
 </TASK>
---[ end trace ]---


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
