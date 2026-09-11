Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82F1E7C2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087863; cv=pass; b=bHeFToBjTQzBcv1PhHwpMG4ezZFMEEY46MxFHchWtidLnCQS6MCVysGtrpML9Psi9QEYSR5fNdBMAZeXs4yOy7KDCLmmkeKP1TTq40R5XUbR7OxD88LXfT5SF1YBjoRguJRS6VWwOqRSu/bebh5WHQSiLOacaihq5Psv4XM3Xds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087863; c=relaxed/simple;
	bh=7gBuW1tDU3yKKtHFmuAy2ZPbuZatA14Dsl3bXDCQ7gs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aKtjhTiLmAgkjXVSKDBukJU1fOPsnQ/oqSrYEl5hbbmS5GOj86mgGVK5mhf4Iu3VsM+v4QQ2Ra0iOJHAt/6Z2kGY3MGo73p9WIwPBvUawX8FhUgGYHUrcju0sBrjTICFcUYbBioZ3KvEdcdF3WY5Ndi6TKyNvht1pRIM2QphJD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=K8r8ukSO; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="K8r8ukSO"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so2475505ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789087861; cv=none;
        d=google.com; s=arc-20260327;
        b=gJ2NYHqvwuevmx4DdmDpn/kCyz1W+U3hRTbvX/eWpYWp8PiVnlx3Za1hBxzgKz1k1Q
         rxp0b1Kq3cptVUvtrHxjTlcKvyMVrppG5jH/bMECPN+Ac+I2vY6SiikvK9WvxUSthka9
         h9eaIs+lwPH1jaI6NRpnL9cyzImGZS8bXVyyLeAP1y3vU888KzKmnffnoeXkaNwIcVvT
         4xtI32NyT3bUnr9zSdYqW4Ovxu0fzI/226Xf5nNnbkaPG11UXwVNE4jU+UIYJom/XTfX
         Wl7+gmPsGBhyN6TKL7glGP8O86FnBHh8OTrb0hXyxX8Gu6aRLFWTsVYx/TBZRAXHNmpJ
         Id0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nK59Kzrx/zkadp+kUtxiEkQJ3EPT2Ic16ZxuFRhf9BE=;
        fh=zRGgFeRqc8lr/ZjGXofgO7HOoNp2I7iGKAPv80QqFqo=;
        b=En8Br6jKUEgJSH99JCgr+SCL+P+zVgNMk14yjumLyqnmN/GjJcfAeAqQ/fNdmW9CTe
         CjFl9DEgzuWv8DZABKp7/UTVuPU4wbFctdMlZ2qVxtTwxo/fVIssCxDLrq89oO42O5qL
         w4NONs2E4FtmqqJDz61BjCaXCI/LJGloFzrQo1a6dN2BCpe0ZUh9ib0kA0NY+jdMqVSZ
         ic7QV7n5KiB/GJp6dWTCCcHudRe+gMXIxP0Xdf4jMuSlBpAEYMpyOM0z7Rg9wK8OmYmk
         zhECknuJwWd5STdwQa0/aRVjp7P7dU8sfxc2708DQS4qQ6Mpf4O3OnsJ4PcXmJq41REn
         G5pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789087861; x=1789692661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nK59Kzrx/zkadp+kUtxiEkQJ3EPT2Ic16ZxuFRhf9BE=;
        b=K8r8ukSOOwyIKbSQhUWlAojwaUNMziP3oxtXUq38IwTJBlZEgPMnHoTQJ3DjtfqDzf
         MaStfP+dunJz2rTXK69+W0UAHmkrAGFxl2cRs5IWycUsB7/UQEUROA3X9BA8kyv8Ac/B
         0k2P3gmd+JnZ7Zo0nPnIXRGgxNwOy1HDlzMqrMItVH/bbCN3VLDxkz+NTZKQ3mdTQSa2
         D1ouRf6ZCTh8/S1bHh7K2vtvg9/BPaARQbqEc77yf0/NSY9kemYdA4KEafC4dB5Mia80
         7fKCqhcEfF2QNRSZ/hkzueABUzx0OsPvc9+4TmTT9YmriN5w4tTfMS1u4DBZRiO/G/8V
         K8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087861; x=1789692661;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nK59Kzrx/zkadp+kUtxiEkQJ3EPT2Ic16ZxuFRhf9BE=;
        b=MqrI9nV0qyQRR+e3B9rb5KDB5Qgfi5fhVmW7yeIRUCFJQnBC2I8Zv8KWz3oLTlH5Yo
         YKHWdzp7vPp0vsw3suVh5TUAciDSMSPR+chYJOjXilqxE+woIoAACPO5a3dZxJ/eOu8i
         XJQuiKjOk13DPhpbCHKTHu0fGwHWigdsT+hUwou9Qd3pn/eew6Le+AawrVre7CKVYzUp
         9q8Amrx8v1QuEbxtES+p/pylSVrsGSRO9lJ+AXh0A9dD0ZTcWa1T5x3eQnpDcD1CxsT8
         eUbd6y5RWc5kgD90UFAYHyOJEGQg6m5YNEbZmrJD/UlHaKApfT13lFIDxkJVqhFnsCch
         coxA==
X-Forwarded-Encrypted: i=1; AKwUvByLHohfclYkTfbvM3uM1RTqhQ8D6V4W8hRcZyevtXG5KJvpYkyDdDTyly3lJRH7sbytt2Ukv4c9g1HE2Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1oJPWoNRsD24spbge37DHWrGDISMfJgFLFmQ1HRJwdj98Y5ky
	60RvSnLCqdKQdhxB2wtr7y+Yo1yjKyp7b7IlOxq76Bj6lpknrHJfP6cGKITWfe1wNwbjgGwqARW
	YUfGI8BD21WkmZ/U6/xTNGh7/9tWWazLTZo4RinElSPeFRvDsnLS6/6rFRptJmw==
X-Gm-Gg: AYBFou0e6rq1o3R5NGBUg4Zyh22zsuDx3xpsrPKd+3Mf7hHAGUw4jsqFSwQyHfvYFaO
	exEnyn0kiAV3qTpfd8Pc6EA7x0ViOfxBzknqCvLeKCc0Nks6y61r1pjS7YP7NvR0K+LOKRTuMsS
	kMPdeJlLjjvx1cG+OJN93dcwJF9NV9B0fIuBGG1V2KOL5nv+OdFZk3pBV0cMHuudhrXhnF5MFGb
	eUUkqHbewzd1byyXrXkL/TunAwPW0vsGsk7vKJ20MMuUabc4KAo99zEHPoloXtBN83nuZBomOaT
	x1VbaIewdYRt50NMvYCQ4c/LowAlf6APcsrguogBDXCo+Xaz+VrUGgoHymvAxn1PxpI5yptcsfg
	AVZnFWEt/2K9/kRXAMxv4rbrqeXGbe0X0B1RWpljs
X-Received: by 2002:a17:902:d549:b0:2db:56da:6a0b with SMTP id
 d9443c01a7336-2dd2a34638bmr39864855ad.13.1789087859822; Thu, 10 Sep 2026
 17:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 10 Sep 2026 17:50:48 -0700
X-Gm-Features: AcwNN1VhRlUSbKZ9RVq3NNVAa88MGlca-wfg0_MV4-7zNNAiGaghArEtMCa9Tp4
Message-ID: <CA+0ovCgAXY1onOA8EGSkQwf6veyyRmnqoimzqtFYP4v2gaGAGg@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in vimc_probe
To: Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Farhad Alemi <falemi@asu.edu>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000005bf67b065b2a7afc"

--0000000000005bf67b065b2a7afc
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached; no proposed
patch available yet):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   51.880657][ T9500] BUG: KASAN: slab-use-after-free in
v4l2_device_unregister+0x125/0x270
[   51.880669][ T9500] Read of size 8 at addr ffff88802dc00098 by task
repro/9500
[   51.880676][ T9500]
[   51.880679][ T9500] CPU: 0 UID: 0 PID: 9500 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   51.880688][ T9500] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   51.880693][ T9500] Call Trace:
[   51.880695][ T9500]  <TASK>
[   51.880698][ T9500]  dump_stack_lvl+0xe8/0x150
[   51.880706][ T9500]  print_address_description+0x55/0x1e0
[   51.880714][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   51.880724][ T9500]  print_report+0x58/0x70
[   51.880730][ T9500]  kasan_report+0x117/0x150
[   51.880741][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   51.880751][ T9500]  v4l2_device_unregister+0x125/0x270
[   51.880761][ T9500]  vimc_probe+0x1006/0x1610
[   51.880771][ T9500]  ? __pfx_vimc_probe+0x10/0x10
[   51.880779][ T9500]  platform_probe+0xf9/0x190
[   51.880786][ T9500]  ? __pfx_platform_probe+0x10/0x10
[   51.880792][ T9500]  really_probe+0x267/0xaf0
[   51.880800][ T9500]  __driver_probe_device+0x1e2/0x350
[   51.880808][ T9500]  device_driver_attach+0xe0/0x1d0
[   51.880816][ T9500]  bind_store+0x1d0/0x220
[   51.880823][ T9500]  ? __pfx_sysfs_kf_write+0x10/0x10
[   51.880830][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   51.880840][ T9500]  vfs_write+0x61d/0xb90
[   51.880848][ T9500]  ? __pfx_vfs_write+0x10/0x10
[   51.880856][ T9500]  ? do_sys_openat2+0x14e/0x200
[   51.880864][ T9500]  ? kmem_cache_free+0x182/0x650
[   51.880874][ T9500]  ksys_write+0x150/0x270
[   51.880882][ T9500]  ? __pfx_ksys_write+0x10/0x10
[   51.880890][ T9500]  do_syscall_64+0x155/0x510
[   51.880899][ T9500]  ? trace_irq_disable+0x3b/0x140
[   51.880908][ T9500]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.880914][ T9500]  ? clear_bhb_loop+0x30/0x80
[   51.880922][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.880928][ T9500] RIP: 0033:0x447e86
[   51.880934][ T9500] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   51.880940][ T9500] RSP: 002b:00007fff1bfaa550 EFLAGS: 00000202
ORIG_RAX: 0000000000000001
[   51.880948][ T9500] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000447e86
[   51.880953][ T9500] RDX: 0000000000000006 RSI: 00000000004890ae
RDI: 0000000000000003
[   51.880958][ T9500] RBP: 00007fff1bfaa560 R08: 0000000000000000
R09: 0000000000000000
[   51.880962][ T9500] R10: 0000000000000000 R11: 0000000000000202
R12: 00007fff1bfaa728
[   51.880967][ T9500] R13: 00007fff1bfaa738 R14: 0000000000000002
R15: 00000000004b0140
[   51.880974][ T9500]  </TASK>
[   51.880977][ T9500]
[   51.880981][ T9500] Allocated by task 9500:
[   51.880985][ T9500]  kasan_save_track+0x3e/0x80
[   51.880993][ T9500]  __kasan_kmalloc+0x93/0xb0
[   51.881001][ T9500]  __kmalloc_cache_noprof+0x325/0x610
[   51.881008][ T9500]  vimc_sensor_add+0x5b/0x500
[   51.881013][ T9500]  vimc_probe+0x3f1/0x1610
[   51.881020][ T9500]  platform_probe+0xf9/0x190
[   51.881026][ T9500]  really_probe+0x267/0xaf0
[   51.881032][ T9500]  __driver_probe_device+0x1e2/0x350
[   51.881039][ T9500]  device_driver_attach+0xe0/0x1d0
[   51.881045][ T9500]  bind_store+0x1d0/0x220
[   51.881051][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   51.881059][ T9500]  vfs_write+0x61d/0xb90
[   51.881065][ T9500]  ksys_write+0x150/0x270
[   51.881071][ T9500]  do_syscall_64+0x155/0x510
[   51.881080][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.881086][ T9500]
[   51.881088][ T9500] Freed by task 9500:
[   51.881091][ T9500]  kasan_save_track+0x3e/0x80
[   51.881099][ T9500]  kasan_save_free_info+0x46/0x50
[   51.881105][ T9500]  __kasan_slab_free+0x5c/0x80
[   51.881113][ T9500]  kfree+0x1c5/0x650
[   51.881118][ T9500]  vimc_probe+0x14e2/0x1610
[   51.881126][ T9500]  platform_probe+0xf9/0x190
[   51.881131][ T9500]  really_probe+0x267/0xaf0
[   51.881138][ T9500]  __driver_probe_device+0x1e2/0x350
[   51.881144][ T9500]  device_driver_attach+0xe0/0x1d0
[   51.881151][ T9500]  bind_store+0x1d0/0x220
[   51.881156][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   51.881164][ T9500]  vfs_write+0x61d/0xb90
[   51.881170][ T9500]  ksys_write+0x150/0x270
[   51.881176][ T9500]  do_syscall_64+0x155/0x510
[   51.881185][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   51.881191][ T9500]
[   51.881193][ T9500] The buggy address belongs to the object at
ffff88802dc00000
[   51.881193][ T9500]  which belongs to the cache kmalloc-4k of size 4096
[   51.881203][ T9500] The buggy address is located 152 bytes inside of
[   51.881203][ T9500]  freed 4096-byte region [ffff88802dc00000,
ffff88802dc01000)
[   51.881210][ T9500]
[   51.881212][ T9500] The buggy address belongs to the physical page:
[   51.881218][ T9500] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x2dc00
[   51.881225][ T9500] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   51.881230][ T9500] flags:
0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
[   51.881237][ T9500] page_type: f5(slab)
[   51.881246][ T9500] raw: 00fff00000000040 ffff88801b042140
dead000000000122 0000000000000000
[   51.881252][ T9500] raw: 0000000000000000 0000000000040004
00000000f5000000 0000000000000000
[   51.881258][ T9500] head: 00fff00000000040 ffff88801b042140
dead000000000122 0000000000000000
[   51.881263][ T9500] head: 0000000000000000 0000000000040004
00000000f5000000 0000000000000000
[   51.881269][ T9500] head: 00fff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   51.881275][ T9500] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   51.881278][ T9500] page dumped because: kasan: bad access detected
[   51.881283][ T9500] page_owner tracks the page as allocated
[   51.881286][ T9500] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 9500, tgid 9500 (repro), ts 51865265021
[   51.881298][ T9500]  post_alloc_hook+0x1f9/0x250
[   51.881304][ T9500]  get_page_from_freelist+0x235a/0x23e0
[   51.881312][ T9500]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   51.881320][ T9500]  allocate_slab+0x7d/0x610
[   51.881326][ T9500]  refill_objects+0x2d6/0x350
[   51.881331][ T9500]  __pcs_replace_empty_main+0x2c9/0x6c0
[   51.881340][ T9500]  __kmalloc_noprof+0x48b/0x720
[   51.881347][ T9500]  tomoyo_realpath_from_path+0xe3/0x5d0
[   51.881353][ T9500]  tomoyo_check_open_permission+0x229/0x470
[   51.881363][ T9500]  security_file_open+0xa9/0x240
[   51.881372][ T9500]  do_dentry_open+0x4a8/0x13a0
[   51.881380][ T9500]  vfs_open+0x3b/0x340
[   51.881387][ T9500]  path_openat+0x1569/0x1f30
[   51.881395][ T9500]  do_file_open+0x23e/0x4a0
[   51.881402][ T9500]  do_sys_openat2+0x115/0x200
[   51.881410][ T9500]  __x64_sys_openat+0x138/0x170
[   51.881419][ T9500] page last free pid 9500 tgid 9500 ts
51864729772 stack trace:
[   51.881424][ T9500]  free_pages_prepare+0xa03/0xb00
[   51.881430][ T9500]  __free_contig_range_common+0x174/0x340
[   51.881440][ T9500]  free_pages_bulk+0x48/0x120
[   51.881447][ T9500]  vfree+0x231/0x470
[   51.881453][ T9500]  tpg_free+0x233/0x430
[   51.881460][ T9500]  vimc_sensor_add+0x452/0x500
[   51.881465][ T9500]  vimc_probe+0x3f1/0x1610
[   51.881473][ T9500]  platform_probe+0xf9/0x190
[   51.881480][ T9500]  really_probe+0x267/0xaf0
[   51.881487][ T9500]  __driver_probe_device+0x1e2/0x350
[   51.881493][ T9500]  device_driver_attach+0xe0/0x1d0
[   51.881499][ T9500]  bind_store+0x1d0/0x220
[   51.881505][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   51.881513][ T9500]  vfs_write+0x61d/0xb90
[   51.881519][ T9500]  ksys_write+0x150/0x270
[   51.881526][ T9500]  do_syscall_64+0x155/0x510
[   51.881534][ T9500]
[   51.881536][ T9500] Memory state around the buggy address:
[   51.881540][ T9500]  ffff88802dbfff80: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   51.881550][ T9500]  ffff88802dc00000: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.881555][ T9500] >ffff88802dc00080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.881558][ T9500]                             ^
[   51.881562][ T9500]  ffff88802dc00100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.881566][ T9500]  ffff88802dc00180: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   51.881570][ T9500]
==================================================================
[   51.881587][ T9500] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   54.465107][ T9500] CPU: 0 UID: 0 PID: 9500 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   54.466057][ T9500] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   54.467008][ T9500] Call Trace:
[   54.467319][ T9500]  <TASK>
[   54.467623][ T9500]  vpanic+0x56d/0xa60
[   54.468000][ T9500]  ? __pfx_vpanic+0x10/0x10
[   54.468422][ T9500]  ? __pfx___schedule+0x10/0x10
[   54.468878][ T9500]  panic+0xc5/0xd0
[   54.469225][ T9500]  ? __pfx_panic+0x10/0x10
[   54.469637][ T9500]  ? preempt_schedule_thunk+0x16/0x40
[   54.470160][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   54.470697][ T9500]  check_panic_on_warn+0x89/0xb0
[   54.471174][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   54.471708][ T9500]  end_report+0x73/0x170
[   54.472122][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   54.472655][ T9500]  kasan_report+0x128/0x150
[   54.473094][ T9500]  ? v4l2_device_unregister+0x125/0x270
[   54.473677][ T9500]  v4l2_device_unregister+0x125/0x270
[   54.474175][ T9500]  vimc_probe+0x1006/0x1610
[   54.474599][ T9500]  ? __pfx_vimc_probe+0x10/0x10
[   54.475065][ T9500]  platform_probe+0xf9/0x190
[   54.475547][ T9500]  ? __pfx_platform_probe+0x10/0x10
[   54.476056][ T9500]  really_probe+0x267/0xaf0
[   54.476515][ T9500]  __driver_probe_device+0x1e2/0x350
[   54.477017][ T9500]  device_driver_attach+0xe0/0x1d0
[   54.477485][ T9500]  bind_store+0x1d0/0x220
[   54.477887][ T9500]  ? __pfx_sysfs_kf_write+0x10/0x10
[   54.478366][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   54.478854][ T9500]  vfs_write+0x61d/0xb90
[   54.479248][ T9500]  ? __pfx_vfs_write+0x10/0x10
[   54.479690][ T9500]  ? do_sys_openat2+0x14e/0x200
[   54.480136][ T9500]  ? kmem_cache_free+0x182/0x650
[   54.480595][ T9500]  ksys_write+0x150/0x270
[   54.480992][ T9500]  ? __pfx_ksys_write+0x10/0x10
[   54.481438][ T9500]  do_syscall_64+0x155/0x510
[   54.481871][ T9500]  ? trace_irq_disable+0x3b/0x140
[   54.482335][ T9500]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   54.482888][ T9500]  ? clear_bhb_loop+0x30/0x80
[   54.483320][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   54.483922][ T9500] RIP: 0033:0x447e86
[   54.484285][ T9500] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   54.486046][ T9500] RSP: 002b:00007fff1bfaa550 EFLAGS: 00000202
ORIG_RAX: 0000000000000001
[   54.486836][ T9500] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000447e86
[   54.487557][ T9500] RDX: 0000000000000006 RSI: 00000000004890ae
RDI: 0000000000000003
[   54.488311][ T9500] RBP: 00007fff1bfaa560 R08: 0000000000000000
R09: 0000000000000000
[   54.489080][ T9500] R10: 0000000000000000 R11: 0000000000000202
R12: 00007fff1bfaa728
[   54.489827][ T9500] R13: 00007fff1bfaa738 R14: 0000000000000002
R15: 00000000004b0140
[   54.490578][ T9500]  </TASK>
[   54.491137][ T9500] Kernel Offset: disabled
[   54.491688][ T9500] Rebooting in 86400 seconds..

Regards,
SEFCOM Lab @ ASU

--0000000000005bf67b065b2a7afc
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtw8osxk0>
X-Attachment-Id: f_mtw8osxk0

LyoKICogMjI1LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi12aW1jLXByb2JlCiAq
LwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGli
Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8ZmNu
dGwuaD4KI2luY2x1ZGUgPHN5cy9tb3VudC5oPgojaW5jbHVkZSA8c3lzL3N0YXQuaD4KCi8qCiAq
IHZpbWNfcmVnaXN0ZXJfZGV2aWNlcygpIGVycm9yIHBhdGhzIGNhbGwgdmltY19yZWxlYXNlX3N1
YmRldnMoKSwgd2hpY2ggZnJlZXMKICogZXZlcnkgdmltY19lbnRfZGV2aWNlIHZpYSAtPnJlbGVh
c2UoKS4gIFRoZSBzZW5zb3IvZGViYXllci9zY2FsZXIgdHlwZXMgaGF2ZQogKiBubyAtPnVucmVn
aXN0ZXIgaG9vaywgc28gdGhlaXIgc3RydWN0IHY0bDJfc3ViZGV2IHN0YXlzIGxpbmtlZCBvbgog
KiB2aW1jLT52NGwyX2Rldi5zdWJkZXZzIGFmdGVyIHRoZSBiYWNraW5nIG1lbW9yeSBpcyBnb25l
LCBhbmQgdGhlIHRyYWlsaW5nCiAqIHY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoKSB3YWxrcyB0aGF0
IGxpc3QuICBBbnkgcHJvYmUgZmFpbHVyZSBhZnRlciB0aGUgZmlyc3QKICogZW50aXR5IHJlZ2lz
dGVyZWQgaXRzIHN1YmRldiByZWFjaGVzIGl0LCBzbyBpbmplY3Qgb25lIGFsbG9jYXRpb24gZmFp
bHVyZQogKiBwZXIgYmluZCBhbmQgc3dlZXAgdGhlIGFsbG9jYXRpb24gaW5kZXguCiAqLwpzdGF0
aWMgaW50IHdyaXRlX3N0cmluZ190b19maWxlKGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIg
KnZhbHVlKQp7CglpbnQgZmQgPSBvcGVuKHBhdGgsIE9fV1JPTkxZKTsKCWludCBieXRlc193cml0
dGVuOwoKCWlmIChmZCA8IDApCgkJcmV0dXJuIC0xOwoJYnl0ZXNfd3JpdHRlbiA9IHdyaXRlKGZk
LCB2YWx1ZSwgc3RybGVuKHZhbHVlKSk7CgljbG9zZShmZCk7CglyZXR1cm4gYnl0ZXNfd3JpdHRl
bjsKfQoKaW50IG1haW4odm9pZCkKewoJY2hhciBhbGxvY2F0aW9uX2luZGV4X3RleHRbMzJdOwoJ
aW50IGFsbG9jYXRpb25faW5kZXg7CglpbnQgYmluZF9yZXN1bHQ7CgoJLyoKCSAqIHVkZXYgcnVu
cyB2NGxfaWQgb24gZXZlcnkgL2Rldi92NGwtc3ViZGV2KiBhIHN1Y2Nlc3NmdWwgcHJvYmUgY3Jl
YXRlczsKCSAqIHRoYXQgb3BlbiByYWNlcyB0aGUgdW5iaW5kIGJlbG93IGFuZCB0cmlwcyBhbiB1
bnJlbGF0ZWQgTlVMTCBkZXJlZiBpbgoJICogc3ViZGV2X29wZW4sIGtpbGxpbmcgdGhlIG1hY2hp
bmUgYmVmb3JlIHRoZSBzd2VlcCBnZXRzIGZhciBlbm91Z2guCgkgKi8KCXN5c3RlbSgidWRldmFk
bSBjb250cm9sIC0tc3RvcC1leGVjLXF1ZXVlIik7CgoJbWtkaXIoIi9zeXMva2VybmVsL2RlYnVn
IiwgMDc1NSk7Cgltb3VudCgibm9uZSIsICIvc3lzL2tlcm5lbC9kZWJ1ZyIsICJkZWJ1Z2ZzIiwg
MCwgTlVMTCk7CgoJLyogZmFpbHNsYWIgc2tpcHMgR0ZQX0tFUk5FTCBhbGxvY2F0aW9ucyB1bnRp
bCB0aGlzIGlzIGNsZWFyZWQgKi8KCWlmICh3cml0ZV9zdHJpbmdfdG9fZmlsZSgiL3N5cy9rZXJu
ZWwvZGVidWcvZmFpbHNsYWIvaWdub3JlLWdmcC13YWl0IiwgIk4iKSA8IDApIHsKCQlwcmludGYo
IkNPTkZJR19GQUlMU0xBQiBkZWJ1Z2ZzIGtub2JzIG1pc3NpbmdcbiIpOwoJCXJldHVybiAxOwoJ
fQoKCS8qIHRoZSBkcml2ZXIgYm91bmQgdmltYy4wIGF0IGJvb3Q7IHN0YXJ0IGZyb20gdGhlIHVu
Ym91bmQgc3RhdGUgKi8KCXdyaXRlX3N0cmluZ190b19maWxlKCIvc3lzL2J1cy9wbGF0Zm9ybS9k
cml2ZXJzL3ZpbWMvdW5iaW5kIiwgInZpbWMuMCIpOwoKCS8qCgkgKiBmYWlsLW50aCBpcyBwZXIt
dGFzaywgc28gbm8gb3RoZXIgdGFzayBzZWVzIGFuIGluamVjdGVkIGZhaWx1cmUuICBUaGUKCSAq
IGluZGV4IHRoYXQgbGFuZHMgaW5zaWRlIHZpbWNfcHJvYmUgc2hpZnRzIHdpdGgga2VybmVsIHZl
cnNpb24gLS0gaXQgaXMKCSAqIDE1NiBvbiA3LjMtcmMyIC0tIHNvIHN3ZWVwIGEgcmFuZ2Ugd2l0
aCByb29tIGZvciB0aGF0IGRyaWZ0LgoJICovCglmb3IgKGFsbG9jYXRpb25faW5kZXggPSAxOyBh
bGxvY2F0aW9uX2luZGV4IDw9IDUxMjsgYWxsb2NhdGlvbl9pbmRleCsrKSB7CgkJc25wcmludGYo
YWxsb2NhdGlvbl9pbmRleF90ZXh0LCBzaXplb2YoYWxsb2NhdGlvbl9pbmRleF90ZXh0KSwKCQkJ
ICIlZCIsIGFsbG9jYXRpb25faW5kZXgpOwoJCXdyaXRlX3N0cmluZ190b19maWxlKCIvcHJvYy90
aHJlYWQtc2VsZi9mYWlsLW50aCIsIGFsbG9jYXRpb25faW5kZXhfdGV4dCk7CgkJYmluZF9yZXN1
bHQgPSB3cml0ZV9zdHJpbmdfdG9fZmlsZSgiL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy92aW1j
L2JpbmQiLAoJCQkJCQkgICAidmltYy4wIik7CgkJd3JpdGVfc3RyaW5nX3RvX2ZpbGUoIi9wcm9j
L3RocmVhZC1zZWxmL2ZhaWwtbnRoIiwgIjAiKTsKCQlpZiAoYmluZF9yZXN1bHQgPj0gMCkKCQkJ
LyogcHJvYmUgc3Vydml2ZWQgdGhlIGluamVjdGVkIGZhaWx1cmU7IHVuZG8gaXQgKi8KCQkJd3Jp
dGVfc3RyaW5nX3RvX2ZpbGUoIi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvdmltYy91bmJpbmQi
LAoJCQkJCSAgICAgInZpbWMuMCIpOwoJfQoJcmV0dXJuIDA7Cn0K
--0000000000005bf67b065b2a7afc--
