Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C044AD4DA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149160; cv=pass; b=H7daiORqgL0vCDtUZT1c9E1Y/0BAh7wK1NgMRt8DWg1BuTEHOJFxvrvQguxCBFBK9bRbSLjXFkOBQggyN6cfe3fjtsgiysTRyvOLb5T9tVeenMCT88XjZ1G4tasrfafwtaNEg+kXfh0n7JCdAmmuon6SjBrtqJtf9ZcB1tuqw44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149160; c=relaxed/simple;
	bh=GokbjQI95YTmdbbDRDPIJn2ASnn4qT3S1hdgpqUuGHE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hoPkk0pXa8E9Qk+x54Km5g7UapRV0f5hvSg9itYQ19R8WJztMyJC98XW5GDuO/Y/bqYpYGkzHLiY9bvcXUJ9uEUd8z+OqPTkRDqWeMTrNUW2LDrSZMykeaK6SuM943zgT89bnGWiVguVyIJPk3om9fASm+8zQeBhrhDjmNbJd/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=JYQ+Uz0P; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="JYQ+Uz0P"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so9177825ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149157; cv=none;
        d=google.com; s=arc-20260327;
        b=NL1NZfDxPg8LEzDSkFOHhWAfDXHemq4+/DyF1w4d7Lt8SISOOdHFnlzdF+Z+mSslyP
         l3ULkXNBIYIszmvwnhyfG6glqOeC5PNk6keqAqGvLAk7JJPPIMKnXwSzjJBheQEDcfPg
         fV2Sl9RKQyPphBd0icNVFwMzeCHyqOgrWPPupuI8eQBO42cz0QQB86Nr1iAY4sekLllu
         2YTPNduwxHCAk8yTvLXSjxR+jfVzgW+KsMq1rXhyoCYkIHqCtZaWLbKnKukAs1Plct+z
         KhwPZdF4sfDKNq8hqZRx6w6FBvXc4AZeegUapKrfOP2c8fghBrpkJVes8x4XwwFDR3Dk
         YPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XjMHgIUtxZ925+u48mqqaPvDycwQhVPXjhiILYfswVU=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=Dds9D2wQtn5BLKEJ0fo8lfpejXIs7ad065nFPMKiP4VDy3LyB5cyUz+1DQE2R0FMS/
         avxUGuAIZuz+SqB25QGL+W5IT7eAfCilLfZcT1rld/MSKwfTaid/9tK3oSTlVxjADiRz
         yC2+HBgH4twSeIGE+/j/aAdUKM5dm/C35pmLAhTKqIgmRPOcWler9pIWUjD6smvWL9/H
         fKqOvbVUZr09cM2imVWxZr5THpZcp6lIMliKJs5eBArMzmE6iDogl2wXeqB+bd7yZvTj
         bWu76Cqiuo5kEwwG/zf1P/cbuo/C3QCJ5jJH9/W/o4mde9xoSdFLPlbR+sDbQM/KONq+
         Gn4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789149157; x=1789753957; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XjMHgIUtxZ925+u48mqqaPvDycwQhVPXjhiILYfswVU=;
        b=JYQ+Uz0Pf55G3Mh64MRm756+cRz88MIMm8lt+cqG0Jl7BoPHEwd8GdqSZ297ufLVMe
         cDne0CUcxgWtZqwH1xBYE0HLM06d+SQttrKOlRQo4hTCXP8u3gfBZ+BEGPebBBhKvQZQ
         aV/5ktDiZhMsIhR9dZyaLhiN60izqCM2lkCNyC+OFxMVRBFoMecbNM3AVNa02hRp1kE7
         ijelv9JenZ7nL9XE9IE1ykU203h1g19DfiGd2fRIbQvFQP4Yd2JXJOsXNQxeVZWqkfVp
         e/OMrcjQlNUjsmQD4U/eTXRRLChQwj+DUqmaf1HOxj0sVMx9dQLIQlBks04PnAaWWP3T
         QH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149157; x=1789753957;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjMHgIUtxZ925+u48mqqaPvDycwQhVPXjhiILYfswVU=;
        b=dUkrOiUUj2us6Nwfe8/nvnMwJVlEbFnHluqjvtAho8dN75bixEiWfTt5E/7KVtJxtK
         ey+hr6N/GFkOI0Uzx2RT8kelKFeKzaMo1j0OeQKeFQ001EsFkgRHjFzKKc5RbeEf6OZ3
         6sQx+leJOTz5r1/PWLFqb3qfhj4DO582Y17lJwBIcboTz/vRJRj9eA0UZFCsaU2RV0CJ
         PkCRWkpdzUkH13f2vwmOB+Tor8Qg6OygrhYXvkPB3D60IK+M0RKzHToLAtVq1RJRLSm/
         3LhqYOziNqxWhVV84eVjfIMf2sPfbsK1ywm9B7IwFZeE5zJfnyA32FFPMR7ToOzzAjlK
         lvVw==
X-Gm-Message-State: AFuF++mSizV7b95G01N/3pOVUNugxWHdXKnpL8NI6JaiLIiQUm7VFpOP
	epY/27k4KvirLjVfGgNu0IRw0BhisVxIbCEE0oie4gGcp1lkrnNRV+Rt9Rszp9X+DwjcuVGpMEm
	pP/bvwyG/UfWIiLLc8PahsPZvNpGtGTfnqvkFPZU8DVo5/nOVJgEFAY7154VAIw==
X-Gm-Gg: AYBFou38U5Y1DidMDgTAalCOsYlw+nprs4+TyG5Fm6VS17cwmWDsWxwx7acIw1+byf/
	/AV/Nf/FOpH1PAIyGAZ+L5Eyc/p+KTOlQ+vZrJgqK9v9x6PejCGmJ5YekFO5JVY/oPjD1JuaP4f
	UztzkgBP3FvGGx7XdMmBMgmZ9INOGg390oDRJ+6II11CxyP0V9xAFe/vUSgZituFjX+0r2ydZ/p
	/4CH65BdT8bV5BokyP/QH1AhKodIXEfFkv71BfpWkbWbpc/l6LgbOR67ypX1cqwAB/72Qx68L8u
	+Q05w0/0sUzFPSoKv614cQ4TQrA0a2ym0AWEUjXjyxa8MZvqKXv9CUkOONxLVsw9MsjNkM4rxDv
	WeZAT8Dv70pXlHr1Fwo8pE0PyJNxWQm+tmb7ugkugse0x/Ry0SImz8bv19nfUlQxgoExHRlDeTu
	8=
X-Received: by 2002:a17:902:db01:b0:2d5:3f5f:e645 with SMTP id
 d9443c01a7336-2dd2a33d425mr98118105ad.12.1789149156106; Fri, 11 Sep 2026
 10:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 10:52:24 -0700
X-Gm-Features: AcwNN1W-fs-oU2riOZsA-xjUfPTH2wKVLIe-CEIKhxIAmQRF46VwmXjLX1REauQ
Message-ID: <CA+0ovCh5uOgB5CQm5eqZFoWE11Uqs4=t4yES-7E1_oH60HtaKw@mail.gmail.com>
Subject: [BUG] KASAN: slab-out-of-bounds Write in uvc_video_encode_isoc
To: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000e7870a065b38bfdb"

--000000000000e7870a065b38bfdb
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   55.172497][   T56] BUG: KASAN: slab-out-of-bounds in
uvc_video_encode_isoc+0x166/0x540
[   55.174693][   T56] Write of size 1016 at addr ffff88802c0ca008 by
task kworker/u12:0/56
[   55.174700][   T56]
[   55.174713][   T56] CPU: 0 UID: 0 PID: 56 Comm: kworker/u12:0 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   55.174722][   T56] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   55.174727][   T56] Workqueue: uvcgadget uvcg_video_pump
[   55.174742][   T56] Call Trace:
[   55.174747][   T56]  <TASK>
[   55.174753][   T56]  dump_stack_lvl+0xe8/0x150
[   55.174763][   T56]  print_address_description+0x55/0x1e0
[   55.174771][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.174777][   T56]  print_report+0x58/0x70
[   55.174783][   T56]  kasan_report+0x117/0x150
[   55.174795][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.174802][   T56]  kasan_check_range+0x264/0x2c0
[   55.174812][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.174818][   T56]  __asan_memcpy+0x40/0x70
[   55.174827][   T56]  uvc_video_encode_isoc+0x166/0x540
[   55.174835][   T56]  uvcg_video_pump+0x2cc/0x6f0
[   55.174843][   T56]  ? process_scheduled_works+0x94e/0x1900
[   55.174855][   T56]  process_scheduled_works+0xc99/0x1900
[   55.174865][   T56]  ? __lock_acquire+0x74c/0x2db0
[   55.174878][   T56]  ? __pfx_process_scheduled_works+0x10/0x10
[   55.174888][   T56]  ? assign_work+0x3d5/0x5e0
[   55.174898][   T56]  worker_thread+0xa53/0xfc0
[   55.174908][   T56]  kthread+0x38b/0x480
[   55.174917][   T56]  ? __pfx_worker_thread+0x10/0x10
[   55.174923][   T56]  ? __pfx_kthread+0x10/0x10
[   55.174930][   T56]  ret_from_fork+0x514/0xb70
[   55.174939][   T56]  ? __pfx_ret_from_fork+0x10/0x10
[   55.174947][   T56]  ? __switch_to+0xc79/0x1410
[   55.174954][   T56]  ? __pfx_kthread+0x10/0x10
[   55.174961][   T56]  ret_from_fork_asm+0x1a/0x30
[   55.174972][   T56]  </TASK>
[   55.174975][   T56]
[   55.174979][   T56] Allocated by task 9491:
[   55.174983][   T56]  kasan_save_track+0x3e/0x80
[   55.174991][   T56]  __kasan_kmalloc+0x93/0xb0
[   55.174998][   T56]  __kmalloc_noprof+0x36f/0x720
[   55.175006][   T56]  uvcg_video_enable+0x582/0x1000
[   55.175012][   T56]  uvc_v4l2_streamon+0x7e/0x110
[   55.175021][   T56]  __video_do_ioctl+0xadb/0xca0
[   55.175027][   T56]  video_usercopy+0x876/0x1450
[   55.175032][   T56]  v4l2_ioctl+0x18d/0x1e0
[   55.175037][   T56]  __se_sys_ioctl+0xfc/0x170
[   55.175045][   T56]  do_syscall_64+0x155/0x510
[   55.175053][   T56]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   55.175060][   T56]
[   55.175061][   T56] The buggy address belongs to the object at
ffff88802c0ca000
[   55.175061][   T56]  which belongs to the cache kmalloc-512 of size 512
[   55.175071][   T56] The buggy address is located 8 bytes inside of
[   55.175071][   T56]  allocated 300-byte region [ffff88802c0ca000,
ffff88802c0ca12c)
[   55.175079][   T56]
[   55.175080][   T56] The buggy address belongs to the physical page:
[   55.175089][   T56] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x2c0c8
[   55.175096][   T56] head: order:2 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   55.175101][   T56] flags:
0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
[   55.175113][   T56] page_type: f5(slab)
[   55.175123][   T56] raw: 00fff00000000040 ffff88801b041c80
dead000000000100 dead000000000122
[   55.175128][   T56] raw: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   55.175134][   T56] head: 00fff00000000040 ffff88801b041c80
dead000000000100 dead000000000122
[   55.175139][   T56] head: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   55.175145][   T56] head: 00fff00000000002 ffffffffffffff01
00000000ffffffff 00000000ffffffff
[   55.175150][   T56] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000004
[   55.175154][   T56] page dumped because: kasan: bad access detected
[   55.175160][   T56] page_owner tracks the page as allocated
[   55.175163][   T56] page last allocated via order 2, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 1, tgid 1 (swapper/0), ts 5924167611
[   55.175174][   T56]  post_alloc_hook+0x1f9/0x250
[   55.175182][   T56]  get_page_from_freelist+0x235a/0x23e0
[   55.175189][   T56]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   55.175197][   T56]  allocate_slab+0x7d/0x610
[   55.175202][   T56]  refill_objects+0x2d6/0x350
[   55.175207][   T56]  __pcs_replace_empty_main+0x2c9/0x6c0
[   55.175216][   T56]  __kmalloc_cache_noprof+0x3a5/0x610
[   55.175223][   T56]  device_add+0xbe/0xb90
[   55.176284][   T56]  __video_register_device+0x3b6e/0x4ae0
[   55.176293][   T56]  vivid_create_devnodes+0x1622/0x2bf0
[   55.176300][   T56]  vivid_probe+0x5109/0x7290
[   55.176305][   T56]  platform_probe+0xf9/0x190
[   55.176311][   T56]  really_probe+0x267/0xaf0
[   55.176317][   T56]  __driver_probe_device+0x1e2/0x350
[   55.176324][   T56]  driver_probe_device+0x4f/0x240
[   55.176330][   T56]  __driver_attach+0x33c/0x600
[   55.176336][   T56] page_owner free stack trace missing
[   55.176339][   T56]
[   55.176341][   T56] Memory state around the buggy address:
[   55.176344][   T56]  ffff88802c0ca000: 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00
[   55.176349][   T56]  ffff88802c0ca080: 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00
[   55.176353][   T56] >ffff88802c0ca100: 00 00 00 00 00 04 fc fc fc
fc fc fc fc fc fc fc
[   55.176356][   T56]                                   ^
[   55.176360][   T56]  ffff88802c0ca180: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   55.176364][   T56]  ffff88802c0ca200: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   55.176367][   T56]
==================================================================
[   55.176376][   T56] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   55.227013][   T56] CPU: 0 UID: 0 PID: 56 Comm: kworker/u12:0 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   55.228001][   T56] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   55.228955][   T56] Workqueue: uvcgadget uvcg_video_pump
[   55.229455][   T56] Call Trace:
[   55.229769][   T56]  <TASK>
[   55.230042][   T56]  vpanic+0x56d/0xa60
[   55.230466][   T56]  ? __pfx_vpanic+0x10/0x10
[   55.230911][   T56]  panic+0xc5/0xd0
[   55.231284][   T56]  ? __pfx_panic+0x10/0x10
[   55.231700][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.232197][   T56]  ? rcu_is_watching+0x16/0xb0
[   55.232643][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.233141][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.233639][   T56]  check_panic_on_warn+0x89/0xb0
[   55.234095][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.234595][   T56]  end_report+0x73/0x170
[   55.234990][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.235489][   T56]  kasan_report+0x128/0x150
[   55.235971][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.236467][   T56]  kasan_check_range+0x264/0x2c0
[   55.236928][   T56]  ? uvc_video_encode_isoc+0x166/0x540
[   55.237423][   T56]  __asan_memcpy+0x40/0x70
[   55.237837][   T56]  uvc_video_encode_isoc+0x166/0x540
[   55.238323][   T56]  uvcg_video_pump+0x2cc/0x6f0
[   55.238765][   T56]  ? process_scheduled_works+0x94e/0x1900
[   55.239287][   T56]  process_scheduled_works+0xc99/0x1900
[   55.239795][   T56]  ? __lock_acquire+0x74c/0x2db0
[   55.240253][   T56]  ? __pfx_process_scheduled_works+0x10/0x10
[   55.240818][   T56]  ? assign_work+0x3d5/0x5e0
[   55.241244][   T56]  worker_thread+0xa53/0xfc0
[   55.241674][   T56]  kthread+0x38b/0x480
[   55.242050][   T56]  ? __pfx_worker_thread+0x10/0x10
[   55.242520][   T56]  ? __pfx_kthread+0x10/0x10
[   55.242944][   T56]  ret_from_fork+0x514/0xb70
[   55.243371][   T56]  ? __pfx_ret_from_fork+0x10/0x10
[   55.243844][   T56]  ? __switch_to+0xc79/0x1410
[   55.244277][   T56]  ? __pfx_kthread+0x10/0x10
[   55.244704][   T56]  ret_from_fork_asm+0x1a/0x30
[   55.245145][   T56]  </TASK>
[   55.246077][   T56] Kernel Offset: disabled
[   55.246629][   T56] Rebooting in 86400 seconds..

Regards,

--000000000000e7870a065b38bfdb
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx90tk40>
X-Attachment-Id: f_mtx90tk40

LyoKICogMjcyLWthc2FuLXNsYWItb3V0LW9mLWJvdW5kcy13cml0ZS1pbi11dmMtdmlkZW8tZW5j
b2RlLWlzb2MKICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5j
bHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNp
bmNsdWRlIDxzdGRhcmcuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4K
I2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzeXMvaW9j
dGwuaD4KI2luY2x1ZGUgPHN5cy9tb3VudC5oPgojaW5jbHVkZSA8c3lzL3NvY2tldC5oPgojaW5j
bHVkZSA8c3lzL3N0YXQuaD4KI2luY2x1ZGUgPGxpbnV4L3VzYmRldmljZV9mcy5oPgojaW5jbHVk
ZSA8bGludXgvdmlkZW9kZXYyLmg+CgojZGVmaW5lIFVWQ19FVkVOVF9TRVRVUCAoVjRMMl9FVkVO
VF9QUklWQVRFX1NUQVJUICsgNCkKCiNkZWZpbmUgR0FER0VUX0NPTkZJR0ZTX0RJUiAiL3N5cy9r
ZXJuZWwvY29uZmlnL3VzYl9nYWRnZXQvZzEiCiNkZWZpbmUgR0FER0VUX1ZFTkRPUl9JRCAgICAi
MWQ2YiIKI2RlZmluZSBHQURHRVRfUFJPRFVDVF9JRCAgICIwMTAyIgoKc3RhdGljIGNoYXIgdWRj
X3BsYXRmb3JtX2RldmljZV9uYW1lWzY0XTsKc3RhdGljIGNoYXIgdWRjX2dhZGdldF9uYW1lWzY0
XTsKc3RhdGljIGludCBob3N0X3VzYmZzX2ZkID0gLTE7CgpzdGF0aWMgdm9pZCBkaWUoY29uc3Qg
Y2hhciAqd2hhdCkKewoJZnByaW50ZihzdGRlcnIsICIlczogJXNcbiIsIHdoYXQsIHN0cmVycm9y
KGVycm5vKSk7CglleGl0KDEpOwp9CgpzdGF0aWMgY2hhciAqZm9ybWF0X3BhdGgoY29uc3QgY2hh
ciAqZm10LCAuLi4pCnsKCXN0YXRpYyBjaGFyIHJvdGF0aW5nX2J1ZmZlcnNbNF1bMjU2XTsKCXN0
YXRpYyB1bnNpZ25lZCBuZXh0X2J1ZmZlcjsKCWNoYXIgKmJ1ZmZlciA9IHJvdGF0aW5nX2J1ZmZl
cnNbbmV4dF9idWZmZXIrKyAlIDRdOwoJdmFfbGlzdCBhcmdzOwoKCXZhX3N0YXJ0KGFyZ3MsIGZt
dCk7Cgl2c25wcmludGYoYnVmZmVyLCBzaXplb2Yocm90YXRpbmdfYnVmZmVyc1swXSksIGZtdCwg
YXJncyk7Cgl2YV9lbmQoYXJncyk7CglyZXR1cm4gYnVmZmVyOwp9CgpzdGF0aWMgdm9pZCB3cml0
ZV9maWxlKGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnZhbHVlKQp7CglpbnQgZmQgPSBv
cGVuKHBhdGgsIE9fV1JPTkxZIHwgT19UUlVOQyk7CgoJaWYgKGZkIDwgMCkKCQlyZXR1cm47Cgl3
cml0ZShmZCwgdmFsdWUsIHN0cmxlbih2YWx1ZSkpOwoJY2xvc2UoZmQpOwp9CgpzdGF0aWMgaW50
IHJlYWRfdHJpbW1lZF9maWxlKGNvbnN0IGNoYXIgKnBhdGgsIGNoYXIgKm91dCwgc2l6ZV90IG91
dF9zaXplKQp7CglpbnQgZmQgPSBvcGVuKHBhdGgsIE9fUkRPTkxZKTsKCXNzaXplX3QgZ290OwoK
CWlmIChmZCA8IDApCgkJcmV0dXJuIC0xOwoJZ290ID0gcmVhZChmZCwgb3V0LCBvdXRfc2l6ZSAt
IDEpOwoJY2xvc2UoZmQpOwoJaWYgKGdvdCA8IDApCgkJcmV0dXJuIC0xOwoJb3V0W2dvdF0gPSAw
OwoJd2hpbGUgKGdvdCA+IDAgJiYgKG91dFtnb3QgLSAxXSA9PSAnXG4nIHx8IG91dFtnb3QgLSAx
XSA9PSAnICcpKQoJCW91dFstLWdvdF0gPSAwOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyB2b2lkIGJ1
aWxkX3V2Y19nYWRnZXQodm9pZCkKewoJbWtkaXIoIi9zeXMva2VybmVsL2NvbmZpZyIsIDA3NTUp
OwoJbW91bnQoIm5vbmUiLCAiL3N5cy9rZXJuZWwvY29uZmlnIiwgImNvbmZpZ2ZzIiwgMCwgTlVM
TCk7CgoJaWYgKG1rZGlyKEdBREdFVF9DT05GSUdGU19ESVIsIDA3NTUpIDwgMCAmJiBlcnJubyAh
PSBFRVhJU1QpCgkJZGllKCJta2RpciAiIEdBREdFVF9DT05GSUdGU19ESVIpOwoJd3JpdGVfZmls
ZShHQURHRVRfQ09ORklHRlNfRElSICIvaWRWZW5kb3IiLCAiMHgiIEdBREdFVF9WRU5ET1JfSUQp
OwoJd3JpdGVfZmlsZShHQURHRVRfQ09ORklHRlNfRElSICIvaWRQcm9kdWN0IiwgIjB4IiBHQURH
RVRfUFJPRFVDVF9JRCk7CgoJbWtkaXIoR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy91
dmMuMCIsIDA3NTUpOwoJbWtkaXIoR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy91dmMu
MC9jb250cm9sL2hlYWRlci9oIiwgMDc1NSk7CglzeW1saW5rKEdBREdFVF9DT05GSUdGU19ESVIg
Ii9mdW5jdGlvbnMvdXZjLjAvY29udHJvbC9oZWFkZXIvaCIsCgkJR0FER0VUX0NPTkZJR0ZTX0RJ
UiAiL2Z1bmN0aW9ucy91dmMuMC9jb250cm9sL2NsYXNzL2ZzL2giKTsKCXN5bWxpbmsoR0FER0VU
X0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy91dmMuMC9jb250cm9sL2hlYWRlci9oIiwKCQlHQURH
RVRfQ09ORklHRlNfRElSICIvZnVuY3Rpb25zL3V2Yy4wL2NvbnRyb2wvY2xhc3Mvc3MvaCIpOwoK
CW1rZGlyKEdBREdFVF9DT05GSUdGU19ESVIgIi9mdW5jdGlvbnMvdXZjLjAvc3RyZWFtaW5nL3Vu
Y29tcHJlc3NlZC91IiwgMDc1NSk7Cglta2RpcihHQURHRVRfQ09ORklHRlNfRElSICIvZnVuY3Rp
b25zL3V2Yy4wL3N0cmVhbWluZy91bmNvbXByZXNzZWQvdS8zNjBwIiwgMDc1NSk7Cglta2RpcihH
QURHRVRfQ09ORklHRlNfRElSICIvZnVuY3Rpb25zL3V2Yy4wL3N0cmVhbWluZy9oZWFkZXIvaCIs
IDA3NTUpOwoJc3ltbGluayhHQURHRVRfQ09ORklHRlNfRElSICIvZnVuY3Rpb25zL3V2Yy4wL3N0
cmVhbWluZy91bmNvbXByZXNzZWQvdSIsCgkJR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9u
cy91dmMuMC9zdHJlYW1pbmcvaGVhZGVyL2gvdSIpOwoJc3ltbGluayhHQURHRVRfQ09ORklHRlNf
RElSICIvZnVuY3Rpb25zL3V2Yy4wL3N0cmVhbWluZy9oZWFkZXIvaCIsCgkJR0FER0VUX0NPTkZJ
R0ZTX0RJUiAiL2Z1bmN0aW9ucy91dmMuMC9zdHJlYW1pbmcvY2xhc3MvZnMvaCIpOwoJc3ltbGlu
ayhHQURHRVRfQ09ORklHRlNfRElSICIvZnVuY3Rpb25zL3V2Yy4wL3N0cmVhbWluZy9oZWFkZXIv
aCIsCgkJR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy91dmMuMC9zdHJlYW1pbmcvY2xh
c3MvaHMvaCIpOwoJc3ltbGluayhHQURHRVRfQ09ORklHRlNfRElSICIvZnVuY3Rpb25zL3V2Yy4w
L3N0cmVhbWluZy9oZWFkZXIvaCIsCgkJR0FER0VUX0NPTkZJR0ZTX0RJUiAiL2Z1bmN0aW9ucy91
dmMuMC9zdHJlYW1pbmcvY2xhc3Mvc3MvaCIpOwoKCW1rZGlyKEdBREdFVF9DT05GSUdGU19ESVIg
Ii9jb25maWdzL2MuMSIsIDA3NTUpOwoJc3ltbGluayhHQURHRVRfQ09ORklHRlNfRElSICIvZnVu
Y3Rpb25zL3V2Yy4wIiwKCQlHQURHRVRfQ09ORklHRlNfRElSICIvY29uZmlncy9jLjEvdXZjLjAi
KTsKfQoKc3RhdGljIHZvaWQgYmluZF9nYWRnZXRfdG9fdXNiaXBfdnVkYyh2b2lkKQp7CglESVIg
KnVkY19jbGFzc19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJc3RydWN0IGRpcmVu
dCAqZW50cnk7CgljaGFyICpkb3Q7CglpbnQgdWRjX2F0dHJfZmQ7CgoJaWYgKCF1ZGNfY2xhc3Nf
ZGlyKQoJCWRpZSgib3BlbmRpciAvc3lzL2NsYXNzL3VkYyIpOwoJd2hpbGUgKChlbnRyeSA9IHJl
YWRkaXIodWRjX2NsYXNzX2RpcikpKQoJCWlmICghc3RybmNtcChlbnRyeS0+ZF9uYW1lLCAidXNi
aXAtdnVkYyIsIDEwKSkKCQkJYnJlYWs7CglpZiAoIWVudHJ5KSB7CgkJZnByaW50ZihzdGRlcnIs
ICJubyB1c2JpcC12dWRjIFVEQyBwcmVzZW50XG4iKTsKCQlleGl0KDEpOwoJfQoJc25wcmludGYo
dWRjX3BsYXRmb3JtX2RldmljZV9uYW1lLCBzaXplb2YodWRjX3BsYXRmb3JtX2RldmljZV9uYW1l
KSwKCQkgIiVzIiwgZW50cnktPmRfbmFtZSk7CgljbG9zZWRpcih1ZGNfY2xhc3NfZGlyKTsKCglz
bnByaW50Zih1ZGNfZ2FkZ2V0X25hbWUsIHNpemVvZih1ZGNfZ2FkZ2V0X25hbWUpLCAiJXMiLAoJ
CSB1ZGNfcGxhdGZvcm1fZGV2aWNlX25hbWUpOwoJZG90ID0gc3RycmNocih1ZGNfZ2FkZ2V0X25h
bWUsICcuJyk7CglpZiAoZG90KQoJCSpkb3QgPSAwOwoKCXVkY19hdHRyX2ZkID0gb3BlbihHQURH
RVRfQ09ORklHRlNfRElSICIvVURDIiwgT19XUk9OTFkgfCBPX1RSVU5DKTsKCWlmICh1ZGNfYXR0
cl9mZCA8IDApCgkJZGllKCJvcGVuIFVEQyIpOwoJaWYgKHdyaXRlKHVkY19hdHRyX2ZkLCB1ZGNf
cGxhdGZvcm1fZGV2aWNlX25hbWUsCgkJICBzdHJsZW4odWRjX3BsYXRmb3JtX2RldmljZV9uYW1l
KSkgPCAwKQoJCWRpZSgiYmluZCBVREMiKTsKCWNsb3NlKHVkY19hdHRyX2ZkKTsKfQoKc3RhdGlj
IHZvaWQgZW51bWVyYXRlX2dhZGdldF90aHJvdWdoX3ZoY2kodm9pZCkKewoJaW50IHVzYmlwX3Nv
Y2tldF9wYWlyWzJdOwoJY2hhciBhdHRhY2hfYXJnc1s2NF07CglpbnQgZmQ7CgoJaWYgKHNvY2tl
dHBhaXIoQUZfVU5JWCwgU09DS19TVFJFQU0sIDAsIHVzYmlwX3NvY2tldF9wYWlyKSkKCQlkaWUo
InNvY2tldHBhaXIiKTsKCglmZCA9IG9wZW4oZm9ybWF0X3BhdGgoIi9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS8lcy91c2JpcF9zb2NrZmQiLAoJCQkgICAgICB1ZGNfcGxhdGZvcm1fZGV2aWNlX25hbWUp
LCBPX1dST05MWSk7CglpZiAoZmQgPCAwKQoJCWRpZSgib3BlbiB2dWRjIHVzYmlwX3NvY2tmZCIp
OwoJc25wcmludGYoYXR0YWNoX2FyZ3MsIHNpemVvZihhdHRhY2hfYXJncyksICIlZCIsIHVzYmlw
X3NvY2tldF9wYWlyWzFdKTsKCWlmICh3cml0ZShmZCwgYXR0YWNoX2FyZ3MsIHN0cmxlbihhdHRh
Y2hfYXJncykpIDwgMCkKCQlkaWUoIndyaXRlIHZ1ZGMgdXNiaXBfc29ja2ZkIik7CgljbG9zZShm
ZCk7CgoJZmQgPSBvcGVuKCIvc3lzL2RldmljZXMvcGxhdGZvcm0vdmhjaV9oY2QuMC9hdHRhY2gi
LCBPX1dST05MWSk7CglpZiAoZmQgPCAwKQoJCWRpZSgib3BlbiB2aGNpIGF0dGFjaCIpOwoKCXNu
cHJpbnRmKGF0dGFjaF9hcmdzLCBzaXplb2YoYXR0YWNoX2FyZ3MpLCAiMCAlZCAxIDMiLAoJCSB1
c2JpcF9zb2NrZXRfcGFpclswXSk7CglpZiAod3JpdGUoZmQsIGF0dGFjaF9hcmdzLCBzdHJsZW4o
YXR0YWNoX2FyZ3MpKSA8IDApCgkJZGllKCJ3cml0ZSB2aGNpIGF0dGFjaCIpOwoJY2xvc2UoZmQp
Owp9CgpzdGF0aWMgaW50IG9wZW5fZ2FkZ2V0X3ZpZGVvX2RldmljZSh2b2lkKQp7CgljaGFyIHY0
bDJfZGV2aWNlX25hbWVbMTI4XTsKCURJUiAqdjRsMl9jbGFzc19kaXI7CglzdHJ1Y3QgZGlyZW50
ICplbnRyeTsKCWludCB0cnksIGZkID0gLTE7CgoJZm9yICh0cnkgPSAwOyB0cnkgPCA2MCAmJiBm
ZCA8IDA7IHRyeSsrKSB7CgkJdjRsMl9jbGFzc19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3Zp
ZGVvNGxpbnV4Iik7CgkJaWYgKHY0bDJfY2xhc3NfZGlyKSB7CgkJCXdoaWxlICgoZW50cnkgPSBy
ZWFkZGlyKHY0bDJfY2xhc3NfZGlyKSkpIHsKCQkJCWlmIChzdHJuY21wKGVudHJ5LT5kX25hbWUs
ICJ2aWRlbyIsIDUpKQoJCQkJCWNvbnRpbnVlOwoJCQkJaWYgKHJlYWRfdHJpbW1lZF9maWxlKGZv
cm1hdF9wYXRoKCIvc3lzL2NsYXNzL3ZpZGVvNGxpbnV4LyVzL25hbWUiLAoJCQkJCQkJCSAgZW50
cnktPmRfbmFtZSksCgkJCQkJCSAgICAgIHY0bDJfZGV2aWNlX25hbWUsCgkJCQkJCSAgICAgIHNp
emVvZih2NGwyX2RldmljZV9uYW1lKSkpCgkJCQkJY29udGludWU7CgkJCQlpZiAoc3RyY21wKHY0
bDJfZGV2aWNlX25hbWUsIHVkY19nYWRnZXRfbmFtZSkpCgkJCQkJY29udGludWU7CgkJCQlmZCA9
IG9wZW4oZm9ybWF0X3BhdGgoIi9kZXYvJXMiLCBlbnRyeS0+ZF9uYW1lKSwgT19SRFdSKTsKCQkJ
CWJyZWFrOwoJCQl9CgkJCWNsb3NlZGlyKHY0bDJfY2xhc3NfZGlyKTsKCQl9CgkJaWYgKGZkIDwg
MCkKCQkJdXNsZWVwKDEwMDAwMCk7Cgl9CglpZiAoZmQgPCAwKQoJCWRpZSgib3BlbiBnYWRnZXQg
dmlkZW8gZGV2aWNlIik7CglyZXR1cm4gZmQ7Cn0KCnN0YXRpYyBpbnQgb3Blbl9ob3N0X3VzYmZz
X2RldmljZSh2b2lkKQp7CglESVIgKnVzYl9kZXZpY2VzX2RpcjsKCXN0cnVjdCBkaXJlbnQgKmVu
dHJ5OwoJY2hhciB2ZW5kb3JbMTZdLCBwcm9kdWN0WzE2XSwgYnVzbnVtWzE2XSwgZGV2bnVtWzE2
XTsKCWludCB0cnk7CgoJZm9yICh0cnkgPSAwOyB0cnkgPCAyMDA7IHRyeSsrKSB7CgkJdXNiX2Rl
dmljZXNfZGlyID0gb3BlbmRpcigiL3N5cy9idXMvdXNiL2RldmljZXMiKTsKCQlpZiAodXNiX2Rl
dmljZXNfZGlyKSB7CgkJCXdoaWxlICgoZW50cnkgPSByZWFkZGlyKHVzYl9kZXZpY2VzX2Rpcikp
KSB7CgkJCQlpZiAoZW50cnktPmRfbmFtZVswXSA9PSAnLicgfHwgc3RyY2hyKGVudHJ5LT5kX25h
bWUsICc6JykpCgkJCQkJY29udGludWU7CgkJCQlpZiAocmVhZF90cmltbWVkX2ZpbGUoZm9ybWF0
X3BhdGgoIi9zeXMvYnVzL3VzYi9kZXZpY2VzLyVzL2lkVmVuZG9yIiwKCQkJCQkJCQkgIGVudHJ5
LT5kX25hbWUpLAoJCQkJCQkgICAgICB2ZW5kb3IsIHNpemVvZih2ZW5kb3IpKSB8fAoJCQkJICAg
IHJlYWRfdHJpbW1lZF9maWxlKGZvcm1hdF9wYXRoKCIvc3lzL2J1cy91c2IvZGV2aWNlcy8lcy9p
ZFByb2R1Y3QiLAoJCQkJCQkJCSAgZW50cnktPmRfbmFtZSksCgkJCQkJCSAgICAgIHByb2R1Y3Qs
IHNpemVvZihwcm9kdWN0KSkpCgkJCQkJY29udGludWU7CgkJCQlpZiAoc3RyY21wKHZlbmRvciwg
R0FER0VUX1ZFTkRPUl9JRCkgfHwKCQkJCSAgICBzdHJjbXAocHJvZHVjdCwgR0FER0VUX1BST0RV
Q1RfSUQpKQoJCQkJCWNvbnRpbnVlOwoJCQkJcmVhZF90cmltbWVkX2ZpbGUoZm9ybWF0X3BhdGgo
Ii9zeXMvYnVzL3VzYi9kZXZpY2VzLyVzL2J1c251bSIsCgkJCQkJCQkgICAgICBlbnRyeS0+ZF9u
YW1lKSwKCQkJCQkJICBidXNudW0sIHNpemVvZihidXNudW0pKTsKCQkJCXJlYWRfdHJpbW1lZF9m
aWxlKGZvcm1hdF9wYXRoKCIvc3lzL2J1cy91c2IvZGV2aWNlcy8lcy9kZXZudW0iLAoJCQkJCQkJ
ICAgICAgZW50cnktPmRfbmFtZSksCgkJCQkJCSAgZGV2bnVtLCBzaXplb2YoZGV2bnVtKSk7CgkJ
CQljbG9zZWRpcih1c2JfZGV2aWNlc19kaXIpOwoJCQkJcmV0dXJuIG9wZW4oZm9ybWF0X3BhdGgo
Ii9kZXYvYnVzL3VzYi8lMDNkLyUwM2QiLAoJCQkJCQkJYXRvaShidXNudW0pLCBhdG9pKGRldm51
bSkpLAoJCQkJCSAgICBPX1JEV1IpOwoJCQl9CgkJCWNsb3NlZGlyKHVzYl9kZXZpY2VzX2Rpcik7
CgkJfQoJCXVzbGVlcCg1MDAwMCk7Cgl9CglyZXR1cm4gLTE7Cn0KCnN0YXRpYyB2b2lkICpob3N0
X3NldF9hbHQxX3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCXVuc2lnbmVkIGludCBpbnRlcmZhY2Vf
bnVtYmVyID0gMTsKCXN0cnVjdCB1c2JkZXZmc19zZXRpbnRlcmZhY2Ugc2V0X2ludGVyZmFjZSA9
IHsgLmludGVyZmFjZSA9IDEsCgkJCQkJCSAgICAgICAuYWx0c2V0dGluZyA9IDEgfTsKCglpb2N0
bChob3N0X3VzYmZzX2ZkLCBVU0JERVZGU19DTEFJTUlOVEVSRkFDRSwgJmludGVyZmFjZV9udW1i
ZXIpOwoJaW9jdGwoaG9zdF91c2Jmc19mZCwgVVNCREVWRlNfU0VUSU5URVJGQUNFLCAmc2V0X2lu
dGVyZmFjZSk7CglyZXR1cm4gdW51c2VkOwp9CgppbnQgbWFpbih2b2lkKQp7CglzdHJ1Y3QgdjRs
Ml9ldmVudF9zdWJzY3JpcHRpb24gc2V0dXBfZXZlbnQgPSB7IC50eXBlID0gVVZDX0VWRU5UX1NF
VFVQIH07CglzdHJ1Y3QgdjRsMl9yZXF1ZXN0YnVmZmVycyByZXF1ZXN0X2J1ZmZlcnMgPSB7CgkJ
LmNvdW50ID0gMSwKCQkudHlwZSA9IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVULAoJCS5tZW1v
cnkgPSBWNEwyX01FTU9SWV9NTUFQLAoJfTsKCXN0cnVjdCB2NGwyX2J1ZmZlciBidWZmZXIgPSB7
CgkJLnR5cGUgPSBWNEwyX0JVRl9UWVBFX1ZJREVPX09VVFBVVCwKCQkubWVtb3J5ID0gVjRMMl9N
RU1PUllfTU1BUCwKCQkuaW5kZXggPSAwLAoJfTsKCWludCBzdHJlYW1fdHlwZSA9IFY0TDJfQlVG
X1RZUEVfVklERU9fT1VUUFVUOwoJcHRocmVhZF90IHNldF9hbHRfdGhyZWFkOwoJaW50IGdhZGdl
dF92aWRlb19mZDsKCglidWlsZF91dmNfZ2FkZ2V0KCk7CgliaW5kX2dhZGdldF90b191c2JpcF92
dWRjKCk7CglnYWRnZXRfdmlkZW9fZmQgPSBvcGVuX2dhZGdldF92aWRlb19kZXZpY2UoKTsKCglp
ZiAoaW9jdGwoZ2FkZ2V0X3ZpZGVvX2ZkLCBWSURJT0NfU1VCU0NSSUJFX0VWRU5ULCAmc2V0dXBf
ZXZlbnQpIDwgMCkKCQlkaWUoIlZJRElPQ19TVUJTQ1JJQkVfRVZFTlQiKTsKCgllbnVtZXJhdGVf
Z2FkZ2V0X3Rocm91Z2hfdmhjaSgpOwoKCWhvc3RfdXNiZnNfZmQgPSBvcGVuX2hvc3RfdXNiZnNf
ZGV2aWNlKCk7CglpZiAoaG9zdF91c2Jmc19mZCA8IDApCgkJZGllKCJvcGVuIGhvc3QgdXNiZnMg
bm9kZSIpOwoKCXB0aHJlYWRfY3JlYXRlKCZzZXRfYWx0X3RocmVhZCwgTlVMTCwgaG9zdF9zZXRf
YWx0MV90aHJlYWQsIE5VTEwpOwoKCXVzbGVlcCg2MDAwMDApOwoKCWlmIChpb2N0bChnYWRnZXRf
dmlkZW9fZmQsIFZJRElPQ19SRVFCVUZTLCAmcmVxdWVzdF9idWZmZXJzKSA8IDApCgkJZGllKCJW
SURJT0NfUkVRQlVGUyIpOwoJaWYgKGlvY3RsKGdhZGdldF92aWRlb19mZCwgVklESU9DX1FVRVJZ
QlVGLCAmYnVmZmVyKSA8IDApCgkJZGllKCJWSURJT0NfUVVFUllCVUYiKTsKCglidWZmZXIuYnl0
ZXN1c2VkID0gYnVmZmVyLmxlbmd0aDsKCWJ1ZmZlci5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsK
CWlmIChpb2N0bChnYWRnZXRfdmlkZW9fZmQsIFZJRElPQ19RQlVGLCAmYnVmZmVyKSA8IDApCgkJ
ZGllKCJWSURJT0NfUUJVRiIpOwoJaWYgKGlvY3RsKGdhZGdldF92aWRlb19mZCwgVklESU9DX1NU
UkVBTU9OLCAmc3RyZWFtX3R5cGUpIDwgMCkKCQlkaWUoIlZJRElPQ19TVFJFQU1PTiIpOwoKCXNs
ZWVwKDUpOwoJcmV0dXJuIDA7Cn0K
--000000000000e7870a065b38bfdb--
