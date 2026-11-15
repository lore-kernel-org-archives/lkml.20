Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731195;
	b=UdkZfG5lYmWcGQbZCqX11qHqLj1xUlU3OJPxTntIchjRMvNMXV74sDcrZ8v0BEUIpnQB
	 vxRBxWt0X4Exeew/fQj2/OBlc3+sw50xXxcc98DyLWljrNYqDS0fTO71YSB7DLMJjcn4Q
	 laXxFAxrDq64iJur7T1mxZ4XeoD07uf2bP1MhqDCRz+lp5fr2lf8BdOCtSKwpBcNMtNnb
	 VS/HiZ1XpBmSsUsHSF5LMBBEYckZLA2o/bALjgmFGOCPYR2trClXY/iMpJw7cfUjP4ggN
	 1YZhhyu/UQYbhMh7oalNetY8vJA9b/vqMEbB/WpBN/z4XWFfuOeQABPXg+0OAzrpIqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731195;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ccn1IsZt+YtH31mZmQIO+YLVR8kq2Kb4MnDVlOO3g2A=;
	b=cskNZ3WXs45DZcE9lGnL1eCQN5waW2vPRKCpesUI6lQ775oqfyVOkVIhI380cElzLTl8
	 e2U6xaiTP+0+3AIvn+uY4TmcEFMwWIiR88+yzlhF7wHwmMYe6Rt/l0a65wsKV2LhqoWr1
	 6jNPJItlqxoV4hEl5LYGtWQhfL/xVHifDoHw21ns5IwLDw6AC8TCjWqkGnngSuBfT5Amt
	 evy7w9jlYnvvjD2xajfrzSO0JVCfGAtE8NWrqv9TkOZuI6cd4BMpjrQWAYmh10DREI55F
	 F25DzqFX4+jb0LOfTB0elm8KrrhY3UIpf7oAHplF56n+SPJ5BTl5wxjlW8iP23ZraSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A511606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A511606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d51840c4so1571182fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731194; x=1795335994;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccn1IsZt+YtH31mZmQIO+YLVR8kq2Kb4MnDVlOO3g2A=;
        b=nPQ+UbhLjCPxsgJQwG/9umWhWZE3TPOu2dILG+Jyg7YXoXBQts6MN/TyEizbzshz7V
         8gSI1JD7XdLYq7hkebeUi9jQ+zBLSQjFsvwrOYsy6c+qEAQkgXu1q0Kz+imiM9jwrIBa
         Jz2Lox7z+9CX1+FnGzM+ij1gbuFB/vTdmTQd4Bjy5Y27+AAnnVHPmUgfeNOGDP+8x503
         ClQqjj7yiOhxy5YJEIF8G3xKV1J9B3M3o/Tb+A972x22WXEs3XM2RD6hCSueTGhsWBmu
         4Z2J/rjYrwBAw1SFPEyNTJpV4CUrbUhQfJv2l6j5RsdusSTcml7nnUPapRnc+Zl6eQZS
         5hhA==
X-Gm-Message-State: APuU4Z+wINPb3b5x+cRkdfZ0FDgoz7wk6RAtm28jYJjtstO5dYOd3fK4
	/sjXv/1t2L5gy6O3Wbd82I5G5PXENcfnfzKAMf9sOH89a0KebEXc8GI+ZTOWg8RBN2VsPT891oY
	to4lsAnLXfUbLGdcbsBnGdlnqkCae4WwCq731fmnM88AqrmzykRbriA6XpHY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1790:b0:571:b166:3d76 with SMTP id
 5614622812f47-571b1759e5amr3452890b6e.29.1794731194561; Sun, 15 Nov 2026
 00:26:34 -0800 (PST)
Date: Sun, 15 Nov 2026 00:26:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af96cba.bce61036.122766.0045.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: stack-out-of-bounds Write in __hrtimer_run_queues
From: syzbot <syzbot+c6b6d5e5800184a5fa86@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    23c62304dde2 Merge tag 'for-linus-7.4a-rc3-tag' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15adb9ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c210800cfc8f61e
dashboard link: https://syzkaller.appspot.com/bug?extid=c6b6d5e5800184a5fa86
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b86d3d580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6b6d5e5800184a5fa86@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 2 UID: 0 PID: 6558 Comm: syz.1.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:lookup_object lib/debugobjects.c:440 [inline]
RIP: 0010:debug_object_deactivate+0x19b/0x3b0 lib/debugobjects.c:938
Code: 48 c1 e8 03 42 80 3c 28 00 0f 85 8e 01 00 00 48 8b 1b 48 85 db 0f 84 32 01 00 00 48 8d 7b 18 41 83 c4 01 48 89 f8 48 c1 e8 03 <42> 80 3c 28 00 0f 85 4c 01 00 00 4c 3b 73 18 75 c2 48 b8 00 00 00
RSP: 0018:ffffc90000548da0 EFLAGS: 00010003
RAX: 0000000000000002 RBX: ffffffffffffffff RCX: 0000000000000002
RDX: ffffffff9cee70b0 RSI: 0000000000000004 RDI: 0000000000000017
RBP: ffffc90000548e80 R08: 0000000000000001 R09: fffff520000a91a2
R10: 0000000000000003 R11: 0000000000000000 R12: 0000000000000002
R13: dffffc0000000000 R14: ffffc9000635fd50 R15: 1ffff920000a91b6
FS:  0000000000000000(0000) GS:ffff888095472000(0063) knlGS:00000000f687eb40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000000032963fff CR3: 000000006e2ab000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 debug_hrtimer_deactivate kernel/time/hrtimer.c:491 [inline]
 __run_hrtimer kernel/time/hrtimer.c:2047 [inline]
 __hrtimer_run_queues+0x2e9/0x9a0 kernel/time/hrtimer.c:2136
 hrtimer_interrupt+0x441/0xaa0 kernel/time/hrtimer.c:2255
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1051 [inline]
 __sysvec_apic_timer_interrupt+0x109/0x470 arch/x86/kernel/apic/apic.c:1068
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x9e/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:__raw_spin_unlock_irq include/linux/spinlock_api_smp.h:220 [inline]
RIP: 0010:_raw_spin_unlock_irq+0x29/0x50 kernel/locking/spinlock.c:229
Code: 90 f3 0f 1e fa 53 48 8b 74 24 08 48 89 fb 48 83 c7 18 e8 fa 5a f7 f5 48 89 df e8 82 b1 f7 f5 e8 0d a9 24 f6 fb bf 01 00 00 00 <e8> d2 77 e6 f5 65 48 83 3d c1 52 c9 09 00 74 06 5b c3 cc cc cc cc
RSP: 0018:ffffc90002f3fc08 EFLAGS: 00000202
RAX: 00000000000001c1 RBX: ffffffff90cc6660 RCX: 0000000000000080
RDX: 0000000000000001 RSI: ffffffff8e627409 RDI: 0000000000000001
RBP: 0000000000000060 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff8880226f3000
R13: 0000000063702f73 R14: ffffffff8be2e420 R15: 000000000000009c
 pci_user_write_config_dword+0x150/0x230 drivers/pci/access.c:278
 proc_bus_pci_write+0x531/0x5e0 drivers/pci/proc.c:173
 pde_write fs/proc/inode.c:330 [inline]
 proc_reg_write+0x240/0x330 fs/proc/inode.c:342
 vfs_write+0x2aa/0x1040 fs/read_write.c:665
 ksys_write+0x12a/0x250 fs/read_write.c:719
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x14d/0x8e0 arch/x86/entry/syscall_32.c:286
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:311
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7fc4fbc
Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 58 b8
RSP: 002b:00000000f687e50c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080000300
RDX: 000000000000010f RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 000
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	48 c1 e8 03          	shr    $0x3,%rax
   4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   9:	0f 85 8e 01 00 00    	jne    0x19d
   f:	48 8b 1b             	mov    (%rbx),%rbx
  12:	48 85 db             	test   %rbx,%rbx
  15:	0f 84 32 01 00 00    	je     0x14d
  1b:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
  1f:	41 83 c4 01          	add    $0x1,%r12d
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	0f 85 4c 01 00 00    	jne    0x181
  35:	4c 3b 73 18          	cmp    0x18(%rbx),%r14
  39:	75 c2                	jne    0xfffffffd
  3b:	48                   	rex.W
  3c:	b8                   	.byte 0xb8
  3d:	00 00                	add    %al,(%rax)


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
