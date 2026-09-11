Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26D7415F17
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141063; cv=pass; b=mOnzdcC6LAOPuQDiLWln48S2fKZJb1iis44/N4PAlW2coPkEvQl7wEwf9LXMReG4j32VdEdaHMnvR5V6GUORbImUSg//hWxHh142vffGycU4CvDxO+MtaRTXD5ApjP2NO15DIdRL9CX9TBW/9RHeUgil4SGXoK4+agkmcr+3mj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141063; c=relaxed/simple;
	bh=brfo6pUmtJwywIAx/t9imtyEoqN2n96T5LpDL+aIAVM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bHGUnASPCa4NwALulPNjysp2zdxTGv6R7d8yqhVYEvMXDeEpSt0hAl0EzpY1zXsUxp0mew2wayU5nUkJwqyYBvBFOQ8I77KZCUjxd55NI6lnU6sAuIUs8Wc0ypYGlutHQ2CR3CBpP6YLRuJ/7SHoNoL6IqBWQ4PPkMLFrcko/mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=UEJq9UcZ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="UEJq9UcZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6f9e2f681so12607015ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141061; cv=none;
        d=google.com; s=arc-20260327;
        b=oKuVfVENc8gUysCxHCinzOcV9sSTEV631dhj2xMP6eVkORTh7L6bnvRSrhrgyyZqGo
         FUlcYpOFq/M4IaO4jfe21H3CL4E0APfITwZT2Qp3zNDWbXLw7HQUIWnyWE7S9WSZimAp
         l4gxHMquM4X0ezsLFfkS/8z3zC59fJlOEFhhGTQvb8c79Ixd5TKetjs1WfMyGG8GSUYT
         XIgs6H7fOFobm7nOWOFnB+VITNqqDDEeIoBtLLIPFwcVyr63cC1Qfu/rX8UpHtow2VF6
         HkgLJ6uyQZN6Mvu75bUAPF3TfcJAoCvWauRt1sv1tdjlbgxgQwRmuI0uABoeityDPku0
         XUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NLf4NoMsTIKZRmdlIKtcLBfQ7nGY1iEF8Dodv+UGTRc=;
        fh=sekstyKQ+NOcdf0Pqu3QimxpPhE+z2QyHCUsMq0Orcs=;
        b=O9hsvf1f5B4y8SieLA6qnJvID0AFVRiiot/2gcIff65esJkSGcVCXDTg99Sy7UiAda
         vgsDwCVp/i4NAq1M9ZXNSgkuJ7w9SjczrEP33chxXJ/w9b7nPmuOZRx7+s70TWEn/R/t
         XwAyFcrMWcjf9ByAXTA2Sg3ocrmGaenlCxnLY3kR5D2/tEEcVPrm6jVgnzxeIrtU6sv3
         vRBB7OD8f2j06WVy7wCREqk2OwyPDOHQ7Y2H0yk/LClJOeFWjXKjPjE0tgEs4IiPSqNi
         yaCPCX3Fkd89+Jur01ff0Nv1S1ePyVJF7SzcVleiyw6KPgltupTnAap42VvmiA/S+MMh
         f4rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789141061; x=1789745861; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLf4NoMsTIKZRmdlIKtcLBfQ7nGY1iEF8Dodv+UGTRc=;
        b=UEJq9UcZY70GRQHxFrj4LgD4/6Zv7zgDaM5N32zI7bgVeKl64O1hjf2Y75VPpTN7rP
         dgkJz/XigkO8UquLLVQTK3UXUKCWXUs2IK0lUJDJtPqS3uZOcXLO9E8HsQawmkn/UU8V
         aLhvIaXJVBXg1eLyyUv81OV9Fu5lLV0kM83ffSnmJR9Tw9QmKKeTt/+891LhEqjMqvKa
         7Y/pf1+e4WD3BVeWI6Kitink4gfVF6D/Pze3CfwR2d86wDX+CnLJEwzDWM7/YTsX4kcn
         Q/2bYaGDr0VSOjy5oRQzQRrIJnU29TRUgoAEZEz/sABOmrMopdgppwk472D7ZHRyLxTO
         1k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141061; x=1789745861;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NLf4NoMsTIKZRmdlIKtcLBfQ7nGY1iEF8Dodv+UGTRc=;
        b=D48RfBK4doLxc2J7nY90itk9/kRd3GcfoYqlZIphpBrsGottVmsTE2yDUes2s9o8SA
         HaqwGWncUmQAOAEjpnMYZFYyS+GlPbWnNTvwFkMTe9gEdocnAr9TU7nRKH5EXmNA+ehg
         nt2aYOT+GaCX/VppHm6oFZAX+T6qa4VI4qddQiqv4xlfREckZSLB5PZXxRoQCHLMsMKb
         Mki3E3Vl0M9kOg7iBrLlitIDqakV6areW5jgFpcExYQdp2Y5i1XYVTjxW/y/vaKfiT8q
         9Mr6FxFbix7BX4KXjA9FUSHfMc33ZJKpEzwygolgEegAsskv7b0y0e3m4todELu+TJTV
         bNHw==
X-Forwarded-Encrypted: i=1; AKwUvBy09J28ADNu0pTMeEZ86crNfgeLrCTm10ItOJOStZkVRs1/UjhlPwiJl4ifKhNN+F5bcXcqFkbjd9ZNRPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcJt88U90in9R24c0zsPc4Ix1Ib4yP5iiKBvOCzFDgR0PcF8kz
	3XpaL4nktSn32XuJ+NH6ogozBtLjbNofflTaJD8oC958jUaMNZjEMIqFdo1so3pAYVSLgB90aVe
	QQyhGsNEgc3dEgB0DyUWij5Dg5GWQ1aJJLahissPjS0+ks3uUQpo0CJdI
X-Gm-Gg: AYBFou25+13eNB8LhYOpY0B3t28BiSqMLpooWMIN656m0Ruoa2Jo+unsyHdgwNWxtAn
	4YHEHZDs9u5VNL6GCqcyy6n8937lV4OXoLSzGh8IaWjI75r/WwKtfYUOSsBIPlVvpUI22E1fj1h
	iHAGK0pDdFXLNPJ8eXyAWepszG0lkLRdVfUZwqfgb3SisAT/IgXi4lh5DxNnY4GhdetFOWRLTSX
	wecWW/w/OgVi0jOVLTle2J8Ejma2aS0Meckb5zamBqZvX7p3GYYFv6KNivhU2cqyvGjmxq9Dvd2
	XIV0Mwwx8W4U8I4RbEqpQ2uRC4TgJCieMv+zQwNQpm5gxJog2SU5PyExbLH9IDf2f1/y/lE/Dqg
	d82g6/uLmpKHGtFPHMgkeh+c08GrOJsJYdGGAKY2AcD+xSFnSVEgXpAf3hJQuBCsMpcU6w/sJGj
	Q=
X-Received: by 2002:a17:903:98f:b0:2dd:1701:3b6e with SMTP id
 d9443c01a7336-2dd2a357fc6mr92577405ad.16.1789141059852; Fri, 11 Sep 2026
 08:37:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:37:28 -0700
X-Gm-Features: AcwNN1Uhwt0hUKM3RipulwaKU-vlcMfx3AedQ2hr36WgKRfYUaKyPq2P0Alt17M
Message-ID: <CA+0ovCi_G7yq8QqpP6vTw404cC4L7oRsD-JbOVQUANNAFQw6vA@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Write in msp_remove
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000054344f065b36dd2b"

--00000000000054344f065b36dd2b
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   47.456977][ T9485] BUG: KASAN: slab-use-after-free in
kthread_stop+0xb0/0x5b0
[   47.457064][ T9485] Write of size 4 at addr ffff88802a218028 by
task repro/9485
[   47.457092][ T9485]
[   47.457131][ T9485] CPU: 0 UID: 0 PID: 9485 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.457170][ T9485] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.457203][ T9485] Call Trace:
[   47.457223][ T9485]  <TASK>
[   47.457244][ T9485]  dump_stack_lvl+0xe8/0x150
[   47.457283][ T9485]  print_address_description+0x55/0x1e0
[   47.457319][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.457351][ T9485]  print_report+0x58/0x70
[   47.457380][ T9485]  kasan_report+0x117/0x150
[   47.457427][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.457465][ T9485]  kasan_check_range+0x264/0x2c0
[   47.457511][ T9485]  kthread_stop+0xb0/0x5b0
[   47.457546][ T9485]  msp_remove+0x95/0xd0
[   47.457590][ T9485]  i2c_device_remove+0x88/0x220
[   47.457618][ T9485]  ? __pfx_i2c_device_remove+0x10/0x10
[   47.457648][ T9485]  device_release_driver_internal+0x46f/0x870
[   47.457702][ T9485]  bus_remove_device+0x455/0x570
[   47.457749][ T9485]  ? __pfx_bus_remove_device+0x10/0x10
[   47.457795][ T9485]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.457842][ T9485]  device_del+0x527/0x8f0
[   47.457879][ T9485]  ? __pfx_device_del+0x10/0x10
[   47.457909][ T9485]  ? __dev_fwnode+0x50/0x80
[   47.457957][ T9485]  ? device_remove_software_node+0x42/0x160
[   47.457992][ T9485]  device_unregister+0x21/0xf0
[   47.458025][ T9485]  delete_device_store+0x43e/0x500
[   47.458066][ T9485]  ? __pfx_delete_device_store+0x10/0x10
[   47.458103][ T9485]  ? sysfs_file_kobj+0x1e4/0x230
[   47.458134][ T9485]  ? sysfs_kf_write+0x166/0x260
[   47.458168][ T9485]  ? __pfx_sysfs_kf_write+0x10/0x10
[   47.458200][ T9485]  kernfs_fop_write_iter+0x3af/0x540
[   47.458249][ T9485]  vfs_write+0x61d/0xb90
[   47.458289][ T9485]  ? __pfx_vfs_write+0x10/0x10
[   47.458329][ T9485]  ? __fget_files+0x2a/0x420
[   47.458365][ T9485]  ksys_write+0x150/0x270
[   47.458400][ T9485]  ? __pfx_ksys_write+0x10/0x10
[   47.458441][ T9485]  do_syscall_64+0x155/0x510
[   47.458487][ T9485]  ? trace_irq_disable+0x3b/0x140
[   47.458527][ T9485]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.458560][ T9485]  ? clear_bhb_loop+0x30/0x80
[   47.458595][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.458626][ T9485] RIP: 0033:0x43ca82
[   47.458669][ T9485] Code: 08 0f 85 41 df ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   47.458703][ T9485] RSP: 002b:00007ffca70bb398 EFLAGS: 00000246
ORIG_RAX: 0000000000000001
[   47.458748][ T9485] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000043ca82
[   47.458772][ T9485] RDX: 0000000000000004 RSI: 00000000004a110a
RDI: 0000000000000004
[   47.458791][ T9485] RBP: 00007ffca70bb3c0 R08: 0000000000000000
R09: 0000000000000000
[   47.458811][ T9485] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffca70bb978
[   47.458832][ T9485] R13: 00007ffca70bb988 R14: 0000000000000002
R15: 00000000004caa00
[   47.458865][ T9485]  </TASK>
[   47.458876][ T9485]
[   47.458895][ T9485] Allocated by task 2:
[   47.458910][ T9485]  kasan_save_track+0x3e/0x80
[   47.458973][ T9485]  __kasan_slab_alloc+0x6c/0x80
[   47.459011][ T9485]  kmem_cache_alloc_node_noprof+0x358/0x610
[   47.459045][ T9485]  dup_task_struct+0x52/0xa00
[   47.459071][ T9485]  copy_process+0x777/0x4330
[   47.459095][ T9485]  kernel_clone+0x2d7/0x940
[   47.459122][ T9485]  kernel_thread+0x13f/0x1b0
[   47.459149][ T9485]  kthreadd+0x4ec/0x6e0
[   47.459177][ T9485]  ret_from_fork+0x514/0xb70
[   47.459209][ T9485]  ret_from_fork_asm+0x1a/0x30
[   47.459243][ T9485]
[   47.459250][ T9485] Freed by task 0:
[   47.459264][ T9485]  kasan_save_track+0x3e/0x80
[   47.459298][ T9485]  kasan_save_free_info+0x46/0x50
[   47.459334][ T9485]  __kasan_slab_free+0x5c/0x80
[   47.459370][ T9485]  kmem_cache_free+0x182/0x650
[   47.459404][ T9485]  rcu_core+0x985/0x1250
[   47.459442][ T9485]  handle_softirqs+0x22c/0x860
[   47.459467][ T9485]  __irq_exit_rcu+0xcb/0x220
[   47.459492][ T9485]  irq_exit_rcu+0x9/0x30
[   47.459517][ T9485]  sysvec_apic_timer_interrupt+0xa6/0xc0
[   47.459557][ T9485]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   47.459587][ T9485]
[   47.459594][ T9485] Last potentially related work creation:
[   47.459606][ T9485]  kasan_save_stack+0x3e/0x60
[   47.459640][ T9485]  kasan_record_aux_stack+0xbd/0xd0
[   47.459669][ T9485]  call_rcu+0xee/0x890
[   47.459709][ T9485]  rcu_core+0x985/0x1250
[   47.459745][ T9485]  handle_softirqs+0x22c/0x860
[   47.459770][ T9485]  __irq_exit_rcu+0xcb/0x220
[   47.459795][ T9485]  irq_exit_rcu+0x9/0x30
[   47.459819][ T9485]  sysvec_apic_timer_interrupt+0xa6/0xc0
[   47.459859][ T9485]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   47.459889][ T9485]
[   47.459896][ T9485] Second to last potentially related work creation:
[   47.459908][ T9485]  kasan_save_stack+0x3e/0x60
[   47.459958][ T9485]  kasan_record_aux_stack+0xbd/0xd0
[   47.459986][ T9485]  call_rcu+0xee/0x890
[   47.460026][ T9485]  __schedule+0x187a/0x5930
[   47.460062][ T9485]  schedule_idle+0x51/0x90
[   47.460098][ T9485]  do_idle+0x4ad/0x540
[   47.460128][ T9485]  cpu_startup_entry+0x43/0x60
[   47.460161][ T9485]  start_secondary+0x101/0x110
[   47.460193][ T9485]  common_startup_64+0x13e/0x157
[   47.460235][ T9485]
[   47.460242][ T9485] The buggy address belongs to the object at
ffff88802a218000
[   47.460242][ T9485]  which belongs to the cache task_struct of size 9480
[   47.460278][ T9485] The buggy address is located 40 bytes inside of
[   47.460278][ T9485]  freed 9480-byte region [ffff88802a218000,
ffff88802a21a508)
[   47.460310][ T9485]
[   47.460319][ T9485] The buggy address belongs to the physical page:
[   47.460350][ T9485] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x2a218
[   47.460381][ T9485] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   47.460405][ T9485] memcg:ffff88802a21f2c1
[   47.460420][ T9485] flags:
0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
[   47.460463][ T9485] page_type: f5(slab)
[   47.460501][ T9485] raw: 00fff00000000040 ffff888100018000
dead000000000100 dead000000000122
[   47.460528][ T9485] raw: 0000000000000000 0000000200030003
00000000f5000000 ffff88802a21f2c1
[   47.460556][ T9485] head: 00fff00000000040 ffff888100018000
dead000000000100 dead000000000122
[   47.460583][ T9485] head: 0000000000000000 0000000200030003
00000000f5000000 ffff88802a21f2c1
[   47.460610][ T9485] head: 00fff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   47.460636][ T9485] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   47.460652][ T9485] page dumped because: kasan: bad access detected
[   47.460674][ T9485] page_owner tracks the page as allocated
[   47.460686][ T9485] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 5428, tgid 5428 ((udev-worker)), ts 34366220313
[   47.460738][ T9485]  post_alloc_hook+0x1f9/0x250
[   47.460769][ T9485]  get_page_from_freelist+0x235a/0x23e0
[   47.460807][ T9485]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   47.460844][ T9485]  allocate_slab+0x7d/0x610
[   47.460868][ T9485]  refill_objects+0x2d6/0x350
[   47.460893][ T9485]  __pcs_replace_empty_main+0x2c9/0x6c0
[   47.460935][ T9485]  kmem_cache_alloc_node_noprof+0x441/0x610
[   47.460986][ T9485]  dup_task_struct+0x52/0xa00
[   47.461011][ T9485]  copy_process+0x777/0x4330
[   47.461034][ T9485]  kernel_clone+0x2d7/0x940
[   47.461061][ T9485]  __x64_sys_clone+0x1b6/0x230
[   47.461090][ T9485]  do_syscall_64+0x155/0x510
[   47.461130][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.461159][ T9485] page last free pid 5057 tgid 5057 ts
33546286148 stack trace:
[   47.461181][ T9485]  __free_frozen_pages+0xc9f/0xd90
[   47.461212][ T9485]  __slab_free+0x274/0x2c0
[   47.461244][ T9485]  qlist_free_all+0x99/0x100
[   47.461278][ T9485]  kasan_quarantine_reduce+0x148/0x160
[   47.461313][ T9485]  __kasan_slab_alloc+0x22/0x80
[   47.461350][ T9485]  kmem_cache_alloc_node_noprof+0x358/0x610
[   47.461383][ T9485]  __alloc_skb+0x1d4/0x7d0
[   47.461417][ T9485]  netlink_sendmsg+0x5d4/0xb40
[   47.461444][ T9485]  sock_sendmsg_nosec+0x13a/0x180
[   47.461473][ T9485]  ____sys_sendmsg+0x589/0x8c0
[   47.461511][ T9485]  ___sys_sendmsg+0x2a5/0x360
[   47.461548][ T9485]  __x64_sys_sendmsg+0x1b1/0x290
[   47.461587][ T9485]  do_syscall_64+0x155/0x510
[   47.461628][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.461657][ T9485]
[   47.461664][ T9485] Memory state around the buggy address:
[   47.461681][ T9485]  ffff88802a217f00: ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
[   47.461701][ T9485]  ffff88802a217f80: ff ff ff ff ff ff ff ff ff
ff ff ff ff ff ff ff
[   47.461721][ T9485] >ffff88802a218000: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.461737][ T9485]                                   ^
[   47.461753][ T9485]  ffff88802a218080: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.461773][ T9485]  ffff88802a218100: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   47.461788][ T9485]
==================================================================
[   47.463486][ T9485] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   47.555510][ T9485] CPU: 0 UID: 0 PID: 9485 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.556461][ T9485] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.557450][ T9485] Call Trace:
[   47.557759][ T9485]  <TASK>
[   47.558037][ T9485]  vpanic+0x56d/0xa60
[   47.558412][ T9485]  ? __pfx_vpanic+0x10/0x10
[   47.558834][ T9485]  panic+0xc5/0xd0
[   47.559187][ T9485]  ? __pfx_panic+0x10/0x10
[   47.559598][ T9485]  ? preempt_schedule_thunk+0x16/0x40
[   47.560096][ T9485]  ? preempt_schedule_thunk+0x16/0x40
[   47.560589][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.561018][ T9485]  check_panic_on_warn+0x89/0xb0
[   47.561476][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.561917][ T9485]  end_report+0x73/0x170
[   47.562314][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.562739][ T9485]  kasan_report+0x128/0x150
[   47.563163][ T9485]  ? kthread_stop+0xb0/0x5b0
[   47.563590][ T9485]  kasan_check_range+0x264/0x2c0
[   47.564052][ T9485]  kthread_stop+0xb0/0x5b0
[   47.564463][ T9485]  msp_remove+0x95/0xd0
[   47.564914][ T9485]  i2c_device_remove+0x88/0x220
[   47.565364][ T9485]  ? __pfx_i2c_device_remove+0x10/0x10
[   47.565862][ T9485]  device_release_driver_internal+0x46f/0x870
[   47.566419][ T9485]  bus_remove_device+0x455/0x570
[   47.566877][ T9485]  ? __pfx_bus_remove_device+0x10/0x10
[   47.567381][ T9485]  ? kernfs_remove_by_name_ns+0x101/0x140
[   47.567904][ T9485]  device_del+0x527/0x8f0
[   47.568308][ T9485]  ? __pfx_device_del+0x10/0x10
[   47.568757][ T9485]  ? __dev_fwnode+0x50/0x80
[   47.569180][ T9485]  ? device_remove_software_node+0x42/0x160
[   47.569718][ T9485]  device_unregister+0x21/0xf0
[   47.570160][ T9485]  delete_device_store+0x43e/0x500
[   47.570630][ T9485]  ? __pfx_delete_device_store+0x10/0x10
[   47.571146][ T9485]  ? sysfs_file_kobj+0x1e4/0x230
[   47.571617][ T9485]  ? sysfs_kf_write+0x166/0x260
[   47.572066][ T9485]  ? __pfx_sysfs_kf_write+0x10/0x10
[   47.572541][ T9485]  kernfs_fop_write_iter+0x3af/0x540
[   47.573030][ T9485]  vfs_write+0x61d/0xb90
[   47.573423][ T9485]  ? __pfx_vfs_write+0x10/0x10
[   47.573865][ T9485]  ? __fget_files+0x2a/0x420
[   47.574298][ T9485]  ksys_write+0x150/0x270
[   47.574765][ T9485]  ? __pfx_ksys_write+0x10/0x10
[   47.575218][ T9485]  do_syscall_64+0x155/0x510
[   47.575647][ T9485]  ? trace_irq_disable+0x3b/0x140
[   47.576116][ T9485]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.576670][ T9485]  ? clear_bhb_loop+0x30/0x80
[   47.577105][ T9485]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.577689][ T9485] RIP: 0033:0x43ca82
[   47.578084][ T9485] Code: 08 0f 85 41 df ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   47.579884][ T9485] RSP: 002b:00007ffca70bb398 EFLAGS: 00000246
ORIG_RAX: 0000000000000001
[   47.580695][ T9485] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000043ca82
[   47.581467][ T9485] RDX: 0000000000000004 RSI: 00000000004a110a
RDI: 0000000000000004
[   47.582224][ T9485] RBP: 00007ffca70bb3c0 R08: 0000000000000000
R09: 0000000000000000
[   47.582980][ T9485] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffca70bb978
[   47.583729][ T9485] R13: 00007ffca70bb988 R14: 0000000000000002
R15: 00000000004caa00
[   47.584484][ T9485]  </TASK>
[   47.585205][ T9485] Kernel Offset: disabled
[   47.585796][ T9485] Rebooting in 86400 seconds..

Regards,

--00000000000054344f065b36dd2b
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx4c5l20>
X-Attachment-Id: f_mtx4c5l20

LyoKICogMjM5LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtd3JpdGUtaW4tbXNwLXJlbW92ZQog
Ki8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxlcnJu
by5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHN0
ZGludC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8
c3RyaW5nLmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgoKI2lu
Y2x1ZGUgPGxpbnV4L3VzYi9jaDkuaD4KI2luY2x1ZGUgPGxpbnV4L3VzYi9yYXdfZ2FkZ2V0Lmg+
CgojZGVmaW5lIEVQMF9NQVhfVFJBTlNGRVIgMTAyNAovKiBpMmMtdGlueS11c2IgdmVuZG9yIHJl
cXVlc3RzIChkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRpbnktdXNiLmMpICovCiNkZWZpbmUgQ01E
X0dFVF9GVU5DCQkxCiNkZWZpbmUgQ01EX1NFVF9ERUxBWQkJMgojZGVmaW5lIENNRF9HRVRfU1RB
VFVTCQkzCiNkZWZpbmUgQ01EX0kyQ19JTwkJNAkvKiBsb3cgMiBiaXRzIGNhcnJ5IGJlZ2luL2Vu
ZCBmbGFncyAqLwoKI2RlZmluZSBTVEFUVVNfQUREUkVTU19BQ0sJMQojZGVmaW5lIFNUQVRVU19B
RERSRVNTX05BSwkyCgojZGVmaW5lIExFMTYodikgKCh2KSAmIDB4ZmYpLCAoKCh2KSA+PiA4KSAm
IDB4ZmYpCgpzdGF0aWMgaW50IHJhd19nYWRnZXRfZmQgPSAtMTsKCi8qIGkyYyBlbXVsYXRpb24g
c3RhdGUsIHRvdWNoZWQgb25seSBieSB0aGUgZ2FkZ2V0IHRocmVhZCAqLwpzdGF0aWMgdW5zaWdu
ZWQgY2hhciBsYXN0X2kyY193cml0ZV9ieXRlc1sxNl07CnN0YXRpYyBpbnQgbGFzdF9pMmNfd3Jp
dGVfbGVuZ3RoOwpzdGF0aWMgdm9sYXRpbGUgaW50IG5ha19ldmVyeV90cmFuc2ZlcjsKc3RhdGlj
IHZvbGF0aWxlIGludCBuYWtfYWZ0ZXJfbmV4dF9zdGF0dXNfcmVhZDsKc3RhdGljIHZvbGF0aWxl
IGludCBzYXdfYXV0b2RldGVjdF9yZWdpc3Rlcl9yZWFkOwoKc3RhdGljIHN0cnVjdCB1c2JfZGV2
aWNlX2Rlc2NyaXB0b3IgZGV2aWNlX2Rlc2NyaXB0b3IgPSB7CgkuYkxlbmd0aCA9IHNpemVvZihz
dHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yKSwKCS5iRGVzY3JpcHRvclR5cGUgPSBVU0JfRFRf
REVWSUNFLAoJLmJjZFVTQiA9IDB4MDIwMCwKCS5iTWF4UGFja2V0U2l6ZTAgPSA2NCwKCS5pZFZl
bmRvciA9IDB4MDQwMywJLyogaTJjLXRpbnktdXNiICovCgkuaWRQcm9kdWN0ID0gMHhjNjMxLAoJ
LmJjZERldmljZSA9IDB4MDEwMCwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKLyogb25l
IHZlbmRvci1jbGFzcyBpbnRlcmZhY2UsIG5vIGVuZHBvaW50cyBhdCBhbGwgLS0gaTJjLXRpbnkt
dXNiIHVzZXMgZXAwIG9ubHkgKi8Kc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgY29uZmlndXJh
dGlvbl9kZXNjcmlwdG9yW10gPSB7Cgk5LCBVU0JfRFRfQ09ORklHLCBMRTE2KDkgKyA5KSwgMSwg
MSwgMCwgMHhhMCwgMHhmYSwKCTksIFVTQl9EVF9JTlRFUkZBQ0UsIDAsIDAsIDAsIDB4ZmYsIDB4
ZmYsIDB4ZmYsIDAsCn07CgpzdGF0aWMgaW50IGVwMF93cml0ZShjb25zdCB2b2lkICpkYXRhLCB1
aW50MzJfdCBsZW5ndGgpCnsKCXVuc2lnbmVkIGNoYXIgYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNi
X3Jhd19lcF9pbykgKyBFUDBfTUFYX1RSQU5TRkVSXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICpp
byA9ICh2b2lkICopYnVmZmVyOwoKCWlmIChsZW5ndGggPiBFUDBfTUFYX1RSQU5TRkVSKQoJCWxl
bmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7Cglpby0+ZXAgPSAwOwoJaW8tPmZsYWdzID0gMDsKCWlv
LT5sZW5ndGggPSBsZW5ndGg7CglpZiAobGVuZ3RoICYmIGRhdGEpCgkJbWVtY3B5KGlvLT5kYXRh
LCBkYXRhLCBsZW5ndGgpOwoJcmV0dXJuIGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9D
VExfRVAwX1dSSVRFLCBpbyk7Cn0KCnN0YXRpYyBpbnQgZXAwX3JlYWQodm9pZCAqb3V0LCB1aW50
MzJfdCBsZW5ndGgpCnsKCXVuc2lnbmVkIGNoYXIgYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jh
d19lcF9pbykgKyBFUDBfTUFYX1RSQU5TRkVSXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICppbyA9
ICh2b2lkICopYnVmZmVyOwoJaW50IHJ2OwoKCWlmIChsZW5ndGggPiBFUDBfTUFYX1RSQU5TRkVS
KQoJCWxlbmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7Cglpby0+ZXAgPSAwOwoJaW8tPmZsYWdzID0g
MDsKCWlvLT5sZW5ndGggPSBsZW5ndGg7CglydiA9IGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9S
QVdfSU9DVExfRVAwX1JFQUQsIGlvKTsKCWlmIChydiA+PSAwICYmIG91dCAmJiBsZW5ndGgpCgkJ
bWVtY3B5KG91dCwgaW8tPmRhdGEsIGxlbmd0aCk7CglyZXR1cm4gcnY7Cn0KCnN0YXRpYyB2b2lk
IG1zcF9yZWdpc3Rlcl9yZWFkX3JlcGx5KHVuc2lnbmVkIGNoYXIgKmRhdGEsIGludCBsZW5ndGgp
CnsKCXVuc2lnbmVkIGNoYXIgaGlnaCA9IDAsIGxvdyA9IDA7CgoJaWYgKGxhc3RfaTJjX3dyaXRl
X2xlbmd0aCA+PSAzICYmIGxhc3RfaTJjX3dyaXRlX2J5dGVzWzFdID09IDB4MDApIHsKCQlpZiAo
bGFzdF9pMmNfd3JpdGVfYnl0ZXNbMF0gPT0gMHgxMyAmJiBsYXN0X2kyY193cml0ZV9ieXRlc1sy
XSA9PSAweDFlKSB7CgkJCS8qIERTUCAweDFlID0gcmV2MTogZmFtaWx5IDMsIHJldmlzaW9uICdH
JyAtPiBtc3AzNHh4Z190aHJlYWQgKi8KCQkJaGlnaCA9IDB4MDA7IGxvdyA9IDB4MDc7CgkJfSBl
bHNlIGlmIChsYXN0X2kyY193cml0ZV9ieXRlc1swXSA9PSAweDEzICYmIGxhc3RfaTJjX3dyaXRl
X2J5dGVzWzJdID09IDB4MWYpIHsKCQkJaGlnaCA9IDB4MDQ7IGxvdyA9IDB4MDA7CS8qIERTUCAw
eDFmID0gcmV2MjogcHJvZHVjdCAwNCAqLwoJCX0gZWxzZSBpZiAobGFzdF9pMmNfd3JpdGVfYnl0
ZXNbMF0gPT0gMHgxMSAmJiBsYXN0X2kyY193cml0ZV9ieXRlc1syXSA9PSAweDdlKSB7CgkJCS8q
IERFTSAweDdlOiBhdXRvZGV0ZWN0IGRvbmUsIHN0ZCAhPSAxLCBzbyB0aGUgdGhyZWFkIGZhbGxz
CgkJCSAqIGludG8gdGhlIHVubXV0ZSBibG9jayBlbmRpbmcgaW4gbXNwX3dyaXRlX2RzcCgweDEz
LCBhY2IpICovCgkJCWhpZ2ggPSAweDAwOyBsb3cgPSAweDAyOwoJCQlzYXdfYXV0b2RldGVjdF9y
ZWdpc3Rlcl9yZWFkID0gMTsKCQkJbmFrX2FmdGVyX25leHRfc3RhdHVzX3JlYWQgPSAxOwoJCX0K
CX0KCWlmIChsZW5ndGggPiAwKSBkYXRhWzBdID0gaGlnaDsKCWlmIChsZW5ndGggPiAxKSBkYXRh
WzFdID0gbG93Owp9CgpzdGF0aWMgdm9pZCBoYW5kbGVfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0
cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmwpCnsKCXVuc2lnbmVkIGNoYXIgZGF0YVtFUDBfTUFY
X1RSQU5TRkVSXTsKCWludCB3TGVuZ3RoID0gY3RybC0+d0xlbmd0aDsKCWludCBkZXZpY2VfdG9f
aG9zdCA9ICEhKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pOwoJaW50IGxlbmd0aCA9
IC0xOwoJaW50IHZlbmRvcl9jb21tYW5kOwoKCWlmICgoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNC
X1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfU1RBTkRBUkQpIHsKCQlpZiAoY3RybC0+YlJlcXVlc3Qg
PT0gVVNCX1JFUV9HRVRfREVTQ1JJUFRPUikgewoJCQlpZiAoKGN0cmwtPndWYWx1ZSA+PiA4KSA9
PSBVU0JfRFRfREVWSUNFKSB7CgkJCQlsZW5ndGggPSBzaXplb2YoZGV2aWNlX2Rlc2NyaXB0b3Ip
OwoJCQkJbWVtY3B5KGRhdGEsICZkZXZpY2VfZGVzY3JpcHRvciwgbGVuZ3RoKTsKCQkJfSBlbHNl
IGlmICgoY3RybC0+d1ZhbHVlID4+IDgpID09IFVTQl9EVF9DT05GSUcpIHsKCQkJCWxlbmd0aCA9
IHNpemVvZihjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IpOwoJCQkJbWVtY3B5KGRhdGEsIGNvbmZp
Z3VyYXRpb25fZGVzY3JpcHRvciwgbGVuZ3RoKTsKCQkJfQoJCX0gZWxzZSBpZiAoY3RybC0+YlJl
cXVlc3QgPT0gVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTikgewoJCQlpb2N0bChyYXdfZ2FkZ2V0
X2ZkLCBVU0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSwgMCk7CgkJCWVwMF9yZWFkKE5VTEwsIDApOwoJ
CQlyZXR1cm47CgkJfQoJCWlmIChsZW5ndGggPCAwKSB7CgkJCWlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfRVAwX1NUQUxMLCAwKTsKCQkJcmV0dXJuOwoJCX0KCQllcDBfd3JpdGUo
ZGF0YSwgbGVuZ3RoID4gd0xlbmd0aCA/IHdMZW5ndGggOiBsZW5ndGgpOwoJCXJldHVybjsKCX0K
CglpZiAoKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9UWVBFX01BU0spICE9IFVTQl9UWVBFX1ZF
TkRPUikgewoJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1NUQUxMLCAw
KTsKCQlyZXR1cm47Cgl9CgoJdmVuZG9yX2NvbW1hbmQgPSBjdHJsLT5iUmVxdWVzdDsKCWlmICh2
ZW5kb3JfY29tbWFuZCA+PSBDTURfSTJDX0lPICYmIHZlbmRvcl9jb21tYW5kIDw9IChDTURfSTJD
X0lPIHwgMykpCgkJdmVuZG9yX2NvbW1hbmQgPSBDTURfSTJDX0lPOwoKCXN3aXRjaCAodmVuZG9y
X2NvbW1hbmQpIHsKCWNhc2UgQ01EX0dFVF9GVU5DOgoJCW1lbXNldChkYXRhLCAweGZmLCBzaXpl
b2YoZGF0YSkpOwkvKiBjbGFpbSBldmVyeSBJMkNfRlVOQ18qICovCgkJZXAwX3dyaXRlKGRhdGEs
IHdMZW5ndGggPiA0ID8gNCA6IHdMZW5ndGgpOwoJCXJldHVybjsKCWNhc2UgQ01EX1NFVF9ERUxB
WToKCQllcDBfcmVhZChOVUxMLCB3TGVuZ3RoKTsKCQlyZXR1cm47CgljYXNlIENNRF9HRVRfU1RB
VFVTOgoJCWRhdGFbMF0gPSBuYWtfZXZlcnlfdHJhbnNmZXIgPyBTVEFUVVNfQUREUkVTU19OQUsg
OiBTVEFUVVNfQUREUkVTU19BQ0s7CgkJLyogQUNLIHRoZSAweDdlIHJlYWQgaXRzZWxmLCB0aGVu
IGZhaWwgdGhlIDB4MTMgd3JpdGUgYWZ0ZXIgaXQgKi8KCQlpZiAoIW5ha19ldmVyeV90cmFuc2Zl
ciAmJiBuYWtfYWZ0ZXJfbmV4dF9zdGF0dXNfcmVhZCkgewoJCQluYWtfYWZ0ZXJfbmV4dF9zdGF0
dXNfcmVhZCA9IDA7CgkJCW5ha19ldmVyeV90cmFuc2ZlciA9IDE7CgkJfQoJCWVwMF93cml0ZShk
YXRhLCB3TGVuZ3RoID4gMSA/IDEgOiB3TGVuZ3RoKTsKCQlyZXR1cm47CgljYXNlIENNRF9JMkNf
SU86CgkJaWYgKGRldmljZV90b19ob3N0KSB7CgkJCW1lbXNldChkYXRhLCAwLCBzaXplb2YoZGF0
YSkpOwoJCQltc3BfcmVnaXN0ZXJfcmVhZF9yZXBseShkYXRhLCB3TGVuZ3RoKTsKCQkJZXAwX3dy
aXRlKGRhdGEsIHdMZW5ndGgpOwoJCX0gZWxzZSBpZiAod0xlbmd0aCkgewoJCQlpbnQgbmJ5dGVz
ID0gd0xlbmd0aCA+IChpbnQpc2l6ZW9mKGxhc3RfaTJjX3dyaXRlX2J5dGVzKQoJCQkJPyAoaW50
KXNpemVvZihsYXN0X2kyY193cml0ZV9ieXRlcykgOiB3TGVuZ3RoOwoKCQkJbWVtc2V0KGRhdGEs
IDAsIHNpemVvZihkYXRhKSk7CgkJCWVwMF9yZWFkKGRhdGEsIHdMZW5ndGgpOwoJCQltZW1jcHko
bGFzdF9pMmNfd3JpdGVfYnl0ZXMsIGRhdGEsIG5ieXRlcyk7CgkJCWxhc3RfaTJjX3dyaXRlX2xl
bmd0aCA9IG5ieXRlczsKCQl9IGVsc2UgewoJCQllcDBfcmVhZChOVUxMLCAwKTsKCQl9CgkJcmV0
dXJuOwoJZGVmYXVsdDoKCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQMF9T
VEFMTCwgMCk7CgkJcmV0dXJuOwoJfQp9CgpzdGF0aWMgdm9pZCAqZ2FkZ2V0X3RocmVhZCh2b2lk
ICp1bnVzZWQpCnsKCXVuc2lnbmVkIGNoYXIgYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19l
dmVudCkgKyBFUDBfTUFYX1RSQU5TRkVSXTsKCXN0cnVjdCB1c2JfcmF3X2V2ZW50ICpldmVudCA9
ICh2b2lkICopYnVmZmVyOwoKCWZvciAoOzspIHsKCQlldmVudC0+dHlwZSA9IDA7CgkJZXZlbnQt
Pmxlbmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7CgkJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVT
Ql9SQVdfSU9DVExfRVZFTlRfRkVUQ0gsIGV2ZW50KSA8IDApIHsKCQkJaWYgKGVycm5vID09IEVJ
TlRSKQoJCQkJY29udGludWU7CgkJCWJyZWFrOwoJCX0KCQlpZiAoZXZlbnQtPnR5cGUgPT0gVVNC
X1JBV19FVkVOVF9DT05UUk9MKQoJCQloYW5kbGVfY29udHJvbF9yZXF1ZXN0KChzdHJ1Y3QgdXNi
X2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRhdGEpOwoJCWVsc2UgaWYgKGV2ZW50LT50eXBlID09IFVT
Ql9SQVdfRVZFTlRfRElTQ09OTkVDVCkKCQkJYnJlYWs7Cgl9CglyZXR1cm4gTlVMTDsKfQoKc3Rh
dGljIGludCBmaW5kX3VkYyhjaGFyICpkcml2ZXJfbmFtZSwgc2l6ZV90IGRyaXZlcl9zaXplLAoJ
CSAgICBjaGFyICpkZXZpY2VfbmFtZSwgc2l6ZV90IGRldmljZV9zaXplKQp7CglESVIgKnVkY19k
aXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJc3RydWN0IGRpcmVudCAqdWRjX2VudHJ5
OwoJY2hhciAqc3VmZml4OwoKCWlmICghdWRjX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKHVk
Y19lbnRyeSA9IHJlYWRkaXIodWRjX2RpcikpKSB7CgkJaWYgKHVkY19lbnRyeS0+ZF9uYW1lWzBd
ID09ICcuJykKCQkJY29udGludWU7CgkJc25wcmludGYoZGV2aWNlX25hbWUsIGRldmljZV9zaXpl
LCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7CgkJc25wcmludGYoZHJpdmVyX25hbWUsIGRyaXZl
cl9zaXplLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7CgkJc3VmZml4ID0gc3RycmNocihkcml2
ZXJfbmFtZSwgJy4nKTsKCQlpZiAoc3VmZml4KQoJCQkqc3VmZml4ID0gMDsKCQljbG9zZWRpcih1
ZGNfZGlyKTsKCQlyZXR1cm4gMDsKCX0KCWNsb3NlZGlyKHVkY19kaXIpOwoJcmV0dXJuIC0xOwp9
CgpzdGF0aWMgaW50IHdyaXRlX3N5c2ZzX2ZpbGUoY29uc3QgY2hhciAqcGF0aCwgY29uc3QgY2hh
ciAqdmFsdWUpCnsKCWludCBmZCA9IG9wZW4ocGF0aCwgT19XUk9OTFkpOwoJaW50IHJ2OwoKCWlm
IChmZCA8IDApCgkJcmV0dXJuIC0xOwoJcnYgPSB3cml0ZShmZCwgdmFsdWUsIHN0cmxlbih2YWx1
ZSkpOwoJY2xvc2UoZmQpOwoJcmV0dXJuIHJ2IDwgMCA/IC0xIDogMDsKfQoKLyogRmluZCB0aGUg
aTJjIGJ1cyBudW1iZXIgb3VyIGVtdWxhdGVkIGFkYXB0ZXIgY3JlYXRlZC4gKi8Kc3RhdGljIGlu
dCBmaW5kX3RpbnlfdXNiX2kyY19idXModm9pZCkKewoJRElSICppMmNfZGlyID0gb3BlbmRpcigi
L3N5cy9idXMvaTJjL2RldmljZXMiKTsKCXN0cnVjdCBkaXJlbnQgKmkyY19lbnRyeTsKCWludCBm
b3VuZF9idXMgPSAtMTsKCglpZiAoIWkyY19kaXIpCgkJcmV0dXJuIC0xOwoJd2hpbGUgKChpMmNf
ZW50cnkgPSByZWFkZGlyKGkyY19kaXIpKSkgewoJCWNoYXIgcGF0aFs1MTJdLCBuYW1lWzI1Nl07
CgkJaW50IGZkLCBuYnl0ZXM7CgoJCWlmIChzdHJuY21wKGkyY19lbnRyeS0+ZF9uYW1lLCAiaTJj
LSIsIDQpKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvc3lz
L2J1cy9pMmMvZGV2aWNlcy8lcy9uYW1lIiwKCQkJIGkyY19lbnRyeS0+ZF9uYW1lKTsKCQlmZCA9
IG9wZW4ocGF0aCwgT19SRE9OTFkpOwoJCWlmIChmZCA8IDApCgkJCWNvbnRpbnVlOwoJCW5ieXRl
cyA9IHJlYWQoZmQsIG5hbWUsIHNpemVvZihuYW1lKSAtIDEpOwoJCWNsb3NlKGZkKTsKCQlpZiAo
bmJ5dGVzIDw9IDApCgkJCWNvbnRpbnVlOwoJCW5hbWVbbmJ5dGVzXSA9IDA7CgkJaWYgKHN0cnN0
cihuYW1lLCAiaTJjLXRpbnktdXNiIikpIHsKCQkJZm91bmRfYnVzID0gYXRvaShpMmNfZW50cnkt
PmRfbmFtZSArIDQpOwoJCQlicmVhazsKCQl9Cgl9CgljbG9zZWRpcihpMmNfZGlyKTsKCXJldHVy
biBmb3VuZF9idXM7Cn0KCmludCBtYWluKHZvaWQpCnsKCXN0cnVjdCB1c2JfcmF3X2luaXQgaW5p
dDsKCXB0aHJlYWRfdCBnYWRnZXRfdGhyZWFkX2lkOwoJY2hhciB1ZGNfZHJpdmVyX25hbWVbVURD
X05BTUVfTEVOR1RIX01BWF07CgljaGFyIHVkY19kZXZpY2VfbmFtZVtVRENfTkFNRV9MRU5HVEhf
TUFYXTsKCWNoYXIgcGF0aFs1MTJdOwoJaW50IGkyY19idXNfbnVtYmVyID0gLTEsIGF0dGVtcHQ7
CgoJaWYgKGZpbmRfdWRjKHVkY19kcml2ZXJfbmFtZSwgc2l6ZW9mKHVkY19kcml2ZXJfbmFtZSks
CgkJICAgICB1ZGNfZGV2aWNlX25hbWUsIHNpemVvZih1ZGNfZGV2aWNlX25hbWUpKSA8IDApCgkJ
cmV0dXJuIDE7CgoJcmF3X2dhZGdldF9mZCA9IG9wZW4oIi9kZXYvcmF3LWdhZGdldCIsIE9fUkRX
Uik7CglpZiAocmF3X2dhZGdldF9mZCA8IDApCgkJcmV0dXJuIDE7CgltZW1zZXQoJmluaXQsIDAs
IHNpemVvZihpbml0KSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kcml2ZXJfbmFtZSwgdWRjX2Ry
aXZlcl9uYW1lLAoJCXNpemVvZihpbml0LmRyaXZlcl9uYW1lKSAtIDEpOwoJc3RybmNweSgoY2hh
ciAqKWluaXQuZGV2aWNlX25hbWUsIHVkY19kZXZpY2VfbmFtZSwKCQlzaXplb2YoaW5pdC5kZXZp
Y2VfbmFtZSkgLSAxKTsKCWluaXQuc3BlZWQgPSBVU0JfU1BFRURfSElHSDsKCWlmIChpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0lOSVQsICZpbml0KSA8IDApCgkJcmV0dXJuIDE7
CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwgMCkKCQly
ZXR1cm4gMTsKCXB0aHJlYWRfY3JlYXRlKCZnYWRnZXRfdGhyZWFkX2lkLCBOVUxMLCBnYWRnZXRf
dGhyZWFkLCBOVUxMKTsKCglmb3IgKGF0dGVtcHQgPSAwOyBhdHRlbXB0IDwgMjAwOyBhdHRlbXB0
KyspIHsKCQlpMmNfYnVzX251bWJlciA9IGZpbmRfdGlueV91c2JfaTJjX2J1cygpOwoJCWlmIChp
MmNfYnVzX251bWJlciA+PSAwKQoJCQlicmVhazsKCQl1c2xlZXAoNTAwMDApOwoJfQoJaWYgKGky
Y19idXNfbnVtYmVyIDwgMCkKCQlyZXR1cm4gMTsKCgkvKiBtc3BfcHJvYmUoKSAtPiBrdGhyZWFk
X3J1bihtc3AzNHh4Z190aHJlYWQpICovCglzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIv
c3lzL2J1cy9pMmMvZGV2aWNlcy9pMmMtJWQvbmV3X2RldmljZSIsCgkJIGkyY19idXNfbnVtYmVy
KTsKCWlmICh3cml0ZV9zeXNmc19maWxlKHBhdGgsICJtc3AzNDAwIDB4NDAiKSA8IDApCgkJcmV0
dXJuIDE7CgoJLyogTGV0IHRoZSBjb250cm9sIHRocmVhZCBydW4gaW50byBtc3Bfd3JpdGVfZHNw
KDB4MTMsIGFjYikgYW5kIGRpZS4gKi8KCWZvciAoYXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCAxMDAg
JiYgIXNhd19hdXRvZGV0ZWN0X3JlZ2lzdGVyX3JlYWQ7IGF0dGVtcHQrKykKCQl1c2xlZXAoNTAw
MDApOwoJc2xlZXAoMyk7CS8qIHRocmVhZCBleGl0cywgdGFza19zdHJ1Y3QgaXMgUkNVLWZyZWVk
ICovCgoJLyogbXNwX3JlbW92ZSgpIC0+IGt0aHJlYWRfc3RvcChzdGF0ZS0+a3RocmVhZCkgb24g
dGhlIGZyZWVkIHRhc2tfc3RydWN0ICovCglzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIv
c3lzL2J1cy9pMmMvZGV2aWNlcy9pMmMtJWQvZGVsZXRlX2RldmljZSIsCgkJIGkyY19idXNfbnVt
YmVyKTsKCXdyaXRlX3N5c2ZzX2ZpbGUocGF0aCwgIjB4NDAiKTsKCXJldHVybiAwOwp9Cg==
--00000000000054344f065b36dd2b--
