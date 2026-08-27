Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD272D5A01
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856694; cv=none; b=e5Pg5F7GhxxW5Xt+x4lyih29xSOc22SaL6jAG9cY+3AR2Lso2b3zJZ39glQGxA7HtnUj9xfUP8C7TwF7vQGd3b3vA9xtGIMhnRJle9neO9apd0tiBJ9liOBaduEj11h9a+svyW9GgNRjFAINhQl91ApcE1z/QFh/Jg8FRdUnoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856694; c=relaxed/simple;
	bh=e9NiSZMM5O+QxG2Hi2hWPOVvH8Ah33DjxmDJ6rQycZE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=paqIawJ03ubz9AEdZQNPjCbn6ExKGpL1atWeXFUuFLrFDxRxALimh/DkRNwk1ekfzabsk1zegVUxDVIUPfjcfV4psKpzNQEapN2YoIEo92mRcXkXSCJ1X2Ki9tfgSdPQhNq9d33shynLuU/cFmQaZ032vZEzW05UJRNxEGc3jhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 46e09a7af769-7f4e2118db8so72547a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856691; x=1788461491;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUI1KAFSHkNBcBwKMaYV6u3V3T28VVwO3XGKDywAWM0=;
        b=G7xlOhsztf5lCaEo8KvE8mraFOhzgFKozdPOqzqrCJGLlzEeo3rRj6uVRfq9+HpmoF
         F6ptTHew4a+9N+z5BFytvXlPj98VKNJ4VWa0cSGOoImUnTvAyK0K3hTkEpJtp2h9VS1/
         cLGvCN+SfUhokDBSSotpRLltE2sSBOnzPqvYLmfd3yz5780Skn26bZ0MwZggSXCNnQhA
         pmlmCViBXfk2O8JJtj9cY7V/XYAiKfMbLeo3Pd0LrhX3+BLeAlWTXDe/3Ac5QvoiVISc
         ClhEmkFWR9Z579xSDq+Z6JlrEQRfRWEqvqkvGI2wbwU0yiayWMGwSF16i3nny+nP5gt1
         HH0g==
X-Gm-Message-State: AFuF++nfJXwaPYuOU9JZMMv64M98nR7tWZUnP3FSQ3RV/Q2h8fEz0s/U
	hNn4PWIvlmcUjUx77cSW1NJCWkc7LzQL/EYRoufFB70V9VOOvUHWg0Dl8+zx+M9o9xIfir3isyV
	bwkPhc9g85DONhh9jIXr2bfLQtMfs+P3z3213tLNE0S0gMOigUg6zZw6jgJscgQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1a07:b0:6b1:b375:481 with SMTP id
 006d021491bc7-6b1c6385308mr784090eaf.0.1787856691372; Thu, 27 Aug 2026
 11:51:31 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:51:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a908733.1d9ded08.62e62.00d9.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: still has locks held in devlink_compat_flash_update
From: syzbot <syzbot+372a7d84708b07f64d9b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mcgrof@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    73ae59e97596 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13005415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d423d3e91ba4f47
dashboard link: https://syzkaller.appspot.com/bug?extid=372a7d84708b07f64d9b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17daf979580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13281625580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-73ae59e9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2edc303b5fba/vmlinux-73ae59e9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2624d8e0a8af/bzImage-73ae59e9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+372a7d84708b07f64d9b@syzkaller.appspotmail.com

====================================
WARNING: syz.1.24/6043 still has locks held!
syzkaller #0 Not tainted
------------------------------------
locks held by syz.1.24/6043: 1, last CPU#3:
 #0: ffff888029f7e258 (&devlink->lock_key#4){+.+.}-{4:4}, at: devlink_compat_flash_update+0xaf/0x360 net/devlink/dev.c:1237

stack backtrace:
CPU: 3 UID: 0 PID: 6043 Comm: syz.1.24 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_held_locks_bug kernel/locking/lockdep.c:6770 [inline]
 debug_check_no_locks_held+0x90/0xa0 kernel/locking/lockdep.c:6778
 try_to_freeze include/linux/freezer.h:62 [inline]
 usermodehelper_read_trylock+0x238/0x250 kernel/umh.c:228
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:157 [inline]
 firmware_fallback_sysfs+0x6d6/0xc60 drivers/base/firmware_loader/fallback.c:248
 _request_firmware+0xfd7/0x13c0 drivers/base/firmware_loader/main.c:898
 request_firmware+0x35/0x50 drivers/base/firmware_loader/main.c:948
 devlink_compat_flash_update+0x191/0x360 net/devlink/dev.c:1248
 dev_ethtool+0x64e/0x6bb0 net/ethtool/ioctl.c:3676
 dev_ioctl+0x63b/0x1070 net/core/dev_ioctl.c:751
 compat_ifr_data_ioctl net/socket.c:3534 [inline]
 compat_sock_ioctl_trans net/socket.c:3564 [inline]
 compat_sock_ioctl+0x4f9/0x760 net/socket.c:3654
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x2cf/0x360 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf6fdefec
Code: Unable to access opcode bytes at 0xf6fdefc2.
RSP: 002b:00000000ff8f659c EFLAGS: 00000292 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000000008946
RDX: 0000000080000040 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
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
