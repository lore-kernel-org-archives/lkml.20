Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAC4DEC1D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672873; cv=none; b=Rg3R6BoSsiKcirWhfG92VLvriD1zT0/0S/pNwJcNcH6F/6uvod6mwAQECdM/yVqhzgdDMHLMkSRirajhb5Sn08xsYpsKY8ZkVkWZoJJDqJ2v5p4ZJnHlaFjI3uLtteVKg+z+MDvPvljVgbfMkD5q9fZW2sJg3BgnVBV+8TnhQ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672873; c=relaxed/simple;
	bh=mYGiz/CEbz7ceeH+3m8KRoylZ+mF07bwI3rwVGiNXCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QtbV3f+kG9C7iBpIaXFawK6yFcZwHk2S8HAcXT23XV4stV8JI7lPQdPeHJywlb3+OsL30qvS23iT21fRauA/Am2jM6bRCTDX8ZKvg/nWqE/u7vMQ84JrRPse9Sv9IP3vAjxwGlUyVEiCSiMNF5Is6hLjkYyNoKAxJNV46w3nzAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWUS2Rlj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NNyJBi65; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NWUS2Rlj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NNyJBi65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpLLCOIJaNkZQflZrI+TWuCqX2syaV6YM6JlIfmZxEk=;
	b=NWUS2RljvXvbBitSziElseWu4KmtLO8u03qt0R3bzmBvsar8u9gpxAdJK6XgtNtwx/Y9cb
	G9jVxcmUeoee/SmGht3S0OsKkjDssFyZfg/7J5m9G56Muxn+83RpaKZzN3+NILJWQ1bUEu
	5PD17HmmqqqqOFJGBNjb+R8w4Kc5g/g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-3f4poqyHMOqTmYyj1_wQxg-1; Thu, 17 Sep 2026 15:21:07 -0400
X-MC-Unique: 3f4poqyHMOqTmYyj1_wQxg-1
X-Mimecast-MFC-AGG-ID: 3f4poqyHMOqTmYyj1_wQxg_1789672867
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so228162585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789672867; x=1790277667; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kpLLCOIJaNkZQflZrI+TWuCqX2syaV6YM6JlIfmZxEk=;
        b=NNyJBi65r4owQlIQ4uW9dcBsjd8VtmT6McFlDHqg5YXXly8u7KJXBptigc8EdCoLpv
         Y4LgXjZf6jlbMdiD3K2NGYm7A3kfp1BlUeYwUW0usZZUfj2+GHAjuHSktJ7bCy8fdqFq
         pFUr5BKi2wYaIXBB58Jc9hSE/OQ+tNszjGtLGhDtNlQA07lu1X76FLwFmu9O16sVh+wc
         aXLHrNmkOMDq6ZxNz1QQq7TUp6UzU/D9q59mAtipb571wldvmyDYWXguKlPCq/ViUgbN
         jZGedWUamwRSlnVOyA5K8/El4fgrVpLSrSTCleeyD3y8TRFhbhj1M6imIr5tsG9/dApV
         QHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672867; x=1790277667;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpLLCOIJaNkZQflZrI+TWuCqX2syaV6YM6JlIfmZxEk=;
        b=nyL80qLHjomYUAaUerDsPd4ajxWz3bmdXkYMLetLvfcmn4I7HbdUDYg47In2pqPyCX
         7FAfuAKRNaBWKn7WgfqOaa1qUrqlgCgCFwTimPfFU1vefPJwzWRwqVfI807KUi8Dn1Xi
         pKx9avCGNQU9YYr9zS3gKeB7T5sbBHB14l1uauvDwwYKpLeBjZcO1jOgMnMJ+2iLhBRs
         SafDQcgCg7OMMlBSo0UouF6UP/QTuUxbnr5TUlYxXTRRW5sKWPYmjzRH+dTkQAckjkSt
         1qEQz67cwTdrHAOtXKFoaSOX6qN4QoniY7wLdeLyaNjD5ebA6nrKELTwMlM2lzEdrWoR
         4dFw==
X-Gm-Message-State: AFuF++ldioJu/z/PWxc88vEg1y0ci3urv3mWAozf+mYZNxpi4PHMQHN8
	aykuDpAg4TrT4EqRCg55S90MVyKYGRbnIxSbfePFd/iE1BKd1zzXIRfi2SA/bbx+Km9qqP1iP7F
	wShwbvpNpPAVh7ClDoJF6045jkH+IOyrut+jfI+d+6Hp3lovE35bz145y0iWrLq+bGA==
X-Gm-Gg: AYBFou2EFLkEiSZiXLz8c8xSx16JFjLMyLvvISnuBnyO3e+drUl3tQtwkk799hF3aGV
	2rAV/1tUMW1QX+fMKtFleEwCZYMtSVx4wCBU79gkH/ZL8TN8n6AU9QNcY8Vp53nhtH/6/pWSEXq
	KTJmUmdKH+NH82mT/LWT5iQkClYI+LFoH75raaOvsorBwKhyJDkOWaKCEEGbQFvTf8BqW5shBn0
	qtlM10cG/Iflb87W7N/7+Lo/SYRV3kdJ55AKvXD3Shd//ajM2NyGH878KlYdHg+EjajkVmv/KHi
	GmrXN+2eGp75I7YxFOGVOIXhSxqRYPfZ3c1pbBWKD0SVZ7+QEuShCSFHGRlBFoVnUmHXuitp
X-Received: by 2002:a05:620a:4147:b0:939:ba2e:455f with SMTP id af79cd13be357-93bb797001amr1475898985a.51.1789672867190;
        Thu, 17 Sep 2026 12:21:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:939:ba2e:455f with SMTP id af79cd13be357-93bb797001amr1475870885a.51.1789672863572;
        Thu, 17 Sep 2026 12:21:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780cfa83sm522700085a.3.2026.09.17.12.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:21:03 -0700 (PDT)
Message-ID: <9fd4458240f45ea1ea6d4d79362f72d847b958aa.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix double-free in nvif_vmm_dtor
From: lyude@redhat.com
To: Peiyang He <peiyang_he@smail.nju.edu.cn>, dakr@kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 bskeggs@redhat.com, 	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Date: Thu, 17 Sep 2026 15:21:02 -0400
In-Reply-To: <03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn>
References: 
	<03BA723D9E5FF725+20260916103138.2651605-1-peiyang_he@smail.nju.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in a moment

On Wed, 2026-09-16 at 18:31 +0800, Peiyang He wrote:
> On failure, nouveau_cli_init() calls nouveau_cli_fini() to tear
> the client down. Then, nouveau_drm_open() also enters into its
> cleanup path and calls nouveau_cli_fini() AGAIN. nouveau_cli_fini()
> calls nouveau_vmm_fini():
>=20
> 	void
> 	nouveau_vmm_fini(struct nouveau_vmm *vmm)
> 	{
> 		nouveau_svmm_fini(&vmm->svmm);
> 		nvif_vmm_dtor(&vmm->vmm);
> 		vmm->cli =3D NULL;
> 	}
>=20
> Inside nvif_vmm_dtor(), vmm->page is freed unconditionally:
>=20
> 	void
> 	nvif_vmm_dtor(struct nvif_vmm *vmm)
> 	{
> 		kfree(vmm->page);
> 		nvif_object_dtor(&vmm->object);
> 	}
>=20
> vmm->page is never cleared after being freed, so the second call of
> nvif_vmm_dtor() will cause a double-free.
>=20
> Found by fuzzing the nouveau driver with a modified Syzkaller:
>=20
> 	BUG: KASAN: double-free in nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> 	Free of addr ffff888010fcdc30 by task syz.0.173/2567
>=20
> 	CPU: 1 UID: 0 PID: 2567 Comm: syz.0.173 Not tainted 7.2.0
> #24 PREEMPT(lazy)=20
> 	Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.16.3-debian-1.16.3-2 04/01/2014
> 	Call Trace:
> 	<TASK>
> 	__dump_stack lib/dump_stack.c:94 [inline]
> 	dump_stack_lvl+0x95/0xe0 lib/dump_stack.c:120
> 	print_address_description mm/kasan/report.c:378 [inline]
> 	print_report+0xcb/0x5a0 mm/kasan/report.c:482
> 	kasan_report_invalid_free+0xaa/0xd0 mm/kasan/report.c:557
> 	check_slab_allocation+0xe4/0x110 mm/kasan/common.c:235
> 	kasan_slab_pre_free include/linux/kasan.h:199 [inline]
> 	slab_free_hook mm/slub.c:2622 [inline]
> 	slab_free mm/slub.c:6377 [inline]
> 	kfree+0x192/0x590 mm/slub.c:6692
> 	nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> 	nouveau_vmm_fini+0x16/0x50
> drivers/gpu/drm/nouveau/nouveau_vmm.c:127
> 	nouveau_cli_fini+0x10e/0x210
> drivers/gpu/drm/nouveau/nouveau_drm.c:225
> 	nouveau_drm_open+0x24e/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1255
> 	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> 	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> 	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> 	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> 	chrdev_open+0x21c/0x660 fs/char_dev.c:411
> 	do_dentry_open+0x59d/0x12b0 fs/open.c:947
> 	vfs_open+0x82/0x390 fs/open.c:1052
> 	do_open fs/namei.c:4700 [inline]
> 	path_openat+0x2345/0x3420 fs/namei.c:4863
> 	do_file_open+0x207/0x460 fs/namei.c:4892
> 	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> 	do_sys_open fs/open.c:1374 [inline]
> 	__do_sys_openat fs/open.c:1390 [inline]
> 	__se_sys_openat fs/open.c:1385 [inline]
> 	__x64_sys_openat+0x144/0x200 fs/open.c:1385
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 	RIP: 0033:0x7fc6d687594d
> 	Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
> 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01
> 48
> 	RSP: 002b:00007fc6d5295008 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000101
> 	RAX: ffffffffffffffda RBX: 00007fc6d6b06180 RCX:
> 00007fc6d687594d
> 	RDX: 0000000000022501 RSI: 0000200000000000 RDI:
> ffffffffffffff9c
> 	RBP: 00007fc6d691c303 R08: 0000000000000000 R09:
> 0000000000000000
> 	R10: 0000000000000000 R11: 0000000000000246 R12:
> 0000000000000000
> 	R13: 00007fc6d6b06218 R14: 00007fc6d6b06180 R15:
> 00007ffd9451d760
> 	</TASK>
>=20
> 	Allocated by task 2567 on cpu 1 at 163.593900s:
> 	kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
> 	kasan_save_track+0x17/0x60 mm/kasan/common.c:78
> 	poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
> 	__kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
> 	kasan_kmalloc include/linux/kasan.h:263 [inline]
> 	__do_kmalloc_node mm/slub.c:5334 [inline]
> 	__kmalloc_noprof+0x304/0x7c0 mm/slub.c:5359
> 	_kmalloc_noprof include/linux/slab.h:992 [inline]
> 	nvif_vmm_ctor+0x3c0/0x7e0
> drivers/gpu/drm/nouveau/nvif/vmm.c:237
> 	nouveau_vmm_init+0x40/0x90
> drivers/gpu/drm/nouveau/nouveau_vmm.c:134
> 	nouveau_cli_init+0x7b9/0xe10
> drivers/gpu/drm/nouveau/nouveau_drm.c:293
> 	nouveau_drm_open+0x236/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1243
> 	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> 	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> 	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> 	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> 	chrdev_open+0x21c/0x660 fs/char_dev.c:411
> 	do_dentry_open+0x59d/0x12b0 fs/open.c:947
> 	vfs_open+0x82/0x390 fs/open.c:1052
> 	do_open fs/namei.c:4700 [inline]
> 	path_openat+0x2345/0x3420 fs/namei.c:4863
> 	do_file_open+0x207/0x460 fs/namei.c:4892
> 	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> 	do_sys_open fs/open.c:1374 [inline]
> 	__do_sys_openat fs/open.c:1390 [inline]
> 	__se_sys_openat fs/open.c:1385 [inline]
> 	__x64_sys_openat+0x144/0x200 fs/open.c:1385
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> 	Freed by task 2567 on cpu 1 at 163.601355s:
> 	kasan_save_stack+0x24/0x50 mm/kasan/common.c:57
> 	kasan_save_track+0x17/0x60 mm/kasan/common.c:78
> 	kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:584
> 	poison_slab_object mm/kasan/common.c:253 [inline]
> 	__kasan_slab_free+0x61/0x80 mm/kasan/common.c:285
> 	kasan_slab_free include/linux/kasan.h:235 [inline]
> 	slab_free_hook mm/slub.c:2677 [inline]
> 	slab_free mm/slub.c:6377 [inline]
> 	kfree+0x383/0x590 mm/slub.c:6692
> 	nvif_vmm_dtor+0x31/0x50
> drivers/gpu/drm/nouveau/nvif/vmm.c:194
> 	nouveau_vmm_fini+0x16/0x50
> drivers/gpu/drm/nouveau/nouveau_vmm.c:127
> 	nouveau_cli_fini+0x10e/0x210
> drivers/gpu/drm/nouveau/nouveau_drm.c:225
> 	nouveau_cli_init+0x593/0xe10
> drivers/gpu/drm/nouveau/nouveau_drm.c:324
> 	nouveau_drm_open+0x236/0x740
> drivers/gpu/drm/nouveau/nouveau_drm.c:1243
> 	drm_file_alloc+0x5f2/0xad0 drivers/gpu/drm/drm_file.c:176
> 	drm_open_helper+0x1d7/0x4a0 drivers/gpu/drm/drm_file.c:335
> 	drm_open+0x190/0x3d0 drivers/gpu/drm/drm_file.c:388
> 	drm_stub_open+0x1f2/0x460 drivers/gpu/drm/drm_drv.c:1211
> 	chrdev_open+0x21c/0x660 fs/char_dev.c:411
> 	do_dentry_open+0x59d/0x12b0 fs/open.c:947
> 	vfs_open+0x82/0x390 fs/open.c:1052
> 	do_open fs/namei.c:4700 [inline]
> 	path_openat+0x2345/0x3420 fs/namei.c:4863
> 	do_file_open+0x207/0x460 fs/namei.c:4892
> 	do_sys_openat2+0xd1/0x1d0 fs/open.c:1368
> 	do_sys_open fs/open.c:1374 [inline]
> 	__do_sys_openat fs/open.c:1390 [inline]
> 	__se_sys_openat fs/open.c:1385 [inline]
> 	__x64_sys_openat+0x144/0x200 fs/open.c:1385
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x115/0x690 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
>=20
> 	The buggy address belongs to the object at ffff888010fcdc30
> 	which belongs to the cache kmalloc-16 of size 16
> 	The buggy address is located 0 bytes inside of
> 	16-byte region [ffff888010fcdc30, ffff888010fcdc40)
>=20
> 	The buggy address belongs to the physical page:
> 	page: refcount:0 mapcount:0 mapping:0000000000000000
> index:0x0 pfn:0x10fcd
> 	flags: 0x100000000000000(node=3D0|zone=3D1)
> 	page_type: f5(slab)
> 	raw: 0100000000000000 ffff88800d441640 dead000000000100
> dead000000000122
> 	raw: 0000000000000000 0000000000550055 00000000f5000000
> 0000000000000000
> 	page dumped because: kasan: bad access detected
>=20
> 	Memory state around the buggy address:
> 	ffff888010fcdb00: fc fc 00 04 fc fc fc fc fa fb fc fc fc fc
> fa fb
> 	ffff888010fcdb80: fc fc fc fc fa fb fc fc fc fc 00 07 fc fc
> fc fc
> 	>ffff888010fcdc00: fa fb fc fc fc fc fa fb fc fc fc fc fa fb
> fc fc
> 							=09
> 		^
> 	ffff888010fcdc80: fc fc fa fb fc fc fc fc 00 04 fc fc fc fc
> fa fb
> 	ffff888010fcdd00: fc fc fc fc 00 00 fc fc fc fc fa fb fc fc
> fc fc
>=20
> Fix by removing the redundant teardown in nouveau_drm_open(),
> since nouveau_cli_init() already does the cleanup work.
> Also clear vmm->page after its freeing.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 20d8a88e557a ("drm/nouveau: tidy up the client init/fini
> interfaces")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: LLM
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 4 +---
> =C2=A0drivers/gpu/drm/nouveau/nvif/vmm.c=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e16f59b00f6f..c465d59ef0a6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1251,10 +1251,8 @@ nouveau_drm_open(struct drm_device *dev,
> struct drm_file *fpriv)
> =C2=A0	mutex_unlock(&drm->clients_lock);
> =C2=A0
> =C2=A0done:
> -	if (ret && cli) {
> -		nouveau_cli_fini(cli);
> +	if (ret && cli)
> =C2=A0		kfree(cli);
> -	}
> =C2=A0
> =C2=A0	pm_runtime_mark_last_busy(dev->dev);
> =C2=A0	pm_runtime_put_autosuspend(dev->dev);
> diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c
> b/drivers/gpu/drm/nouveau/nvif/vmm.c
> index 65c3e883b119..579af70766f2 100644
> --- a/drivers/gpu/drm/nouveau/nvif/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
> @@ -192,6 +192,7 @@ void
> =C2=A0nvif_vmm_dtor(struct nvif_vmm *vmm)
> =C2=A0{
> =C2=A0	kfree(vmm->page);
> +	vmm->page =3D NULL;
> =C2=A0	nvif_object_dtor(&vmm->object);
> =C2=A0}
> =C2=A0

