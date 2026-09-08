Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307829B78D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830490; cv=none; b=TV7xPFs3iIUn6Pmm959EVKaWi04gdxGP0dv4/7eqk9l3gYEP9aLXgJSC3jZ0Bny/4VqdcEcvdBmLXpwoA60OZAvJ6Bg2FrHXbS0JR2t3Tv2mBx3H8cN9hQ4EdHqC6QJx2GJONfeL7G0Ue4W1/Ce1G+G/Pk/si23fACVBPum+ZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830490; c=relaxed/simple;
	bh=G4zy9MM1S/C8fB/9Oi6CU2i/qYUdYVqgr+OBjvdamqQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=i8Li7ULPCFB8/2G+yGNGvsDaHiwmnpgLmlRjq17Rn9NuTlpOQpCftKzba6VGalJGjWq/T7eotG3FK6lGnA2gfKmdpqWmgAf1fcF1RHeLfEY/LXd7GbCGFLwZjdlako1FWjgFPHbrkLVDkB9eEfQR+0itg/pNEgKI8YzJrCj26zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6aaf6076546so2141623eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830485; x=1789435285;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QSud1Qdfk+ScoqbW7iGZusn2n1W3X5f04d+3HD3u1I=;
        b=eLAovBG1+IaUmd3gn+0SuJ9NCGOE/rc8T164rGpWtvCDvxv0PoGswplvi1CylmpHd6
         aCwBggmcrJoZmX3A9MyB8U5dnDE/YVv4jp1goIePlabSuWNBFgfw9mAAu566xzTUQNCq
         MaTJDxKnnoY8wN62I01xpQ/NHv923bRAInqd8zCkO07vXyhWFdLQw31y+5q3KMFXXgQg
         uQ4FEIxP+CvrFdyZw50AQUlMwOkL0HWbjPO6FfFB/0A4Y3SQmM+LcBBbx6XWW3/nj0Xr
         wamb0bi8to247HGNoxIECfm8Iv2VvaozQ+EwDuPa9dZjzs5wE+09sMlouYXYFUGelAPb
         Q7hw==
X-Forwarded-Encrypted: i=1; AKwUvBxkGWI2ZJ3hC+W/tPYXpUG5Eh23ZopG4RascnXY9XIxs4rc+qpDI8vKBTg+AXLXGYN1svJmXobuUfOxSDM=@vger.kernel.org
X-Gm-Message-State: AFuF++mibX1RmdVa3YPetIxcvUFS/GBTntCS1HHX/Vtq3ApJWa3tUSKi
	6iLvUj94wlNd06eu9vgm7pys6D0bjDhk84GWSrcymo/XvdPFP3CrbDJQhHL53axQFO+jYkX2WLl
	9neAchP1JvKcVngSTehHmZc1jsL+y5YQ5xZZYr35rlaPwpiySzLmFwgaakL4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:624:b0:6b8:ef7d:e181 with SMTP id
 006d021491bc7-6b8ef7de33cmr8964649eaf.54.1788830485042; Mon, 07 Sep 2026
 18:21:25 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:21:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f6315.6e6c5f9e.28f11f.0002.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in vma_add_pgoff
From: syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1517ecf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147ad125580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=127ad125580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: mm/vma.h:277 at assert_sane_pgoff mm/vma.h:277 [inline], CPU#1: syz.0.17/4912
WARNING: mm/vma.h:277 at vma_set_pgoff mm/vma.h:283 [inline], CPU#1: syz.0.17/4912
WARNING: mm/vma.h:277 at vma_add_pgoff+0x50c/0x700 mm/vma.h:314, CPU#1: syz.0.17/4912
Modules linked in:
CPU: 1 UID: 0 PID: 4912 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : assert_sane_pgoff mm/vma.h:277 [inline]
pc : vma_set_pgoff mm/vma.h:283 [inline]
pc : vma_add_pgoff+0x50c/0x700 mm/vma.h:314
lr : assert_sane_pgoff mm/vma.h:277 [inline]
lr : vma_set_pgoff mm/vma.h:283 [inline]
lr : vma_add_pgoff+0x50c/0x700 mm/vma.h:314
sp : ffff8000963176e0
x29: ffff800096317700 x28: 1fffe00019d174aa x27: 0000000000000001
x26: ffff0000c659b700 x25: dfff800000000000 x24: 1fffe00019d174b0
x23: ffff0000ce8ba580 x22: 0000000000020a97 x21: ffff0000ce8ba548
x20: ffff0000ce8ba500 x19: 0000000020001000 x18: 1fffe00035ba3828
x17: ffff800080adeaf4 x16: ffff800080addecc x15: ffff800080b8bf18
x14: ffff800080b96bac x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff800080bee7b0 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff800080ae89e0
x2 : 0000000000020001 x1 : ffff0000c825bb00 x0 : 0000000000000000
Call trace:
 assert_sane_pgoff mm/vma.h:277 [inline] (P)
 vma_set_pgoff mm/vma.h:283 [inline] (P)
 vma_add_pgoff+0x50c/0x700 mm/vma.h:314 (P)
 __split_vma+0x6a8/0x83c mm/vma.c:607
 split_vma mm/vma.c:643 [inline]
 vma_modify+0x11ac/0x18f0 mm/vma.c:1771
 vma_modify_policy+0x210/0x2b8 mm/vma.c:1834
 mbind_range+0x160/0x3e4 mm/mempolicy.c:1061
 do_mbind mm/mempolicy.c:1563 [inline]
 kernel_mbind mm/mempolicy.c:1760 [inline]
 __do_sys_mbind mm/mempolicy.c:1834 [inline]
 __se_sys_mbind mm/mempolicy.c:1830 [inline]
 __arm64_sys_mbind+0x5c8/0x994 mm/mempolicy.c:1830
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
irq event stamp: 928
hardirqs last  enabled at (927): [<ffff8000869a9950>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:210 [inline]
hardirqs last  enabled at (927): [<ffff8000869a9950>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:221
hardirqs last disabled at (928): [<ffff8000869841d4>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:445
softirqs last  enabled at (208): [<ffff80008013891c>] local_bh_enable include/linux/bottom_half.h:33 [inline]
softirqs last  enabled at (208): [<ffff80008013891c>] put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
softirqs last  enabled at (208): [<ffff80008013891c>] do_sve_acc+0x32c/0x4b8 arch/arm64/kernel/fpsimd.c:1349
softirqs last disabled at (206): [<ffff8000801386fc>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (206): [<ffff8000801386fc>] get_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:234 [inline]
softirqs last disabled at (206): [<ffff8000801386fc>] do_sve_acc+0x10c/0x4b8 arch/arm64/kernel/fpsimd.c:1325
---[ end trace 0000000000000000 ]---


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
