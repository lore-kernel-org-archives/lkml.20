Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA03ED5BE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752565; cv=none; b=Ab8MLCnbZOAbaDvUDfusMnL/tFskJEdAp6kdENmm85jTCBfwDemjL2fjNVHaNj2dkhlL5AAhLPMUWJZCzCzmWjz4/hKMpU9uR8rgpXcmUMZQ8IAFqZBo5vMmpjzg9fJnwYdWbAPn4lbc8qzq2G7KnAHQfFeiW+2KekVrAuGdGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752565; c=relaxed/simple;
	bh=RzFD0ssSLf9jwM5OiqXc8IM+RSciBLZiPQQSV/KufaM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hb/jiT99z4VOMuYh58tkj1FXVZ2pdpNozcKXybW2iJLxr/xmkv1KIrXBSyztfeEQ7cSzwd5yI4LFdbjEzQ3pCCuRRSoWWpDhf7k3ZJw/N1x8OBzY5eUx5ELd0tCuOj0xnNVcUIZ2BnnPXN2jxncofn+VdzbUjyIM5KjT+9li19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bd8320ecso1846546b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752562; x=1788357362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CAcrub0ld9kYH07a9H+KZd+2udUpFl5U5PIvNAlEB6I=;
        b=pLPSvfN1wHxPYAJkeGaXRMzKkzV6J39DlFBsWo5EA2wsI/n8tIwcJNKerFlY90oVg5
         QAcCV0aTtQR3Lp1Nq6Ze1fjJvJ+Z2KGKzN0VPtLnABR0yjuacQdPoFyGuOmGZmOFM9jQ
         fF2d3ETEOTOUxKZSEJp/dJgxtSi4IYDMHhm82e0Iece0upSjFqH1R6L3EoOrzgqR/u31
         9sFxv+sBbnGhMxHD2TZ/VBy+G4Ag/eOLXEJi0BI7+OdbeidSHX2ItGDV0+H5YBpITnZk
         AC1M/NYUVnFnGR6in05v47eL+tL0ovBN/P7QlgN9rjLX+IzRG642rTCwTLPOhOlKGX9F
         gS8g==
X-Forwarded-Encrypted: i=1; AHgh+RpnRKsXQyDd1cz2E8BiUe79TzbNwViO9hes55qYm9P5Hb99VV5d12DGihmrUV4Vr9IkTDrySCmNCdL+Hw8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3uK1cxbdAUgvDmeThXJCl9/LkcLMxmqt5fi30tOTsNC8zr096
	RSimOQwv3vX9oHo7HY4PZ6pWmh9ThJ7343AmATJQra94R2OmcL/PKTYSdDlLMBeIE3DWGyH/1k6
	vRPKX0mGX0aAaLLsRBdKSAh0Bj1TkGp5uUkv2bKzNwx/pdG8g0TwPsU0fm1w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1307:b0:497:8f1:df07 with SMTP id
 5614622812f47-4b3668217f5mr7641709b6e.7.1787752562470; Wed, 26 Aug 2026
 06:56:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:56:02 -0700
In-Reply-To: <CAHc6FU6nG0BQVreh8uhacvSw-fxO2a=T7B5ct_oF8NmNL7-mqA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ef072.1d9ded08.62e62.00b0.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
From: syzbot <syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com>
To: agruenba@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in _find_first_zero_bit

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 6218 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:_find_first_zero_bit+0x29/0xb0 lib/find_bit.c:149
Code: 90 f3 0f 1e fa 41 57 41 56 41 55 41 54 53 48 85 f6 74 46 48 89 f3 49 89 fe 49 bf 00 00 00 00 00 fc ff df 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 68 06 7b fd 49 8b 06 48 83 f8 ff
RSP: 0018:ffffc90002ec76c0 EFLAGS: 00010256
RAX: 0000000000000000 RBX: 000000000000f800 RCX: 0000000000000000
RDX: ffff88802888cc40 RSI: 000000000000f800 RDI: 0000000000000000
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff520005d8ecc R12: ffff88805dd283f0
R13: ffff88802888cc38 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125207000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000013ecc44fd000 CR3: 000000000e746000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 find_first_zero_bit include/linux/find.h:391 [inline]
 slot_get fs/gfs2/quota.c:369 [inline]
 qdsb_get+0x133/0x340 fs/gfs2/quota.c:536
 gfs2_quota_hold+0x191/0x5c0 fs/gfs2/quota.c:620
 gfs2_dinode_dealloc+0x176/0x3f0 fs/gfs2/inode.c:529
 evict_unlinked_inode fs/gfs2/super.c:1334 [inline]
 gfs2_evict_inode+0x11e0/0x1410 fs/gfs2/super.c:1484
 evict+0x624/0xb50 fs/inode.c:822
 gfs2_put_super+0x300/0x870 fs/gfs2/super.c:620
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:769
 kill_block_super+0x44/0xa0 fs/super.c:1918
 deactivate_locked_super+0xbc/0x110 fs/super.c:603
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x73a/0x2360 kernel/exit.c:1009
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1152
 __do_sys_exit_group kernel/exit.c:1163 [inline]
 __se_sys_exit_group kernel/exit.c:1161 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1161
 x64_sys_call+0x2237/0x2250 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe33439ce59
Code: Unable to access opcode bytes at 0x7fe33439ce2f.
RSP: 002b:00007ffe494bbc48 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007fe33443233c RCX: 00007fe33439ce59
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
RBP: 0000000000000016 R08: 0000000000000000 R09: 00007fe3344322ca
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe494bcf00
R13: 00007fe3344322ca R14: 000055558ebba4e8 R15: 00007ffe494c12a0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:_find_first_zero_bit+0x29/0xb0 lib/find_bit.c:149
Code: 90 f3 0f 1e fa 41 57 41 56 41 55 41 54 53 48 85 f6 74 46 48 89 f3 49 89 fe 49 bf 00 00 00 00 00 fc ff df 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 68 06 7b fd 49 8b 06 48 83 f8 ff
RSP: 0018:ffffc90002ec76c0 EFLAGS: 00010256
RAX: 0000000000000000 RBX: 000000000000f800 RCX: 0000000000000000
RDX: ffff88802888cc40 RSI: 000000000000f800 RDI: 0000000000000000
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff520005d8ecc R12: ffff88805dd283f0
R13: ffff88802888cc38 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125207000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000013ecc44fd000 CR3: 000000000e746000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	f3 0f 1e fa          	endbr64
   5:	41 57                	push   %r15
   7:	41 56                	push   %r14
   9:	41 55                	push   %r13
   b:	41 54                	push   %r12
   d:	53                   	push   %rbx
   e:	48 85 f6             	test   %rsi,%rsi
  11:	74 46                	je     0x59
  13:	48 89 f3             	mov    %rsi,%rbx
  16:	49 89 fe             	mov    %rdi,%r14
  19:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  20:	fc ff df
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 f7             	mov    %r14,%rdi
  34:	e8 68 06 7b fd       	call   0xfd7b06a1
  39:	49 8b 06             	mov    (%r14),%rax
  3c:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax


Tested on:

commit:         8ea0df12 gfs2: Add meta inode validation to prevent co..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15ca0579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8dd02b32fb43dc7
dashboard link: https://syzkaller.appspot.com/bug?extid=cb79de2cc8b76fbf474f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
