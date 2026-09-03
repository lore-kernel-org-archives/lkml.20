Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923F3F6C2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418480; cv=none; b=amxpS8T4xGU17NS+tzCpKcxf3hs0fEUIxOSi61Gp67KI0h/3B5NvNLl9eWBw0/TkyJBY3orotZohBOO/69s1knU8bN7rhyHyQ+QehqmmhleHvgVYpEoL7WBRn+WIv1ZTlNr14QybQoUsAsxrdBlHc2pdCOhNz4TmMCOMd+9f8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418480; c=relaxed/simple;
	bh=Qk7JMVDOt8bUBu23DD49V73AcR8I5tg2V2x3kWytuxk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ktffwXdKn7BuIYSaFs7reg5KuuVAXxeIAVJTs9XeS+G662TxQhMfvofdgUoXI30s4Ue5tpIiANAIHfthJ3USuBjrBoejEMtSbnHp6HcgTDmvAgFb1BPd2vAEdWJK1U/XXmEMq1u1Fr1yC3ubyuk++YxFljwB7/jaN16+DUluQ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b137c364c5so449899eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418476; x=1789023276;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwI7Xo9hSQHK24RfkbIjNHcsHorYZKwUbq5kiJ9yFCo=;
        b=Np7jDHsBIgiDtnuSmRETIyRaSnAxVk/UKZNl/hsaECIKlvoI2ihnDdBZvPDoe4NCug
         j4UhTZmb/SgV5cwnXCkwH5WAby3X9JLESftmcMYJOxP95zlNCv0F3GE/b/O55ATL99ke
         LlLngOT5kUNgKjBD5nfhOm94mOhA22XRy4HCfiOo1LaiX45YvI3gHTlGAd0Wq98iHHRl
         NAUK15gaU+RPasvfb1wwZB9igDuPs7np/1O4jctQufHK09IfIYA1oCIIZv1UjKaLzA50
         jj9L/QkS0IBxUeQh9nVPKN3dFTaNkkVWVGtZ+BdfgF238JqtId17I/UU5DbVd37qgJ/v
         ftug==
X-Gm-Message-State: AFuF++lZ1sRedYjIlg8vBGlYAqPS1AnPCq444dKkfxQkVZGfBiTluR/A
	45uMmfO6myAV+mLKySOHjR3oMcdpYAhNqAd48Rfois3zO4dmcW2DCG0z9UVLGM0UyzWXuFPHdtP
	hDgxSiMvEwC8bKg6nABpOphQ8XJUosaynQGOK8yPqGrqkKxORZ+u2tqOngL8G0w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1997:b0:6ac:a45e:ff84 with SMTP id
 006d021491bc7-6b47f204f89mr8148319eaf.13.1788418476100; Wed, 02 Sep 2026
 23:54:36 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:54:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in __set_cpus_allowed_ptr_locked
From: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, radu@rendec.net, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08dbfad3f504 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14970349580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=6835d5c11145e4f77057
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13221e25580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17221e25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8aa9167f616f/disk-08dbfad3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec932d59de3/vmlinux-08dbfad3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/86e2243e886e/bzImage-08dbfad3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com

------------[ cut here ]------------
!pending
WARNING: kernel/sched/core.c:3057 at affine_move_task kernel/sched/core.c:3057 [inline], CPU#0: irq/33-virtio1-/1195
WARNING: kernel/sched/core.c:3057 at __set_cpus_allowed_ptr_locked+0x10ff/0x19c0 kernel/sched/core.c:3190, CPU#0: irq/33-virtio1-/1195
Modules linked in:
CPU: 0 UID: 0 PID: 1195 Comm: irq/33-virtio1- Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:affine_move_task kernel/sched/core.c:3057 [inline]
RIP: 0010:__set_cpus_allowed_ptr_locked+0x10ff/0x19c0 kernel/sched/core.c:3190
Code: cf ff ff 48 8b 5c 24 18 48 8d 7b 08 e8 9a 93 09 00 e9 2e fe ff ff 90 0f 0b 90 e9 74 f3 ff ff e8 b7 ee 9d ff e9 dd f8 ff ff 90 <0f> 0b 90 48 8b 3c 24 48 8b 74 24 08 48 8b 54 24 10 e8 2b cf ff ff
RSP: 0018:ffffc9000681f900 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff8880267a84b8 RCX: ffffffff81950a2b
RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff8880267a84b0
RBP: ffffc9000681fb10 R08: ffff8880267a84b7 R09: 1ffff11004cf5096
R10: dffffc0000000000 R11: ffffed1004cf5097 R12: 1ffff11004cf5097
R13: 1ffff92000d03f28 R14: ffff8880267a84b0 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff888125bd6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555581c3f6d0 CR3: 0000000043f1e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __set_cpus_allowed_ptr kernel/sched/core.c:3222 [inline]
 ___migrate_enable+0x19c/0x1f0 kernel/sched/core.c:2486
 __migrate_enable include/linux/sched.h:2471 [inline]
 migrate_enable include/linux/sched.h:2520 [inline]
 __local_bh_enable+0x21c/0x2f0 kernel/softirq.c:273
 __local_bh_enable_ip+0x19f/0x2b0 kernel/softirq.c:328
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 irq_forced_thread_fn+0xe9/0x120 kernel/irq/manage.c:1169
 irq_thread+0x455/0x690 kernel/irq/manage.c:1272
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
