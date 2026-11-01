Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557530;
	b=tU2rHh4aF86+ajC25994xPKPiOkuhl5v0f+roqDis+Z9nrMMUuesUGD6bKx/wsUkTn6F
	 sHH9Vis9bk3y877M+GonOCrTh7CfWK8fbL5Fn0oty5GswW5MJFRakqv8a1Yt3oTBO5SAY
	 jLru8tGSaNILjAku6naE9ImMfZDOlrFd1i2bL1Zuqp7kx09wuq1k1TVU8sVWcvnIGs7Tx
	 NtIf35rKwxSIvE8wjTaOqxiyCePALYV0zkX23wckrfRfD6iwOTHJ6Hywj9nWntqgHMaRa
	 R9zA6fuc2+6uQ/Gr1qSwXczTW9ui103RjhYrssBNUjF4ZJaLWIntsyyyKZmluLvsyhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557530;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=CMF+rDxX3I6Jh93CcarKiFP3ZLIidiAmOkST9zJjDqc=;
	b=FjbtsWbYkgSGxTzfEX+OnQ0ZX+ZBsqN3cK7gxzRTxsHmdMAgyrz6vsNfsaIMz4KSfSn1
	 XNRSWw4Y/NX/BJCkt+7aryV7VQhYEhWsFaqwiIpUzP9woFVfQs/a5JFkx4vx3vpdS8t5b
	 I1tkh7DkGds2cdIyrxsEbc96zs0pUeajtsN9cCMRZK5wyKAHF6le9/AkpO8smTHz6tkXx
	 Jj2zApcKq2rPNn3l4XdREGO97csqTWghw2ZcjRyUXWX2mMCMUrAu/JKsWlILCOYTczFQI
	 OPmaME2wT3gKcjS+pNok9yZgkxUZV6H/06hwll75T8qn5vVOvvG1O52GW6+bDC0AriA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6517C606A339
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6517C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so4011197b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557529; x=1794162329;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMF+rDxX3I6Jh93CcarKiFP3ZLIidiAmOkST9zJjDqc=;
        b=wKN3lr50nEIcItJnmx4X7M2uk0J+LRAgRZa9BYOMLzk8g/qcZ+1lskRIuDJC/f5PBl
         GTXsM1E5OJBAlTD9md+vFl2rE5H6AjhPgfboQKHfI/N0R6hyFaAzZR9kl2hNMCghdY75
         Ehutnc8M52985N1kkCK9rneZe8fy8vzwJhgLqUzyjVnFuVhRIHvkllqnAa7fYkkEkbSN
         /0ubm3SbAJoRKpZxNaD3HKen53VGmoZfEi4NGo7jOL3bWp7pKO2U7TCUDaDJ+0QcIXqo
         d4/oOyxO8bXC43zTZjL96nP+mWaN2Nx8jjQY1z2PSJFwpw4HKW1+DgHANfeEIMXXnMVY
         T5Nw==
X-Gm-Message-State: AFq9FYIdLZBnTZc3OmzWcDl4lSNH0KhbpBjiR6rKCOm6QCzzjcEP/k2w
	TWR+1PilsTwBIsEUZOVdclRVbRHtXD+uO7glm+O4AUoOgtr/ayLG44oEMLvDOX0DXl/N3A+khie
	E4z+oZ1gP7qpqz2OlMzidUGbiEWx/b8AxFQ6x3IBOBJLsWnAVXEFgMbdKAJQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1244:b0:510:7dc8:5ff7 with SMTP id
 5614622812f47-5640deea651mr5941698b6e.19.1793557529004; Sun, 01 Nov 2026
 10:25:29 -0800 (PST)
Date: Sun, 01 Nov 2026 10:25:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae78418.6552420f.2a0efc.005c.GAE@google.com>
Subject: [syzbot] [mm?] general protection fault in validate_mm (2)
From: syzbot <syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    36aad21d50d1 Merge tag 'ksmbd-for-7.4-rc1-part2' of git://..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12b81cb1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd712e5dbce1d1a0
dashboard link: https://syzkaller.appspot.com/bug?extid=10e72ea5747737bcd2ad
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a58f95580000

AI-generated root cause summary:
In validate_mm() (mm/vma.c), struct anon_vma *anon_vma = vma->anon_vma caches
the anon_vma pointer at the beginning of the VMA iteration loop. In
vms_complete_munmap_vmas(), mm->mmap_lock is downgraded to a read lock before
validate_mm() is called, allowing a concurrent page fault on another thread to
populate vma->anon_vma via __anon_vma_prepare(). When this race occurs,
vma_has_anon_rmap(vma) evaluates to true by re-reading vma->anon_vma, but
anon_vma_lock_read(anon_vma) is invoked with the stale NULL local variable,
resulting in an unhandled NULL-pointer dereference and kernel crash.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=10e72ea5747737bcd2ad

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 6142 Comm: syz-executor263 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:anon_vma_lock_read mm/internal.h:315 [inline]
RIP: 0010:validate_mm+0x3d4/0x780 mm/vma.c:707
Code: d2 e0 98 ff 48 89 df e8 5a 10 f1 ff c6 05 db a8 dd 0f 01 90 0f 0b 90 e9 04 fd ff ff e8 b5 e0 98 ff 48 8b 44 24 08 48 c1 e8 03 <80> 3c 28 00 0f 85 25 03 00 00 48 8b 44 24 08 4c 8d 63 30 48 8b 00
RSP: 0018:ffffc900040d7870 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88806b186000 RCX: 0000000000000000
RDX: ffff888000794b00 RSI: ffffffff8274c56b RDI: 0000000000000005
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000001
R10: ffff88806b186083 R11: 0000000000000001 R12: ffff88806b186010
R13: ffff88806b186040 R14: 0000000000000001 R15: 000000000000003d
FS:  0000000000000000(0000) GS:ffff888095281000(0063) knlGS:000000005727b3c0
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f7f72000 CR3: 000000004e463000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 vms_complete_munmap_vmas+0x83b/0xdf0 mm/vma.c:1437
 do_vmi_align_munmap+0x44f/0x5f0 mm/vma.c:1677
 do_vmi_munmap+0x1f8/0x410 mm/vma.c:1725
 __vm_munmap+0x196/0x3c0 mm/vma.c:3562
 __do_sys_munmap mm/mmap.c:1094 [inline]
 __se_sys_munmap mm/mmap.c:1091 [inline]
 __ia32_sys_munmap+0x57/0x80 mm/mmap.c:1091
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x14b/0x8c0 arch/x86/entry/syscall_32.c:282
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:307
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7eaafbc
Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 58 b8
RSP: 002b:00000000ff8ab10c EFLAGS: 00000296 ORIG_RAX: 000000000000005b
RAX: ffffffffffffffda RBX: 0000000020088000 RCX: 0000000000001000
RDX: 00000000f7f70ff4 RSI: 00000000000000fb RDI: 0000000000000040
RBP: 00000000ff8ab168 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:anon_vma_lock_read mm/internal.h:315 [inline]
RIP: 0010:validate_mm+0x3d4/0x780 mm/vma.c:707
Code: d2 e0 98 ff 48 89 df e8 5a 10 f1 ff c6 05 db a8 dd 0f 01 90 0f 0b 90 e9 04 fd ff ff e8 b5 e0 98 ff 48 8b 44 24 08 48 c1 e8 03 <80> 3c 28 00 0f 85 25 03 00 00 48 8b 44 24 08 4c 8d 63 30 48 8b 00
RSP: 0018:ffffc900040d7870 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88806b186000 RCX: 0000000000000000
RDX: ffff888000794b00 RSI: ffffffff8274c56b RDI: 0000000000000005
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000001
R10: ffff88806b186083 R11: 0000000000000001 R12: ffff88806b186010
R13: ffff88806b186040 R14: 0000000000000001 R15: 000000000000003d
FS:  0000000000000000(0000) GS:ffff888095281000(0063) knlGS:000000005727b3c0
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f7f72000 CR3: 000000004e463000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess), 4 bytes skipped:
   0:	48 89 df             	mov    %rbx,%rdi
   3:	e8 5a 10 f1 ff       	call   0xfff11062
   8:	c6 05 db a8 dd 0f 01 	movb   $0x1,0xfdda8db(%rip)        # 0xfdda8ea
   f:	90                   	nop
  10:	0f 0b                	ud2
  12:	90                   	nop
  13:	e9 04 fd ff ff       	jmp    0xfffffd1c
  18:	e8 b5 e0 98 ff       	call   0xff98e0d2
  1d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  22:	48 c1 e8 03          	shr    $0x3,%rax
* 26:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1) <-- trapping instruction
  2a:	0f 85 25 03 00 00    	jne    0x355
  30:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  35:	4c 8d 63 30          	lea    0x30(%rbx),%r12
  39:	48 8b 00             	mov    (%rax),%rax


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
