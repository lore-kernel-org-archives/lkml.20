Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7C47ECED
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233004; cv=none; b=BUibDkIeMER1ca6xovQ1KAJxRAHHu/cSLY0o0Sj92LZ2Fh9pq44Zw1zJbqnlI/EJ2TGi1I4z5OwlW7MNAZOu1O0m9OQUmbgYfHMf+nfumFgthyANjSj/kxNJQdCto29tGUx7Uddqn3oYpjFg2DlbzRf9eDOrb1bsKudNawTtS9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233004; c=relaxed/simple;
	bh=+01MlLubd5TFKmRDg0+/iRuGshlbdj7/VSplDehtkNw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KCdCQ4X/3iMhpJf9CXtH4T6P+lxsPO+PjK84Wrkb0XxQh8d9vWiU0d27nKRiVyZV4ZyHFllr3LO0TSRVUAFjWdhL1sv1motM21IdzWok2aIrJfzFQpazIrkFsh+Vq2Ib3PdlTPT7o9WAKuGz3KLo+MncydvVYyQ4lxNrmn77qJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46f178d813bso890738fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233001; x=1792837801;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gwsgk3j6zgFqWriMOhD23oe587j70tKEtfn5zFdfbtY=;
        b=vL8Q58V1PvWo+HZkyYqU/WSuH8e+GLavVSmAKyBKWcraHqOVtP4IRuzL99B0Udw8eH
         FuyqDMTSI+7f410cfVdrnuxoTbk7YYxC1rV3aJpdeYlDeybO+Jq6euvR0dLf79HEkjWF
         ehsOWNTcikQ79kWpk9Mjhuy81mUCUefiEQvD0d7YaaR7PxfIvONVLoXuJVtXlAcJKkOt
         NKfRMiO6tLSBL/04TTrkxnStCtf+9RB1F+63XwKhYVTWbz9T9tjXW9gsd2YsytEWbpft
         Cdq+e+KaUXfxHxmj6zB3xwPJlj4CAG69Pgehs5KpE2tl4V6CUHp3ivUBNmVlEh3FAyIi
         MUdw==
X-Forwarded-Encrypted: i=1; AKwUvBzWe67pUvLR6Shr70045guvG7BD2UVIurHDT3ab54fYtUMC3Ozal1p+7EFG7Np8Q/VUC4G7xj0jeWMI4xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3mMP28rb8jSp9P9nJYHlJBICWwXvLoiCqvcBDO/fqFussnz5c
	ec4HBP/dq/H8FHMyY/EGfxEb1dBOnjgP//I3CWU2CfdhdNObVxnk/9EeNm0xaJ2TOBsOS10DMs1
	0sNDPjmpEAB8NVbzy/iLiKY+jvM7woRpXt4jm9nU9t2PivXnB+AJcvySt8uk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10c4:b0:4f1:f700:d447 with SMTP id
 5614622812f47-53cd20a56e9mr1767895b6e.61.1792233001550; Sat, 17 Oct 2026
 03:30:01 -0700 (PDT)
Date: Sat, 17 Oct 2026 03:30:01 -0700
In-Reply-To: <20261017092004.650-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad34e29.6814cce4.34c49f.0055.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: trying to register non-static key in __nvmet_fc_free_assocs

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 6854 Comm: syz.0.124 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:1028
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1343
 __lock_acquire+0x10c/0x2de0 kernel/locking/lockdep.c:5162
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 __nvmet_fc_free_assocs+0x12e/0x430 drivers/nvme/target/fc.c:1492
 nvmet_fc_remove_port+0x2b1/0x360 drivers/nvme/target/fc.c:2949
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5648
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5718
 __do_sys_unlinkat fs/namei.c:5747 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f94beb6e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f94be1ad028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f94bedf6090 RCX: 00007f94beb6e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f94bec05888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f94bedf6128 R14: 00007f94bedf6090 R15: 00007ffc099f6dd8
 </TASK>
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in kernel/locking/qspinlock.h:68:9
index 16382 is out of range for type 'unsigned long[8]'
CPU: 0 UID: 0 PID: 6854 Comm: syz.0.124 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xe8/0xf0 lib/ubsan.c:455
 decode_tail kernel/locking/qspinlock.h:68 [inline]
 __pv_queued_spin_lock_slowpath+0xaf3/0xbc0 kernel/locking/qspinlock.c:307
 pv_queued_spin_lock_slowpath arch/x86/include/asm/paravirt-spinlock.h:37 [inline]
 queued_spin_lock_slowpath arch/x86/include/asm/paravirt-spinlock.h:71 [inline]
 queued_spin_lock include/asm-generic/qspinlock.h:115 [inline]
 do_raw_spin_lock+0x26c/0x2f0 kernel/locking/spinlock_debug.c:116
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:156 [inline]
 _raw_spin_lock_irqsave+0x4c/0x60 kernel/locking/spinlock.c:181
 rtlock_slowlock kernel/locking/rtmutex.c:1921 [inline]
 rtlock_lock kernel/locking/spinlock_rt.c:43 [inline]
 __rt_spin_lock kernel/locking/spinlock_rt.c:49 [inline]
 rt_spin_lock+0x157/0x400 kernel/locking/spinlock_rt.c:57
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 __nvmet_fc_free_assocs+0x12e/0x430 drivers/nvme/target/fc.c:1492
 nvmet_fc_remove_port+0x2b1/0x360 drivers/nvme/target/fc.c:2949
 nvmet_disable_port+0x13e/0x1f0 drivers/nvme/target/core.c:400
 nvmet_port_subsys_drop_link+0x1e8/0x210 drivers/nvme/target/configfs.c:1123
 configfs_unlink+0x44f/0x6b0 fs/configfs/symlink.c:258
 vfs_unlink+0x27b/0x6e0 fs/namei.c:5648
 filename_unlinkat+0x3d3/0x610 fs/namei.c:5718
 __do_sys_unlinkat fs/namei.c:5747 [inline]
 __se_sys_unlinkat+0x83/0x1a0 fs/namei.c:5739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f94beb6e1d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f94be1ad028 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f94bedf6090 RCX: 00007f94beb6e1d9
RDX: 0000000000000000 RSI: 0000200000000780 RDI: ffffffffffffff9c
RBP: 00007f94bec05888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f94bedf6128 R14: 00007f94bedf6090 R15: 00007ffc099f6dd8
 </TASK>
---[ end trace ]---


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d88031580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d7f67f980000

