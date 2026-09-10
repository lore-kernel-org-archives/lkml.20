Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B43AEF24
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018627; cv=none; b=VpYCsn6LWtwxYfATqxfRW05ry6pK1Q9BPpjuVf7YxIJwql5OPLn+POd+bGHovW17CQp74W4g1gtmJl8tEMQtosV2t072pVbZE43gRwmg8geRfadBvNw+HX16/nIz2/hU+0GkYFMkK7B/RnsewXg0oyCHlprwDd4jyxed4VraZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018627; c=relaxed/simple;
	bh=7P8o6bnzYpECfbS0nF/wG4N7Bk+Gz37Xq4VphfKVzDA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MpgB2+UnrguqqHZdNNwvMnXKfsOGrlyqnMZN0ivwB6/3taYTLppZhw80wlqgv8m2msbODoqA9pdIT027GIZUbDTXj+vLtNB05BLkLZOiSHZaJm1fs/gQ3FxwXfg6aPyC3fK05JXTKsk45io4sgD4kTGK/GASsYcnd0yHJ8F7Dtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ec3b429610so10436616a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018622; x=1789623422;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n14d/dnEzXwDjS/vtY0j/4EsG8Peux11qF2MVJrokRc=;
        b=soIt9zDxtRmhNvVpi8zXfZKw4reVYOE8OVYtetrpOLfgQ5BzBr8FS7t71RZuw9WiZQ
         9QgsnFqcvHkRBKvizPYEFKKYx1popMVJ350sZrN9OE/bkeC57g3Q4bXsFp1ZZyOL0WfD
         17/R3rZfvwJ4VqMaKxdamAB4rQ1O1bHoYJdJmpKJmxYfkWswBGA8Z6qbYxWda71Bmphl
         u73Mmz6uqbuq+iOwwal9ih5SajmBxoAS3ni4Z+gSwoXFvZlqIOjR8LWXrL/adhAP4gB7
         9rDZ/XlZbQRdZ0ODMWjdEqBuDWvfM4ZBh+sHLHc99brxbiPTr3t4OEhXgww76GQaKHB8
         A/jg==
X-Forwarded-Encrypted: i=1; AKwUvBzSOz52bwVv3jpxItLPL/YvYQsO3w1EQXYJce8mphjPSMBLiyuSftf6Pk5feYDrASw+S3D5M3N0AUXVZ/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kZYh7ST/frjFbQ/UhPtSg4XY/ZRwFtmbYmm4LcqTB8aVnGROdh
	WD1gjOC2n1uLtPUaLui9nCbKnPbbnTLzP9oUN3ozhv/bysbGDSoNRuaJDmmaq5OWKvPhxt7SgbZ
	AWB3aQ2H1LZHM8mMvgYdR9OGEmlvrasa5yR3GlHYaiH+V0CBs+47L7lunWRk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c85:b0:6b7:46fa:16ad with SMTP id
 006d021491bc7-6bee85ed759mr3471942eaf.66.1789018622705; Wed, 09 Sep 2026
 22:37:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 22:37:02 -0700
In-Reply-To: <20260910040733.22352-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa241fe.f81106d8.2ab401.0007.GAE@google.com>
Subject: Re: [syzbot] [wireless?] BUG: using smp_processor_id() in preemptible
 code in ieee80211_tx_control_port
From: syzbot <syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

                          **
[    1.792715][    T0] **                                                  =
    **
[    1.798501][    T0] ** Use hash_pointers=3Dalways to force this mode off=
      **
[    1.803965][    T0] **                                                  =
    **
[    1.809538][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTIC=
E   **
[    1.814932][    T0] ****************************************************=
******
[    1.821752][    T0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D2, Nodes=3D2
[    1.943270][    T0] allocated 167772160 bytes of page_ext
[    1.947602][    T0] Node 0, zone      DMA: page owner found early alloca=
ted 0 pages
[    1.966625][    T0] Node 0, zone    DMA32: page owner found early alloca=
ted 21251 pages
[    1.974793][    T0] Node 0, zone   Normal: page owner found early alloca=
ted 0 pages
[    1.991039][    T0] Node 1, zone   Normal: page owner found early alloca=
ted 19847 pages
[    1.995618][    T0] Kernel/User page tables isolation: enabled
[    1.999791][    T0] Dynamic Preempt: full
[    2.003321][    T0] Running RCU self tests
[    2.005099][    T0] Running RCU synchronous self tests
[    2.007600][    T0] rcu: Preemptible hierarchical RCU implementation.
[    2.010877][    T0] rcu: 	RCU lockdep checking is enabled.
[    2.013334][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cp=
u_ids=3D2.
[    2.015732][    T0] rcu: 	RCU callback double-/use-after-free debug is e=
nabled.
[    2.018694][    T0] rcu: 	RCU debug extended QS entry/exit.
[    2.021124][    T0] 	All grace periods are expedited (rcu_expedited).
[    2.023924][    T0] 	Trampoline variant of Tasks RCU enabled.
[    2.026688][    T0] 	Tracing variant of Tasks RCU enabled.
[    2.028337][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    2.031013][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D2
[    2.034109][    T0] Running RCU synchronous self tests
[    2.036292][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D2.
[    2.228766][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
[    2.232489][    T0] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
[    2.235324][    T0] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 19112604462750000 ns
[    2.239827][    T0] kfence: initialized - using 2097152 bytes for 255 ob=
jects at 0xffff88823be00000-0xffff88823c000000
[    2.245084][    T0] Console: colour VGA+ 80x25
[    2.247483][    T0] printk: console [ttyS0] enabled
[    2.247483][    T0] printk: console [ttyS0] enabled
[    2.251866][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.251866][    T0] printk: legacy bootconsole [earlyser0] disabled
[    2.257603][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    2.261940][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    2.263749][    T0] ... MAX_LOCK_DEPTH:          48
[    2.265687][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    2.267675][    T0] ... CLASSHASH_SIZE:          4096
[    2.269952][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
[    2.272157][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
[    2.275305][    T0] ... CHAINHASH_SIZE:          524288
[    2.277682][    T0]  memory used by lock dependency info: 106625 kB
[    2.280361][    T0]  memory used for stack traces: 8320 kB
[    2.282414][    T0]  per task-struct memory footprint: 1920 bytes
[    2.285615][    T0] mempolicy: Enabling automatic NUMA balancing. Config=
ure with numa_balancing=3D or the kernel.numa_balancing sysctl
[    2.291031][    T0] ACPI: Core revision 20260408
[    2.294830][    T0] APIC: Switch to symmetric I/O mode setup
[    2.298246][    T0] x2apic enabled
[    2.305430][    T0] APIC: Switched APIC routing to: physical x2apic
[    2.318262][    T0] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1=
 pin2=3D-1
[    2.323719][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x1fb63109b96, max_idle_ns: 440795265316 ns
[    2.329358][    T0] Calibrating delay loop (skipped) preset value.. 4399=
.99 BogoMIPS (lpj=3D21999980)
[    2.334112][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    2.339354][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB=
 4
[    2.343080][    T0] mitigations: Enabled attack vectors: user_kernel, us=
er_user, guest_host, guest_guest, SMT mitigations: auto
[    2.349359][    T0] Speculative Store Bypass: Mitigation: Speculative St=
ore Bypass disabled via prctl
[    2.354378][    T0] Spectre V2 : Mitigation: IBRS
[    2.359359][    T0] RETBleed: Mitigation: IBRS
[    2.361241][    T0] ITS: Mitigation: Aligned branch/return thunks
[    2.364946][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
[    2.367565][    T0] MDS: Mitigation: Clear CPU buffers
[    2.369355][    T0] TAA: Mitigation: Clear CPU buffers
[    2.372469][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attem=
pted, no microcode
[    2.376323][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    2.379361][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on=
 context switch and VMEXIT
[    2.383706][    T0] Spectre V2 : Enabling IBPB for BPF
[    2.385950][    T0] Spectre V2 : mitigation: Enabling conditional Indire=
ct Branch Prediction Barrier
[    2.389403][    T0] active return thunk: its_return_thunk
[    2.392147][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing=
 on syscall and VM exit
[    2.396573][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floati=
ng point registers'
[    2.399361][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE regist=
ers'
[    2.402238][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX regist=
ers'
[    2.409363][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  2=
56
[    2.412569][    T0] x86/fpu: Enabled xstate features 0x7, context size i=
s 832 bytes, using 'standard' format.
[    2.419801][    T0] ------------[ cut here ]------------
[    2.422413][    T0] CPA detected W^X violation: 8000000000000023 -> 0000=
000000000023 range: 0xffffffffa0000000 - 0xffffffffa0000fff PFN 140600
[    2.427891][    T0] WARNING: arch/x86/mm/pat/set_memory.c:725 at __chang=
e_page_attr_set_clr+0x1d69/0x2820, CPU#0: swapper/0/0
[    2.429359][    T0] Modules linked in:
[    2.431164][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    2.434927][    T0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    2.439361][    T0] RIP: 0010:__change_page_attr_set_clr+0x1d79/0x2820
[    2.442491][    T0] Code: 00 00 e8 aa d6 4d 00 48 8b 4c 24 30 4c 8d 81 f=
f 0f 00 00 48 8d 3d 07 99 02 0f 48 8b b4 24 a0 00 00 00 4c 89 f2 4c 8b 4c 2=
4 50 <67> 48 0f b9 3a e9 8d 00 00 00 e8 78 d6 4d 00 4c 89 f8 48 c1 e8 03
[    2.449361][    T0] RSP: 0000:ffffffff8ea07820 EFLAGS: 00010293
[    2.459359][    T0] RAX: ffffffff817ac2e6 RBX: 8000000140600023 RCX: fff=
fffffa0000000
[    2.462919][    T0] RDX: 0000000000000023 RSI: 8000000000000023 RDI: fff=
fffff907d5c00
[    2.466637][    T0] RBP: ffffffff8ea07ad0 R08: ffffffffa0000fff R09: 000=
0000000140600
[    2.469359][    T0] R10: dffffc0000000000 R11: fffffbfff1d40ef4 R12: 800=
0000000000000
[    2.473051][    T0] R13: 0000000000000002 R14: 0000000000000023 R15: 800=
0000000000002
[    2.476352][    T0] FS:  0000000000000000(0000) GS:ffff888124caa000(0000=
) knlGS:0000000000000000
[    2.479359][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.482418][    T0] CR2: ffff88823ffff000 CR3: 000000000eb48000 CR4: 000=
00000003506f0
[    2.486229][    T0] Call Trace:
[    2.489362][    T0]  <TASK>
[    2.491233][    T0]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[    2.494256][    T0]  ? __purge_vmap_area_lazy+0x8ec/0xab0
[    2.497016][    T0]  ? __pfx___change_page_attr_set_clr+0x10/0x10
[    2.499360][    T0]  ? __might_resched+0x71/0x4c0
[    2.502118][    T0]  ? down_read+0x2b9/0x320
[    2.503975][    T0]  change_page_attr_set_clr+0x398/0x11d0
[    2.506152][    T0]  ? __pfx_change_page_attr_set_clr+0x10/0x10
[    2.509369][    T0]  ? trace_kmalloc+0x2a/0xf0
[    2.511042][    T0]  set_memory_x+0xd6/0x110
[    2.512710][    T0]  ? __pfx_set_memory_x+0x10/0x10
[    2.514452][    T0]  apply_retpolines+0x8e9/0x15a0
[    2.517209][    T0]  ? events_sysfs_show+0xdd/0xf0
[    2.519368][    T0]  ? __pfx_apply_retpolines+0x10/0x10
[    2.521794][    T0]  ? events_sysfs_show+0xdd/0xf0
[    2.524279][    T0]  ? events_sysfs_show+0xec/0xf0
[    2.526697][    T0]  ? events_sysfs_show+0xe3/0xf0
[    2.529359][    T0]  ? unregister_die_notifier+0x43/0x50
[    2.531318][    T0]  ? __pfx_int3_selftest+0x10/0x10
[    2.533529][    T0]  alternative_instructions+0x3a/0x100
[    2.535912][    T0]  arch_cpu_finalize_init+0xb2/0x1f0
[    2.537927][    T0]  start_kernel+0x310/0x3e0
[    2.539365][    T0]  x86_64_start_reservations+0x24/0x30
[    2.542812][    T0]  x86_64_start_kernel+0x137/0x1b0
[    2.544878][    T0]  common_startup_64+0x13e/0x157
[    2.547017][    T0]  </TASK>
[    2.549359][    T0] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[    2.552768][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syz=
kaller #0 PREEMPT(full)=20
[    2.557207][    T0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 07/24/2026
[    2.559341][    T0] Call Trace:
[    2.559341][    T0]  <TASK>
[    2.559341][    T0]  vpanic+0x56d/0xa70
[    2.559341][    T0]  ? __pfx__printk+0x10/0x10
[    2.559341][    T0]  ? __pfx_vpanic+0x10/0x10
[    2.559341][    T0]  ? is_bpf_text_address+0x292/0x2b0
[    2.559341][    T0]  ? is_bpf_text_address+0x26/0x2b0
[    2.559341][    T0]  panic+0xc5/0xd0
[    2.559341][    T0]  ? __pfx_panic+0x10/0x10
[    2.559341][    T0]  ? common_startup_64+0x13e/0x157
[    2.559341][    T0]  __warn+0x315/0x4c0
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    2.559341][    T0]  __report_bug+0x276/0x570
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d69/0x2820
[    2.559341][    T0]  ? __pfx___report_bug+0x10/0x10
[    2.559341][    T0]  report_bug_entry+0x19b/0x290
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d79/0x2820
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d7e/0x2820
[    2.559341][    T0]  handle_bug+0xce/0x200
[    2.559341][    T0]  exc_invalid_op+0x1a/0x50
[    2.559341][    T0]  asm_exc_invalid_op+0x1a/0x20
[    2.559341][    T0] RIP: 0010:__change_page_attr_set_clr+0x1d79/0x2820
[    2.559341][    T0] Code: 00 00 e8 aa d6 4d 00 48 8b 4c 24 30 4c 8d 81 f=
f 0f 00 00 48 8d 3d 07 99 02 0f 48 8b b4 24 a0 00 00 00 4c 89 f2 4c 8b 4c 2=
4 50 <67> 48 0f b9 3a e9 8d 00 00 00 e8 78 d6 4d 00 4c 89 f8 48 c1 e8 03
[    2.559341][    T0] RSP: 0000:ffffffff8ea07820 EFLAGS: 00010293
[    2.559341][    T0] RAX: ffffffff817ac2e6 RBX: 8000000140600023 RCX: fff=
fffffa0000000
[    2.559341][    T0] RDX: 0000000000000023 RSI: 8000000000000023 RDI: fff=
fffff907d5c00
[    2.559341][    T0] RBP: ffffffff8ea07ad0 R08: ffffffffa0000fff R09: 000=
0000000140600
[    2.559341][    T0] R10: dffffc0000000000 R11: fffffbfff1d40ef4 R12: 800=
0000000000000
[    2.559341][    T0] R13: 0000000000000002 R14: 0000000000000023 R15: 800=
0000000000002
[    2.559341][    T0]  ? __change_page_attr_set_clr+0x1d56/0x2820
[    2.559341][    T0]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[    2.559341][    T0]  ? __purge_vmap_area_lazy+0x8ec/0xab0
[    2.559341][    T0]  ? __pfx___change_page_attr_set_clr+0x10/0x10
[    2.559341][    T0]  ? __might_resched+0x71/0x4c0
[    2.559341][    T0]  ? down_read+0x2b9/0x320
[    2.559341][    T0]  change_page_attr_set_clr+0x398/0x11d0
[    2.559341][    T0]  ? __pfx_change_page_attr_set_clr+0x10/0x10
[    2.559341][    T0]  ? trace_kmalloc+0x2a/0xf0
[    2.559341][    T0]  set_memory_x+0xd6/0x110
[    2.559341][    T0]  ? __pfx_set_memory_x+0x10/0x10
[    2.559341][    T0]  apply_retpolines+0x8e9/0x15a0
[    2.559341][    T0]  ? events_sysfs_show+0xdd/0xf0
[    2.559341][    T0]  ? __pfx_apply_retpolines+0x10/0x10
[    2.559341][    T0]  ? events_sysfs_show+0xdd/0xf0
[    2.559341][    T0]  ? events_sysfs_show+0xec/0xf0
[    2.559341][    T0]  ? events_sysfs_show+0xe3/0xf0
[    2.559341][    T0]  ? unregister_die_notifier+0x43/0x50
[    2.559341][    T0]  ? __pfx_int3_selftest+0x10/0x10
[    2.559341][    T0]  alternative_instructions+0x3a/0x100
[    2.559341][    T0]  arch_cpu_finalize_init+0xb2/0x1f0
[    2.559341][    T0]  start_kernel+0x310/0x3e0
[    2.559341][    T0]  x86_64_start_reservations+0x24/0x30
[    2.559341][    T0]  x86_64_start_kernel+0x137/0x1b0
[    2.559341][    T0]  common_startup_64+0x13e/0x157
[    2.559341][    T0]  </TASK>
[    2.559341][    T0] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build1689222315=3D/tmp/go-build -gno-record-gc=
c-switches'
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
HEAD detached at 8387c27382b
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3D8387c27382b21161a70829b74fa8d5e67db1d2fc -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20260908-183216"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3D8387c27382b21161a70829b74fa8d5e67db1d2fc -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20260908-183216"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D8387c27382b21161a70829b74fa8d5e67db1d2fc -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20260908-183216"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"8387c27382b21161a70829b74fa8d5e67d=
b1d2fc\"
/usr/bin/ld: /tmp/ccGskpE3.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x386): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D12469ef9580000


Tested on:

commit:         c68a9828 Add linux-next specific files for 20260909
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6a696a9324965b3=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd979bd35c8a76fd1b=
6f5
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D103cc6015800=
00

