Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D06496D4C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142051; cv=pass; b=XKs4+Ft2BKq7bihgT6pRKd9KTgEqdoGkND7XyUwY7M05xRJ5YNE02n+JMqCs55BtDUo/zkB1NYyZjk7XpEw6eIJ1ab9Y9uvEZ3jY1LOFiPPLYFe96KjpE6HBlucMZm3g/gE7gUcdKuM4AT4P9+fmxeqvUc/VjokfatnDSj6ROps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142051; c=relaxed/simple;
	bh=Z+aB0kaEjxqnYV/GhQa2xWX2dJ2uE0wYGTVgh6IOkKw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qkpE6O5BRUR89STdoekHTncjRxWwOmNYTR6238txvI8UsPxe7PrZxJEQEtiUEUgEuVhixyOaNefgXpxSONk4G4o3bS+fnt1PRSuM5ZU1Pzb+T4ta5XN4wwQXeIz0k4idkGleLJpA6bbLZzeHcjMOn8jtZUwFwNenay+qPbeZIoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=LOlWFA0F; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="LOlWFA0F"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so104430a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789142048; cv=none;
        d=google.com; s=arc-20260327;
        b=qB2zlG27weuI+v52Jb9NOL1b3qbTIf/TjKKiT8mndfkSDNRxzLxar4/rddjZXqtIl3
         fNIMGHnaGrYfindgBv/7DUYqHNphTq+Am1MMgGPdhNeQszRV0JzxgbCPdEjkJzW6OomF
         7me6Vmd+VidgkNj568iK0IMkK6OsB5d9g6Pogvl7nvUNIwQsVDQJfUd8Vcf0Gq0ZcB+B
         DQmKL/hKJQgVvFmBeioIxugwuJkDG5tTakOyUZzpp9XPb7UShUIYne42e4B+ttiuZChP
         kaTslrHnSRFrmNvmkaYJwpDTSK9sPPNgpP6NeAmgtfVECjH1gaXt1iINRen4NlgH+/rN
         dMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qRWQZCfxIIggT5oTdJS8+hLAVkvIL8d+15LBZv32wkg=;
        fh=JHdkBSxHKTexALRKmQVVo3Kx0rGIBgwTXmHN0tfMJik=;
        b=MFlyPfXdEEu2i4fc/smcLEbXHWvId47nYjYqDaWYKieL9EqJSfKVP8BV6NFMTbFkrh
         Tj1eXhxYeRJPxtMn5K37KqjDjVaGS1SOwQRe2Cbgel87n6udm6XXbZBk3jcHTfEIT1/L
         QOHNVRb26wXLPe+vck7XwWLRS9uiKNmycJ7Umk4W0ijnZSHXUT5iDVyrQWUDke9Uy5yP
         tYWvfNYCRHc7U4B3AtUAm4KPhr2Y6/GUb/wyaV0Dri0UB+u/MQhaKi1RRzSdrVztR9UV
         zKMuONSQOsuRXqBUKf1pXjsceHaMp8pL6UScg/FQo5+atg7iGH1fxPaGGzePMUcJ8ELF
         tUYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789142048; x=1789746848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRWQZCfxIIggT5oTdJS8+hLAVkvIL8d+15LBZv32wkg=;
        b=LOlWFA0FooIUemdW0sRCPJRcWGHkVwNJxUY282EZsZTYQJty2Hqjk0G+R5puw8qwuZ
         iPlD5hGVq1MaJtEFc51DtaG+aouXwazft8he2Jq8KSGP5034tXqMj4CBNUAuy+o4XAWO
         +KBufQQXv0sWvwyB/MmwN0CKe8Ye2THUTIvEIGowPh9+gqz8HAp9viaFZAdzH7kAN3pI
         +EdR1nPBCAKE4juvUHH4qBru39U2FWdJyzc8YrTrvSZUWI8dRGVbxrUyJya7aBDy/wdF
         P4G5144ciOYVuF7UiZjqCWwBD5RbCfuXAoW0xlyQpgXsRMkm6QHEG4fqjRh5k+hH99+A
         UqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142048; x=1789746848;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qRWQZCfxIIggT5oTdJS8+hLAVkvIL8d+15LBZv32wkg=;
        b=mfZsMXb2ggAgWfuPgy0u0qRBZB7NeNuoAk9IZxFumH5rnVaTTHHz1mP/3K1Mxbf5lU
         huOjdJNIoJU6L9LNUMe54KDh/fGemi9NP8xMXhFkoVXzb5j1Z8GePgIr1EjtVYAatbxF
         XWm10s59kL6/CgYWoQTsy3x3X4jo2qqucDyZUmw0PbxjRGvl6Q3amba8VgQB/man0txB
         8n7hOX/SBHLvf5Ie1wH4iMEXKpCD3ObS35W65ytWR/uNC9+z1uGY3W8vslvPp2t9xJjh
         Nf/oOKKwHyqoG///sW0SzTFXpy+gjptEfGXc0hAHZiqh3IClWoR45t46xSdQTnFuFiG3
         6aAA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3M7Ry1ynuDI3ol+2gbYhaHhJfPBeqZJI+978ZgMNLotIiFKVR0vMCVLQ4apdHPnoavPGtF8xnQJtT94=@vger.kernel.org
X-Gm-Message-State: AFuF++moAxcNkNOCIlgcAFF+XOw94w6MY7v/plE/4CWWxxDVSC6hWtcJ
	RhpVj7cweVXO71pokDMG76ajvvTNebe/7IujKrssquTWC84NjLddPQ7gqSEwpwpxRPyE+GrlAnJ
	0mx/QzrziJ+Dt0hdOimIVXdfL62JOuXrnKKzMXSSBEaeWDojYi9P6VUWEGSBKhg==
X-Gm-Gg: AYBFou3CwHOTfAppIiM4NnPABF5PtxGAAlKjRQUUmet4xAmFj+Pv2s0fc0ghrjbd+fo
	H2+6v08uRTJkWOmFD7OEMhancuC8iuUrtHfyN5tPRO5/yxwfqMzgpG+N0CUaH5iKNutoIILZctf
	FbhSzuehtxdhiGhgLQa8W69a3xLkRzbu77w0IyfLHljJaQnEouPTlEa3/VIMP01t67/MZJ/5Gf+
	v2V31DEROftiFUKIuALFJv+65sM9yPJ4IKvZI0BDK/nBida1AkxpG/+Igzm5NoytG/G8QHQYJgL
	xxB6GeF6AD3nnVh9RY9FFWFXH5TdmEh8sdBbnRPWLLX7joyU7QCeqc3qij+hYYOdW4SrSDZ/hER
	2jon2UQcZENmQ8QP8LKMIuq1IpnfthfHcGnV5Et8AZrwv6QMgBB5K9IMigLsBYMYnu5Dq5BBwn9
	I=
X-Received: by 2002:a05:6a21:6f88:b0:3da:b8a4:53f4 with SMTP id
 adf61e73a8af0-3daed217800mr10776772637.3.1789142046538; Fri, 11 Sep 2026
 08:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:53:55 -0700
X-Gm-Features: AcwNN1UiEX9zYF_t5niB3r4lF9J_H7YNfCJbDwqyWHFx0EQJrK6PyAu4ceLB9RA
Message-ID: <CA+0ovChexj4TrZL_2iG_P0WBEbZc5+73GfB3DkciQi=R8pZOnA@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in usx2y_async_seq04_init
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000239d3c065b371882"

--000000000000239d3c065b371882
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.599577][ T9507] BUG: KASAN: slab-use-after-free in
usx2y_async_seq04_init+0x2b8/0x360
[   44.599666][ T9507] Read of size 4 at addr ffff8881060f6000 by task
repro/9507
[   44.599694][ T9507]
[   44.599736][ T9507] CPU: 1 UID: 0 PID: 9507 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.599774][ T9507] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.599807][ T9507] Call Trace:
[   44.599827][ T9507]  <TASK>
[   44.599877][ T9507]  dump_stack_lvl+0xe8/0x150
[   44.599917][ T9507]  print_address_description+0x55/0x1e0
[   44.599952][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.599982][ T9507]  print_report+0x58/0x70
[   44.600012][ T9507]  kasan_report+0x117/0x150
[   44.600055][ T9507]  ? __kmalloc_noprof+0x1af/0x720
[   44.600093][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.600130][ T9507]  usx2y_async_seq04_init+0x2b8/0x360
[   44.600168][ T9507]  snd_usx2y_hwdep_dsp_load+0x232/0x5e0
[   44.600205][ T9507]  ? __pfx_snd_usx2y_hwdep_dsp_load+0x10/0x10
[   44.600247][ T9507]  snd_hwdep_ioctl+0x489/0x590
[   44.600288][ T9507]  ? __pfx_snd_usx2y_hwdep_dsp_load+0x10/0x10
[   44.600322][ T9507]  ? __pfx_snd_hwdep_ioctl+0x10/0x10
[   44.600369][ T9507]  ? __fget_files+0x2a/0x420
[   44.600402][ T9507]  ? __fget_files+0x2a/0x420
[   44.600430][ T9507]  ? __fget_files+0x3a0/0x420
[   44.600460][ T9507]  ? __fget_files+0x2a/0x420
[   44.600491][ T9507]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.600525][ T9507]  ? __pfx_snd_hwdep_ioctl+0x10/0x10
[   44.600585][ T9507]  __se_sys_ioctl+0xfc/0x170
[   44.600625][ T9507]  do_syscall_64+0x155/0x510
[   44.600670][ T9507]  ? trace_irq_disable+0x3b/0x140
[   44.600709][ T9507]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.600741][ T9507]  ? clear_bhb_loop+0x30/0x80
[   44.600775][ T9507]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.600807][ T9507] RIP: 0033:0x41b46d
[   44.600860][ T9507] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.600895][ T9507] RSP: 002b:00007f916b837100 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.600939][ T9507] RAX: ffffffffffffffda RBX: 00007f916b8376c0
RCX: 000000000041b46d
[   44.600963][ T9507] RDX: 00007f916b837170 RSI: 0000000040604803
RDI: 0000000000000004
[   44.600984][ T9507] RBP: 00007f916b837150 R08: 0000000000000000
R09: 00007f916b837174
[   44.601006][ T9507] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f916b8376c0
[   44.601026][ T9507] R13: 00007fff5766a470 R14: 00007f916b837ce4
R15: 00007fff5766a567
[   44.601060][ T9507]  </TASK>
[   44.601072][ T9507]
[   44.601086][ T9507] Allocated by task 988:
[   44.601102][ T9507]  kasan_save_track+0x3e/0x80
[   44.601139][ T9507]  __kasan_kmalloc+0x93/0xb0
[   44.601176][ T9507]  __kmalloc_cache_noprof+0x325/0x610
[   44.601211][ T9507]  usb_alloc_dev+0x5d/0xf00
[   44.601265][ T9507]  hub_event+0x21ce/0x4f30
[   44.601298][ T9507]  process_scheduled_works+0xc99/0x1900
[   44.601343][ T9507]  worker_thread+0xa53/0xfc0
[   44.601370][ T9507]  kthread+0x38b/0x480
[   44.601402][ T9507]  ret_from_fork+0x514/0xb70
[   44.601434][ T9507]  ret_from_fork_asm+0x1a/0x30
[   44.601467][ T9507]
[   44.601475][ T9507] Freed by task 988:
[   44.601489][ T9507]  kasan_save_track+0x3e/0x80
[   44.601523][ T9507]  kasan_save_free_info+0x46/0x50
[   44.601551][ T9507]  __kasan_slab_free+0x5c/0x80
[   44.601587][ T9507]  kfree+0x1c5/0x650
[   44.601614][ T9507]  device_release+0xc4/0x1f0
[   44.601649][ T9507]  kobject_put+0x228/0x560
[   44.601678][ T9507]  hub_event+0x1cc9/0x4f30
[   44.601711][ T9507]  process_scheduled_works+0xc99/0x1900
[   44.601754][ T9507]  worker_thread+0xa53/0xfc0
[   44.601780][ T9507]  kthread+0x38b/0x480
[   44.601812][ T9507]  ret_from_fork+0x514/0xb70
[   44.601844][ T9507]  ret_from_fork_asm+0x1a/0x30
[   44.601896][ T9507]
[   44.601903][ T9507] The buggy address belongs to the object at
ffff8881060f6000
[   44.601903][ T9507]  which belongs to the cache kmalloc-2k of size 2048
[   44.601939][ T9507] The buggy address is located 0 bytes inside of
[   44.601939][ T9507]  freed 2048-byte region [ffff8881060f6000,
ffff8881060f6800)
[   44.601972][ T9507]
[   44.601980][ T9507] The buggy address belongs to the physical page:
[   44.602011][ T9507] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x1060f0
[   44.602041][ T9507] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   44.602067][ T9507] flags:
0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
[   44.602110][ T9507] page_type: f5(slab)
[   44.602148][ T9507] raw: 057ff00000000040 ffff88801b042000
dead000000000100 dead000000000122
[   44.602174][ T9507] raw: 0000000000000000 0000000000080008
00000000f5000000 0000000000000000
[   44.602202][ T9507] head: 057ff00000000040 ffff88801b042000
dead000000000100 dead000000000122
[   44.602228][ T9507] head: 0000000000000000 0000000000080008
00000000f5000000 0000000000000000
[   44.602255][ T9507] head: 057ff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   44.602280][ T9507] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   44.602296][ T9507] page dumped because: kasan: bad access detected
[   44.602318][ T9507] page_owner tracks the page as allocated
[   44.602330][ T9507] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 1, tgid 1 (swapper/0), ts 1751673867
[   44.602381][ T9507]  post_alloc_hook+0x1f9/0x250
[   44.602412][ T9507]  get_page_from_freelist+0x235a/0x23e0
[   44.602449][ T9507]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   44.602486][ T9507]  allocate_slab+0x7d/0x610
[   44.602511][ T9507]  refill_objects+0x2d6/0x350
[   44.602536][ T9507]  __pcs_replace_empty_main+0x2c9/0x6c0
[   44.602578][ T9507]  __kmalloc_cache_noprof+0x3a5/0x610
[   44.602612][ T9507]  container_device_attach+0x8e/0x220
[   44.602645][ T9507]  acpi_bus_attach+0x6fb/0xb90
[   44.602676][ T9507]  device_for_each_child+0x10b/0x1a0
[   44.602705][ T9507]  acpi_dev_for_each_child+0x9b/0xe0
[   44.602747][ T9507]  acpi_bus_attach+0x900/0xb90
[   44.602777][ T9507]  device_for_each_child+0x10b/0x1a0
[   44.602806][ T9507]  acpi_dev_for_each_child+0x9b/0xe0
[   44.602858][ T9507]  acpi_bus_attach+0x900/0xb90
[   44.602889][ T9507]  device_for_each_child+0x10b/0x1a0
[   44.602919][ T9507] page_owner free stack trace missing
[   44.602930][ T9507]
[   44.602938][ T9507] Memory state around the buggy address:
[   44.602954][ T9507]  ffff8881060f5f00: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   44.602974][ T9507]  ffff8881060f5f80: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   44.602994][ T9507] >ffff8881060f6000: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   44.603010][ T9507]                    ^
[   44.603025][ T9507]  ffff8881060f6080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   44.603045][ T9507]  ffff8881060f6100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   44.603060][ T9507]
==================================================================
[   44.603093][ T9507] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   44.674986][ T9507] CPU: 1 UID: 0 PID: 9507 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.675924][ T9507] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.676874][ T9507] Call Trace:
[   44.677180][ T9507]  <TASK>
[   44.677502][ T9507]  vpanic+0x56d/0xa60
[   44.677905][ T9507]  ? __pfx_vpanic+0x10/0x10
[   44.678355][ T9507]  panic+0xc5/0xd0
[   44.678734][ T9507]  ? __pfx_panic+0x10/0x10
[   44.679179][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.679708][ T9507]  ? rcu_is_watching+0x16/0xb0
[   44.680182][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.680682][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.681188][ T9507]  check_panic_on_warn+0x89/0xb0
[   44.681642][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.682159][ T9507]  end_report+0x73/0x170
[   44.682551][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.683122][ T9507]  kasan_report+0x128/0x150
[   44.683540][ T9507]  ? __kmalloc_noprof+0x1af/0x720
[   44.684003][ T9507]  ? usx2y_async_seq04_init+0x2b8/0x360
[   44.684505][ T9507]  usx2y_async_seq04_init+0x2b8/0x360
[   44.684997][ T9507]  snd_usx2y_hwdep_dsp_load+0x232/0x5e0
[   44.685497][ T9507]  ? __pfx_snd_usx2y_hwdep_dsp_load+0x10/0x10
[   44.686053][ T9507]  snd_hwdep_ioctl+0x489/0x590
[   44.686491][ T9507]  ? __pfx_snd_usx2y_hwdep_dsp_load+0x10/0x10
[   44.687041][ T9507]  ? __pfx_snd_hwdep_ioctl+0x10/0x10
[   44.687523][ T9507]  ? __fget_files+0x2a/0x420
[   44.687948][ T9507]  ? __fget_files+0x2a/0x420
[   44.688368][ T9507]  ? __fget_files+0x3a0/0x420
[   44.688797][ T9507]  ? __fget_files+0x2a/0x420
[   44.689223][ T9507]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.689675][ T9507]  ? __pfx_snd_hwdep_ioctl+0x10/0x10
[   44.690158][ T9507]  __se_sys_ioctl+0xfc/0x170
[   44.690582][ T9507]  do_syscall_64+0x155/0x510
[   44.691011][ T9507]  ? trace_irq_disable+0x3b/0x140
[   44.691470][ T9507]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.692021][ T9507]  ? clear_bhb_loop+0x30/0x80
[   44.692465][ T9507]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.693056][ T9507] RIP: 0033:0x41b46d
[   44.693415][ T9507] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.695144][ T9507] RSP: 002b:00007f916b837100 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.695911][ T9507] RAX: ffffffffffffffda RBX: 00007f916b8376c0
RCX: 000000000041b46d
[   44.696658][ T9507] RDX: 00007f916b837170 RSI: 0000000040604803
RDI: 0000000000000004
[   44.697402][ T9507] RBP: 00007f916b837150 R08: 0000000000000000
R09: 00007f916b837174
[   44.698141][ T9507] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f916b8376c0
[   44.698886][ T9507] R13: 00007fff5766a470 R14: 00007f916b837ce4
R15: 00007fff5766a567
[   44.699613][ T9507]  </TASK>
[   44.700387][ T9507] Kernel Offset: disabled
[   44.700934][ T9507] Rebooting in 86400 seconds..

Regards,

--000000000000239d3c065b371882
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx4y0lx0>
X-Attachment-Id: f_mtx4y0lx0

LyoKICogMjQ4LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi11c3gyeS1hc3luYy1z
ZXEwNC1pbml0CiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2lu
Y2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8cHRocmVhZC5oPgoj
aW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+
CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2luY2x1ZGUgPGxp
bnV4L3VzYi9jaDkuaD4KI2luY2x1ZGUgPGxpbnV4L3VzYi9yYXdfZ2FkZ2V0Lmg+CgojZGVmaW5l
IEVQMF9NQVhfUEFDS0VUIDQwOTYKI2RlZmluZSBMRTE2KHYpICgodikgJiAweGZmKSwgKCgodikg
Pj4gOCkgJiAweGZmKQoKI2RlZmluZSBUQVNDQU1fVkVORE9SX0lEICAweDE2MDQKI2RlZmluZSBU
QVNDQU1fVVM0MjhfSUQgICAweDgwMDEKCiNkZWZpbmUgTUFYX0FMU0FfQ0FSRFMgOAoKc3RydWN0
IHNuZF9od2RlcF9kc3BfaW1hZ2VfYWJpIHsKCXVuc2lnbmVkIGludCBpbmRleDsKCXVuc2lnbmVk
IGNoYXIgbmFtZVs2NF07Cgl1bnNpZ25lZCBjaGFyICppbWFnZTsKCXNpemVfdCBsZW5ndGg7Cgl1
bnNpZ25lZCBsb25nIGRyaXZlcl9kYXRhOwp9OwojZGVmaW5lIFNORFJWX0hXREVQX0lPQ1RMX0RT
UF9MT0FEIDB4NDA2MDQ4MDN1CgojZGVmaW5lIENPTlRST0xfUkVRVUVTVF9PVEhFUiAgICAgICAg
ICAgICAwCiNkZWZpbmUgQ09OVFJPTF9SRVFVRVNUX1NFVF9DT05GSUdVUkFUSU9OIDEKI2RlZmlu
ZSBDT05UUk9MX1JFUVVFU1RfU0VUX0lOVEVSRkFDRV9BTFQxIDIKCnN0YXRpYyBjb25zdCBzdHJ1
Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yIGRldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGgg
PSAxOCwKCS5iRGVzY3JpcHRvclR5cGUgPSBVU0JfRFRfREVWSUNFLAoJLmJjZFVTQiA9IDB4MDIw
MCwKCS5iTWF4UGFja2V0U2l6ZTAgPSA2NCwKCS5pZFZlbmRvciA9IFRBU0NBTV9WRU5ET1JfSUQs
CgkuaWRQcm9kdWN0ID0gVEFTQ0FNX1VTNDI4X0lELAoJLmJjZERldmljZSA9IDB4MDEwMCwKCS5i
TnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgY29u
ZmlnX2Rlc2NyaXB0b3JbXSA9IHsKCTksIFVTQl9EVF9DT05GSUcsIExFMTYoOSArIDkgKyA5ICsg
NyksIDEsIDEsIDAsIDB4YTAsIDB4ZmEsCgk5LCBVU0JfRFRfSU5URVJGQUNFLCAwLCAwLCAwLCAw
eGZmLCAweGZmLCAweGZmLCAwLAoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwgMSwgMSwgMHhmZiwg
MHhmZiwgMHhmZiwgMCwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgMHgwMiwgVVNCX0VORFBPSU5UX1hG
RVJfQlVMSywgTEUxNig1MTIpLCAwLAp9OwoKc3RhdGljIGludCByYXdfZ2FkZ2V0X2ZkID0gLTE7
CnN0YXRpYyBpbnQgYnVsa19vdXRfZXAyX2hhbmRsZSA9IC0xOwpzdGF0aWMgaW50IGh3ZGVwX2Zk
ID0gLTE7CgpzdGF0aWMgaW50IGZpbmRfZHVtbXlfdWRjKGNoYXIgKmRyaXZlcl9uYW1lLCBzaXpl
X3QgZHJpdmVyX2xlbiwKCQkJICBjaGFyICpkZXZpY2VfbmFtZSwgc2l6ZV90IGRldmljZV9sZW4p
CnsKCURJUiAqdWRjX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3MvdWRjIik7CglzdHJ1Y3QgZGly
ZW50ICp1ZGNfZW50cnk7CgoJaWYgKCF1ZGNfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgodWRj
X2VudHJ5ID0gcmVhZGRpcih1ZGNfZGlyKSkpIHsKCQljaGFyICppbnN0YW5jZV9zdWZmaXg7CgoJ
CWlmICh1ZGNfZW50cnktPmRfbmFtZVswXSA9PSAnLicpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRm
KGRldmljZV9uYW1lLCBkZXZpY2VfbGVuLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7CgkJc25w
cmludGYoZHJpdmVyX25hbWUsIGRyaXZlcl9sZW4sICIlcyIsIHVkY19lbnRyeS0+ZF9uYW1lKTsK
CgkJaW5zdGFuY2Vfc3VmZml4ID0gc3RycmNocihkcml2ZXJfbmFtZSwgJy4nKTsKCQlpZiAoaW5z
dGFuY2Vfc3VmZml4KQoJCQkqaW5zdGFuY2Vfc3VmZml4ID0gMDsKCQljbG9zZWRpcih1ZGNfZGly
KTsKCQlyZXR1cm4gMDsKCX0KCWNsb3NlZGlyKHVkY19kaXIpOwoJcmV0dXJuIC0xOwp9CgpzdGF0
aWMgaW50IGVwMF9zZW5kX2RhdGEoY29uc3Qgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGxlbmd0
aCkKewoJdW5zaWduZWQgY2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSAr
IEVQMF9NQVhfUEFDS0VUXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICplcDBfaW8gPSAodm9pZCAq
KWJ1ZmZlcjsKCgllcDBfaW8tPmVwID0gMDsKCWVwMF9pby0+ZmxhZ3MgPSAwOwoJZXAwX2lvLT5s
ZW5ndGggPSBsZW5ndGg7CgltZW1jcHkoZXAwX2lvLT5kYXRhLCBkYXRhLCBsZW5ndGgpOwoJcmV0
dXJuIGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1dSSVRFLCBlcDBfaW8p
Owp9CgpzdGF0aWMgaW50IGVwMF9jb21wbGV0ZV9zdGF0dXNfc3RhZ2UodW5zaWduZWQgc2hvcnQg
d0xlbmd0aCkKewoJdW5zaWduZWQgY2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2Vw
X2lvKSArIEVQMF9NQVhfUEFDS0VUXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICplcDBfaW8gPSAo
dm9pZCAqKWJ1ZmZlcjsKCgllcDBfaW8tPmVwID0gMDsKCWVwMF9pby0+ZmxhZ3MgPSAwOwoJZXAw
X2lvLT5sZW5ndGggPSB3TGVuZ3RoID4gRVAwX01BWF9QQUNLRVQgPyBFUDBfTUFYX1BBQ0tFVCA6
IHdMZW5ndGg7CglyZXR1cm4gaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBf
UkVBRCwgZXAwX2lvKTsKfQoKc3RhdGljIHZvaWQgZW5hYmxlX2J1bGtfb3V0X2VwMih2b2lkKQp7
CglzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgZW5kcG9pbnRfZGVzY3JpcHRvciA9IHsK
CQkuYkxlbmd0aCA9IFVTQl9EVF9FTkRQT0lOVF9TSVpFLAoJCS5iRGVzY3JpcHRvclR5cGUgPSBV
U0JfRFRfRU5EUE9JTlQsCgkJLmJFbmRwb2ludEFkZHJlc3MgPSAweDAyLAoJCS5ibUF0dHJpYnV0
ZXMgPSBVU0JfRU5EUE9JTlRfWEZFUl9CVUxLLAoJCS53TWF4UGFja2V0U2l6ZSA9IDUxMiwKCX07
CgoJaWYgKGJ1bGtfb3V0X2VwMl9oYW5kbGUgPCAwKQoJCWJ1bGtfb3V0X2VwMl9oYW5kbGUgPSBp
b2N0bChyYXdfZ2FkZ2V0X2ZkLAoJCQkJCSAgICBVU0JfUkFXX0lPQ1RMX0VQX0VOQUJMRSwKCQkJ
CQkgICAgJmVuZHBvaW50X2Rlc2NyaXB0b3IpOwp9CgpzdGF0aWMgdm9pZCBkcmFpbl9idWxrX291
dF9lcDIodm9pZCkKewoJdW5zaWduZWQgY2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3
X2VwX2lvKSArIDEwMjRdOwoJc3RydWN0IHVzYl9yYXdfZXBfaW8gKmVwX2lvID0gKHZvaWQgKili
dWZmZXI7CgoJaWYgKGJ1bGtfb3V0X2VwMl9oYW5kbGUgPCAwKQoJCXJldHVybjsKCWVwX2lvLT5l
cCA9IGJ1bGtfb3V0X2VwMl9oYW5kbGU7CgllcF9pby0+ZmxhZ3MgPSAwOwoJZXBfaW8tPmxlbmd0
aCA9IDUxMjsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVBfUkVBRCwgZXBf
aW8pOwp9CgpzdGF0aWMgaW50IGhhbmRsZV9lcDBfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0cnVj
dCB1c2JfY3RybHJlcXVlc3QgKmNvbnRyb2wpCnsKCXVuc2lnbmVkIGNoYXIgcmVwbHlbRVAwX01B
WF9QQUNLRVRdOwoJaW50IHJlcGx5X2xlbmd0aCA9IC0xOwoJaW50IG91dGNvbWUgPSBDT05UUk9M
X1JFUVVFU1RfT1RIRVI7CgoJaWYgKChjb250cm9sLT5iUmVxdWVzdFR5cGUgJiBVU0JfVFlQRV9N
QVNLKSA9PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJCXN3aXRjaCAoY29udHJvbC0+YlJlcXVlc3Qp
IHsKCQljYXNlIFVTQl9SRVFfR0VUX0RFU0NSSVBUT1I6CgkJCWlmICgoY29udHJvbC0+d1ZhbHVl
ID4+IDgpID09IFVTQl9EVF9ERVZJQ0UpIHsKCQkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihkZXZp
Y2VfZGVzY3JpcHRvcik7CgkJCQltZW1jcHkocmVwbHksICZkZXZpY2VfZGVzY3JpcHRvciwgcmVw
bHlfbGVuZ3RoKTsKCQkJfSBlbHNlIGlmICgoY29udHJvbC0+d1ZhbHVlID4+IDgpID09IFVTQl9E
VF9DT05GSUcpIHsKCQkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihjb25maWdfZGVzY3JpcHRvcik7
CgkJCQltZW1jcHkocmVwbHksIGNvbmZpZ19kZXNjcmlwdG9yLCByZXBseV9sZW5ndGgpOwoJCQl9
CgkJCWJyZWFrOwoJCWNhc2UgVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTjoKCQkJaW9jdGwocmF3
X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9DT05GSUdVUkUsIDApOwoJCQllbmFibGVfYnVsa19v
dXRfZXAyKCk7CgkJCXJlcGx5X2xlbmd0aCA9IDA7CgkJCW91dGNvbWUgPSBDT05UUk9MX1JFUVVF
U1RfU0VUX0NPTkZJR1VSQVRJT047CgkJCWJyZWFrOwoJCWNhc2UgVVNCX1JFUV9TRVRfSU5URVJG
QUNFOgoJCQlyZXBseV9sZW5ndGggPSAwOwoJCQlpZiAoY29udHJvbC0+d1ZhbHVlID09IDEpCgkJ
CQlvdXRjb21lID0gQ09OVFJPTF9SRVFVRVNUX1NFVF9JTlRFUkZBQ0VfQUxUMTsKCQkJYnJlYWs7
CgkJfQoJfQoKCWlmIChyZXBseV9sZW5ndGggPCAwKSB7CgkJaW9jdGwocmF3X2dhZGdldF9mZCwg
VVNCX1JBV19JT0NUTF9FUDBfU1RBTEwsIDApOwoJCXJldHVybiBDT05UUk9MX1JFUVVFU1RfT1RI
RVI7Cgl9CglpZiAoKGNvbnRyb2wtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYmIGNvbnRy
b2wtPndMZW5ndGgpIHsKCQlpZiAocmVwbHlfbGVuZ3RoID4gKGludCljb250cm9sLT53TGVuZ3Ro
KQoJCQlyZXBseV9sZW5ndGggPSBjb250cm9sLT53TGVuZ3RoOwoJCWVwMF9zZW5kX2RhdGEocmVw
bHksICh1bnNpZ25lZCBpbnQpcmVwbHlfbGVuZ3RoKTsKCX0gZWxzZSB7CgkJZXAwX2NvbXBsZXRl
X3N0YXR1c19zdGFnZShjb250cm9sLT53TGVuZ3RoKTsKCX0KCXJldHVybiBvdXRjb21lOwp9Cgpz
dGF0aWMgdm9pZCBzbmFwc2hvdF9leGlzdGluZ19od2RlcF9ub2RlcyhpbnQgKmh3ZGVwX3ByZXNl
bnRfYmVmb3JlKQp7Cglmb3IgKGludCBjYXJkID0gMDsgY2FyZCA8IE1BWF9BTFNBX0NBUkRTOyBj
YXJkKyspIHsKCQljaGFyIHBhdGhbNjRdOwoJCWludCBmZDsKCgkJc25wcmludGYocGF0aCwgc2l6
ZW9mKHBhdGgpLCAiL2Rldi9zbmQvaHdDJWREMCIsIGNhcmQpOwoJCWZkID0gb3BlbihwYXRoLCBP
X1JET05MWSk7CgkJaHdkZXBfcHJlc2VudF9iZWZvcmVbY2FyZF0gPSAoZmQgPj0gMCk7CgkJaWYg
KGZkID49IDApCgkJCWNsb3NlKGZkKTsKCX0KfQoKc3RhdGljIGludCBvcGVuX2h3ZGVwX25vZGVf
Y3JlYXRlZF9ieV9wcm9iZShjb25zdCBpbnQgKmh3ZGVwX3ByZXNlbnRfYmVmb3JlKQp7Cglmb3Ig
KGludCBhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDgwOyBhdHRlbXB0KyspIHsKCQlmb3IgKGludCBj
YXJkID0gMDsgY2FyZCA8IE1BWF9BTFNBX0NBUkRTOyBjYXJkKyspIHsKCQkJY2hhciBwYXRoWzY0
XTsKCQkJaW50IGZkOwoKCQkJaWYgKGh3ZGVwX3ByZXNlbnRfYmVmb3JlW2NhcmRdKQoJCQkJY29u
dGludWU7CgkJCXNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRoKSwgIi9kZXYvc25kL2h3QyVkRDAi
LCBjYXJkKTsKCQkJZmQgPSBvcGVuKHBhdGgsIE9fUkRXUik7CgkJCWlmIChmZCA+PSAwKQoJCQkJ
cmV0dXJuIGZkOwoJCX0KCQl1c2xlZXAoNTAwMDApOwoJfQoJcmV0dXJuIC0xOwp9CgpzdGF0aWMg
dm9pZCAqZHNwX2xvYWRfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJc3RydWN0IHNuZF9od2RlcF9k
c3BfaW1hZ2VfYWJpIGRzcF9pbWFnZTsKCXVuc2lnbmVkIGNoYXIgZmlybXdhcmVfYnl0ZXNbOF0g
PSB7IDAsIDEsIDIsIDMsIDQsIDUsIDYsIDcgfTsKCgltZW1zZXQoJmRzcF9pbWFnZSwgMCwgc2l6
ZW9mKGRzcF9pbWFnZSkpOwoJZHNwX2ltYWdlLmluZGV4ID0gMTsKCWRzcF9pbWFnZS5pbWFnZSA9
IGZpcm13YXJlX2J5dGVzOwoJZHNwX2ltYWdlLmxlbmd0aCA9IHNpemVvZihmaXJtd2FyZV9ieXRl
cyk7Cglpb2N0bChod2RlcF9mZCwgU05EUlZfSFdERVBfSU9DVExfRFNQX0xPQUQsICZkc3BfaW1h
Z2UpOwoJcmV0dXJuIE5VTEw7Cn0KCmludCBtYWluKHZvaWQpCnsKCWNoYXIgZ2FkZ2V0X2RyaXZl
cl9uYW1lWzEyOF0sIHVkY19kZXZpY2VfbmFtZVsxMjhdOwoJc3RydWN0IHVzYl9yYXdfaW5pdCBy
YXdfZ2FkZ2V0X2luaXQ7Cgl1bnNpZ25lZCBjaGFyIGV2ZW50X2J1ZmZlcltzaXplb2Yoc3RydWN0
IHVzYl9yYXdfZXZlbnQpICsgRVAwX01BWF9QQUNLRVRdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQg
KmV2ZW50ID0gKHZvaWQgKilldmVudF9idWZmZXI7CglpbnQgaHdkZXBfcHJlc2VudF9iZWZvcmVb
TUFYX0FMU0FfQ0FSRFNdOwoJcHRocmVhZF90IGxvYWRlcl90aHJlYWQ7CglpbnQgbG9hZGVyX3N0
YXJ0ZWQgPSAwOwoKCXN5c3RlbSgibW9kcHJvYmUgZHVtbXlfaGNkIDI+L2Rldi9udWxsIik7Cglz
eXN0ZW0oIm1vZHByb2JlIHJhd19nYWRnZXQgMj4vZGV2L251bGwiKTsKCXN5c3RlbSgibW9kcHJv
YmUgc25kLXVzYi11c3gyeSAyPi9kZXYvbnVsbCIpOwoKCWlmIChmaW5kX2R1bW15X3VkYyhnYWRn
ZXRfZHJpdmVyX25hbWUsIHNpemVvZihnYWRnZXRfZHJpdmVyX25hbWUpLAoJCQkgICB1ZGNfZGV2
aWNlX25hbWUsIHNpemVvZih1ZGNfZGV2aWNlX25hbWUpKSA8IDApCgkJcmV0dXJuIDE7CgoJc25h
cHNob3RfZXhpc3RpbmdfaHdkZXBfbm9kZXMoaHdkZXBfcHJlc2VudF9iZWZvcmUpOwoKCXJhd19n
YWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwoJaWYgKHJhd19nYWRn
ZXRfZmQgPCAwKQoJCXJldHVybiAxOwoJbWVtc2V0KCZyYXdfZ2FkZ2V0X2luaXQsIDAsIHNpemVv
ZihyYXdfZ2FkZ2V0X2luaXQpKTsKCXN0cm5jcHkoKGNoYXIgKilyYXdfZ2FkZ2V0X2luaXQuZHJp
dmVyX25hbWUsIGdhZGdldF9kcml2ZXJfbmFtZSwKCQlzaXplb2YocmF3X2dhZGdldF9pbml0LmRy
aXZlcl9uYW1lKSAtIDEpOwoJc3RybmNweSgoY2hhciAqKXJhd19nYWRnZXRfaW5pdC5kZXZpY2Vf
bmFtZSwgdWRjX2RldmljZV9uYW1lLAoJCXNpemVvZihyYXdfZ2FkZ2V0X2luaXQuZGV2aWNlX25h
bWUpIC0gMSk7CglyYXdfZ2FkZ2V0X2luaXQuc3BlZWQgPSBVU0JfU1BFRURfSElHSDsKCWlmIChp
b2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0lOSVQsICZyYXdfZ2FkZ2V0X2luaXQp
IDwgMCkKCQlyZXR1cm4gMTsKCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RM
X1JVTiwgMCkgPCAwKQoJCXJldHVybiAxOwoKCWZvciAoOzspIHsKCQlpbnQgb3V0Y29tZTsKCgkJ
ZXZlbnQtPnR5cGUgPSAwOwoJCWV2ZW50LT5sZW5ndGggPSBFUDBfTUFYX1BBQ0tFVDsKCQlpZiAo
aW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FVkVOVF9GRVRDSCwgZXZlbnQpIDwg
MCkKCQkJcmV0dXJuIDE7CgkJaWYgKGV2ZW50LT50eXBlICE9IFVTQl9SQVdfRVZFTlRfQ09OVFJP
TCkKCQkJY29udGludWU7CgoJCW91dGNvbWUgPSBoYW5kbGVfZXAwX2NvbnRyb2xfcmVxdWVzdCgK
CQkJCShzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRhdGEpOwoKCQlpZiAob3V0Y29t
ZSA9PSBDT05UUk9MX1JFUVVFU1RfU0VUX0NPTkZJR1VSQVRJT04gJiYgIWxvYWRlcl9zdGFydGVk
KSB7CgkJCWh3ZGVwX2ZkID0gb3Blbl9od2RlcF9ub2RlX2NyZWF0ZWRfYnlfcHJvYmUoaHdkZXBf
cHJlc2VudF9iZWZvcmUpOwoJCQlpZiAoaHdkZXBfZmQgPCAwKQoJCQkJcmV0dXJuIDE7CgkJCXB0
aHJlYWRfY3JlYXRlKCZsb2FkZXJfdGhyZWFkLCBOVUxMLCBkc3BfbG9hZF90aHJlYWQsIE5VTEwp
OwoJCQlsb2FkZXJfc3RhcnRlZCA9IDE7CgkJfQoJCWlmIChvdXRjb21lID09IENPTlRST0xfUkVR
VUVTVF9TRVRfSU5URVJGQUNFX0FMVDEpIHsKCQkJZHJhaW5fYnVsa19vdXRfZXAyKCk7CgoJCQl1
c2xlZXAoMTIwMDAwKTsKCQkJYnJlYWs7CgkJfQoJfQoKCWNsb3NlKHJhd19nYWRnZXRfZmQpOwoJ
aWYgKGxvYWRlcl9zdGFydGVkKQoJCXB0aHJlYWRfam9pbihsb2FkZXJfdGhyZWFkLCBOVUxMKTsK
CXJldHVybiAwOwp9Cg==
--000000000000239d3c065b371882--
