Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5648F02B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905373; cv=none; b=XESM9cIK3ZlkdZSR2qVwblDEiRiIilP/3WAVyxVCwD4+cW/tU2olvyI/nGs370bjjVrJAV1CwJ9lXnHNDNWyrwHzvXcKhDyteWmiibm5hWT1bmBkj2CxqZCqxLeIFu5FpZTqEyix5M5GIQ1u9bZbmRip/VNVuY3l6BHztYo9gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905373; c=relaxed/simple;
	bh=EHKt9NbYGUymC36MfbAZsmTODDY5Vpw10DdNt/YJmD8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=NpmCmAeaPzFD/XM+7kisiNqhJycctUaHIKLOMMiMWuu/Q5og+okklh/cxI0ujJ9B0Ok+nluUwokQVT2dRgav8VOOLYIfe4dcbLKSTWBloVAXUXRbAeY2GrQQ0FGgMoaeNxNbQHqzPazhky8Fuq8BKhSzJ6NhuWoarBVlEY/ZtPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4b98ca6c270so4028146b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788905371; x=1789510171;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yp9bCBXeuGxq5t7CMR4zntq9fAV1aiG8/Y6iDz55CQo=;
        b=jQA9Ml/XjQYbPUVfAOsymGnQa3XgywLTBadMASl+etjtCWvTiLrExW8WsNLgv0iDLy
         amqqxrdmliL7YE7PE/nQzA7WoF1Ii7KqgFWtkLwg8+6KTMm2h/vHCUn5K9aWW5FwCssd
         GRJssJ4e4cXmKvZJEIIaMzbSlbZrFDslaGavVdeN518Zyi68bqIM/GUKM/S0uR35tSiH
         zDGoyDVchTgdIwSv5UrfMB3AoiLBMngOFfpTb30j2HfD2+hoGpVlLuc+ko/Ysw5MrbHJ
         ion0FCxrKiF6Hb68kq0rcX90WdIAdhsuWcpdtYcS0ei3QJwP+0C05TCYEzd4pmLYhm4J
         SVuw==
X-Forwarded-Encrypted: i=1; AKwUvByWQ3OGZfiJQBNdpHoBalhhNnINtXktlyNeFgg8CwVg0bWtGbF58VPKb40fJKVkNMe5Nr0mghmY9H/l8ic=@vger.kernel.org
X-Gm-Message-State: AFuF++l29VeFg1KVDQT4bki4rbXrTRLNCOYkwevD0D8Kinit2iZ3b37r
	TxEr55meZuENk+yPYGP12rwOYck9n1ay0wh2ct4GJUMHiKDTAP7U8o09TQO3GT5RjqoWqmV5feI
	MF34qOGsUv+9H+RNtW1CmmGMIZIo655i7ZWKPUMISRWbt9WrbgxxdB4ka+9s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2007:b0:6b5:ec2f:356e with SMTP id
 006d021491bc7-6b5ec2f3676mr14259111eaf.31.1788905371100; Tue, 08 Sep 2026
 15:09:31 -0700 (PDT)
Date: Tue, 08 Sep 2026 15:09:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0879b.f81106d8.285f0a.0006.GAE@google.com>
Subject: [syzbot] [kernel?] Internal error in futex_cmpxchg_value_locked
From: syzbot <syzbot+635d160c0d4133481520@syzkaller.appspotmail.com>
To: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16f87125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=635d160c0d4133481520
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f87125580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107f3af9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+635d160c0d4133481520@syzkaller.appspotmail.com

Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4916 Comm: syz.0.17 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 83000005 (Nzcv daif -PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __llsc_futex_cmpxchg arch/arm64/include/asm/futex.h:64 [inline]
pc : __futex_cmpxchg arch/arm64/include/asm/futex.h:247 [inline]
pc : futex_atomic_cmpxchg_inatomic arch/arm64/include/asm/futex.h:295 [inline]
pc : futex_cmpxchg_value_locked+0x114/0x394 kernel/futex/futex.h:295
lr : access_ok arch/arm64/include/asm/uaccess.h:45 [inline]
lr : futex_atomic_cmpxchg_inatomic arch/arm64/include/asm/futex.h:290 [inline]
lr : futex_cmpxchg_value_locked+0xc8/0x394 kernel/futex/futex.h:295
sp : ffff80009ab17750
x29: ffff80009ab17770 x28: 1fffe000189dc765 x27: ffff0000c4ee3b2c
x26: 1fffe000189dca44 x25: dfff800000000000 x24: 0000000000000000
x23: 0000000000000000 x22: 000000008f0101ff x21: 000000000f0101ff
x20: 000ffffffffffffd x19: ffff0000c4ee5224 x18: 0000000000000000
x17: ffff8000805acb44 x16: ffff8000805ac7e0 x15: ffff8000805b05f8
x14: ffff8000805aea98 x13: 0000000000000009 x12: 0000000000000000
x11: 0000000072c79ec1 x10: 0000000000000080 x9 : 00000000fffffff5
x8 : 0000000000000000 x7 : ffff800080375350 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000805b145c
x2 : 0000000000000000 x1 : ffff0000c4ee3b00 x0 : 0000000000000000
Call trace:
 __llsc_futex_cmpxchg arch/arm64/include/asm/futex.h:64 [inline] (P)
 __futex_cmpxchg arch/arm64/include/asm/futex.h:247 [inline] (P)
 futex_atomic_cmpxchg_inatomic arch/arm64/include/asm/futex.h:295 [inline] (P)
 futex_cmpxchg_value_locked+0x114/0x394 kernel/futex/futex.h:295 (P)
 lock_pi_update_atomic+0x58/0xd4 kernel/futex/pi.c:549
 futex_lock_pi_atomic+0x28c/0x898 kernel/futex/pi.c:666
 futex_lock_pi+0x248/0x6e0 kernel/futex/pi.c:1018
 do_futex+0x2f8/0x378 kernel/futex/syscalls.c:-1
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
Code: 2a1f03e0 12800149 d500409f f9800111 (885f7d14) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	2a1f03e0 	mov	w0, wzr
   4:	12800149 	mov	w9, #0xfffffff5            	// #-11
   8:	d500409f 	msr	pan, #0x0
   c:	f9800111 	prfm	pstl1strm, [x8]
* 10:	885f7d14 	ldxr	w20, [x8] <-- trapping instruction


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
