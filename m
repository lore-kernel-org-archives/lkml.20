Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897154137B6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856763; cv=none; b=HTom1BFslexvcE6Mp3O7syjSPFeHvMFoEfDLVLqTniZlHfFK2EKcV8tLlQgOGJjPyN6I8OxTyEbe2UXwoxCR925gzPdWHd81Z3XBryh6Tct/eIlu47MqaJgY+xovNpkcjztpicg6Og+zbiIp04KBhw1H+GAg4Q4HC6nntItUnHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856763; c=relaxed/simple;
	bh=BAty2H8OwA6bKDiDpF/Rjo6SdAVYaHKjVnT3HhDqPww=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sRcuvfp3jelRsFY+G/vacGSms01XDbMmpWtG2JrHq3uNyKHnjvu8W/6eQAcAJebAlNGchYsiuXaSnv2BoT0LyS758t5cMIP9kPgtn3e8eHNKhGQ9owmPDO9ADJQNlHNugtWzVOIZ9i5h074U7zAcPqGpXVtRznRi6H33K8AxDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-4b385b9c4e8so17400b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856760; x=1788461560;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cg/6uiNhQFh+ysBpamnt6t32XVHFUPnInewO/EiDtj0=;
        b=nv20nL4080oxWgUKuGS8Q10JUyoMbjeaLAHLwWiCN6+mPAtGC75RwPiW0URdmKa0wA
         AUQLyGSHW+T17h2scRW5NIVXd1cTEFeGk7Gv0AbceYMjr0kl934YKlxDwh3YMZYpZBCL
         +1bLWm4f6Vf2L8oE66Rv6zZPH3M0dkt0qnG52BAIBGKIFt04ew3VP1YtEj7LedZryqLX
         QMqDwiN7jL0aWXBFVn77Hg+UmEK3tMf39xwFCAOeA9VVh2zxdZHGr3pvpUXxMrt26C5W
         IyksqOjSaSsFbJj5pyGeXm3yfOnoa/pAKynr0q4UUUBQZaHnLIyU2YIk9N54kERJg1Nq
         LEBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGNdOqAExMB+EmEVuflqxDqIjhBK8Qr62FdfGmPwpy+1Juu9IDOHfxd3dm0F9jG4QRPRaWV+q1UaYjV+I=@vger.kernel.org
X-Gm-Message-State: AFuF++l00B7T1OIg7kLK1yDkZeYhVdiWhdlaYmnlLjmCOD7xYcI10i0O
	GyMdIme0oMFFg6EoAeGPy81BaXJaDuxy70uKdFViR3ZrgoAAW/PZmmlTzOL8mA/AXm3+ofi4ROH
	g0DDlzMtb/5/EgksHDx8/4aXjET2LZPjZrdard9UGz05ubzMTuI8UlbDsny0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f51:b0:4b3:1a95:4160 with SMTP id
 5614622812f47-4b39830200emr1086896b6e.18.1787856760454; Thu, 27 Aug 2026
 11:52:40 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:52:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a908778.1d9ded08.62e62.00dc.GAE@google.com>
Subject: [syzbot] [kernel?] Internal error in futex_wake_op
From: syzbot <syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com>
To: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    68f892e99df9 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13dc7415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=417a6b7c02d5d03f9aa6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1512d625580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e2859e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f98dd20a7b98/disk-68f892e9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/441f1ad32549/vmlinux-68f892e9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8da5227b7dc8/Image-68f892e9.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com

futex_wake_op: syz.0.17 tries to shift op by 144; fix this program
Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4917 Comm: syz.0.17 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 83000005 (Nzcv daif -PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
pc : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
pc : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
pc : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
pc : futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302
lr : mte_enable_tco arch/arm64/include/asm/mte-kasan.h:62 [inline]
lr : uaccess_enable_privileged arch/arm64/include/asm/uaccess.h:147 [inline]
lr : __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline]
lr : __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline]
lr : arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline]
lr : futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline]
lr : futex_wake_op+0x43c/0xfe8 kernel/futex/waitwake.c:302
sp : ffff800093197980
x29: ffff800093197b40 x28: 0000000000010000 x27: 0000000000000000
x26: 1fffe00018d2a3ad x25: dfff800000000000 x24: ffff0000c6951d40
x23: ffff0000c6951d6c x22: 0000000000000002 x21: 1fffe00018d2a685
x20: ffff0000c1df3780 x19: ffff0000c695342c x18: 0000000000000000
x17: 72676f7270207369 x16: 687420786966203b x15: 3434312079622070
x14: 6f20746669687320 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 00000000fffffff5 x9 : 0000000000000000
x8 : 0000000000000080 x7 : ffff80008048c60c x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000805b0678
x2 : 0000000000000002 x1 : ffff0000c6951d40 x0 : 0000000000000000
Call trace:
 __llsc_futex_atomic_or arch/arm64/include/asm/futex.h:51 [inline] (P)
 __futex_atomic_or arch/arm64/include/asm/futex.h:239 [inline] (P)
 arch_futex_atomic_op_inuser arch/arm64/include/asm/futex.h:269 [inline] (P)
 futex_atomic_op_inuser kernel/futex/waitwake.c:251 [inline] (P)
 futex_wake_op+0x450/0xfe8 kernel/futex/waitwake.c:302 (P)
 do_futex+0x200/0x378 kernel/futex/syscalls.c:144
 __do_sys_futex kernel/futex/syscalls.c:210 [inline]
 __se_sys_futex kernel/futex/syscalls.c:191 [inline]
 __arm64_sys_futex+0x2e4/0x418 kernel/futex/syscalls.c:191
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
Code: d500409f 1280014a f94057eb f9800171 (885f7d76) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d500409f 	msr	pan, #0x0
   4:	1280014a 	mov	w10, #0xfffffff5            	// #-11
   8:	f94057eb 	ldr	x11, [sp, #168]
   c:	f9800171 	prfm	pstl1strm, [x11]
* 10:	885f7d76 	ldxr	w22, [x11] <-- trapping instruction


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
