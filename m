Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BD31716D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600992; cv=none; b=oRxmrAzW5tEX6v/1O1lHJOM25Ow642IRse+YJ1rG0ZolNo11gcM+OaxZdrEY8O4k+GyA0oaaGKToenojMTYMe6LRfCCLaYWs+Plzsc5prFtsP8inEXwC4EJ416xDHszM2eoZUmz5Gtjw/K+fZtNrKj8D+/c+plbDnvFaJk0b+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600992; c=relaxed/simple;
	bh=k2a8/qj8h3YZlya+lum6bv5Dx6h0AJ8unJW6DGemFBQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AFTtGc0GFxpn31bPpNtSwuImr8ENh3ojhm4kBHwvHiAhqdvvFCmCnoJK/tNkXMWR95D1QO0PNjTEd9Vb0kFebskTSJm7lsbfUSNp7pB1N3Tzt9eJx+1CyclwpLzYgN3T20oIBMZYhyhAJXWH2f1+UVWcho4JiK11RWsNikmwses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b128c3af4bso162740eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600990; x=1789205790;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8QIbO6qq/VtrlPFuyvu6M2c620u5TE9s1ljdILDbuE=;
        b=jg/G9r7bCa8vAscqo2tIftmolJrm84bfSDNkzVfkmzDxaeGLWh8iL/ChauR67wfCYi
         cqkUQ7s7JQPuGKc0NxaDe767BK/b+hXvSZxSZGYvfZc9+Or7x+loBeQJHsvdHB+kssQ3
         zx/RhEGy5OnUfIZq/LFxwJ9ptBpPeJyu2BtAGe0Qm66/KBtYedt7xsSOaZsK2HyBUGjK
         56W7Z2jt5XlVos5Q0mtSugNaqsVBA0vXaghAwv1D+lKPBRViHrOmcwKr4tuLFjKl1Xzv
         iJ4oVU7M6fhypBBeBCxmugWzOPLsF6HUqoIZO3sgZQ8KObtdV+LgABCyRg9xF5LHkev4
         uDIw==
X-Forwarded-Encrypted: i=1; AKwUvBw8bPEbLaXlODsJ2HM13WAYETttpI8F4g4u7jDY7MBIxFH8PHD2hdJndaClgdT/yrIRE1KQcNHld4TY+6o=@vger.kernel.org
X-Gm-Message-State: AFuF++mv+Do7446PCQp5xH8InSsmBs1wsKu3mRPowbf/3ADg1aT1S/M1
	MMNlevqIY0FZ6nAUBrdKKLSQiRjpD6mrJkmzj0c2meeUypFe3u1776ObFKMZfK8XSqlHkJ1lB1R
	hCKR+SH7i/TWD7tZ4w7OgllfprsRg8y/j0SoEbcbr7IW71tXy6FeD5NJxO3k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e845:0:b0:6b7:8396:f3c9 with SMTP id
 006d021491bc7-6b78396f826mr4796032eaf.43.1788600989955; Sat, 05 Sep 2026
 02:36:29 -0700 (PDT)
Date: Sat, 05 Sep 2026 02:36:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9be29d.2e659fcc.61e1a.0004.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in __change_page_attr_set_clr
From: syzbot <syzbot+e623a6a4fd4d4cac4504@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, luto@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    af5f12805e5c Add linux-next specific files for 20260904
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17ddb215580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
dashboard link: https://syzkaller.appspot.com/bug?extid=e623a6a4fd4d4cac4504
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a9682d8d7552/disk-af5f1280.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d8aedd3c373f/vmlinux-af5f1280.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2ab370493357/bzImage-af5f1280.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e623a6a4fd4d4cac4504@syzkaller.appspotmail.com

clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823be00000-0xffff88823c000000
Console: colour VGA+ 80x25
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: legacy bootconsole [earlyser0] disabled
printk: legacy bootconsole [earlyser0] disabled
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8192
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     1048576
... MAX_LOCKDEP_CHAINS:      1048576
... CHAINHASH_SIZE:          524288
 memory used by lock dependency info: 106625 kB
 memory used for stack traces: 8320 kB
 per task-struct memory footprint: 1920 bytes
mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
ACPI: Core revision 20260408
APIC: Switch to symmetric I/O mode setup
x2apic enabled
APIC: Switched APIC routing to: physical x2apic
..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb63109b96, max_idle_ns: 440795265316 ns
Calibrating delay loop (skipped) preset value.. 4399.99 BogoMIPS (lpj=21999980)
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
Spectre V2 : Mitigation: IBRS
RETBleed: Mitigation: IBRS
ITS: Mitigation: Aligned branch/return thunks
Spectre V2 : User space: Mitigation: STIBP via prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: Clear CPU buffers
MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
Spectre V2 : Enabling IBPB for BPF
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
active return thunk: its_return_thunk
Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
------------[ cut here ]------------
CPA detected W^X violation: 8000000000000023 -> 0000000000000023 range: 0xffffffffa0000000 - 0xffffffffa0000fff PFN 140600
WARNING: arch/x86/mm/pat/set_memory.c:725 at verify_rwx arch/x86/mm/pat/set_memory.c:722 [inline], CPU#0: swapper/0/0
WARNING: arch/x86/mm/pat/set_memory.c:725 at __change_page_attr arch/x86/mm/pat/set_memory.c:1892 [inline], CPU#0: swapper/0/0
WARNING: arch/x86/mm/pat/set_memory.c:725 at __change_page_attr_set_clr+0x1d69/0x2820 arch/x86/mm/pat/set_memory.c:2064, CPU#0: swapper/0/0
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:verify_rwx arch/x86/mm/pat/set_memory.c:722 [inline]
RIP: 0010:__change_page_attr arch/x86/mm/pat/set_memory.c:1892 [inline]
RIP: 0010:__change_page_attr_set_clr+0x1d79/0x2820 arch/x86/mm/pat/set_memory.c:2064
Code: 00 00 e8 ba 6c 4d 00 48 8b 4c 24 30 4c 8d 81 ff 0f 00 00 48 8d 3d 07 be 02 0f 48 8b b4 24 a0 00 00 00 4c 89 f2 4c 8b 4c 24 50 <67> 48 0f b9 3a e9 8d 00 00 00 e8 88 6c 4d 00 4c 89 f8 48 c1 e8 03
RSP: 0000:ffffffff8ea07820 EFLAGS: 00010293
RAX: ffffffff817a6b66 RBX: 8000000140600023 RCX: ffffffffa0000000
RDX: 0000000000000023 RSI: 8000000000000023 RDI: ffffffff907d2980
RBP: ffffffff8ea07ad0 R08: ffffffffa0000fff R09: 0000000000140600
R10: dffffc0000000000 R11: fffffbfff1d40ef4 R12: 8000000000000000
R13: 0000000000000002 R14: 0000000000000023 R15: 8000000000000002
FS:  0000000000000000(0000) GS:ffff888124cbf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000eb48000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 change_page_attr_set_clr+0x398/0x11d0 arch/x86/mm/pat/set_memory.c:2152
 change_page_attr_clear arch/x86/mm/pat/set_memory.c:2190 [inline]
 set_memory_x+0xd6/0x110 arch/x86/mm/pat/set_memory.c:2351
 its_alloc arch/x86/kernel/alternative.c:236 [inline]
 its_allocate_thunk arch/x86/kernel/alternative.c:258 [inline]
 emit_its_trampoline arch/x86/kernel/alternative.c:834 [inline]
 patch_retpoline arch/x86/kernel/alternative.c:945 [inline]
 apply_retpolines+0x8e9/0x15a0 arch/x86/kernel/alternative.c:1010
 alternative_instructions+0x3a/0x100 arch/x86/kernel/alternative.c:2283
 arch_cpu_finalize_init+0xb2/0x1f0 arch/x86/kernel/cpu/common.c:2643
 start_kernel+0x310/0x3e0 init/main.c:1153
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x137/0x1b0 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x157
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	e8 ba 6c 4d 00       	call   0x4d6cc1
   7:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   c:	4c 8d 81 ff 0f 00 00 	lea    0xfff(%rcx),%r8
  13:	48 8d 3d 07 be 02 0f 	lea    0xf02be07(%rip),%rdi        # 0xf02be21
  1a:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  21:	00
  22:	4c 89 f2             	mov    %r14,%rdx
  25:	4c 8b 4c 24 50       	mov    0x50(%rsp),%r9
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 8d 00 00 00       	jmp    0xc1
  34:	e8 88 6c 4d 00       	call   0x4d6cc1
  39:	4c 89 f8             	mov    %r15,%rax
  3c:	48 c1 e8 03          	shr    $0x3,%rax


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
