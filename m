Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D535AC14
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477995; cv=none; b=aL7zBisDycC/FxA1jvF58bo+HNvPfQeegKqWjXp2W1+3C9xjxWT0QRuLSOVxX3QkU5+6lvHTFwrTwpjmSfAsX2gUI4ADVbVw7D2bCWobVgx3zIq6J22rxU8BaqCPFHIIzpwvhQT1mZl1+IS9n6vYDjMeGaNCUy6Tvt00W614oDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477995; c=relaxed/simple;
	bh=4uXYVMPJxkaOuPDM/5Q61nrZrXB7guKK/q9JC8w1cEM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DPQ+aIdmYsvIIbIdo9PIEcj1/oAyIWWNLdk8O51eBCdOa/o/HLSw/hRlIuziMZ4VKnz/xowlSBtZ6N5loe21oD40dq6doJrxHV4LYiFk4JST+GXIdrY8e72uHMLNSC6p9ndLS/gjYvrz2d9Dc/0/fZp4gfFks7LdPEp+A8Wg0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6e0cecbdb6aso5295701eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477992; x=1792082792;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ITdp8ZNA6RczdrpEshl6BOayPG2ZjRqiKIgJymZy+Q=;
        b=tSZfnqv2D4HxAweLhmCStInDqt3QFcqGxy7mJx1lOzTSloMfs0waDIFpmI/XSm6twy
         jzZ4cWTTfJZIcwb4Bw5cEGuaGDEm2eCCGr9FTusL9qURm2OGSWNB1TOpIE+B+lVMI5jO
         kz/akq8ULBQ0r/6zEVY8sphKiZfo7DkjhlVXs1ZlY1xU5TyK97CUNdpr48KAxd/f3/NB
         JFNVCGTBwDZHYqLN7mUj8jy5h4rCenUED86hiDOBZhePcaZgn1VFKiZBTIsXLjlFzK/q
         ZFf48qfb2tseDuDIYCO80ohimQs5ksp1YtF+Gc55CstT1Ib+y+j0qqMlYKdzdmE75o1k
         8pFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCrH4fO1bSGyxAvXi3gtXg7/dKQAoK/MwhzJThP60E75DFAG/Y53hOarER4tmJ7wGdGFsVjznk9hZpe6E=@vger.kernel.org
X-Gm-Message-State: AFuF++mZkN3xy+0VzfzBYYHqg4/8rlsE1iR9g+RdB5V+n5I8yJsrcajv
	shRx4utmxc4GjnEOEp6pgXDgQlyR2axVhkO9zgvRc56C+J+efhTg7QguRmHH5W2P8KnTk+z55Rw
	wCgCBFQcW4cMoTRv6gp0tvlJkh8JgFvprpQ+JHY7cf8hCjA92zSk4YhdEsLI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a9:b0:6d7:d91d:d77d with SMTP id
 006d021491bc7-6e7a6803bacmr5273558eaf.58.1791477992709; Thu, 08 Oct 2026
 09:46:32 -0700 (PDT)
Date: Thu, 08 Oct 2026 09:46:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac7c8e8.bbc4c7f9.15faa7.0005.GAE@google.com>
Subject: [syzbot] [nvme?] possible deadlock in nvmet_ctrl_free
From: syzbot <syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com>
To: hch@lst.de, kch@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, sagi@grimberg.me, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6addb4f38557 Merge tag 'edac_urgent_for_v7.3_rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1247d7f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=82a415522ced8da5
dashboard link: https://syzkaller.appspot.com/bug?extid=da94a51633758d13bd63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/241d612e2ce8/disk-6addb4f3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9cfd96e45cc8/vmlinux-6addb4f3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6a5986e10a7b/bzImage-6addb4f3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.1.33/5940 is trying to acquire lock:
ffff88805245a868 (&subsys->lock){+.+.}-{4:4}, at: nvmet_ctrl_free+0xa6/0x8e0 drivers/nvme/target/core.c:1766

but task is already holding lock:
ffff88805245a868 (&subsys->lock){+.+.}-{4:4}, at: nvmet_port_del_ctrls+0x2e/0x150 drivers/nvme/target/core.c:308

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&subsys->lock);
  lock(&subsys->lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.1.33/5940: 5, last CPU#0:
 #0: ffff88801eb8c460 (sb_writers#12){.+.+}-{0:0}, at: filename_unlinkat+0x1ad/0x730 fs/namei.c:5696
 #1: ffff888053089440 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #1: ffff888053089440 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #1: ffff888053089440 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #1: ffff888053089440 (&default_group_class[depth - 1]#2/1){+.+.}-{4:4}, at: filename_unlinkat+0x262/0x730 fs/namei.c:5700
 #2: ffff8880531230c0 (&sb->s_type->i_mutex_key#26){++++}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #2: ffff8880531230c0 (&sb->s_type->i_mutex_key#26){++++}-{4:4}, at: vfs_unlink+0xd3/0xbd0 fs/namei.c:5635
 #3: ffffffff8ff5f3c8 (nvmet_config_sem){++++}-{4:4}, at: nvmet_port_subsys_drop_link+0x53/0x310 drivers/nvme/target/configfs.c:1109
 #4: ffff88805245a868 (&subsys->lock){+.+.}-{4:4}, at: nvmet_port_del_ctrls+0x2e/0x150 drivers/nvme/target/core.c:308

stack backtrace:
CPU: 0 UID: 0 PID: 5940 Comm: syz.1.33 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_deadlock_bug.cold+0xbd/0xca kernel/locking/lockdep.c:3085
 check_deadlock kernel/locking/lockdep.c:3137 [inline]
 validate_chain kernel/locking/lockdep.c:3939 [inline]
 __lock_acquire+0x13f4/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 nvmet_ctrl_free+0xa6/0x8e0 drivers/nvme/target/core.c:1766
 kref_put include/linux/kref.h:65 [inline]
 nvmet_ctrl_put drivers/nvme/target/core.c:1794 [inline]
 nvmet_cq_destroy drivers/nvme/target/core.c:867 [inline]
 nvmet_cq_put+0x158/0x200 drivers/nvme/target/core.c:848
 nvmet_fc_delete_target_queue drivers/nvme/target/fc.c:936 [inline]
 nvmet_fc_target_assoc_free+0x418/0x2220 drivers/nvme/target/fc.c:1173
 kref_put include/linux/kref.h:65 [inline]
 nvmet_fc_tgt_a_put drivers/nvme/target/fc.c:1195 [inline]
 nvmet_fc_delete_ctrl+0x717/0x7e0 drivers/nvme/target/fc.c:1581
 nvmet_port_del_ctrls+0xfb/0x150 drivers/nvme/target/core.c:311
 nvmet_port_subsys_drop_link+0x1e8/0x310 drivers/nvme/target/configfs.c:1119
 configfs_unlink+0x3cc/0x800 fs/configfs/symlink.c:258
 vfs_unlink+0x2f0/0xbd0 fs/namei.c:5649
 filename_unlinkat+0x408/0x730 fs/namei.c:5719
 __do_sys_unlinkat fs/namei.c:5748 [inline]
 __se_sys_unlinkat fs/namei.c:5740 [inline]
 __x64_sys_unlinkat+0xc0/0x130 fs/namei.c:5740
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff78659e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff78739d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007ff786826090 RCX: 00007ff78659e159
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007ff78663506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff786826128 R14: 00007ff786826090 R15: 00007ffd775068a8
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
