Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222448E0CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142219; cv=pass; b=XPhUaHylMWwH15lHUR0A6XqaRRjh7BkuAWiS++XHpyS+mksw9EmUjeU13WIdHFwBRricvl+WlUhSKFXboRBcfTn2Aq7DKkhKkq4TdbNW1jCYZemm39jVluHXSzHfMmBX7PCn0fpiYh2HMVtqUgOxk0qaVF4jpwqzNCBp3tr9SI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142219; c=relaxed/simple;
	bh=8rBB5r0/Y9eYtzwCniPcyN9JR4vKHFKPcB89VdVkVZI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lyDCDNuFlFeI/1uGqP7WXQEkFXwJajLDLq/urRwwjGpJkrT1iz91bbig6dJLd38dOrjDUeRN0j3eGsRP8m8WyTEU6KQobyMErRG8KanvguFfwhLRZ/1i5+9MwBLSzNdwrFbl/iSSrJQbYsYzVHReEliG4TphOZV2FX+iMfYiUJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=dub/NecV; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="dub/NecV"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e2254dso14513b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789142217; cv=none;
        d=google.com; s=arc-20260327;
        b=if4+uoy4CLZ9hVVO6dz9o0A7BC4nALM7dOjaC02SPCQY4i17y6AyO4fbDmT687Tqic
         LWCw/OczxqHSoXk6GGvAVyL4KPmOy44OxhGdhQLemjDPit6PwBc294uIsjiTzmu88yGN
         vAcCp70wYajd4AUn/tpJGGuTYJShLsqNBe3KacGbN2KEaRzX9U4E/t3m1psUyJewojUa
         Kv5Nog0nSitY9WSCLNm3jJKN0pmIm4Rlzt7vMls0C1qBjJexxaHmBYHEiF6xjZ/2TiVz
         QIrHTeOim0F/cONn1MS+GIGHZH4Gxcpzw9uesTAx/dSBiHIZT2Nt4VGq+eG0ue9j5OZt
         fhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IpcNhNtabZCNm75SR5vm3q8zu///0roor4Qe3Q/0nE4=;
        fh=tqrffWYFh7TFH1j+V4hjHZidbmFYvhvNXrBwqkcHTEk=;
        b=i6qQdaBhbJq2vES4uEXN5LLBkDYTBLmq1zHj3+Yul+mrsRkI8up+rAEYZZLk7uoI9o
         8U6vi4I00bvB9HU9g0Uwx9eWKJ9iCGqRtD0CALZ4E4uw3Lw+YE4WrYhPlbwTf5Kt50WL
         1W3x2LHiak+o/ag09DNJh3P+CZRi4ZMqClydvp79BFwNmuIAkHd0eChds8KltdbGimfa
         RCjyjfS5FvrgPSly2918wBx6hALk9H/zru52/R74UI0iuSK9t5NNCCCgV+S6GM8yUO1x
         mqMWOzd5eMzMxl2Wqp6ARUyxoWMARZaZhAN061XzNkVKAEH3S7Uv//r8EJtyWSTrwIyr
         idiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789142217; x=1789747017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IpcNhNtabZCNm75SR5vm3q8zu///0roor4Qe3Q/0nE4=;
        b=dub/NecVzSUZdnE5hlfXb98S9IZDE+icneMsjr0N3yxObjPmEf8zN9BEgDccBlR+Ec
         uy9VKW/GpdySM0OYeRTacioCY18gsTHJcsBrq8BGfxcj8v6KP4Ys6G+Ql/ZkeUZ5mDur
         fyMW0hYPWn2hTu+vgGm+zuXAHRI5UBDFRVbH+yh+14l2SCAQvJpz18HVXaheqJNkB/FL
         A73cB4XYCeAs7CNWpLdVM1ueVlZBHIKpfYsAIW6f0E18TVSHmgapEwoobb2vQhrqyZ6s
         dM8wrR2BT9v66yf4hXSvgvfLfMMc8X1yAMQ/hySJZrG2wf/UibFJPS7fALljXgN0pZ3v
         vmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142217; x=1789747017;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IpcNhNtabZCNm75SR5vm3q8zu///0roor4Qe3Q/0nE4=;
        b=CMFXqEJ4k00iTW46/MkO+hjW/HKzj55D/M+rIwN0zmG2ciy/q+XKnICQT31aYBL0Hw
         RZ4wgPB7so1XpItaTaaDQvAgv/UJ/51oDLecaYL2Jvlj01p882aHjRzb/kc7r1bZuaz/
         TVF3UGqeL1P2+WKizQkept6JOptkyvNa8/t6fKT5pOgjXf2oQ98a/0GmisEvHXNqCPbr
         8DJAIfi2/sruQW6iHMLxoOMnqLyLnqjJWoat+elTC79Dg+YaWmKhUF6C7oZsu+n+4iMK
         VmjzjxdNQ9KxJDWnSlZWehWvAkoOL0zP6gBmV5H3vVw6ACXgmrHXDzXbnT+x8uhFslmj
         2HdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX4NXCCs424M8SJZ0GNA6zEp1phO8K28HpOhizywXO7+9kDg9jgNuOKLvefiGL6uNm2K6Qkrct4ARum70=@vger.kernel.org
X-Gm-Message-State: AFuF++nEL2KFFDTaM7Tp6vv0XuBFUbI02lVlbwRd/w6ncR8D1CNH0VzJ
	YYErOJRBcjomzMAU2w5fbj6wEp9Z6I/J6y99IeCTeeOssgUAkbZDiToeQ+vJQ0ZPpvJfQWJ6gme
	mdL/czdlSX5AiihoHC1eupTg/2ysqKdEptH6lr2rB
X-Gm-Gg: AYBFou2vJbFlMyg6F3fID3gmJlMkJAGjZoT6OLRUiZpmPqw27onkGNwsk/OHoqWShdL
	hWaVd68xqvZoeeDPAbFtgngY2GKOZxL5Bel+/HDkm2bKGam9xAyGp50+qUwdeGc9MNYMIC1XV0v
	g18xRXJWH0o35JhrRWViY2ZcmmaKXyXAHsMIxD/WUOGu3neB6muPVqh50ywK9e3C/JH5B4jHSFV
	H7nlHmvbsPMqinFNdndCHE7clohoQkI/lZzorNZmBYZkzIw6ep5Af7Nqy9oJxVIbv0nPizHR3rL
	zjbfYMcdge3w+VL3EgJa2SY0SkMHRCDUUwH5a/L2anMT81vNgP1oH5xA+RDwVL2YqmQ/eB7kVVz
	bWLq5Wyrlj3rva+0Tp80m9ITHFP5X4b6UUdDELHLn4EME/e/Xkb0MyLlD49cNb9/4rwAU4hCdjZ
	o=
X-Received: by 2002:a05:6a00:1786:b0:84e:354:422b with SMTP id
 d2e1a72fcca58-86b6f55356fmr3602453b3a.2.1789142215600; Fri, 11 Sep 2026
 08:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:56:44 -0700
X-Gm-Features: AcwNN1Un2IUVSezZ6JkasWzC4q49iD2hqVPQc0-AVdT0g92XL3kw5Qz0qc9RreI
Message-ID: <CA+0ovCh_Nj9mtxnK5ab3LNfgFi+X0BJVh8gPPCrLm==F4WwAUQ@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in go7007_usb_read_interrupt
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000037cf9a065b372294"

--00000000000037cf9a065b372294
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   52.641036][ T9513] BUG: KASAN: slab-use-after-free in
go7007_usb_read_interrupt+0x5a/0xc0
[   52.641146][ T9513] Read of size 8 at addr ffff88810b989918 by task
repro/9513
[   52.641174][ T9513]
[   52.641217][ T9513] CPU: 1 UID: 0 PID: 9513 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   52.641257][ T9513] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   52.641290][ T9513] Call Trace:
[   52.641312][ T9513]  <TASK>
[   52.641334][ T9513]  dump_stack_lvl+0xe8/0x150
[   52.641374][ T9513]  print_address_description+0x55/0x1e0
[   52.641409][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.641455][ T9513]  print_report+0x58/0x70
[   52.641484][ T9513]  kasan_report+0x117/0x150
[   52.641531][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.641582][ T9513]  go7007_usb_read_interrupt+0x5a/0xc0
[   52.641651][ T9513]  go7007_read_interrupt+0xfd/0x500
[   52.641690][ T9513]  ? usb_control_msg+0x2c1/0x3e0
[   52.641742][ T9513]  ? __pfx_go7007_read_interrupt+0x10/0x10
[   52.641781][ T9513]  ? usb_control_msg+0x2c1/0x3e0
[   52.641815][ T9513]  ? __pfx_autoremove_wake_function+0x10/0x10
[   52.641867][ T9513]  ? go7007_usb_ezusb_write_interrupt+0x265/0x3c0
[   52.641915][ T9513]  ? go7007_usb_ezusb_write_interrupt+0x280/0x3c0
[   52.641965][ T9513]  go7007_read_addr+0xb1/0x140
[   52.642006][ T9513]  go7007_i2c_xfer+0x6e7/0xe90
[   52.642047][ T9513]  ? check_path+0x21/0x40
[   52.642095][ T9513]  ? __pfx_go7007_i2c_xfer+0x10/0x10
[   52.642136][ T9513]  ? lockdep_unlock+0x5c/0xd0
[   52.642170][ T9513]  ? __lock_acquire+0x25db/0x2db0
[   52.642209][ T9513]  ? go7007_smbus_xfer+0xa7/0xf0
[   52.642251][ T9513]  __i2c_smbus_xfer+0x626/0x1f70
[   52.642297][ T9513]  ? __pfx_go7007_smbus_xfer+0x10/0x10
[   52.642344][ T9513]  ? __pfx___i2c_smbus_xfer+0x10/0x10
[   52.642397][ T9513]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   52.642441][ T9513]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   52.642481][ T9513]  ? rt_mutex_lock_nested+0x15c/0x1d0
[   52.642518][ T9513]  i2c_smbus_xfer+0x1f5/0x310
[   52.642564][ T9513]  i2cdev_ioctl_smbus+0x434/0x730
[   52.642616][ T9513]  ? __pfx_i2cdev_ioctl_smbus+0x10/0x10
[   52.642663][ T9513]  i2cdev_ioctl+0x615/0x880
[   52.642697][ T9513]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   52.642731][ T9513]  ? __fget_files+0x2a/0x420
[   52.642761][ T9513]  ? __fget_files+0x3a0/0x420
[   52.642795][ T9513]  ? bpf_lsm_file_ioctl+0x9/0x20
[   52.642829][ T9513]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   52.642861][ T9513]  __se_sys_ioctl+0xfc/0x170
[   52.642902][ T9513]  do_syscall_64+0x155/0x510
[   52.642947][ T9513]  ? trace_irq_disable+0x3b/0x140
[   52.642987][ T9513]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.643018][ T9513]  ? clear_bhb_loop+0x30/0x80
[   52.643052][ T9513]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.643084][ T9513] RIP: 0033:0x426e3d
[   52.643127][ T9513] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   52.643162][ T9513] RSP: 002b:00007f48b7fff130 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   52.643207][ T9513] RAX: ffffffffffffffda RBX: 00007f48b7fff6c0
RCX: 0000000000426e3d
[   52.643232][ T9513] RDX: 00007f48b7fff1a0 RSI: 0000000000000720
RDI: 0000000000000004
[   52.643253][ T9513] RBP: 00007f48b7fff180 R08: 0000000000000000
R09: 0000000000000001
[   52.643273][ T9513] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f48b7fff6c0
[   52.643294][ T9513] R13: 00007ffd4000ef40 R14: 00007f48b7fffce4
R15: 00007ffd4000f037
[   52.643328][ T9513]  </TASK>
[   52.643340][ T9513]
[   52.643354][ T9513] Allocated by task 25:
[   52.643370][ T9513]  kasan_save_track+0x3e/0x80
[   52.643407][ T9513]  __kasan_kmalloc+0x93/0xb0
[   52.643444][ T9513]  __kmalloc_cache_noprof+0x325/0x610
[   52.643479][ T9513]  go7007_usb_probe+0x2f0/0x1f20
[   52.643519][ T9513]  usb_probe_interface+0x71f/0xe00
[   52.643564][ T9513]  really_probe+0x267/0xaf0
[   52.643596][ T9513]  __driver_probe_device+0x1e2/0x350
[   52.643639][ T9513]  driver_probe_device+0x4f/0x240
[   52.643670][ T9513]  __device_attach_driver+0x270/0x410
[   52.643702][ T9513]  bus_for_each_drv+0x258/0x2f0
[   52.643741][ T9513]  __device_attach+0x2c5/0x450
[   52.643769][ T9513]  device_initial_probe+0xa1/0xd0
[   52.643799][ T9513]  bus_probe_device+0x12a/0x220
[   52.643837][ T9513]  device_add+0x7ec/0xb90
[   52.643861][ T9513]  usb_set_configuration+0x1a87/0x2110
[   52.643898][ T9513]  usb_generic_driver_probe+0x8d/0x150
[   52.643934][ T9513]  usb_probe_device+0x1c4/0x3b0
[   52.643971][ T9513]  really_probe+0x267/0xaf0
[   52.644001][ T9513]  __driver_probe_device+0x1e2/0x350
[   52.644032][ T9513]  driver_probe_device+0x4f/0x240
[   52.644063][ T9513]  __device_attach_driver+0x270/0x410
[   52.644095][ T9513]  bus_for_each_drv+0x258/0x2f0
[   52.644133][ T9513]  __device_attach+0x2c5/0x450
[   52.644161][ T9513]  device_initial_probe+0xa1/0xd0
[   52.644190][ T9513]  bus_probe_device+0x12a/0x220
[   52.644229][ T9513]  device_add+0x7ec/0xb90
[   52.644253][ T9513]  usb_new_device+0xa14/0x1720
[   52.644282][ T9513]  hub_event+0x2a1c/0x4f30
[   52.644315][ T9513]  process_scheduled_works+0xc99/0x1900
[   52.644361][ T9513]  worker_thread+0xa53/0xfc0
[   52.644387][ T9513]  kthread+0x38b/0x480
[   52.644420][ T9513]  ret_from_fork+0x514/0xb70
[   52.644452][ T9513]  ret_from_fork_asm+0x1a/0x30
[   52.644486][ T9513]
[   52.644493][ T9513] Freed by task 9528:
[   52.644507][ T9513]  kasan_save_track+0x3e/0x80
[   52.644542][ T9513]  kasan_save_free_info+0x46/0x50
[   52.644570][ T9513]  __kasan_slab_free+0x5c/0x80
[   52.644625][ T9513]  kfree+0x1c5/0x650
[   52.644651][ T9513]  go7007_remove+0x82/0x150
[   52.644686][ T9513]  v4l2_device_put+0x81/0xd0
[   52.644725][ T9513]  usb_unbind_interface+0x26e/0x910
[   52.644762][ T9513]  device_release_driver_internal+0x4d9/0x870
[   52.644795][ T9513]  unbind_store+0x1a1/0x1d0
[   52.644819][ T9513]  kernfs_fop_write_iter+0x3af/0x540
[   52.644862][ T9513]  vfs_write+0x61d/0xb90
[   52.644891][ T9513]  ksys_write+0x150/0x270
[   52.644920][ T9513]  do_syscall_64+0x155/0x510
[   52.644961][ T9513]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.644990][ T9513]
[   52.644997][ T9513] The buggy address belongs to the object at
ffff88810b989800
[   52.644997][ T9513]  which belongs to the cache kmalloc-512 of size 512
[   52.645040][ T9513] The buggy address is located 280 bytes inside of
[   52.645040][ T9513]  freed 512-byte region [ffff88810b989800,
ffff88810b989a00)
[   52.645073][ T9513]
[   52.645081][ T9513] The buggy address belongs to the physical page:
[   52.645112][ T9513] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x10b988
[   52.645143][ T9513] head: order:2 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   52.645169][ T9513] flags:
0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
[   52.645212][ T9513] page_type: f5(slab)
[   52.645249][ T9513] raw: 057ff00000000040 ffff88801b041c80
dead000000000100 dead000000000122
[   52.645276][ T9513] raw: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   52.645304][ T9513] head: 057ff00000000040 ffff88801b041c80
dead000000000100 dead000000000122
[   52.645329][ T9513] head: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   52.645356][ T9513] head: 057ff00000000002 ffffffffffffff01
00000000ffffffff 00000000ffffffff
[   52.645382][ T9513] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000004
[   52.645398][ T9513] page dumped because: kasan: bad access detected
[   52.645420][ T9513] page_owner tracks the page as allocated
[   52.645432][ T9513] page last allocated via order 2, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 5043, tgid 5043 (udevadm), ts 19171820541
[   52.645484][ T9513]  post_alloc_hook+0x1f9/0x250
[   52.645515][ T9513]  get_page_from_freelist+0x235a/0x23e0
[   52.645553][ T9513]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   52.645590][ T9513]  allocate_slab+0x7d/0x610
[   52.645630][ T9513]  refill_objects+0x2d6/0x350
[   52.645655][ T9513]  __pcs_replace_empty_main+0x2c9/0x6c0
[   52.645696][ T9513]  __kmalloc_cache_noprof+0x3a5/0x610
[   52.645729][ T9513]  kernfs_fop_open+0x3f0/0xda0
[   52.645769][ T9513]  do_dentry_open+0x822/0x13a0
[   52.645808][ T9513]  vfs_open+0x3b/0x340
[   52.645845][ T9513]  path_openat+0x1569/0x1f30
[   52.645890][ T9513]  do_file_open+0x23e/0x4a0
[   52.645915][ T9513]  do_sys_openat2+0x115/0x200
[   52.645947][ T9513]  __x64_sys_openat+0x138/0x170
[   52.645980][ T9513]  do_syscall_64+0x155/0x510
[   52.646012][ T9513]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.646035][ T9513] page last free pid 5008 tgid 5008 ts
18799667384 stack trace:
[   52.646053][ T9513]  free_pages_prepare+0xa03/0xb00
[   52.646076][ T9513]  __free_contig_range_common+0x174/0x340
[   52.646110][ T9513]  free_pages_bulk+0x48/0x120
[   52.646138][ T9513]  vfree+0x231/0x470
[   52.646158][ T9513]  delayed_vfree_work+0x55/0x80
[   52.646184][ T9513]  process_scheduled_works+0xc99/0x1900
[   52.646219][ T9513]  worker_thread+0xa53/0xfc0
[   52.646240][ T9513]  kthread+0x38b/0x480
[   52.646265][ T9513]  ret_from_fork+0x514/0xb70
[   52.646290][ T9513]  ret_from_fork_asm+0x1a/0x30
[   52.646317][ T9513]
[   52.646323][ T9513] Memory state around the buggy address:
[   52.646336][ T9513]  ffff88810b989800: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   52.646352][ T9513]  ffff88810b989880: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   52.646369][ T9513] >ffff88810b989900: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   52.646381][ T9513]                             ^
[   52.646394][ T9513]  ffff88810b989980: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   52.646410][ T9513]  ffff88810b989a00: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   52.646422][ T9513]
==================================================================
[   52.646480][ T9513] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   52.744427][ T9513] CPU: 1 UID: 0 PID: 9513 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   52.745433][ T9513] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   52.746540][ T9513] Call Trace:
[   52.746878][ T9513]  <TASK>
[   52.747153][ T9513]  vpanic+0x56d/0xa60
[   52.747527][ T9513]  ? __pfx_vpanic+0x10/0x10
[   52.747948][ T9513]  ? irqentry_exit+0x218/0x760
[   52.748395][ T9513]  panic+0xc5/0xd0
[   52.748749][ T9513]  ? __pfx_panic+0x10/0x10
[   52.749159][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.749694][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.750208][ T9513]  check_panic_on_warn+0x89/0xb0
[   52.750669][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.751183][ T9513]  end_report+0x73/0x170
[   52.751578][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.752096][ T9513]  kasan_report+0x128/0x150
[   52.752516][ T9513]  ? go7007_usb_read_interrupt+0x5a/0xc0
[   52.753032][ T9513]  go7007_usb_read_interrupt+0x5a/0xc0
[   52.753534][ T9513]  go7007_read_interrupt+0xfd/0x500
[   52.754014][ T9513]  ? usb_control_msg+0x2c1/0x3e0
[   52.754472][ T9513]  ? __pfx_go7007_read_interrupt+0x10/0x10
[   52.755006][ T9513]  ? usb_control_msg+0x2c1/0x3e0
[   52.755459][ T9513]  ? __pfx_autoremove_wake_function+0x10/0x10
[   52.756087][ T9513]  ? go7007_usb_ezusb_write_interrupt+0x265/0x3c0
[   52.756677][ T9513]  ? go7007_usb_ezusb_write_interrupt+0x280/0x3c0
[   52.757262][ T9513]  go7007_read_addr+0xb1/0x140
[   52.757707][ T9513]  go7007_i2c_xfer+0x6e7/0xe90
[   52.758148][ T9513]  ? check_path+0x21/0x40
[   52.758550][ T9513]  ? __pfx_go7007_i2c_xfer+0x10/0x10
[   52.759038][ T9513]  ? lockdep_unlock+0x5c/0xd0
[   52.759488][ T9513]  ? __lock_acquire+0x25db/0x2db0
[   52.759954][ T9513]  ? go7007_smbus_xfer+0xa7/0xf0
[   52.760410][ T9513]  __i2c_smbus_xfer+0x626/0x1f70
[   52.760872][ T9513]  ? __pfx_go7007_smbus_xfer+0x10/0x10
[   52.761371][ T9513]  ? __pfx___i2c_smbus_xfer+0x10/0x10
[   52.761867][ T9513]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   52.762402][ T9513]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   52.762958][ T9513]  ? rt_mutex_lock_nested+0x15c/0x1d0
[   52.763475][ T9513]  i2c_smbus_xfer+0x1f5/0x310
[   52.763936][ T9513]  i2cdev_ioctl_smbus+0x434/0x730
[   52.764423][ T9513]  ? __pfx_i2cdev_ioctl_smbus+0x10/0x10
[   52.764966][ T9513]  i2cdev_ioctl+0x615/0x880
[   52.765383][ T9513]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   52.765865][ T9513]  ? __fget_files+0x2a/0x420
[   52.766356][ T9513]  ? __fget_files+0x3a0/0x420
[   52.766813][ T9513]  ? bpf_lsm_file_ioctl+0x9/0x20
[   52.767293][ T9513]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   52.767782][ T9513]  __se_sys_ioctl+0xfc/0x170
[   52.768233][ T9513]  do_syscall_64+0x155/0x510
[   52.768686][ T9513]  ? trace_irq_disable+0x3b/0x140
[   52.769170][ T9513]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.769743][ T9513]  ? clear_bhb_loop+0x30/0x80
[   52.770176][ T9513]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.770716][ T9513] RIP: 0033:0x426e3d
[   52.771080][ T9513] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   52.772803][ T9513] RSP: 002b:00007f48b7fff130 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   52.773578][ T9513] RAX: ffffffffffffffda RBX: 00007f48b7fff6c0
RCX: 0000000000426e3d
[   52.774348][ T9513] RDX: 00007f48b7fff1a0 RSI: 0000000000000720
RDI: 0000000000000004
[   52.775103][ T9513] RBP: 00007f48b7fff180 R08: 0000000000000000
R09: 0000000000000001
[   52.775895][ T9513] R10: 0000000000000008 R11: 0000000000000246
R12: 00007f48b7fff6c0
[   52.776679][ T9513] R13: 00007ffd4000ef40 R14: 00007f48b7fffce4
R15: 00007ffd4000f037
[   52.777430][ T9513]  </TASK>
[   52.778415][ T9513] Kernel Offset: disabled
[   52.778969][ T9513] Rebooting in 86400 seconds..

Regards,

--00000000000037cf9a065b372294
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx5145d0>
X-Attachment-Id: f_mtx5145d0

LyoKICogMjUzLWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi1nbzcwMDctdXNiLXJl
YWQtaW50ZXJydXB0CiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4K
I2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8cHRocmVhZC5o
PgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGli
Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8
c3lzL3N0YXQuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2luY2x1ZGUgPGxpbnV4L3VzYi9jaDku
aD4KI2luY2x1ZGUgPGxpbnV4L3VzYi9yYXdfZ2FkZ2V0Lmg+CgojZGVmaW5lIEkyQ19TTEFWRV9G
T1JDRSAgICAgMHgwNzA2CiNkZWZpbmUgSTJDX1NNQlVTICAgICAgICAgICAweDA3MjAKI2RlZmlu
ZSBJMkNfU01CVVNfUkVBRCAgICAgIDEKI2RlZmluZSBJMkNfU01CVVNfQllURV9EQVRBIDIKdW5p
b24gaTJjX3NtYnVzX2RhdGFfcGF5bG9hZCB7Cgl1aW50OF90IGJ5dGU7Cgl1aW50MTZfdCB3b3Jk
OwoJdWludDhfdCBibG9ja1szNF07Cn07CnN0cnVjdCBpMmNfc21idXNfaW9jdGxfYXJncyB7Cgl1
aW50OF90IHJlYWRfd3JpdGU7Cgl1aW50OF90IGNvbW1hbmQ7Cgl1aW50MzJfdCBzaXplOwoJdW5p
b24gaTJjX3NtYnVzX2RhdGFfcGF5bG9hZCAqZGF0YTsKfTsKCnN0YXRpYyBzdHJ1Y3QgdXNiX2Rl
dmljZV9kZXNjcmlwdG9yIGRldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGggPSBzaXplb2Yo
c3RydWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciksCgkuYkRlc2NyaXB0b3JUeXBlID0gVVNCX0RU
X0RFVklDRSwKCS5iY2RVU0IgPSAweDAyMDAsCgkuYk1heFBhY2tldFNpemUwID0gNjQsCgkuaWRW
ZW5kb3IgPSAweDBlYjEsCgkuaWRQcm9kdWN0ID0gMHg3MDA3LAoJLmJjZERldmljZSA9IDB4MDIw
MiwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKI2RlZmluZSBMRTE2KHYpICgodikgJiAw
eGZmKSwgKCgodikgPj4gOCkgJiAweGZmKQojZGVmaW5lIENPTkZJR19ERVNDUklQVE9SX0xFTiAo
OSArIDkgKyA3ICogNCkKI2RlZmluZSBGSVJTVF9FTkRQT0lOVF9PRkZTRVQgMTgKc3RhdGljIGNv
bnN0IHVpbnQ4X3QgY29uZmlnX2Rlc2NyaXB0b3JbQ09ORklHX0RFU0NSSVBUT1JfTEVOXSA9IHsK
CTksIFVTQl9EVF9DT05GSUcsIExFMTYoQ09ORklHX0RFU0NSSVBUT1JfTEVOKSwgMSwgMSwgMCwg
MHhhMCwgMHhmYSwKCTksIFVTQl9EVF9JTlRFUkZBQ0UsIDAsIDAsIDQsIDB4ZmYsIDB4MDAsIDB4
ZmYsIDAsCgoJNywgVVNCX0RUX0VORFBPSU5ULCAweDAyLCBVU0JfRU5EUE9JTlRfWEZFUl9CVUxL
LCBMRTE2KDUxMiksIDAsCgoJNywgVVNCX0RUX0VORFBPSU5ULCAweDg0LCBVU0JfRU5EUE9JTlRf
WEZFUl9CVUxLLCBMRTE2KDUxMiksIDAsCgoJNywgVVNCX0RUX0VORFBPSU5ULCAweDg2LCBVU0Jf
RU5EUE9JTlRfWEZFUl9CVUxLLCBMRTE2KDUxMiksIDAsCgk3LCBVU0JfRFRfRU5EUE9JTlQsIDB4
ODgsIFVTQl9FTkRQT0lOVF9YRkVSX0JVTEssIExFMTYoNTEyKSwgMCwKfTsKCnN0YXRpYyBpbnQg
cmF3X2dhZGdldF9mZCA9IC0xOwpzdGF0aWMgdm9sYXRpbGUgaW50IGludGVycnVwdF9lcF9oYW5k
bGUgPSAtMSwgZmlybXdhcmVfZXBfaGFuZGxlID0gLTE7CnN0YXRpYyB2b2xhdGlsZSBpbnQgaW50
ZXJydXB0X2ZlZWRfcGhhc2U7CgpzdHJ1Y3QgcmF3X2dhZGdldF90cmFuc2ZlciB7CglzdHJ1Y3Qg
dXNiX3Jhd19lcF9pbyBpbzsKCXVpbnQ4X3QgZGF0YV90YWlsWzEwMjRdOwp9OwoKc3RhdGljIGlu
dCBjb250cm9sX2VwX3dyaXRlKGNvbnN0IHZvaWQgKnBheWxvYWQsIHVpbnQzMl90IGxlbmd0aCkK
ewoJc3RydWN0IHJhd19nYWRnZXRfdHJhbnNmZXIgdHJhbnNmZXI7CgoJdHJhbnNmZXIuaW8uZXAg
PSAwOyB0cmFuc2Zlci5pby5mbGFncyA9IDA7IHRyYW5zZmVyLmlvLmxlbmd0aCA9IGxlbmd0aDsK
CWlmIChsZW5ndGgpCgkJbWVtY3B5KHRyYW5zZmVyLmlvLmRhdGEsIHBheWxvYWQsIGxlbmd0aCk7
CglyZXR1cm4gaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfV1JJVEUsICZ0
cmFuc2Zlcik7Cn0KCnN0YXRpYyBpbnQgY29udHJvbF9lcF9yZWFkKHVpbnQzMl90IGxlbmd0aCkK
ewoJc3RydWN0IHJhd19nYWRnZXRfdHJhbnNmZXIgdHJhbnNmZXI7CgoJdHJhbnNmZXIuaW8uZXAg
PSAwOyB0cmFuc2Zlci5pby5mbGFncyA9IDA7Cgl0cmFuc2Zlci5pby5sZW5ndGggPSBsZW5ndGgg
PiAxMDI0ID8gMTAyNCA6IGxlbmd0aDsKCXJldHVybiBpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0Jf
UkFXX0lPQ1RMX0VQMF9SRUFELCAmdHJhbnNmZXIpOwp9CgpzdGF0aWMgaW50IGVuYWJsZV9lbmRw
b2ludChjb25zdCB1aW50OF90ICplbmRwb2ludF9kZXNjcmlwdG9yKQp7CglzdHJ1Y3QgdXNiX2Vu
ZHBvaW50X2Rlc2NyaXB0b3IgZW5kcG9pbnQ7CgoJbWVtc2V0KCZlbmRwb2ludCwgMCwgc2l6ZW9m
KGVuZHBvaW50KSk7CgllbmRwb2ludC5iTGVuZ3RoID0gNzsKCWVuZHBvaW50LmJEZXNjcmlwdG9y
VHlwZSA9IFVTQl9EVF9FTkRQT0lOVDsKCWVuZHBvaW50LmJFbmRwb2ludEFkZHJlc3MgPSBlbmRw
b2ludF9kZXNjcmlwdG9yWzJdOwoJZW5kcG9pbnQuYm1BdHRyaWJ1dGVzID0gZW5kcG9pbnRfZGVz
Y3JpcHRvclszXTsKCWVuZHBvaW50LndNYXhQYWNrZXRTaXplID0gZW5kcG9pbnRfZGVzY3JpcHRv
cls0XSB8IGVuZHBvaW50X2Rlc2NyaXB0b3JbNV0gPDwgODsKCWVuZHBvaW50LmJJbnRlcnZhbCA9
IGVuZHBvaW50X2Rlc2NyaXB0b3JbNl07CglyZXR1cm4gaW9jdGwocmF3X2dhZGdldF9mZCwgVVNC
X1JBV19JT0NUTF9FUF9FTkFCTEUsICZlbmRwb2ludCk7Cn0KCnN0YXRpYyB2b2lkICppbnRlcnJ1
cHRfcGlwZV9mZWVkZXIodm9pZCAqdW51c2VkKQp7Cglmb3IgKDs7KSB7CgkJc3RydWN0IHJhd19n
YWRnZXRfdHJhbnNmZXIgdHJhbnNmZXI7CgkJdWludDE2X3QgaW50ZXJydXB0X3ZhbHVlLCBpbnRl
cnJ1cHRfZGF0YTsKCQlpbnQgcGhhc2UgPSBpbnRlcnJ1cHRfZmVlZF9waGFzZTsKCgkJaWYgKHBo
YXNlID09IDMpIHsKCQkJdXNsZWVwKDIwMDAwMCk7CgkJCWludGVycnVwdF92YWx1ZSA9IDB4MDAw
MDsgaW50ZXJydXB0X2RhdGEgPSAweDAwMDA7CgkJfSBlbHNlIGlmIChwaGFzZSA9PSAyKSB7CgkJ
CWludGVycnVwdF92YWx1ZSA9IDB4YTAwMDsgaW50ZXJydXB0X2RhdGEgPSAweDAwMDg7CgkJfSBl
bHNlIHsKCQkJaW50ZXJydXB0X3ZhbHVlID0gcGhhc2UgPT0gMCA/IDB4NTVhYSA6IDB4NWE1YTsK
CQkJaW50ZXJydXB0X2RhdGEgPSAweDAwMDA7CgkJfQoJCXRyYW5zZmVyLmlvLmVwID0gaW50ZXJy
dXB0X2VwX2hhbmRsZTsKCQl0cmFuc2Zlci5pby5mbGFncyA9IDA7CgkJdHJhbnNmZXIuaW8ubGVu
Z3RoID0gNDsKCQl0cmFuc2Zlci5pby5kYXRhWzBdID0gaW50ZXJydXB0X2RhdGEgJiAweGZmOwoJ
CXRyYW5zZmVyLmlvLmRhdGFbMV0gPSBpbnRlcnJ1cHRfZGF0YSA+PiA4OwoJCXRyYW5zZmVyLmlv
LmRhdGFbMl0gPSBpbnRlcnJ1cHRfdmFsdWUgJiAweGZmOwoJCXRyYW5zZmVyLmlvLmRhdGFbM10g
PSBpbnRlcnJ1cHRfdmFsdWUgPj4gODsKCQlpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JB
V19JT0NUTF9FUF9XUklURSwgJnRyYW5zZmVyKSA8IDApCgkJCWJyZWFrOwoJCWlmIChwaGFzZSA8
IDIpCgkJCWludGVycnVwdF9mZWVkX3BoYXNlID0gcGhhc2UgKyAxOwoJfQoJcmV0dXJuIE5VTEw7
Cn0KCnN0YXRpYyB2b2lkICpmaXJtd2FyZV9zaW5rKHZvaWQgKnVudXNlZCkKewoJZm9yICg7Oykg
ewoJCXN0cnVjdCByYXdfZ2FkZ2V0X3RyYW5zZmVyIHRyYW5zZmVyOwoKCQl0cmFuc2Zlci5pby5l
cCA9IGZpcm13YXJlX2VwX2hhbmRsZTsKCQl0cmFuc2Zlci5pby5mbGFncyA9IDA7IHRyYW5zZmVy
LmlvLmxlbmd0aCA9IDUxMjsKCQlpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NU
TF9FUF9SRUFELCAmdHJhbnNmZXIpIDwgMCkKCQkJYnJlYWs7Cgl9CglyZXR1cm4gTlVMTDsKfQoK
c3RhdGljIHB0aHJlYWRfdCBpbnRlcnJ1cHRfZmVlZGVyX3RocmVhZCwgZmlybXdhcmVfc2lua190
aHJlYWQ7CgpzdGF0aWMgdm9pZCBoYW5kbGVfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0cnVjdCB1
c2JfY3RybHJlcXVlc3QgKnNldHVwKQp7Cgl1aW50OF90IHJlc3BvbnNlWzEwMjRdOwoJaW50IHJl
c3BvbnNlX2xlbiA9IC0xOwoKCWlmICgoc2V0dXAtPmJSZXF1ZXN0VHlwZSAmIFVTQl9UWVBFX01B
U0spID09IFVTQl9UWVBFX1NUQU5EQVJEKSB7CgkJc3dpdGNoIChzZXR1cC0+YlJlcXVlc3QpIHsK
CQljYXNlIFVTQl9SRVFfR0VUX0RFU0NSSVBUT1I6CgkJCXN3aXRjaCAoc2V0dXAtPndWYWx1ZSA+
PiA4KSB7CgkJCWNhc2UgVVNCX0RUX0RFVklDRToKCQkJCXJlc3BvbnNlX2xlbiA9IHNpemVvZihk
ZXZpY2VfZGVzY3JpcHRvcik7CgkJCQltZW1jcHkocmVzcG9uc2UsICZkZXZpY2VfZGVzY3JpcHRv
ciwgcmVzcG9uc2VfbGVuKTsKCQkJCWJyZWFrOwoJCQljYXNlIFVTQl9EVF9DT05GSUc6CgkJCQly
ZXNwb25zZV9sZW4gPSBDT05GSUdfREVTQ1JJUFRPUl9MRU47CgkJCQltZW1jcHkocmVzcG9uc2Us
IGNvbmZpZ19kZXNjcmlwdG9yLCByZXNwb25zZV9sZW4pOwoJCQkJYnJlYWs7CgkJCX0KCQkJYnJl
YWs7CgkJY2FzZSBVU0JfUkVRX1NFVF9DT05GSUdVUkFUSU9OOgoJCQlpb2N0bChyYXdfZ2FkZ2V0
X2ZkLCBVU0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSwgMCk7CgkJCWZpcm13YXJlX2VwX2hhbmRsZSA9
CgkJCQllbmFibGVfZW5kcG9pbnQoJmNvbmZpZ19kZXNjcmlwdG9yW0ZJUlNUX0VORFBPSU5UX09G
RlNFVF0pOwoJCQlpbnRlcnJ1cHRfZXBfaGFuZGxlID0KCQkJCWVuYWJsZV9lbmRwb2ludCgmY29u
ZmlnX2Rlc2NyaXB0b3JbRklSU1RfRU5EUE9JTlRfT0ZGU0VUICsgN10pOwoJCQlpZiAoZmlybXdh
cmVfZXBfaGFuZGxlID49IDApCgkJCQlwdGhyZWFkX2NyZWF0ZSgmZmlybXdhcmVfc2lua190aHJl
YWQsIE5VTEwsIGZpcm13YXJlX3NpbmssIE5VTEwpOwoJCQlpZiAoaW50ZXJydXB0X2VwX2hhbmRs
ZSA+PSAwKQoJCQkJcHRocmVhZF9jcmVhdGUoJmludGVycnVwdF9mZWVkZXJfdGhyZWFkLCBOVUxM
LAoJCQkJCSAgICAgICBpbnRlcnJ1cHRfcGlwZV9mZWVkZXIsIE5VTEwpOwoJCQlyZXNwb25zZV9s
ZW4gPSAwOwoJCQlicmVhazsKCQl9Cgl9IGVsc2UgaWYgKChzZXR1cC0+YlJlcXVlc3RUeXBlICYg
VVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfVkVORE9SKSB7CgoJCXJlc3BvbnNlX2xlbiA9IHNl
dHVwLT53TGVuZ3RoID4gKGludClzaXplb2YocmVzcG9uc2UpID8gc2l6ZW9mKHJlc3BvbnNlKQoJ
CQkJCQkJCSAgICAgIDogc2V0dXAtPndMZW5ndGg7CgkJbWVtc2V0KHJlc3BvbnNlLCAwLCByZXNw
b25zZV9sZW4pOwoJfQoKCWlmIChyZXNwb25zZV9sZW4gPCAwKSB7CgkJaW9jdGwocmF3X2dhZGdl
dF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfU1RBTEwsIDApOwoJCXJldHVybjsKCX0KCWlmICgoc2V0
dXAtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYmIHNldHVwLT53TGVuZ3RoKSB7CgkJaWYg
KHJlc3BvbnNlX2xlbiA+IHNldHVwLT53TGVuZ3RoKQoJCQlyZXNwb25zZV9sZW4gPSBzZXR1cC0+
d0xlbmd0aDsKCQljb250cm9sX2VwX3dyaXRlKHJlc3BvbnNlLCByZXNwb25zZV9sZW4pOwoJfSBl
bHNlIHsKCQljb250cm9sX2VwX3JlYWQoc2V0dXAtPndMZW5ndGgpOwoJfQp9CgpzdGF0aWMgdm9p
ZCAqY29udHJvbF9yZXF1ZXN0X2xvb3Aodm9pZCAqdW51c2VkKQp7Cglmb3IgKDs7KSB7CgkJdWlu
dDhfdCBldmVudF9idWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2ZW50KSArIDI1Nl07CgkJ
c3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilldmVudF9idWZmZXI7CgoJCWV2
ZW50LT50eXBlID0gMDsKCQlldmVudC0+bGVuZ3RoID0gMjU2OwoJCWlmIChpb2N0bChyYXdfZ2Fk
Z2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENILCBldmVudCkgPCAwKSB7CgkJCWlmIChl
cnJubyA9PSBFSU5UUikKCQkJCWNvbnRpbnVlOwoJCQlyZXR1cm4gTlVMTDsKCQl9CgkJaWYgKGV2
ZW50LT50eXBlID09IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkKCQkJaGFuZGxlX2NvbnRyb2xfcmVx
dWVzdCgoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqKWV2ZW50LT5kYXRhKTsKCQllbHNlIGlmIChl
dmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0RJU0NPTk5FQ1QpCgkJCXJldHVybiBOVUxMOwoJ
fQp9CgpzdGF0aWMgaW50IGkyY19kZXZfZmQgPSAtMTsKCnN0YXRpYyB2b2lkICppMmNfdHJhbnNm
ZXJfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJdW5pb24gaTJjX3NtYnVzX2RhdGFfcGF5bG9hZCBz
bWJ1c19kYXRhOwoJc3RydWN0IGkyY19zbWJ1c19pb2N0bF9hcmdzIHNtYnVzX2FyZ3M7CgoJbWVt
c2V0KCZzbWJ1c19kYXRhLCAwLCBzaXplb2Yoc21idXNfZGF0YSkpOwoJc21idXNfYXJncy5yZWFk
X3dyaXRlID0gSTJDX1NNQlVTX1JFQUQ7CglzbWJ1c19hcmdzLmNvbW1hbmQgPSAweDBhOwoJc21i
dXNfYXJncy5zaXplID0gSTJDX1NNQlVTX0JZVEVfREFUQTsKCXNtYnVzX2FyZ3MuZGF0YSA9ICZz
bWJ1c19kYXRhOwoJaW9jdGwoaTJjX2Rldl9mZCwgSTJDX1NNQlVTLCAmc21idXNfYXJncyk7Cgly
ZXR1cm4gTlVMTDsKfQoKc3RhdGljIGludCBmaW5kX2dvNzAwN19pbnRlcmZhY2UoY2hhciAqaW50
ZXJmYWNlX25hbWUsIHNpemVfdCBzaXplKQp7CglESVIgKmRyaXZlcl9kaXIgPSBvcGVuZGlyKCIv
c3lzL2J1cy91c2IvZHJpdmVycy9nbzcwMDciKTsKCXN0cnVjdCBkaXJlbnQgKmVudHJ5OwoKCWlm
ICghZHJpdmVyX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKGVudHJ5ID0gcmVhZGRpcihkcml2
ZXJfZGlyKSkpIHsKCQlpZiAoIXN0cmNocihlbnRyeS0+ZF9uYW1lLCAnOicpKQoJCQljb250aW51
ZTsKCQlzbnByaW50ZihpbnRlcmZhY2VfbmFtZSwgc2l6ZSwgIiVzIiwgZW50cnktPmRfbmFtZSk7
CgkJY2xvc2VkaXIoZHJpdmVyX2Rpcik7CgkJcmV0dXJuIDA7Cgl9CgljbG9zZWRpcihkcml2ZXJf
ZGlyKTsKCXJldHVybiAtMTsKfQoKc3RhdGljIGNoYXIgYm91bmRfaW50ZXJmYWNlWzY0XTsKCnN0
YXRpYyB2b2lkICp1bmJpbmRfZ283MDA3X3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCWludCB1bmJp
bmRfZmQgPSBvcGVuKCIvc3lzL2J1cy91c2IvZHJpdmVycy9nbzcwMDcvdW5iaW5kIiwgT19XUk9O
TFkpOwoKCWlmICh1bmJpbmRfZmQgPCAwKSB7CgkJcGVycm9yKCJ1bmJpbmQiKTsKCQlyZXR1cm4g
TlVMTDsKCX0KCXdyaXRlKHVuYmluZF9mZCwgYm91bmRfaW50ZXJmYWNlLCBzdHJsZW4oYm91bmRf
aW50ZXJmYWNlKSk7CgljbG9zZSh1bmJpbmRfZmQpOwoJcmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyBp
bnQgZmluZF91ZGMoY2hhciAqZHJpdmVyX25hbWUsIGNoYXIgKmRldmljZV9uYW1lKQp7CglESVIg
KnVkY19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJc3RydWN0IGRpcmVudCAqZW50
cnk7CgoJaWYgKCF1ZGNfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgoZW50cnkgPSByZWFkZGly
KHVkY19kaXIpKSkgewoJCWNoYXIgKmluc3RhbmNlX3N1ZmZpeDsKCgkJaWYgKGVudHJ5LT5kX25h
bWVbMF0gPT0gJy4nKQoJCQljb250aW51ZTsKCQlzdHJjcHkoZGV2aWNlX25hbWUsIGVudHJ5LT5k
X25hbWUpOwoJCXN0cmNweShkcml2ZXJfbmFtZSwgZW50cnktPmRfbmFtZSk7CgoJCWluc3RhbmNl
X3N1ZmZpeCA9IHN0cnJjaHIoZHJpdmVyX25hbWUsICcuJyk7CgkJaWYgKGluc3RhbmNlX3N1ZmZp
eCkKCQkJKmluc3RhbmNlX3N1ZmZpeCA9IDA7CgkJY2xvc2VkaXIodWRjX2Rpcik7CgkJcmV0dXJu
IDA7Cgl9CgljbG9zZWRpcih1ZGNfZGlyKTsKCXJldHVybiAtMTsKfQoKc3RhdGljIGludCBvcGVu
X2dvNzAwN19pMmNfZGV2KHZvaWQpCnsKCWludCBhZGFwdGVyX2luZGV4OwoKCWZvciAoYWRhcHRl
cl9pbmRleCA9IDA7IGFkYXB0ZXJfaW5kZXggPCAzMjsgYWRhcHRlcl9pbmRleCsrKSB7CgkJY2hh
ciBzeXNmc19wYXRoWzEyOF0sIGFkYXB0ZXJfbmFtZVsxMjhdOwoJCWludCBuYW1lX2ZkLCBpMmNf
ZmQsIG5hbWVfbGVuOwoKCQlzbnByaW50ZihzeXNmc19wYXRoLCBzaXplb2Yoc3lzZnNfcGF0aCks
CgkJCSAiL3N5cy9jbGFzcy9pMmMtZGV2L2kyYy0lZC9uYW1lIiwgYWRhcHRlcl9pbmRleCk7CgkJ
bmFtZV9mZCA9IG9wZW4oc3lzZnNfcGF0aCwgT19SRE9OTFkpOwoJCWlmIChuYW1lX2ZkIDwgMCkK
CQkJY29udGludWU7CgkJbmFtZV9sZW4gPSByZWFkKG5hbWVfZmQsIGFkYXB0ZXJfbmFtZSwgc2l6
ZW9mKGFkYXB0ZXJfbmFtZSkgLSAxKTsKCQljbG9zZShuYW1lX2ZkKTsKCQlpZiAobmFtZV9sZW4g
PD0gMCkKCQkJY29udGludWU7CgkJYWRhcHRlcl9uYW1lW25hbWVfbGVuXSA9IDA7CgkJaWYgKCFz
dHJzdHIoYWRhcHRlcl9uYW1lLCAiR083MDA3IikpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKHN5
c2ZzX3BhdGgsIHNpemVvZihzeXNmc19wYXRoKSwgIi9kZXYvaTJjLSVkIiwgYWRhcHRlcl9pbmRl
eCk7CgkJaTJjX2ZkID0gb3BlbihzeXNmc19wYXRoLCBPX1JEV1IpOwoJCWlmIChpMmNfZmQgPCAw
KQoJCQljb250aW51ZTsKCgkJaW9jdGwoaTJjX2ZkLCBJMkNfU0xBVkVfRk9SQ0UsIDB4MjEpOwoJ
CXJldHVybiBpMmNfZmQ7Cgl9CglyZXR1cm4gLTE7Cn0KCnN0YXRpYyB2b2lkIGluc3RhbGxfZmFr
ZV9lbmNvZGVyX2Zpcm13YXJlKHZvaWQpCnsKCXVpbnQ4X3QgZmlybXdhcmVfaW1hZ2VbODBdOwoJ
aW50IGZpcm13YXJlX2ZkOwoKCW1rZGlyKCIvbGliL2Zpcm13YXJlIiwgMDc1NSk7Cglta2Rpcigi
L2xpYi9maXJtd2FyZS9nbzcwMDciLCAwNzU1KTsKCW1lbXNldChmaXJtd2FyZV9pbWFnZSwgMCwg
c2l6ZW9mKGZpcm13YXJlX2ltYWdlKSk7CgltZW1jcHkoZmlybXdhcmVfaW1hZ2UsICJXSVNHTzcw
MDdGVyIsIDExKTsKCWZpcm13YXJlX2ZkID0gb3BlbigiL2xpYi9maXJtd2FyZS9nbzcwMDcvZ283
MDA3ZncuYmluIiwKCQkJICAgT19XUk9OTFkgfCBPX0NSRUFUIHwgT19UUlVOQywgMDY0NCk7Cglp
ZiAoZmlybXdhcmVfZmQgPCAwKSB7CgkJcGVycm9yKCJmaXJtd2FyZSIpOwoJCXJldHVybjsKCX0K
CXdyaXRlKGZpcm13YXJlX2ZkLCBmaXJtd2FyZV9pbWFnZSwgc2l6ZW9mKGZpcm13YXJlX2ltYWdl
KSk7CgljbG9zZShmaXJtd2FyZV9mZCk7Cn0KCmludCBtYWluKHZvaWQpCnsKCWNoYXIgdWRjX2Ry
aXZlcl9uYW1lWzEyOF0sIHVkY19kZXZpY2VfbmFtZVsxMjhdOwoJc3RydWN0IHVzYl9yYXdfaW5p
dCBpbml0OwoJcHRocmVhZF90IGNvbnRyb2xfdGhyZWFkLCBpMmNfdGhyZWFkLCB1bmJpbmRfdGhy
ZWFkOwoJY2hhciBwcm9iZV9kb25lX3BhdGhbMTI4XTsKCWludCBwb2xsX2l0ZXJhdGlvbjsKCglz
eXN0ZW0oIm1vZHByb2JlIGR1bW15X2hjZCAyPi9kZXYvbnVsbDsgbW9kcHJvYmUgcmF3X2dhZGdl
dCAyPi9kZXYvbnVsbDsiCgkgICAgICAgIm1vZHByb2JlIGkyYy1kZXYgMj4vZGV2L251bGwiKTsK
CWluc3RhbGxfZmFrZV9lbmNvZGVyX2Zpcm13YXJlKCk7CgoJaWYgKGZpbmRfdWRjKHVkY19kcml2
ZXJfbmFtZSwgdWRjX2RldmljZV9uYW1lKSA8IDApIHsKCQlmcHJpbnRmKHN0ZGVyciwgIm5vIFVE
QyB1bmRlciAvc3lzL2NsYXNzL3VkYyAoZHVtbXlfaGNkIG1pc3Npbmc/KVxuIik7CgkJcmV0dXJu
IDE7Cgl9CgoJcmF3X2dhZGdldF9mZCA9IG9wZW4oIi9kZXYvcmF3LWdhZGdldCIsIE9fUkRXUik7
CglpZiAocmF3X2dhZGdldF9mZCA8IDApIHsKCQlwZXJyb3IoIi9kZXYvcmF3LWdhZGdldCIpOwoJ
CXJldHVybiAxOwoJfQoKCW1lbXNldCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQpKTsKCXN0cm5jcHko
KGNoYXIgKilpbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsIHNpemVvZihpbml0LmRy
aXZlcl9uYW1lKSAtIDEpOwoJc3RybmNweSgoY2hhciAqKWluaXQuZGV2aWNlX25hbWUsIHVkY19k
ZXZpY2VfbmFtZSwgc2l6ZW9mKGluaXQuZGV2aWNlX25hbWUpIC0gMSk7Cglpbml0LnNwZWVkID0g
VVNCX1NQRUVEX0hJR0g7CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9J
TklULCAmaW5pdCkgPCAwKSB7CgkJcGVycm9yKCJJTklUIik7CgkJcmV0dXJuIDE7Cgl9CglpZiAo
aW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwgMCkgewoJCXBlcnJv
cigiUlVOIik7CgkJcmV0dXJuIDE7Cgl9CglwdGhyZWFkX2NyZWF0ZSgmY29udHJvbF90aHJlYWQs
IE5VTEwsIGNvbnRyb2xfcmVxdWVzdF9sb29wLCBOVUxMKTsKCglmb3IgKHBvbGxfaXRlcmF0aW9u
ID0gMDsgcG9sbF9pdGVyYXRpb24gPCA0MDA7IHBvbGxfaXRlcmF0aW9uKyspIHsKCQlpMmNfZGV2
X2ZkID0gb3Blbl9nbzcwMDdfaTJjX2RldigpOwoJCWlmIChpMmNfZGV2X2ZkID49IDApCgkJCWJy
ZWFrOwoJCXVzbGVlcCgxMDAwMDApOwoJfQoJaWYgKGkyY19kZXZfZmQgPCAwKSB7CgkJZnByaW50
ZihzdGRlcnIsICJnbzcwMDcgaTJjIGFkYXB0ZXIgbmV2ZXIgYXBwZWFyZWRcbiIpOwoJCXJldHVy
biAxOwoJfQoKCWlmIChmaW5kX2dvNzAwN19pbnRlcmZhY2UoYm91bmRfaW50ZXJmYWNlLCBzaXpl
b2YoYm91bmRfaW50ZXJmYWNlKSkgPCAwKSB7CgkJZnByaW50ZihzdGRlcnIsICJnbzcwMDcgaW50
ZXJmYWNlIG5vdCBib3VuZFxuIik7CgkJcmV0dXJuIDE7Cgl9CglzbnByaW50Zihwcm9iZV9kb25l
X3BhdGgsIHNpemVvZihwcm9iZV9kb25lX3BhdGgpLAoJCSAiL3N5cy9idXMvdXNiL2RyaXZlcnMv
Z283MDA3LyVzL3ZpZGVvNGxpbnV4IiwgYm91bmRfaW50ZXJmYWNlKTsKCWZvciAocG9sbF9pdGVy
YXRpb24gPSAwOyBwb2xsX2l0ZXJhdGlvbiA8IDMwMDsgcG9sbF9pdGVyYXRpb24rKykgewoJCWlm
IChhY2Nlc3MocHJvYmVfZG9uZV9wYXRoLCBGX09LKSA9PSAwKQoJCQlicmVhazsKCQl1c2xlZXAo
MTAwMDAwKTsKCX0KCWlmIChhY2Nlc3MocHJvYmVfZG9uZV9wYXRoLCBGX09LKSAhPSAwKSB7CgkJ
ZnByaW50ZihzdGRlcnIsICJwcm9iZSBuZXZlciByZWdpc3RlcmVkIGEgdmlkZW8gbm9kZVxuIik7
CgkJcmV0dXJuIDE7Cgl9CgoJaW50ZXJydXB0X2ZlZWRfcGhhc2UgPSAzOwoJcHRocmVhZF9jcmVh
dGUoJmkyY190aHJlYWQsIE5VTEwsIGkyY190cmFuc2Zlcl90aHJlYWQsIE5VTEwpOwoJc2xlZXAo
Myk7CglwdGhyZWFkX2NyZWF0ZSgmdW5iaW5kX3RocmVhZCwgTlVMTCwgdW5iaW5kX2dvNzAwN190
aHJlYWQsIE5VTEwpOwoKCXNsZWVwKDMwKTsKCWNsb3NlKHJhd19nYWRnZXRfZmQpOwoJcmV0dXJu
IDA7Cn0K
--00000000000037cf9a065b372294--
