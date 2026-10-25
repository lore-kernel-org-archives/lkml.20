Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792903828;
	b=vXBUBzoqr5DgRNTZHHXmOvAgUC8C+Pfg8piSWXxgLhaQ14khIhdGwYoSQWDKd4sk6TSr
	 t9OGymxH8QMKmomvZLcJpvgbQ4oK4SyfyJUtS3Yo0B/RWXH0Mb2UAuS+03Lt2LNWUNdTn
	 leJvbiAQ+4bCjNZtTVCBuSRIsp1Yqp4Evntjc0ProlkGkd+YkXAgz1zhbfWdtfaJeGEf8
	 Ok4GtHdvmiC3mng5XuwIcPVm7CbrRT1v8GSdCXSuJHxESLx0B1EnrYfv6akOXbuZgaBwu
	 nBxJSR+0VpF1dYE5YV3zOhibpKjSgocfpDzVMERN/f517nQGYkTs13Y4Q/n5lBS70Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792903828;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=IP/z0rNamYIBQUJz+uxYPHpPmNG6nFdw74fFJ2J9EKQ=;
	b=AU/3fqGlKCYkYnf5J+1tm4Ax6HkHImhOzRbNrxiksAUBCwEZXp9CojKHQhR9GaJAMAWC
	 iAl96Ou8DfIA9h0Jifz6++B1dmBfzNWZ7MIFreztEtfaPhHzfMQy50+YTWzYbURhZsPag
	 8N4AQ6034QZywvKvKilYVQAf/rS9NP+Flc/WoK9Ckj4F/UcgdUn3B/fLl3qVpDorviw2h
	 oiiFHCnOUWZfyuxt18S8+4x/h4lhzBjC/cnFPZoGI7ZQw1AYDl+Z7uNRfylrim0LzWoNU
	 Ye2PGlpGSdQ6KYUEIBcOWdxk2wvHI/ABYiC+fwCYcIO5kJp1Cj/EPzZ+f0u53LTTXnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A2606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-843cf077bf7so2948660a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792903826; x=1793508626;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP/z0rNamYIBQUJz+uxYPHpPmNG6nFdw74fFJ2J9EKQ=;
        b=HuXUDUY2RBOkpjKS0AqhzUnyiGbcm8ewIiCea+Bjs2uIfDzneptIlEQP/snBkk2Edp
         5J5inDVbZQTfUM020ssOxPGP+4DuL0WiXEFMJifQhsIEmicp11/NIQL+1x5q+I5IaNew
         Z7fR/EOPhznXjNC16CGZ4ZVzxF83XHUo6QhdUgiznGJsEZaSCm9jp3UbUsgIwEdnBM3B
         NJEqAC3voKyf6oBkKYz2v1XxCZhbqc6xix2rzP7/VQXRvzuA55pqGFgPL2bNkFLlmX3U
         6nwFQktYnAw87ydC7JZbeYx7prf+w/PmQN5lXApYEJQWVGd9a3joLFT/Zq0t4TG3XWJI
         aiEA==
X-Forwarded-Encrypted: i=1; AKwUvBwLKyxqD4UA+YYgt/T8UovWeK5+EIxSq+KT8uMIiWx5gJ/vvb9jtBvxBV1KkTkXB5q5qbMCMewyZ96ooFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9VfBs40t69IA+WJ/pt6OAgPWjZ3wLvg0vpCdpRXC8fFJXRIjQ
	2Z2e+6AHx/IAUpU3SSqd3D42kebTWIOfMQEr0k2VcwMi/gOA9I8Yg/etEMWrqumRpxLtvgu4WbO
	cGLxEq/uY6ePNgEf9RSOM9pUORni7PpRJ+nhoW52TahYxsTb+fiNynm9zJ4E=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:4eb:80c0:f4bc with SMTP id
 5614622812f47-55c0020f4e7mr2003536b6e.10.1792903826673; Sat, 24 Oct 2026
 21:50:26 -0700 (PDT)
Date: Sat, 24 Oct 2026 21:50:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6add8a92.67317f00.38c4bc.006d.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in array_state_store
From: syzbot <syzbot+7657131267c5111921e2@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3ac032ef6ca8 Merge tag 'for-linus-fwctl' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10b3aee1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8625c9497ae83f0b
dashboard link: https://syzkaller.appspot.com/bug?extid=7657131267c5111921e2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3ac032ef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c8383c1d288f/vmlinux-3ac032ef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3c86b9622324/bzImage-3ac032ef.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7657131267c5111921e2@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     Y
------------------------------------------------------
syz.4.1083/10710 is trying to acquire lock:
ffff88804b6d0358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: mddev_lock drivers/md/md.h:713 [inline]
ffff88804b6d0358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: array_state_store+0x174/0xcf0 drivers/md/md.c:4705

but task is already holding lock:
ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_fop_write_iter+0x332/0x5f0 fs/kernfs/file.c:337

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (kn->active#77){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       kernfs_drain+0x4eb/0x600 fs/kernfs/dir.c:534
       __kernfs_remove+0x34c/0xbc0 fs/kernfs/dir.c:1578
       kernfs_remove_by_name_ns+0x7c/0x120 fs/kernfs/dir.c:1796
       kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
       remove_files+0x96/0x1c0 fs/sysfs/group.c:28
       sysfs_remove_group+0x8b/0x1b0 fs/sysfs/group.c:328
       sysfs_remove_groups fs/sysfs/group.c:352 [inline]
       sysfs_remove_groups+0x60/0xb0 fs/sysfs/group.c:344
       __kobject_del+0x89/0x220 lib/kobject.c:595
       kobject_cleanup lib/kobject.c:680 [inline]
       kobject_release lib/kobject.c:720 [inline]
       kref_put include/linux/kref.h:65 [inline]
       kobject_put+0x348/0x640 lib/kobject.c:737
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
       process_scheduled_works kernel/workqueue.c:3578 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 ((work_completion)(&mddev->del_work)){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       process_one_work+0xa32/0x1b10 kernel/workqueue.c:3471
       process_scheduled_works kernel/workqueue.c:3578 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 ((wq_completion)md_misc){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       touch_wq_lockdep_map+0xad/0x1c0 kernel/workqueue.c:4272
       __flush_workqueue+0x131/0x1200 kernel/workqueue.c:4314
       md_alloc+0x30/0x10a0 drivers/md/md.c:6334
       md_alloc_and_put drivers/md/md.c:6423 [inline]
       md_probe drivers/md/md.c:6439 [inline]
       md_probe+0x73/0xf0 drivers/md/md.c:6434
       blk_probe_dev+0x149/0x1e0 block/genhd.c:888
       blk_request_module+0x16/0xc0 block/genhd.c:901
       blkdev_get_no_open+0x9b/0xf0 block/bdev.c:870
       blkdev_open+0x141/0x4f0 block/fops.c:671
       do_dentry_open+0x674/0x1470 fs/open.c:1000
       vfs_open_consume+0xcc/0x460 fs/open.c:1131
       do_open fs/namei.c:4845 [inline]
       path_openat+0x1547/0x23f0 fs/namei.c:5010
       do_file_open+0x20e/0x430 fs/namei.c:5039
       do_sys_openat2+0x163/0x1d0 fs/open.c:1442
       do_sys_open fs/open.c:1448 [inline]
       __do_sys_openat fs/open.c:1464 [inline]
       __se_sys_openat fs/open.c:1459 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1459
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (major_names_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       blk_probe_dev+0x28/0x1e0 block/genhd.c:885
       blk_request_module+0x16/0xc0 block/genhd.c:901
       blkdev_get_no_open+0x9b/0xf0 block/bdev.c:870
       bdev_file_open_by_dev block/bdev.c:1091 [inline]
       bdev_file_open_by_dev+0x70/0x210 block/bdev.c:1079
       md_import_device+0x120/0x360 drivers/md/md.c:3847
       md_add_new_disk+0xdbf/0x1820 drivers/md/md.c:7656
       md_ioctl+0x2be7/0x36c0 drivers/md/md.c:8499
       blkdev_ioctl+0x5ad/0x6f0 block/ioctl.c:798
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl fs/ioctl.c:583 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mddev->reconfig_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       mddev_lock drivers/md/md.h:713 [inline]
       array_state_store+0x174/0xcf0 drivers/md/md.c:4705
       md_attr_store+0x1c5/0x330 drivers/md/md.c:6158
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &mddev->reconfig_mutex --> (work_completion)(&mddev->del_work) --> kn->active#77

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(kn->active#77);
                               lock((work_completion)(&mddev->del_work));
                               lock(kn->active#77);
  lock(&mddev->reconfig_mutex);

 *** DEADLOCK ***

locks held by syz.4.1083/10710: 5, last CPU#2:
 #0: ffff888040588b70 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1408
 #1: ffff888037ffa460 (sb_writers#8){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff888037f03908 (&of->prealloc_mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x24d/0x5f0 fs/kernfs/file.c:320
 #3: ffff888037f03880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x2c2/0x5f0 fs/kernfs/file.c:336
 #4: ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #4: ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_fop_write_iter+0x332/0x5f0 fs/kernfs/file.c:337

stack backtrace:
CPU: 2 UID: 0 PID: 10710 Comm: syz.4.1083 Tainted: G             L     Y syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP, [Y]=FORCED_BIND
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
 __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
 mddev_lock drivers/md/md.h:713 [inline]
 array_state_store+0x174/0xcf0 drivers/md/md.c:4705
 md_attr_store+0x1c5/0x330 drivers/md/md.c:6158
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f03a8b9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f03a9a99028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f03a8e25fa0 RCX: 00007f03a8b9f559
RDX: 0000000000000005 RSI: 0000200000000280 RDI: 0000000000000004
RBP: 00007f03a8c36b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f03a8e26038 R14: 00007f03a8e25fa0 R15: 00007fffeac25fa8
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
