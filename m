Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878431;
	b=NIz2WjdOL6r8wITJ9yZEOTWaBewkQ3kiygj/RXLdVEgyL6xEK0koZx0SASWfAebyCSBJ
	 sqAHZa33fSnsiz2nVUgTRya05j6wpUeO6J7O6zp1Zqmd2XTq5PXarXQ8+nv0p7OQPQe+X
	 iTDgMp1mj8ZtVnhf0o3NJ1ZseGrfID09swtHohD3sMD7/OGszB1t0wyXgmBVKW2o42ybs
	 HIl74AOaT0PlpjWJaj4HjwIdcFL8AtkGqxrStjhGou0mFb61vJWWtIljqAG5+UPk+88CR
	 V9ijgED4Wj1DbmAMiugPu+KLbJa0r9qxERC+qZjrzC4iOQP3/aprauczZVDfFKOgYzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878431;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=xNRxkYxVLe4DpbVEqc4OYAvojmlR+XZM7w3dpGl/4ec=;
	b=nxTrm+K/6mXQZ7PAR8ehvSFNMXgv4hhc/4/lMU6UtLtPoJMv47WsmFesuQF3fosA5Ki6
	 5DyI/RxNEBh/1S98xhwxD65gfs8UXEQB23sbcjNuehq4ZN2sRH3tOWp7eCSSO3bp2eL61
	 2XnBkaoDk+ubpfm27HAtXvk8tDksBCKNtChvDuzMRUZlZ9rPdEiDltU1/VLb8M0RKOuXi
	 S15JnM/Jz2de9cYJ2rjOykYnFU1FER8g/sLB/hAXN6HJrZPRaXfQvKaHNe2Vt5Cht5Fhs
	 HKyrzCzUtmBH5ElPRU/fECqvwo9BdegvXmp3fnqRY7+g79tJC2x2ojHROmDx7BE+5JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A20606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8490253aeb6so1950569a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878430; x=1794483230;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNRxkYxVLe4DpbVEqc4OYAvojmlR+XZM7w3dpGl/4ec=;
        b=AGZPtatKWdIUKzeABSlmIBHfg3dADBth1hszyDCG1h8qbGFjRF2cbsDPLdJ87IW6sv
         mZQB9zuIYkIjRs7d/1YK87oE/QJGTBS8tAf+ORoa499j0Au08RQHpJLWZcwWTZKlCUPn
         Z0hVwaWt24RWmslAK/b4C7NoHM15gWbDWof9rU0IQaNlW0CzzOfhhrYkpfnbRDaIGwrf
         8yWmpx/LWph+b9F4SKmqNo1pzVJldiVBOiDhMLghwON5wgLJUWOQRG2WEknUcnbmi42l
         1wU6RDwS2An/9pinVAvHAO9IUDc8B+ZOsS3EKMkgcr3zTChc/qn9JujwXlkvBavQhP+u
         P3uQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2jtio9paLN8AYVCYpn4gnualfIE0L6QkEtV5KdoX54kMqZfNXr9dZQpwcIwCxdOtM9KRv/nq6hIEiwaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xyL1/tp3ALYNE24TOSxXdA4Z7uCiTfbZt6HmZd5ZRo4Sk5kz3
	2dhlZcz5oe05N+O6LHhh6yWIvWuEP3QDn2l8CUgMe7QFqL3o7CBr/4Loq/hDJXHW0ih7fUDfX0D
	MadfwMO5y1iPLl1FZldnVXd1m/zsYQfrsK5AyxlQ1HpTsYIWfMR4Z/ogJ6is=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1583:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-5640dc1f7d7mr13597219b6e.16.1793878430502; Thu, 05 Nov 2026
 03:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 03:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec699e.73adde43.12e2c1.0000.GAE@google.com>
Subject: [syzbot] [kernel?] general protection fault in psi_task_change
From: syzbot <syzbot+66e09ade4298957334df@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    05441d697f7f Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1007668d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=66e09ade4298957334df
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1422d381580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1407668d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-05441d69.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0edd3964be19/vmlinux-05441d69.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84d6d8dd5648/bzImage-05441d69.xz

AI-generated root cause summary:
In drivers/pci/proc.c, proc_bus_pci_write() allows writing directly to the PCI
configuration space of PCI devices including the host bridge (device 00:00.0).
Writing arbitrary data to host bridge configuration registers reconfigures
physical memory routing registers (such as PCIEXBAR, PAM, and TOLUD), causing
physical RAM regions backing kernel allocations (such as struct css_set) to
become unmapped and return all-ones (0xff). When the scheduler invokes
psi_task_change() -> task_psi_group() -> cgroup_psi(), reading cset->dfl_cgrp
from the affected memory yields 0xffffffffffffffff (-1), causing cgroup_ino() to
access an invalid offset that triggers a general protection fault and kernel
panic.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=66e09ade4298957334df

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+66e09ade4298957334df@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000033: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000198-0x000000000000019f]
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:cgroup_ino include/linux/cgroup.h:724 [inline]
RIP: 0010:cgroup_psi include/linux/psi.h:39 [inline]
RIP: 0010:task_psi_group kernel/sched/psi.c:884 [inline]
RIP: 0010:task_psi_group kernel/sched/psi.c:880 [inline]
RIP: 0010:psi_task_change+0x20f/0x530 kernel/sched/psi.c:916
Code: 03 80 3c 02 00 0f 85 ff 02 00 00 4d 8b bd 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf a0 01 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 e0 02 00 00 4d 8b af a0 01 00 00 48 ba 00 00 00
RSP: 0018:ffffc900006a0c68 EFLAGS: 00010007
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000001
RDX: 0000000000000033 RSI: ffffffff8e60120c RDI: 000000000000019f
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff888054570000 R14: 0000000000000001 R15: ffffffffffffffff
FS:  0000000000000000(0000) GS:ffff8880d457c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5894989140 CR3: 00000000372ab000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 psi_enqueue kernel/sched/stats.h:159 [inline]
 enqueue_task+0x1dc/0x4f0 kernel/sched/core.c:2199
 activate_task kernel/sched/core.c:2237 [inline]
 ttwu_do_activate+0x174/0x800 kernel/sched/core.c:3897
 ttwu_queue kernel/sched/core.c:4150 [inline]
 try_to_wake_up+0xce0/0x1ca0 kernel/sched/core.c:4488
 hrtimer_wakeup+0x47/0x60 kernel/time/hrtimer.c:2335
 __run_hrtimer kernel/time/hrtimer.c:2079 [inline]
 __hrtimer_run_queues+0x448/0x9a0 kernel/time/hrtimer.c:2136
 hrtimer_interrupt+0x441/0xaa0 kernel/time/hrtimer.c:2255
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1051 [inline]
 __sysvec_apic_timer_interrupt+0x109/0x470 arch/x86/kernel/apic/apic.c:1068
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x9e/0xc0 arch/x86/kernel/apic/apic.c:1062
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:64
Code: 67 a1 02 e9 43 61 03 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d c3 7d 1d 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc90000177e00 EFLAGS: 00000206
RAX: 000000000003cdf9 RBX: ffff88802069a580 RCX: ffffffff8bee4325
RDX: 0000000000000001 RSI: ffffffff8e628221 RDI: ffffffff8c835380
RBP: ffffed10040d34b0 R08: 0000000000000001 R09: ffffed100d426825
R10: ffff88806a13412b R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 1ffff9200002efc4 R15: dffffc0000000000
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
---[ end trace 0000000000000000 ]---
RIP: 0010:cgroup_ino include/linux/cgroup.h:724 [inline]
RIP: 0010:cgroup_psi include/linux/psi.h:39 [inline]
RIP: 0010:task_psi_group kernel/sched/psi.c:884 [inline]
RIP: 0010:task_psi_group kernel/sched/psi.c:880 [inline]
RIP: 0010:psi_task_change+0x20f/0x530 kernel/sched/psi.c:916
Code: 03 80 3c 02 00 0f 85 ff 02 00 00 4d 8b bd 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf a0 01 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 e0 02 00 00 4d 8b af a0 01 00 00 48 ba 00 00 00
RSP: 0018:ffffc900006a0c68 EFLAGS: 00010007
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000001
RDX: 0000000000000033 RSI: ffffffff8e60120c RDI: 000000000000019f
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff888054570000 R14: 0000000000000001 R15: ffffffffffffffff
FS:  0000000000000000(0000) GS:ffff8880d457c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5894989140 CR3: 00000000372ab000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 ff                	test   %edi,%edi
   8:	02 00                	add    (%rax),%al
   a:	00 4d 8b             	add    %cl,-0x75(%rbp)
   d:	bd 88 00 00 00       	mov    $0x88,%ebp
  12:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  19:	fc ff df
  1c:	49 8d bf a0 01 00 00 	lea    0x1a0(%r15),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 e0 02 00 00    	jne    0x314
  34:	4d 8b af a0 01 00 00 	mov    0x1a0(%r15),%r13
  3b:	48                   	rex.W
  3c:	ba                   	.byte 0xba
  3d:	00 00                	add    %al,(%rax)


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
