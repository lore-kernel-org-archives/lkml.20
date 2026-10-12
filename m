Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F43E832A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832413; cv=none; b=cheLLrrObzwb6zloFnmVrlcCTMEvHR+ovTmjxxQH7aZ64ErFXWFQpZrAIyiQDX4T8GcJdyB5OciKGx55ltDu9Op7dwjXPg8U2u/SM3nhv/kem6f5DEF57GHA2QpXcUICG3tFQx8F0+JLontrzcT9VCUovUiYPshQ2/vRNhO5vOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832413; c=relaxed/simple;
	bh=wjCmGjHokoG6fnPwMIFN4v/aHcBoKbiMw+FEf0MX7Bc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pDyppEFnBkN7AIeATVRpDLFEgD+pDghcHHHThYsC8WclYSMdJgPE15KCjxkmpLsGV0a9jYnrHnkJ+c/9Js5qLffeyNL1AAULDDMwZN8Rf15IRPXo5xjsI/SYxBGjZ3VjFA5UUrLX7gXft5E8bYWK6ihxgY1lZ8YjVBXVn3/Ugsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so2244864b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832411; x=1792437211;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnd2xXRg2qvbwVtDjCLIbmIo/GqtLvNJwY4TbcCFsL4=;
        b=lFXm64t7+tOYMRydqNVNsKwxKsUOqVUSboywcWj2UlkddGHuFQSfAE6qnvyQiNazKD
         cdu31r6wdvE6nST81nBEiuZrAnLOhOV7mB82C2WMek7ZZGPpXFPBy4CapeV3J+ROKcmD
         E0KBU3yacSr2tm25tf5TaRNxdmAaiyk7pnk/5QDFSsNNJ320/nM6fuzhM7yA5UJ+wpeL
         FqKeIdpEiIou58+wqABygDnf+tgL5KBOUx3I0edXospcTBSG5TmHcXBoIhkxGmij8ZLU
         XJHoMZTS6/pBIw3wF7INlJepWmgKKjpWmtUYoRGl0hG0CwaPXI+lvOPd+SfIPHcJhQHC
         2c4w==
X-Forwarded-Encrypted: i=1; AKwUvBzE36KeA1LuaOGu8G4NnXgnjleK/95xrm6cegNjzRbQYjdoD3VLJ9zlM/Cm02Ip3DjCe9yw7mx8D83fz0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvbdCQ7TxypR4oqaQ8TLJ6rXA0GDxr9xxiKdG8nhcQylkrftuU
	rUVwT8Ca5I3NL74XnWju1bmhMRRXAjoxc4sPVRQZRv1bOb6jT3RbVDpBme/Adm9WcGckHP5LADt
	2DpBh5xWDo3QxLZ+QPwTuWcwad4sDfzCT+c4j0rLLiNBZA/UYVGZ5WrXZAVU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a8:b0:4b3:98f4:f057 with SMTP id
 5614622812f47-50c41c96aa9mr13560648b6e.3.1791832411080; Mon, 12 Oct 2026
 12:13:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 12:13:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd315b.8cdf6287.1eb53.0133.GAE@google.com>
Subject: [syzbot] [mm?] possible deadlock in igrab
From: syzbot <syzbot+9d97402eade2fc0c065c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@fromorbit.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev, 
	qi.zheng@linux.dev, roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b01868671970 Add linux-next specific files for 20261007
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17ab503c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ac1ab2cf2112eb1
dashboard link: https://syzkaller.appspot.com/bug?extid=9d97402eade2fc0c065c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/20420067bb60/disk-b0186867.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/14149d837264/vmlinux-b0186867.xz
kernel image: https://storage.googleapis.com/syzbot-assets/17346f8094aa/bzImage-b0186867.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d97402eade2fc0c065c@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.5.203/6616 is trying to acquire lock:
ffff88807e4d81e0 (&sb->s_type->i_lock_key){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:347 [inline]
ffff88807e4d81e0 (&sb->s_type->i_lock_key){+.+.}-{3:3}, at: igrab+0xfb/0x2f0 fs/inode.c:1595

but task is already holding lock:
ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:347 [inline]
ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: lock_list_lru mm/list_lru.c:26 [inline]
ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: lock_list_lru_of_memcg+0x261/0x4c0 mm/list_lru.c:96

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&l->lock){+.+.}-{3:3}:
       __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
       _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
       spin_lock include/linux/spinlock.h:347 [inline]
       lock_list_lru mm/list_lru.c:26 [inline]
       lock_list_lru_of_memcg+0x261/0x4c0 mm/list_lru.c:96
       list_lru_lock mm/list_lru.c:156 [inline]
       list_lru_add+0x57/0x290 mm/list_lru.c:229
       list_lru_add_obj+0x191/0x270 mm/list_lru.c:254
       d_lru_add+0xd8/0x1a0 fs/dcache.c:522
       retain_dentry fs/dcache.c:912 [inline]
       fast_dput+0x55c/0x690 fs/dcache.c:1005
       dput+0x2b/0x60 fs/dcache.c:1054
       path_put fs/namei.c:722 [inline]
       put_link+0x112/0x190 fs/namei.c:1201
       walk_component fs/namei.c:2316 [inline]
       link_path_walk+0x12da/0x1910 fs/namei.c:2682
       path_openat+0x1c4/0x1da0 fs/namei.c:5036
       do_file_open+0x23e/0x4a0 fs/namei.c:5069
       do_open_execat+0x12b/0x590 fs/exec.c:786
       open_exec fs/exec.c:822 [inline]
       bprm_open_interpreter+0x85/0xb0 fs/exec.c:1455
       load_elf_binary+0x1a5d/0x28d0 fs/binfmt_elf.c:904
       search_binary_handler fs/exec.c:1777 [inline]
       exec_binprm fs/exec.c:1809 [inline]
       bprm_execve+0x930/0x1590 fs/exec.c:1865
       kernel_execve+0x8af/0x9a0 fs/exec.c:2009
       try_to_run_init_process+0x13/0x60 init/main.c:1489
       kernel_init+0xb2/0x1d0 init/main.c:1619
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (&lockref->lock){+.+.}-{3:3}:
       __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
       _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
       spin_lock include/linux/spinlock.h:347 [inline]
       d_instantiate+0x72/0xb0 fs/dcache.c:2252
       d_make_root+0x59/0x80 fs/dcache.c:2294
       shmem_fill_super+0xcbc/0x1150 mm/shmem.c:5290
       get_tree_super fs/super.c:1400 [inline]
       get_tree_nodev+0xbb/0x150 fs/super.c:1420
       vfs_get_tree+0x92/0x2a0 fs/super.c:1943
       fc_mount fs/namespace.c:1278 [inline]
       vfs_kern_mount+0x15b/0x220 fs/namespace.c:1316
       kern_mount+0x43/0x90 fs/namespace.c:6500
       shmem_init+0x37/0x170 mm/shmem.c:5610
       mnt_init+0x19b/0x1f0 fs/namespace.c:6481
       vfs_caches_init+0x22/0x30 fs/dcache.c:3686
       start_kernel+0x351/0x3e0 init/main.c:1170
       x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
       x86_64_start_kernel+0x137/0x1b0 arch/x86/kernel/head64.c:291
       common_startup_64+0x13e/0x157

-> #0 (&sb->s_type->i_lock_key){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
       _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
       spin_lock include/linux/spinlock.h:347 [inline]
       igrab+0xfb/0x2f0 fs/inode.c:1595
       shmem_unused_huge_isolate+0x4f/0x290 mm/shmem.c:874
       __list_lru_walk_one+0x171/0x440 mm/list_lru.c:362
       list_lru_walk_one+0x3c/0x50 mm/list_lru.c:399
       list_lru_shrink_walk include/linux/list_lru.h:332 [inline]
       shmem_unused_huge_shrink+0x173/0x1270 mm/shmem.c:966
       super_cache_scan+0x411/0x4a0 fs/super.c:231
       do_shrink_slab+0x6d0/0x10d0 mm/shrinker.c:445
       shrink_slab_memcg mm/shrinker.c:562 [inline]
       shrink_slab+0x838/0x1210 mm/shrinker.c:640
       drop_slab_node mm/vmscan.c:488 [inline]
       drop_slab+0x140/0x280 mm/vmscan.c:506
       drop_caches_sysctl_handler+0xc7/0x170 fs/drop_caches.c:68
       proc_sys_call_handler+0x4c1/0x830 fs/proc/proc_sysctl.c:600
       do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
       vfs_writev+0x343/0x990 fs/read_write.c:1058
       do_writev+0x154/0x2e0 fs/read_write.c:1104
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &sb->s_type->i_lock_key --> &lockref->lock --> &l->lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&l->lock);
                               lock(&lockref->lock);
                               lock(&l->lock);
  lock(&sb->s_type->i_lock_key);

 *** DEADLOCK ***

locks held by syz.5.203/6616: 5, last CPU#0:
 #0: ffff88807a2ef270 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x118/0x160 fs/file.c:1408
 #1: ffff8880582de460 (sb_writers#3){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2756 [inline]
 #1: ffff8880582de460 (sb_writers#3){.+.+}-{0:0}, at: vfs_writev+0x2af/0x990 fs/read_write.c:1056
 #2: ffff88807fe9e0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_trylock_shared fs/super.c:670 [inline]
 #2: ffff88807fe9e0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_cache_scan+0x94/0x4a0 fs/super.c:200
 #3: ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:347 [inline]
 #3: ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: lock_list_lru mm/list_lru.c:26 [inline]
 #3: ffff888062a65640 (&l->lock){+.+.}-{3:3}, at: lock_list_lru_of_memcg+0x261/0x4c0 mm/list_lru.c:96
 #4: ffff88807e4d8018 (&info->lock){+.+.}-{3:3}, at: spin_trylock include/linux/spinlock.h:359 [inline]
 #4: ffff88807e4d8018 (&info->lock){+.+.}-{3:3}, at: shmem_unused_huge_isolate+0x26/0x290 mm/shmem.c:870

stack backtrace:
CPU: 0 UID: 0 PID: 6616 Comm: syz.5.203 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
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
 __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
 spin_lock include/linux/spinlock.h:347 [inline]
 igrab+0xfb/0x2f0 fs/inode.c:1595
 shmem_unused_huge_isolate+0x4f/0x290 mm/shmem.c:874
 __list_lru_walk_one+0x171/0x440 mm/list_lru.c:362
 list_lru_walk_one+0x3c/0x50 mm/list_lru.c:399
 list_lru_shrink_walk include/linux/list_lru.h:332 [inline]
 shmem_unused_huge_shrink+0x173/0x1270 mm/shmem.c:966
 super_cache_scan+0x411/0x4a0 fs/super.c:231
 do_shrink_slab+0x6d0/0x10d0 mm/shrinker.c:445
 shrink_slab_memcg mm/shrinker.c:562 [inline]
 shrink_slab+0x838/0x1210 mm/shrinker.c:640
 drop_slab_node mm/vmscan.c:488 [inline]
 drop_slab+0x140/0x280 mm/vmscan.c:506
 drop_caches_sysctl_handler+0xc7/0x170 fs/drop_caches.c:68
 proc_sys_call_handler+0x4c1/0x830 fs/proc/proc_sysctl.c:600
 do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
 vfs_writev+0x343/0x990 fs/read_write.c:1058
 do_writev+0x154/0x2e0 fs/read_write.c:1104
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe53d79e199
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe53e739028 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007fe53da25fa0 RCX: 00007fe53d79e199
RDX: 0000000000000001 RSI: 00002000000000c0 RDI: 0000000000000004
RBP: 00007fe53d835888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe53da26038 R14: 00007fe53da25fa0 R15: 00007ffc0e7c9828
 </TASK>
syz.5.203 (6616): drop_caches: 2


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
