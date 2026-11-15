Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746426;
	b=193UinHlLaABUqP6HKlDqv/+zg08Pa5VEBdQnUT3F+JmFxDC6Rw8fnkgZ9lAOplad2Ya
	 eXXIgpAqLsLUfbe9x9l7fNMOdnlrbB1SnKwI/7HMTeCiViqqKJKQ66Mfzc7SDU5pRD39D
	 lgideNdwUglsC3QQHlinRNLCPXb0EwOaRZLwWjcgz3aSM1h3Ji3GWsvRSIVPVQsY9Q/rk
	 RyIOct/5IIL8Is3uO9Olr8UCXK9g4+9VmwYympHWpFiXlPEu3orI2M2MHXw64pBf/o8ff
	 KuznyljRCLuBDPjvUadoRQTwhSyZp8iGFxzqXWsyMaLVry9OIdQwbwY6UPLzIyLgbPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746426;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=y/lnDxxXoEvrTeY1GtK+rtnFQM17zGDUyC6xopgk1TE=;
	b=lrevkGH548QPxJuJDJ5uCs/q4xg8EN2FrK+2mJ5CWnwnoX+riKxKnqbjJU9ctYBfHSLh
	 S749wq3wpwxlsNBuQ/i14QmszGN7y/VVswR0R2gIVNbPwdygfuU7BlX/DDYpOCNN06OKS
	 S1wR0rTDHeA6cqQwWvL/Erl/ClFllq+hU2UTlfNhFJLhHNnS16U0O6wXXpn7K9Cn4xUHY
	 r+sib2svt1m5KoO3pDqHSOOGa4k9cBWJDcTi8j3Je085yAXn62G5AR8dzNEJMmiAbKi/o
	 0RjdHSQDc4xttGs6bCNkryskuvo0uzmCUhhYRIttovyDl0jGqZ4ocqw8TiazPhFpmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D964B606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D964B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85d630e451aso3124380a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794746425; x=1795351225;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y/lnDxxXoEvrTeY1GtK+rtnFQM17zGDUyC6xopgk1TE=;
        b=VekhrYEScGmEPuB2pVEJxBTtRAAcmevfpH5PanOBmHzOBBfoXWvqE7fklYL7fb5SdR
         YPTbx43sl4KcvT3EJlrFBdRsgscKq5g01Tw003AqNl3UdEERdrfo0WsDXpoJcIcvFJXD
         4yT2Vq02eac3NRkQKPUl8HJMu542QbKCm4I/rc+rynqLAsaKfGmH3PtISQumjNcnGw4y
         ZK9wLJWzYXgkwlKAB5G6qjFF7G6ZSASkNj6vwj0Nv2TAY7FSo569VqnZv9sG2IqVMzyg
         oRmWo8MX9DqVZxwihh9sVqy4hQYCEmwwdAyUfs+Ywt/iO5O9PIGYTVIIDJzfTunNZs+N
         D5GQ==
X-Forwarded-Encrypted: i=1; AL+hErEoJWWdYp0pPwpdMk6ZMkVF+LW8GRjBtE8tsbeU8Hia2sABGTx2TN5Cub817lNWEi0p6A8Sx0XZqxk0Oos=@vger.kernel.org
X-Gm-Message-State: APuU4Z84xdXqcFlBb9QuCYBo+Ar0qi8QVwnclLMTYRUQ2M1Udx8cBGY8
	OHWvMcGC/ynzmlbSsrKHiwbhGE4w2aHISHbAzu5ZRbqSwh7ak/7nO+vCxyELwHgCunO0bIriMNi
	HSatxjq12rAH/vqesvCg+ocj8JS/NjUjcFblKHhYjpcmGAlRsnaGGaXq3srI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2217:b0:56a:cf0b:a5fb with SMTP id
 5614622812f47-56e6562402bmr6709547b6e.36.1794746424878; Sun, 15 Nov 2026
 04:40:24 -0800 (PST)
Date: Sun, 15 Nov 2026 04:40:24 -0800
In-Reply-To: <6af77e90.ff6dfe28.557e.0029.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af9a838.84fe3b82.798c4.0001.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in ovl_copy_up_start (6)
From: syzbot <syzbot+da1d15f707a556f6e48c@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    84abb955b101 Add linux-next specific files for 20261113
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14fc293d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f3ae09c7e4ef77b
dashboard link: https://syzkaller.appspot.com/bug?extid=da1d15f707a556f6e48c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1507d4d9580000

AI-generated root cause summary:
Lockdep detected a false positive circular dependency between overlayfs
directory locking, superblock write protection, IMA integrity locking, and
kernfs file locking. OverlayFS by design acquires an inode's i_rwsem
(&ovl_i_mutex_dir_key) followed by ovl_inode_lock (&ovl_i_lock_key) on the same
inode during copy-up, and then takes upper filesystem freeze protection
(sb_writers). A reverse chain was registered because do_open() holds sb_writers
across security_file_post_open(), kernfs open files share a single &of->mutex
class, IMA shares &ima_iint_mutex_key[0] across all non-stacked filesystems
(both upper-fs regular files and kernfs files), and resume_store() performs a
full VFS path walk (lookup_bdev) under &of->mutex that re-enters OverlayFS
directory locking. Because the intermediate lock instances belong to disjoint
objects on different filesystems, no actual deadlock can materialize at runtime.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=da1d15f707a556f6e48c

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+da1d15f707a556f6e48c@syzkaller.appspotmail.com

syz-executor101 (5967): drop_caches: 3
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor101/5967 is trying to acquire lock:
ffff888069862b18 (&ovl_i_lock_key[depth]#2){+.+.}-{4:4}, at: ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:731 [inline]
ffff888069862b18 (&ovl_i_lock_key[depth]#2){+.+.}-{4:4}, at: ovl_copy_up_start+0x56/0x330 fs/overlayfs/util.c:744

but task is already holding lock:
ffff8880698627a8 (&ovl_i_mutex_dir_key[depth]#4){++++}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
ffff8880698627a8 (&ovl_i_mutex_dir_key[depth]#4){++++}-{4:4}, at: vfs_setxattr+0x12b/0x370 fs/xattr.c:343

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&ovl_i_mutex_dir_key[depth]#4){++++}-{4:4}:
       down_read+0x45/0x320 kernel/locking/rwsem.c:1574
       inode_lock_shared include/linux/fs.h:1042 [inline]
       lookup_slow+0x46/0x80 fs/namei.c:1979
       walk_component fs/namei.c:2325 [inline]
       link_path_walk+0xd9d/0x19c0 fs/namei.c:2699
       path_lookupat+0xe4/0x8c0 fs/namei.c:2863
       filename_lookup+0x265/0x5d0 fs/namei.c:2893
       kern_path+0x3d/0x150 fs/namei.c:3087
       lookup_bdev+0xc8/0x2b0 block/bdev.c:1268
       resume_store+0x181/0x500 kernel/power/hibernate.c:1292
       kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:575 [inline]
       vfs_write+0x612/0xba0 fs/read_write.c:667
       ksys_write+0x150/0x270 fs/read_write.c:1016
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #4 (&of->mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
       seq_read_iter+0x37e/0xca0 fs/seq_file.c:226
       __kernel_read+0x4ca/0x960 fs/read_write.c:512
       integrity_kernel_read+0x89/0xd0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:222 [inline]
       ima_calc_file_hash+0x451/0x890 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x51b/0xa00 security/integrity/ima/ima_api.c:300
       process_measurement+0x1272/0x1c10 security/integrity/ima/ima_main.c:425
       ima_file_check+0xdc/0x130 security/integrity/ima/ima_main.c:686
       security_file_post_open+0xb3/0x260 security/security.c:2777
       do_open fs/namei.c:4959 [inline]
       path_openat+0x179e/0x20e0 fs/namei.c:5122
       do_file_open+0x23e/0x4a0 fs/namei.c:5151
       do_sys_openat2+0x115/0x200 fs/open.c:1492
       do_sys_open fs/open.c:1498 [inline]
       __do_sys_openat fs/open.c:1838 [inline]
       __se_sys_openat fs/open.c:1833 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1833
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&p->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
       __kernel_read+0x4ca/0x960 fs/read_write.c:512
       integrity_kernel_read+0x89/0xd0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:222 [inline]
       ima_calc_file_hash+0x451/0x890 security/integrity/ima/ima_crypto.c:280
       ima_collect_measurement+0x51b/0xa00 security/integrity/ima/ima_api.c:300
       process_measurement+0x1272/0x1c10 security/integrity/ima/ima_main.c:425
       ima_file_check+0xdc/0x130 security/integrity/ima/ima_main.c:686
       security_file_post_open+0xb3/0x260 security/security.c:2777
       do_open fs/namei.c:4959 [inline]
       path_openat+0x179e/0x20e0 fs/namei.c:5122
       do_file_open+0x23e/0x4a0 fs/namei.c:5151
       do_sys_openat2+0x115/0x200 fs/open.c:1492
       do_sys_open fs/open.c:1498 [inline]
       __do_sys_openat fs/open.c:1838 [inline]
       __se_sys_openat fs/open.c:1833 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1833
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       process_measurement+0x7d0/0x1c10 security/integrity/ima/ima_main.c:319
       ima_file_check+0xdc/0x130 security/integrity/ima/ima_main.c:686
       security_file_post_open+0xb3/0x260 security/security.c:2777
       do_open fs/namei.c:4959 [inline]
       path_openat+0x179e/0x20e0 fs/namei.c:5122
       do_file_open+0x23e/0x4a0 fs/namei.c:5151
       do_sys_openat2+0x115/0x200 fs/open.c:1492
       do_sys_open fs/open.c:1498 [inline]
       __do_sys_openat fs/open.c:1838 [inline]
       __se_sys_openat fs/open.c:1833 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1833
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (sb_writers#4){.+.+}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs/super.h:19 [inline]
       sb_start_write include/linux/fs/super.h:125 [inline]
       ovl_start_write+0x115/0x290 fs/overlayfs/util.c:32
       ovl_do_copy_up fs/overlayfs/copy_up.c:992 [inline]
       ovl_copy_up_one fs/overlayfs/copy_up.c:1221 [inline]
       ovl_copy_up_flags+0xe90/0x3890 fs/overlayfs/copy_up.c:1275
       ovl_fileattr_set+0x204/0x580 fs/overlayfs/inode.c:669
       vfs_fileattr_set+0xa2b/0xd10 fs/file_attr.c:306
       ioctl_fssetxattr+0x349/0x3b0 fs/file_attr.c:372
       do_vfs_ioctl+0x914/0x15a0 fs/ioctl.c:573
       __do_sys_ioctl fs/ioctl.c:602 [inline]
       __se_sys_ioctl+0x82/0x170 fs/ioctl.c:590
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ovl_i_lock_key[depth]#2){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:731 [inline]
       ovl_copy_up_start+0x56/0x330 fs/overlayfs/util.c:744
       ovl_copy_up_one fs/overlayfs/copy_up.c:1214 [inline]
       ovl_copy_up_flags+0xaf7/0x3890 fs/overlayfs/copy_up.c:1275
       ovl_xattr_set+0x395/0x5e0 fs/overlayfs/xattrs.c:54
       __vfs_setxattr+0x442/0x480 fs/xattr.c:223
       __vfs_setxattr_noperm+0x12a/0x660 fs/xattr.c:257
       vfs_setxattr+0x151/0x370 fs/xattr.c:344
       do_setxattr fs/xattr.c:662 [inline]
       filename_setxattr+0x296/0x630 fs/xattr.c:690
       path_setxattrat+0x408/0x450 fs/xattr.c:734
       __do_sys_lsetxattr fs/xattr.c:775 [inline]
       __se_sys_lsetxattr fs/xattr.c:771 [inline]
       __x64_sys_lsetxattr+0xbf/0xe0 fs/xattr.c:771
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &ovl_i_lock_key[depth]#2 --> &of->mutex --> &ovl_i_mutex_dir_key[depth]#4

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ovl_i_mutex_dir_key[depth]#4);
                               lock(&of->mutex);
                               lock(&ovl_i_mutex_dir_key[depth]#4);
  lock(&ovl_i_lock_key[depth]#2);

 *** DEADLOCK ***

locks held by syz-executor101/5967: 2, on CPU#1:
 #0: ffff88807b2e6478 (sb_writers#13){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:534
 #1: ffff8880698627a8 (&ovl_i_mutex_dir_key[depth]#4){++++}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff8880698627a8 (&ovl_i_mutex_dir_key[depth]#4){++++}-{4:4}, at: vfs_setxattr+0x12b/0x370 fs/xattr.c:343

stack backtrace:
CPU: 1 UID: 0 PID: 5967 Comm: syz-executor101 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
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
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
 ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:731 [inline]
 ovl_copy_up_start+0x56/0x330 fs/overlayfs/util.c:744
 ovl_copy_up_one fs/overlayfs/copy_up.c:1214 [inline]
 ovl_copy_up_flags+0xaf7/0x3890 fs/overlayfs/copy_up.c:1275
 ovl_xattr_set+0x395/0x5e0 fs/overlayfs/xattrs.c:54
 __vfs_setxattr+0x442/0x480 fs/xattr.c:223
 __vfs_setxattr_noperm+0x12a/0x660 fs/xattr.c:257
 vfs_setxattr+0x151/0x370 fs/xattr.c:344
 do_setxattr fs/xattr.c:662 [inline]
 filename_setxattr+0x296/0x630 fs/xattr.c:690
 path_setxattrat+0x408/0x450 fs/xattr.c:734
 __do_sys_lsetxattr fs/xattr.c:775 [inline]
 __se_sys_lsetxattr fs/xattr.c:771 [inline]
 __x64_sys_lsetxattr+0xbf/0xe0 fs/xattr.c:771
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f823a4ea8ea
Code: 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 ba ff ff ff ff eb d1 e8 b8 0b 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 bd 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd80584f68 EFLAGS: 00000246 ORIG_RAX: 00000000000000bd
RAX: ffffffffffffffda RBX: 00007ffd80584f80 RCX: 00007f823a4ea8ea
RDX: 00007f823a54677a RSI: 00007f823a54677e RDI: 00007ffd80584f80
RBP: 00007f823a573ae0 R08: 0000000000000000 R09: 00000000ffffffff
R10: 0000000000000003 R11: 0000000000000246 R12: 00007f823a54677e
R13: 00007f823a54677a R14: 00007f823a546581 R15: 00007f823a546574
 </TASK>
