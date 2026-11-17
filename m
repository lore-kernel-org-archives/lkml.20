Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912510;
	b=XLrjkfAc2i1v+GopuG0oEs3mS8DtKkIRbRcuw91V/K0W9O7RvaVxJGEQUMc+mNOcqfps
	 XHMCa4fnl82OhBjCTowkDFt9/ZpJU2sUQhYtwTBOxDq2a3ViXohYAFbGxylL4S2hFcM//
	 pTIbvCKw5Lnfb89576hAdmMM8EY376QWrTMZHjjT8MPS9bultdJjP5DKaJRy05HQfjiOa
	 KXDOgvXIWsFm2elYyjTd4JYlE6OjgMcTJCRZvYgN+wblcTmKhG/DlMkK7hzWjt407JEV/
	 tIFVpdAbl+B+qoNrw0gPTjQFSJe69UFLzodlA7reT6OiGq1NwQeB5TccoyivU9jt1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WURIiMxNR3xsldJip7SJGuSNUVmAiqFp8g8cTPnVjMo=;
	b=UpDI8BKCJDAaIejgoc264HHVoxv1FXK36Pk1Rp5nCwycVG/hZr8vir8KeqGGviJ1hYbL
	 h3BaFPVHTozmPaRbnzO5a9hJJZatfQ8l4XIrRNxAv6NVUn+TG3USuz1xYpj94QkmdelfA
	 sctU5yi2lYxduJHE5p5YlNiG0uVqURyIBAeQw+0RPHXGIg4Xsx+Y0zk+rsZ5P+3vfy1d2
	 2BD6M7bWIO2amjKTr2g1nfyKXduNnMBD3G4kgNkQDfYSwII4RPFmQIwM5oUVCDiPIxU++
	 pBpxGtFbVLVyUiu49QcBe96536vSxtpvp7JvLDcRAIPTfby+mnKE3OBBteS7seIfKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7xXhZLH;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7xXhZLH
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfc004920so45225901fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912508; x=1795517308; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WURIiMxNR3xsldJip7SJGuSNUVmAiqFp8g8cTPnVjMo=;
        b=q7xXhZLHyPJbGr1DRN2d+PYA8X+yQ3exDYT5iDPmKLGuT0vM6/XbefZF0gPmU4lpHe
         LyhqYA990LNx+WlLekzy35jcCb5mtd/3YhukWDBRl5/0Td9An8/5+38DTjVLmJoJNyWT
         fe3M6zzF1EdLNV+vCII3d6lsCuJRcX7t4JbhFcmY00vDBgSv1ITC/hMsINlxqZWj/HgE
         sPbYOa1nbxamrTitWoXNUyVAsZzAnL7DdyI+plI/jlZDxLFtyQHiRtO55TuC7OHMnTyZ
         3LgiIrC6wzwR1i4oNKZmq+HgU6v+lWumVMq0WdV4/sjrCS+5c3Xm5ktZ4JpOfngfplMD
         Xr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912508; x=1795517308;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WURIiMxNR3xsldJip7SJGuSNUVmAiqFp8g8cTPnVjMo=;
        b=IFuS7x/Yzg7+O5ecq7G5I47zorrCZmuqqB7X/c+ZHuIUUQHrqh/K7ewJiXqdSWleo2
         /cDmKVlWw+skI/ap82CXMfUbsRKKfx/JrbRKw8lhF3d6W62j0hD4+d7Rhqu5HKhQcZMb
         YCMLKss70B8X5VLNgjxYdJh9X0DDjgIFG9spp9/MCO/OfYdZT6akGT0NJFvDA1aLfRFI
         Xpf5xBhD35h0R8UTz3LmyyCdWlPtMozdSIF8IadlKgOW95/+mRj2l1la2WldsqSB87gv
         1rSZAgcu60VlW+tKOdxnI4mulMoLPkiELcLj9ATfA8jDeFH2WQHWA1d+/msV7foJulbq
         hVhg==
X-Gm-Message-State: APuU4Z/1hrtTr/5J1KravI5wzu99umVTl7jYEg4VY9m8fkoZZxzWE1sG
	6xL5OTxlp16igkrg4vb62nEK3cQ4WTYihjRrVCdRVtm74SHleNMlotF2reTOoh3KgKA=
X-Gm-Gg: AYBFou0igkA/B9dWBMofEKT/AVFMx8p+fHVQEdkWFRZ7W5qc64NzUadjW0gdQwLtb/2
	+J4Qigm1KHcZkOv88dkWPkMBJ51TRP5BNgRwS+vAw37zyOsDMsbt0lZEf+9z9n160eGlySy0Kz7
	wi1h4h/4YZ8ohxa0kYCrBKEkPrcYsqtKWQDC4gCdMCZnrFevgHVbVO2X3PQwoL9KOVTtHd7ZZzy
	mkPjwZLgElZeHmAArNNe3s9kGeHuEkDBf69S0GUHIZRuD9InFpDlLlF85thuJqbxdlH4Jeunv6R
	/3SM4KKUs1eTjukAI2ZkKSc7N5Mdse3A/T/lxFeg+SMVj1qCbxCWBxh9KE1yOcmU5BzL9GdJPlp
	xupcLEURPP+/61plRiIUbf6d6v9r6itfcLOkvUfLhO0aaQ7xTwLjIHa7HCKt6P+Tej+fA1RJBOL
	Og+b4N4WJ+UdN25s0l+/ybGCms53VEzUV57cAL/4vU6ZSLWFvqRacSSlqRrXH34lMhJwRj4C+nC
	UNkWwzhXo9P1fLdEm0P4lmFP6rFSXKcS//ID6R+NKqSk34j+qNDHm0qZPugavunMlWIT+fDLXU5
	KvM4jCqaIvdk5x5LMJZQI9jbLxj/HSc=
X-Received: by 2002:a05:6512:239f:b0:5bf:c239:71ad with SMTP id 2adb3069b0e04-5c1709da54fmr5177140e87.38.1794912507951;
        Tue, 17 Nov 2026 02:48:27 -0800 (PST)
Received: from [192.168.1.128] (smtp.eryepa.ru. [79.133.183.135])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19ed57c2bsm713729e87.42.2026.11.17.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:48:26 -0800 (PST)
From: Eryepa Yerepilov <yerepilov@gmail.com>
X-Google-Original-From: Eryepa Yerepilov <yerepilov>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>
Subject: [BUG] timers/nohz: Oops in wake_up_nohz_cpu+0xb with cpumask index -1
Date: Tue, 17 Nov 2026 13:48:25 +0300
Message-ID: <179491250540.103352.8910296528541632789@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Summary: 7.3.4-arch1-1 panicked in idle on CPU 0 inside
wake_up_nohz_cpu(), reached from __mod_timer() by the clocksource
watchdog timer. The faulting instruction is a bit test against a static
cpumask, with the index in RAX = 0xffffffff, i.e. -1.

Full trace, copied from pstore (efi_pstore backend; the journal did not
survive the panic, the machine rebooted ~10 s later because of
panic_on_oops=1). Timestamps are seconds since boot, uptime 43040 s:

 [43040.869305] BUG: unable to handle page fault for address: ffffffffadef72d8
 [43040.869312] #PF: supervisor read access in kernel mode
 [43040.869315] #PF: error_code(0x0000) - not-present page
 [43040.869318] PGD 47ac25067 P4D 47ac25067 PUD 47ac26063 PMD 0
 [43040.869324] Oops: Oops: 0000 [#1] SMP NOPTI
 [43040.869329] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G           OE       7.3.4-arch1-1 #1 PREEMPT(full)  6c50e2b86768c03b0a904a1018778cfad2de7f30
 [43040.869339] RIP: 0010:wake_up_nohz_cpu+0xb/0x160
 [43040.869346] Code: 07 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 0f 1f 44 00 00 89 f8 <48> 0f a3 05 3d ed 72 02 0f 83 da 00 00 00 48 83 ec 10 89 fe 66 90
 [43040.869349] RSP: 0018:ffffcff5c0003dd0 EFLAGS: 00010082
 [43040.869352] RAX: 00000000ffffffff RBX: ffff8d0c0ea1dfc0 RCX: 0000000000000000
 [43040.869355] RDX: 000000001b000000 RSI: ffffffff8e9b66e0 RDI: 00000000ffffffff
 [43040.869357] RBP: ffff8d0c0ea1dfc0 R08: ffff8d0c0ea1dfc0 R09: 00000001028c3160
 [43040.869359] R10: 00001e45a76494c8 R11: 0000000000000009 R12: 0000000000000000
 [43040.869362] R13: 00000001028c315c R14: ffffffff8e9b66e0 R15: 00000000ffffffff
 [43040.869364] FS:  0000000000000000(0000) GS:ffff8d0c80110000(0000) knlGS:0000000000000000
 [43040.869367] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [43040.869369] CR2: ffffffffadef72d8 CR3: 000000019bf59000 CR4: 0000000000f50ef0
 [43040.869372] PKRU: 55555554
 [43040.869374] Call Trace:
 [43040.869376]  <IRQ>
 [43040.869378]  __mod_timer+0x2b4/0x3a0
 [43040.869384]  ? __pfx_clocksource_watchdog+0x10/0x10
 [43040.869389]  clocksource_watchdog+0x559/0x590
 [43040.869393]  ? __pfx_clocksource_watchdog+0x10/0x10
 [43040.869398]  call_timer_fn+0x2a/0x140
 [43040.869402]  ? __pfx_clocksource_watchdog+0x10/0x10
 [43040.869405]  __run_timers+0x27c/0x330
 [43040.869412]  run_timer_softirq+0x46/0xf0
 [43040.869415]  ? irqtime_account_irq+0x33/0xd0
 [43040.869419]  handle_softirqs+0xde/0x290
 [43040.869429]  __irq_exit_rcu+0xb9/0x110
 [43040.869433]  sysvec_apic_timer_interrupt+0x71/0x90
 [43040.869438]  </IRQ>
 [43040.869440]  <TASK>
 [43040.869442]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
 [43040.869446] RIP: 0010:cpuidle_enter_state+0xbb/0x400
 [43040.869473]  cpuidle_enter+0x31/0x50
 [43040.869477]  do_idle+0x1d3/0x2f0
 [43040.869483]  cpu_startup_entry+0x29/0x30
 [43040.869487]  rest_init+0xf7/0x100
 [43040.869497]  start_kernel+0xa0e/0xa20
 [43040.869502]  x86_64_start_reservations+0x24/0x30
 [43040.869507]  x86_64_start_kernel+0xda/0xe0
 [43040.869511]  common_startup_64+0x13e/0x151
 [43040.869519]  </TASK>
 [43040.912025] Kernel panic - not syncing: Fatal exception in interrupt

What the registers say

The faulting instruction at wake_up_nohz_cpu+0xb is

  48 0f a3 05 3d ed 72 02    bt %rax,0x272ed3d(%rip)

i.e. a bit test on a static cpumask with the bit index in RAX. RAX and
RDI both hold 0xffffffff, so the index is -1 and the effective address is
the mask minus one 8-byte word: the faulting address 0xffffffffadef72d8
is exactly 8 bytes below the tested mask at 0xffffffffadef72e0. That
address is above the end of the image (link base 0xffffffff81000000,
boot offset 0xac00000) and unmapped - hence error_code 0 with PMD 0.

The mask test therefore behaves as written; the wrong value is the CPU
number, which arrives at wake_up_nohz_cpu() as -1. The call chain is the
clocksource watchdog timer (re-armed from its own callback) ->
__mod_timer() -> wake_up_nohz_cpu().

Where a -1 CPU can come from on that path is what I could not work out
from the code I have at hand, so I would appreciate a hint. A timer that
re-arms itself from its callback on an idle CPU does not look like an
exotic pattern, so this may be reachable more often than this single
report suggests.

Environment

 - 7.3.4-arch1-1 (Arch build), PREEMPT(full), SMP NOPTI,
   CONFIG_NO_HZ_FULL=y (tick_nohz_full_mask exists; no nohz_full= on the
   command line)
 - the kernel is tainted G OE: out-of-tree unsigned modules are loaded
   (NVIDIA 620.70.06 open modules, msi_psu). There was no WARN or BUG in
   that boot before the Oops, and no MCE/EDAC entries in it at all.
 - AMD Ryzen 9 5950X, ASUS ROG CROSSHAIR VIII DARK HERO, BIOS 4402
 - a desktop that suspends and resumes routinely, which is why the
   uptime counter is large (suspend time is not counted)
 - "clocksource: Watchdog remote CPU N read timed out" is logged once per
   boot on this machine, 1-70 s after start-up (N varies). I mention it in
   case it is related; it may just be the watchdog probing before all CPUs
   are up.

Caveat: the same machine also hits a separate mm/shmem problem on 7.3.4 -
"BUG: Bad page state ... refcount:0 mapcount:-1" from shmem_undo_range,
pages evidently released while still mapped - so memory corruption cannot
be ruled out completely. What makes me read this trace as a logic bug
rather than as corruption is that RAX/RDI hold a well-formed -1 and the
tested address is exactly mask - 8, which is what a bit index of -1
produces; a corrupted index would not land one word before a mask.

Happy to test patches, gather more data, or rerun with tracing enabled.

Thanks,
Eryepa Yerepilov
