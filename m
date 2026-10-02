Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113233AD9B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977055; cv=none; b=XcUQqH3IKZJ3QfeX4VOF5QGXiq5Qiwvl37q+czy7ycD07rQEXezozvwniGKbpH0IZzrVtOyHrt74t9qvAZVNTbQMcXpNAUaNr9T5kQ5AbGRTGaEz4j5rBgImNva5h9iI6A4FgTdjhaX/GSlVLj/VKsLHIxL4WboHgA39STvK+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977055; c=relaxed/simple;
	bh=SUjaD6tIerY+rYMMjTk6ZmP0ta+AXSZOoHHDkrV3fkY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ISQA+VE6QGMn8dD+/4vqQ+r48ciKQ4o2gbEPX0oM0FxV4UvMMb6rZoo0ExtkC4khDys9Tduxr2o7d1+dVbnfBVduqyA0Njcb2WxcQsjlWKlhaotDFCmkvTVgx2AVP11txltDKO/DepfZW1YaT6ESzqJ+nn8Fn4cSwwjuHIfnqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab1so498275b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977052; x=1791581852;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zn2F5X3Pz1I49VxF138KyXhfQ5DCV5OswZnHiOYaRMk=;
        b=WkX9mb4tMqAQfYK2n5Ftp6tnIY08oLgvrrJSdw8TBFxB/jSwMqIg5ExZ4mZc36+cjL
         7PP6bWS8zJsux8MCt4SMBKIqvmKSDP6rwnOkxtF8RoxPiud6GoC2jijzohdS7LKU3RQk
         Xl0SKZbt7hsFun/XtWbKkj+fwNIClgVs9QsA7nilOccA2mAjnqnLBLliTI7n9bbz2zjg
         uNvuN5uKew4BAsc9D/PDyr0pP1cBOZ1LLO/gsZz/rNEPWbcNjSgkEgk03Gl0CxbG3V5k
         x8agtchKJr6/hW37uy1ZyZHLnTMQk8XQTt+MPrp9h37mNJ4gEOimVk0cZzNtgM6IdlLk
         2ltw==
X-Gm-Message-State: AFuF++ndh2Lz/Ge6+4x/fKO16kAI2LkvGFndONkYH9ZC45yP2ZGB6MeJ
	9yTfs5oW433o8tvProQpzhCP7SYEvxa1si3omZjA4P1xJlxiujs6yM82Iep1RzDpxPkVoklrnI1
	4k4ZkFADJGHgPQIImUlN8sPCOkypafpKktM75fP6zuwIijH90iNtumyKHiAM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2206:b0:4e6:76eb:b991 with SMTP id
 5614622812f47-4f30a64c83cmr5348302b6e.29.1790977052608; Fri, 02 Oct 2026
 14:37:32 -0700 (PDT)
Date: Fri, 02 Oct 2026 14:37:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0241c.34119e79.2f92f3.000a.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in do_notify_parent_cldstop /
 wait_consider_task (4)
From: syzbot <syzbot+0f4d5234b6cb5e479e5d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5e0f8396d480 Merge tag 'hid-for-linus-2026100201' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a48bf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=0f4d5234b6cb5e479e5d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a60e785a1197/disk-5e0f8396.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a44e17a91920/vmlinux-5e0f8396.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3cc64997d7b1/bzImage-5e0f8396.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f4d5234b6cb5e479e5d@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in do_notify_parent_cldstop / wait_consider_task

write to 0xffff8881049cca94 of 4 bytes by task 6287 on cpu 0:
 wait_task_stopped kernel/exit.c:1369 [inline]
 wait_consider_task+0x5db/0x15f0 kernel/exit.c:1555
 do_wait_pid kernel/exit.c:1657 [inline]
 __do_wait+0x33c/0x500 kernel/exit.c:1692
 do_wait+0xb6/0x230 kernel/exit.c:1733
 kernel_wait4+0x19f/0x210 kernel/exit.c:1892
 __do_sys_wait4 kernel/exit.c:1920 [inline]
 __se_sys_wait4 kernel/exit.c:1916 [inline]
 __x64_sys_wait4+0x91/0x120 kernel/exit.c:1916
 x64_sys_call+0x108f/0x2550 arch/x86/include/generated/asm/syscalls_64.h:62
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x360 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff8881049cca94 of 4 bytes by task 6289 on cpu 1:
 do_notify_parent_cldstop+0x1fa/0x2f0 kernel/signal.c:2396
 ptrace_stop+0x2fa/0x590 kernel/signal.c:2514
 ptrace_signal+0x52/0x240 kernel/signal.c:2820
 get_signal+0x799/0xf10 kernel/signal.c:2999
 arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x15d/0x8c0 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x212/0x360 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x00000013 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 6289 Comm: syz.3.813 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
==================================================================


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
