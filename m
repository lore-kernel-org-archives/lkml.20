Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A03D6663
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168747; cv=pass; b=cOKkfF+zZEH5vfTO5zA9DGHxYsIXc0WUZowAjeTld49+uw52s3J0LSxTiK6h2pBVG14EZA9IKkJwiMAfhdgm5aErSqp4VA3KobSi53g+V7vCONZMwmb3EVyK2KfxCMrj679nGd8WXIgAzmgtMBDS7XbiHaaZdDrQWwBEm25+E4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168747; c=relaxed/simple;
	bh=IcwNj4y/YSowYNlWC44ks5r6atvIYSC3ORZNb8r1UKs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=us9CUSVnWwcLM/XN9tURx9h3YnE+9EkkEb4XlLPayTBRzoEmWisyRmA6pWImT+plS1fwtu8rCUSfgY/W4Nzwq+saLMvLRA6AnKRsoOfz4ZeQq27k/GqMFf2EIb6SXvyQ1NjVmLDvrMwJ7cQlCKqniwwNwzCEwuFnsF59jJ6oqfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=a7zspwVh; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="a7zspwVh"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so523427b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789168745; cv=none;
        d=google.com; s=arc-20260327;
        b=l3hz2omgNBRBQM/CDUwFqcyvcaB5XCsG6rzcu5kMlPMmPsJb9OSL2ZAqHQqxgrH1bN
         J+ZC1nRDnAG6hFS146UDR/RCLbSph9nJ1KFXjv+Xhcu9CRgq2ml/qeZbyR4sGHqECGQT
         YYTov/I7tf47+9SG2K94Qu6XtWDn3ioJbzO2OX8KZg5c3G1j1B50K5xN90JqoFnD5JhO
         f7b8/M4QNPHSigzr0ZjzAY8ebTdpIOIcP3ZqCllf1x86xfGQdVXlzkQSPa9wbHkNPSLE
         CgbLiF7fn5azcFjU/KUieNwN1C0jhfis72g7Zx5CqivgXmKYGB23ndFERVSp/3/XV132
         +M/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SoN0o2BpA+/GSw5IocRYahIT/oBs7wmnmgjIcRfnSCQ=;
        fh=tt7qznfXCYsnDFum2e2iWcHR+BSx4cDLmbBGYa3BeEs=;
        b=f3+NqrIRBVAZMgvr0k2FwEnetncs6BtKQT9Q6xb9UrmukMrPoAbXqDmvo6u91OnGLD
         2s+3aDWkCmpsl1ri8TZ0o4J1YcJD/RYBot6lwc0Wty9+WkpJHJrTNlXUDJ1cT0GAAzO/
         O+3BYSmjDCuU4+jMVevA4FDB+GWHhyy4FWEgtXUz9lIsTIyU0sjQO3qlny8MMrpfgQgN
         u0O/1Y/7ggT3qOmO1q71jy+PkOhwJ6hM/WSVh474RPX+4VX1cfhMbdZzbf4wNko5UmvO
         QghMY7fUvICeaMBbZVnDCyCCanAYXHLUNJEA8Cs3hR3ooYWzqn5mnSQ31L8C13mUPNDj
         P+PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789168745; x=1789773545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoN0o2BpA+/GSw5IocRYahIT/oBs7wmnmgjIcRfnSCQ=;
        b=a7zspwVhHXG10XXwfYicQTZDllQN2Z+QRQDJLtl6b/JUVtRfZAnDG3vqijl21EtjFR
         Ur/ObcNM4AAygr8enO2cdAv2aYaRh7lC/kxvd0Xx2hzklJAWFxtVL/gWdVj1J9O520uV
         a5hPxRjkyFvsuqkrybqZe1R1qHmef3A6JnHkVUcfa2gVlqSSg5w/7fY+fZXtpPOrRwy3
         GelmXvfMmGstLLrI67T5mfvMTbj4Q8HpVzR7AMXESUrmnHgm5dyQByikeP5sMDytbukQ
         2Ro9+eIL4yAwnTElIpe7GXBGvt8qeAJsxFHALRd7l2dXk5zHgCUnpW5KIgV68n3ddcWj
         0axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168745; x=1789773545;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SoN0o2BpA+/GSw5IocRYahIT/oBs7wmnmgjIcRfnSCQ=;
        b=Pn4BWWG/Veg17wo0oTt8QLzcCJXpQqoVXJG1t4hFFO7sPFz/E1IeSzrIaypXQV0flZ
         Oft/5pTuG316QC8a0XFPzpJ2jvdUiVpfoPJ4s5rP81lNZ62uceYTm4sT0bOKPitvFBr5
         gvjMUONqsUWZRS1VhUj5N/5TFasV9fn0PBR3U+3PXr9A8TWV0ZOhsM3UNTyJZ37d+Ppn
         XBp/9U4/EKG+QjKTolPnbZTnFDG+dB9/+D3mT9GApezepl/5hX1YNondrKsoGNfBQ3SX
         apUpe0KhhvV1I4zrCDjdJ531R0GolfTOsLqXc3iAZUqfJGYTL/wQlrrNm6zzCnqXQs70
         8ulw==
X-Forwarded-Encrypted: i=1; AKwUvBzrf7Pr+bhirjH/aCAm49izgzcy3+lx+AcxmwRboO0K7DyNZ3LBXchkcD/S/CNijl+LyTJiO12mJL9x6ug=@vger.kernel.org
X-Gm-Message-State: AFuF++knPh2E5CzHv4xRPmXUi1jBrI2YAYpuWlNBtBe5KcrIQCsR/Nx/
	su5LW10rwSyLNlYAvb6Z7MECG8zyTL1Vpvp66jbO8CvVD3Ni7PEM5beAD22Tpnib7xAdWVdGWSt
	dZMYd5p5ctLilMq4pFdyY1pxL3np+7VcElpVxgvCP
X-Gm-Gg: AYBFou3kL5QIR+Mdzl3k5s/K7lrrguRPzl1yYePs2mCKdEpXR96bTKCQoPstUthNEiU
	bTOVHPuB2jXWic1sp7Upe4GRy96ZmeQE9yWIXB1jacts5WRgxWBOaFrx3duyH6bQV7y2xiECwKD
	rHVsEx5Abkw5Zmu5VFDnZr3Ta59LsF22T50/0FmqbS/cfNf8JzMEVPfy1dckIzL7gAWktnL+hza
	G4ozOdXtdLzRh2kmTtu6o+haWakfheaw88nGi1L+vtMabX7IkQQdT/yMer6ob+xczXc24Gc1mqS
	q2ZsPnRN1Y6ZfraPFD9gYtR+bL/rQmX4BI6sGnplXXGdJiIk+jfc+wr3F940KtLiQpgJQHtX3HW
	k5C/e3tPJu6Fig7Ry9D9WCkKD4vgVl3h19UofnJsJ9X8vHROO10c=
X-Received: by 2002:a05:6a00:301a:b0:86a:141e:2a8d with SMTP id
 d2e1a72fcca58-86b31c04117mr10533606b3a.11.1789168743878; Fri, 11 Sep 2026
 16:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 16:18:51 -0700
X-Gm-Features: AcwNN1VGOlPXFFSuSpCsrCFqUCPmc_iy-lTdl3yZ26iORxsZZ5gLQ89ZM2Rj57w
Message-ID: <CA+0ovCgQUQNN=Z1tJTouiCsDaXR5M-3-SQEGk-cpPXQkM5Xh+w@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in __snd_ctl_add_replace
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006cb76f065b3d4f5c"

--0000000000006cb76f065b3d4f5c
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   47.352981][ T9516] BUG: KASAN: slab-use-after-free in
__dev_printk+0x7d/0x190
[   47.353074][ T9516] Read of size 8 at addr ffff88810dd940e0 by task
repro/9516
[   47.353102][ T9516]
[   47.353141][ T9516] CPU: 0 UID: 0 PID: 9516 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.353180][ T9516] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.353239][ T9516] Call Trace:
[   47.353261][ T9516]  <TASK>
[   47.353287][ T9516]  dump_stack_lvl+0xe8/0x150
[   47.353334][ T9516]  print_address_description+0x55/0x1e0
[   47.353369][ T9516]  ? __dev_printk+0x7d/0x190
[   47.353402][ T9516]  print_report+0x58/0x70
[   47.353431][ T9516]  kasan_report+0x117/0x150
[   47.353478][ T9516]  ? __dev_printk+0x7d/0x190
[   47.353516][ T9516]  __dev_printk+0x7d/0x190
[   47.353552][ T9516]  _dev_err+0x11e/0x180
[   47.353589][ T9516]  ? xa_load+0x1db/0x210
[   47.353635][ T9516]  ? __pfx__dev_err+0x10/0x10
[   47.353681][ T9516]  __snd_ctl_add_replace+0x7e2/0x980
[   47.353733][ T9516]  ? __pfx___snd_ctl_add_replace+0x10/0x10
[   47.353779][ T9516]  ? __kmalloc_noprof+0x390/0x720
[   47.353816][ T9516]  ? __kmalloc_noprof+0x1af/0x720
[   47.353849][ T9516]  ? snd_ctl_elem_add+0x436/0xa60
[   47.353888][ T9516]  ? snd_ctl_elem_add+0x436/0xa60
[   47.353931][ T9516]  ? __pfx_snd_ctl_elem_user_info+0x10/0x10
[   47.353974][ T9516]  snd_ctl_elem_add+0x738/0xa60
[   47.354023][ T9516]  snd_ctl_ioctl+0xece/0x1d50
[   47.354064][ T9516]  ? stack_trace_save+0xa9/0x100
[   47.354103][ T9516]  ? __pfx_snd_ctl_ioctl+0x10/0x10
[   47.354140][ T9516]  ? kasan_save_free_info+0x46/0x50
[   47.354175][ T9516]  ? stack_depot_save_flags+0x33/0x7f0
[   47.354233][ T9516]  ? kasan_save_track+0x4f/0x80
[   47.354271][ T9516]  ? kasan_save_track+0x3e/0x80
[   47.354307][ T9516]  ? kasan_save_free_info+0x46/0x50
[   47.354338][ T9516]  ? __kasan_slab_free+0x5c/0x80
[   47.354376][ T9516]  ? kfree+0x1c5/0x650
[   47.354406][ T9516]  ? tomoyo_path_number_perm+0x501/0x630
[   47.354448][ T9516]  ? security_file_ioctl+0xc3/0x2a0
[   47.354485][ T9516]  ? __se_sys_ioctl+0x47/0x170
[   47.354523][ T9516]  ? do_syscall_64+0x155/0x510
[   47.354566][ T9516]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.354633][ T9516]  ? tomoyo_path_number_perm+0x219/0x630
[   47.354675][ T9516]  ? tomoyo_path_number_perm+0x219/0x630
[   47.354719][ T9516]  ? do_vfs_ioctl+0x1166/0x1530
[   47.354760][ T9516]  ? __pfx_do_vfs_ioctl+0x10/0x10
[   47.354802][ T9516]  ? do_raw_spin_lock+0x12b/0x2f0
[   47.354854][ T9516]  ? __fget_files+0x2a/0x420
[   47.354887][ T9516]  ? __fget_files+0x2a/0x420
[   47.354916][ T9516]  ? __fget_files+0x3a0/0x420
[   47.354944][ T9516]  ? __fget_files+0x2a/0x420
[   47.354976][ T9516]  ? bpf_lsm_file_ioctl+0x9/0x20
[   47.355011][ T9516]  ? __pfx_snd_ctl_ioctl+0x10/0x10
[   47.355050][ T9516]  __se_sys_ioctl+0xfc/0x170
[   47.355090][ T9516]  do_syscall_64+0x155/0x510
[   47.355134][ T9516]  ? trace_irq_disable+0x3b/0x140
[   47.355174][ T9516]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.355205][ T9516]  ? clear_bhb_loop+0x30/0x80
[   47.355253][ T9516]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.355284][ T9516] RIP: 0033:0x42499d
[   47.355329][ T9516] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   47.355364][ T9516] RSP: 002b:00007f52c1730170 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   47.355409][ T9516] RAX: ffffffffffffffda RBX: 00007f52c17306c0
RCX: 000000000042499d
[   47.355433][ T9516] RDX: 00007f52c1731000 RSI: 00000000c1105517
RDI: 0000000000000004
[   47.355455][ T9516] RBP: 00007f52c17301c0 R08: 0000000000000000
R09: 0000000000000001
[   47.355475][ T9516] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f52c17306c0
[   47.355496][ T9516] R13: 00007ffdd1359920 R14: 00007f52c1730ce4
R15: 00007ffdd1359a17
[   47.355531][ T9516]  </TASK>
[   47.355543][ T9516]
[   47.355557][ T9516] Allocated by task 34:
[   47.355573][ T9516]  kasan_save_track+0x3e/0x80
[   47.355611][ T9516]  __kasan_kmalloc+0x93/0xb0
[   47.355647][ T9516]  __kmalloc_cache_noprof+0x325/0x610
[   47.355681][ T9516]  usb_set_configuration+0x3c9/0x2110
[   47.355718][ T9516]  usb_generic_driver_probe+0x8d/0x150
[   47.355753][ T9516]  usb_probe_device+0x1c4/0x3b0
[   47.355790][ T9516]  really_probe+0x267/0xaf0
[   47.355822][ T9516]  __driver_probe_device+0x1e2/0x350
[   47.355853][ T9516]  driver_probe_device+0x4f/0x240
[   47.355885][ T9516]  __device_attach_driver+0x270/0x410
[   47.355917][ T9516]  bus_for_each_drv+0x258/0x2f0
[   47.355955][ T9516]  __device_attach+0x2c5/0x450
[   47.355983][ T9516]  device_initial_probe+0xa1/0xd0
[   47.356013][ T9516]  bus_probe_device+0x12a/0x220
[   47.356051][ T9516]  device_add+0x7ec/0xb90
[   47.356077][ T9516]  usb_new_device+0xa14/0x1720
[   47.356105][ T9516]  hub_event+0x2a1c/0x4f30
[   47.356139][ T9516]  process_scheduled_works+0xc99/0x1900
[   47.356183][ T9516]  worker_thread+0xa53/0xfc0
[   47.356222][ T9516]  kthread+0x38b/0x480
[   47.356256][ T9516]  ret_from_fork+0x514/0xb70
[   47.356288][ T9516]  ret_from_fork_asm+0x1a/0x30
[   47.356322][ T9516]
[   47.356329][ T9516] Freed by task 34:
[   47.356344][ T9516]  kasan_save_track+0x3e/0x80
[   47.356379][ T9516]  kasan_save_free_info+0x46/0x50
[   47.356407][ T9516]  __kasan_slab_free+0x5c/0x80
[   47.356444][ T9516]  kfree+0x1c5/0x650
[   47.356471][ T9516]  device_release+0xc4/0x1f0
[   47.356505][ T9516]  kobject_put+0x228/0x560
[   47.356534][ T9516]  usb_disable_device+0x611/0x8d0
[   47.356568][ T9516]  usb_disconnect+0x32f/0x990
[   47.356596][ T9516]  hub_event+0x1cc9/0x4f30
[   47.356629][ T9516]  process_scheduled_works+0xc99/0x1900
[   47.356673][ T9516]  worker_thread+0xa53/0xfc0
[   47.356699][ T9516]  kthread+0x38b/0x480
[   47.356731][ T9516]  ret_from_fork+0x514/0xb70
[   47.356763][ T9516]  ret_from_fork_asm+0x1a/0x30
[   47.356796][ T9516]
[   47.356803][ T9516] The buggy address belongs to the object at
ffff88810dd94000
[   47.356803][ T9516]  which belongs to the cache kmalloc-2k of size 2048
[   47.356837][ T9516] The buggy address is located 224 bytes inside of
[   47.356837][ T9516]  freed 2048-byte region [ffff88810dd94000,
ffff88810dd94800)
[   47.356870][ T9516]
[   47.356878][ T9516] The buggy address belongs to the physical page:
[   47.356909][ T9516] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0xffff88810dd97000 pfn:0x10dd90
[   47.356942][ T9516] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   47.356968][ T9516] flags:
0x57ff00000000240(workingset|head|node=1|zone=2|lastcpupid=0x7ff)
[   47.357012][ T9516] page_type: f5(slab)
[   47.357050][ T9516] raw: 057ff00000000240 ffff88801b042000
ffffea0004441010 ffffea0004181010
[   47.357078][ T9516] raw: ffff88810dd97000 0000000000080007
00000000f5000000 0000000000000000
[   47.357106][ T9516] head: 057ff00000000240 ffff88801b042000
ffffea0004441010 ffffea0004181010
[   47.357132][ T9516] head: ffff88810dd97000 0000000000080007
00000000f5000000 0000000000000000
[   47.357159][ T9516] head: 057ff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   47.357185][ T9516] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   47.357200][ T9516] page dumped because: kasan: bad access detected
[   47.357233][ T9516] page_owner tracks the page as allocated
[   47.357245][ T9516] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 5035, tgid 5035 ((journald)), ts 9444750764
[   47.357297][ T9516]  post_alloc_hook+0x1f9/0x250
[   47.357328][ T9516]  get_page_from_freelist+0x235a/0x23e0
[   47.357366][ T9516]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   47.357403][ T9516]  allocate_slab+0x7d/0x610
[   47.357427][ T9516]  refill_objects+0x2d6/0x350
[   47.357453][ T9516]  __pcs_replace_empty_main+0x2c9/0x6c0
[   47.357495][ T9516]  __kmalloc_cache_noprof+0x3a5/0x610
[   47.357528][ T9516]  wb_get_create+0x2a8/0xd30
[   47.357564][ T9516]  __inode_attach_wb+0x482/0x5a0
[   47.357598][ T9516]  __mark_inode_dirty+0x636/0x13b0
[   47.357635][ T9516]  touch_atime+0x579/0x680
[   47.357667][ T9516]  filemap_read+0x1053/0x1230
[   47.357692][ T9516]  ext4_file_read_iter+0x3de/0xbc0
[   47.357734][ T9516]  __kernel_read+0x504/0x9b0
[   47.357763][ T9516]  bprm_execve+0x882/0x15c0
[   47.357795][ T9516]  do_execveat_common+0x510/0x690
[   47.357829][ T9516] page last free pid 5046 tgid 5046 ts 9435589623
stack trace:
[   47.357850][ T9516]  __free_frozen_pages+0xc9f/0xd90
[   47.357881][ T9516]  __slab_free+0x274/0x2c0
[   47.357914][ T9516]  qlist_free_all+0x99/0x100
[   47.357947][ T9516]  kasan_quarantine_reduce+0x148/0x160
[   47.357981][ T9516]  __kasan_slab_alloc+0x22/0x80
[   47.358018][ T9516]  kmem_cache_alloc_noprof+0x2bd/0x610
[   47.358049][ T9516]  do_getname+0x2e/0x250
[   47.358088][ T9516]  do_sys_openat2+0xcc/0x200
[   47.358128][ T9516]  __x64_sys_openat+0x138/0x170
[   47.358169][ T9516]  do_syscall_64+0x155/0x510
[   47.358226][ T9516]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.358257][ T9516]
[   47.358264][ T9516] Memory state around the buggy address:
[   47.358280][ T9516]  ffff88810dd93f80: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   47.358300][ T9516]  ffff88810dd94000: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.358320][ T9516] >ffff88810dd94080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.358336][ T9516]                                                        ^
[   47.358353][ T9516]  ffff88810dd94100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.358372][ T9516]  ffff88810dd94180: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.358387][ T9516]
==================================================================
[   47.358465][ T9516] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   47.455692][ T9516] CPU: 0 UID: 0 PID: 9516 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.456712][ T9516] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.457670][ T9516] Call Trace:
[   47.457978][ T9516]  <TASK>
[   47.458261][ T9516]  vpanic+0x56d/0xa60
[   47.458652][ T9516]  ? __pfx_vpanic+0x10/0x10
[   47.459070][ T9516]  ? irqentry_exit+0x218/0x760
[   47.459554][ T9516]  panic+0xc5/0xd0
[   47.459920][ T9516]  ? __pfx_panic+0x10/0x10
[   47.460355][ T9516]  ? __dev_printk+0x7d/0x190
[   47.460801][ T9516]  ? __dev_printk+0x7d/0x190
[   47.461229][ T9516]  check_panic_on_warn+0x89/0xb0
[   47.461687][ T9516]  ? __dev_printk+0x7d/0x190
[   47.462112][ T9516]  end_report+0x73/0x170
[   47.462509][ T9516]  ? __dev_printk+0x7d/0x190
[   47.462934][ T9516]  kasan_report+0x128/0x150
[   47.463357][ T9516]  ? __dev_printk+0x7d/0x190
[   47.463782][ T9516]  __dev_printk+0x7d/0x190
[   47.464193][ T9516]  _dev_err+0x11e/0x180
[   47.464581][ T9516]  ? xa_load+0x1db/0x210
[   47.464974][ T9516]  ? __pfx__dev_err+0x10/0x10
[   47.465413][ T9516]  __snd_ctl_add_replace+0x7e2/0x980
[   47.465900][ T9516]  ? __pfx___snd_ctl_add_replace+0x10/0x10
[   47.466494][ T9516]  ? __kmalloc_noprof+0x390/0x720
[   47.466957][ T9516]  ? __kmalloc_noprof+0x1af/0x720
[   47.467422][ T9516]  ? snd_ctl_elem_add+0x436/0xa60
[   47.467884][ T9516]  ? snd_ctl_elem_add+0x436/0xa60
[   47.468350][ T9516]  ? __pfx_snd_ctl_elem_user_info+0x10/0x10
[   47.468905][ T9516]  snd_ctl_elem_add+0x738/0xa60
[   47.469360][ T9516]  snd_ctl_ioctl+0xece/0x1d50
[   47.469794][ T9516]  ? stack_trace_save+0xa9/0x100
[   47.470253][ T9516]  ? __pfx_snd_ctl_ioctl+0x10/0x10
[   47.470725][ T9516]  ? kasan_save_free_info+0x46/0x50
[   47.471201][ T9516]  ? stack_depot_save_flags+0x33/0x7f0
[   47.471705][ T9516]  ? kasan_save_track+0x4f/0x80
[   47.472153][ T9516]  ? kasan_save_track+0x3e/0x80
[   47.472604][ T9516]  ? kasan_save_free_info+0x46/0x50
[   47.473081][ T9516]  ? __kasan_slab_free+0x5c/0x80
[   47.473538][ T9516]  ? kfree+0x1c5/0x650
[   47.473915][ T9516]  ? tomoyo_path_number_perm+0x501/0x630
[   47.474432][ T9516]  ? security_file_ioctl+0xc3/0x2a0
[   47.474912][ T9516]  ? __se_sys_ioctl+0x47/0x170
[   47.475354][ T9516]  ? do_syscall_64+0x155/0x510
[   47.475795][ T9516]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.476427][ T9516]  ? tomoyo_path_number_perm+0x219/0x630
[   47.476943][ T9516]  ? tomoyo_path_number_perm+0x219/0x630
[   47.477459][ T9516]  ? do_vfs_ioctl+0x1166/0x1530
[   47.477908][ T9516]  ? __pfx_do_vfs_ioctl+0x10/0x10
[   47.478374][ T9516]  ? do_raw_spin_lock+0x12b/0x2f0
[   47.478856][ T9516]  ? __fget_files+0x2a/0x420
[   47.479283][ T9516]  ? __fget_files+0x2a/0x420
[   47.479707][ T9516]  ? __fget_files+0x3a0/0x420
[   47.480138][ T9516]  ? __fget_files+0x2a/0x420
[   47.480567][ T9516]  ? bpf_lsm_file_ioctl+0x9/0x20
[   47.481023][ T9516]  ? __pfx_snd_ctl_ioctl+0x10/0x10
[   47.481534][ T9516]  __se_sys_ioctl+0xfc/0x170
[   47.481974][ T9516]  do_syscall_64+0x155/0x510
[   47.482439][ T9516]  ? trace_irq_disable+0x3b/0x140
[   47.482902][ T9516]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.483456][ T9516]  ? clear_bhb_loop+0x30/0x80
[   47.483888][ T9516]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.484429][ T9516] RIP: 0033:0x42499d
[   47.484790][ T9516] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   47.486566][ T9516] RSP: 002b:00007f52c1730170 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   47.487350][ T9516] RAX: ffffffffffffffda RBX: 00007f52c17306c0
RCX: 000000000042499d
[   47.488104][ T9516] RDX: 00007f52c1731000 RSI: 00000000c1105517
RDI: 0000000000000004
[   47.488857][ T9516] RBP: 00007f52c17301c0 R08: 0000000000000000
R09: 0000000000000001
[   47.489572][ T9516] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f52c17306c0
[   47.490286][ T9516] R13: 00007ffdd1359920 R14: 00007f52c1730ce4
R15: 00007ffdd1359a17
[   47.491001][ T9516]  </TASK>
[   47.491864][ T9516] Kernel Offset: disabled
[   47.492416][ T9516] Rebooting in 86400 seconds..

Regards,

--0000000000006cb76f065b3d4f5c
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxkv2p10>
X-Attachment-Id: f_mtxkv2p10

LyoKICogMjg3LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi1zbmQtY3RsLWFkZC1y
ZXBsYWNlCiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2luY2x1
ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8cG9sbC5oPgojaW5jbHVk
ZSA8cHRocmVhZC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2lu
Y2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgoj
aW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDxzeXMvbW1hbi5oPgojaW5jbHVkZSA8c3lz
L3N5c2NhbGwuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2luY2x1ZGUgPGxpbnV4L3VzYi9jaDku
aD4KI2luY2x1ZGUgPGxpbnV4L3VzYi9yYXdfZ2FkZ2V0Lmg+CiNpbmNsdWRlIDxsaW51eC91c2Vy
ZmF1bHRmZC5oPgojaW5jbHVkZSA8c291bmQvYXNvdW5kLmg+CgojZGVmaW5lIEVQMF9NQVhfUEFD
S0VUIDEwMjQKCnN0YXRpYyBpbnQgcmF3X2dhZGdldF9mZCA9IC0xOwpzdGF0aWMgaW50IHVzYl9j
YXJkX2NvbnRyb2xfZmQgPSAtMTsKc3RhdGljIGludCB1c2VyZmF1bHRfZmQgPSAtMTsKc3RhdGlj
IHZvaWQgKmZhdWx0aW5nX2VsZW1faW5mb19wYWdlOwpzdGF0aWMgdm9sYXRpbGUgaW50IHN0b3Bf
Z2FkZ2V0X2V2ZW50X3B1bXA7CgpzdGF0aWMgdm9pZCBkaWUoY29uc3QgY2hhciAqd2hhdCkKewoJ
cGVycm9yKHdoYXQpOwoJZXhpdCgxKTsKfQoKc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNl
X2Rlc2NyaXB0b3IgZGV2aWNlX2Rlc2NyaXB0b3IgPSB7CgkuYkxlbmd0aCA9IHNpemVvZihzdHJ1
Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yKSwKCS5iRGVzY3JpcHRvclR5cGUgPSBVU0JfRFRfREVW
SUNFLAoJLmJjZFVTQiA9IDB4MDIwMCwKCS5iTWF4UGFja2V0U2l6ZTAgPSA2NCwKCS5pZFZlbmRv
ciA9IDB4NWE1YSwKCS5pZFByb2R1Y3QgPSAweDFhMWEsCgkuYmNkRGV2aWNlID0gMHgwMTAwLAoJ
LmJOdW1Db25maWd1cmF0aW9ucyA9IDEsCn07CgojZGVmaW5lIExFMTYodikgKCh2KSAmIDB4ZmYp
LCAoKCh2KSA+PiA4KSAmIDB4ZmYpCgpzdGF0aWMgY29uc3QgdWludDhfdCBjb25maWdfZGVzY3Jp
cHRvcnNbXSA9IHsKCTksIFVTQl9EVF9DT05GSUcsIExFMTYoOSArIDkgKyA5ICsgOSksIDIsIDEs
IDAsIDB4YTAsIDB4MzIsCgk5LCBVU0JfRFRfSU5URVJGQUNFLCAwLCAwLCAwLCBVU0JfQ0xBU1Nf
QVVESU8sIDEgLCAwLCAwLAoJOSwgMHgyNCwgMHgwMSwgTEUxNigweDAxMDApLCBMRTE2KDkpLCAx
LCAxLAoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMSwgMCwgMCwgVVNCX0NMQVNTX0FVRElPLCAyICwg
MCwgMCwKfTsKCnN0YXRpYyBpbnQgZmluZF91ZGMoY2hhciAqZHJpdmVyX25hbWUsIHNpemVfdCBk
cml2ZXJfbmFtZV9zaXplLAoJCSAgICBjaGFyICpkZXZpY2VfbmFtZSwgc2l6ZV90IGRldmljZV9u
YW1lX3NpemUpCnsKCURJUiAqdWRjX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3MvdWRjIik7Cglz
dHJ1Y3QgZGlyZW50ICp1ZGNfZW50cnk7CgljaGFyICppbnN0YW5jZV9zdWZmaXg7CgoJaWYgKCF1
ZGNfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgodWRjX2VudHJ5ID0gcmVhZGRpcih1ZGNfZGly
KSkpIHsKCQlpZiAodWRjX2VudHJ5LT5kX25hbWVbMF0gPT0gJy4nKQoJCQljb250aW51ZTsKCQlz
bnByaW50ZihkZXZpY2VfbmFtZSwgZGV2aWNlX25hbWVfc2l6ZSwgIiVzIiwgdWRjX2VudHJ5LT5k
X25hbWUpOwoJCXNucHJpbnRmKGRyaXZlcl9uYW1lLCBkcml2ZXJfbmFtZV9zaXplLCAiJXMiLCB1
ZGNfZW50cnktPmRfbmFtZSk7CgoJCWluc3RhbmNlX3N1ZmZpeCA9IHN0cnJjaHIoZHJpdmVyX25h
bWUsICcuJyk7CgkJaWYgKGluc3RhbmNlX3N1ZmZpeCkKCQkJKmluc3RhbmNlX3N1ZmZpeCA9IDA7
CgkJY2xvc2VkaXIodWRjX2Rpcik7CgkJcmV0dXJuIDA7Cgl9CgljbG9zZWRpcih1ZGNfZGlyKTsK
CXJldHVybiAtMTsKfQoKc3RhdGljIHZvaWQgZXAwX3JlYWQodWludDMyX3QgbGVuZ3RoKQp7Cgl1
aW50OF90IGJ1ZltzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXBfaW8pICsgRVAwX01BWF9QQUNLRVRd
OwoJc3RydWN0IHVzYl9yYXdfZXBfaW8gKmlvID0gKHZvaWQgKilidWY7CgoJaW8tPmVwID0gMDsK
CWlvLT5mbGFncyA9IDA7Cglpby0+bGVuZ3RoID0gbGVuZ3RoID4gRVAwX01BWF9QQUNLRVQgPyBF
UDBfTUFYX1BBQ0tFVCA6IGxlbmd0aDsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9D
VExfRVAwX1JFQUQsIGlvKTsKfQoKc3RhdGljIHZvaWQgZXAwX3dyaXRlKGNvbnN0IHZvaWQgKmRh
dGEsIHVpbnQzMl90IGxlbmd0aCkKewoJdWludDhfdCBidWZbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3
X2VwX2lvKSArIEVQMF9NQVhfUEFDS0VUXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICppbyA9ICh2
b2lkICopYnVmOwoKCWlvLT5lcCA9IDA7Cglpby0+ZmxhZ3MgPSAwOwoJaW8tPmxlbmd0aCA9IGxl
bmd0aDsKCWlmIChsZW5ndGgpCgkJbWVtY3B5KGlvLT5kYXRhLCBkYXRhLCBsZW5ndGgpOwoJaW9j
dGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfV1JJVEUsIGlvKTsKfQoKc3RhdGlj
IHZvaWQgaGFuZGxlX2VwMF9jb250cm9sKGNvbnN0IHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0
cmwpCnsKCWNvbnN0IHZvaWQgKnJlcGx5ID0gTlVMTDsKCWludCByZXBseV9sZW5ndGggPSAtMTsK
CglpZiAoKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9UWVBFX01BU0spID09IFVTQl9UWVBFX1NU
QU5EQVJEKSB7CgkJc3dpdGNoIChjdHJsLT5iUmVxdWVzdCkgewoJCWNhc2UgVVNCX1JFUV9HRVRf
REVTQ1JJUFRPUjoKCQkJaWYgKChjdHJsLT53VmFsdWUgPj4gOCkgPT0gVVNCX0RUX0RFVklDRSkg
ewoJCQkJcmVwbHkgPSAmZGV2aWNlX2Rlc2NyaXB0b3I7CgkJCQlyZXBseV9sZW5ndGggPSBzaXpl
b2YoZGV2aWNlX2Rlc2NyaXB0b3IpOwoJCQl9IGVsc2UgaWYgKChjdHJsLT53VmFsdWUgPj4gOCkg
PT0gVVNCX0RUX0NPTkZJRykgewoJCQkJcmVwbHkgPSBjb25maWdfZGVzY3JpcHRvcnM7CgkJCQly
ZXBseV9sZW5ndGggPSBzaXplb2YoY29uZmlnX2Rlc2NyaXB0b3JzKTsKCQkJfQoJCQlicmVhazsK
CQljYXNlIFVTQl9SRVFfU0VUX0NPTkZJR1VSQVRJT046CgkJCWlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfQ09ORklHVVJFLCAwKTsKCQkJcmVwbHlfbGVuZ3RoID0gMDsKCQkJYnJl
YWs7CgkJfQoJfQoKCWlmIChyZXBseV9sZW5ndGggPCAwKSB7CgkJaW9jdGwocmF3X2dhZGdldF9m
ZCwgVVNCX1JBV19JT0NUTF9FUDBfU1RBTEwsIDApOwoJCXJldHVybjsKCX0KCWlmIChjdHJsLT5i
UmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSB7CgkJaWYgKHJlcGx5X2xlbmd0aCA+IChpbnQpY3Ry
bC0+d0xlbmd0aCkKCQkJcmVwbHlfbGVuZ3RoID0gY3RybC0+d0xlbmd0aDsKCQllcDBfd3JpdGUo
cmVwbHksICh1aW50MzJfdClyZXBseV9sZW5ndGgpOwoJfSBlbHNlIHsKCgkJZXAwX3JlYWQoY3Ry
bC0+d0xlbmd0aCk7Cgl9Cn0KCnN0YXRpYyB2b2lkIHdha2VfZ2FkZ2V0X2V2ZW50X3B1bXAoaW50
IHNpZ25hbF9udW1iZXIpCnsKCSh2b2lkKXNpZ25hbF9udW1iZXI7Cn0KCnN0YXRpYyB2b2lkICpn
YWRnZXRfZXZlbnRfcHVtcCh2b2lkICp1bnVzZWQpCnsKCXVpbnQ4X3QgYnVmW3NpemVvZihzdHJ1
Y3QgdXNiX3Jhd19ldmVudCkgKyBFUDBfTUFYX1BBQ0tFVF07CglzdHJ1Y3QgdXNiX3Jhd19ldmVu
dCAqZXZlbnQgPSAodm9pZCAqKWJ1ZjsKCgl3aGlsZSAoIXN0b3BfZ2FkZ2V0X2V2ZW50X3B1bXAp
IHsKCQlldmVudC0+dHlwZSA9IDA7CgkJZXZlbnQtPmxlbmd0aCA9IEVQMF9NQVhfUEFDS0VUOwoJ
CWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENILCBldmVu
dCkgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5UUikKCQkJCWNvbnRpbnVlOwoJCQlicmVhazsK
CQl9CgkJaWYgKGV2ZW50LT50eXBlID09IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkKCQkJaGFuZGxl
X2VwMF9jb250cm9sKChzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRhdGEpOwoJfQoJ
cmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyB2b2lkIGZpbGxfdXNlcl9lbGVtX2luZm8oc3RydWN0IHNu
ZF9jdGxfZWxlbV9pbmZvICppbmZvKQp7CgltZW1zZXQoaW5mbywgMCwgc2l6ZW9mKCppbmZvKSk7
CglpbmZvLT5pZC5pZmFjZSA9IFNORFJWX0NUTF9FTEVNX0lGQUNFX01JWEVSOwoJc3RyY3B5KChj
aGFyICopaW5mby0+aWQubmFtZSwgIlBST1RFQU4gVUFGIik7CglpbmZvLT50eXBlID0gU05EUlZf
Q1RMX0VMRU1fVFlQRV9JTlRFR0VSOwoJaW5mby0+Y291bnQgPSAxOwoJaW5mby0+dmFsdWUuaW50
ZWdlci5tYXggPSAxOwp9CgpzdGF0aWMgdm9pZCAqcGFya2VkX2VsZW1fYWRkX3RocmVhZCh2b2lk
ICp1bnVzZWQpCnsKCWlvY3RsKHVzYl9jYXJkX2NvbnRyb2xfZmQsIFNORFJWX0NUTF9JT0NUTF9F
TEVNX0FERCwKCSAgICAgIGZhdWx0aW5nX2VsZW1faW5mb19wYWdlKTsKCXJldHVybiBOVUxMOwp9
CgpzdGF0aWMgaW50IG9wZW5fdXNiX2NhcmRfY29udHJvbCh2b2lkKQp7CgljaGFyIHBhdGhbNjRd
OwoJc3RydWN0IHNuZF9jdGxfY2FyZF9pbmZvIGNhcmRfaW5mbzsKCWludCBjYXJkX2luZGV4LCBm
ZDsKCglmb3IgKGNhcmRfaW5kZXggPSAwOyBjYXJkX2luZGV4IDwgODsgY2FyZF9pbmRleCsrKSB7
CgkJc25wcmludGYocGF0aCwgc2l6ZW9mKHBhdGgpLCAiL2Rldi9zbmQvY29udHJvbEMlZCIsIGNh
cmRfaW5kZXgpOwoJCWZkID0gb3BlbihwYXRoLCBPX1JEV1IpOwoJCWlmIChmZCA8IDApCgkJCWNv
bnRpbnVlOwoJCW1lbXNldCgmY2FyZF9pbmZvLCAwLCBzaXplb2YoY2FyZF9pbmZvKSk7CgkJaWYg
KGlvY3RsKGZkLCBTTkRSVl9DVExfSU9DVExfQ0FSRF9JTkZPLCAmY2FyZF9pbmZvKSA9PSAwICYm
CgkJICAgIHN0cnN0cigoY2hhciAqKWNhcmRfaW5mby5kcml2ZXIsICJVU0ItQXVkaW8iKSkKCQkJ
cmV0dXJuIGZkOwoJCWNsb3NlKGZkKTsKCX0KCXJldHVybiAtMTsKfQoKaW50IG1haW4odm9pZCkK
ewoJY2hhciB1ZGNfZHJpdmVyX25hbWVbMTI4XSwgdWRjX2RldmljZV9uYW1lWzEyOF07CglzdHJ1
Y3QgdXNiX3Jhd19pbml0IGluaXQ7CglzdHJ1Y3Qgc2lnYWN0aW9uIHdha2VfYWN0aW9uOwoJcHRo
cmVhZF90IGV2ZW50X3B1bXBfdGhyZWFkLCBlbGVtX2FkZF90aHJlYWQ7CglzdHJ1Y3QgdWZmZGlv
X2FwaSB1ZmZkX2FwaTsKCXN0cnVjdCB1ZmZkaW9fcmVnaXN0ZXIgdWZmZF9yZWdpc3RlcjsKCXN0
cnVjdCB1ZmZkaW9fY29weSB1ZmZkX2NvcHk7CglzdHJ1Y3QgdWZmZF9tc2cgZmF1bHRfbWVzc2Fn
ZTsKCXN0cnVjdCBzbmRfY3RsX2VsZW1faW5mbyBpbmZvOwoJc3RhdGljIHVpbnQ4X3QgcmVsZWFz
ZWRfcGFnZVsweDEwMDBdIF9fYXR0cmlidXRlX18oKGFsaWduZWQoMHgxMDAwKSkpOwoJaW50IGF0
dGVtcHQ7CgoJaWYgKGZpbmRfdWRjKHVkY19kcml2ZXJfbmFtZSwgc2l6ZW9mKHVkY19kcml2ZXJf
bmFtZSksCgkJICAgICB1ZGNfZGV2aWNlX25hbWUsIHNpemVvZih1ZGNfZGV2aWNlX25hbWUpKSA8
IDApCgkJZGllKCJubyBVREMgdW5kZXIgL3N5cy9jbGFzcy91ZGMiKTsKCglyYXdfZ2FkZ2V0X2Zk
ID0gb3BlbigiL2Rldi9yYXctZ2FkZ2V0IiwgT19SRFdSKTsKCWlmIChyYXdfZ2FkZ2V0X2ZkIDwg
MCkKCQlkaWUoIm9wZW4gL2Rldi9yYXctZ2FkZ2V0Iik7CgltZW1zZXQoJmluaXQsIDAsIHNpemVv
Zihpbml0KSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kcml2ZXJfbmFtZSwgdWRjX2RyaXZlcl9u
YW1lLAoJCXNpemVvZihpbml0LmRyaXZlcl9uYW1lKSAtIDEpOwoJc3RybmNweSgoY2hhciAqKWlu
aXQuZGV2aWNlX25hbWUsIHVkY19kZXZpY2VfbmFtZSwKCQlzaXplb2YoaW5pdC5kZXZpY2VfbmFt
ZSkgLSAxKTsKCWluaXQuc3BlZWQgPSBVU0JfU1BFRURfSElHSDsKCWlmIChpb2N0bChyYXdfZ2Fk
Z2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0lOSVQsICZpbml0KSA8IDApCgkJZGllKCJVU0JfUkFXX0lP
Q1RMX0lOSVQiKTsKCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX1JVTiwg
MCkgPCAwKQoJCWRpZSgiVVNCX1JBV19JT0NUTF9SVU4iKTsKCgltZW1zZXQoJndha2VfYWN0aW9u
LCAwLCBzaXplb2Yod2FrZV9hY3Rpb24pKTsKCgl3YWtlX2FjdGlvbi5zYV9oYW5kbGVyID0gd2Fr
ZV9nYWRnZXRfZXZlbnRfcHVtcDsKCXNpZ2FjdGlvbihTSUdVU1IxLCAmd2FrZV9hY3Rpb24sIE5V
TEwpOwoJcHRocmVhZF9jcmVhdGUoJmV2ZW50X3B1bXBfdGhyZWFkLCBOVUxMLCBnYWRnZXRfZXZl
bnRfcHVtcCwgTlVMTCk7CgoJZm9yIChhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDEwMDsgYXR0ZW1w
dCsrKSB7CgkJdXNiX2NhcmRfY29udHJvbF9mZCA9IG9wZW5fdXNiX2NhcmRfY29udHJvbCgpOwoJ
CWlmICh1c2JfY2FyZF9jb250cm9sX2ZkID49IDApCgkJCWJyZWFrOwoJCXVzbGVlcCgxMDAwMDAp
OwoJfQoJaWYgKHVzYl9jYXJkX2NvbnRyb2xfZmQgPCAwKQoJCWRpZSgic25kLXVzYi1hdWRpbyBu
ZXZlciByZWdpc3RlcmVkIGEgY2FyZCIpOwoKCWZpbGxfdXNlcl9lbGVtX2luZm8oJmluZm8pOwoJ
aWYgKGlvY3RsKHVzYl9jYXJkX2NvbnRyb2xfZmQsIFNORFJWX0NUTF9JT0NUTF9FTEVNX0FERCwg
JmluZm8pIDwgMCkKCQlkaWUoInByaW1pbmcgRUxFTV9BREQiKTsKCgl1c2VyZmF1bHRfZmQgPSBz
eXNjYWxsKF9fTlJfdXNlcmZhdWx0ZmQsIE9fQ0xPRVhFQyB8IE9fTk9OQkxPQ0spOwoJaWYgKHVz
ZXJmYXVsdF9mZCA8IDApCgkJZGllKCJ1c2VyZmF1bHRmZCIpOwoJbWVtc2V0KCZ1ZmZkX2FwaSwg
MCwgc2l6ZW9mKHVmZmRfYXBpKSk7Cgl1ZmZkX2FwaS5hcGkgPSBVRkZEX0FQSTsKCWlmIChpb2N0
bCh1c2VyZmF1bHRfZmQsIFVGRkRJT19BUEksICZ1ZmZkX2FwaSkgPCAwKQoJCWRpZSgiVUZGRElP
X0FQSSIpOwoJZmF1bHRpbmdfZWxlbV9pbmZvX3BhZ2UgPSBtbWFwKE5VTEwsIDB4MTAwMCwgUFJP
VF9SRUFEIHwgUFJPVF9XUklURSwKCQkJCSAgICAgICBNQVBfUFJJVkFURSB8IE1BUF9BTk9OWU1P
VVMsIC0xLCAwKTsKCWlmIChmYXVsdGluZ19lbGVtX2luZm9fcGFnZSA9PSBNQVBfRkFJTEVEKQoJ
CWRpZSgibW1hcCIpOwoJbWVtc2V0KCZ1ZmZkX3JlZ2lzdGVyLCAwLCBzaXplb2YodWZmZF9yZWdp
c3RlcikpOwoJdWZmZF9yZWdpc3Rlci5yYW5nZS5zdGFydCA9ICh1bnNpZ25lZCBsb25nKWZhdWx0
aW5nX2VsZW1faW5mb19wYWdlOwoJdWZmZF9yZWdpc3Rlci5yYW5nZS5sZW4gPSAweDEwMDA7Cgl1
ZmZkX3JlZ2lzdGVyLm1vZGUgPSBVRkZESU9fUkVHSVNURVJfTU9ERV9NSVNTSU5HOwoJaWYgKGlv
Y3RsKHVzZXJmYXVsdF9mZCwgVUZGRElPX1JFR0lTVEVSLCAmdWZmZF9yZWdpc3RlcikgPCAwKQoJ
CWRpZSgiVUZGRElPX1JFR0lTVEVSIik7CgoJcHRocmVhZF9jcmVhdGUoJmVsZW1fYWRkX3RocmVh
ZCwgTlVMTCwgcGFya2VkX2VsZW1fYWRkX3RocmVhZCwgTlVMTCk7CgoJZm9yIChhdHRlbXB0ID0g
MDsgYXR0ZW1wdCA8IDIwMDsgYXR0ZW1wdCsrKSB7CgkJc3RydWN0IHBvbGxmZCBwb2xsX3VmZmQg
PSB7IC5mZCA9IHVzZXJmYXVsdF9mZCwgLmV2ZW50cyA9IFBPTExJTiB9OwoKCQlpZiAocG9sbCgm
cG9sbF91ZmZkLCAxLCA1MCkgPiAwICYmCgkJICAgIHJlYWQodXNlcmZhdWx0X2ZkLCAmZmF1bHRf
bWVzc2FnZSwgc2l6ZW9mKGZhdWx0X21lc3NhZ2UpKSA9PQoJCQkgICAgc2l6ZW9mKGZhdWx0X21l
c3NhZ2UpKQoJCQlicmVhazsKCX0KCWlmIChhdHRlbXB0ID09IDIwMCkKCQlkaWUoIkVMRU1fQURE
IG5ldmVyIGZhdWx0ZWQiKTsKCglzdG9wX2dhZGdldF9ldmVudF9wdW1wID0gMTsKCXB0aHJlYWRf
a2lsbChldmVudF9wdW1wX3RocmVhZCwgU0lHVVNSMSk7CglwdGhyZWFkX2pvaW4oZXZlbnRfcHVt
cF90aHJlYWQsIE5VTEwpOwoJY2xvc2UocmF3X2dhZGdldF9mZCk7CglyYXdfZ2FkZ2V0X2ZkID0g
LTE7CglzbGVlcCgzKTsKCglmaWxsX3VzZXJfZWxlbV9pbmZvKChzdHJ1Y3Qgc25kX2N0bF9lbGVt
X2luZm8gKilyZWxlYXNlZF9wYWdlKTsKCW1lbXNldCgmdWZmZF9jb3B5LCAwLCBzaXplb2YodWZm
ZF9jb3B5KSk7Cgl1ZmZkX2NvcHkuZHN0ID0gKHVuc2lnbmVkIGxvbmcpZmF1bHRpbmdfZWxlbV9p
bmZvX3BhZ2U7Cgl1ZmZkX2NvcHkuc3JjID0gKHVuc2lnbmVkIGxvbmcpcmVsZWFzZWRfcGFnZTsK
CXVmZmRfY29weS5sZW4gPSAweDEwMDA7CglpZiAoaW9jdGwodXNlcmZhdWx0X2ZkLCBVRkZESU9f
Q09QWSwgJnVmZmRfY29weSkgPCAwKQoJCWRpZSgiVUZGRElPX0NPUFkiKTsKCglwdGhyZWFkX2pv
aW4oZWxlbV9hZGRfdGhyZWFkLCBOVUxMKTsKCXJldHVybiAwOwp9Cg==
--0000000000006cb76f065b3d4f5c--
