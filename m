Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B65476075
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141413; cv=pass; b=E2+OFda01VgdLCtaiEAqM0okD24YlviQbGex7m9NvlV7Sbac7QuVdyB7Qwj5VBdDx59JGZXZs5VZ8fSZ+znQoznimUMGKACoCCM8si/G6Z/r10A1GViE9IrjSMYqKkWdD8WofIfyZvF1juubqjUZxtWxDUxgO0rM0R1mSBuTvc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141413; c=relaxed/simple;
	bh=OzZzdUz3Km+MNfc33awdlKo4ql2EXQ0D4biws0fcNJs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KrZjfca3XKwHIW+g1jI4RVgcJiKm/mKOc+gJrUoZWFIq9dG8qKsfVBT57kFQuNYo5xRfGv/lBkxrbDxF2GsvG6FhBrxymGfESSBi5X2PKFJthFTv7N0oaeSE34MB3bRTvloSToG+vDB48b8EEOlOzSFl+rcwkS3FxuczFOQIuKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=C4oxVNcO; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="C4oxVNcO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86908cbc011so1525279b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141405; cv=none;
        d=google.com; s=arc-20260327;
        b=B02VMthfbj9ldoRpmT7g5dCZ5DyfnpVJxpEGvfS9FQ9NO0WYp/PRamfBI6ZJXQwUIJ
         bUnCam0f7Xo9eK4vy4c3+TnzB4Mxg4bY2ufcLx7GmJ/pn3s9kgD9Np/1g8lVeQbpR6XY
         XMVze1xy11pWSL65qe1gqUorHDnGOh1LHznBv/+Y2TG8V6EE7PgTPmnTb+by8bp9Tz4f
         vUYAjMRQaZGSJp+9J8FwcBkX+cNiJ5NJOQZnCOfAM9n5OjN3Vycelt/UTI3kiU8lkgUS
         f1FTibzsXg3vCTfxH6LrHNadcXbB1tPpGrqJNqWZ8KMUXlfFuKaxc5cuxwV1WzAALR+F
         n9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=o/MPfdjNjkJdm968puv0A4FcmpOfH6R/xR5JCLdFYV0=;
        fh=K/bBulpWEHZ/jVlVyjO2b2BegMFJtMp4vOR5Q1Jy/I4=;
        b=Sk7e3HQJ70EjU/fDn/u2Egbv5MeIo+Kv83zg42HTiYTH+DS8/Ioceoa9k/u8R+K3AV
         H8c2pXHiMVRTxEXaVg/2Hcm8ic5wl2WUcdx2U5XOyv84oEwP2CJL17QD/cEHtPatWjCa
         M1hSKGV+M72Q2MpM9WNvdZg44w2KGznGImrDAhE1+WqvN86TFboajDcWGAXI7bJPZld0
         3XrKeKwyq0hbgXyOgdD+PnKvLf1nUP8n6EXcWHXcrydx4K69qq22eOy/xagvE1GtrJ6u
         +tmNZtR1FyErPXlQpCHEvBClm5nu6WnLy7YCUdiYP7ukFmDvVpG/i0XHVh+ux4lz9evz
         b77A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789141405; x=1789746205; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/MPfdjNjkJdm968puv0A4FcmpOfH6R/xR5JCLdFYV0=;
        b=C4oxVNcOm3N1gHIP9LV3MnS4b65ZPDcCxY8O8YZlysTVbKa4IRg/L5tuKRykhcHwZ7
         fKxEqeIOMvB+5Eqcfw2PtRGp+Ye2GaEGJg1CX1k1FStirfAH4MhW3XpQ6gb0IdVzGsYZ
         9xz9FQ6DOwMZPWc+HLQLLM+aWxDetzYpffElr+0yrpJ8TK8l/eBTbjWhA16iM8lq93iR
         qInEdBjwbnVxDHFl6LvtAFHmT5UDhXvInfR6rrjZ6K9DYGvsJki7gqzsyXeL3KxffYVO
         YcZKQONWwzvYUi/ekfIwlkDgV6uDauv8HWQiWpR5mP1ad9zRHtjQazG7AdaNxlAKrjJB
         MeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141405; x=1789746205;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o/MPfdjNjkJdm968puv0A4FcmpOfH6R/xR5JCLdFYV0=;
        b=NE/IKYDDKttoXaAjuaJX7sy+my3C05OWUEp/AOVAyraGJcN7OqlAIx5cBVgfS1uBs2
         ncnESmUIR+0RSPWQrSEi0NlNoIQqz0+3+eKj62GflmLoFNDNj9Q5Z5zgAJlUygcVxZSq
         ewzBWeNqYJ2s03EUJGhs8dyGhKKxKOvcMqke5UCZzs1GBPUDlndJJJYNv2qmgVkdA9a2
         9VkaWRj6mllF0kyQU2gKKtSA9ft8Ep/ftHh07PPmpCpupP29yanADv32MV2C6oReW+MX
         yfAlQUWgiXwwlCD20asA91618AwIc4kW3WpQr5LG5tSP9nh1s9LTLSokX125TjAOpiDV
         x4ew==
X-Forwarded-Encrypted: i=1; AKwUvBxPWkmbFHJJLQ4Az5yKG979I+ooimtzAtpJ40Lpv/e/AtmCkBqmJaqS0xuQWp0bTjxF1PDR7rLNlsQE/Ms=@vger.kernel.org
X-Gm-Message-State: AFuF++kaAUf+amcPMkSd6cjdEWfY2YU3yM9IOiwFT4Rsogb+uCuF1UEh
	9S5zQUXWFk8aFzaMEt4nSU2The7Mki7wuQJfoUf5v2PNVkfRh1JxQ7Zx6qYDW0eNQO8M6+B5sPA
	0dNJ5PFi03Op0EiMMuE5+xTIaatdyJ1LeQXNSHAZT
X-Gm-Gg: AYBFou0JiVDo2vIrfAx6eUfN/IaJOXpVWcDhRUIpsxRJYXckVoWQvQ5PUlSR7S4eysJ
	/yFc5C+0To7v7sBvlkWAh+d+COUM7vYl8stPk/R311RnXzH7hegoMiaWNB9cY3dGNvh1rrHvOFp
	2LkXt8fyh4mu8noD4Dm9lLA77u4azQKM9EnunSs1rDcFt5dIUM7zGSLR0w1EFZSoS35dTq8yjER
	hd2SjwnkhgSHcgFi+5Mdw4e+6YhvjiyQH5Szb393gU2uDESXYCF3YTrEfiavLrv03lhKclSTEj6
	jZxpDaTVJ3lfGoS8Co0tKFsaAu0T+7VSndEHBIYFEXVT2qx9NGiefaAOrjC9+DPbVKqbomqax3a
	2M4DbHzdtgDUz2r3u1IfmwHZWrmwV5eIWt+M1+UW/U70O/DuVoSyiCnHPmZEUHpzOvqftbprTzW
	0=
X-Received: by 2002:a05:6a00:c510:b0:86b:922d:6aa with SMTP id
 d2e1a72fcca58-86b922d09bamr3842222b3a.1.1789141403498; Fri, 11 Sep 2026
 08:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:43:12 -0700
X-Gm-Features: AcwNN1U-sIK2EbKkGDlTkXfc7Pp-vGhzRaEqu1Y4A7sJW4VO2c7gwQHep57us3A
Message-ID: <CA+0ovCirdG8hDwCa4XrNfYrL=-N5K4Ky8HC9yh4T40z_gdmUyQ@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Write in cxusb_medion_analog_init
To: Michael Krufky <mkrufky@linuxtv.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000cfe8f5065b36f150"

--000000000000cfe8f5065b36f150
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   45.869690][ T9842] BUG: KASAN: slab-use-after-free in
cxusb_medion_analog_init+0x53d/0xe90
[   45.869716][ T9842] Write of size 8 at addr ffff88802c55f668 by
task repro/9842
[   45.869722][ T9842]
[   45.869732][ T9842] CPU: 1 UID: 0 PID: 9842 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   45.869740][ T9842] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   45.869748][ T9842] Call Trace:
[   45.869753][ T9842]  <TASK>
[   45.869757][ T9842]  dump_stack_lvl+0xe8/0x150
[   45.869768][ T9842]  print_address_description+0x55/0x1e0
[   45.869776][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   45.869783][ T9842]  print_report+0x58/0x70
[   45.869789][ T9842]  kasan_report+0x117/0x150
[   45.869799][ T9842]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   45.869810][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   45.869818][ T9842]  cxusb_medion_analog_init+0x53d/0xe90
[   45.869826][ T9842]  ? __pfx_cxusb_medion_analog_init+0x10/0x10
[   45.869833][ T9842]  ? cxusb_ctrl_msg+0x157/0x1e0
[   45.869844][ T9842]  ? __pfx_cxusb_medion_set_mode+0x10/0x10
[   45.869854][ T9842]  ? __mutex_unlock_slowpath+0x731/0x900
[   45.869864][ T9842]  ? __asan_memset+0x22/0x50
[   45.869872][ T9842]  cxusb_medion_get+0x35a/0x510
[   45.869885][ T9842]  cxusb_videoradio_open+0x54/0x130
[   45.869895][ T9842]  v4l2_open+0x1bf/0x3a0
[   45.869902][ T9842]  chrdev_open+0x4cd/0x5e0
[   45.869912][ T9842]  ? __pfx_chrdev_open+0x10/0x10
[   45.869920][ T9842]  ? fsnotify_open_perm_and_set_mode+0x135/0x6d0
[   45.869929][ T9842]  ? __pfx_chrdev_open+0x10/0x10
[   45.869937][ T9842]  do_dentry_open+0x822/0x13a0
[   45.869948][ T9842]  vfs_open+0x3b/0x340
[   45.869956][ T9842]  ? path_openat+0x1552/0x1f30
[   45.869964][ T9842]  path_openat+0x1569/0x1f30
[   45.869974][ T9842]  do_file_open+0x23e/0x4a0
[   45.869982][ T9842]  ? __pfx_do_file_open+0x10/0x10
[   45.869992][ T9842]  ? alloc_fd+0x676/0x6f0
[   45.870000][ T9842]  do_sys_openat2+0x115/0x200
[   45.870009][ T9842]  ? _raw_spin_unlock_irq+0x2e/0x50
[   45.870017][ T9842]  ? __pfx_do_sys_openat2+0x10/0x10
[   45.870026][ T9842]  ? exc_page_fault+0x6a/0xc0
[   45.870036][ T9842]  ? do_user_addr_fault+0xc71/0x1340
[   45.870045][ T9842]  __x64_sys_openat+0x138/0x170
[   45.870054][ T9842]  do_syscall_64+0x155/0x510
[   45.870063][ T9842]  ? trace_irq_disable+0x3b/0x140
[   45.870072][ T9842]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.870079][ T9842]  ? clear_bhb_loop+0x30/0x80
[   45.870086][ T9842]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.870092][ T9842] RIP: 0033:0x43bf52
[   45.870102][ T9842] Code: 08 0f 85 71 ea ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   45.870110][ T9842] RSP: 002b:00007f2384c85118 EFLAGS: 00000246
ORIG_RAX: 0000000000000101
[   45.870120][ T9842] RAX: ffffffffffffffda RBX: 00007f2384c856c0
RCX: 000000000043bf52
[   45.870125][ T9842] RDX: 0000000000000000 RSI: 00000000004d1b00
RDI: ffffffffffffff9c
[   45.870129][ T9842] RBP: 00007f2384c85140 R08: 0000000000000000
R09: 0000000000000000
[   45.870133][ T9842] R10: 0000000000000000 R11: 0000000000000246
R12: 00007f2384c856c0
[   45.870138][ T9842] R13: 00007ffdc4beb3f0 R14: 00007f2384c85ce4
R15: 00007ffdc4beb4e7
[   45.870145][ T9842]  </TASK>
[   45.870147][ T9842]
[   45.870151][ T9842] Allocated by task 9:
[   45.870154][ T9842]  kasan_save_track+0x3e/0x80
[   45.870162][ T9842]  __kasan_kmalloc+0x93/0xb0
[   45.870170][ T9842]  __kmalloc_cache_noprof+0x325/0x610
[   45.870178][ T9842]  cxusb_medion_register_analog+0x909/0x1120
[   45.870184][ T9842]  cxusb_probe+0x664/0x710
[   45.870192][ T9842]  usb_probe_interface+0x71f/0xe00
[   45.870205][ T9842]  really_probe+0x267/0xaf0
[   45.870212][ T9842]  __driver_probe_device+0x1e2/0x350
[   45.870219][ T9842]  driver_probe_device+0x4f/0x240
[   45.870225][ T9842]  __device_attach_driver+0x270/0x410
[   45.870232][ T9842]  bus_for_each_drv+0x258/0x2f0
[   45.870240][ T9842]  __device_attach+0x2c5/0x450
[   45.870246][ T9842]  device_initial_probe+0xa1/0xd0
[   45.870252][ T9842]  bus_probe_device+0x12a/0x220
[   45.870260][ T9842]  device_add+0x7ec/0xb90
[   45.870265][ T9842]  usb_set_configuration+0x1a87/0x2110
[   45.870273][ T9842]  usb_generic_driver_probe+0x8d/0x150
[   45.870281][ T9842]  usb_probe_device+0x1c4/0x3b0
[   45.870288][ T9842]  really_probe+0x267/0xaf0
[   45.870294][ T9842]  __driver_probe_device+0x1e2/0x350
[   45.870300][ T9842]  driver_probe_device+0x4f/0x240
[   45.870307][ T9842]  __device_attach_driver+0x270/0x410
[   45.870313][ T9842]  bus_for_each_drv+0x258/0x2f0
[   45.870321][ T9842]  __device_attach+0x2c5/0x450
[   45.870327][ T9842]  device_initial_probe+0xa1/0xd0
[   45.870332][ T9842]  bus_probe_device+0x12a/0x220
[   45.870340][ T9842]  device_add+0x7ec/0xb90
[   45.870345][ T9842]  usb_new_device+0xa14/0x1720
[   45.870352][ T9842]  hub_event+0x2a1c/0x4f30
[   45.870359][ T9842]  process_scheduled_works+0xc99/0x1900
[   45.870369][ T9842]  worker_thread+0xa53/0xfc0
[   45.870375][ T9842]  kthread+0x38b/0x480
[   45.870382][ T9842]  ret_from_fork+0x514/0xb70
[   45.870389][ T9842]  ret_from_fork_asm+0x1a/0x30
[   45.870396][ T9842]
[   45.870398][ T9842] Freed by task 34:
[   45.870401][ T9842]  kasan_save_track+0x3e/0x80
[   45.870408][ T9842]  kasan_save_free_info+0x46/0x50
[   45.870414][ T9842]  __kasan_slab_free+0x5c/0x80
[   45.870421][ T9842]  kfree+0x1c5/0x650
[   45.870426][ T9842]  v4l2_device_release+0x304/0x470
[   45.870435][ T9842]  device_release+0xc4/0x1f0
[   45.870442][ T9842]  kobject_put+0x228/0x560
[   45.870448][ T9842]  cxusb_medion_unregister_analog+0xc2/0x1c0
[   45.870454][ T9842]  cxusb_disconnect+0x9b/0x1a0
[   45.870462][ T9842]  usb_unbind_interface+0x26e/0x910
[   45.870470][ T9842]  device_release_driver_internal+0x4d9/0x870
[   45.870476][ T9842]  bus_remove_device+0x455/0x570
[   45.870484][ T9842]  device_del+0x527/0x8f0
[   45.870489][ T9842]  usb_disable_device+0x3d4/0x8d0
[   45.870496][ T9842]  usb_disconnect+0x32f/0x990
[   45.870502][ T9842]  hub_event+0x1cc9/0x4f30
[   45.870508][ T9842]  process_scheduled_works+0xc99/0x1900
[   45.870517][ T9842]  worker_thread+0xa53/0xfc0
[   45.870522][ T9842]  kthread+0x38b/0x480
[   45.870529][ T9842]  ret_from_fork+0x514/0xb70
[   45.870535][ T9842]  ret_from_fork_asm+0x1a/0x30
[   45.870542][ T9842]
[   45.870543][ T9842] The buggy address belongs to the object at
ffff88802c55f000
[   45.870543][ T9842]  which belongs to the cache kmalloc-2k of size 2048
[   45.870551][ T9842] The buggy address is located 1640 bytes inside of
[   45.870551][ T9842]  freed 2048-byte region [ffff88802c55f000,
ffff88802c55f800)
[   45.870557][ T9842]
[   45.870559][ T9842] The buggy address belongs to the physical page:
[   45.870566][ T9842] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0xffff88802c559000 pfn:0x2c558
[   45.870573][ T9842] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   45.870579][ T9842] flags:
0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
[   45.870589][ T9842] page_type: f5(slab)
[   45.870598][ T9842] raw: 00fff00000000240 ffff88801b042000
ffffea00006dc810 ffffea00006c7e10
[   45.870604][ T9842] raw: ffff88802c559000 0000000000080006
00000000f5000000 0000000000000000
[   45.870609][ T9842] head: 00fff00000000240 ffff88801b042000
ffffea00006dc810 ffffea00006c7e10
[   45.870615][ T9842] head: ffff88802c559000 0000000000080006
00000000f5000000 0000000000000000
[   45.870620][ T9842] head: 00fff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   45.870625][ T9842] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   45.870629][ T9842] page dumped because: kasan: bad access detected
[   45.870634][ T9842] page_owner tracks the page as allocated
[   45.870637][ T9842] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 1, tgid 1 (swapper/0), ts 5765359105
[   45.870648][ T9842]  post_alloc_hook+0x1f9/0x250
[   45.870654][ T9842]  get_page_from_freelist+0x235a/0x23e0
[   45.870662][ T9842]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   45.870669][ T9842]  allocate_slab+0x7d/0x610
[   45.870675][ T9842]  refill_objects+0x2d6/0x350
[   45.870680][ T9842]  __pcs_replace_empty_main+0x2c9/0x6c0
[   45.870689][ T9842]  __kvmalloc_node_noprof+0x64e/0x830
[   45.870697][ T9842]  v4l2_ctrl_new+0x105d/0x1860
[   45.870706][ T9842]  v4l2_ctrl_new_custom+0x5fc/0x850
[   45.870714][ T9842]  vivid_create_controls+0xe21/0x3bd0
[   45.870722][ T9842]  vivid_probe+0x4213/0x7290
[   45.870728][ T9842]  platform_probe+0xf9/0x190
[   45.870734][ T9842]  really_probe+0x267/0xaf0
[   45.870740][ T9842]  __driver_probe_device+0x1e2/0x350
[   45.870746][ T9842]  driver_probe_device+0x4f/0x240
[   45.870753][ T9842]  __driver_attach+0x33c/0x600
[   45.870759][ T9842] page_owner free stack trace missing
[   45.870761][ T9842]
[   45.870763][ T9842] Memory state around the buggy address:
[   45.870766][ T9842]  ffff88802c55f500: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.870770][ T9842]  ffff88802c55f580: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.870775][ T9842] >ffff88802c55f600: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.870778][ T9842]
          ^
[   45.870781][ T9842]  ffff88802c55f680: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.870785][ T9842]  ffff88802c55f700: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.870788][ T9842]
==================================================================
[   45.879932][ T9842] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   46.021649][ T9842] CPU: 1 UID: 0 PID: 9842 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   46.022673][ T9842] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   46.023774][ T9842] Call Trace:
[   46.024100][ T9842]  <TASK>
[   46.024386][ T9842]  vpanic+0x56d/0xa60
[   46.024776][ T9842]  ? __pfx_vpanic+0x10/0x10
[   46.025219][ T9842]  panic+0xc5/0xd0
[   46.025585][ T9842]  ? __pfx_panic+0x10/0x10
[   46.026019][ T9842]  ? preempt_schedule_thunk+0x16/0x40
[   46.026525][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   46.027069][ T9842]  ? preempt_schedule_thunk+0x16/0x40
[   46.027586][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   46.028133][ T9842]  check_panic_on_warn+0x89/0xb0
[   46.028621][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   46.029167][ T9842]  end_report+0x73/0x170
[   46.029584][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   46.030137][ T9842]  kasan_report+0x128/0x150
[   46.030554][ T9842]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   46.031118][ T9842]  ? cxusb_medion_analog_init+0x53d/0xe90
[   46.031661][ T9842]  cxusb_medion_analog_init+0x53d/0xe90
[   46.032192][ T9842]  ? __pfx_cxusb_medion_analog_init+0x10/0x10
[   46.032770][ T9842]  ? cxusb_ctrl_msg+0x157/0x1e0
[   46.033244][ T9842]  ? __pfx_cxusb_medion_set_mode+0x10/0x10
[   46.033871][ T9842]  ? __mutex_unlock_slowpath+0x731/0x900
[   46.034410][ T9842]  ? __asan_memset+0x22/0x50
[   46.034833][ T9842]  cxusb_medion_get+0x35a/0x510
[   46.035319][ T9842]  cxusb_videoradio_open+0x54/0x130
[   46.035819][ T9842]  v4l2_open+0x1bf/0x3a0
[   46.036235][ T9842]  chrdev_open+0x4cd/0x5e0
[   46.036671][ T9842]  ? __pfx_chrdev_open+0x10/0x10
[   46.037150][ T9842]  ? fsnotify_open_perm_and_set_mode+0x135/0x6d0
[   46.037755][ T9842]  ? __pfx_chrdev_open+0x10/0x10
[   46.038238][ T9842]  do_dentry_open+0x822/0x13a0
[   46.038702][ T9842]  vfs_open+0x3b/0x340
[   46.039101][ T9842]  ? path_openat+0x1552/0x1f30
[   46.039562][ T9842]  path_openat+0x1569/0x1f30
[   46.040012][ T9842]  do_file_open+0x23e/0x4a0
[   46.040450][ T9842]  ? __pfx_do_file_open+0x10/0x10
[   46.040940][ T9842]  ? alloc_fd+0x676/0x6f0
[   46.041358][ T9842]  do_sys_openat2+0x115/0x200
[   46.041816][ T9842]  ? _raw_spin_unlock_irq+0x2e/0x50
[   46.042319][ T9842]  ? __pfx_do_sys_openat2+0x10/0x10
[   46.042794][ T9842]  ? exc_page_fault+0x6a/0xc0
[   46.043263][ T9842]  ? do_user_addr_fault+0xc71/0x1340
[   46.043840][ T9842]  __x64_sys_openat+0x138/0x170
[   46.044316][ T9842]  do_syscall_64+0x155/0x510
[   46.044765][ T9842]  ? trace_irq_disable+0x3b/0x140
[   46.045255][ T9842]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   46.045835][ T9842]  ? clear_bhb_loop+0x30/0x80
[   46.046292][ T9842]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   46.046827][ T9842] RIP: 0033:0x43bf52
[   46.047221][ T9842] Code: 08 0f 85 71 ea ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   46.049024][ T9842] RSP: 002b:00007f2384c85118 EFLAGS: 00000246
ORIG_RAX: 0000000000000101
[   46.049812][ T9842] RAX: ffffffffffffffda RBX: 00007f2384c856c0
RCX: 000000000043bf52
[   46.050546][ T9842] RDX: 0000000000000000 RSI: 00000000004d1b00
RDI: ffffffffffffff9c
[   46.051293][ T9842] RBP: 00007f2384c85140 R08: 0000000000000000
R09: 0000000000000000
[   46.052042][ T9842] R10: 0000000000000000 R11: 0000000000000246
R12: 00007f2384c856c0
[   46.052786][ T9842] R13: 00007ffdc4beb3f0 R14: 00007f2384c85ce4
R15: 00007ffdc4beb4e7
[   46.053608][ T9842]  </TASK>
[   46.054173][ T9842] Kernel Offset: disabled
[   46.054718][ T9842] Rebooting in 86400 seconds..

Regards,

--000000000000cfe8f5065b36f150
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx4jqr90>
X-Attachment-Id: f_mtx4jqr90

LyoKICogMjQwLWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtd3JpdGUtaW4tY3h1c2ItbWVkaW9u
LWFuYWxvZy1pbml0CiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4K
I2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8cHRocmVhZC5o
PgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlv
Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8
dGltZS5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojaW5jbHVkZSA8bGludXgvaW9jdGwuaD4KI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+CgojZGVmaW5lIFVTQl9EVF9ERVZJQ0UJCQkweDAxCiNkZWZp
bmUgVVNCX0RUX0NPTkZJRwkJCTB4MDIKI2RlZmluZSBVU0JfRFRfSU5URVJGQUNFCQkweDA0CiNk
ZWZpbmUgVVNCX0RUX0VORFBPSU5UCQkJMHgwNQojZGVmaW5lIFVTQl9ESVJfSU4JCQkweDgwCiNk
ZWZpbmUgVVNCX1JFUV9HRVRfREVTQ1JJUFRPUgkJMHgwNgojZGVmaW5lIFVTQl9SRVFfU0VUX0NP
TkZJR1VSQVRJT04JMHgwOQojZGVmaW5lIFVTQl9SRVFfU0VUX0lOVEVSRkFDRQkJMHgwYgojZGVm
aW5lIFVTQl9FTkRQT0lOVF9YRkVSX0lTT0MJCTB4MDEKI2RlZmluZSBVU0JfRU5EUE9JTlRfWEZF
Ul9CVUxLCQkweDAyCiNkZWZpbmUgVVNCX1NQRUVEX0hJR0gJCQkzCgpzdHJ1Y3QgdXNiX2N0cmxy
ZXF1ZXN0IHsKCV9fdTggYlJlcXVlc3RUeXBlOwoJX191OCBiUmVxdWVzdDsKCV9fbGUxNiB3VmFs
dWU7CglfX2xlMTYgd0luZGV4OwoJX19sZTE2IHdMZW5ndGg7Cn0gX19hdHRyaWJ1dGVfXygocGFj
a2VkKSk7CgpzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgewoJX191OCBiTGVuZ3RoOwoJ
X191OCBiRGVzY3JpcHRvclR5cGU7CglfX3U4IGJFbmRwb2ludEFkZHJlc3M7CglfX3U4IGJtQXR0
cmlidXRlczsKCV9fbGUxNiB3TWF4UGFja2V0U2l6ZTsKCV9fdTggYkludGVydmFsOwoJX191OCBi
UmVmcmVzaDsKCV9fdTggYlN5bmNoQWRkcmVzczsKfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKTsK
CiNkZWZpbmUgVURDX05BTUVfTEVOR1RIX01BWCAxMjgKc3RydWN0IHVzYl9yYXdfaW5pdCB7Cglf
X3U4IGRyaXZlcl9uYW1lW1VEQ19OQU1FX0xFTkdUSF9NQVhdOwoJX191OCBkZXZpY2VfbmFtZVtV
RENfTkFNRV9MRU5HVEhfTUFYXTsKCV9fdTggc3BlZWQ7Cn07CiNkZWZpbmUgVVNCX1JBV19FVkVO
VF9DT05UUk9MCQkyCiNkZWZpbmUgVVNCX1JBV19FVkVOVF9ESVNDT05ORUNUCTYKc3RydWN0IHVz
Yl9yYXdfZXZlbnQgeyBfX3UzMiB0eXBlOyBfX3UzMiBsZW5ndGg7IF9fdTggZGF0YVswXTsgfTsK
c3RydWN0IHVzYl9yYXdfZXBfaW8geyBfX3UxNiBlcDsgX191MTYgZmxhZ3M7IF9fdTMyIGxlbmd0
aDsgX191OCBkYXRhWzBdOyB9OwoKI2RlZmluZSBVU0JfUkFXX0lPQ1RMX0lOSVQgICAgICAgIF9J
T1coJ1UnLCAwLCBzdHJ1Y3QgdXNiX3Jhd19pbml0KQojZGVmaW5lIFVTQl9SQVdfSU9DVExfUlVO
ICAgICAgICAgX0lPKCdVJywgMSkKI2RlZmluZSBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENIIF9J
T1IoJ1UnLCAyLCBzdHJ1Y3QgdXNiX3Jhd19ldmVudCkKI2RlZmluZSBVU0JfUkFXX0lPQ1RMX0VQ
MF9XUklURSAgIF9JT1coJ1UnLCAzLCBzdHJ1Y3QgdXNiX3Jhd19lcF9pbykKI2RlZmluZSBVU0Jf
UkFXX0lPQ1RMX0VQMF9SRUFEICAgIF9JT1dSKCdVJywgNCwgc3RydWN0IHVzYl9yYXdfZXBfaW8p
CiNkZWZpbmUgVVNCX1JBV19JT0NUTF9FUF9FTkFCTEUgICBfSU9XKCdVJywgNSwgc3RydWN0IHVz
Yl9lbmRwb2ludF9kZXNjcmlwdG9yKQojZGVmaW5lIFVTQl9SQVdfSU9DVExfRVBfV1JJVEUgICAg
X0lPVygnVScsIDcsIHN0cnVjdCB1c2JfcmF3X2VwX2lvKQojZGVmaW5lIFVTQl9SQVdfSU9DVExf
RVBfUkVBRCAgICAgX0lPV1IoJ1UnLCA4LCBzdHJ1Y3QgdXNiX3Jhd19lcF9pbykKI2RlZmluZSBV
U0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSAgIF9JTygnVScsIDkpCiNkZWZpbmUgVVNCX1JBV19JT0NU
TF9FUDBfU1RBTEwgICBfSU8oJ1UnLCAxMikKCiNkZWZpbmUgQ01EX0kyQ19XUklURQkweDA4CiNk
ZWZpbmUgQ01EX0kyQ19SRUFECTB4MDkKI2RlZmluZSBDTURfUE9XRVJfT0ZGCTB4ZGMKI2RlZmlu
ZSBDTURfUE9XRVJfT04JMHhkZQoKI2RlZmluZSBFUDBfTUFYIDI1NgoKc3RhdGljIGludCByYXdf
Z2FkZ2V0X2ZkID0gLTE7CnN0YXRpYyBpbnQgYnVsa19vdXRfZXBfaGFuZGxlID0gLTE7CnN0YXRp
YyBpbnQgYnVsa19pbl9lcF9oYW5kbGUgPSAtMTsKc3RhdGljIHZvbGF0aWxlIGludCBlbmRwb2lu
dHNfcmVhZHk7CnN0YXRpYyB2b2xhdGlsZSBpbnQgc3RvcF9nYWRnZXRfdGhyZWFkczsKc3RhdGlj
IHZvbGF0aWxlIGludCBhbmFsb2dfaW5pdF9zdGFsbGVkOwpzdGF0aWMgY2hhciByYWRpb19ub2Rl
X3BhdGhbNjRdOwoKc3RhdGljIHZvaWQgc2lndXNyMV9pbnRlcnJ1cHRfYmxvY2tpbmdfY2FsbHMo
aW50IHNpZykgeyAodm9pZClzaWc7IH0KCnN0YXRpYyB2b2lkIG1zbGVlcChpbnQgbWlsbGlzZWNv
bmRzKQp7CglzdHJ1Y3QgdGltZXNwZWMgdHMgPSB7IG1pbGxpc2Vjb25kcyAvIDEwMDAsCgkJCSAg
ICAgICAobG9uZykobWlsbGlzZWNvbmRzICUgMTAwMCkgKiAxMDAwMDAwTCB9OwoKCW5hbm9zbGVl
cCgmdHMsIE5VTEwpOwp9CgojZGVmaW5lIExFMTYodikgKCh2KSAmIDB4ZmYpLCAoKCh2KSA+PiA4
KSAmIDB4ZmYpCgpzdGF0aWMgY29uc3QgdWludDhfdCBkZXZpY2VfZGVzY3JpcHRvclsxOF0gPSB7
CgkxOCwgVVNCX0RUX0RFVklDRSwgTEUxNigweDAyMDApLCAwLCAwLCAwLCA2NCwKCUxFMTYoMHgx
NjYwKSwgTEUxNigweDA5MzIpLAoJTEUxNigweDAxMDApLCAwLCAwLCAwLCAxLAp9OwoKI2RlZmlu
ZSBJTlRFUkZBQ0VfREVTQyhhbHQsIG5lcHMpIFwKCTksIFVTQl9EVF9JTlRFUkZBQ0UsIDAsIChh
bHQpLCAobmVwcyksIDB4ZmYsIDB4ZmYsIDB4ZmYsIDAKI2RlZmluZSBFTkRQT0lOVF9CVUxLKGFk
ZHIpIFwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgKGFkZHIpLCBVU0JfRU5EUE9JTlRfWEZFUl9CVUxL
LCBMRTE2KDUxMiksIDAKI2RlZmluZSBFTkRQT0lOVF9JU09DKGFkZHIpIFwKCTcsIFVTQl9EVF9F
TkRQT0lOVCwgKGFkZHIpLCBVU0JfRU5EUE9JTlRfWEZFUl9JU09DLCBMRTE2KDUxMiksIDEKCnN0
YXRpYyBjb25zdCB1aW50OF90IGNvbmZpZ19kZXNjcmlwdG9yW10gPSB7Cgk5LCBVU0JfRFRfQ09O
RklHLCBMRTE2KDkgKyAyMyArIDMwKSwgMSwgMSwgMCwgMHhhMCwgMHhmYSwKCUlOVEVSRkFDRV9E
RVNDKDAsIDIpLCBFTkRQT0lOVF9CVUxLKDB4MDEpLCBFTkRQT0lOVF9CVUxLKDB4ODEpLAoJSU5U
RVJGQUNFX0RFU0MoMSwgMyksIEVORFBPSU5UX0lTT0MoMHg4MiksIEVORFBPSU5UX0JVTEsoMHgw
MSksCgkJRU5EUE9JTlRfQlVMSygweDgxKSwKfTsKCnN0YXRpYyBpbnQgZmluZF91ZGMoY2hhciAq
ZHJpdmVyX25hbWUsIHNpemVfdCBkcml2ZXJfbGVuLAoJCSAgICBjaGFyICpkZXZpY2VfbmFtZSwg
c2l6ZV90IGRldmljZV9sZW4pCnsKCURJUiAqdWRjX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3Mv
dWRjIik7CglzdHJ1Y3QgZGlyZW50ICp1ZGNfZW50OwoKCWlmICghdWRjX2RpcikKCQlyZXR1cm4g
LTE7Cgl3aGlsZSAoKHVkY19lbnQgPSByZWFkZGlyKHVkY19kaXIpKSkgewoJCWNoYXIgKmluc3Rh
bmNlX3N1ZmZpeDsKCgkJaWYgKHVkY19lbnQtPmRfbmFtZVswXSA9PSAnLicpCgkJCWNvbnRpbnVl
OwoJCXNucHJpbnRmKGRldmljZV9uYW1lLCBkZXZpY2VfbGVuLCAiJXMiLCB1ZGNfZW50LT5kX25h
bWUpOwoJCXNucHJpbnRmKGRyaXZlcl9uYW1lLCBkcml2ZXJfbGVuLCAiJXMiLCB1ZGNfZW50LT5k
X25hbWUpOwoJCWluc3RhbmNlX3N1ZmZpeCA9IHN0cnJjaHIoZHJpdmVyX25hbWUsICcuJyk7CgkJ
aWYgKGluc3RhbmNlX3N1ZmZpeCkKCQkJKmluc3RhbmNlX3N1ZmZpeCA9IDA7CgkJY2xvc2VkaXIo
dWRjX2Rpcik7CgkJcmV0dXJuIDA7Cgl9CgljbG9zZWRpcih1ZGNfZGlyKTsKCXJldHVybiAtMTsK
fQoKc3RhdGljIHZvaWQgZW5hYmxlX2J1bGtfZW5kcG9pbnRzKHZvaWQpCnsKCXN0cnVjdCB1c2Jf
ZW5kcG9pbnRfZGVzY3JpcHRvciBkZXNjOwoKCW1lbXNldCgmZGVzYywgMCwgc2l6ZW9mKGRlc2Mp
KTsKCWRlc2MuYkxlbmd0aCA9IDc7CglkZXNjLmJEZXNjcmlwdG9yVHlwZSA9IFVTQl9EVF9FTkRQ
T0lOVDsKCWRlc2MuYm1BdHRyaWJ1dGVzID0gVVNCX0VORFBPSU5UX1hGRVJfQlVMSzsKCWRlc2Mu
d01heFBhY2tldFNpemUgPSA1MTI7CgoJZGVzYy5iRW5kcG9pbnRBZGRyZXNzID0gMHgwMTsKCWJ1
bGtfb3V0X2VwX2hhbmRsZSA9IGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVBf
RU5BQkxFLCAmZGVzYyk7CglkZXNjLmJFbmRwb2ludEFkZHJlc3MgPSAweDgxOwoJYnVsa19pbl9l
cF9oYW5kbGUgPSBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX0VOQUJMRSwg
JmRlc2MpOwoKCWlmIChidWxrX291dF9lcF9oYW5kbGUgPj0gMCAmJiBidWxrX2luX2VwX2hhbmRs
ZSA+PSAwKQoJCWVuZHBvaW50c19yZWFkeSA9IDE7Cn0KCnN0YXRpYyB2b2lkIGhhbmRsZV9jb250
cm9sX3JlcXVlc3QoY29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkKewoJY29uc3Qg
dWludDhfdCAqcmVwbHkgPSBOVUxMOwoJaW50IHJlcGx5X2xlbiA9IC0xOwoJdWludDE2X3QgcmVx
dWVzdGVkX2xlbiA9IGN0cmwtPndMZW5ndGg7Cgl1aW50OF90IGJ1ZltzaXplb2Yoc3RydWN0IHVz
Yl9yYXdfZXBfaW8pICsgRVAwX01BWF07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqaW8gPSAodm9p
ZCAqKWJ1ZjsKCglzd2l0Y2ggKGN0cmwtPmJSZXF1ZXN0KSB7CgljYXNlIFVTQl9SRVFfR0VUX0RF
U0NSSVBUT1I6CgkJaWYgKChjdHJsLT53VmFsdWUgPj4gOCkgPT0gVVNCX0RUX0RFVklDRSkgewoJ
CQlyZXBseSA9IGRldmljZV9kZXNjcmlwdG9yOwoJCQlyZXBseV9sZW4gPSBzaXplb2YoZGV2aWNl
X2Rlc2NyaXB0b3IpOwoJCX0gZWxzZSBpZiAoKGN0cmwtPndWYWx1ZSA+PiA4KSA9PSBVU0JfRFRf
Q09ORklHKSB7CgkJCXJlcGx5ID0gY29uZmlnX2Rlc2NyaXB0b3I7CgkJCXJlcGx5X2xlbiA9IHNp
emVvZihjb25maWdfZGVzY3JpcHRvcik7CgkJfQoJCWJyZWFrOwoJY2FzZSBVU0JfUkVRX1NFVF9D
T05GSUdVUkFUSU9OOgoJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfQ09ORklH
VVJFLCAwKTsKCQllbmFibGVfYnVsa19lbmRwb2ludHMoKTsKCQlyZXBseV9sZW4gPSAwOwoJCWJy
ZWFrOwoJY2FzZSBVU0JfUkVRX1NFVF9JTlRFUkZBQ0U6CgkJcmVwbHlfbGVuID0gMDsKCQlicmVh
azsKCX0KCglpZiAocmVwbHlfbGVuIDwgMCkgewoJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9S
QVdfSU9DVExfRVAwX1NUQUxMLCAwKTsKCQlyZXR1cm47Cgl9CgoJaW8tPmVwID0gMDsKCWlvLT5m
bGFncyA9IDA7CglpZiAoKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYmIHJlcXVl
c3RlZF9sZW4pIHsKCQlpZiAocmVwbHlfbGVuID4gcmVxdWVzdGVkX2xlbikKCQkJcmVwbHlfbGVu
ID0gcmVxdWVzdGVkX2xlbjsKCQlpby0+bGVuZ3RoID0gcmVwbHlfbGVuOwoJCW1lbWNweShpby0+
ZGF0YSwgcmVwbHksIHJlcGx5X2xlbik7CgkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19J
T0NUTF9FUDBfV1JJVEUsIGlvKTsKCX0gZWxzZSB7CgkJaW8tPmxlbmd0aCA9IHJlcXVlc3RlZF9s
ZW4gPiBFUDBfTUFYID8gRVAwX01BWCA6IHJlcXVlc3RlZF9sZW47CgkJaW9jdGwocmF3X2dhZGdl
dF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfUkVBRCwgaW8pOwoJfQp9CgpzdGF0aWMgdm9pZCAqZXAw
X2NvbnRyb2xfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJdWludDhfdCBidWZbc2l6ZW9mKHN0cnVj
dCB1c2JfcmF3X2V2ZW50KSArIEVQMF9NQVhdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50
ID0gKHZvaWQgKilidWY7CgoJd2hpbGUgKCFzdG9wX2dhZGdldF90aHJlYWRzKSB7CgkJZXZlbnQt
PnR5cGUgPSAwOwoJCWV2ZW50LT5sZW5ndGggPSBFUDBfTUFYOwoJCWlmIChpb2N0bChyYXdfZ2Fk
Z2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENILCBldmVudCkgPCAwKSB7CgkJCWlmIChl
cnJubyA9PSBFSU5UUiAmJiAhc3RvcF9nYWRnZXRfdGhyZWFkcykKCQkJCWNvbnRpbnVlOwoJCQly
ZXR1cm4gTlVMTDsKCQl9CgkJaWYgKGV2ZW50LT50eXBlID09IFVTQl9SQVdfRVZFTlRfQ09OVFJP
TCkKCQkJaGFuZGxlX2NvbnRyb2xfcmVxdWVzdCgodm9pZCAqKWV2ZW50LT5kYXRhKTsKCQllbHNl
IGlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0RJU0NPTk5FQ1QpCgkJCXJldHVybiBO
VUxMOwoJfQoJcmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyB1aW50OF90IGN4MjU4NDBfcmVnaXN0ZXJf
dmFsdWUodW5zaWduZWQgaW50IHJlZykKewoJc3dpdGNoIChyZWcpIHsKCWNhc2UgMHgxMDE6IHJl
dHVybiAweDg0OwoJY2FzZSAweDEwMDogcmV0dXJuIDB4MDA7CgljYXNlIDB4OGQ0OiByZXR1cm4g
MTAwOwoJZGVmYXVsdDogICAgcmV0dXJuIDB4MDA7Cgl9Cn0KCnN0YXRpYyB2b2lkICpjeHVzYl9j
b21tYW5kX3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCXVpbnQ4X3QgY29tbWFuZF9idWZbc2l6ZW9m
KHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIDI1Nl07Cgl1aW50OF90IHJlcGx5X2J1ZltzaXplb2Yo
c3RydWN0IHVzYl9yYXdfZXBfaW8pICsgMjU2XTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICpjb21t
YW5kX2lvID0gKHZvaWQgKiljb21tYW5kX2J1ZjsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICpyZXBs
eV9pbyA9ICh2b2lkICopcmVwbHlfYnVmOwoKCXdoaWxlICghZW5kcG9pbnRzX3JlYWR5ICYmICFz
dG9wX2dhZGdldF90aHJlYWRzKQoJCW1zbGVlcCgyKTsKCgl3aGlsZSAoIXN0b3BfZ2FkZ2V0X3Ro
cmVhZHMpIHsKCQlpbnQgbmJ5dGVzLCByZXBseV9sZW47CgkJdWludDhfdCAqY21kID0gY29tbWFu
ZF9pby0+ZGF0YTsKCgkJY29tbWFuZF9pby0+ZXAgPSBidWxrX291dF9lcF9oYW5kbGU7CgkJY29t
bWFuZF9pby0+ZmxhZ3MgPSAwOwoJCWNvbW1hbmRfaW8tPmxlbmd0aCA9IDI1NjsKCQluYnl0ZXMg
PSBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX1JFQUQsIGNvbW1hbmRfaW8p
OwoJCWlmIChuYnl0ZXMgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5UUiAmJiAhc3RvcF9nYWRn
ZXRfdGhyZWFkcykKCQkJCWNvbnRpbnVlOwoJCQlpZiAoc3RvcF9nYWRnZXRfdGhyZWFkcykKCQkJ
CXJldHVybiBOVUxMOwoJCQltc2xlZXAoNSk7CgkJCWNvbnRpbnVlOwoJCX0KCQlpZiAobmJ5dGVz
ID09IDApCgkJCWNvbnRpbnVlOwoKCQlpZiAoY21kWzBdID09IENNRF9JMkNfV1JJVEUgJiYgbmJ5
dGVzID49IDcgJiYgY21kWzFdID09IDB4NjEgJiYKCQkgICAgY21kWzJdID09IDQgJiYgY21kWzNd
ID09IDB4OWMgJiYgIWFuYWxvZ19pbml0X3N0YWxsZWQpIHsKCQkJYW5hbG9nX2luaXRfc3RhbGxl
ZCA9IDE7CgkJCW1zbGVlcCgyNTAwKTsKCQl9CgoJCW1lbXNldChyZXBseV9pby0+ZGF0YSwgMCwg
c2l6ZW9mKHJlcGx5X2J1ZikgLSBzaXplb2YoKnJlcGx5X2lvKSk7CgkJc3dpdGNoIChjbWRbMF0p
IHsKCQljYXNlIENNRF9QT1dFUl9PTjoKCQljYXNlIENNRF9QT1dFUl9PRkY6CgkJCXJlcGx5X2xl
biA9IDA7CgkJCWJyZWFrOwoJCWNhc2UgQ01EX0kyQ19SRUFEOiB7CgkJCXVuc2lnbmVkIGludCB3
cml0ZV9sZW4gPSBjbWRbMV0sIHJlYWRfbGVuID0gY21kWzJdOwoJCQl1bnNpZ25lZCBpbnQgaTJj
X2FkZHIgPSBjbWRbM10sIGk7CgoJCQlyZXBseV9sZW4gPSAxICsgcmVhZF9sZW47CgkJCXJlcGx5
X2lvLT5kYXRhWzBdID0gMHgwODsKCQkJaWYgKGkyY19hZGRyID09IDB4NDQgJiYgd3JpdGVfbGVu
ID49IDIpIHsKCQkJCXVuc2lnbmVkIGludCByZWcgPQoJCQkJCSgodW5zaWduZWQgaW50KWNtZFs0
XSA8PCA4KSB8IGNtZFs1XTsKCgkJCQlmb3IgKGkgPSAwOyBpIDwgcmVhZF9sZW47IGkrKykKCQkJ
CQlyZXBseV9pby0+ZGF0YVsxICsgaV0gPQoJCQkJCQljeDI1ODQwX3JlZ2lzdGVyX3ZhbHVlKHJl
ZyArIGkpOwoJCQl9CgkJCWJyZWFrOwoJCX0KCQlkZWZhdWx0OgoKCQkJcmVwbHlfbGVuID0gMTsK
CQkJcmVwbHlfaW8tPmRhdGFbMF0gPSAweDA4OwoJCQlicmVhazsKCQl9CgoJCWlmIChyZXBseV9s
ZW4gPiAwKSB7CgkJCXJlcGx5X2lvLT5lcCA9IGJ1bGtfaW5fZXBfaGFuZGxlOwoJCQlyZXBseV9p
by0+ZmxhZ3MgPSAwOwoJCQlyZXBseV9pby0+bGVuZ3RoID0gcmVwbHlfbGVuOwoJCQlpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX1dSSVRFLCByZXBseV9pbyk7CgkJfQoJfQoJ
cmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyBpbnQgZmluZF9jeHVzYl9yYWRpb19ub2RlKGNoYXIgKm91
dCwgc2l6ZV90IG91dF9sZW4pCnsKCURJUiAqdjRsX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3Mv
dmlkZW80bGludXgiKTsKCXN0cnVjdCBkaXJlbnQgKnY0bF9lbnQ7CglpbnQgZm91bmQgPSAwOwoK
CWlmICghdjRsX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKHY0bF9lbnQgPSByZWFkZGlyKHY0
bF9kaXIpKSkgewoJCWNoYXIgbGlua19wYXRoWzUxMl0sIGxpbmtfdGFyZ2V0WzEwMjRdOwoJCXNz
aXplX3QgbGlua19sZW47CgoJCWlmIChzdHJuY21wKHY0bF9lbnQtPmRfbmFtZSwgInJhZGlvIiwg
NSkgIT0gMCkKCQkJY29udGludWU7CgkJc25wcmludGYobGlua19wYXRoLCBzaXplb2YobGlua19w
YXRoKSwKCQkJICIvc3lzL2NsYXNzL3ZpZGVvNGxpbnV4LyVzIiwgdjRsX2VudC0+ZF9uYW1lKTsK
CQlsaW5rX2xlbiA9IHJlYWRsaW5rKGxpbmtfcGF0aCwgbGlua190YXJnZXQsCgkJCQkgICAgc2l6
ZW9mKGxpbmtfdGFyZ2V0KSAtIDEpOwoJCWlmIChsaW5rX2xlbiA8PSAwKQoJCQljb250aW51ZTsK
CQlsaW5rX3RhcmdldFtsaW5rX2xlbl0gPSAwOwoJCWlmICghc3Ryc3RyKGxpbmtfdGFyZ2V0LCAi
L3VzYiIpKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihvdXQsIG91dF9sZW4sICIvZGV2LyVzIiwg
djRsX2VudC0+ZF9uYW1lKTsKCQlmb3VuZCA9IDE7CgkJYnJlYWs7Cgl9CgljbG9zZWRpcih2NGxf
ZGlyKTsKCXJldHVybiBmb3VuZCA/IDAgOiAtMTsKfQoKc3RhdGljIHZvaWQgKnJhZGlvX29wZW5f
dGhyZWFkKHZvaWQgKnVudXNlZCkKewoJaW50IG9wZW5fYXR0ZW1wdCwgcmFkaW9fZmQgPSAtMTsK
Cglmb3IgKG9wZW5fYXR0ZW1wdCA9IDA7IG9wZW5fYXR0ZW1wdCA8IDUwMDAwOyBvcGVuX2F0dGVt
cHQrKykgewoJCXJhZGlvX2ZkID0gb3BlbihyYWRpb19ub2RlX3BhdGgsIE9fUkRPTkxZKTsKCQlp
ZiAocmFkaW9fZmQgPj0gMCkKCQkJYnJlYWs7CgkJaWYgKGVycm5vICE9IEVBR0FJTiAmJiBlcnJu
byAhPSBFTk9FTlQpCgkJCWJyZWFrOwoJCXVzbGVlcCgyMDApOwoJfQoKCW1zbGVlcCg0MDAwKTsK
CWlmIChyYWRpb19mZCA+PSAwKQoJCWNsb3NlKHJhZGlvX2ZkKTsKCXJldHVybiBOVUxMOwp9Cgpz
dGF0aWMgdm9pZCB1bmJpbmRfdml2aWRfdG9fZnJlZV92NGwyX21pbm9ycyh2b2lkKQp7Cgljb25z
dCBjaGFyICp2aXZpZF9kcml2ZXJfZGlyID0gIi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvdml2
aWQiOwoJY2hhciB2aXZpZF9pbnN0YW5jZXNbMzJdWzY0XTsKCWNoYXIgdW5iaW5kX3BhdGhbMjU2
XTsKCURJUiAqZHJpdmVyX2RpciA9IG9wZW5kaXIodml2aWRfZHJpdmVyX2Rpcik7CglzdHJ1Y3Qg
ZGlyZW50ICpkcml2ZXJfZW50OwoJaW50IHVuYmluZF9mZCwgaW5zdGFuY2VfY291bnQgPSAwLCBp
OwoKCWlmICghZHJpdmVyX2RpcikKCQlyZXR1cm47Cgl3aGlsZSAoKGRyaXZlcl9lbnQgPSByZWFk
ZGlyKGRyaXZlcl9kaXIpKSAmJiBpbnN0YW5jZV9jb3VudCA8IDMyKSB7CgkJaWYgKHN0cm5jbXAo
ZHJpdmVyX2VudC0+ZF9uYW1lLCAidml2aWQuIiwgNikgIT0gMCkKCQkJY29udGludWU7CgkJc25w
cmludGYodml2aWRfaW5zdGFuY2VzW2luc3RhbmNlX2NvdW50XSwKCQkJIHNpemVvZih2aXZpZF9p
bnN0YW5jZXNbMF0pLCAiJXMiLCBkcml2ZXJfZW50LT5kX25hbWUpOwoJCWluc3RhbmNlX2NvdW50
Kys7Cgl9CgljbG9zZWRpcihkcml2ZXJfZGlyKTsKCWlmICghaW5zdGFuY2VfY291bnQpCgkJcmV0
dXJuOwoKCXNucHJpbnRmKHVuYmluZF9wYXRoLCBzaXplb2YodW5iaW5kX3BhdGgpLCAiJXMvdW5i
aW5kIiwKCQkgdml2aWRfZHJpdmVyX2Rpcik7Cgl1bmJpbmRfZmQgPSBvcGVuKHVuYmluZF9wYXRo
LCBPX1dST05MWSk7CglpZiAodW5iaW5kX2ZkIDwgMCkKCQlyZXR1cm47Cglmb3IgKGkgPSAwOyBp
IDwgaW5zdGFuY2VfY291bnQ7IGkrKykKCQl3cml0ZSh1bmJpbmRfZmQsIHZpdmlkX2luc3RhbmNl
c1tpXSwKCQkgICAgICBzdHJsZW4odml2aWRfaW5zdGFuY2VzW2ldKSk7CgljbG9zZSh1bmJpbmRf
ZmQpOwoJbXNsZWVwKDUwMCk7Cn0KCnN0YXRpYyB2b2lkIHJ1bl9vbmVfcmFjZV9yb3VuZCh2b2lk
KQp7CgljaGFyIHVkY19kcml2ZXJfbmFtZVtVRENfTkFNRV9MRU5HVEhfTUFYXTsKCWNoYXIgdWRj
X2RldmljZV9uYW1lW1VEQ19OQU1FX0xFTkdUSF9NQVhdOwoJc3RydWN0IHVzYl9yYXdfaW5pdCBp
bml0OwoJcHRocmVhZF90IGVwMF90aHJlYWQsIGNvbW1hbmRfdGhyZWFkLCBvcGVuX3RocmVhZDsK
CWludCBpOwoKCWVuZHBvaW50c19yZWFkeSA9IHN0b3BfZ2FkZ2V0X3RocmVhZHMgPSBhbmFsb2df
aW5pdF9zdGFsbGVkID0gMDsKCXJhZGlvX25vZGVfcGF0aFswXSA9IDA7CgoJaWYgKGZpbmRfdWRj
KHVkY19kcml2ZXJfbmFtZSwgc2l6ZW9mKHVkY19kcml2ZXJfbmFtZSksCgkJICAgICB1ZGNfZGV2
aWNlX25hbWUsIHNpemVvZih1ZGNfZGV2aWNlX25hbWUpKSA8IDApCgkJcmV0dXJuOwoKCXJhd19n
YWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwoJaWYgKHJhd19nYWRn
ZXRfZmQgPCAwKQoJCXJldHVybjsKCW1lbXNldCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQpKTsKCXN0
cm5jcHkoKGNoYXIgKilpbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJc2l6ZW9m
KGluaXQuZHJpdmVyX25hbWUpIC0gMSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kZXZpY2VfbmFt
ZSwgdWRjX2RldmljZV9uYW1lLAoJCXNpemVvZihpbml0LmRldmljZV9uYW1lKSAtIDEpOwoJaW5p
dC5zcGVlZCA9IFVTQl9TUEVFRF9ISUdIOwoJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9S
QVdfSU9DVExfSU5JVCwgJmluaXQpIDwgMCB8fAoJICAgIGlvY3RsKHJhd19nYWRnZXRfZmQsIFVT
Ql9SQVdfSU9DVExfUlVOLCAwKSA8IDApIHsKCQljbG9zZShyYXdfZ2FkZ2V0X2ZkKTsKCQlyYXdf
Z2FkZ2V0X2ZkID0gLTE7CgkJcmV0dXJuOwoJfQoKCXB0aHJlYWRfY3JlYXRlKCZlcDBfdGhyZWFk
LCBOVUxMLCBlcDBfY29udHJvbF90aHJlYWQsIE5VTEwpOwoJcHRocmVhZF9jcmVhdGUoJmNvbW1h
bmRfdGhyZWFkLCBOVUxMLCBjeHVzYl9jb21tYW5kX3RocmVhZCwgTlVMTCk7CgoJZm9yIChpID0g
MDsgaSA8IDEwMDA7IGkrKykgewoJCWlmIChmaW5kX2N4dXNiX3JhZGlvX25vZGUocmFkaW9fbm9k
ZV9wYXRoLAoJCQkJCSAgc2l6ZW9mKHJhZGlvX25vZGVfcGF0aCkpID09IDApCgkJCWJyZWFrOwoJ
CW1zbGVlcCgyMCk7Cgl9CgoJaWYgKHJhZGlvX25vZGVfcGF0aFswXSkgewoJCXB0aHJlYWRfY3Jl
YXRlKCZvcGVuX3RocmVhZCwgTlVMTCwgcmFkaW9fb3Blbl90aHJlYWQsIE5VTEwpOwoKCQlmb3Ig
KGkgPSAwOyBpIDwgNDAwMCAmJiAhYW5hbG9nX2luaXRfc3RhbGxlZDsgaSsrKQoJCQltc2xlZXAo
NSk7Cgl9CgoJc3RvcF9nYWRnZXRfdGhyZWFkcyA9IDE7CglwdGhyZWFkX2tpbGwoZXAwX3RocmVh
ZCwgU0lHVVNSMSk7CglwdGhyZWFkX2pvaW4oZXAwX3RocmVhZCwgTlVMTCk7CgljbG9zZShyYXdf
Z2FkZ2V0X2ZkKTsKCXJhd19nYWRnZXRfZmQgPSAtMTsKCXB0aHJlYWRfa2lsbChjb21tYW5kX3Ro
cmVhZCwgU0lHVVNSMSk7CglpZiAocmFkaW9fbm9kZV9wYXRoWzBdKQoJCXB0aHJlYWRfam9pbihv
cGVuX3RocmVhZCwgTlVMTCk7CglwdGhyZWFkX2pvaW4oY29tbWFuZF90aHJlYWQsIE5VTEwpOwoK
CWZvciAoaSA9IDA7IGkgPCAxMDAgJiYgcmFkaW9fbm9kZV9wYXRoWzBdICYmCgkgICAgIGFjY2Vz
cyhyYWRpb19ub2RlX3BhdGgsIEZfT0spID09IDA7IGkrKykKCQltc2xlZXAoMjApOwoJbXNsZWVw
KDIwMCk7Cn0KCmludCBtYWluKHZvaWQpCnsKCXN0cnVjdCBzaWdhY3Rpb24gc2E7CglpbnQgcm91
bmQ7CgoJbWVtc2V0KCZzYSwgMCwgc2l6ZW9mKHNhKSk7CglzYS5zYV9oYW5kbGVyID0gc2lndXNy
MV9pbnRlcnJ1cHRfYmxvY2tpbmdfY2FsbHM7CglzaWdhY3Rpb24oU0lHVVNSMSwgJnNhLCBOVUxM
KTsKCgl1bmJpbmRfdml2aWRfdG9fZnJlZV92NGwyX21pbm9ycygpOwoKCWZvciAocm91bmQgPSAw
OyByb3VuZCA8IDM7IHJvdW5kKyspCgkJcnVuX29uZV9yYWNlX3JvdW5kKCk7CgoJcmV0dXJuIDA7
Cn0K
--000000000000cfe8f5065b36f150--
