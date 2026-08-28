Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3039354AE3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931398; cv=none; b=h3p7kFahDimzLTgL9BzJGYg3v1COvflhuY0j+mUjO3miApKeitUS9A1fJ+1PCS9MKpcedheVv7D5ZeWsivRM+3FUPPlv2xQIR8JE0GNfDEpg+Os0PsH0a95ragfo1/h7AZ8wjiGPSlwSbMRYmMEYdjJp049p+5Ak53tq2Y/Knek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931398; c=relaxed/simple;
	bh=nkCyAzEy+G8/YoFSNsOuG1R/GMMMqtkohNl0ZN2Z/w0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Be6vYbiowwXslKiu8pNnoMKCsEn95Kf8HXBj+sspD5iCRz1pBarAf4Q2z3ymYBR8nJQadEW5gTbQ50pfXmArdH/61Kei6AX8DExDUEIHmSkae5u4VOLF1lLhrVu4fMkuanGNeppQhk/1q6yofs2ErSlxZYGxfoIUwOAdBTUwUOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b38bf64bfcso495580b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931396; x=1788536196;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLO+M9qzK5BKxKRgKWqPPnH5+24Be7UFhWV4yMdQ8kQ=;
        b=SdoQ3RUwUmxgPZcB33Y+Cd48biBt0y0qbYqUbEMjcZiYlCXYHlYeGOg+zfPNe6YCGf
         NbFlcNdT9uKxrJ4eGFtzNTAkiQxyDFSh1qsh/yXdIEk2YNY/fsqzWcpNyVlbeR9NYG3y
         1ty3hk+80RLHSMczdWiTMkZz85nlcSDrbiiPTjyJxWX1WBL2sV3FGTPEtAw14WLBW/R2
         KIP/m4oFn/jNH27Rz2Yz7Ew9ENGRwwgNkFE/+8nsR7bCuq2LzeeCtFt6JfJlYZtzzKJu
         2hOhw6/QAyn5uIl1eNqQxalvRHbzJf+IOtaAsb+SDcVyzA1cpZPJyN3EhXMLFyQJo4k/
         e+6w==
X-Gm-Message-State: AFuF++lRGfqOid92wp+4t4lHShnuEIQPh10GAPq7KdHdcgEdvyCdlTym
	YHKdhCQOOjzUyCMzr/fXUATWzjk+9nAZs7kzQmvsxFTadHFS1/7xNMcm4y4ZlrrgM6OFCW9a46M
	imSrGfxtXYPnO7Uz0H5/Uw5+8QO9XyAlaG7uH+sHXXutXReG7UFPGwg4Pej+H2g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:228f:b0:4af:5d69:1cb4 with SMTP id
 5614622812f47-4b39826ab9amr9382178b6e.15.1787931395802; Fri, 28 Aug 2026
 08:36:35 -0700 (PDT)
Date: Fri, 28 Aug 2026 08:36:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a91ab03.1d9ded08.62e62.00f0.GAE@google.com>
Subject: [syzbot] [media?] WARNING in dvb_frontend_release
From: syzbot <syzbot+2528bcebd696f88fdb4c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0a0d1d55dad5 Merge tag 'scftorture.2026.08.18a' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17a3b19e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a73a22d959389384
dashboard link: https://syzkaller.appspot.com/bug?extid=2528bcebd696f88fdb4c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b6c177362f10/disk-0a0d1d55.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f2c3243ec7e8/vmlinux-0a0d1d55.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c41f358fc565/bzImage-0a0d1d55.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2528bcebd696f88fdb4c@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU#0: syz.8.552/9005
WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x944/0x1bc0 kernel/locking/mutex.c:821, CPU#0: syz.8.552/9005
Modules linked in:
CPU: 0 UID: 0 PID: 9005 Comm: syz.8.552 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
RIP: 0010:__mutex_lock+0x94b/0x1bc0 kernel/locking/mutex.c:821
Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 b4 10 00 00 44 8b 05 b8 a2 78 05 45 85 c0 75 13 48 8d 3d ac a7 7b 05 48 c7 c6 e0 d3 ef 8b <67> 48 0f b9 3a 90 e9 1b f8 ff ff 4d 8d a7 f0 0a 00 00 4c 89 e7 e8
RSP: 0018:ffffc90003417b40 EFLAGS: 00010246
RAX: 0000000000000003 RBX: ffff88801efcd318 RCX: 1ffffffff2289aec
RDX: 0000000000000000 RSI: ffffffff8befd3e0 RDI: ffffffff9147dc60
RBP: ffffc90003417cb0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: dffffc0000000000 R15: ffff88801efcd1c0
FS:  0000000000000000(0000) GS:ffff888123b7b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32d24000 CR3: 000000007627c000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 dvb_frontend_release+0x2f2/0x5d0 drivers/media/dvb-core/dvb_frontend.c:2944
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x951/0x2ae0 kernel/exit.c:1008
 __do_sys_exit kernel/exit.c:1118 [inline]
 __se_sys_exit kernel/exit.c:1116 [inline]
 __x64_sys_exit+0x42/0x50 kernel/exit.c:1116
 x64_sys_call+0x156c/0x1570 arch/x86/include/generated/asm/syscalls_64.h:61
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9732d9e0d9
Code: Unable to access opcode bytes at 0x7f9732d9e0af.
RSP: 002b:00007f9730ff5ef8 EFLAGS: 00000246 ORIG_RAX: 000000000000003c
RAX: ffffffffffffffda RBX: 0000000000000058 RCX: 00007f9732d9e0d9
RDX: 00007f9730ff69c8 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007f9732e35024 R08: 0000000000000000 R09: 0000000000000058
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9733026038 R14: 00007f9733025fa0 R15: 00007fff990920b8
 </TASK>
----------------
Code disassembly (best guess):
   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   4:	38 d0                	cmp    %dl,%al
   6:	7c 08                	jl     0x10
   8:	84 d2                	test   %dl,%dl
   a:	0f 85 b4 10 00 00    	jne    0x10c4
  10:	44 8b 05 b8 a2 78 05 	mov    0x578a2b8(%rip),%r8d        # 0x578a2cf
  17:	45 85 c0             	test   %r8d,%r8d
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d ac a7 7b 05 	lea    0x57ba7ac(%rip),%rdi        # 0x57ba7cf
  23:	48 c7 c6 e0 d3 ef 8b 	mov    $0xffffffff8befd3e0,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 1b f8 ff ff       	jmp    0xfffff850
  35:	4d 8d a7 f0 0a 00 00 	lea    0xaf0(%r15),%r12
  3c:	4c 89 e7             	mov    %r12,%rdi
  3f:	e8                   	.byte 0xe8


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
