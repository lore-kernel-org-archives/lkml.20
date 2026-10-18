Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F4F395240
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356875; cv=none; b=IHILX9XFFxBZvPgO+oTQIQY61Wr4bLHiDeBardws+LHClLzLvKVHjZUp/NYKdueX55dwSkg8grlZ287DLPXaUjuCuQPwYgwlfqNPI458dEpNNpFveR7vJkgrIKicrIz3yT0/tfmI5Iogp35angjga7VwLv8CYmqcyRdHJ8P/S3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356875; c=relaxed/simple;
	bh=UBAs82337AolrLkIf5FGFx1bFmLafbgzPEUVV70lYTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qj6x4kdQKsvMAh3iUJIl278G4qox4jtCbS2N8UCmnkRRcrLJeXuzwRkt4VcGDpdhvWDP++Mfb+NV8WdCQfkVQoUUlAB1UpDqSLH6sWGdqFNKNXcMAJaNs4XjRA10nUqkqgGQpN16AYDCJoxoBu4XNRBPhu9g6/1IdjuQLoP/qeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/atrUVX; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/atrUVX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53381e53b80so19627781cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792356873; x=1792961673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C++u6t/j/bpdXW85SGtKu8asGtwuQpgg01rY7vIXavw=;
        b=c/atrUVXn/et8k51J1C56WKsuDa8bVYdBjz9PZrRTTbioT1JjSyWkJ3A8YPe36Nda7
         SUC0yGrzvLl0+cYkKXLuUmwVaPyniXBoKdJqAnVxBO3f78fXxkWkZf5j+md1pjbtWYl4
         5yXbhnVYiWJ8J7YL6D8as5fiBpiRZJs+jdaopUVxaBo+iYii8ar9OYWsm52yuAFqMRpy
         TzcZLf+amSEDv8rv/3SZI7H40OY+RxpCTxHf2wpStln3thcr7Y8GbkTQrMSKYItWKkoQ
         n8HEgM2+R8ylWsWw1VD3HFPsIlF44/TlgvRPbXDVd32cmsMkfx2xhTlVFQnUlpu9K0ga
         wUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356873; x=1792961673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C++u6t/j/bpdXW85SGtKu8asGtwuQpgg01rY7vIXavw=;
        b=0H2upanMef5kHlDdwQQX616IAnAopk2oWawlZPMtpd4uLMoMR/HshlP9i6K76CKOKu
         ckazqYSLnm1+ZcU4iwG5CXn7kgjB79uxaBWbSsXvlMBZMJVW0jdBjSUscDaSRKFBx3KD
         t5S0bGt7DjhE5NSCUHGdadiec52mQiBvC34DceXwD2wPaxd3dEQuyVauYe+SZm76YhJ5
         cWUS73mA8OxNpqyZH1puuCdOZ9Pa1qCCeFfYgOlKy7uKEEyntKvA5yhZDexYIPf+L013
         2MQC2J1KDA1gyFDoBtKPOGUuxaUQWe0QY4QGYGjKzm4vnC+729GrtRisa1cFZZNsXUJt
         wKLg==
X-Forwarded-Encrypted: i=1; AKwUvBwIrW3tWm9YLVz+2RdkoEHAcPAvgJgtZABw1yxv1zLEpVH7n0cKvMyhmDOOSdY/WMbgEEgKFPa+Ig5YrEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBE6bQM2t4rslxiPdzT4sXagq6cnxMrhaAhRUHBZsbDfxChbAO
	3oxek5Lu9xoYJfebeslTvWzJJR8f5pGj1Ozx/QLfLJ/in7H1h5OaVXtB
X-Gm-Gg: AYBFou3CXtp8O9mVtw+6OF7OS/wlhyPd4QjiM6OFROw0nqFArPW/eu+9r6iXM5URnij
	btkOzJmCmjs2iTganNDLBmv5jJsULOPQI1rDggWBN/XunjiMkM7bBmD510Qbj8ALd4xKuwRs5QR
	5HhJmC1HfwKBK4keyikguszJ9F1IkuHxhNA5jatBTsxVuD/xkmjrnwNvw1MHHxn+LemQ454vqRT
	DaMIMrryYW3XzAplIAXeTY3R6AMRfI2BgAHc07BuLdliKtBMy2pgvrD0T9M+zsRNhXfvb2CUklU
	1k/f/kMzVZm2UQOwBria2oosxsUdd6fSMz9YxN7l6wQMecNlMFzH4/tjHiPfh6/9SznNJUdWgLW
	xNKLKJtSUCxT/bVqHrDAst3w3/Eg4JJH72VYO0hruo0uyNt1juwPNBTLH1HDcbTJvhTfANxDzao
	9B0LtqOV16m79dDi6tPcMza0QEMKuHsemjLbcMa/BPdKbDnF+3hAJGQMXdHK255pQUsPCKbChxR
	06519vlcyAWszgghy1RJWwwj2tq
X-Received: by 2002:a05:622a:138f:b0:535:e8c:4258 with SMTP id d75a77b69052e-53645feaae2mr88127051cf.54.1792356872708;
        Sun, 18 Oct 2026 13:54:32 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8dac81sm80471341cf.6.2026.10.18.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:54:32 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] NVMe: KASAN slab-use-after-free in __run_timer_base
Date: Sun, 18 Oct 2026 16:54:14 -0400
Message-ID: <20261018205420.4080423-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in __run_timer_base

on commit: 58161ead29e50d70a317ea26b472e0c7508e69da (2026-10-16)

To help trigger the bug more reliably, we applied a minimal diagnostic patch
that only adds delays and print statements.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/353855e21730d39b56943359215df2f8

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[   97.002406] ==================================================================
[   97.002426] BUG: KASAN: slab-use-after-free in __run_timer_base (include/linux/list.h:1175 kernel/time/timer.c:1820 kernel/time/timer.c:2356 kernel/time/timer.c:2386)
[   97.002500] Write of size 8 at addr ffff88811d710e40 by task swapper/0/0

[   97.002533] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   97.002541] Call Trace:
[   97.002547]  <IRQ>
[   97.002552]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   97.002567]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   97.002602]  kasan_report (mm/kasan/report.c:595)
[   97.002628]  __run_timer_base (include/linux/list.h:1175 kernel/time/timer.c:1820 kernel/time/timer.c:2356 kernel/time/timer.c:2386)
[   97.002682]  tmigr_handle_remote (kernel/time/timer_migration.c:985 kernel/time/timer_migration.c:1076 kernel/time/timer_migration.c:564 kernel/time/timer_migration.c:581 kernel/time/timer_migration.c:1135)
[   97.002742]  handle_softirqs (kernel/softirq.c:645)
[   97.002757]  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softirq.c:758)
[   97.002768]  sysvec_apic_timer_interrupt (archkernel/apic/apic.c:1062 archkernel/apic/apic.c:1062)
[   97.002783]  </IRQ>
[   97.002787]  <TASK>
[   97.002791]  asm_sysvec_apic_timer_interrupt (archinclude/asm/idtentry.h:674)
[   97.002802] RIP: 0010:pv_native_safe_halt (archinclude/asm/irqflags.h:48 archkernel/paravirt.c:63)
[   97.002818] Code: 83 fa 01 00 cc 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 55 5c 19 00 f3 0f 1e fa fb f4 <e9> 58 fa 01 00 cc 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90
All code
========
   0:	83 fa 01             	cmp    $0x1,%edx
   3:	00 cc                	add    %cl,%ah
   5:	66 90                	xchg   %ax,%ax
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	f3 0f 1e fa          	endbr64
  1b:	eb 07                	jmp    0x24
  1d:	0f 00 2d 55 5c 19 00 	verw   0x195c55(%rip)        # 0x195c79
  24:	f3 0f 1e fa          	endbr64
  28:	fb                   	sti
  29:	f4                   	hlt
  2a:*	e9 58 fa 01 00       	jmp    0x1fa87		<-- trapping instruction
  2f:	cc                   	int3
  30:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	e9 58 fa 01 00       	jmp    0x1fa5d
   5:	cc                   	int3
   6:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[   97.002826] RSP: 0018:ffffffff85607ce8 EFLAGS: 00000206
[   97.002839] RAX: ffff8882d1236000 RBX: ffffffff85615880 RCX: ffffffff846b6184
[   97.002847] RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000017cc4
[   97.002854] RBP: ffffffff85607db8 R08: ffff888258030f8b R09: 1ffff1104b0061f1
[   97.002860] R10: dffffc0000000000 R11: ffffed104b0061f2 R12: 0000000000000000
[   97.002866] R13: 1ffffffff0ac2b10 R14: 0000000000000000 R15: dffffc0000000000
[   97.002884]  default_idle (archkernel/process.c:767 archkernel/process.c:768)
[   97.002893]  default_idle_call (kernel/sched/idle.c:122)
[   97.002902]  do_idle (kernel/sched/idle.c:199 kernel/sched/idle.c:355)
[   97.002934]  cpu_startup_entry (kernel/sched/idle.c:454)
[   97.002945]  rest_init (init/main.c:732)
[   97.002987]  start_kernel (init/main.c:1190)
[   97.002999]  x86_64_start_reservations (archkernel/head64.c:310)
[   97.003060]  x86_64_start_kernel (archkernel/head64.c:291)
[   97.003073]  common_startup_64 (archkernel/head_64.S:418)
[   97.003088]  </TASK>

[   97.003095] Allocated by task 380 on cpu 1 at 16.265072s:
[   97.003104]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   97.003116]  __kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
[   97.003125]  nvme_rdma_create_ctrl (include/linux/slab.h:991 include/linux/slab.h:1312 drivers/nvme/host/rdma.c:2289 drivers/nvme/host/rdma.c:2367)
[   97.003138]  nvmf_dev_write (drivers/nvme/host/fabrics.c:1361 drivers/nvme/host/fabrics.c:1408)
[   97.003148]  vfs_write (fs/read_write.c:685)
[   97.003157]  ksys_write (fs/read_write.c:739)
[   97.003166]  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
[   97.003175]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

[   97.003186] Freed by task 26 on cpu 0 at 76.560994s:
[   97.003193]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   97.003202]  kasan_save_free_info (mm/kasan/generic.c:584)
[   97.003210]  __kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
[   97.003220]  kfree (include/linux/kasan.h:235 mm/slub.c:2748 mm/slub.c:6509 mm/slub.c:6802)
[   97.003230]  nvme_free_ctrl (drivers/nvme/host/core.c:5202)
[   97.003240]  device_release (drivers/base/core.c:?)
[   97.003251]  kobject_put (lib/kobject.c:689 lib/kobject.c:720 include/linux/kref.h:65 lib/kobject.c:737)
[   97.003263]  process_scheduled_works (kernel/workqueue.c:3396 kernel/workqueue.c:3479)
[   97.003272]  worker_thread (kernel/workqueue.c:3560)
[   97.003281]  kthread (kernel/kthread.c:436)
[   97.003291]  ret_from_fork (archkernel/process.c:158)
[   97.003304]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

[   97.003316] Last potentially related work creation:
[   97.003320]  kasan_save_stack (mm/kasan/common.c:57)
[   97.003330]  kasan_record_aux_stack (mm/kasan/generic.c:556)
[   97.003338]  insert_work (kernel/workqueue.c:2272)
[   97.003345]  __queue_work (kernel/workqueue.c:2448)
[   97.003356]  queue_work_on (kernel/workqueue.c:2501)
[   97.003364]  nvme_delete_ctrl (include/linux/workqueue.h:700 drivers/nvme/host/core.c:268)
[   97.003376]  process_scheduled_works (kernel/workqueue.c:3396 kernel/workqueue.c:3479)
[   97.003384]  worker_thread (kernel/workqueue.c:3560)
[   97.003392]  kthread (kernel/kthread.c:436)
[   97.003401]  ret_from_fork (archkernel/process.c:158)
[   97.003411]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

[   97.003422] Second to last potentially related work creation:
[   97.003427]  kasan_save_stack (mm/kasan/common.c:57)
[   97.003435]  kasan_record_aux_stack (mm/kasan/generic.c:556)
[   97.003442]  insert_work (kernel/workqueue.c:2272)
[   97.003449]  __queue_work (kernel/workqueue.c:2448)
[   97.003457]  call_timer_fn (kernel/time/timer.c:1748)
[   97.003470]  __run_timer_base (kernel/time/timer.c:1794 kernel/time/timer.c:2374 kernel/time/timer.c:2386)
[   97.003480]  tmigr_handle_remote (kernel/time/timer_migration.c:985 kernel/time/timer_migration.c:1076 kernel/time/timer_migration.c:564 kernel/time/timer_migration.c:581 kernel/time/timer_migration.c:1135)
[   97.003492]  handle_softirqs (kernel/softirq.c:645)
[   97.003502]  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softirq.c:758)
[   97.003512]  sysvec_apic_timer_interrupt (archkernel/apic/apic.c:1062 archkernel/apic/apic.c:1062)
[   97.003523]  asm_sysvec_apic_timer_interrupt (archinclude/asm/idtentry.h:674)

[   97.003534] The buggy address belongs to the object at ffff88811d710000
which belongs to the cache kmalloc-4k of size 4096
[   97.003542] The buggy address is located 3648 bytes inside of
freed 4096-byte region [ffff88811d710000, ffff88811d711000)


Best,
Shuangpeng
