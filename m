Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463000;
	b=X+hZ+AfM55XJkuTwmfjkC5XbiiEU7phEFX0r8/MplpAupPD2XdJpz2ZJEzyX3JokgZbE
	 w4ur7v55q0qtaCVXyH960vh45xS+5MlBDS6V8BX4HUH5s/8I1oo3UzeY6nw+v0rOjq+HQ
	 Z3Gobz/uw5sx2fBUMFygrwIuUuQEBaUWw3vScnQ72pXgIPKM14w++Ig1E7lQkgEiqQbPi
	 GyAvZojtjBUSlALH+/s/5nDnno1Mz36ThwHsRoQC3PB/RY5SeMa8S8BHqH3q2yQVNUl36
	 oJXrkkI+RYy+xCah0sS40Qf5VooYSW8i9Ttmh9+6Bm8+AFZ4ZFqL3qHVx+XYbNpT/1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463000;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aVytj+jnIC0LNMqbQWh/jYruFwk5IemdhMCKFAhMlqI=;
	b=AOil1yqXFdJVUeF4Sg4tpqfCmrwKq9FVy4Z2DNUwWOi2MsJTTVHJAiRryVF2VOxE9UMr
	 32FTZtEtmgo7Ub55i52GnHCGv5JsJCcYB24o52x3CKaUZiMpibNVW5HmdJkFNXQkj8mcU
	 5vVGSQsfVYcBmtK8c85YPYbLkTDgVZfaSo6+vIjjzU+urv5cLts721TP3tAGQqjeGsIxY
	 lJaUsChpmOEogkjOwaZKsOKaAB14PErbqsj/JslZTgAY4Dbz4dR7NMqQiZuPZ0Ae9AwWQ
	 G1MNh4Xm5xP0S0pzMwzlm7ugQpxC/MnnDyhLAS2mEfJVEGag7N49PzIG8+7nar7b4kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D389606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D389606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab8b4887d4so2789330b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462999; x=1795067799;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVytj+jnIC0LNMqbQWh/jYruFwk5IemdhMCKFAhMlqI=;
        b=tpL9TRjhZatkGfr159NipCILoJjAZTVCgvwx/sB57EdN7O/cjg4z+v+M+TTowbi8hm
         du7ayMDbsVrjXAWcEvKMFxeopjx0qhmMkqgtxvwGVePkvtxqp1W1fQaLfhcqt/NTWtaT
         vVsYdRhTscrRj2Nys/eRn2uJj8p5xGpgfIZ91Zy7JwD1pCmOtzPvSO7oieYcN0+wQ3SA
         jYwq0QlM++zfStCTapz86OYrw5GNmwbhWPSCSuQlsqhqxgjOVoZ9EVLykXgOO1aeuFKC
         1d0EX+L498yMvfyC/IbhU9OCRmVOnKWnIviJD2oguRfgNlQJxjwRy+sLYVxRVA3Q0yt/
         jhbA==
X-Forwarded-Encrypted: i=1; AL+hErFuIrx9WUReBjy7/5ev3aWKEXy8EjkfkqiiSeBdYd16WhOfdWIUMrruW4lOSmbHCyi/9bqIbRB+L8vlGGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8okGd9TGT7nMwjCPghnWvthPVH9Wsz+CEwCE3y0W+gCPXt0j15
	eaLquFEuDl7Nh2xTzsiWNXK3VTTy/qvUqnNSVYPFEhKYCTGLU9tTT0zkIRE//YojARfkz/rcWIp
	PcxjkzQ2rikpeSne43j1ZiLjCKqyZt+msui2Nd6Dm1v8bS7dQVpURGe5j2zo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1381:b0:4f4:b5ba:a241 with SMTP id
 5614622812f47-56b971fad5fmr4156370b6e.39.1794462999684; Wed, 11 Nov 2026
 21:56:39 -0800 (PST)
Date: Wed, 11 Nov 2026 21:56:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af55517.a0c627da.5d811.0011.GAE@google.com>
Subject: [syzbot] [virt?] BUG: unable to handle kernel paging request in
 __run_timers (3)
From: syzbot <syzbot+0d91f453e89c72a04157@syzkaller.appspotmail.com>
To: ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, jgross@suse.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, 
	virtualization@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d164c7d754f0 Merge tag 'devicetree-fixes-for-7.4-1' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179566fd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=0d91f453e89c72a04157
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=173a724e580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-d164c7d7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0f548ae8bf9e/vmlinux-d164c7d7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/79563ef77b97/bzImage-d164c7d7.xz

AI-generated root cause summary:
proc_bus_pci_write() in drivers/pci/proc.c allows userspace to write raw values
directly into the PCI configuration space of PCI devices without restricting
writes to critical platform host bridge registers when lockdown is not active.
Writing to device 00:00.0 (the Q35 Host Bridge / DRAM Controller) overwrites
memory controller registers, causing QEMU to unmap system RAM and return
all-ones (0xffffffffffffffff) for affected physical addresses. Consequently,
when the timer subsystem in __run_timers() dequeues an active timer from an
affected page, entry->next and entry->pprev evaluate to 0xffffffffffffffff,
causing __hlist_del() to trigger a fatal supervisor write page fault at address
0xffffffffffffffff.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=0d91f453e89c72a04157

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d91f453e89c72a04157@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffffffffffffff
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD fd99067 P4D fd99067 PUD fd9b067 PMD 0 
Oops: Oops: 0002 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__hlist_del include/linux/list.h:1045 [inline]
RIP: 0010:detach_timer kernel/time/timer.c:892 [inline]
RIP: 0010:expire_timers kernel/time/timer.c:1783 [inline]
RIP: 0010:__run_timers+0x68a/0xb00 kernel/time/timer.c:2375
Code: 8b 3b 48 89 f8 48 c1 e8 03 42 80 3c 20 00 0f 85 08 03 00 00 48 8b 43 08 48 89 c2 48 c1 ea 03 42 80 3c 22 00 0f 85 db 02 00 00 <4c> 89 38 48 89 44 24 08 4d 85 ff 74 24 e8 54 50 15 00 49 8d 7f 08
RSP: 0018:ffffc90000658d48 EFLAGS: 00010046
RAX: ffffffffffffffff RBX: ffff8880456d98d8 RCX: 0000000000000102
RDX: 1fffffffffffffff RSI: ffffffff81f92b99 RDI: ffff8880456d98e0
RBP: ffffc90000658e08 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff926ab25f R11: 0000000000000001 R12: dffffc0000000000
R13: fffff520000cb1c1 R14: ffff88806a2266c0 R15: ffffffffffffffff
FS:  0000000000000000(0000) GS:ffff8880d4675000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffff CR3: 0000000059bd9000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 __run_timer_base kernel/time/timer.c:2387 [inline]
 __run_timer_base kernel/time/timer.c:2379 [inline]
 run_timer_base+0x114/0x190 kernel/time/timer.c:2396
 run_timer_softirq+0x1a/0x50 kernel/time/timer.c:2406
 handle_softirqs+0x216/0xa20 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0x178/0x220 kernel/softirq.c:786
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:809
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0xa3/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 67 a0 02 e9 43 61 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d c3 6d 1c 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000197e00 EFLAGS: 00000206
RAX: 000000000004ea47 RBX: ffff888020aba580 RCX: ffffffff8bef5325
RDX: 0000000000000001 RSI: ffffffff8e629989 RDI: ffffffff8c835980
RBP: ffffed10041574b0 R08: 0000000000000001 R09: ffffed100d446825
R10: ffff88806a23412b R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffff92000032fc4 R15: dffffc0000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:62 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:768
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:199 [inline]
 do_idle+0x3ae/0x5b0 kernel/sched/idle.c:355
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:458
 start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x158
 </TASK>
Modules linked in:
CR2: ffffffffffffffff
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	8b 3b                	mov    (%rbx),%edi
   2:	48 89 f8             	mov    %rdi,%rax
   5:	48 c1 e8 03          	shr    $0x3,%rax
   9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
   e:	0f 85 08 03 00 00    	jne    0x31c
  14:	48 8b 43 08          	mov    0x8(%rbx),%rax
  18:	48 89 c2             	mov    %rax,%rdx
  1b:	48 c1 ea 03          	shr    $0x3,%rdx
  1f:	42 80 3c 22 00       	cmpb   $0x0,(%rdx,%r12,1)
  24:	0f 85 db 02 00 00    	jne    0x305
* 2a:	4c 89 38             	mov    %r15,(%rax) <-- trapping instruction
  2d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  32:	4d 85 ff             	test   %r15,%r15
  35:	74 24                	je     0x5b
  37:	e8 54 50 15 00       	call   0x155090
  3c:	49 8d 7f 08          	lea    0x8(%r15),%rdi


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
