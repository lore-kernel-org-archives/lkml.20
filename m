Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78049B1F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827959; cv=none; b=oYuW/J5YjFxzB3IqREyKUaFMTpWuvl4emKEfVbFWuJb6bAKPtksVSWImNrgYYRT8SF2enp6WM+HWryIR3crOYNY1bSCUlbeD2SHW8SMnEfLzc4W+uX1vmkyKx56va325qu+Q1xGszNW/i0SHqpTugZvUmfqGlcYTiscq+t0SKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827959; c=relaxed/simple;
	bh=G9B03UKcTcPd8pqEJVQx2l5PLzREm3u73PnX1yaY9eA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=ImnkXF8qOZp8TlkjG3rAm0GmWEt4Bu+1gT12mVhuwK1U3kUNCoKr2FbvklNIyXJlmrthbuyKe2SRBvMgKAMK4I/gjQ4maEp/8prV2JCrzhAFfIoM5IaTU04T3M5HKb1np++hPJNPp2A18V9cNIXhDDvsfDbbfB2bMC1Xh1kkii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=S3hvgmwS; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="S3hvgmwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791827948; bh=Vb9xf+bFbWYuM9Qbr8kFLGqDXPLZaUyz9lafyBs3s/8=;
	h=From:To:Cc:Subject:Date;
	b=S3hvgmwSlzyBYODdhorNGnkEISdKcJ+J+mqujPVnxOSI1Ky5RGlqbdSROvIn5QbQp
	 VMvwhqmtjWhwpe3pTw5g2/IgLypN2aRTFv+IYtVATVScGGrD9NZQ2+s6uGwg5WevoG
	 gWTsvY9sKfR7h43XjzD9/GAYRio/RLj1mOcynbj0=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id EC585A57; Tue, 13 Oct 2026 01:59:05 +0800
X-QQ-mid: xmsmtpt1791827945t9hdi589f
Message-ID: <tencent_295112A919DFDA23354E71A63251A93E6C08@qq.com>
X-QQ-XMAILINFO: NCmjBvJFq6XNqj4DblHVVDXoac4Uxc/x9u8Dz0+CXN/DvRQeClrRfP3ye5+GmM
	 gCs22Tji6+MhaBqhhp80Iwk0yS+b0yqPpwYda+q+X9IykS8Ev6Rsy0mdlB8bS1d/froD+TKNGu9+
	 P3emcxK1EKkI3SAV/3lKG75aLqItOfLNY1SBOMb2fYCA1bhJ19GC0Wj0FAaFmlw7ldJGz+z0Yglv
	 1K8XshRInS6D4gXn4n5+xzziyNlAMPbCViM+A6KMQWMhV0Z1HzeD8tRw46SJYf9TYW+ZHBk2QpFP
	 5+Vg0QvTjZlFFwKkZ5p0ekagxWfPWFr1JuRAdN5dJChata4J2kxAQaeayBQBqGDE5ySSgMzRstjB
	 HhDRvduu2ln9KEh5awIjY9tvyEGyz7pTRsbjQs1NvA75qSXG0kHjy4FouzT5UEaaOnnkxno9qaRC
	 GxqCkjVEC8zK35xLMFCqQ6SVTrcpA9lySuJkwnBHxmx1C1DzUE90/5r2yR9SpYDmki1Fh3FY60Zg
	 D9Y8c3xQh/O9ud4xwpF7ipjufV4PKWczF1tcxZQOXfNNlCtsQiZNoIOSi9oeTCk0uPq8jZ+P+mZs
	 qzAMA6qqCwjY6XzfIttdtkVpm0UJBl4DyIUS8veDSR5iFqo/hsLJQ3awJfxhLev7BjnV9ijM4Emg
	 PytF7uFFg2wcdDxI4bdbz5yEeXAtypDlbiwswdn6edu276v4WRQ1lcpRLInxstVvYH+U+p5RbkkR
	 fOcM0m4JaZBT1K5flddtPIoyMEADRNiytZCcJbm1Ut7/vzqWkxni9/OJROqOxD6VFQkRaG0S0BIo
	 DAvZsOdgEz57LpVLlySg6OYprzR98uNeT2TggjviVYdrGxxIlUE/2O0h/egwz3QnrTfHzpZgzQVg
	 PFkdIrcgo6NXO46x35mExzrkmh4GQd1IapE121WibsLZpTdjYCmzTLTQKeUhrnGl0GMXWU5KpAa0
	 8sJ7Npichug0LGAlOnR3N7bun+/EZfKVM1kIE+FRbiS6L6IcYhkV75kI+JP2IVbdBZeP5vyoNqpX
	 eEOtRSmWv41+FlZi09IMrkDaOVx+OLxqah9+Yk/rkLgVQ81DllW6RVTOw62jo=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: 1sh1ro <yangguikun19@qq.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: wild-memory-access in handle_edge_irq while a CPU is in identify_cpu() during early boot
Date: Tue, 13 Oct 2026 01:59:04 +0800
X-OQ-MSGID: <20261013015904.44144-kasan-early-boot@yangguikun19.qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Andrey, Thomas,

fuzzing with syzkaller on KASAN kernels I hit a wild-memory-access report that
fires at early boot, while a CPU is running identify_cpu() and an edge IRQ
arrives.  With panic_on_warn=1 (the syzkaller/syzbot default) this panics the
booting kernel, i.e. it makes fuzzing VMs fail to start.  I have two
occurrences on two different kernels, and the address forensics suggest this
may be a KASAN-side issue rather than memory corruption -- I would appreciate
your opinion on which it is.

Occurrence 1 -- 7.2.0-rc5

BUG: KASAN: wild-memory-access in do_raw_spin_lock+0x11c/0x270
Write of size 4 at addr ff110000158860a8 by task swapper/0/0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc5 #1 PREEMPT(full)
Call Trace:
 <IRQ>
 kasan_check_range+0x39/0x1c0
 do_raw_spin_lock+0x11c/0x270
 handle_edge_irq+0x2e/0x990
 __common_interrupt+0xd1/0x2f0
 common_interrupt+0xf0/0x110
 </IRQ>
 <TASK>
 asm_common_interrupt+0x26/0x40
RIP: 0010:get_cpu_cap+0x12f/0xc10
 identify_cpu+0x2f9/0x1e30 common.c:-1
 arch_cpu_finalize_init+0x58/0x3b0
 start_kernel+0x373/0x4d0
 x86_64_start_reservations+0x18/0x30
 </TASK>

Occurrence 2 -- 7.3.0-rc5 (same bug, cpu_detect() is the renamed get_cpu_cap())

BUG: KASAN: wild-memory-access in _raw_spin_lock+0x71/0xe0
Write of size 4 at addr ff110000010ca8a8 by task swapper/0/0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc5 #2 PREEMPT(lazy)
Call Trace:
 <IRQ>
 kasan_check_range+0x39/0x1c0
 _raw_spin_lock+0x71/0xe0
 handle_edge_irq+0x2e/0x980
 __common_interrupt+0x7c/0x190
 common_interrupt+0xb8/0xd0
 </IRQ>
 <TASK>
 asm_common_interrupt+0x26/0x40
RIP: 0010:cpu_detect+0x20a/0x470
 identify_cpu+0x2df/0x1750 common.c:-1
 arch_cpu_finalize_init+0x25/0x3c0
 start_kernel+0x39c/0x490
 </TASK>

Why I suspect the shadow rather than memory corruption (7.2-rc5 case)

* page_offset_base is ff11000000000000 (5-level paging), so the address is
  physical 0x158860a8 = 360 MB.  /proc/iomem shows System RAM there, and it is
  immediately past the kernel image:

      01000000-0b33fec7 : Kernel code
      0b400000-0dafbfff : Kernel rodata
      0dc00000-1036a4ff : Kernel data
      1352a000-15577fff : Kernel bss
      0x158860a8        <- just past the image, early-boot allocation area

  /proc/kpageflags for that PFN (0x15886) reports SLAB, so it is a legitimate
  early slab page (most likely the irq_desc itself).
* The report contains no "The buggy address belongs to the object at ..." /
  "belongs to the cache ..." section -- KASAN could not resolve the address to
  any object, which is what the shadow looks like when it is not in a valid
  state for that region (early boot / embedded percpu / init shadow).
* It fires exactly while a CPU is in identify_cpu(), i.e. the earliest boot
  phase, and it is timing dependent: it is rare (0 hits in 30+30 clean boots
  under light load; the fuzzer saw it about 3 times in two weeks, i.e. under
  load), which points at a race rather than a deterministic bad pointer.

Environment

* syzkaller-style x86-64 kernels, KASAN_GENERIC + KASAN_INLINE (the 7.2 build
  also has KASAN_VMALLOC + DEBUG_VM; the 7.3 build has neither but does have
  RANDOMIZE_MEMORY), QEMU/KVM, 1-2 vCPUs, syzkaller's cmdline
  (numa=fake=2, page_owner=on, rcupdate.rcu_expedited=1, ...).

Reproducing

Boot the KASAN kernel with panic_on_warn=1 (or 0, and watch dmesg) with 1
vCPU, syzkaller-style cmdline, and repeat: it shows up every few tens of
boots, more often when the host is loaded.

Question

Is this a known limitation of KASAN for that early-boot region (shadow not yet
valid / embedded percpu / init memory), i.e. a false positive, or is the lock
access genuinely wild?  If it is a false positive, is there a supported way to
have early-boot code not trip it (we currently work around it by booting the
fuzzing VMs with panic_on_warn=0, which loses real warnings)?  Any pointer to
how to dump the shadow state for that address would also help me narrow it
down.

Thanks,
1sh1ro

