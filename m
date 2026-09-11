Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB33B9935
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789168471; cv=pass; b=rtkWHZfqMy5y4ZmuY5xz/aLI8+kDNyOThVrHrxkbfz19VryouerqhgCc1zpET2kEjUEBXMQslTXr/MZalh3ALORoBcFjEZw5znJXhwqPdHkQP1wywrGcGT+z2tHo69Ay88N4A4TKS+hXW9SvJ0CrFrEPP0A5CY8iC3X5bDUlIAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789168471; c=relaxed/simple;
	bh=VDOfzze083bPVy+CH5iMM+HVF663RSztfVyYyQ5Mej8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UPiASzGN6xpMeiTG/tHJ2lB5yR3XdBxMWtBculu1btSWKH9Lb9QKKiAy2OvHEHM+n0RFSonInxvh+VbVpq0OVruBa57pUCH/UXwRIIZKJlSJtF66UBJCmUDhYI3y1wkYKVBRzCbll992b4ueugJf0Cn99CGgbwJK0sRZuYzRo4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=QFpNAGCH; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="QFpNAGCH"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so357723b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789168469; cv=none;
        d=google.com; s=arc-20260327;
        b=K73YjEYj5BW1QEIfCGhXAaVeAFDYfwV08dTDZqopvcxkMSuplrmho61ktenO955xLT
         Fmgk4Z4+WGd8X3fr8UFFBNPbJPKNQdxhVnfdyGtrTnwaJKVNFyrdFxBIkzbV88VF9jcF
         aPiw81SuJttTqAZ14qyNI7XermyjCPjGldkuXYA+sn8qPCnOn2i+Eblv0D5Va2e/f+yD
         dsnIycIcre8Qiu4B3isHuryV0SJe2ee3WCuSdj3ifeHgrOD6Sn/FVlwJ6v8DcJ5eNoQU
         gxyLFbsLjxOpa60EuvR9hf/93uXiaXusghCC+m0qEbaCpbRW6S1aZ+GUfmTtGvcB3Igk
         EhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QfK4a4BE7qtodonQ7Fycp74uhSDPGVXQAT6XbAgjqG8=;
        fh=kyNGkUwrz0MBd6AWIcvSifJHcNDQZnkdGnh9MotAcuY=;
        b=GbGmwQ5VDHAXrl2spO/R0OnwXntncBAn21BnBKBhiVtrgDQmRZySJW9W6WhK6ljVmT
         Dple3ogMaWQBR2kkSXTJK1N2lmOCcedoLdbqbqF2k8HH/ZVVOpIx9CBHYQW/0bWM8eyY
         TouS0zGNjIHRZhu5krqKpG9IMzGholHLyqggWexiRbQDLaybpfuaakweXk6XXYojCvCP
         2lKIV4rYTaLIpAMtnXs0JwrXFir3XiyhPja+FZqhf4aENJJLAZkCjYDLQt9EZeeXnAPT
         d0CkQvv5mzttsLToa47V4fBdrqD0bG828FbnAR7K96fk8kp45kwZ4s7kmV0WbVnDfJAJ
         ZwiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789168469; x=1789773269; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfK4a4BE7qtodonQ7Fycp74uhSDPGVXQAT6XbAgjqG8=;
        b=QFpNAGCHlk0eT5VGMz4I1TEW5FllY9ZnMpx0PW8fuj4ZLXWJLvRZJpKvv5wOdB68JU
         w3RLvoBKdV6t2YOCMKXu5otlE9YfMRs/o9A1X2teTPodgSmILYAUYdbN14SUU3Fi+4aG
         2GkHcowJ9rBXbK8qLHY846UXRezIeYjR3vA2zlbtaDI0YB+Jd4b/OKbixZL9Hy+/Jx9n
         rtiv1bJfUtc4AFbek2JJ779ErMXyeEM5dd3zkHfYirZKlFSGv7FSMiYNNohaXBi+a4dC
         H20Vx4GRXHyQIj0U/UXlLEDWS9NoWWVdfUelPGoTFYl/Xsy4k1g3RMKHcnyb3L/2ZvLn
         5yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789168469; x=1789773269;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QfK4a4BE7qtodonQ7Fycp74uhSDPGVXQAT6XbAgjqG8=;
        b=DBr07rhXlnJNrjMrqRgdx70DOLuizMb/qRinxYrDm5xnW2kL6SAS1V1/1lqBRL1vWx
         UIVVN+xXOh7y7HtLFMWQbvRrDxHe158VZhkbtOoQpacmmT5Uru2K2jLY09LjRH2aQEmx
         w4vHmjoYu9mwRZLaibz8qnMLZT9ZLb9tkZJuDjr32GZq9O/gEj/URr+66ULb404ATs/0
         YY3lXNCVUiWKuN2ExQTBvNb1nhz14xbBaDPA/1j/gSte5zSkUwpwnEr64PzSxOen1THo
         ICjo27zIazshTZEdTUNE1RwsTRa+R7Da8fSLfj0l2MxhCZpzIcTK+Eek7HBqls96MztL
         czjA==
X-Forwarded-Encrypted: i=1; AKwUvBzYRXDPbVtiWJ9timRDmRq/tKf0914qpxEbnk0vhYKz0Y4sCdbbId94LD9lEQlDc6n9EafB7Dlf64QuBRc=@vger.kernel.org
X-Gm-Message-State: AFuF++khSrrayqqIYmaLnock/ODMCUUkdNh3+9rMbQVjKmokFtASHpx4
	fMJzOM9dvrE66ovIt2cFHQq+L4NKFNGSjWKthboGeB5NGc2zT7z3Nvhek5nWrqWydJ/r/UpZGbl
	ss48wNjWy4H6MeHc2a+N23LRPzZJ4fDH/aL3ZLi/0
X-Gm-Gg: AYBFou13MuzeiR2XH+BVTlD7Ci8xP7SvURSFyBWvH9hOQ8w5m4vkGwhsvcMa8RPbNBk
	QEjI8GhnwKiYWk1pqLPyKiikSHNQ7dVBoH2yMy9J+HD1eEDsZwaPKIzIzJx3+qEogDsTr6pl+Km
	nrXIS8Rn5eW9Nf1ewIVID5M7Lmedco01G3m9kLxq+2lpn14GgI7ZPKH5enJ7A/9v2VvmNeKQELB
	xHxbpsBLv08DSNdRQFn3SY/9pMx32juWcZ5IGX43iQ4NQ4Bgfwb5gyiedCuajcWGJcekQH10tgV
	5eBKfcBfZ+Xzkl+sItYVivpOemu8EXgeGddMV9aVSRV3MGD8KCL/UPWQndyZbODBSuZn3FSYlxx
	Zl+/VCqcnAt8vATmVmFwpB0STxX/JvfxyTvqiT4d5
X-Received: by 2002:a05:6a20:2588:b0:3d3:adbf:7783 with SMTP id
 adf61e73a8af0-3daed4e4becmr12437436637.24.1789168468001; Fri, 11 Sep 2026
 16:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 16:14:16 -0700
X-Gm-Features: AcwNN1UatdA85TYXYd9CTc2h_6TBmljkXa1QA1h8cqnvDfxqC7OvLxzA-ieEczs
Message-ID: <CA+0ovCjR1WLL923NH9ZRoF2EvYQeeJHJ2PadO1RP3Rf2fvd_DA@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in em28xx_v4l2_close
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fb4bcb065b3d3e47"

--000000000000fb4bcb065b3d3e47
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   75.675164][ T9820] BUG: KASAN: slab-use-after-free in
em28xx_v4l2_close+0xae/0x380
[   75.675269][ T9820] Read of size 8 at addr ffff88810850d0b8 by task
repro/9820
[   75.675297][ T9820]
[   75.675345][ T9820] CPU: 0 UID: 0 PID: 9820 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   75.675384][ T9820] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   75.675417][ T9820] Call Trace:
[   75.675440][ T9820]  <TASK>
[   75.675462][ T9820]  dump_stack_lvl+0xe8/0x150
[   75.675502][ T9820]  print_address_description+0x55/0x1e0
[   75.675537][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.675574][ T9820]  print_report+0x58/0x70
[   75.675603][ T9820]  kasan_report+0x117/0x150
[   75.675649][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.675692][ T9820]  em28xx_v4l2_close+0xae/0x380
[   75.675765][ T9820]  v4l2_release+0x250/0x370
[   75.675795][ T9820]  ? __pfx_v4l2_release+0x10/0x10
[   75.675824][ T9820]  __fput+0x44f/0xa60
[   75.675876][ T9820]  fput_close_sync+0x11f/0x240
[   75.675922][ T9820]  ? __pfx_fput_close_sync+0x10/0x10
[   75.675976][ T9820]  __x64_sys_close+0x7e/0x110
[   75.676006][ T9820]  do_syscall_64+0x155/0x510
[   75.676052][ T9820]  ? trace_irq_disable+0x3b/0x140
[   75.676091][ T9820]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   75.676123][ T9820]  ? clear_bhb_loop+0x30/0x80
[   75.676157][ T9820]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   75.676189][ T9820] RIP: 0033:0x43d422
[   75.676233][ T9820] Code: 08 0f 85 61 eb ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   75.676267][ T9820] RSP: 002b:00007f11d74d9168 EFLAGS: 00000246
ORIG_RAX: 0000000000000003
[   75.676312][ T9820] RAX: ffffffffffffffda RBX: 00007f11d74d96c0
RCX: 000000000043d422
[   75.676336][ T9820] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000004
[   75.676355][ T9820] RBP: 00007f11d74d9190 R08: 0000000000000000
R09: 0000000000000000
[   75.676375][ T9820] R10: 0000000000000000 R11: 0000000000000246
R12: 00007f11d74d96c0
[   75.676395][ T9820] R13: 00007ffddcbf5c40 R14: 00007f11d74d9ce4
R15: 00007ffddcbf5d37
[   75.676430][ T9820]  </TASK>
[   75.676441][ T9820]
[   75.676456][ T9820] Allocated by task 25:
[   75.676472][ T9820]  kasan_save_track+0x3e/0x80
[   75.676510][ T9820]  __kasan_kmalloc+0x93/0xb0
[   75.676547][ T9820]  __kmalloc_cache_noprof+0x325/0x610
[   75.676581][ T9820]  usb_set_configuration+0x3c9/0x2110
[   75.676634][ T9820]  usb_generic_driver_probe+0x8d/0x150
[   75.676669][ T9820]  usb_probe_device+0x1c4/0x3b0
[   75.676720][ T9820]  really_probe+0x267/0xaf0
[   75.676754][ T9820]  __driver_probe_device+0x1e2/0x350
[   75.676784][ T9820]  driver_probe_device+0x4f/0x240
[   75.676816][ T9820]  __device_attach_driver+0x270/0x410
[   75.676848][ T9820]  bus_for_each_drv+0x258/0x2f0
[   75.676886][ T9820]  __device_attach+0x2c5/0x450
[   75.676915][ T9820]  device_initial_probe+0xa1/0xd0
[   75.676944][ T9820]  bus_probe_device+0x12a/0x220
[   75.676983][ T9820]  device_add+0x7ec/0xb90
[   75.677007][ T9820]  usb_new_device+0xa14/0x1720
[   75.677037][ T9820]  hub_event+0x2a1c/0x4f30
[   75.677070][ T9820]  process_scheduled_works+0xc99/0x1900
[   75.677115][ T9820]  worker_thread+0xa53/0xfc0
[   75.677142][ T9820]  kthread+0x38b/0x480
[   75.677174][ T9820]  ret_from_fork+0x514/0xb70
[   75.677206][ T9820]  ret_from_fork_asm+0x1a/0x30
[   75.677240][ T9820]
[   75.677247][ T9820] Freed by task 47:
[   75.677261][ T9820]  kasan_save_track+0x3e/0x80
[   75.677296][ T9820]  kasan_save_free_info+0x46/0x50
[   75.677325][ T9820]  __kasan_slab_free+0x5c/0x80
[   75.677362][ T9820]  kfree+0x1c5/0x650
[   75.677388][ T9820]  device_release+0xc4/0x1f0
[   75.677422][ T9820]  kobject_put+0x228/0x560
[   75.677452][ T9820]  usb_disable_device+0x611/0x8d0
[   75.677485][ T9820]  usb_disconnect+0x32f/0x990
[   75.677513][ T9820]  hub_event+0x1cc9/0x4f30
[   75.677546][ T9820]  process_scheduled_works+0xc99/0x1900
[   75.677589][ T9820]  worker_thread+0xa53/0xfc0
[   75.677615][ T9820]  kthread+0x38b/0x480
[   75.677647][ T9820]  ret_from_fork+0x514/0xb70
[   75.677679][ T9820]  ret_from_fork_asm+0x1a/0x30
[   75.677730][ T9820]
[   75.677737][ T9820] The buggy address belongs to the object at
ffff88810850d000
[   75.677737][ T9820]  which belongs to the cache kmalloc-2k of size 2048
[   75.677774][ T9820] The buggy address is located 184 bytes inside of
[   75.677774][ T9820]  freed 2048-byte region [ffff88810850d000,
ffff88810850d800)
[   75.677807][ T9820]
[   75.677815][ T9820] The buggy address belongs to the physical page:
[   75.677846][ T9820] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0xffff88810850c000 pfn:0x108508
[   75.677886][ T9820] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   75.677912][ T9820] flags:
0x57ff00000000240(workingset|head|node=1|zone=2|lastcpupid=0x7ff)
[   75.677956][ T9820] page_type: f5(slab)
[   75.677994][ T9820] raw: 057ff00000000240 ffff88801b042000
ffffea000425b210 ffffea000409e810
[   75.678022][ T9820] raw: ffff88810850c000 0000000000080004
00000000f5000000 0000000000000000
[   75.678050][ T9820] head: 057ff00000000240 ffff88801b042000
ffffea000425b210 ffffea000409e810
[   75.678077][ T9820] head: ffff88810850c000 0000000000080004
00000000f5000000 0000000000000000
[   75.678104][ T9820] head: 057ff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   75.678129][ T9820] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   75.678145][ T9820] page dumped because: kasan: bad access detected
[   75.678167][ T9820] page_owner tracks the page as allocated
[   75.678179][ T9820] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 1, tgid 1 (swapper/0), ts 5467643024
[   75.678230][ T9820]  post_alloc_hook+0x1f9/0x250
[   75.678262][ T9820]  get_page_from_freelist+0x235a/0x23e0
[   75.678299][ T9820]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   75.678336][ T9820]  allocate_slab+0x7d/0x610
[   75.678361][ T9820]  refill_objects+0x2d6/0x350
[   75.678387][ T9820]  __pcs_replace_empty_main+0x2c9/0x6c0
[   75.678429][ T9820]  __kmalloc_cache_noprof+0x3a5/0x610
[   75.678462][ T9820]  __media_device_register+0x57/0x3c0
[   75.678493][ T9820]  vivid_create_devnodes+0x2037/0x2bf0
[   75.678523][ T9820]  vivid_probe+0x5109/0x7290
[   75.678548][ T9820]  platform_probe+0xf9/0x190
[   75.678575][ T9820]  really_probe+0x267/0xaf0
[   75.678606][ T9820]  __driver_probe_device+0x1e2/0x350
[   75.678636][ T9820]  driver_probe_device+0x4f/0x240
[   75.678667][ T9820]  __driver_attach+0x33c/0x600
[   75.678696][ T9820]  bus_for_each_dev+0x23b/0x2c0
[   75.678747][ T9820] page_owner free stack trace missing
[   75.678767][ T9820]
[   75.678774][ T9820] Memory state around the buggy address:
[   75.678790][ T9820]  ffff88810850cf80: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   75.678811][ T9820]  ffff88810850d000: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   75.678831][ T9820] >ffff88810850d080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   75.678846][ T9820]                                         ^
[   75.678863][ T9820]  ffff88810850d100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   75.678883][ T9820]  ffff88810850d180: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   75.678898][ T9820]
==================================================================
[   75.678931][ T9820] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   75.757208][ T9820] CPU: 0 UID: 0 PID: 9820 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   75.758160][ T9820] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   75.759122][ T9820] Call Trace:
[   75.759432][ T9820]  <TASK>
[   75.759711][ T9820]  vpanic+0x56d/0xa60
[   75.760087][ T9820]  ? __pfx_vpanic+0x10/0x10
[   75.760512][ T9820]  panic+0xc5/0xd0
[   75.760865][ T9820]  ? __pfx_panic+0x10/0x10
[   75.761278][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.761750][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.762215][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.762679][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.763238][ T9820]  check_panic_on_warn+0x89/0xb0
[   75.763699][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.764213][ T9820]  end_report+0x73/0x170
[   75.764610][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.765093][ T9820]  kasan_report+0x128/0x150
[   75.765516][ T9820]  ? em28xx_v4l2_close+0xae/0x380
[   75.765983][ T9820]  em28xx_v4l2_close+0xae/0x380
[   75.766434][ T9820]  v4l2_release+0x250/0x370
[   75.766855][ T9820]  ? __pfx_v4l2_release+0x10/0x10
[   75.767316][ T9820]  __fput+0x44f/0xa60
[   75.767692][ T9820]  fput_close_sync+0x11f/0x240
[   75.768140][ T9820]  ? __pfx_fput_close_sync+0x10/0x10
[   75.768631][ T9820]  __x64_sys_close+0x7e/0x110
[   75.769067][ T9820]  do_syscall_64+0x155/0x510
[   75.769499][ T9820]  ? trace_irq_disable+0x3b/0x140
[   75.769966][ T9820]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   75.770521][ T9820]  ? clear_bhb_loop+0x30/0x80
[   75.770958][ T9820]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   75.771498][ T9820] RIP: 0033:0x43d422
[   75.771866][ T9820] Code: 08 0f 85 61 eb ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   75.773649][ T9820] RSP: 002b:00007f11d74d9168 EFLAGS: 00000246
ORIG_RAX: 0000000000000003
[   75.774409][ T9820] RAX: ffffffffffffffda RBX: 00007f11d74d96c0
RCX: 000000000043d422
[   75.775143][ T9820] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000004
[   75.775928][ T9820] RBP: 00007f11d74d9190 R08: 0000000000000000
R09: 0000000000000000
[   75.776678][ T9820] R10: 0000000000000000 R11: 0000000000000246
R12: 00007f11d74d96c0
[   75.777420][ T9820] R13: 00007ffddcbf5c40 R14: 00007f11d74d9ce4
R15: 00007ffddcbf5d37
[   75.778144][ T9820]  </TASK>
[   75.779091][ T9820] Kernel Offset: disabled
[   75.779640][ T9820] Rebooting in 86400 seconds..

Regards,

--000000000000fb4bcb065b3d3e47
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxehuug0>
X-Attachment-Id: f_mtxehuug0

LyoKICogMjg0LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi1lbTI4eHgtdjRsMi1j
bG9zZQogKi8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRl
IDxlcnJuby5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1
ZGUgPHNpZ25hbC5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5j
bHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5o
PgojaW5jbHVkZSA8c3lzL3N0YXQuaD4KI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiNpbmNsdWRl
IDx1bmlzdGQuaD4KCiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxsaW51eC91
c2IvcmF3X2dhZGdldC5oPgoKI2RlZmluZSBFUDBfTUFYIDEwMjQKI2RlZmluZSBMRTE2KHZhbHVl
KSAoKHZhbHVlKSAmIDB4ZmYpLCAoKCh2YWx1ZSkgPj4gOCkgJiAweGZmKQoKc3RhdGljIGludCBy
YXdfZ2FkZ2V0X2ZkID0gLTE7CnN0YXRpYyB2b2xhdGlsZSBpbnQgd2FudF9nYWRnZXRfZGV0YWNo
OwpzdGF0aWMgdm9sYXRpbGUgaW50IGdhZGdldF9kZXRhY2hlZDsKc3RhdGljIHB0aHJlYWRfdCBl
cDBfcHVtcF90aWQ7CgpzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBk
ZXZpY2VfZGVzY3JpcHRvciA9IHsKCS5iTGVuZ3RoID0gc2l6ZW9mKHN0cnVjdCB1c2JfZGV2aWNl
X2Rlc2NyaXB0b3IpLAoJLmJEZXNjcmlwdG9yVHlwZSA9IFVTQl9EVF9ERVZJQ0UsCgkuYmNkVVNC
ID0gMHgwMjAwLAoJLmJNYXhQYWNrZXRTaXplMCA9IDY0LAoJLmlkVmVuZG9yID0gMHgwY2NkLAoJ
LmlkUHJvZHVjdCA9IDB4MDA5NiwKCS5iY2REZXZpY2UgPSAweDAxMDAsCgkuYk51bUNvbmZpZ3Vy
YXRpb25zID0gMSwKfTsKCnN0YXRpYyBjb25zdCB1aW50OF90IGNvbmZpZ3VyYXRpb25fZGVzY3Jp
cHRvcltdID0gewoKCTksIFVTQl9EVF9DT05GSUcsIExFMTYoOSArIDkgKyA3ICsgOSArIDcpLCAx
LCAxLCAwLCAweGEwLCAweGZhLAoKCTksIFVTQl9EVF9JTlRFUkZBQ0UsIDAsIDAsIDEsIDB4ZmYs
IDB4ZmYsIDB4ZmYsIDAsCgk3LCBVU0JfRFRfRU5EUE9JTlQsIDB4ODIsIFVTQl9FTkRQT0lOVF9Y
RkVSX0lTT0MsIExFMTYoMCksIDEsCgoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwgMSwgMSwgMHhm
ZiwgMHhmZiwgMHhmZiwgMCwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgMHg4MiwgVVNCX0VORFBPSU5U
X1hGRVJfSVNPQywgTEUxNig5NDApLCAxLAp9OwoKc3RhdGljIHZvaWQgc2lndXNyMV9ub3BfaGFu
ZGxlcihpbnQgc2lnbmFsX251bWJlcikgeyAodm9pZClzaWduYWxfbnVtYmVyOyB9CgpzdGF0aWMg
aW50IGZpbmRfdWRjKGNoYXIgKmRyaXZlcl9uYW1lLCBzaXplX3QgZHJpdmVyX3NpemUsCgkJICAg
IGNoYXIgKmRldmljZV9uYW1lLCBzaXplX3QgZGV2aWNlX3NpemUpCnsKCURJUiAqdWRjX2RpciA9
IG9wZW5kaXIoIi9zeXMvY2xhc3MvdWRjIik7CglzdHJ1Y3QgZGlyZW50ICpkaXJfZW50cnk7CgoJ
aWYgKCF1ZGNfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgoZGlyX2VudHJ5ID0gcmVhZGRpcih1
ZGNfZGlyKSkpIHsKCQljaGFyICppbnN0YW5jZV9zdWZmaXg7CgoJCWlmIChkaXJfZW50cnktPmRf
bmFtZVswXSA9PSAnLicpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKGRldmljZV9uYW1lLCBkZXZp
Y2Vfc2l6ZSwgIiVzIiwgZGlyX2VudHJ5LT5kX25hbWUpOwoJCXNucHJpbnRmKGRyaXZlcl9uYW1l
LCBkcml2ZXJfc2l6ZSwgIiVzIiwgZGlyX2VudHJ5LT5kX25hbWUpOwoJCWluc3RhbmNlX3N1ZmZp
eCA9IHN0cnJjaHIoZHJpdmVyX25hbWUsICcuJyk7CgkJaWYgKGluc3RhbmNlX3N1ZmZpeCkKCQkJ
Kmluc3RhbmNlX3N1ZmZpeCA9IDA7CgkJY2xvc2VkaXIodWRjX2Rpcik7CgkJcmV0dXJuIDA7Cgl9
CgljbG9zZWRpcih1ZGNfZGlyKTsKCXJldHVybiAtMTsKfQoKc3RhdGljIHZvaWQgZXAwX3dyaXRl
KGNvbnN0IHZvaWQgKnBheWxvYWQsIHVpbnQzMl90IGxlbmd0aCkKewoJdWludDhfdCBpb19zdG9y
YWdlW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfTUFYXTsKCXN0cnVjdCB1c2Jf
cmF3X2VwX2lvICplcDBfaW8gPSAodm9pZCAqKWlvX3N0b3JhZ2U7CgoJaWYgKGxlbmd0aCA+IEVQ
MF9NQVgpCgkJbGVuZ3RoID0gRVAwX01BWDsKCWVwMF9pby0+ZXAgPSAwOwoJZXAwX2lvLT5mbGFn
cyA9IDA7CgllcDBfaW8tPmxlbmd0aCA9IGxlbmd0aDsKCWlmIChsZW5ndGgpCgkJbWVtY3B5KGVw
MF9pby0+ZGF0YSwgcGF5bG9hZCwgbGVuZ3RoKTsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9S
QVdfSU9DVExfRVAwX1dSSVRFLCBlcDBfaW8pOwp9CgpzdGF0aWMgdm9pZCBlcDBfcmVhZCh1aW50
MzJfdCBsZW5ndGgpCnsKCXVpbnQ4X3QgaW9fc3RvcmFnZVtzaXplb2Yoc3RydWN0IHVzYl9yYXdf
ZXBfaW8pICsgRVAwX01BWF07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqZXAwX2lvID0gKHZvaWQg
Kilpb19zdG9yYWdlOwoKCWlmIChsZW5ndGggPiBFUDBfTUFYKQoJCWxlbmd0aCA9IEVQMF9NQVg7
CgllcDBfaW8tPmVwID0gMDsKCWVwMF9pby0+ZmxhZ3MgPSAwOwoJZXAwX2lvLT5sZW5ndGggPSBs
ZW5ndGg7Cglpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQMF9SRUFELCBlcDBf
aW8pOwp9CgpzdGF0aWMgdm9pZCBoYW5kbGVfY29udHJvbChjb25zdCBzdHJ1Y3QgdXNiX2N0cmxy
ZXF1ZXN0ICpjb250cm9sX3JlcXVlc3QpCnsKCXVpbnQ4X3QgcmVwbHlbRVAwX01BWF07CglpbnQg
cmVwbHlfbGVuZ3RoID0gLTE7Cgl1aW50MTZfdCByZXF1ZXN0ZWRfbGVuZ3RoID0gY29udHJvbF9y
ZXF1ZXN0LT53TGVuZ3RoOwoKCWlmICgoY29udHJvbF9yZXF1ZXN0LT5iUmVxdWVzdFR5cGUgJiBV
U0JfVFlQRV9NQVNLKSA9PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJCXN3aXRjaCAoY29udHJvbF9y
ZXF1ZXN0LT5iUmVxdWVzdCkgewoJCWNhc2UgVVNCX1JFUV9HRVRfREVTQ1JJUFRPUjoKCQkJc3dp
dGNoIChjb250cm9sX3JlcXVlc3QtPndWYWx1ZSA+PiA4KSB7CgkJCWNhc2UgVVNCX0RUX0RFVklD
RToKCQkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihkZXZpY2VfZGVzY3JpcHRvcik7CgkJCQltZW1j
cHkocmVwbHksICZkZXZpY2VfZGVzY3JpcHRvciwgcmVwbHlfbGVuZ3RoKTsKCQkJCWJyZWFrOwoJ
CQljYXNlIFVTQl9EVF9DT05GSUc6CgkJCQlyZXBseV9sZW5ndGggPSBzaXplb2YoY29uZmlndXJh
dGlvbl9kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShyZXBseSwgY29uZmlndXJhdGlvbl9kZXNjcmlw
dG9yLAoJCQkJICAgICAgIHJlcGx5X2xlbmd0aCk7CgkJCQlicmVhazsKCQkJZGVmYXVsdDoKCQkJ
CWJyZWFrOwoJCQl9CgkJCWJyZWFrOwoJCWNhc2UgVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTjoK
CQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9DT05GSUdVUkUsIDApOwoJCQly
ZXBseV9sZW5ndGggPSAwOwoJCQlicmVhazsKCQljYXNlIFVTQl9SRVFfR0VUX0NPTkZJR1VSQVRJ
T046CgkJCXJlcGx5WzBdID0gMTsKCQkJcmVwbHlfbGVuZ3RoID0gMTsKCQkJYnJlYWs7CgkJY2Fz
ZSBVU0JfUkVRX1NFVF9JTlRFUkZBQ0U6CgkJCXJlcGx5X2xlbmd0aCA9IDA7CgkJCWJyZWFrOwoJ
CWNhc2UgVVNCX1JFUV9HRVRfSU5URVJGQUNFOgoJCQlyZXBseVswXSA9IDA7CgkJCXJlcGx5X2xl
bmd0aCA9IDE7CgkJCWJyZWFrOwoJCWNhc2UgVVNCX1JFUV9HRVRfU1RBVFVTOgoJCQlyZXBseVsw
XSA9IDA7CgkJCXJlcGx5WzFdID0gMDsKCQkJcmVwbHlfbGVuZ3RoID0gMjsKCQkJYnJlYWs7CgkJ
ZGVmYXVsdDoKCQkJYnJlYWs7CgkJfQoJfSBlbHNlIGlmIChjb250cm9sX3JlcXVlc3QtPmJSZXF1
ZXN0VHlwZSAmIFVTQl9ESVJfSU4pIHsKCgkJcmVwbHlfbGVuZ3RoID0gcmVxdWVzdGVkX2xlbmd0
aCA+IEVQMF9NQVggPyBFUDBfTUFYCgkJCQkJCQkgIDogcmVxdWVzdGVkX2xlbmd0aDsKCQltZW1z
ZXQocmVwbHksIDAsIHJlcGx5X2xlbmd0aCk7CgoJCWlmIChjb250cm9sX3JlcXVlc3QtPmJSZXF1
ZXN0ID09IDAgJiYKCQkgICAgY29udHJvbF9yZXF1ZXN0LT53SW5kZXggPT0gMHgwYSAmJiByZXBs
eV9sZW5ndGggPj0gMSkKCQkJcmVwbHlbMF0gPSAzNDsKCX0gZWxzZSB7CgkJcmVwbHlfbGVuZ3Ro
ID0gMDsKCX0KCglpZiAocmVwbHlfbGVuZ3RoIDwgMCkgewoJCWlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfRVAwX1NUQUxMLCAwKTsKCQlyZXR1cm47Cgl9CglpZiAoY29udHJvbF9y
ZXF1ZXN0LT5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKSB7CgkJaWYgKHJlcGx5X2xlbmd0aCA+
IHJlcXVlc3RlZF9sZW5ndGgpCgkJCXJlcGx5X2xlbmd0aCA9IHJlcXVlc3RlZF9sZW5ndGg7CgkJ
ZXAwX3dyaXRlKHJlcGx5LCAodWludDMyX3QpcmVwbHlfbGVuZ3RoKTsKCX0gZWxzZSB7CgkJZXAw
X3JlYWQocmVxdWVzdGVkX2xlbmd0aCk7Cgl9Cn0KCnN0YXRpYyB2b2lkIHVuYmluZF9hbGxfdml2
aWRfaW5zdGFuY2VzKHZvaWQpCnsKCURJUiAqdml2aWRfZGlyID0gb3BlbmRpcigiL3N5cy9idXMv
cGxhdGZvcm0vZHJpdmVycy92aXZpZCIpOwoJc3RydWN0IGRpcmVudCAqZGlyX2VudHJ5OwoJY2hh
ciBpbnN0YW5jZV9uYW1lc1sxNl1bNjRdOwoJaW50IGluc3RhbmNlX2NvdW50ID0gMCwgaW5kZXg7
CgoJaWYgKCF2aXZpZF9kaXIpCgkJcmV0dXJuOwoJd2hpbGUgKChkaXJfZW50cnkgPSByZWFkZGly
KHZpdmlkX2RpcikpICYmIGluc3RhbmNlX2NvdW50IDwgMTYpIHsKCQlpZiAoc3RybmNtcChkaXJf
ZW50cnktPmRfbmFtZSwgInZpdmlkIiwgNSkpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKGluc3Rh
bmNlX25hbWVzW2luc3RhbmNlX2NvdW50KytdLCA2NCwgIiVzIiwKCQkJIGRpcl9lbnRyeS0+ZF9u
YW1lKTsKCX0KCWNsb3NlZGlyKHZpdmlkX2Rpcik7Cglmb3IgKGluZGV4ID0gMDsgaW5kZXggPCBp
bnN0YW5jZV9jb3VudDsgaW5kZXgrKykgewoJCWludCB1bmJpbmRfZmQgPSBvcGVuKCIvc3lzL2J1
cy9wbGF0Zm9ybS9kcml2ZXJzL3ZpdmlkL3VuYmluZCIsCgkJCQkgICAgIE9fV1JPTkxZKTsKCgkJ
aWYgKHVuYmluZF9mZCA8IDApCgkJCXJldHVybjsKCQl3cml0ZSh1bmJpbmRfZmQsIGluc3RhbmNl
X25hbWVzW2luZGV4XSwKCQkgICAgICBzdHJsZW4oaW5zdGFuY2VfbmFtZXNbaW5kZXhdKSk7CgkJ
Y2xvc2UodW5iaW5kX2ZkKTsKCX0KfQoKc3RhdGljIGludCB1bmJpbmRfZW0yOHh4X2ludGVyZmFj
ZSh2b2lkKQp7CglESVIgKmRyaXZlcl9kaXIgPSBvcGVuZGlyKCIvc3lzL2J1cy91c2IvZHJpdmVy
cy9lbTI4eHgiKTsKCXN0cnVjdCBkaXJlbnQgKmRpcl9lbnRyeTsKCWNoYXIgaW50ZXJmYWNlX25h
bWVbNjRdID0gIiI7CglpbnQgdW5iaW5kX2ZkOwoKCWlmICghZHJpdmVyX2RpcikKCQlyZXR1cm4g
LTE7Cgl3aGlsZSAoKGRpcl9lbnRyeSA9IHJlYWRkaXIoZHJpdmVyX2RpcikpKSB7CgkJaWYgKHN0
cmNocihkaXJfZW50cnktPmRfbmFtZSwgJzonKSkgewoJCQlzbnByaW50ZihpbnRlcmZhY2VfbmFt
ZSwgc2l6ZW9mKGludGVyZmFjZV9uYW1lKSwgIiVzIiwKCQkJCSBkaXJfZW50cnktPmRfbmFtZSk7
CgkJCWJyZWFrOwoJCX0KCX0KCWNsb3NlZGlyKGRyaXZlcl9kaXIpOwoJaWYgKCFpbnRlcmZhY2Vf
bmFtZVswXSkKCQlyZXR1cm4gLTE7CgoJdW5iaW5kX2ZkID0gb3BlbigiL3N5cy9idXMvdXNiL2Ry
aXZlcnMvZW0yOHh4L3VuYmluZCIsIE9fV1JPTkxZKTsKCWlmICh1bmJpbmRfZmQgPCAwKQoJCXJl
dHVybiAtMTsKCWlmICh3cml0ZSh1bmJpbmRfZmQsIGludGVyZmFjZV9uYW1lLCBzdHJsZW4oaW50
ZXJmYWNlX25hbWUpKSA8IDApIHsKCQljbG9zZSh1bmJpbmRfZmQpOwoJCXJldHVybiAtMTsKCX0K
CWNsb3NlKHVuYmluZF9mZCk7CglyZXR1cm4gMDsKfQoKI2RlZmluZSBNQVhfVklERU9fTUlOT1Ig
MjU2CnN0YXRpYyB1bnNpZ25lZCBjaGFyIHZpZGVvX25vZGVfZXhpc3RlZFtNQVhfVklERU9fTUlO
T1JdOwoKc3RhdGljIHZvaWQgc25hcHNob3RfdmlkZW9fbm9kZXModm9pZCkKewoJaW50IG1pbm9y
OwoJY2hhciBub2RlX3BhdGhbNjRdOwoJc3RydWN0IHN0YXQgbm9kZV9zdGF0OwoKCWZvciAobWlu
b3IgPSAwOyBtaW5vciA8IE1BWF9WSURFT19NSU5PUjsgbWlub3IrKykgewoJCXNucHJpbnRmKG5v
ZGVfcGF0aCwgc2l6ZW9mKG5vZGVfcGF0aCksICIvZGV2L3ZpZGVvJWQiLCBtaW5vcik7CgkJdmlk
ZW9fbm9kZV9leGlzdGVkW21pbm9yXSA9IChzdGF0KG5vZGVfcGF0aCwgJm5vZGVfc3RhdCkgPT0g
MCk7Cgl9Cn0KCnN0YXRpYyBpbnQgb3Blbl9uZXdfdmlkZW9fbm9kZSh2b2lkKQp7CglzdHJ1Y3Qg
c3RhdCBub2RlX3N0YXQ7CglpbnQgYXR0ZW1wdCwgbWlub3IsIG5vZGVfZmQgPSAtMTsKCWNoYXIg
bm9kZV9wYXRoWzY0XTsKCglmb3IgKGF0dGVtcHQgPSAwOyBhdHRlbXB0IDwgMTUwICYmIG5vZGVf
ZmQgPCAwOyBhdHRlbXB0KyspIHsKCQl1c2xlZXAoMTAwMDAwKTsKCQlmb3IgKG1pbm9yID0gMDsg
bWlub3IgPCBNQVhfVklERU9fTUlOT1I7IG1pbm9yKyspIHsKCQkJaWYgKHZpZGVvX25vZGVfZXhp
c3RlZFttaW5vcl0pCgkJCQljb250aW51ZTsKCQkJc25wcmludGYobm9kZV9wYXRoLCBzaXplb2Yo
bm9kZV9wYXRoKSwgIi9kZXYvdmlkZW8lZCIsCgkJCQkgbWlub3IpOwoJCQlpZiAoc3RhdChub2Rl
X3BhdGgsICZub2RlX3N0YXQpICE9IDApCgkJCQljb250aW51ZTsKCQkJdXNsZWVwKDQwMDAwMCk7
CgkJCW5vZGVfZmQgPSBvcGVuKG5vZGVfcGF0aCwgT19SRFdSIHwgT19OT05CTE9DSyk7CgkJCWlm
IChub2RlX2ZkIDwgMCkKCQkJCXZpZGVvX25vZGVfZXhpc3RlZFttaW5vcl0gPSAxOwoJCQlicmVh
azsKCQl9Cgl9CglyZXR1cm4gbm9kZV9mZDsKfQoKI2RlZmluZSBLRVlfUEFZTE9BRF9CWVRFUyAx
MDAwCiNkZWZpbmUgRFJBSU5fQ1BVUyAyCiNkZWZpbmUgRFJBSU5fUk9VTkRTIDYwCiNkZWZpbmUg
S0VZU19QRVJfUk9VTkQgNTAwMAojZGVmaW5lIE9DQ1VQWV9LRVlTIDgwMDAwCgojZGVmaW5lIEtF
WV9TUEVDX1RIUkVBRF9LRVlSSU5HICgtMSkKI2RlZmluZSBLRVlDVExfQ0xFQVIgNwojZGVmaW5l
IF9fTlJfYWRkX2tleV94ODZfNjQgMjQ4CiNkZWZpbmUgX19OUl9rZXljdGxfeDg2XzY0IDI1MAoK
c3RhdGljIGxvbmcgYWRkX3VzZXJfa2V5KGNvbnN0IGNoYXIgKmRlc2NyaXB0aW9uLCBjb25zdCB2
b2lkICpwYXlsb2FkLAoJCQkgc2l6ZV90IHBheWxvYWRfbGVuZ3RoKQp7CglyZXR1cm4gc3lzY2Fs
bChfX05SX2FkZF9rZXlfeDg2XzY0LCAidXNlciIsIGRlc2NyaXB0aW9uLCBwYXlsb2FkLAoJCSAg
ICAgICBwYXlsb2FkX2xlbmd0aCwgS0VZX1NQRUNfVEhSRUFEX0tFWVJJTkcpOwp9CgpzdGF0aWMg
bG9uZyBjbGVhcl90aHJlYWRfa2V5cmluZyh2b2lkKQp7CglyZXR1cm4gc3lzY2FsbChfX05SX2tl
eWN0bF94ODZfNjQsIEtFWUNUTF9DTEVBUiwKCQkgICAgICAgS0VZX1NQRUNfVEhSRUFEX0tFWVJJ
TkcpOwp9CgpzdGF0aWMgdm9pZCByYWlzZV9rZXlfbGltaXRzKHZvaWQpCnsKCXN0YXRpYyBjb25z
dCBjaGFyICpjb25zdCBsaW1pdF9maWxlc1tdID0gewoJCSIvcHJvYy9zeXMva2VybmVsL2tleXMv
cm9vdF9tYXhrZXlzIiwKCQkiL3Byb2Mvc3lzL2tlcm5lbC9rZXlzL3Jvb3RfbWF4Ynl0ZXMiLAoJ
CSIvcHJvYy9zeXMva2VybmVsL2tleXMvbWF4a2V5cyIsCgkJIi9wcm9jL3N5cy9rZXJuZWwva2V5
cy9tYXhieXRlcyIsCgl9OwoJaW50IGluZGV4LCBsaW1pdF9mZDsKCglmb3IgKGluZGV4ID0gMDsg
aW5kZXggPCA0OyBpbmRleCsrKSB7CgkJbGltaXRfZmQgPSBvcGVuKGxpbWl0X2ZpbGVzW2luZGV4
XSwgT19XUk9OTFkpOwoJCWlmIChsaW1pdF9mZCA8IDApCgkJCWNvbnRpbnVlOwoJCXdyaXRlKGxp
bWl0X2ZkLCAiMTAwMDAwMDAwMCIsIDEwKTsKCQljbG9zZShsaW1pdF9mZCk7Cgl9Cn0KCnN0YXRp
YyB2b2lkICpkcmFpbl9xdWFyYW50aW5lX29uX2NwdSh2b2lkICpjcHVfYXNfcG9pbnRlcikKewoJ
bG9uZyBjcHUgPSAobG9uZyljcHVfYXNfcG9pbnRlcjsKCWNwdV9zZXRfdCBjcHVfbWFzazsKCWNo
YXIgcGF5bG9hZFtLRVlfUEFZTE9BRF9CWVRFU107CgljaGFyIGtleV9uYW1lWzY0XTsKCWludCBy
b3VuZCwga2V5X2luZGV4OwoKCUNQVV9aRVJPKCZjcHVfbWFzayk7CglDUFVfU0VUKChpbnQpY3B1
LCAmY3B1X21hc2spOwoJcHRocmVhZF9zZXRhZmZpbml0eV9ucChwdGhyZWFkX3NlbGYoKSwgc2l6
ZW9mKGNwdV9tYXNrKSwgJmNwdV9tYXNrKTsKCW1lbXNldChwYXlsb2FkLCAwLCBzaXplb2YocGF5
bG9hZCkpOwoKCWZvciAocm91bmQgPSAwOyByb3VuZCA8IERSQUlOX1JPVU5EUzsgcm91bmQrKykg
ewoJCWZvciAoa2V5X2luZGV4ID0gMDsga2V5X2luZGV4IDwgS0VZU19QRVJfUk9VTkQ7IGtleV9p
bmRleCsrKSB7CgkJCXNucHJpbnRmKGtleV9uYW1lLCBzaXplb2Yoa2V5X25hbWUpLCAiZHJhaW4t
JWxkLSVkLSVkIiwKCQkJCSBjcHUsIHJvdW5kLCBrZXlfaW5kZXgpOwoJCQlpZiAoYWRkX3VzZXJf
a2V5KGtleV9uYW1lLCBwYXlsb2FkLCBzaXplb2YocGF5bG9hZCkpIDwgMCkKCQkJCWJyZWFrOwoJ
CX0KCQljbGVhcl90aHJlYWRfa2V5cmluZygpOwoJfQoJcmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyB2
b2lkIGRyYWluX3F1YXJhbnRpbmUodm9pZCkKewoJcHRocmVhZF90IGRyYWluX3RocmVhZHNbRFJB
SU5fQ1BVU107Cglsb25nIGNwdTsKCglmb3IgKGNwdSA9IDA7IGNwdSA8IERSQUlOX0NQVVM7IGNw
dSsrKQoJCXB0aHJlYWRfY3JlYXRlKCZkcmFpbl90aHJlYWRzW2NwdV0sIE5VTEwsCgkJCSAgICAg
ICBkcmFpbl9xdWFyYW50aW5lX29uX2NwdSwgKHZvaWQgKiljcHUpOwoJZm9yIChjcHUgPSAwOyBj
cHUgPCBEUkFJTl9DUFVTOyBjcHUrKykKCQlwdGhyZWFkX2pvaW4oZHJhaW5fdGhyZWFkc1tjcHVd
LCBOVUxMKTsKfQoKc3RhdGljIHZvaWQgb2NjdXB5X3JlY3ljbGVkX2NodW5rcyh2b2lkKQp7Cglj
aGFyIHBheWxvYWRbS0VZX1BBWUxPQURfQllURVNdOwoJY2hhciBrZXlfbmFtZVs2NF07CglpbnQg
a2V5X2luZGV4OwoKCW1lbXNldChwYXlsb2FkLCAwLCBzaXplb2YocGF5bG9hZCkpOwoJZm9yIChr
ZXlfaW5kZXggPSAwOyBrZXlfaW5kZXggPCBPQ0NVUFlfS0VZUzsga2V5X2luZGV4KyspIHsKCQlz
bnByaW50ZihrZXlfbmFtZSwgc2l6ZW9mKGtleV9uYW1lKSwgIm9jY3VweS0lZCIsIGtleV9pbmRl
eCk7CgkJaWYgKGFkZF91c2VyX2tleShrZXlfbmFtZSwgcGF5bG9hZCwgc2l6ZW9mKHBheWxvYWQp
KSA8IDApCgkJCWJyZWFrOwoJfQp9CgpzdGF0aWMgdm9pZCAqZHJpdmVfdGVhcmRvd24odm9pZCAq
dW51c2VkKQp7CglpbnQgdmlkZW9fZmQ7CgoJKHZvaWQpdW51c2VkOwoJdmlkZW9fZmQgPSBvcGVu
X25ld192aWRlb19ub2RlKCk7CglpZiAodmlkZW9fZmQgPCAwKSB7CgkJd2FudF9nYWRnZXRfZGV0
YWNoID0gMTsKCQlwdGhyZWFkX2tpbGwoZXAwX3B1bXBfdGlkLCBTSUdVU1IxKTsKCQlyZXR1cm4g
TlVMTDsKCX0KCgl1bmJpbmRfZW0yOHh4X2ludGVyZmFjZSgpOwoJdXNsZWVwKDUwMDAwMCk7CgoJ
ZHJhaW5fcXVhcmFudGluZSgpOwoJb2NjdXB5X3JlY3ljbGVkX2NodW5rcygpOwoKCXdhbnRfZ2Fk
Z2V0X2RldGFjaCA9IDE7CglwdGhyZWFkX2tpbGwoZXAwX3B1bXBfdGlkLCBTSUdVU1IxKTsKCXdo
aWxlICghZ2FkZ2V0X2RldGFjaGVkKQoJCXVzbGVlcCg1MDAwMCk7Cgl1c2xlZXAoNTAwMDAwKTsK
CgljbG9zZSh2aWRlb19mZCk7CglyZXR1cm4gTlVMTDsKfQoKaW50IG1haW4odm9pZCkKewoJY2hh
ciB1ZGNfZHJpdmVyX25hbWVbMTI4XSwgdWRjX2RldmljZV9uYW1lWzEyOF07CglzdHJ1Y3QgdXNi
X3Jhd19pbml0IHJhd19nYWRnZXRfaW5pdDsKCXB0aHJlYWRfdCB0ZWFyZG93bl90aWQ7CglzdHJ1
Y3Qgc2lnYWN0aW9uIHNpZ3VzcjFfYWN0aW9uOwoJdWludDhfdCBldmVudF9zdG9yYWdlW3NpemVv
ZihzdHJ1Y3QgdXNiX3Jhd19ldmVudCkgKyBFUDBfTUFYXTsKCXN0cnVjdCB1c2JfcmF3X2V2ZW50
ICpldmVudCA9ICh2b2lkICopZXZlbnRfc3RvcmFnZTsKCgltZW1zZXQoJnNpZ3VzcjFfYWN0aW9u
LCAwLCBzaXplb2Yoc2lndXNyMV9hY3Rpb24pKTsKCXNpZ3VzcjFfYWN0aW9uLnNhX2hhbmRsZXIg
PSBzaWd1c3IxX25vcF9oYW5kbGVyOwoJc2lnYWN0aW9uKFNJR1VTUjEsICZzaWd1c3IxX2FjdGlv
biwgTlVMTCk7CgoJc3lzdGVtKCJzeXN0ZW1jdGwgc3RvcCBzeXN0ZW1kLXVkZXZkLnNlcnZpY2Ug
c3lzdGVtZC11ZGV2ZC1rZXJuZWwuc29ja2V0ICIKCSAgICAgICAic3lzdGVtZC11ZGV2ZC1jb250
cm9sLnNvY2tldCA+L2Rldi9udWxsIDI+JjEiKTsKCXN5c3RlbSgidWRldmFkbSBjb250cm9sIC0t
ZXhpdCA+L2Rldi9udWxsIDI+JjEiKTsKCXN5c3RlbSgicGtpbGwgLVNUT1AgLXggc3lzdGVtZC11
ZGV2ZCA+L2Rldi9udWxsIDI+JjEiKTsKCgl1bmJpbmRfYWxsX3ZpdmlkX2luc3RhbmNlcygpOwoJ
cmFpc2Vfa2V5X2xpbWl0cygpOwoKCXN5c3RlbSgibW9kcHJvYmUgZHVtbXlfaGNkID4vZGV2L251
bGwgMj4mMSIpOwoJc3lzdGVtKCJtb2Rwcm9iZSByYXdfZ2FkZ2V0ID4vZGV2L251bGwgMj4mMSIp
OwoKCWlmIChmaW5kX3VkYyh1ZGNfZHJpdmVyX25hbWUsIHNpemVvZih1ZGNfZHJpdmVyX25hbWUp
LAoJCSAgICAgdWRjX2RldmljZV9uYW1lLCBzaXplb2YodWRjX2RldmljZV9uYW1lKSkgPCAwKQoJ
CXJldHVybiAxOwoKCWVwMF9wdW1wX3RpZCA9IHB0aHJlYWRfc2VsZigpOwoJc25hcHNob3Rfdmlk
ZW9fbm9kZXMoKTsKCglyYXdfZ2FkZ2V0X2ZkID0gb3BlbigiL2Rldi9yYXctZ2FkZ2V0IiwgT19S
RFdSKTsKCWlmIChyYXdfZ2FkZ2V0X2ZkIDwgMCkKCQlyZXR1cm4gMTsKCW1lbXNldCgmcmF3X2dh
ZGdldF9pbml0LCAwLCBzaXplb2YocmF3X2dhZGdldF9pbml0KSk7CglzdHJuY3B5KChjaGFyICop
cmF3X2dhZGdldF9pbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJc2l6ZW9mKHJh
d19nYWRnZXRfaW5pdC5kcml2ZXJfbmFtZSkgLSAxKTsKCXN0cm5jcHkoKGNoYXIgKilyYXdfZ2Fk
Z2V0X2luaXQuZGV2aWNlX25hbWUsIHVkY19kZXZpY2VfbmFtZSwKCQlzaXplb2YocmF3X2dhZGdl
dF9pbml0LmRldmljZV9uYW1lKSAtIDEpOwoJcmF3X2dhZGdldF9pbml0LnNwZWVkID0gVVNCX1NQ
RUVEX0hJR0g7CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9JTklULCAm
cmF3X2dhZGdldF9pbml0KSA8IDApCgkJcmV0dXJuIDE7CglpZiAoaW9jdGwocmF3X2dhZGdldF9m
ZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwgMCkKCQlyZXR1cm4gMTsKCglwdGhyZWFkX2NyZWF0
ZSgmdGVhcmRvd25fdGlkLCBOVUxMLCBkcml2ZV90ZWFyZG93biwgTlVMTCk7CgoJd2hpbGUgKCF3
YW50X2dhZGdldF9kZXRhY2gpIHsKCQlldmVudC0+dHlwZSA9IDA7CgkJZXZlbnQtPmxlbmd0aCA9
IEVQMF9NQVg7CgkJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVZFTlRf
RkVUQ0gsIGV2ZW50KSA8IDApIHsKCQkJaWYgKGVycm5vID09IEVJTlRSKQoJCQkJY29udGludWU7
CgkJCWJyZWFrOwoJCX0KCQlpZiAoZXZlbnQtPnR5cGUgPT0gVVNCX1JBV19FVkVOVF9DT05UUk9M
KQoJCQloYW5kbGVfY29udHJvbCgoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqKWV2ZW50LT5kYXRh
KTsKCQllbHNlIGlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0RJU0NPTk5FQ1QpCgkJ
CWJyZWFrOwoJfQoKCWNsb3NlKHJhd19nYWRnZXRfZmQpOwoJcmF3X2dhZGdldF9mZCA9IC0xOwoJ
Z2FkZ2V0X2RldGFjaGVkID0gMTsKCXB0aHJlYWRfam9pbih0ZWFyZG93bl90aWQsIE5VTEwpOwoJ
cmV0dXJuIDA7Cn0K
--000000000000fb4bcb065b3d3e47--
