Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF3D298CA5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789799741; cv=none; b=TBOom1sjBBBkKs19si7G61izfTcDxlK7a7dCrT4DhcOBMvDrYuo3sT4yNDRFds9B/snAb0fJ6LVdZXA9CQ6TgrkVkmN0KwU0UCi5By0lYLmejES3XCYvKcunp+uP48le1Vh4ddlxU+RRSdlMsKX/4xNjn+emoQkrZwBPxQJ1NXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789799741; c=relaxed/simple;
	bh=YWp3wdC0O9V77a83xcoMz0cxALPgT+RvPCVZdZh7qaY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LU3ym+9PYv/HvLAK7/pqgOQoMVUL+yAujrhodJv+aCUy8E5uM223DIiGjvo2y8nKMZ02T4wGO0IdEgUnnSGRYv84LCm49It0SyCNaVvsE+TmGBCGRI5WzYW6MqWLnhEbi1V9uTk1bKI5xEIiahlZkNniiQCxDvZMn8lAfFKz+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6c12320cb24so111011eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789799738; x=1790404538;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lR3lNB2vzjFIyz4s+RKC6q2V2uNf4KmeCzHfywiIoO8=;
        b=SDqVXZGHjTZ0KKCh4FuLYj/IzaWgmWpnjBNuLNa7YTWFYZLX2NXL/LCg7e6rtt0BQj
         cbzBpYlgLvvq0bIo7jBp0RQ0vULl7XZd1qhZLXKKmGTKfXVNJD6NNhrWfaHwbQmJcGgd
         e8adxlfwhPwMLegwVdoNalWvg3qY8PXO41mKjgX80ItB0YPht+BaZVUiJhC0wLp8sFYQ
         QXeaPp2v13rcNcHI1By9FhbBFa/muxOVw1v62P5hO1scl6VI6mod7eFjJF67irqwea6m
         /XhR3k9fha4ad7cattmJsKtRu2TP0+2esYP38baXrVNWQsEisFleanNeJuJ/USXnrJ1H
         bNSA==
X-Forwarded-Encrypted: i=1; AKwUvBxhWFpcrLUkzL9B43VaJhYFEtvz1zjMO5p78fAWm+co4Pi8xydp4f2U1EO4rYXzWY1jO1aFQf9vFcqVriM=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Tmv/ki5e9zCHjfqXxU8fS4gdElHZeTvLYU9q5FooK+NQaTQR
	M0aJLu7U+dNSBSjYuYOB2PUF/iTaTJJEnAARBUwMSDMXjrV/v8b7L56LwHEIS8eaALyG+fgMaGy
	VGS6mOjn0s5ANKd3zQ7wcm19K8dX2L+zYXLT7NmqSt42L6EAQ6BW+GA790Z8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f04:b0:6b7:8396:f3c2 with SMTP id
 006d021491bc7-6ca9c059ca0mr4313738eaf.36.1789799738388; Fri, 18 Sep 2026
 23:35:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 23:35:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae2d3a.a6af0033.177e91.0000.GAE@google.com>
Subject: [syzbot] [fs?] possible deadlock in vfs_rmdir
From: syzbot <syzbot+d112d38ca13afed05225@syzkaller.appspotmail.com>
To: a.hindborg@kernel.org, leitao@debian.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    587858367581 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15b17df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d112d38ca13afed05225
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-58785836.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f8460d7438eb/vmlinux-58785836.xz
kernel image: https://storage.googleapis.com/syzbot-assets/551bf08b9af2/bzImage-58785836.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d112d38ca13afed05225@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.7.1309/11230 is trying to acquire lock:

but task is already holding lock:
ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: vfs_rmdir fs/namei.c:5500 [inline]
ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: vfs_rmdir+0xed/0x8a0 fs/namei.c:5488

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&sb->s_type->i_mutex_key#37){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       inode_lock include/linux/fs.h:1024 [inline]
       configfs_depend_item_unlocked+0xf3/0x6a0 fs/configfs/dir.c:1268
       usbg_make_tpg+0x251/0x610 drivers/usb/gadget/function/f_tcm.c:1692
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:947
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x364/0x850 fs/namei.c:5410
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
       __do_sys_mkdir fs/namei.c:5470 [inline]
       __se_sys_mkdir fs/namei.c:5467 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (tpg_instances_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       usbg_make_tpg+0x10b/0x610 drivers/usb/gadget/function/f_tcm.c:1669
       target_fabric_make_tpg+0xab/0x8c0 drivers/target/target_core_fabric_configfs.c:947
       configfs_mkdir+0x525/0xd40 fs/configfs/dir.c:1369
       vfs_mkdir+0x364/0x850 fs/namei.c:5410
       filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
       __do_sys_mkdir fs/namei.c:5470 [inline]
       __se_sys_mkdir fs/namei.c:5467 [inline]
       __x64_sys_mkdir+0x6b/0x90 fs/namei.c:5467
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&subsys->su_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       configfs_rmdir+0x5ae/0x950 fs/configfs/dir.c:1565
       vfs_rmdir fs/namei.c:5515 [inline]
       vfs_rmdir+0x328/0x8a0 fs/namei.c:5488
       filename_rmdir+0x31a/0x5c0 fs/namei.c:5572
       __do_sys_rmdir fs/namei.c:5595 [inline]
       __se_sys_rmdir fs/namei.c:5592 [inline]
       __x64_sys_rmdir+0x46/0x70 fs/namei.c:5592
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &subsys->su_mutex --> tpg_instances_lock --> &sb->s_type->i_mutex_key#37

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sb->s_type->i_mutex_key#37);
                               lock(tpg_instances_lock);
                               lock(&sb->s_type->i_mutex_key#37);
  lock(&subsys->su_mutex);

 *** DEADLOCK ***

locks held by syz.7.1309/11230: 3, last CPU#2:
 #0: ffff8880245ba460 (sb_writers#24){.+.+}-{0:0}, at: filename_rmdir+0x1ff/0x5c0 fs/namei.c:5561
 #1: ffff88802048d6c0 (&default_group_class[depth - 1]#7/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff88802048d6c0 (&default_group_class[depth - 1]#7/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #1: ffff88802048d6c0 (&default_group_class[depth - 1]#7/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #1: ffff88802048d6c0 (&default_group_class[depth - 1]#7/1){+.+.}-{4:4}, at: filename_rmdir+0x258/0x5c0 fs/namei.c:5565
 #2: ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #2: ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: vfs_rmdir fs/namei.c:5500 [inline]
 #2: ffff88802ee08600 (&sb->s_type->i_mutex_key#37){++++}-{4:4}, at: vfs_rmdir+0xed/0x8a0 fs/namei.c:5488

stack backtrace:
CPU: 2 UID: 0 PID: 11230 Comm: syz.7.1309 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 configfs_rmdir+0x5ae/0x950 fs/configfs/dir.c:1565
 vfs_rmdir fs/namei.c:5515 [inline]
 vfs_rmdir+0x328/0x8a0 fs/namei.c:5488
 filename_rmdir+0x31a/0x5c0 fs/namei.c:5572
 __do_sys_rmdir fs/namei.c:5595 [inline]
 __se_sys_rmdir fs/namei.c:5592 [inline]
 __x64_sys_rmdir+0x46/0x70 fs/namei.c:5592
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd86d19e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd86e109028 EFLAGS: 00000246 ORIG_RAX: 0000000000000054
RAX: ffffffffffffffda RBX: 00007fd86d425fa0 RCX: 00007fd86d19e159
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000001640
RBP: 00007fd86d23503b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd86d426038 R14: 00007fd86d425fa0 R15: 00007ffe2cf354b8
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
