Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824901C69D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698284; cv=none; b=QZaQtahYKc5fGqTOG/vN3wwOAwY/rvYUAVstS0u9fEGNvOYBgrhgh5uX9COHr8AIWx6s3y4+bI80pLxdTp+wc1RnV/IWozA96XuVxfcZOW60pgJJYXld2YPLcPCVpza5ebkZrCRFZ+Oiv1NLybGJaDW6DubPFnT7IrhD1E5/yg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698284; c=relaxed/simple;
	bh=ZvFKq+Id/RjZoHSpAW4dPb7SvYacpsamfTrcwXlUUuI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QM3wlYuPpDZBgAosri2PhuHZnxSGuFvKCd5c/Qz0kuwHGAlpz/taP08b58N+n+RJ8whWK9piKnZKuCbxxOUsPYB7UpFQHNpd2rOWYy6l05tWaY4wnzAhsszQumcnN+8yHAmNqmWl5TgX6G3Uw1WPD0bch4jd+pwOjwEJfoJKWik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b59d85dcso5144238a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 05:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788698281; x=1789303081;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGeBsSetA8OWEePC0nA5TEVJAC+6b5I0kWyrH7nSxao=;
        b=pvf2XxDR8muqGzd1p8li8qk7/r6qHL9woHHsRolb1Q+nZJB6mLkE2gLcxymdBkW3Jo
         lTtRmGmaPFylvdhyy7/JJwrBAM2+NGHPAYv3BuZ+oz6cQjiCwPeXlVmVlNfO1zczcl2C
         rSJBOavH8/Q11vegnVKT3TRHKDsF20GpEr1siYBv4um4bgMpdeKMzeahcxvdpRHniu1u
         1bwZlvY85clx/2wak3ROwUfv3d0epkd6lsN/ibNLQFEEA20yP/9EDRfUobmy+s7l57cn
         fpZN2wfFEQDbp6TUXxSyXYbqgqSBXTu+202eSXBEu4RtYUXunPvPnXej5fCF/Cz5Cv1z
         m+UA==
X-Forwarded-Encrypted: i=1; AKwUvBwBDBZnZ532n/YI6e6fGXnMwh8qe0RcbCcI93kqEAaUY6BNH2io9MC/yYHUQFenPlVnhE0BoR2QBdWZTrw=@vger.kernel.org
X-Gm-Message-State: AFuF++l8658pqdvUvsXZPzdR+PTHaDnjdftB2izEkcAqa2IAjoG9vhDc
	KAiFVMCf1BYAmNKvftwv+QRj6dFiuzz7X5UIAyuC3Gw9w9Kn98NaDo929GC49wnonAUOnJxCaZ+
	xdTgM2zhBjhztHdG+9WycHk1OZjzfIkm/Rw7koGJoB/+oIIL11WTVkOS017g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c3d7:b0:6b7:46fa:16aa with SMTP id
 006d021491bc7-6b746fa1b6bmr6532041eaf.63.1788698281448; Sun, 06 Sep 2026
 05:38:01 -0700 (PDT)
Date: Sun, 06 Sep 2026 05:38:01 -0700
In-Reply-To: <20260906114851.11635-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d5ea9.a6639fcc.23b8b0.0008.GAE@google.com>
Subject: Re: [syzbot] [xfs?] WARNING in __xfs_healthmon_insert
From: syzbot <syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

                           **
[    2.229514][    T0] **                                                  =
    **
[    2.233723][    T0] ** Use hash_pointers=3Dalways to force this mode off=
      **
[    2.237896][    T0] **                                                  =
    **
[    2.241110][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTIC=
E   **
[    2.246058][    T0] ****************************************************=
******
[    2.253226][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D2, Nodes=3D2
[    2.383135][    T0] allocated 167772160 bytes of page_ext
[    2.388307][    T0] Node 0, zone      DMA: page owner found early alloca=
ted 0 pages
[    2.409204][    T0] Node 0, zone    DMA32: page owner found early alloca=
ted 21251 pages
[    2.419597][    T0] Node 0, zone   Normal: page owner found early alloca=
ted 0 pages
[    2.437217][    T0] Node 1, zone   Normal: page owner found early alloca=
ted 19847 pages
[    2.441395][    T0] Kernel/User page tables isolation: enabled
[    2.447279][    T0] Dynamic Preempt: full
[    2.451679][    T0] Running RCU self tests
[    2.453909][    T0] Running RCU synchronous self tests
[    2.457068][    T0] rcu: Preemptible hierarchical RCU implementation.
[    2.459974][    T0] rcu: 	RCU lockdep checking is enabled.
[    2.462985][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cp=
u_ids=3D2.
[    2.467577][    T0] rcu: 	RCU callback double-/use-after-free debug is e=
nabled.
[    2.470329][    T0] rcu: 	RCU debug extended QS entry/exit.
[    2.473542][    T0] 	All grace periods are expedited (rcu_expedited).
[    2.478396][    T0] 	Trampoline variant of Tasks RCU enabled.
[    2.480609][    T0] 	Tracing variant of Tasks RCU enabled.
[    2.484890][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    2.491630][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D2
[    2.496883][    T0] Running RCU synchronous self tests
[    2.500611][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    2.713553][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
[    2.718843][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    2.721660][    T0] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 19112604462750000 ns
[    2.727899][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88823be00000-0xffff88823c000000
[    2.736339][    T0] Console: colour VGA+ 80x25
[    2.739581][    T0] printk: console [ttyS0] enabled
[    2.739581][    T0] printk: console [ttyS0] enabled
[    2.745417][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.745417][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.755402][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    2.761508][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    2.765566][    T0] ... MAX_LOCK_DEPTH:          48
[    2.769174][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    2.771511][    T0] ... CLASSHASH_SIZE:          4096
[    2.776241][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    2.780925][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    2.785270][    T0] ... CHAINHASH_SIZE:          524288
[    2.788257][    T0]  memory used by lock dependency info: 106625 kB
[    2.791971][    T0]  memory used for stack traces: 8320 kB
[    2.795131][    T0]  per task-struct memory footprint: 1920 bytes
[    2.801380][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    2.809521][    T0] ACPI: Core revision 20260408
[    2.815089][    T0] APIC: Switch to symmetric I/O mode setup
[    2.819588][    T0] x2apic enabled
[    2.832365][    T0] APIC: Switched APIC routing to: physical x2apic
[    2.853659][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    2.859580][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb63109b96, max_idle_ns: 440795265316 ns
[    2.867348][    T0] Calibrating delay loop (skipped) preset value.. 4399=
.99 BogoMIPS (lpj=3D21999980)
[    2.873587][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    2.877349][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB=
 4
[    2.881761][    T0] mitigations: Enabled attack vectors: user_kernel, us=
er_user, guest_host, guest_guest, SMT mitigations: auto
[    2.887349][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    2.897352][    T0] Spectre V2 : Mitigation: IBRS
[    2.899868][    T0] RETBleed: Mitigation: IBRS
[    2.903522][    T0] ITS: Mitigation: Aligned branch/return thunks
[    2.907358][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    2.910650][    T0] MDS: Mitigation: Clear CPU buffers
[    2.914273][    T0] TAA: Mitigation: Clear CPU buffers
[    2.917351][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    2.922442][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    2.927360][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on=
 context switch and VMEXIT
[    2.934375][    T0] Spectre V2 : Enabling IBPB for BPF
[    2.937374][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    2.947399][    T0] active return thunk: its_return_thunk
[    2.957351][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    2.967425][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    2.977358][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    2.987355][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    2.997353][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    3.007352][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    3.019716][    T0] ------------[ cut here ]------------
[    3.027355][    T0] CPA detected W^X violation: 8000000000000023 -> 0000=
000000000023 range: 0xffffffffa0000000 - 0xffffffffa0000fff PFN 140600
[    3.037350][    T0] WARNING: arch/x86/mm/pat/set_memory.c:725 at __chang=
e_page_attr_set_clr+0x1d69/0x2820, CPU#0: swapper/0/0
[    3.047350][    T0] Modules linked in:
[    3.052129][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    3.057349][    T0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    3.067364][    T0] RIP: 0010:__change_page_attr_set_clr+0x1d79/0x2820
[    3.077360][    T0] Code: 00 00 e8 ba 6c 4d 00 48 8b 4c 24 30 4c 8d 81 f=
f 0f 00 00 48 8d 3d 07 be 02 0f 48 8b b4 24 a0 00 00 00 4c 89 f2 4c 8b 4c 2=
4 50 <67> 48 0f b9 3a e9 8d 00 00 00 e8 88 6c 4d 00 4c 89 f8 48 c1 e8 03
[    3.087350][    T0] RSP: 0000:ffffffff8ea07820 EFLAGS: 00010293
[    3.096327][    T0] RAX: ffffffff817a6b66 RBX: 8000000140600023 RCX: fff=
fffffa0000000
[    3.097366][    T0] RDX: 0000000000000023 RSI: 8000000000000023 RDI: fff=
fffff907d2980
[    3.107078][    T0] RBP: ffffffff8ea07ad0 R08: ffffffffa0000fff R09: 000=
0000000140600
[    3.107356][    T0] R10: dffffc0000000000 R11: fffffbfff1d40ef4 R12: 800=
0000000000000
[    3.116343][    T0] R13: 0000000000000002 R14: 0000000000000023 R15: 800=
0000000000002
[    3.117351][    T0] FS:  0000000000000000(0000) GS:ffff888124cbf000(0000=
) knlGS:0000000000000000
[    3.127353][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.137351][    T0] CR2: ffff88823ffff000 CR3: 000000000eb48000 CR4: 000=
00000003506f0
[    3.147353][    T0] Call Trace:
[    3.155514][    T0]  <TASK>
[    3.157371][    T0]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[    3.167355][    T0]  ? __purge_vmap_area_lazy+0x964/0xb40
[    3.177369][    T0]  ? __pfx___change_page_attr_set_clr+0x10/0x10
[    3.187351][    T0]  ? __might_resched+0x71/0x4c0
[    3.197359][    T0]  ? down_read+0x2b9/0x320
[    3.207354][    T0]  change_page_attr_set_clr+0x398/0x11d0
[    3.217363][    T0]  ? __pfx_change_page_attr_set_clr+0x10/0x10
[    3.227371][    T0]  ? trace_kmalloc+0x2a/0xf0
[    3.237364][    T0]  set_memory_x+0xd6/0x110
[    3.247357][    T0]  ? __pfx_set_memory_x+0x10/0x10
[    3.255074][    T0]  apply_retpolines+0x8e9/0x15a0
[    3.257361][    T0]  ? events_sysfs_show+0xdd/0xf0
[    3.267354][    T0]  ? __pfx_apply_retpolines+0x10/0x10
[    3.277371][    T0]  ? events_sysfs_show+0xdd/0xf0
[    3.287351][    T0]  ? events_sysfs_show+0xec/0xf0
[    3.294334][    T0]  ? events_sysfs_show+0xe3/0xf0
[    3.297368][    T0]  ? unregister_die_notifier+0x43/0x50
[    3.307357][    T0]  ? __pfx_int3_selftest+0x10/0x10
[    3.317362][    T0]  alternative_instructions+0x3a/0x100
[    3.327363][    T0]  arch_cpu_finalize_init+0xb2/0x1f0
[    3.337361][    T0]  start_kernel+0x310/0x3e0
[    3.347358][    T0]  x86_64_start_reservations+0x24/0x30
[    3.357360][    T0]  x86_64_start_kernel+0x137/0x1b0
[    3.363886][    T0]  common_startup_64+0x13e/0x157
[    3.367365][    T0]  </TASK>
[    3.377357][    T0] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    3.387329][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    3.387329][    T0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    3.387329][    T0] Call Trace:
[    3.387329][    T0]  <TASK>
[    3.387329][    T0]  vpanic+0x56d/0xa70
[    3.387329][    T0]  ? __pfx__printk+0x10/0x10
[    3.387329][    T0]  ? __pfx_vpanic+0x10/0x10
[    3.387329][    T0]  ? is_bpf_text_address+0x292/0x2b0
[    3.387329][    T0]  ? is_bpf_text_address+0x26/0x2b0
[    3.387329][    T0]  panic+0xc5/0xd0
[    3.387329][    T0]  ? __pfx_panic+0x10/0x10
[    3.387329][    T0]  ? common_startup_64+0x13e/0x157
[    3.387329][    T0]  __warn+0x315/0x4c0
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    3.387329][    T0]  __report_bug+0x276/0x570
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    3.387329][    T0]  ? __pfx___report_bug+0x10/0x10
[    3.387329][    T0]  report_bug_entry+0x19b/0x290
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d79/0x2820
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d7e/0x2820
[    3.387329][    T0]  handle_bug+0xce/0x200
[    3.387329][    T0]  exc_invalid_op+0x1a/0x50
[    3.387329][    T0]  asm_exc_invalid_op+0x1a/0x20
[    3.387329][    T0] RIP: 0010:__change_page_attr_set_clr+0x1d79/0x2820
[    3.387329][    T0] Code: 00 00 e8 ba 6c 4d 00 48 8b 4c 24 30 4c 8d 81 f=
f 0f 00 00 48 8d 3d 07 be 02 0f 48 8b b4 24 a0 00 00 00 4c 89 f2 4c 8b 4c 2=
4 50 <67> 48 0f b9 3a e9 8d 00 00 00 e8 88 6c 4d 00 4c 89 f8 48 c1 e8 03
[    3.387329][    T0] RSP: 0000:ffffffff8ea07820 EFLAGS: 00010293
[    3.387329][    T0] RAX: ffffffff817a6b66 RBX: 8000000140600023 RCX: fff=
fffffa0000000
[    3.387329][    T0] RDX: 0000000000000023 RSI: 8000000000000023 RDI: fff=
fffff907d2980
[    3.387329][    T0] RBP: ffffffff8ea07ad0 R08: ffffffffa0000fff R09: 000=
0000000140600
[    3.387329][    T0] R10: dffffc0000000000 R11: fffffbfff1d40ef4 R12: 800=
0000000000000
[    3.387329][    T0] R13: 0000000000000002 R14: 0000000000000023 R15: 800=
0000000000002
[    3.387329][    T0]  ? __change_page_attr_set_clr+0x1d56/0x2820
[    3.387329][    T0]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[    3.387329][    T0]  ? __purge_vmap_area_lazy+0x964/0xb40
[    3.387329][    T0]  ? __pfx___change_page_attr_set_clr+0x10/0x10
[    3.387329][    T0]  ? __might_resched+0x71/0x4c0
[    3.387329][    T0]  ? down_read+0x2b9/0x320
[    3.387329][    T0]  change_page_attr_set_clr+0x398/0x11d0
[    3.387329][    T0]  ? __pfx_change_page_attr_set_clr+0x10/0x10
[    3.387329][    T0]  ? trace_kmalloc+0x2a/0xf0
[    3.387329][    T0]  set_memory_x+0xd6/0x110
[    3.387329][    T0]  ? __pfx_set_memory_x+0x10/0x10
[    3.387329][    T0]  apply_retpolines+0x8e9/0x15a0
[    3.387329][    T0]  ? events_sysfs_show+0xdd/0xf0
[    3.387329][    T0]  ? __pfx_apply_retpolines+0x10/0x10
[    3.387329][    T0]  ? events_sysfs_show+0xdd/0xf0
[    3.387329][    T0]  ? events_sysfs_show+0xec/0xf0
[    3.387329][    T0]  ? events_sysfs_show+0xe3/0xf0
[    3.387329][    T0]  ? unregister_die_notifier+0x43/0x50
[    3.387329][    T0]  ? __pfx_int3_selftest+0x10/0x10
[    3.387329][    T0]  alternative_instructions+0x3a/0x100
[    3.387329][    T0]  arch_cpu_finalize_init+0xb2/0x1f0
[    3.387329][    T0]  start_kernel+0x310/0x3e0
[    3.387329][    T0]  x86_64_start_reservations+0x24/0x30
[    3.387329][    T0]  x86_64_start_kernel+0x137/0x1b0
[    3.387329][    T0]  common_startup_64+0x13e/0x157
[    3.387329][    T0]  </TASK>
[    3.387329][    T0] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build713299113=3D/tmp/go-build -gno-record-gcc=
-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.26.0'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at 801f0966669
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D801f0966669a37e048adabf9e5f38ce52825ea82 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260903-143617"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D801f0966669a37e048adabf9e5f38ce52825ea82 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260903-143617"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D801f0966669a37e048adabf9e5f38ce52825ea82 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260903-143617"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"801f0966669a37e048adabf9e5f38ce528=
25ea82\"
/usr/bin/ld: /tmp/ccc7XvCA.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D12651b49580000


Tested on:

commit:         af5f1280 Add linux-next specific files for 20260904
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbb4a32c282cc2ec=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dccdf3469f5f653bff=
7ac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D16c732f95800=
00

