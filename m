Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2A4AA586
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148174; cv=pass; b=jOD5642jQeZK5tXmohIdjxZ0imRrZOGlkAGHZ68zdH3YA29QY4PCJCZj0ySS3pYSTjgmg/hk3Khq/GMmoq+aFL0ONKlZR7dk15IBG+HTqPwFGavusjZn1bt2usSUT9N3C2YhD68E4XYA/QZ8O0ggUe9BM7xeuB6vmI4MSxCSBkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148174; c=relaxed/simple;
	bh=Y0M4cF0JKQ7qAgv34xtebwavkrvhrA38/eI3fVyrtr0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TIHVtnjXwaYYnUKLKW3HhCKPjeWrfNuJdV0C1wzwDOV3H3/Qw1MLIWZu6A2NR6WKRkzxtEW7kmFhI+8o5gotSJcMRfL4+zQDW9J+h4iLz2MkqW05C6iYeyuI+HFPydKoTUYb2R7BogEO+AludIhbcCDVUt/OQHwyVgx9I1KFZEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=SURReP1c; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="SURReP1c"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1509925a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789148165; cv=none;
        d=google.com; s=arc-20260327;
        b=iwAQ66SnB1+kjCdOJT2Etxsbv+4BWPsnam2MwdqC8o9bsj0JGoXcBQOyeYU8vrLp64
         4BIhrNqRGl2RqgUaevVcV4dC24XXb23wYfxYEPGknaB5A79eNUUZKvUwTaOU5QV93RZ8
         QnE8F0d6HkA4HfvN7/j1S9I3SlX4oZD0g6wAKSNDr2ZvL4e/7L62TFY7VdPnrx3bvJ27
         QGums0He56cA6fEZQZSDt16STZwWRV/jwtjFbKJg6BjM5tbdS9eRR+aysrxGjpBWItel
         lqOTAtKUU8/2+kD61ivuyxDhyguZub4whDNR77hXKD/bflERE3lxWW9mZ59A1yisa5cm
         lH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GRAKeSZjt5/ezVZZflM3JbTNt97UrxuxOSGMpJevwwk=;
        fh=BGsV64HOi5oXU7ojCfdhGJhdKh56P7J7q0NNtuOXZ9k=;
        b=hij1QPfZp+myEXGwimLbLpO3CeOEm5L4sBb2SU5obBD2cAoWCKXpCENLBGE1w28yP3
         EB0xQGBLUnhVQidGGgdbC+NgzfcB3XOhKRSWH2J+8T0wPeyqKP5hbdrx4WnVJhyi2nxR
         S8TLGi22kjhsm3Pr3lrs718WyO96IRwoTWb4duOYVxtBE6gL9p5uWy8/loNQ+xMdEAat
         McYdW+6Z9U9uYT3qhRDdC7zurggd2F+X6BjO9jpKmDmfmARg8Gx0U+817nMks4ZhawAg
         DkQSKSx0Gwo/BpkMGpMGsU4l12PwkeqrgIeqPUZ8Zz4vixMxdHc3e2GYHwwSGsSVdb0j
         GOnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789148165; x=1789752965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRAKeSZjt5/ezVZZflM3JbTNt97UrxuxOSGMpJevwwk=;
        b=SURReP1c0YdfX90TS7sqcIB44icVXrzpDk4dqWXtnrm6J2bfIvupF5UoJYPFKXM571
         uY8lF+66FXo7Hs2v8I/8avML8WKxqc1VjDzm6PckpRKT7fYfE3nknviITOA1NKn3hcK/
         bqncq2ryJSF4YWEQ0LCtEWPqxFQDCwDHfEvL8J0C5UGR+JqyShX1P/YyJv5iHMsve4vo
         hSt50AbrsUW8IBN4F9dGOStCtVmNA8a59/MPluH/hDQgrf7lknIpjlfTep5e3MKg9DnT
         VsJrPgWUytFVB9pl6bhTyhjrepCGt+FHbFO33Y1n3hGW9YiEy1y9LGlXz0IVTAhuC4A5
         lRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148165; x=1789752965;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GRAKeSZjt5/ezVZZflM3JbTNt97UrxuxOSGMpJevwwk=;
        b=Lur7OtnqWUqjWQid+Vdpl+19SSiWgmZlreNq7tiyvgy/SVdyZfhdfnzT1gFzSckn8T
         hBqA3m4HNEwUgtavmNxuyYi68Af30zd4jEhV8djeM8v+E2QPt9IDFb0r66NMnRdiDJ5f
         MtTZqHP60sW2qGW+qgH7t/jUlRs86S7qWZwXReZ2MsL59sq5S5zSQZElz2WuBkily6br
         LoHT3pDU7hfr3ETV+gpUF54s1sYnz3ji8k7INeHiUSGabSJ5MN3H1y2PHeOWuCIcCpKq
         85uMxMuylZAU9PZEL2goFa70WjPSffFlNNGQ2HHc6QiXWyn2/t/vPl50QSwXBw9A++Ai
         EDNw==
X-Forwarded-Encrypted: i=1; AKwUvByEiHisFQuDaCHtaRNBYkjSJSHJOi3o0AOW8DHEaQxvjX6QOT/QWytaNX0bwHBeW/OtJz26tSotg1+f2Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++lOj0XLH4aiKopU6NFV9p9CpqSLU/f/U1WgPac7tQ6VXGHjyYWT
	Ib8qw0r4nCt3uyCPtsKB5pBkH8zGiDFPaKMxd0LUupEVPdNiIq7sjgifWJaYFsAqnwJB1kjI3EM
	yXtSftA9EyAov7Md0M/0rq9J5o4pq0ezjUXxACvsFN/PytaCAb+yyM1GA179F3Q==
X-Gm-Gg: AYBFou1KCVB99Xn386oWZjY+YcVfmRVbsJAuCLrB5xpApxb95W0dNbjLEhh6olI3xFz
	hQNIyHG4YVKvzw33iZE3TGyVkpOKE6HGMIGZposHb3rzXrucRx9wk2HG4D/YInyzo2ER/jPaZVo
	k0iGvExgIkd7v3lgOW3gbN90RJFPijprrirulhMG9FMMbLEbuB0NKGo+XNj9VTFH2RUmLa6xxFS
	xzw5wYvjENaNKRcSV55EQ394IKwwhW0ouq9MTrGFHoB29sDQMqW8tQ3i8vj49hgO5o+Zy7HjxJd
	0d/WhwZGu7WeKELFHBCivCvSxlMp8Skef9n1HpP5Efd0vf2IvE90WFP3aydHy5kj7ZFm/TVrrqP
	/r0+hz9yOGW+BNUZLs3lppV9Kszmziaae5NMYMko37xboCYd1t2BlrHfceqoq+iaDaXNPYbct+n
	M=
X-Received: by 2002:a17:90b:57e6:b0:38e:2517:5d1f with SMTP id
 98e67ed59e1d1-39d9bec3f25mr9328516a91.9.1789148163812; Fri, 11 Sep 2026
 10:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 10:35:51 -0700
X-Gm-Features: AcwNN1XHikGLoFxbOqmyzM-EC2iWdOuGSB2IzvfdAud0zZriktfyAkB-buo2bRQ
Message-ID: <CA+0ovCjWWbDqo66qvgsNqn8BuBjMWOZpVfbT4mtycAXCVN-HHw@mail.gmail.com>
Subject: [BUG] KASAN: slab-use-after-free Read in msi2500_stop_streaming
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000c203bc065b388401"

--000000000000c203bc065b388401
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   45.449899][ T9488] BUG: KASAN: slab-use-after-free in
msi2500_stop_streaming+0x144/0x290
[   45.453118][ T9488] Read of size 8 at addr ffff8881179bc8a8 by task
repro/9488
[   45.453146][ T9488]
[   45.453188][ T9488] CPU: 1 UID: 0 PID: 9488 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   45.453228][ T9488] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   45.453264][ T9488] Call Trace:
[   45.453294][ T9488]  <TASK>
[   45.453344][ T9488]  dump_stack_lvl+0xe8/0x150
[   45.453386][ T9488]  print_address_description+0x55/0x1e0
[   45.453422][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.453463][ T9488]  print_report+0x58/0x70
[   45.453493][ T9488]  kasan_report+0x117/0x150
[   45.453541][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.453589][ T9488]  msi2500_stop_streaming+0x144/0x290
[   45.453630][ T9488]  ? __pfx_msi2500_stop_streaming+0x10/0x10
[   45.453674][ T9488]  __vb2_queue_cancel+0xba/0xdb0
[   45.453724][ T9488]  ? __vb2_cleanup_fileio+0x134/0x1f0
[   45.453758][ T9488]  vb2_core_queue_release+0x2f/0x150
[   45.453792][ T9488]  vb2_fop_release+0x16e/0x200
[   45.453825][ T9488]  v4l2_release+0x250/0x370
[   45.453854][ T9488]  ? __pfx_v4l2_release+0x10/0x10
[   45.453884][ T9488]  __fput+0x44f/0xa60
[   45.453937][ T9488]  fput_close_sync+0x11f/0x240
[   45.453983][ T9488]  ? __pfx_fput_close_sync+0x10/0x10
[   45.454036][ T9488]  __x64_sys_close+0x7e/0x110
[   45.454066][ T9488]  do_syscall_64+0x155/0x510
[   45.454112][ T9488]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.454145][ T9488]  ? clear_bhb_loop+0x30/0x80
[   45.454180][ T9488]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.454212][ T9488] RIP: 0033:0x46ff26
[   45.454257][ T9488] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   45.454293][ T9488] RSP: 002b:00007ffdffa12750 EFLAGS: 00000202
ORIG_RAX: 0000000000000003
[   45.454353][ T9488] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000046ff26
[   45.454377][ T9488] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000004
[   45.454396][ T9488] RBP: 00007ffdffa12760 R08: 0000000000000000
R09: 0000000000000000
[   45.454416][ T9488] R10: 0000000000000000 R11: 0000000000000202
R12: 00007ffdffa128e8
[   45.454437][ T9488] R13: 00007ffdffa128f8 R14: 0000000000000002
R15: 00000000004d4100
[   45.454470][ T9488]  </TASK>
[   45.454482][ T9488]
[   45.454498][ T9488] Allocated by task 991:
[   45.454514][ T9488]  kasan_save_track+0x3e/0x80
[   45.454552][ T9488]  __kasan_kmalloc+0x93/0xb0
[   45.454590][ T9488]  __kmalloc_cache_noprof+0x325/0x610
[   45.454625][ T9488]  msi001_probe+0x5e/0x400
[   45.454658][ T9488]  really_probe+0x267/0xaf0
[   45.456219][ T9488]  __driver_probe_device+0x1e2/0x350
[   45.456250][ T9488]  driver_probe_device+0x4f/0x240
[   45.456282][ T9488]  __device_attach_driver+0x270/0x410
[   45.456330][ T9488]  bus_for_each_drv+0x258/0x2f0
[   45.456370][ T9488]  __device_attach+0x2c5/0x450
[   45.456398][ T9488]  device_initial_probe+0xa1/0xd0
[   45.456428][ T9488]  bus_probe_device+0x12a/0x220
[   45.456466][ T9488]  device_add+0x7ec/0xb90
[   45.456491][ T9488]  __spi_add_device+0xd3f/0x1240
[   45.456529][ T9488]  spi_new_device+0x332/0x500
[   45.456565][ T9488]  v4l2_spi_new_subdev+0x7e/0x1e0
[   45.456601][ T9488]  msi2500_probe+0x5b6/0x9f0
[   45.456637][ T9488]  usb_probe_interface+0x71f/0xe00
[   45.456676][ T9488]  really_probe+0x267/0xaf0
[   45.456707][ T9488]  __driver_probe_device+0x1e2/0x350
[   45.456737][ T9488]  driver_probe_device+0x4f/0x240
[   45.456769][ T9488]  __device_attach_driver+0x270/0x410
[   45.456801][ T9488]  bus_for_each_drv+0x258/0x2f0
[   45.456843][ T9488]  __device_attach+0x2c5/0x450
[   45.456862][ T9488]  device_initial_probe+0xa1/0xd0
[   45.456882][ T9488]  bus_probe_device+0x12a/0x220
[   45.456907][ T9488]  device_add+0x7ec/0xb90
[   45.456924][ T9488]  usb_set_configuration+0x1a87/0x2110
[   45.456949][ T9488]  usb_generic_driver_probe+0x8d/0x150
[   45.456972][ T9488]  usb_probe_device+0x1c4/0x3b0
[   45.456997][ T9488]  really_probe+0x267/0xaf0
[   45.457017][ T9488]  __driver_probe_device+0x1e2/0x350
[   45.457037][ T9488]  driver_probe_device+0x4f/0x240
[   45.457058][ T9488]  __device_attach_driver+0x270/0x410
[   45.457080][ T9488]  bus_for_each_drv+0x258/0x2f0
[   45.457105][ T9488]  __device_attach+0x2c5/0x450
[   45.457124][ T9488]  device_initial_probe+0xa1/0xd0
[   45.457144][ T9488]  bus_probe_device+0x12a/0x220
[   45.457169][ T9488]  device_add+0x7ec/0xb90
[   45.457185][ T9488]  usb_new_device+0xa14/0x1720
[   45.457205][ T9488]  hub_event+0x2a1c/0x4f30
[   45.457227][ T9488]  process_scheduled_works+0xc99/0x1900
[   45.457260][ T9488]  worker_thread+0xa53/0xfc0
[   45.457277][ T9488]  kthread+0x38b/0x480
[   45.457300][ T9488]  ret_from_fork+0x514/0xb70
[   45.457330][ T9488]  ret_from_fork_asm+0x1a/0x30
[   45.457356][ T9488]
[   45.457361][ T9488] Freed by task 991:
[   45.457372][ T9488]  kasan_save_track+0x3e/0x80
[   45.457398][ T9488]  kasan_save_free_info+0x46/0x50
[   45.457418][ T9488]  __kasan_slab_free+0x5c/0x80
[   45.457442][ T9488]  kfree+0x1c5/0x650
[   45.457462][ T9488]  device_release_driver_internal+0x46f/0x870
[   45.457484][ T9488]  bus_remove_device+0x455/0x570
[   45.457509][ T9488]  device_del+0x527/0x8f0
[   45.457527][ T9488]  spi_unregister_device+0x127/0x1c0
[   45.457553][ T9488]  __unregister+0x15/0x20
[   45.457568][ T9488]  device_for_each_child+0x10b/0x1a0
[   45.457588][ T9488]  spi_unregister_controller+0x234/0x630
[   45.457617][ T9488]  msi2500_disconnect+0xcc/0x190
[   45.457641][ T9488]  usb_unbind_interface+0x26e/0x910
[   45.457666][ T9488]  device_release_driver_internal+0x4d9/0x870
[   45.457688][ T9488]  bus_remove_device+0x455/0x570
[   45.457713][ T9488]  device_del+0x527/0x8f0
[   45.457731][ T9488]  usb_disable_device+0x3d4/0x8d0
[   45.457753][ T9488]  usb_disconnect+0x32f/0x990
[   45.457772][ T9488]  hub_event+0x1cc9/0x4f30
[   45.457794][ T9488]  process_scheduled_works+0xc99/0x1900
[   45.457823][ T9488]  worker_thread+0xa53/0xfc0
[   45.457840][ T9488]  kthread+0x38b/0x480
[   45.457862][ T9488]  ret_from_fork+0x514/0xb70
[   45.457883][ T9488]  ret_from_fork_asm+0x1a/0x30
[   45.457905][ T9488]
[   45.457910][ T9488] The buggy address belongs to the object at
ffff8881179bc800
[   45.457910][ T9488]  which belongs to the cache kmalloc-1k of size 1024
[   45.457935][ T9488] The buggy address is located 168 bytes inside of
[   45.457935][ T9488]  freed 1024-byte region [ffff8881179bc800,
ffff8881179bcc00)
[   45.457957][ T9488]
[   45.457963][ T9488] The buggy address belongs to the physical page:
[   45.457987][ T9488] page: refcount:0 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x1179b8
[   45.458007][ T9488] head: order:3 mapcount:0 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[   45.458025][ T9488] flags:
0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
[   45.458060][ T9488] page_type: f5(slab)
[   45.458088][ T9488] raw: 057ff00000000040 ffff88801b041dc0
dead000000000100 dead000000000122
[   45.458106][ T9488] raw: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   45.458125][ T9488] head: 057ff00000000040 ffff88801b041dc0
dead000000000100 dead000000000122
[   45.458142][ T9488] head: 0000000000000000 0000000000100010
00000000f5000000 0000000000000000
[   45.458160][ T9488] head: 057ff00000000003 fffffffffffffe01
00000000ffffffff 00000000ffffffff
[   45.458177][ T9488] head: ffffffffffffffff 0000000000000000
00000000ffffffff 0000000000000008
[   45.458188][ T9488] page dumped because: kasan: bad access detected
[   45.458205][ T9488] page_owner tracks the page as allocated
[   45.458213][ T9488] page last allocated via order 3, migratetype
Unmovable, gfp_mask
0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC),
pid 5495, tgid 5495 ((udev-worker)), ts 21220333223
[   45.458250][ T9488]  post_alloc_hook+0x1f9/0x250
[   45.458273][ T9488]  get_page_from_freelist+0x235a/0x23e0
[   45.458298][ T9488]  __alloc_frozen_pages_noprof+0x217/0x5a0
[   45.458335][ T9488]  allocate_slab+0x7d/0x610
[   45.458352][ T9488]  refill_objects+0x2d6/0x350
[   45.458369][ T9488]  __pcs_replace_empty_main+0x2c9/0x6c0
[   45.458400][ T9488]  __kmalloc_node_track_caller_noprof+0x552/0x730
[   45.458424][ T9488]  __alloc_skb+0x2c5/0x7d0
[   45.458447][ T9488]  netlink_sendmsg+0x5d4/0xb40
[   45.458465][ T9488]  sock_sendmsg_nosec+0x13a/0x180
[   45.458484][ T9488]  ____sys_sendmsg+0x589/0x8c0
[   45.458510][ T9488]  ___sys_sendmsg+0x2a5/0x360
[   45.458535][ T9488]  __x64_sys_sendmsg+0x1b1/0x290
[   45.458561][ T9488]  do_syscall_64+0x155/0x510
[   45.458589][ T9488]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.458609][ T9488] page last free pid 991 tgid 991 ts 21211839794
stack trace:
[   45.458624][ T9488]  free_pages_prepare+0xa03/0xb00
[   45.458644][ T9488]  __free_contig_range_common+0x174/0x340
[   45.458672][ T9488]  free_pages_bulk+0x48/0x120
[   45.458695][ T9488]  vfree+0x231/0x470
[   45.458713][ T9488]  delayed_vfree_work+0x55/0x80
[   45.458735][ T9488]  process_scheduled_works+0xc99/0x1900
[   45.458764][ T9488]  worker_thread+0xa53/0xfc0
[   45.458782][ T9488]  kthread+0x38b/0x480
[   45.458803][ T9488]  ret_from_fork+0x514/0xb70
[   45.458824][ T9488]  ret_from_fork_asm+0x1a/0x30
[   45.458847][ T9488]
[   45.458852][ T9488] Memory state around the buggy address:
[   45.458864][ T9488]  ffff8881179bc780: fc fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc
[   45.458878][ T9488]  ffff8881179bc800: fa fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.458892][ T9488] >ffff8881179bc880: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.458902][ T9488]                                   ^
[   45.458913][ T9488]  ffff8881179bc900: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.458926][ T9488]  ffff8881179bc980: fb fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb
[   45.458937][ T9488]
==================================================================
[   45.458962][ T9488] Kernel panic - not syncing: KASAN: panic_on_warn set ...
[   45.553634][ T9488] CPU: 1 UID: 0 PID: 9488 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   45.554573][ T9488] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   45.555525][ T9488] Call Trace:
[   45.555831][ T9488]  <TASK>
[   45.556103][ T9488]  vpanic+0x56d/0xa60
[   45.556480][ T9488]  ? __pfx_vpanic+0x10/0x10
[   45.556898][ T9488]  panic+0xc5/0xd0
[   45.557244][ T9488]  ? __pfx_panic+0x10/0x10
[   45.557657][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.558162][ T9488]  ? rcu_is_watching+0x16/0xb0
[   45.558610][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.559114][ T9488]  check_panic_on_warn+0x89/0xb0
[   45.559637][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.560157][ T9488]  end_report+0x73/0x170
[   45.560554][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.561060][ T9488]  kasan_report+0x128/0x150
[   45.561481][ T9488]  ? msi2500_stop_streaming+0x144/0x290
[   45.561984][ T9488]  msi2500_stop_streaming+0x144/0x290
[   45.562477][ T9488]  ? __pfx_msi2500_stop_streaming+0x10/0x10
[   45.563012][ T9488]  __vb2_queue_cancel+0xba/0xdb0
[   45.563470][ T9488]  ? __vb2_cleanup_fileio+0x134/0x1f0
[   45.563955][ T9488]  vb2_core_queue_release+0x2f/0x150
[   45.564437][ T9488]  vb2_fop_release+0x16e/0x200
[   45.564873][ T9488]  v4l2_release+0x250/0x370
[   45.565287][ T9488]  ? __pfx_v4l2_release+0x10/0x10
[   45.565749][ T9488]  __fput+0x44f/0xa60
[   45.566122][ T9488]  fput_close_sync+0x11f/0x240
[   45.566565][ T9488]  ? __pfx_fput_close_sync+0x10/0x10
[   45.567048][ T9488]  __x64_sys_close+0x7e/0x110
[   45.567483][ T9488]  do_syscall_64+0x155/0x510
[   45.567909][ T9488]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.568461][ T9488]  ? clear_bhb_loop+0x30/0x80
[   45.568891][ T9488]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.569499][ T9488] RIP: 0033:0x46ff26
[   45.569860][ T9488] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   45.571588][ T9488] RSP: 002b:00007ffdffa12750 EFLAGS: 00000202
ORIG_RAX: 0000000000000003
[   45.572340][ T9488] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000046ff26
[   45.573052][ T9488] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000004
[   45.573763][ T9488] RBP: 00007ffdffa12760 R08: 0000000000000000
R09: 0000000000000000
[   45.574473][ T9488] R10: 0000000000000000 R11: 0000000000000202
R12: 00007ffdffa128e8
[   45.575180][ T9488] R13: 00007ffdffa128f8 R14: 0000000000000002
R15: 00000000004d4100
[   45.575893][ T9488]  </TASK>
[   45.576438][ T9488] Kernel Offset: disabled
[   45.576986][ T9488] Rebooting in 86400 seconds..

Regards,

--000000000000c203bc065b388401
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx8lvc80>
X-Attachment-Id: f_mtx8lvc80

LyoKICogMjY3LWthc2FuLXNsYWItdXNlLWFmdGVyLWZyZWUtcmVhZC1pbi1tc2kyNTAwLXN0b3At
c3RyZWFtaW5nCiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2lu
Y2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNp
bmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4K
I2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8c3lzL3N0YXQuaD4KI2luY2x1ZGUgPHN5
cy9zeXNtYWNyb3MuaD4KI2luY2x1ZGUgPHN5cy93YWl0Lmg+CiNpbmNsdWRlIDx0aW1lLmg+CiNp
bmNsdWRlIDx1bmlzdGQuaD4KCiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxs
aW51eC91c2IvcmF3X2dhZGdldC5oPgojaW5jbHVkZSA8bGludXgvdmlkZW9kZXYyLmg+CgojZGVm
aW5lIEVQMF9NQVhfVFJBTlNGRVIgNDA5NgojZGVmaW5lIExFMTYodikgKCh2KSAmIDB4ZmYpLCAo
KCh2KSA+PiA4KSAmIDB4ZmYpCgpzdGF0aWMgaW50IHJhd19nYWRnZXRfZmQgPSAtMTsKCnN0YXRp
YyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yIGRldmljZV9kZXNjcmlwdG9yID0g
ewoJLmJMZW5ndGggICAgICAgICAgICA9IHNpemVvZihzdHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlw
dG9yKSwKCS5iRGVzY3JpcHRvclR5cGUgICAgPSBVU0JfRFRfREVWSUNFLAoJLmJjZFVTQiAgICAg
ICAgICAgICA9IF9fY29uc3RhbnRfY3B1X3RvX2xlMTYoMHgwMjAwKSwKCS5iTWF4UGFja2V0U2l6
ZTAgICAgPSA2NCwKCS5pZFZlbmRvciAgICAgICAgICAgPSBfX2NvbnN0YW50X2NwdV90b19sZTE2
KDB4MWRmNyksCgkuaWRQcm9kdWN0ICAgICAgICAgID0gX19jb25zdGFudF9jcHVfdG9fbGUxNigw
eDI1MDApLAoJLmJjZERldmljZSAgICAgICAgICA9IF9fY29uc3RhbnRfY3B1X3RvX2xlMTYoMHgw
MTAwKSwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKc3RhdGljIGNvbnN0IHVpbnQ4X3Qg
Y29uZmlndXJhdGlvbl9kZXNjcmlwdG9yW10gPSB7Cgk5LCBVU0JfRFRfQ09ORklHLCBMRTE2KDkg
KyA5ICsgOSArIDcpLCAxLCAxLCAwLCAweGEwLCAweGZhLAoKCTksIFVTQl9EVF9JTlRFUkZBQ0Us
IDAsIDAsIDAsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDAsCgoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwg
MSwgMSwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgMHg4MSwgVVNC
X0VORFBPSU5UX1hGRVJfSVNPQywgTEUxNigweDE0MDApLCAxLAp9OwoKc3RhdGljIHZvaWQgZXAw
X3dyaXRlKGNvbnN0IHZvaWQgKnBheWxvYWQsIHVpbnQzMl90IG5ieXRlcykKewoJdWludDhfdCBy
YXdbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIEVQMF9NQVhfVFJBTlNGRVJdOwoJc3Ry
dWN0IHVzYl9yYXdfZXBfaW8gKmVwMF9pbyA9ICh2b2lkICopcmF3OwoKCWVwMF9pby0+ZXAgPSAw
OwoJZXAwX2lvLT5mbGFncyA9IDA7CgllcDBfaW8tPmxlbmd0aCA9IG5ieXRlczsKCW1lbWNweShl
cDBfaW8tPmRhdGEsIHBheWxvYWQsIG5ieXRlcyk7Cglpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0Jf
UkFXX0lPQ1RMX0VQMF9XUklURSwgZXAwX2lvKTsKfQoKc3RhdGljIHZvaWQgaGFuZGxlX2NvbnRy
b2xfcmVxdWVzdChjb25zdCBzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICpjdHJsKQp7Cgl1aW50OF90
IHJlcGx5W0VQMF9NQVhfVFJBTlNGRVJdOwoJaW50IHJlcGx5X2xlbmd0aCA9IC0xOwoKCWlmICgo
Y3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfU1RBTkRBUkQp
IHsKCQlzd2l0Y2ggKGN0cmwtPmJSZXF1ZXN0KSB7CgkJY2FzZSBVU0JfUkVRX0dFVF9ERVNDUklQ
VE9SOgoJCQlpZiAoKGN0cmwtPndWYWx1ZSA+PiA4KSA9PSBVU0JfRFRfREVWSUNFKSB7CgkJCQly
ZXBseV9sZW5ndGggPSBzaXplb2YoZGV2aWNlX2Rlc2NyaXB0b3IpOwoJCQkJbWVtY3B5KHJlcGx5
LCAmZGV2aWNlX2Rlc2NyaXB0b3IsIHJlcGx5X2xlbmd0aCk7CgkJCX0gZWxzZSBpZiAoKGN0cmwt
PndWYWx1ZSA+PiA4KSA9PSBVU0JfRFRfQ09ORklHKSB7CgkJCQlyZXBseV9sZW5ndGggPSBzaXpl
b2YoY29uZmlndXJhdGlvbl9kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShyZXBseSwgY29uZmlndXJh
dGlvbl9kZXNjcmlwdG9yLCByZXBseV9sZW5ndGgpOwoJCQl9CgkJCWJyZWFrOwoJCWNhc2UgVVNC
X1JFUV9TRVRfQ09ORklHVVJBVElPTjoKCQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19J
T0NUTF9DT05GSUdVUkUsIDApOwoJCQlyZXBseV9sZW5ndGggPSAwOwoJCQlicmVhazsKCQljYXNl
IFVTQl9SRVFfU0VUX0lOVEVSRkFDRToKCQkJcmVwbHlfbGVuZ3RoID0gMDsKCQkJYnJlYWs7CgkJ
fQoJfSBlbHNlIHsKCgkJcmVwbHlfbGVuZ3RoID0gMDsKCX0KCglpZiAocmVwbHlfbGVuZ3RoIDwg
MCkgewoJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1NUQUxMLCAwKTsK
CQlyZXR1cm47Cgl9CglpZiAoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX0RJUl9JTikgewoJCWlm
IChyZXBseV9sZW5ndGggPiBjdHJsLT53TGVuZ3RoKQoJCQlyZXBseV9sZW5ndGggPSBjdHJsLT53
TGVuZ3RoOwoJCWVwMF93cml0ZShyZXBseSwgKHVpbnQzMl90KXJlcGx5X2xlbmd0aCk7Cgl9IGVs
c2UgewoJCXVpbnQ4X3QgcmF3W3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbyldOwoJCXN0cnVj
dCB1c2JfcmF3X2VwX2lvICplcDBfaW8gPSAodm9pZCAqKXJhdzsKCgkJZXAwX2lvLT5lcCA9IDA7
CgkJZXAwX2lvLT5mbGFncyA9IDA7CgkJZXAwX2lvLT5sZW5ndGggPSAwOwoJCWlvY3RsKHJhd19n
YWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIGVwMF9pbyk7Cgl9Cn0KCnN0YXRpYyBp
bnQgZmluZF91ZGMoY2hhciAqdWRjX2RyaXZlcl9uYW1lLCBzaXplX3QgZHJpdmVyX25hbWVfc2l6
ZSwKCQkgICAgY2hhciAqdWRjX2RldmljZV9uYW1lLCBzaXplX3QgZGV2aWNlX25hbWVfc2l6ZSkK
ewoJRElSICp1ZGNfY2xhc3NfZGlyID0gb3BlbmRpcigiL3N5cy9jbGFzcy91ZGMiKTsKCXN0cnVj
dCBkaXJlbnQgKnVkY19jbGFzc19lbnRyeTsKCglpZiAoIXVkY19jbGFzc19kaXIpCgkJcmV0dXJu
IC0xOwoJd2hpbGUgKCh1ZGNfY2xhc3NfZW50cnkgPSByZWFkZGlyKHVkY19jbGFzc19kaXIpKSkg
ewoJCWNoYXIgKmluc3RhbmNlX3N1ZmZpeDsKCgkJaWYgKHVkY19jbGFzc19lbnRyeS0+ZF9uYW1l
WzBdID09ICcuJykKCQkJY29udGludWU7CgkJc25wcmludGYodWRjX2RldmljZV9uYW1lLCBkZXZp
Y2VfbmFtZV9zaXplLCAiJXMiLAoJCQkgdWRjX2NsYXNzX2VudHJ5LT5kX25hbWUpOwoJCXNucHJp
bnRmKHVkY19kcml2ZXJfbmFtZSwgZHJpdmVyX25hbWVfc2l6ZSwgIiVzIiwKCQkJIHVkY19jbGFz
c19lbnRyeS0+ZF9uYW1lKTsKCQlpbnN0YW5jZV9zdWZmaXggPSBzdHJyY2hyKHVkY19kcml2ZXJf
bmFtZSwgJy4nKTsKCQlpZiAoaW5zdGFuY2Vfc3VmZml4KQoJCQkqaW5zdGFuY2Vfc3VmZml4ID0g
MDsKCQljbG9zZWRpcih1ZGNfY2xhc3NfZGlyKTsKCQlyZXR1cm4gMDsKCX0KCWNsb3NlZGlyKHVk
Y19jbGFzc19kaXIpOwoJcmV0dXJuIC0xOwp9CgpzdGF0aWMgdm9pZCBlbXVsYXRlX21zaTI1MDBf
Z2FkZ2V0KHZvaWQpCnsKCXN0cnVjdCB1c2JfcmF3X2luaXQgaW5pdDsKCWNoYXIgdWRjX2RyaXZl
cl9uYW1lWzEyOF0sIHVkY19kZXZpY2VfbmFtZVsxMjhdOwoJdWludDhfdCByYXdbc2l6ZW9mKHN0
cnVjdCB1c2JfcmF3X2V2ZW50KSArIEVQMF9NQVhfVFJBTlNGRVJdOwoJc3RydWN0IHVzYl9yYXdf
ZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilyYXc7CgoJaWYgKGZpbmRfdWRjKHVkY19kcml2ZXJfbmFt
ZSwgc2l6ZW9mKHVkY19kcml2ZXJfbmFtZSksCgkJICAgICB1ZGNfZGV2aWNlX25hbWUsIHNpemVv
Zih1ZGNfZGV2aWNlX25hbWUpKSA8IDApCgkJX2V4aXQoMSk7CglyYXdfZ2FkZ2V0X2ZkID0gb3Bl
bigiL2Rldi9yYXctZ2FkZ2V0IiwgT19SRFdSKTsKCWlmIChyYXdfZ2FkZ2V0X2ZkIDwgMCkKCQlf
ZXhpdCgxKTsKCW1lbXNldCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQpKTsKCXN0cm5jcHkoKGNoYXIg
Kilpbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJc2l6ZW9mKGluaXQuZHJpdmVy
X25hbWUpIC0gMSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kZXZpY2VfbmFtZSwgdWRjX2Rldmlj
ZV9uYW1lLAoJCXNpemVvZihpbml0LmRldmljZV9uYW1lKSAtIDEpOwoJaW5pdC5zcGVlZCA9IFVT
Ql9TUEVFRF9ISUdIOwoJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5J
VCwgJmluaXQpIDwgMCkKCQlfZXhpdCgxKTsKCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0Jf
UkFXX0lPQ1RMX1JVTiwgMCkgPCAwKQoJCV9leGl0KDEpOwoJZm9yICg7OykgewoJCWV2ZW50LT50
eXBlID0gMDsKCQlldmVudC0+bGVuZ3RoID0gRVAwX01BWF9UUkFOU0ZFUjsKCQlpZiAoaW9jdGwo
cmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FVkVOVF9GRVRDSCwgZXZlbnQpIDwgMCkgewoJ
CQlpZiAoZXJybm8gPT0gRUlOVFIpCgkJCQljb250aW51ZTsKCQkJX2V4aXQoMCk7CgkJfQoJCWlm
IChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0NPTlRST0wpCgkJCWhhbmRsZV9jb250cm9s
X3JlcXVlc3QoKHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7Cgl9Cn0KCnN0
YXRpYyB2b2lkIHNsZWVwX21pbGxpc2Vjb25kcyhpbnQgbWlsbGlzZWNvbmRzKQp7CglzdHJ1Y3Qg
dGltZXNwZWMgZHVyYXRpb24gPSB7IG1pbGxpc2Vjb25kcyAvIDEwMDAsCgkJCQkgICAgIChsb25n
KShtaWxsaXNlY29uZHMgJSAxMDAwKSAqIDEwMDAwMDBMIH07CgoJbmFub3NsZWVwKCZkdXJhdGlv
biwgTlVMTCk7Cn0KCnN0YXRpYyBpbnQgb3Blbl9tc2kyNTAwX25vZGUodm9pZCkKewoJaW50IGF0
dGVtcHQ7CgoJZm9yIChhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDMwMDsgYXR0ZW1wdCsrKSB7CgkJ
RElSICp2NGxfY2xhc3NfZGlyID0gb3BlbmRpcigiL3N5cy9jbGFzcy92aWRlbzRsaW51eCIpOwoJ
CXN0cnVjdCBkaXJlbnQgKnY0bF9jbGFzc19lbnRyeTsKCgkJaWYgKHY0bF9jbGFzc19kaXIpIHsK
CQkJd2hpbGUgKCh2NGxfY2xhc3NfZW50cnkgPSByZWFkZGlyKHY0bF9jbGFzc19kaXIpKSkgewoJ
CQkJY2hhciBkZXZfYXR0cl9wYXRoWzUxMl0sIGRldl9hdHRyX2J1Zls2NF07CgkJCQljaGFyIG5v
ZGVfcGF0aFs4MF07CgkJCQlzdHJ1Y3QgdjRsMl9jYXBhYmlsaXR5IGNhcGFiaWxpdHk7CgkJCQlp
bnQgYXR0cl9mZCwgbmJ5dGVzLCBub2RlX2ZkOwoJCQkJaW50IG1ham9yX251bWJlciwgbWlub3Jf
bnVtYmVyOwoKCQkJCWlmICh2NGxfY2xhc3NfZW50cnktPmRfbmFtZVswXSA9PSAnLicpCgkJCQkJ
Y29udGludWU7CgkJCQlzbnByaW50ZihkZXZfYXR0cl9wYXRoLCBzaXplb2YoZGV2X2F0dHJfcGF0
aCksCgkJCQkJICIvc3lzL2NsYXNzL3ZpZGVvNGxpbnV4LyVzL2RldiIsCgkJCQkJIHY0bF9jbGFz
c19lbnRyeS0+ZF9uYW1lKTsKCQkJCWF0dHJfZmQgPSBvcGVuKGRldl9hdHRyX3BhdGgsIE9fUkRP
TkxZKTsKCQkJCWlmIChhdHRyX2ZkIDwgMCkKCQkJCQljb250aW51ZTsKCQkJCW5ieXRlcyA9IHJl
YWQoYXR0cl9mZCwgZGV2X2F0dHJfYnVmLAoJCQkJCSAgICAgIHNpemVvZihkZXZfYXR0cl9idWYp
IC0gMSk7CgkJCQljbG9zZShhdHRyX2ZkKTsKCQkJCWlmIChuYnl0ZXMgPD0gMCkKCQkJCQljb250
aW51ZTsKCQkJCWRldl9hdHRyX2J1ZltuYnl0ZXNdID0gMDsKCQkJCWlmIChzc2NhbmYoZGV2X2F0
dHJfYnVmLCAiJWQ6JWQiLCAmbWFqb3JfbnVtYmVyLAoJCQkJCSAgICZtaW5vcl9udW1iZXIpICE9
IDIpCgkJCQkJY29udGludWU7CgkJCQlzbnByaW50Zihub2RlX3BhdGgsIHNpemVvZihub2RlX3Bh
dGgpLCAiL2Rldi8lcyIsCgkJCQkJIHY0bF9jbGFzc19lbnRyeS0+ZF9uYW1lKTsKCQkJCWlmICht
a25vZChub2RlX3BhdGgsIFNfSUZDSFIgfCAwNjAwLAoJCQkJCSAgbWFrZWRldihtYWpvcl9udW1i
ZXIsIG1pbm9yX251bWJlcikpIDwgMCAmJgoJCQkJICAgIGVycm5vICE9IEVFWElTVCkKCQkJCQlj
b250aW51ZTsKCQkJCW5vZGVfZmQgPSBvcGVuKG5vZGVfcGF0aCwgT19SRFdSKTsKCQkJCWlmIChu
b2RlX2ZkIDwgMCkKCQkJCQljb250aW51ZTsKCQkJCW1lbXNldCgmY2FwYWJpbGl0eSwgMCwgc2l6
ZW9mKGNhcGFiaWxpdHkpKTsKCQkJCWlmIChpb2N0bChub2RlX2ZkLCBWSURJT0NfUVVFUllDQVAs
ICZjYXBhYmlsaXR5KSA9PSAwICYmCgkJCQkgICAgIXN0cmNtcCgoY2hhciAqKWNhcGFiaWxpdHku
ZHJpdmVyLCAibXNpMjUwMCIpKSB7CgkJCQkJY2xvc2VkaXIodjRsX2NsYXNzX2Rpcik7CgkJCQkJ
cmV0dXJuIG5vZGVfZmQ7CgkJCQl9CgkJCQljbG9zZShub2RlX2ZkKTsKCQkJfQoJCQljbG9zZWRp
cih2NGxfY2xhc3NfZGlyKTsKCQl9CgkJc2xlZXBfbWlsbGlzZWNvbmRzKDUwKTsKCX0KCXJldHVy
biAtMTsKfQoKaW50IG1haW4odm9pZCkKewoJcGlkX3QgZ2FkZ2V0X3BpZDsKCWludCBzdHJlYW1p
bmdfZmQ7CglzdHJ1Y3QgdjRsMl9yZXF1ZXN0YnVmZmVycyByZXF1ZXN0X2J1ZmZlcnM7CglpbnQg
YnVmZmVyX3R5cGUgPSBWNEwyX0JVRl9UWVBFX1NEUl9DQVBUVVJFOwoKCWdhZGdldF9waWQgPSBm
b3JrKCk7CglpZiAoZ2FkZ2V0X3BpZCA9PSAwKSB7CgkJZW11bGF0ZV9tc2kyNTAwX2dhZGdldCgp
OwoJCV9leGl0KDApOwoJfQoJaWYgKGdhZGdldF9waWQgPCAwKQoJCXJldHVybiAxOwoKCXN0cmVh
bWluZ19mZCA9IG9wZW5fbXNpMjUwMF9ub2RlKCk7CglpZiAoc3RyZWFtaW5nX2ZkIDwgMCkgewoJ
CWZwcmludGYoc3RkZXJyLCAibXNpMjUwMCBuZXZlciByZWdpc3RlcmVkIGFuIFNEUiBub2RlXG4i
KTsKCQlraWxsKGdhZGdldF9waWQsIFNJR0tJTEwpOwoJCXJldHVybiAxOwoJfQoKCW1lbXNldCgm
cmVxdWVzdF9idWZmZXJzLCAwLCBzaXplb2YocmVxdWVzdF9idWZmZXJzKSk7CglyZXF1ZXN0X2J1
ZmZlcnMuY291bnQgPSA0OwoJcmVxdWVzdF9idWZmZXJzLnR5cGUgPSBWNEwyX0JVRl9UWVBFX1NE
Ul9DQVBUVVJFOwoJcmVxdWVzdF9idWZmZXJzLm1lbW9yeSA9IFY0TDJfTUVNT1JZX01NQVA7Cglp
b2N0bChzdHJlYW1pbmdfZmQsIFZJRElPQ19SRVFCVUZTLCAmcmVxdWVzdF9idWZmZXJzKTsKCglp
ZiAoaW9jdGwoc3RyZWFtaW5nX2ZkLCBWSURJT0NfU1RSRUFNT04sICZidWZmZXJfdHlwZSkgPCAw
KQoJCWZwcmludGYoc3RkZXJyLCAiU1RSRUFNT04gZmFpbGVkOiAlc1xuIiwgc3RyZXJyb3IoZXJy
bm8pKTsKCglraWxsKGdhZGdldF9waWQsIFNJR0tJTEwpOwoJd2FpdHBpZChnYWRnZXRfcGlkLCBO
VUxMLCAwKTsKCXNsZWVwX21pbGxpc2Vjb25kcyg3MDApOwoKCWNsb3NlKHN0cmVhbWluZ19mZCk7
CglyZXR1cm4gMDsKfQo=
--000000000000c203bc065b388401--
