Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911B4A3418
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141575; cv=pass; b=h7OSkIekj5Gj00fvoc28km5Ww5czdP2g+Pg/2+r7u0J1k8poTdUBY0ezbJt4JhvSqOFbiCEglVTfI8vQ573FY76J/JM6UwcuFXh+mgaxQgLH33D1GKuG9feejLo2S02VZSiccwdxJLEA6hYS2htd9p6I2ib6kU8mGqzK9zLaH6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141575; c=relaxed/simple;
	bh=9sAKCkGZ5BulKthF99f1fFEA6XEeIYqFbTNynHJDG70=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HldQW+ThXmCaZOcNqOOaNTLH0RpijAr2irXXpRYrd6wJGlR8rZzulh534lKPp3nJNyyEW7V3sWf8rUg23hLOMiHl4U4fuygytcL/jsoYzO5Ug1Vmhk7sJspT5AfnarGbIiEB5/GzZZG2avLmPREOgDUNm1X/uJL9uu7ASeGt4N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=RVCdqOCC; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="RVCdqOCC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so903495a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141573; cv=none;
        d=google.com; s=arc-20260327;
        b=ossmOo7MhdC5hcidB2k5m7DT9BVY+rl9R7OTxE1vb0tRIBYVqXKR31rkKu/ARJZsnl
         szVFnLmhx8Y2A//uN34XLDQf7AWXBCPpuh6uu2irUBEplsJZqMKcef9dNwvQ1Lp64KOO
         xElyK/D8nX54cb/cckJ0Qjrahw/hfrN9chyanU9ybP1FddfV9YAPrUkFegyK2zMHsrbs
         zQUbYbUaTSIYW4/9LBvAT/E5+YL7NBPMDe3d9uW+nxNdIilp1plkR20W9Yqp5zlfPLRw
         ivbjRXp5p+jQlxo1WAYg9geuOSxIeZHyasXHTVct+s882nm5k5qE7oAfpYEqBXzlIczT
         pCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=t8jdA3Xmlz8pa5PufVDvIMhvCutMc2u8NjYS8QpCNrA=;
        fh=QqpKw0KzeCh5SEW/rkGlFCx5ddVYxVQn7A2ig5FG51w=;
        b=WZD4U4Bbuwt0NcBuIBvtznQY9/t4sSs93W+pyLpSxpZoOIsKvLvWQtfXXXuE4ACfZ9
         9Lbj/JsvWu82tN8QcaWA76SrVWCS3WJmdTtcq0aLv/JGen1RtcHe5uLvWNMC+HSIAJO1
         DheKQXXQPR9SOf2n3PTyrvarlJn4Y41pu928CW6mKFfx2JpEouKmwAyE8TiHsuBm4EQk
         XMiWzdpc7D0olCuf9DBIewU9WA7Lyrl8Pn1yAFZpooUK431dBF3Zm0rF7qgMjLIrt0NU
         94rgM8t+dhJB0+6QOSF/ty20GOBS53ZbgePIK4v72eptOMm8c+OELmiOelByzggRAQgr
         06Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789141573; x=1789746373; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t8jdA3Xmlz8pa5PufVDvIMhvCutMc2u8NjYS8QpCNrA=;
        b=RVCdqOCCUBLj4c/MFJwZOHp5L70D27zP1tfS8uQEwBirC0iPqEsRMMTsttyDmhdbkO
         RyVrCsyRJMEKrJ0qHPDP5e3K2UFB2lIR2fp00qVvFI23qpYdphEUvmsRvxiKfu088Go+
         jdBjI+OncgWEBszjZ+ZOn8m8QM64r69Z8/moUjkT+8FwjvqdqLP8OD4Ez5NjZGim01td
         LGPcx9xCZHfLmQ141vWQJutiK2YrZ22zby2YEUbyPFmBFd7z1VKpJdfc9rUK1qgEPGzN
         J6umE+xmd7HHc1GQ3K9CnQ+eYHAzshvVnkRKtk63dEX6FVIXeqC/+GFX+RPfBu63yQoU
         LjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141573; x=1789746373;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8jdA3Xmlz8pa5PufVDvIMhvCutMc2u8NjYS8QpCNrA=;
        b=RGu9JcKHQPjbkiKQrhADz0lESxZA0OZT3pi8A5ACd7bAYpjGskP6Mxx9Y/b6y3xR5R
         kt7G9VeDAtp/n0+s4fm0p4e0hcnQ8sEeMdIwdn/CCFY1m0nlOONcdAen0VLxN7nrUP+M
         YrKQHSRovQPE+ci4PjTiTUXFkxGmdM7G7nqvPyNH+XfwUCLmAfL97RbmpCLsFSfnaP9Q
         DAdmFwJGmtlJnejotWqL6jW+W54pZdZoPbKjhemaZAiozSJhILjq5i6OkXyfQDQ5Cfjs
         5YJOSY0PFFwcPfgqoXF/i2FE+dOUOZzVQjOzuOzWhPUwO48FVEIg8YFT6OmNPzyGY5gc
         2T9w==
X-Forwarded-Encrypted: i=1; AKwUvBwmTKG9l12/3N11k0N79R46h3TLQp7oJP/atsHtUPbwzC/j/9lIFeWCw+ss5hz5BgOXgaEIMgsnnjYZtMA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYtz+H8Ct9nQ0pIwpVF0wFYMnbeRJck2rbtLXHIZOZxskt7poO
	l2OC4Sx5s1Hg41Gt6N371byXw+SBU6vdD6ksPR3a3j74G00LDMivt32WmBQGszFdsoSLja49BFZ
	Y8gB8u7/Mxooxmw5G+y0zm9dn6LK7FqY+/Olj1a/i
X-Gm-Gg: AYBFou1AVnUfyh1yxOwFKlh87VsmuueuG4oCP59b/cD1l4pEjF0eyCUSNleZIr/+MPg
	6Z0RARHpP7FzyRCWAmdgRNWvGnKkZsVnW3huQa8Z5k0dZRT1VyVye45Yl31LlzQE+a8p7UVqbyf
	LmKkyORVTFSub5Y3riqGyEno4S+V2pTTBo+tCtJ34CVF0xFpEeirM0km5+wKEJk++W0x8ZXknrI
	Y8BSyu8ecl/NqIAIhMoPHxhgBsS/1AgvGeLwah9a5ZEl7dVkTN4321512CVRzdEKJwQsxoiwsjO
	xBHElFGmvtHcbgrBoBms+GhGr7eXlJfMqbAALb+/i+lvxSS4QcYbttB0mM0q5YWjzaf8FxI2sLF
	R73dJGubu+aiYzIwfxltjOiTGsVFko++epiQjnMBmle5wMRGVI0qhfJs3Zn99xryYPGlUeTDZfn
	E=
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id
 98e67ed59e1d1-39d9c3527b5mr7761778a91.24.1789141571559; Fri, 11 Sep 2026
 08:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:45:58 -0700
X-Gm-Features: AcwNN1WOuQ4I2oNsa_oUXjrkD_mmE6XYHunWmwq41l2K-yX3h1d5rYnHHAg02Vc
Message-ID: <CA+0ovCh+KBdwXx9tJ5jkXAW-LCDRWhnoR8JMfDwC+excC3Xigw@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in vhci_urb_dequeue
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d41ef7065b36fbab"

--000000000000d41ef7065b36fbab
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.577452][ T9485] BUG: KASAN: slab-use-after-free in
vhci_urb_dequeue+0x22a/0x670
[   44.577476][ T9485] Read of size 8 at addr ffff888106a07a80 by task
repro/9485
[   44.577482][ T9485]
[   44.577492][ T9485] CPU: 1 UID: 0 PID: 9485 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.577501][ T9485] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.577509][ T9485] Call Trace:
[   44.577514][ T9485]  <TASK>
[   44.577519][ T9485]  dump_stack_lvl+0xe8/0x150
[   44.577529][ T9485]  print_address_description+0x55/0x1e0
[   44.577537][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.577543][ T9485]  print_report+0x58/0x70
[   44.577549][ T9485]  kasan_report+0x117/0x150
[   44.577561][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.577568][ T9485]  vhci_urb_dequeue+0x22a/0x670
[   44.577576][ T9485]  usb_hcd_unlink_urb+0xe6/0x1e0
[   44.577590][ T9485]  usb_kill_urb+0x10b/0x2f0
[   44.577597][ T9485]  ? __pfx_usb_kill_urb+0x10/0x10
[   44.577606][ T9485]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   44.577617][ T9485]  proc_unlinkurb+0x181/0x1c0
[   44.577625][ T9485]  usbdev_ioctl+0x1002/0x2120
[   44.577637][ T9485]  ? __pfx_usbdev_ioctl+0x10/0x10
[   44.577646][ T9485]  ? __fget_files+0x2a/0x420
[   44.577653][ T9485]  ? __fget_files+0x3a0/0x420
[   44.577659][ T9485]  ? __fget_files+0x2a/0x420
[   44.577666][ T9485]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.577675][ T9485]  ? __pfx_usbdev_ioctl+0x10/0x10
[   44.577684][ T9485]  __se_sys_ioctl+0xfc/0x170
[   44.577694][ T9485]  do_syscall_64+0x155/0x510
[   44.577705][ T9485]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.577712][ T9485]  ? clear_bhb_loop+0x30/0x80
[   44.577720][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.577727][ T9485] RIP: 0033:0x418cdd
[   44.577737][ T9485] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.577745][ T9485] RSP: 002b:00007ffefc645b10 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.577757][ T9485] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000418cdd
[   44.577762][ T9485] RDX: 00000000004d0ba0 RSI: 000000000000550b
RDI: 0000000000000005
[   44.577766][ T9485] RBP: 00007ffefc645b60 R08: 0000000000000000
R09: 0000000000000000
[   44.577770][ T9485] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffefc645d48
[   44.577775][ T9485] R13: 00007ffefc645d58 R14: 0000000000000002
R15: 00000000004caa00
[   44.577782][ T9485]  </TASK>
[   44.577785][ T9485]
[   44.577788][ T9485] Allocated by task 9485:
[   44.577792][ T9485]  kasan_save_track+0x3e/0x80
[   44.577799][ T9485]  __kasan_kmalloc+0x93/0xb0
[   44.577807][ T9485]  __kmalloc_cache_noprof+0x325/0x610
[   44.577815][ T9485]  vhci_urb_enqueue+0x5b9/0xe10
[   44.577826][ T9485]  usb_hcd_submit_urb+0x31f/0x1b40
[   44.577835][ T9485]  proc_do_submiturb+0x294a/0x37e0
[   44.577842][ T9485]  proc_submiturb+0x134/0x1a0
[   44.577847][ T9485]  usbdev_ioctl+0x10b9/0x2120
[   44.577856][ T9485]  __se_sys_ioctl+0xfc/0x170
[   44.577863][ T9485]  do_syscall_64+0x155/0x510
[   44.577872][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.577878][ T9485]
[   44.577880][ T9485] Freed by task 9486:
[   44.577883][ T9485]  kasan_save_track+0x3e/0x80
[   44.577890][ T9485]  kasan_save_free_info+0x46/0x50
[   44.577896][ T9485]  __kasan_slab_free+0x5c/0x80
[   44.577904][ T9485]  kfree+0x1c5/0x650
[   44.577910][ T9485]  pickup_urb_and_free_priv+0x225/0x3f0
[   44.577920][ T9485]  vhci_rx_loop+0x3d3/0xa80
[   44.577928][ T9485]  kthread+0x38b/0x480
[   44.577936][ T9485]  ret_from_fork+0x514/0xb70
[   44.577944][ T9485]  ret_from_fork_asm+0x1a/0x30
[   44.577951][ T9485]
[   44.577953][ T9485] The buggy address belongs to the object at
ffff888106a07a80
[   44.577953][ T9485]  which belongs to the cache kmalloc-64 of size 64
[   44.577960][ T9485] The buggy address is located 0 bytes inside of
[   44.577960][ T9485]  freed 64-byte region [ffff888106a07a80,
ffff888106a07ac0)
[   44.577967][ T9485]
[   44.577969][ T9485] The buggy address belongs to the physical page:
[   44.577977][ T9485] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x106a07
[   44.577984][ T9485] flags: 0x57ff00000000000(node=1|zone=2|lastcpupid=0x7ff)
[   44.577994][ T9485] page_type: f5(slab)
[   44.578003][ T9485] raw: 057ff00000000000 ffff88801b0418c0
dead000000000100 dead000000000122
[   44.578008][ T9485] raw: 0000000000000000 0000000000200020
00000000f5000000 0000000000000000
[   44.578012][ T9485] page dumped because: kasan: bad access detected
[   44.578017][ T9485] page_owner tracks the page as allocated
[   44.578020][ T9485] page last allocated via order 0, migratetype
Unmovable, gfp_mask
0xd2c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 5023, tgid 5023 (9), ts 8687343046
[   44.578031][ T9485]  post_alloc_hook+0x1f9/0x250
[   44.578038][ T9485]  get_page_from_freelist+0x235a/0x23e0
[   44.578047][ T9485]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   44.578055][ T9485]  allocate_slab+0x7d/0x610
[   44.578060][ T9485]  refill_objects+0x2d6/0x350
[   44.578066][ T9485]  __pcs_replace_empty_main+0x2c9/0x6c0
[   44.578075][ T9485]  __kmalloc_noprof+0x48b/0x720
[   44.578082][ T9485]  tomoyo_encode+0x28b/0x550
[   44.578088][ T9485]  tomoyo_realpath_from_path+0x58d/0x5d0
[   44.578094][ T9485]  tomoyo_path_number_perm+0x246/0x630
[   44.578103][ T9485]  security_file_ioctl+0xc3/0x2a0
[   44.578112][ T9485]  __se_sys_ioctl+0x47/0x170
[   44.578119][ T9485]  do_syscall_64+0x155/0x510
[   44.578128][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.578134][ T9485] page last free pid 10 tgid 10 ts 3550973953 stack trace:
[   44.578138][ T9485]  free_pages_prepare+0xa03/0xb00
[   44.578144][ T9485]  __free_contig_range_common+0x174/0x340
[   44.578154][ T9485]  free_pages_bulk+0x48/0x120
[   44.578161][ T9485]  vfree+0x231/0x470
[   44.578167][ T9485]  delayed_vfree_work+0x55/0x80
[   44.578174][ T9485]  process_scheduled_works+0xc99/0x1900
[   44.578184][ T9485]  worker_thread+0xa53/0xfc0
[   44.578190][ T9485]  kthread+0x38b/0x480
[   44.578197][ T9485]  ret_from_fork+0x514/0xb70
[   44.578204][ T9485]  ret_from_fork_asm+0x1a/0x30
[   44.578211][ T9485]
[   44.578212][ T9485] Memory state around the buggy address:
[   44.578216][ T9485]  ffff888106a07980: 00 00 00 00 00 07 fc fc fc
fc fc fc fc fc fc fc
[   44.578221][ T9485]  ffff888106a07a00: 00 00 00 00 00 00 fc fc fc
fc fc fc fc fc fc fc
[   44.578225][ T9485] >ffff888106a07a80: fa fb fb fb fb fb fb fb fc
fc fc fc fc fc fc fc
[   44.578228][ T9485]                    ^
[   44.578231][ T9485]  ffff888106a07b00: fa fb fb fb fb fb fb fb fc
fc fc fc fc fc fc fc
[   44.578236][ T9485]  ffff888106a07b80: fa fb fb fb fb fb fb fb fc
fc fc fc fc fc fc fc
[   44.578239][ T9485]
==================================================================
[   44.578247][ T9485] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   44.637788][ T9485] CPU: 1 UID: 0 PID: 9485 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.638733][ T9485] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.639752][ T9485] Call Trace:
[   44.640062][ T9485]  <TASK>
[   44.640338][ T9485]  vpanic+0x56d/0xa60
[   44.640714][ T9485]  ? __pfx_vpanic+0x10/0x10
[   44.641136][ T9485]  panic+0xc5/0xd0
[   44.641486][ T9485]  ? __pfx_panic+0x10/0x10
[   44.641900][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.642361][ T9485]  ? rcu_is_watching+0x16/0xb0
[   44.642803][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.643265][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.643723][ T9485]  check_panic_on_warn+0x89/0xb0
[   44.644181][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.644639][ T9485]  end_report+0x73/0x170
[   44.645035][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.645519][ T9485]  kasan_report+0x128/0x150
[   44.645962][ T9485]  ? vhci_urb_dequeue+0x22a/0x670
[   44.646446][ T9485]  vhci_urb_dequeue+0x22a/0x670
[   44.646911][ T9485]  usb_hcd_unlink_urb+0xe6/0x1e0
[   44.647369][ T9485]  usb_kill_urb+0x10b/0x2f0
[   44.647787][ T9485]  ? __pfx_usb_kill_urb+0x10/0x10
[   44.648250][ T9485]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   44.648783][ T9485]  proc_unlinkurb+0x181/0x1c0
[   44.649279][ T9485]  usbdev_ioctl+0x1002/0x2120
[   44.649713][ T9485]  ? __pfx_usbdev_ioctl+0x10/0x10
[   44.650181][ T9485]  ? __fget_files+0x2a/0x420
[   44.650609][ T9485]  ? __fget_files+0x3a0/0x420
[   44.651043][ T9485]  ? __fget_files+0x2a/0x420
[   44.651466][ T9485]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.651925][ T9485]  ? __pfx_usbdev_ioctl+0x10/0x10
[   44.652390][ T9485]  __se_sys_ioctl+0xfc/0x170
[   44.652816][ T9485]  do_syscall_64+0x155/0x510
[   44.653247][ T9485]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.653798][ T9485]  ? clear_bhb_loop+0x30/0x80
[   44.654231][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.654769][ T9485] RIP: 0033:0x418cdd
[   44.655132][ T9485] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.656851][ T9485] RSP: 002b:00007ffefc645b10 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.657603][ T9485] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000418cdd
[   44.658316][ T9485] RDX: 00000000004d0ba0 RSI: 000000000000550b
RDI: 0000000000000005
[   44.659092][ T9485] RBP: 00007ffefc645b60 R08: 0000000000000000
R09: 0000000000000000
[   44.659801][ T9485] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffefc645d48
[   44.660518][ T9485] R13: 00007ffefc645d58 R14: 0000000000000002
R15: 00000000004caa00
[   44.661234][ T9485]  </TASK>
[   45.720592][ T9485] Shutting down cpus with NMI
[   45.721627][ T9485] Kernel Offset: disabled
[   45.722182][ T9485] Rebooting in 86400 seconds..

Regards,

--000000000000d41ef7065b36fbab
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx4na6q0>
X-Attachment-Id: f_mtx4na6q0

LyoKICogMjQxLWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi12aGNpLXVyYi1kZXF1
ZXVlCiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8
c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVk
ZSA8ZmNudGwuaD4KI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNs
dWRlIDxzY2hlZC5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxkaXJlbnQuaD4KI2lu
Y2x1ZGUgPHRpbWUuaD4KI2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4KI2luY2x1ZGUgPHN5cy9pb2N0
bC5oPgojaW5jbHVkZSA8YXJwYS9pbmV0Lmg+CiNpbmNsdWRlIDxsaW51eC91c2JkZXZpY2VfZnMu
aD4KCiNkZWZpbmUgVVNCSVBfQ01EX1NVQk1JVCAweDAwMDEKI2RlZmluZSBVU0JJUF9DTURfVU5M
SU5LIDB4MDAwMgojZGVmaW5lIFVTQklQX1JFVF9TVUJNSVQgMHgwMDAzCgojZGVmaW5lIEZBS0Vf
VkVORE9SX0lEICAweDEyMzQKI2RlZmluZSBGQUtFX1BST0RVQ1RfSUQgMHg1Njc4CiNkZWZpbmUg
VVJCU19QRVJfUk9VTkQgIDMyCgpzdGF0aWMgaW50IHVzYmlwX3NlcnZlcl9zb2NrZXQgPSAtMTsK
c3RhdGljIGludCB1c2Jmc19mZCA9IC0xOwoKc3RhdGljIHZvbGF0aWxlIGludCBzZXJ2ZXJfd2l0
aGhvbGRzX3JlcGxpZXM7CnN0YXRpYyB2b2xhdGlsZSBpbnQgd2l0aGhlbGRfdXJiX2NvdW50Owpz
dGF0aWMgdm9sYXRpbGUgaW50IGFsbF91cmJzX2FyZV93aXRoaGVsZDsKc3RhdGljIHZvbGF0aWxl
IGludCByZWxlYXNlX3RoZV9yZXBseV9idXJzdDsKc3RhdGljIHVpbnQzMl90IHdpdGhoZWxkX3Nl
cW51bXNbVVJCU19QRVJfUk9VTkRdOwoKc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgZGV2aWNl
X2Rlc2NyaXB0b3JbMThdID0gewoJMTgsIDEsIDB4MDAsIDB4MDIsIDB4ZmYsIDB4MDAsIDB4MDAs
IDY0LAoJRkFLRV9WRU5ET1JfSUQgJiAweGZmLCBGQUtFX1ZFTkRPUl9JRCA+PiA4LAoJRkFLRV9Q
Uk9EVUNUX0lEICYgMHhmZiwgRkFLRV9QUk9EVUNUX0lEID4+IDgsCgkweDAwLCAweDAxLCAwLCAw
LCAwLCAxCn07CgpzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBjb25maWdfZGVzY3JpcHRvclsx
OF0gPSB7Cgk5LCAyLCAxOCwgMCwgMSwgMSwgMCwgMHg4MCwgMHgzMiwKCTksIDQsIDAsIDAsIDAs
IDB4ZmYsIDB4MDAsIDB4MDAsIDAKfTsKCnN0YXRpYyBpbnQgcmVhZF9mdWxsKGludCBmZCwgdm9p
ZCAqYnVmLCBzaXplX3QgbmJ5dGVzKQp7CglzaXplX3QgZG9uZSA9IDA7CgoJd2hpbGUgKGRvbmUg
PCBuYnl0ZXMpIHsKCQlzc2l6ZV90IGdvdCA9IHJlYWQoZmQsIChjaGFyICopYnVmICsgZG9uZSwg
bmJ5dGVzIC0gZG9uZSk7CgoJCWlmIChnb3QgPD0gMCkgewoJCQlpZiAoZ290IDwgMCAmJiBlcnJu
byA9PSBFSU5UUikKCQkJCWNvbnRpbnVlOwoJCQlyZXR1cm4gLTE7CgkJfQoJCWRvbmUgKz0gZ290
OwoJfQoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgd3JpdGVfZnVsbChpbnQgZmQsIGNvbnN0IHZv
aWQgKmJ1Ziwgc2l6ZV90IG5ieXRlcykKewoJc2l6ZV90IGRvbmUgPSAwOwoKCXdoaWxlIChkb25l
IDwgbmJ5dGVzKSB7CgkJc3NpemVfdCBwdXQgPSB3cml0ZShmZCwgKGNvbnN0IGNoYXIgKilidWYg
KyBkb25lLCBuYnl0ZXMgLSBkb25lKTsKCgkJaWYgKHB1dCA8PSAwKSB7CgkJCWlmIChwdXQgPCAw
ICYmIGVycm5vID09IEVJTlRSKQoJCQkJY29udGludWU7CgkJCXJldHVybiAtMTsKCQl9CgkJZG9u
ZSArPSBwdXQ7Cgl9CglyZXR1cm4gMDsKfQoKc3RhdGljIHZvaWQgbWFrZV9yZXRfc3VibWl0X2hl
YWRlcih1bnNpZ25lZCBjaGFyICpoZWFkZXIsIHVpbnQzMl90IHNlcW51bSwKCQkJCSAgIGludDMy
X3QgYWN0dWFsX2xlbmd0aCkKewoJdWludDMyX3QgKndvcmQgPSAodWludDMyX3QgKiloZWFkZXI7
CgoJbWVtc2V0KGhlYWRlciwgMCwgNDgpOwoJd29yZFswXSA9IGh0b25sKFVTQklQX1JFVF9TVUJN
SVQpOwoJd29yZFsxXSA9IGh0b25sKHNlcW51bSk7CgoJd29yZFs2XSA9IGh0b25sKCh1aW50MzJf
dClhY3R1YWxfbGVuZ3RoKTsKfQoKc3RhdGljIHZvaWQgcGluX3RvX2NwdShpbnQgY3B1KQp7Cglj
cHVfc2V0X3QgY3B1X3NldDsKCglDUFVfWkVSTygmY3B1X3NldCk7CglDUFVfU0VUKGNwdSwgJmNw
dV9zZXQpOwoJc2NoZWRfc2V0YWZmaW5pdHkoMCwgc2l6ZW9mKGNwdV9zZXQpLCAmY3B1X3NldCk7
Cn0KCnN0YXRpYyB2b2lkIGFuc3dlcl9lbnVtZXJhdGlvbl9jb250cm9sKHVpbnQzMl90IHNlcW51
bSwgaW50IGlzX2luLAoJCQkJICAgICAgIGludDMyX3QgcmVxdWVzdGVkX2xlbmd0aCwKCQkJCSAg
ICAgICBjb25zdCB1bnNpZ25lZCBjaGFyICpzZXR1cF9wYWNrZXQpCnsKCXVuc2lnbmVkIGNoYXIg
cmVwbHlbNDggKyAxOF07Cgljb25zdCB1bnNpZ25lZCBjaGFyICpkZXNjcmlwdG9yID0gTlVMTDsK
CWludDMyX3QgcmVwbHlfbGVuZ3RoID0gMDsKCglpZiAoaXNfaW4gJiYgKHNldHVwX3BhY2tldFsw
XSAmIDB4NjApID09IDB4MDAgJiYgc2V0dXBfcGFja2V0WzFdID09IDB4MDYpIHsKCQlpZiAoc2V0
dXBfcGFja2V0WzNdID09IDEpIHsKCQkJZGVzY3JpcHRvciA9IGRldmljZV9kZXNjcmlwdG9yOwoJ
CQlyZXBseV9sZW5ndGggPSBzaXplb2YoZGV2aWNlX2Rlc2NyaXB0b3IpOwoJCX0gZWxzZSBpZiAo
c2V0dXBfcGFja2V0WzNdID09IDIpIHsKCQkJZGVzY3JpcHRvciA9IGNvbmZpZ19kZXNjcmlwdG9y
OwoJCQlyZXBseV9sZW5ndGggPSBzaXplb2YoY29uZmlnX2Rlc2NyaXB0b3IpOwoJCX0KCX0KCWlm
IChyZXBseV9sZW5ndGggPiByZXF1ZXN0ZWRfbGVuZ3RoKQoJCXJlcGx5X2xlbmd0aCA9IHJlcXVl
c3RlZF9sZW5ndGg7CglpZiAocmVwbHlfbGVuZ3RoID4gMCkKCQltZW1jcHkocmVwbHkgKyA0OCwg
ZGVzY3JpcHRvciwgcmVwbHlfbGVuZ3RoKTsKCgltYWtlX3JldF9zdWJtaXRfaGVhZGVyKHJlcGx5
LCBzZXFudW0sIHJlcGx5X2xlbmd0aCk7Cgl3cml0ZV9mdWxsKHVzYmlwX3NlcnZlcl9zb2NrZXQs
IHJlcGx5LCA0OCArIHJlcGx5X2xlbmd0aCk7Cn0KCnN0YXRpYyB2b2lkICp1c2JpcF9zZXJ2ZXJf
dGhyZWFkKHZvaWQgKnVudXNlZCkKewoJdW5zaWduZWQgY2hhciBoZWFkZXJbNDhdOwoJdWludDMy
X3QgKndvcmQgPSAodWludDMyX3QgKiloZWFkZXI7CgoJcGluX3RvX2NwdSgwKTsKCglmb3IgKDs7
KSB7CgkJaWYgKHNlcnZlcl93aXRoaG9sZHNfcmVwbGllcyAmJgoJCSAgICB3aXRoaGVsZF91cmJf
Y291bnQgPj0gVVJCU19QRVJfUk9VTkQpIHsKCQkJdW5zaWduZWQgY2hhciBidXJzdFtVUkJTX1BF
Ul9ST1VORCAqIDQ4XTsKCQkJaW50IGk7CgoJCQlhbGxfdXJic19hcmVfd2l0aGhlbGQgPSAxOwoJ
CQl3aGlsZSAoIXJlbGVhc2VfdGhlX3JlcGx5X2J1cnN0KQoJCQkJOwoJCQlmb3IgKGkgPSAwOyBp
IDwgVVJCU19QRVJfUk9VTkQ7IGkrKykKCQkJCW1ha2VfcmV0X3N1Ym1pdF9oZWFkZXIoYnVyc3Qg
KyBpICogNDgsCgkJCQkJCSAgICAgICB3aXRoaGVsZF9zZXFudW1zW2ldLCAwKTsKCgkJCXdyaXRl
X2Z1bGwodXNiaXBfc2VydmVyX3NvY2tldCwgYnVyc3QsIHNpemVvZihidXJzdCkpOwoJCQlzZXJ2
ZXJfd2l0aGhvbGRzX3JlcGxpZXMgPSAwOwoJCQl3aXRoaGVsZF91cmJfY291bnQgPSAwOwoJCQlh
bGxfdXJic19hcmVfd2l0aGhlbGQgPSAwOwoJCQlyZWxlYXNlX3RoZV9yZXBseV9idXJzdCA9IDA7
CgkJCWNvbnRpbnVlOwoJCX0KCgkJaWYgKHJlYWRfZnVsbCh1c2JpcF9zZXJ2ZXJfc29ja2V0LCBo
ZWFkZXIsIDQ4KSA8IDApCgkJCXJldHVybiBOVUxMOwoKCQl1aW50MzJfdCBjb21tYW5kID0gbnRv
aGwod29yZFswXSk7CgkJdWludDMyX3Qgc2VxbnVtID0gbnRvaGwod29yZFsxXSk7CgoJCWlmIChj
b21tYW5kID09IFVTQklQX0NNRF9TVUJNSVQpIHsKCQkJaW50IGlzX2luID0gbnRvaGwod29yZFsz
XSkgPT0gMTsKCQkJaW50MzJfdCByZXF1ZXN0ZWRfbGVuZ3RoID0gKGludDMyX3QpbnRvaGwod29y
ZFs2XSk7CgoJCQlpZiAoc2VydmVyX3dpdGhob2xkc19yZXBsaWVzICYmCgkJCSAgICB3aXRoaGVs
ZF91cmJfY291bnQgPCBVUkJTX1BFUl9ST1VORCkgewoJCQkJd2l0aGhlbGRfc2VxbnVtc1t3aXRo
aGVsZF91cmJfY291bnRdID0gc2VxbnVtOwoJCQkJd2l0aGhlbGRfdXJiX2NvdW50Kys7CgkJCQlj
b250aW51ZTsKCQkJfQoJCQlhbnN3ZXJfZW51bWVyYXRpb25fY29udHJvbChzZXFudW0sIGlzX2lu
LAoJCQkJCQkgICByZXF1ZXN0ZWRfbGVuZ3RoLCBoZWFkZXIgKyA0MCk7CgkJfSBlbHNlIGlmIChj
b21tYW5kICE9IFVTQklQX0NNRF9VTkxJTkspIHsKCQkJcmV0dXJuIE5VTEw7CgkJfQoKCX0KCXJl
dHVybiBOVUxMOwp9CgpzdGF0aWMgaW50IGF0dGFjaF9zb2NrZXRwYWlyX3RvX3ZoY2kodm9pZCkK
ewoJaW50IHNvY2tldF9wYWlyWzJdLCBhdHRhY2hfZmQsIGNvbW1hbmRfbGVuZ3RoOwoJY2hhciBh
dHRhY2hfY29tbWFuZFs2NF07CgoJaWYgKHNvY2tldHBhaXIoQUZfVU5JWCwgU09DS19TVFJFQU0s
IDAsIHNvY2tldF9wYWlyKSA8IDApCgkJcmV0dXJuIC0xOwoJYXR0YWNoX2ZkID0gb3BlbigiL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL3ZoY2lfaGNkLjAvYXR0YWNoIiwgT19XUk9OTFkpOwoJaWYgKGF0
dGFjaF9mZCA8IDApCgkJcmV0dXJuIC0xOwoKCWNvbW1hbmRfbGVuZ3RoID0gc25wcmludGYoYXR0
YWNoX2NvbW1hbmQsIHNpemVvZihhdHRhY2hfY29tbWFuZCksCgkJCQkgICIwICVkIDEgMyIsIHNv
Y2tldF9wYWlyWzBdKTsKCWlmICh3cml0ZShhdHRhY2hfZmQsIGF0dGFjaF9jb21tYW5kLCBjb21t
YW5kX2xlbmd0aCkgPCAwKSB7CgkJY2xvc2UoYXR0YWNoX2ZkKTsKCQlyZXR1cm4gLTE7Cgl9Cglj
bG9zZShhdHRhY2hfZmQpOwoJdXNiaXBfc2VydmVyX3NvY2tldCA9IHNvY2tldF9wYWlyWzFdOwoJ
cmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgcmVhZF9zeXNmc19hdHRyaWJ1dGUoY29uc3QgY2hhciAq
dXNiX2RldmljZV9uYW1lLAoJCQkJY29uc3QgY2hhciAqYXR0cmlidXRlLCBjaGFyICpvdXQsIHNp
emVfdCBvdXRzeikKewoJY2hhciBwYXRoWzI1Nl07CglpbnQgZmQsIGdvdDsKCglzbnByaW50Zihw
YXRoLCBzaXplb2YocGF0aCksICIvc3lzL2J1cy91c2IvZGV2aWNlcy8lcy8lcyIsCgkJIHVzYl9k
ZXZpY2VfbmFtZSwgYXR0cmlidXRlKTsKCWZkID0gb3BlbihwYXRoLCBPX1JET05MWSk7CglpZiAo
ZmQgPCAwKQoJCXJldHVybiAtMTsKCWdvdCA9IHJlYWQoZmQsIG91dCwgb3V0c3ogLSAxKTsKCWNs
b3NlKGZkKTsKCWlmIChnb3QgPD0gMCkKCQlyZXR1cm4gLTE7CglvdXRbZ290XSA9IDA7CglyZXR1
cm4gMDsKfQoKc3RhdGljIGludCBmaW5kX3VzYmZzX25vZGVfb2ZfZmFrZV9kZXZpY2UoY2hhciAq
b3V0LCBzaXplX3Qgb3V0c3opCnsKCURJUiAqdXNiX2RldmljZXMgPSBvcGVuZGlyKCIvc3lzL2J1
cy91c2IvZGV2aWNlcyIpOwoJc3RydWN0IGRpcmVudCAqZW50cnk7CglpbnQgZm91bmQgPSAwOwoK
CWlmICghdXNiX2RldmljZXMpCgkJcmV0dXJuIC0xOwoJd2hpbGUgKChlbnRyeSA9IHJlYWRkaXIo
dXNiX2RldmljZXMpKSkgewoJCWNoYXIgdmFsdWVbMzJdOwoJCWludCBidXNudW0sIGRldm51bSwg
bm9kZV9mZDsKCgkJaWYgKHJlYWRfc3lzZnNfYXR0cmlidXRlKGVudHJ5LT5kX25hbWUsICJpZFZl
bmRvciIsCgkJCQkJIHZhbHVlLCBzaXplb2YodmFsdWUpKSA8IDAgfHwKCQkgICAgc3RydG9sKHZh
bHVlLCBOVUxMLCAxNikgIT0gRkFLRV9WRU5ET1JfSUQpCgkJCWNvbnRpbnVlOwoJCWlmIChyZWFk
X3N5c2ZzX2F0dHJpYnV0ZShlbnRyeS0+ZF9uYW1lLCAiYnVzbnVtIiwKCQkJCQkgdmFsdWUsIHNp
emVvZih2YWx1ZSkpIDwgMCkKCQkJY29udGludWU7CgkJYnVzbnVtID0gYXRvaSh2YWx1ZSk7CgkJ
aWYgKHJlYWRfc3lzZnNfYXR0cmlidXRlKGVudHJ5LT5kX25hbWUsICJkZXZudW0iLAoJCQkJCSB2
YWx1ZSwgc2l6ZW9mKHZhbHVlKSkgPCAwKQoJCQljb250aW51ZTsKCQlkZXZudW0gPSBhdG9pKHZh
bHVlKTsKCgkJc25wcmludGYob3V0LCBvdXRzeiwgIi9kZXYvYnVzL3VzYi8lMDNkLyUwM2QiLCBi
dXNudW0sIGRldm51bSk7CgkJbm9kZV9mZCA9IG9wZW4ob3V0LCBPX1JEV1IpOwoJCWlmIChub2Rl
X2ZkID49IDApIHsKCQkJY2xvc2Uobm9kZV9mZCk7CgkJCWZvdW5kID0gMTsKCQkJYnJlYWs7CgkJ
fQoJfQoJY2xvc2VkaXIodXNiX2RldmljZXMpOwoJcmV0dXJuIGZvdW5kID8gMCA6IC0xOwp9Cgpp
bnQgbWFpbih2b2lkKQp7CglwdGhyZWFkX3Qgc2VydmVyX3RocmVhZDsKCXN0YXRpYyB1bnNpZ25l
ZCBjaGFyIHNldHVwX3BhY2tldHNbVVJCU19QRVJfUk9VTkRdWzhdOwoJc3RhdGljIHN0cnVjdCB1
c2JkZXZmc191cmIgdXJic1tVUkJTX1BFUl9ST1VORF07CgljaGFyIHVzYmZzX25vZGVfcGF0aFsx
MjhdID0gIiI7Cgl0aW1lX3QgZGVhZGxpbmU7CglpbnQgYXR0ZW1wdDsKCglpZiAoYXR0YWNoX3Nv
Y2tldHBhaXJfdG9fdmhjaSgpIDwgMCkKCQlyZXR1cm4gMTsKCXB0aHJlYWRfY3JlYXRlKCZzZXJ2
ZXJfdGhyZWFkLCBOVUxMLCB1c2JpcF9zZXJ2ZXJfdGhyZWFkLCBOVUxMKTsKCglmb3IgKGF0dGVt
cHQgPSAwOyBhdHRlbXB0IDwgMjAwOyBhdHRlbXB0KyspIHsKCQlpZiAoZmluZF91c2Jmc19ub2Rl
X29mX2Zha2VfZGV2aWNlKHVzYmZzX25vZGVfcGF0aCwKCQkJCQkJICAgc2l6ZW9mKHVzYmZzX25v
ZGVfcGF0aCkpID09IDApCgkJCWJyZWFrOwoJCXVzbGVlcCgxMDAwMDApOwoJfQoJdXNiZnNfZmQg
PSBvcGVuKHVzYmZzX25vZGVfcGF0aCwgT19SRFdSKTsKCWlmICh1c2Jmc19mZCA8IDApCgkJcmV0
dXJuIDE7CgoJcGluX3RvX2NwdSgxKTsKCWRlYWRsaW5lID0gdGltZShOVUxMKSArIDQwOwoJd2hp
bGUgKHRpbWUoTlVMTCkgPCBkZWFkbGluZSkgewoJCWludCBpLCBzdWJtaXR0ZWQgPSAwLCBzcGlu
czsKCgkJd2l0aGhlbGRfdXJiX2NvdW50ID0gMDsKCQlhbGxfdXJic19hcmVfd2l0aGhlbGQgPSAw
OwoJCXJlbGVhc2VfdGhlX3JlcGx5X2J1cnN0ID0gMDsKCQlzZXJ2ZXJfd2l0aGhvbGRzX3JlcGxp
ZXMgPSAxOwoKCQlmb3IgKGkgPSAwOyBpIDwgVVJCU19QRVJfUk9VTkQ7IGkrKykgewoJCQltZW1z
ZXQoJnVyYnNbaV0sIDAsIHNpemVvZih1cmJzW2ldKSk7CgkJCXNldHVwX3BhY2tldHNbaV1bMF0g
PSAweGMwOwoJCQlzZXR1cF9wYWNrZXRzW2ldWzFdID0gMHgwMTsKCQkJdXJic1tpXS50eXBlID0g
VVNCREVWRlNfVVJCX1RZUEVfQ09OVFJPTDsKCQkJdXJic1tpXS5lbmRwb2ludCA9IDA7CgkJCXVy
YnNbaV0uYnVmZmVyID0gc2V0dXBfcGFja2V0c1tpXTsKCgkJCXVyYnNbaV0uYnVmZmVyX2xlbmd0
aCA9IDg7CgkJCWlmIChpb2N0bCh1c2Jmc19mZCwgVVNCREVWRlNfU1VCTUlUVVJCLCAmdXJic1tp
XSkgPT0gMCkKCQkJCXN1Ym1pdHRlZCsrOwoJCX0KCQlpZiAoc3VibWl0dGVkID09IDApCgkJCWJy
ZWFrOwoKCQlmb3IgKHNwaW5zID0gMDsgIWFsbF91cmJzX2FyZV93aXRoaGVsZCAmJiBzcGlucyA8
IDIwMDAwOyBzcGlucysrKQoJCQl1c2xlZXAoMTApOwoJCXJlbGVhc2VfdGhlX3JlcGx5X2J1cnN0
ID0gMTsKCQlpZiAoYWxsX3VyYnNfYXJlX3dpdGhoZWxkKQoJCQlmb3IgKGkgPSAwOyBpIDwgVVJC
U19QRVJfUk9VTkQ7IGkrKykKCQkJCWlvY3RsKHVzYmZzX2ZkLCBVU0JERVZGU19ESVNDQVJEVVJC
LCAmdXJic1tpXSk7CgkJZWxzZQoJCQlzZXJ2ZXJfd2l0aGhvbGRzX3JlcGxpZXMgPSAwOwoJfQoJ
cmV0dXJuIDA7Cn0K
--000000000000d41ef7065b36fbab--
