Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF134D0CDB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583011; cv=none; b=jKpESmuo40jEvZH+zGv/m4FJPVcui94bdAkWfaKL4X1WRZMIr4qVAbo1XvugIOllLF5CcqdWwu0ISeOH0Zgk8xsrqxFNyCj0VzhODX36okw1E1OvwTrPMrSnVL44xmktQYjbYZQbCxZaIYel20ko+aNeia3Rn49KFr1Fa+4YcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583011; c=relaxed/simple;
	bh=LVhun2SghakYT9/plKU7e0ITailOnrBsVWL49vHTXaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcd62CTW8lVGA2I0JULwB8Ap7Gh2XrhzhSMCrxScpx5E1OUZU1+Guah/zzV1aNmCtx8IUAupchv8nXrJdVraSUfCxd2F7KGwyihL4wC/6mMFTAPvqeEWkMTYBp1iMM+z6dUzm2AF8FH86EqHGq3vynqz5HXX8RVxlv6057paB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gDb11hwA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDb11hwA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd84862f2bso144185ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789582992; x=1790187792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kh9X5Hppc2ub2kPri4yo3CSDmH8Fca6vpnwMwcOtodI=;
        b=gDb11hwA1ZtqNhldAVJd+epkiUzGa70pw850DszJCsHyuZiykbxULantFAbD5u54nM
         5nQMPpnBeQtagHoZguULhZMaecFbEilyXBdvESOeni64etVDjjUJ4N0XEpaLqicpuvVY
         4+1Q+/OrMfx93/ji3awhQKr/ZAH/1xkwFrhTXdhkpKaQPMyNjFQOacUlCHP//vHOUc0r
         Qn7nHFKc26HAmhom1N0ntggXXh811pNN/WWdtIosswdhKtY68VQhBJin+WFM8WGrbhqt
         FCvIC70Ehs1zYgIv7V5C/HkZlkYbLEHSgXeYksA1JnGrOydoUMDeDjBCLpENKPUEtqGu
         FHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582992; x=1790187792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kh9X5Hppc2ub2kPri4yo3CSDmH8Fca6vpnwMwcOtodI=;
        b=y237FuQm1aJRmClUBL21grROBgraKkyGQH3MDlYsjwpdYUPIzBL2bxV5rI81U5hqyc
         dMUUPNI1cSagF/JPFrlow3Qkjcv/CiyeAd52cNIwEF4PK2R7BjY2b/udZnoq2d96h2NE
         4av+r/vxo09Y3/4QoUP7GwWDmUmM7qBrXObN02LujF0kObA7eS9WxcCY14H35Ey1HB/J
         fFmu2PM8KcPk25vXCG16vuNKuc7NDZ35+ADKgbuglmfYNIOkKZglagrpk2y9SevTouE4
         UaZx6fsOPcZg84V2Ho7KhKKG0ZtitZTODEXTa98K36HOus+fTunKBgcYg51upUwldkm0
         zbBg==
X-Forwarded-Encrypted: i=1; AKwUvBx+NU5GhUXpx5OCwnPCTWOziLyQWusJNKaejs5LyEOebkiJpoBjWTykSxMKD0Jg8W/KuuRlnkk/cL09jaM=@vger.kernel.org
X-Gm-Message-State: AFuF++mGlYOU8eEGIr0lqunrkMJpKzQbaKRjqspKC2Gh3Sp0ua0ocYSO
	4ObHdE70KYhNb0vRPgH8p1cyytjFw+8GWAx9sQHhfK/yWCH39f6YXgdwkNQoRvCYgg==
X-Gm-Gg: AYBFou2/VunmkMGlvp+scj5ajZJQM/WYxuednp5Uv5L18yaVbor512iEeC6KWJil0O3
	4Mw8up/F70O93az15UGRi8I62YjfLblgEmDk9oS/gmGL8hdM9Im2HFIfCpPrET6OLxT47XflCBd
	xiRY8wDiAHsmShOUOoG/2P/G8NCppTDmICoVXW5OZy1IKzbce5jRk5XR6tVczrwV+M5kj5lWo1b
	E4HlgmfSlgTGgO1JR79im70QTSia+WI7hzE5gBTIpCrOh8vKgmzRKHRlhq5Y9w8/+Bx+RkH8JTv
	OyGrSdStqcYGGTxAW1JIMekG0HQOKXrZ8W33XLOTimpj/s+voEfloW5Een0E315leMTe6kHYoP4
	eT5kFawGOyfaWQdAI/hAdNCsN7RAEdQUtlBzcGpHgOH2tWlb20/gXET6UxsHiaHwDUcPf32Xljf
	SslOd2Da8tTBJvGQVam/TA8w2UHD/mZusAsmV8wAoVPVfiP85xHgvCxhvZkgYR7zO/pWh76PyZe
	zgIt3H0TlYD1DzeUmAqSuyavxULyOW0GoqEj4jg9T0Cf91n++Rxf90v+tlNB/uXFTuUi19ANed6
	KqloY4EpzMdONHY=
X-Received: by 2002:a17:902:d30c:b0:2d7:1cc3:a69c with SMTP id d9443c01a7336-2dd9d6348cbmr698285ad.7.1789582990992;
        Wed, 16 Sep 2026 11:23:10 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f21b39sm16047415ad.75.2026.09.16.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:23:09 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:23:00 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Peiyang He <peiyang_he@smail.nju.edu.cn>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] binderfs: fix UAF write in binder_add_device
Message-ID: <aqrehOXNTdJQi1Js@google.com>
References: <F6EF5FB778E87C98+20260913085645.1639558-1-peiyang_he@smail.nju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F6EF5FB778E87C98+20260913085645.1639558-1-peiyang_he@smail.nju.edu.cn>

On Sun, Sep 13, 2026 at 04:56:45PM +0800, Peiyang He wrote:
> binderfs_binder_device_create() publishes the new dentry with
> d_make_persistent() and then calls simple_done_creating(), which drops
> the parent directory lock and the creator's dentry reference. It then
> calls binder_add_device() to register the device in the global
> binder_devices list.
> 
> After simple_done_creating() releases the parent directory lock, a
> concurrent unlinkat() can remove the new device entry. Dropping the
> creator's dentry reference can then trigger binderfs_evict_inode(),
> freeing the device. binder_add_device() later accesses the freed
> object, causing UAF write.
> 
> Found by a modified Syzkaller:
> 
> 	BUG: KASAN: slab-use-after-free in hlist_add_head include/linux/list.h:1073 [inline]
> 	BUG: KASAN: slab-use-after-free in binder_add_device+0xa9/0xc0 drivers/android/binder.c:7068
> 	Write of size 8 at addr ffff88805b340c00 by task syz.1.532/11389
> 
> 	CPU: 0 UID: 0 PID: 11389 Comm: syz.1.532 Not tainted 7.2.0 #4 PREEMPT(full) 
> 	Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> 	Call Trace:
> 	<TASK>
> 	__dump_stack lib/dump_stack.c:94 [inline]
> 	dump_stack_lvl+0x10e/0x1f0 lib/dump_stack.c:120
> 	print_address_description mm/kasan/report.c:378 [inline]
> 	print_report+0xf7/0x600 mm/kasan/report.c:482
> 	kasan_report+0xe4/0x120 mm/kasan/report.c:595
> 	hlist_add_head include/linux/list.h:1073 [inline]
> 	binder_add_device+0xa9/0xc0 drivers/android/binder.c:7068
> 	binderfs_binder_device_create.isra.0+0x724/0x990 drivers/android/binderfs.c:196
> 	binder_ctl_ioctl+0x186/0x1b0 drivers/android/binderfs.c:241
> 	vfs_ioctl fs/ioctl.c:51 [inline]
> 	__do_sys_ioctl fs/ioctl.c:597 [inline]
> 	__se_sys_ioctl fs/ioctl.c:583 [inline]
> 	__x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x116/0x800 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 	RIP: 0033:0x7ff9027a833d
> 	Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> 	RSP: 002b:00007ff903674018 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> 	RAX: ffffffffffffffda RBX: 00007ff902a35fa0 RCX: 00007ff9027a833d
> 	RDX: 0000200000000500 RSI: 00000000c1086201 RDI: 0000000000000004
> 	RBP: 00007ff902850733 R08: 0000000000000000 R09: 0000000000000000
> 	R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> 	R13: 00007ff902a36038 R14: 00007ff902a35fa0 R15: 00007ffd7166bfa0
> 	</TASK>
> 
> 	Allocated by task 11389:
> 	kasan_save_stack+0x33/0x60 mm/kasan/common.c:57
> 	kasan_save_track+0x14/0x30 mm/kasan/common.c:78
> 	poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
> 	__kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
> 	kasan_kmalloc include/linux/kasan.h:263 [inline]
> 	__kmalloc_cache_noprof+0x2e4/0x6f0 mm/slub.c:5489
> 	_kmalloc_noprof include/linux/slab.h:988 [inline]
> 	_kzalloc_noprof include/linux/slab.h:1309 [inline]
> 	binderfs_binder_device_create.isra.0+0x17a/0x990 drivers/android/binderfs.c:148
> 	binder_ctl_ioctl+0x186/0x1b0 drivers/android/binderfs.c:241
> 	vfs_ioctl fs/ioctl.c:51 [inline]
> 	__do_sys_ioctl fs/ioctl.c:597 [inline]
> 	__se_sys_ioctl fs/ioctl.c:583 [inline]
> 	__x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x116/0x800 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> 	Freed by task 11389:
> 	kasan_save_stack+0x33/0x60 mm/kasan/common.c:57
> 	kasan_save_track+0x14/0x30 mm/kasan/common.c:78
> 	kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:584
> 	poison_slab_object mm/kasan/common.c:253 [inline]
> 	__kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
> 	kasan_slab_free include/linux/kasan.h:235 [inline]
> 	slab_free_hook mm/slub.c:2677 [inline]
> 	slab_free mm/slub.c:6377 [inline]
> 	kfree+0x2fc/0x6e0 mm/slub.c:6692
> 	binderfs_evict_inode+0x1e8/0x260 drivers/android/binderfs.c:268
> 	evict+0x3c2/0xad0 fs/inode.c:825
> 	iput_final fs/inode.c:2019 [inline]
> 	iput fs/inode.c:2068 [inline]
> 	iput+0x79a/0xd30 fs/inode.c:2031
> 	dentry_unlink_inode+0x27f/0x460 fs/dcache.c:479
> 	dentry_kill+0x25d/0xc20 fs/dcache.c:826
> 	finish_dput fs/dcache.c:1001 [inline]
> 	dput.part.0+0xce/0x230 fs/dcache.c:1042
> 	dput+0x1f/0x30 fs/dcache.c:1037
> 	end_dirop+0x7d/0xa0 fs/namei.c:2956
> 	binderfs_binder_device_create.isra.0+0x71c/0x990 drivers/android/binderfs.c:194
> 	binder_ctl_ioctl+0x186/0x1b0 drivers/android/binderfs.c:241
> 	vfs_ioctl fs/ioctl.c:51 [inline]
> 	__do_sys_ioctl fs/ioctl.c:597 [inline]
> 	__se_sys_ioctl fs/ioctl.c:583 [inline]
> 	__x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
> 	do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> 	do_syscall_64+0x116/0x800 arch/x86/entry/syscall_64.c:94
> 	entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> 	The buggy address belongs to the object at ffff88805b340c00
> 	which belongs to the cache kmalloc-512 of size 512
> 	The buggy address is located 0 bytes inside of
> 	freed 512-byte region [ffff88805b340c00, ffff88805b340e00)
> 
> Fix by calling binder_add_device() before d_make_persistent(),
> while the parent directory lock is still held and the dentry
> cannot be discarded.
> 
> Cc: stable@vger.kernel.org
> Fixes: b89aa544821d ("convert binderfs")
> Signed-off-by: Peiyang He <peiyang_he@smail.nju.edu.cn>
> Assisted-by: Codex:gpt-5.5
> ---

Thanks for fixing this Peiyang.

Acked-by: Carlos Llamas <cmllamas@google.com>
