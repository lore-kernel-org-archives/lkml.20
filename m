Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C27945A288
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323356; cv=none; b=nSbWDIYVwBRZJcPV2VhIgijVszE9rtoHxQNM7vADZP+VdxKjCeHmhPG8rAnT+1zQcaH4sGrauYaDL+wWYCBNvk1xZFngTOW6ZAbpkhpgihH/CEl+hRjEiidgwUGu8K30Ct4LSNXoATJvIA0NELufDEArxrKS4LTDbndT9d9Vxus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323356; c=relaxed/simple;
	bh=qNr6Apk3Godwi/9ImXuWGabmY96dx2BaJxTeEFghH6E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PLp1hKt+5ALlhlv82UbPXWLRKezR3HwojIlo9Snvmv+OmlT0eN8hCEGMrDkO2TAWrPt2rOnUxMp6IksUY5z2YO/hEEVfSPvdaprrmIfIPfObx6h05HS/+EQb0FGHYVz7F+bkhiC4mCrm7uTvNiZDLSNHCOqs/jf+d7N5KtiTkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so1118986b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323354; x=1790928154;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+JdXLViuf1GiHiJeHTfCLCCXl9xI/LP8+sA7j9T/9hY=;
        b=B0mN6ED5FIhaGOQgi4VPOk62l0DFBarcyNgls4+YZJel6qolOgqTvqdyICIlJ+NuXP
         jXWlfkpuOnzJcR17vxNdWP+2LAbZcshsfc973LVOAGBvgNmndk0WuT6A/60BkmTmVq1a
         WwIjbdt3PXfllvtwAU5AUR468TRtjEbgk9oDe2FM1ZuxK/mg0C+w2e9Z6lp/EoXfD6e5
         V0sEwtMuXZ790v96WCCnBVuWTSFRQS0YDzaMLJzbPiP5OrU52hyD1s2//EI0yGKt0L2T
         9aW/u2S6/Kw36u7u7ZkVOE07e/Go7nF+q/lhxoRTdu/QwYnw5LqvhG0rR2jpjixjBM9l
         jU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzlHWGC6lJcTnMlXymI3hjDBJ1D3N6DPt0sij2kd50K/JXwpKWleCQlQKfsd6EplUHgCAUwhHKjLdMO6k=@vger.kernel.org
X-Gm-Message-State: AFuF++nztQFlRrBr2qsEJTmYxzYhIEEVCfA5WCV/8hPdACJLug7sJPsr
	KvPQb105srh8gvGEhe+URuXjgVbkKBWSzDfgApv8J1yUAQYAzpuk5HFOwbPUdv2ibenwcYQ9mFU
	GNsUsn9eKhv+ADWFo0tAAJnU5oHNNSN7uS5KLXis2I0nF96vdJqhl+wi4/Nc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1642:b0:4d6:9133:cfe0 with SMTP id
 5614622812f47-4d72cd32638mr3804097b6e.37.1790323354036; Fri, 25 Sep 2026
 01:02:34 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:02:34 -0700
In-Reply-To: <6a895324.ae6ddae5.3da009.0053.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab62a9a.7eec07f4.c25c.0004.GAE@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in lookup_open
From: syzbot <syzbot+c39ae720fb00e7e6f14b@syzkaller.appspotmail.com>
To: a.hindborg@kernel.org, gregkh@linuxfoundation.org, leitao@debian.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    5fc5768c7ca9 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a7a2c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a820d8842c77560
dashboard link: https://syzkaller.appspot.com/bug?extid=c39ae720fb00e7e6f14b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1562fc05580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1409ed25580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-5fc5768c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2038b7f58a0e/vmlinux-5fc5768c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f03bad44e45/bzImage-5fc5768c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c39ae720fb00e7e6f14b@syzkaller.appspotmail.com

LUN: removable file: (no medium)
============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.17/5921 is trying to acquire lock:
ffff888022716460 (sb_writers#12){.+.+}-{0:0}, at: lookup_open+0x150/0x1990 fs/namei.c:4451

but task is already holding lock:
ffff888022716460 (sb_writers#12){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sb_writers#12);
  lock(sb_writers#12);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

locks held by syz.0.17/5921: 4, last CPU#1:
 #0: ffff888022716460 (sb_writers#12){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #1: ffff88802a22f280 (&buffer->mutex){+.+.}-{4:4}, at: configfs_write_iter+0x76/0x4e0 fs/configfs/file.c:226
 #2: ffff888023773970 (&p->frag_sem){.+.+}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #2: ffff888023773970 (&p->frag_sem){.+.+}-{4:4}, at: configfs_write_iter+0x218/0x4e0 fs/configfs/file.c:229
 #3: ffff888024051120 (&common->filesem){+.+.}-{4:4}, at: fsg_store_file+0x193/0x450 drivers/usb/gadget/function/storage_common.c:452

stack backtrace:
CPU: 1 UID: 0 PID: 5921 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
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
 percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
 percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
 __sb_start_write include/linux/fs/super.h:19 [inline]
 sb_start_write include/linux/fs/super.h:125 [inline]
 mnt_want_write+0x6f/0x420 fs/namespace.c:494
 lookup_open+0x150/0x1990 fs/namei.c:4451
 open_last_lookups fs/namei.c:4767 [inline]
 path_openat+0xa2c/0x2440 fs/namei.c:4997
 do_file_open+0x20e/0x430 fs/namei.c:5029
 file_open_name+0x1c3/0x3e0 fs/open.c:1375
 filp_open+0x2e/0x50 fs/open.c:1392
 fsg_lun_open+0x6b/0x7b0 drivers/usb/gadget/function/storage_common.c:194
 fsg_store_file+0x1e7/0x450 drivers/usb/gadget/function/storage_common.c:455
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf701efec
Code: Unable to access opcode bytes at 0xf701efc2.
RSP: 002b:00000000ff91c89c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000800003c0
RDX: 0000000000000005 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
mass_storage.0/lun.0: unable to open backing file: file0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
