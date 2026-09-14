Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE943B9616
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415920; cv=none; b=TYI5FZvZPInysRSx3jPQOeLrNCCyQYrVSi3AGunnp7uehje71P+pRF7V/2EYYOdiLzVw9ncDPldBcps3idFJrWHGcGK5iOgVlK6+z86nKF4o9EHxwvAsJYk6Qn+C8D4X6jwyOluVKRJrcNmgJ915WQMSSuXHkP2N20c3m9LRPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415920; c=relaxed/simple;
	bh=3kqEkvVCEbgErecUwuK/wE0yb7FqRpWXJcs5N/PL2bs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UwreyDyCin+6luBHZEIOWqzBXpMefUE5ijL+kCqpacIqgXCfK81mLJ59TblVk05ZVZzUqbtqZKhFjIjoqWfXly/Lr5JvHPdFObYVgeVzUU51laoqu7J3AVtVBruXxyaKoyvfCC4LDVH5zQtSZ4U4Zh2B9uAQDBJv1qcGw86Eapw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so854645b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415916; x=1790020716;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qARFW0MIy4Ie65GCDNTf4BdO5sA+2DVEUTUWVMiEKtM=;
        b=yoV9PL4JHwEbCvPKx+wbXNzXMwKl4mU/4t/tePShjiE+MWME72U1iF6AnjwThDdMvD
         6Q/1hBasizJupW4+XrRsdIeSL7JRmErWxviJb5PHLikQHWgRmQK8pvTMLuLj4KFL0dbX
         x3OcPw7yQQ37crCLMm5RC8G620whRCgAoVha4Hck+QucVf0kk5U+3Z+Z9tE4DTq6Zz/B
         4yuNH+JyCeDyXiMA/snDN2SYVi/6FM7aWMr2ya4FKSpTn6Gm0/zkvLbP3dEm6HKPLb6v
         h4pwqHwGSudC7/7ei6ocUJwdKtWLFgkOusxQ1BOxVSPae71Yubwe/7oYbqwVcbIyALmv
         sCcw==
X-Forwarded-Encrypted: i=1; AKwUvBzwi3IrkeN7mwWkffwTBWPB4WlQ4BptJAhOj6oFxJrwyMjXwN+EWerB3AlNJcMFj4FSd8v+p3S1QM3ZrUg=@vger.kernel.org
X-Gm-Message-State: AFuF++kKgLVoKT1TOV2bbmwQ5XYhlrLkuLOYebXe9ygZYBz+PKBvg4ZY
	xVj21P3ouF/EyZldOvxD3V/BIrVJIAbwxaO4dgET0/E9Op0S1b9APbTUyXuE1FP8lstmFXxbNZS
	YXoUozXi2mvjrMDKv1EeiFR5QGRUwasLrTwSLsCd8Fs2N3axfVGgewwBoM4w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2013:b0:6c3:3f02:7514 with SMTP id
 006d021491bc7-6c53fa6fb02mr4204858eaf.5.1789415915775; Mon, 14 Sep 2026
 12:58:35 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:58:35 -0700
In-Reply-To: <6a459145.52c20a74.1f8b39.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa851eb.4c28b7d0.c1bba.001f.GAE@google.com>
Subject: Re: [syzbot] [comedi?] possible deadlock in comedi_do_insn (2)
From: syzbot <syzbot+acd959f649966559199c@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165c9901580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=acd959f649966559199c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12aa2471580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f26601580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-704340f1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e02afc1c5927/vmlinux-704340f1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09cb4a8b3309/bzImage-704340f1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+acd959f649966559199c@syzkaller.appspotmail.com

comedi comedi0: comedi_test: 1000000 microvolt, 100000 microsecond waveform attached
comedi comedi1: comedi_bond: 0:2  attached, 32 channels from 1 devices
============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.17/5908 is trying to acquire lock:
ffff8880339978f0 (&dev->mutex#4){+.+.}-{4:4}, at: comedi_do_insn+0x2e/0x360 drivers/comedi/kcomedilib/kcomedilib_main.c:183

but task is already holding lock:
ffff8880339970f0 (&dev->mutex#4){+.+.}-{4:4}, at: comedi_unlocked_ioctl+0x180/0x3310 drivers/comedi/comedi_fops.c:2290

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&dev->mutex#4);
  lock(&dev->mutex#4);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.0.17/5908: 1, last CPU#1:
 #0: ffff8880339970f0 (&dev->mutex#4){+.+.}-{4:4}, at: comedi_unlocked_ioctl+0x180/0x3310 drivers/comedi/comedi_fops.c:2290

stack backtrace:
CPU: 1 UID: 0 PID: 5908 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
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
 comedi_do_insn+0x2e/0x360 drivers/comedi/kcomedilib/kcomedilib_main.c:183
 comedi_dio_bitfield2+0x3c0/0x420 drivers/comedi/kcomedilib/kcomedilib_main.c:314
 bonding_dio_insn_bits+0x2b9/0x570 drivers/comedi/drivers/comedi_bond.c:100
 parse_insn+0x1326/0x19f0 drivers/comedi/comedi_fops.c:1613
 do_insn_ioctl+0x152/0x4e0 drivers/comedi/comedi_fops.c:1790
 comedi_unlocked_ioctl+0xf68/0x3310 drivers/comedi/comedi_fops.c:2422
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9368f9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcaf8c9638 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f9369225fa0 RCX: 00007f9368f9e159
RDX: 0000200000000400 RSI: 000000008028640c RDI: 0000000000000004
RBP: 00007f936903503b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9369225fac R14: 00007f9369225fa0 R15: 00007f9369225fa0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
