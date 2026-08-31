Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8C352032
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177163; cv=none; b=k6pnzq2UMZKj5+WZTzF/KfszHPdyks1UK/XyOIAD5GCTtMRaojAiLVc71bXu2CZaSK53gxOoa2V+kq9dIoj61v6TRljKNNVYPS7VyH1B7Om1Zv/yUkLshzgEVh1loaez0w6dHZyZSCPaTlTs2wjPrBcFEvrC3930o+uuVDYE9Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177163; c=relaxed/simple;
	bh=9n+Mk4K0fIelCSLpqaZBGj1DZvjZ3ipNVua+6/YVvf4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HQX1Gf4mo4CXFnVGiPPKq7tGb47NTO8zeoIpZLa10aeHbgpyYkz28jSNQJf6k84AKIMyNWk2uH6QDYkZITxyse2UwRgemQmcP40p+f6b3K68mpayTU0ZGRQucSFal4YqvsmnKH+jBjCd3H5qf/POgNzGS/5i+wCaa+OgzD61Ljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b38bf64bfcso1648758b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177161; x=1788781961;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSj+FgCyTCFYNIVCb+6sDGUzWg+oDo2qopxDWPlT5eY=;
        b=LmB/ZfHQs+Nz+cRjLkequQ5oCyaZpi/L7r204Wk4q6oroAHV9+OZbi1iCRv4BPp86P
         JCJiJ5yg8aBsOT5QoHqkeUftxNy1F7AzgXqHRrcdEF6PvkgW+pAODKFqqPNip+k321hU
         QldvaNBi9l1T+jgE3dfavXvZ5azKfLMfRA+twZ08sj9Oyv1IcMSVBgyoNXGPYrBETtGM
         slMwGZNkAyRH/0wvYAfTO8tpzfSd9h3zkuI7fTQEhHR5/HuQmFvPot2jG1cz9xyf4v8V
         lB1Ign5Bl/OYDIW3Cm+EcwpSji6l8eK/s00n/JiYeg5QWSzk/GwGCdh+sfU5miOdfYY5
         f++g==
X-Forwarded-Encrypted: i=1; AHgh+RpO6Q3947A8aizuxz622XrZwijSpOagyRfxX+Aw6M6XADIALR0y5J6Kj2LT2J022qtpqtdjWT6Qy21ATvU=@vger.kernel.org
X-Gm-Message-State: AFuF++lPHxx0A25NeFE7VinZgfYdJ/anglFB/JKGDCu1oDdi+YU4NjXQ
	jP6A4dx3t0pVINMuxl3itvAmfIyqjoe0qQsXPjIOYXBsQ0RfBLv9FLj3hgd41jN2jjKWjDdvOUN
	9QBpsA20uXwG5x0KsmFR7pqUxJoPC9zzcsXGLyIyfRT9C/VYTxI/5DX8+uGQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:144d:b0:496:a36:b5e5 with SMTP id
 5614622812f47-4b398320519mr29397343b6e.17.1788177161159; Mon, 31 Aug 2026
 04:52:41 -0700 (PDT)
Date: Mon, 31 Aug 2026 04:52:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a956b09.7724083a.12295.0008.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel paging request in gs_close
From: syzbot <syzbot+782b2f1063e38ba8fa6e@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1128d279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=782b2f1063e38ba8fa6e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+782b2f1063e38ba8fa6e@syzkaller.appspotmail.com

 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x41c/0x590 lib/fault-inject.c:174
 should_failslab+0xc4/0x120 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4539 [inline]
 slab_alloc_node mm/slub.c:4897 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_node_noprof+0x10c/0x6d8 mm/slub.c:5346
 _kmalloc_array_node_noprof include/linux/slab.h:1294 [inline]
 __kfifo_alloc_node+0x10c/0x208 lib/kfifo.c:44
 __kfifo_alloc include/linux/kfifo.h:932 [inline]
 gs_open+0x144/0x514 drivers/usb/gadget/function/u_serial.c:636
 tty_open+0x404/0x89c drivers/tty/tty_io.c:2137
 chrdev_open+0x398/0x3e8 fs/char_dev.c:411
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21fc/0x2a60 fs/namei.c:4863
 do_file_open+0x1c8/0x2e8 fs/namei.c:4892
 do_sys_openat2+0x114/0x1e8 fs/open.c:1368
 do_sys_open+0xb0/0xe0 fs/open.c:1374
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1385
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
Unable to handle kernel paging request at virtual address dfff800000000074
KASAN: null-ptr-deref in range [0x00000000000003a0-0x00000000000003a7]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff800000000074] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 7402 Comm: syz.3.667 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 234000c5 (nzCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : kasan_byte_accessible+0xc/0x1c mm/kasan/generic.c:210
lr : __kasan_check_byte+0x20/0x54 mm/kasan/common.c:573
sp : ffff800095667300
x29: ffff800095667300 x28: ffff800088b3a000 x27: ffff0000c9fed7c0
x26: 1ded8000869306f0 x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000000 x22: 00000000000003a0 x21: 00000000000003a0
x20: 0000000000000000 x19: ffff8000869306f0 x18: 1fffe00034bb7428
x17: 70202c31206c6176 x16: 0000000000000001 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: ffff800080156070 x10: 0000000000000003 x9 : dfff800000000000
x8 : 0000000000000074 x7 : 0000000000000000 x6 : ffff800083655754
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : ffff8000869306f0 x0 : 00000000000003a0
Call trace:
 kasan_mem_to_shadow include/linux/kasan.h:65 [inline] (P)
 kasan_byte_accessible+0xc/0x1c mm/kasan/generic.c:210 (P)
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0xa4/0x364 kernel/locking/lockdep.c:5842
 __raw_spin_lock_irq include/linux/spinlock_api_smp.h:142 [inline]
 _raw_spin_lock_irq+0x58/0x70 kernel/locking/spinlock.c:174
 spin_lock_irq include/linux/spinlock.h:372 [inline]
 gs_close+0xac/0x65c drivers/usb/gadget/function/u_serial.c:698
 tty_release+0x2c4/0xffc drivers/tty/tty_io.c:1745
 tty_open+0x46c/0x89c drivers/tty/tty_io.c:2146
 chrdev_open+0x398/0x3e8 fs/char_dev.c:411
 do_dentry_open+0x5c4/0xfc0 fs/open.c:947
 vfs_open+0x44/0x2dc fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21fc/0x2a60 fs/namei.c:4863
 do_file_open+0x1c8/0x2e8 fs/namei.c:4892
 do_sys_openat2+0x114/0x1e8 fs/open.c:1368
 do_sys_open+0xb0/0xe0 fs/open.c:1374
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1385
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
Code: 17ffffec d343fc08 d2d00009 f2fbffe9 (38696908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	17ffffec 	b	0xffffffffffffffb0
   4:	d343fc08 	lsr	x8, x0, #3
   8:	d2d00009 	mov	x9, #0x800000000000        	// #140737488355328
   c:	f2fbffe9 	movk	x9, #0xdfff, lsl #48
* 10:	38696908 	ldrb	w8, [x8, x9] <-- trapping instruction


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
