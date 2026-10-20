Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455069;
	b=yb0hZJxy9eyyhVSNaEYc3hpo49s2k1V0ipRby6FsM4KUtshuJmxQXDW75aIOkoyhc3gt
	 K3PcTtuVk+yP13/xheuWIkUI4oDp15jteCB7rDd6Bci+v6FMU7K3YwsY5Zw/LstE3woWG
	 Q0iF+vhwhXxn0mt7hzPuzwsU6EGa1ZVkPGh8Ovlqm0gK0VoewUo1ZGWPUHzakJaYAfXqc
	 msAFCWp5RnMJt7c8kgOXKuX8XNXXFxZdRTQLNR56uPcT4WZzZ4j4Xf8OM0G1nlLOSLEFh
	 zhn4ksJkP87qxCvYBXtsiB+rsQr5nCAwn+CnSfFL2osNDhgtM43VfS3Oa7fEh+PQQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455069;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=qacHuQ2VTNVsYjQ1obuJTYMar2bSfpTVm9fcmHzhRIQ=;
	b=wjptK+u68l2yaENlrvJsy22HseK3HaZyKrCuiAalzK1IeOYU9jw2sCRukskOFJAqN2f+
	 Q9+QQoCu6bjafq5+RVRWG2O7O3Rq/RyUeM9dnFt/Za6SfHAiS14EkLiT94J7PvSMwLmNX
	 IC6biF+csH3pTmjLD2q1FIkz+YDV7xThsM3Cxj6NstE+e7J6eWLAHXBPYIIVeo324+swO
	 /T8Qm9rPWzRxlgSNyWmiWM1eU+1iW4ttRq4MAXp3EP8q0lH5ZXS+z5nSRuBWbLpCeaINl
	 nVtLmeZwMqOA/dFFZCMuGGWRCMePrGJSOnX13j4ukc8rgjrluxi7w28wUchizIDlpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so2385855b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455068; x=1793059868;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qacHuQ2VTNVsYjQ1obuJTYMar2bSfpTVm9fcmHzhRIQ=;
        b=qESBnZ0jvF30EpdBwBrJD41eMq/oLFUw97iv3P4INgJQBvlP4Le6B94vOGNmBhA6zI
         VuH32H0ickxYAMzUkAMosHZwGo3GS4h7e72l0VO1aDXvnrRDWuEB8XIfuSnFnoKx+soW
         eQ4DDPGpaJBC6bNGbHAWZU2bR+GJyopzh8jOV6ySaOLg3eAGoGaRW+vb3c6C4ui4S4lX
         p9hSaCY429sX1NjjnjokyJX7Ua73rPvZ1dpTmEofuUDSU+JCx/kHmzbOxJoqQDrQcy+6
         4K+IMVqvUtbGzv/KVEfvMC1zdxbnD2U6KGqKwr2b2GLOdYUu62ucCXKLmaiUz59Exmjl
         ugLw==
X-Forwarded-Encrypted: i=1; AKwUvBwvyktbmuGbIp1HWZ8JhEWXoImmXec2HcxpGKKfjhL4eLaHseFdRAsHGqyEnoTaff9E2BhImFSIuQ1zN3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOY8vP/7IFilVEZIXpPbPbY8wTQSET0dPiIUIuLi3ldOPHwOqX
	YsEPlZxfEeuTe5q/hACH9SnpNWzEYdEmJeOtlvxTWhIBh4PY+It1YiLz7Uy80yVUpX1rE5ko8kF
	4QmPPtkaQ54J0mwGCd6iwhQvnsSDcZfWgLgRRBBqFxZx/pu8LBMgNkXhTmOw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:a87:b0:540:5827:6d93 with SMTP id
 5614622812f47-54058277a49mr4728766b6e.25.1792455067836; Mon, 19 Oct 2026
 17:11:07 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:11:07 -0700
In-Reply-To: <6ab41b7d.e548f532.1ca396.0020.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6b19b.b5bd089a.6b57.0081.GAE@google.com>
Subject: Re: [syzbot] [ocfs2?] possible deadlock in vfs_rename (3)
From: syzbot <syzbot+c73ff6790f3d6c635abc@syzkaller.appspotmail.com>
To: heming.zhao@suse.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, mark@fasheh.com, ocfs2-devel@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c03c1a14507d Linux 7.3
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14a519cd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=c73ff6790f3d6c635abc
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a519cd580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=137cc831580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c9d4a36731a6/disk-c03c1a14.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3c00e4e185bb/vmlinux-c03c1a14.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f95d3156291/bzImage-c03c1a14.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2e6531d7c325/mount_0.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=15381831580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c73ff6790f3d6c635abc@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor105/5623 is trying to acquire lock:
ffff8880767009a0 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff8880767009a0 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}, at: vfs_rename+0x6e3/0xef0 fs/namei.c:-1

but task is already holding lock:
ffff8880764ff9a0 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
ffff8880764ff9a0 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}, at: vfs_rename+0x64d/0xef0 fs/namei.c:6159

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}:
       down_write_nested+0x9d/0x210 kernel/locking/rwsem.c:1757
       inode_lock_nested include/linux/fs.h:1069 [inline]
       __ocfs2_reflink+0xcab/0x16e0 fs/ocfs2/refcounttree.c:4198
       ocfs2_reflink+0x4eb/0x920 fs/ocfs2/refcounttree.c:4297
       ocfs2_vfs_reflink+0x338/0x450 fs/ocfs2/refcounttree.c:4423
       ocfs2_reflink_ioctl+0x3a0/0x450 fs/ocfs2/refcounttree.c:4463
       ocfs2_ioctl+0x5b5/0x7e0 fs/ocfs2/ioctl.c:920
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&oi->ip_alloc_sem){+.+.}-{4:4}:
       down_write+0x96/0x200 kernel/locking/rwsem.c:1631
       ocfs2_reflink+0x4d2/0x920 fs/ocfs2/refcounttree.c:4296
       ocfs2_vfs_reflink+0x338/0x450 fs/ocfs2/refcounttree.c:4423
       ocfs2_reflink_ioctl+0x3a0/0x450 fs/ocfs2/refcounttree.c:4463
       ocfs2_ioctl+0x5b5/0x7e0 fs/ocfs2/ioctl.c:920
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&oi->ip_xattr_sem){++++}-{4:4}:
       down_write+0x96/0x200 kernel/locking/rwsem.c:1631
       ocfs2_reflink+0x4c3/0x920 fs/ocfs2/refcounttree.c:4295
       ocfs2_vfs_reflink+0x338/0x450 fs/ocfs2/refcounttree.c:4423
       ocfs2_reflink_ioctl+0x3a0/0x450 fs/ocfs2/refcounttree.c:4463
       ocfs2_ioctl+0x5b5/0x7e0 fs/ocfs2/ioctl.c:920
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       down_write+0x96/0x200 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       vfs_rename+0x6e3/0xef0 fs/namei.c:-1
       filename_renameat2+0x533/0x9a0 fs/namei.c:6325
       __do_sys_rename fs/namei.c:6369 [inline]
       __se_sys_rename+0x55/0x2c0 fs/namei.c:6365
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &sb->s_type->i_mutex_key#18 --> &oi->ip_alloc_sem --> &sb->s_type->i_mutex_key#18/2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#18/2);
                               lock(&oi->ip_alloc_sem);
                               lock(&sb->s_type->i_mutex_key#18/2);
  lock(&sb->s_type->i_mutex_key#18);

 *** DEADLOCK ***

locks held by syz-executor105/5623: 5, last CPU#1:
 #0: ffff88807f244460 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:531
 #1: ffff88807f244768 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3789 [inline]
 #1: ffff88807f244768 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: __start_renaming+0xed/0x410 fs/namei.c:3878
 #2: ffff8880767025a0 (&type->i_mutex_dir_key#6/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #2: ffff8880767025a0 (&type->i_mutex_dir_key#6/1){+.+.}-{4:4}, at: lock_two_directories+0x141/0x220 fs/namei.c:3755
 #3: ffff8880767017a0 (&sb->s_type->i_mutex_key#18/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #3: ffff8880767017a0 (&sb->s_type->i_mutex_key#18/5){+.+.}-{4:4}, at: lock_two_directories+0x16b/0x220 fs/namei.c:3756
 #4: ffff8880764ff9a0 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #4: ffff8880764ff9a0 (&sb->s_type->i_mutex_key#18/2){+.+.}-{4:4}, at: vfs_rename+0x64d/0xef0 fs/namei.c:6159

stack backtrace:
CPU: 1 UID: 0 PID: 5623 Comm: syz-executor105 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 down_write+0x96/0x200 kernel/locking/rwsem.c:1631
 inode_lock include/linux/fs.h:1024 [inline]
 vfs_rename+0x6e3/0xef0 fs/namei.c:-1
 filename_renameat2+0x533/0x9a0 fs/namei.c:6325
 __do_sys_rename fs/namei.c:6369 [inline]
 __se_sys_rename+0x55/0x2c0 fs/namei.c:6365
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5228311de9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd98464798 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5228311de9
RDX: 69662f7375622f2e RSI: 0000200000002bc0 RDI: 0000200000002b80
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffd984647d0
R10: 00007ffd984647a0 R11: 0000000000000246 R12: 00007ffd984647d0
R13: 0000000000000002 R14: 431bde82d7b634db R15: 00007f522837104b
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
