Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD713EB108;
	Tue, 13 Oct 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884812; cv=none; b=MjugAxvA3aVItY3ljlDkuspYK8lUro5+V6PkPpSwk9XdDMDWPruZQ/QZMn2zVH8kkhgxMAUEjd/BAOW/MHNVYHgtK1srqCpZGiPsEM0PBHb1Nze/aG2IZVjU1pDl8JB8xm+jeIQ3bLuelU3+G+oC2XaXXSXgvst31UZzlvpNu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884812; c=relaxed/simple;
	bh=KzLU9LB04mlAv7uhv2D/w0xj4eeJ/+B41ABvV6jl9Dc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZlC0CLdqrmjF6aGqzhQAyuFhyNEjiOODuHqCrfWXTVhHcLjpOslu4sJH8rsKmjESPEQM3Lffrwls11O6l+gfGnlEWwzFyN827PADFxsKqEXwQfTjNF/l2A+t7SHwoTHnxdqqhtQNVozXU6U3may4qCl+pWjFmE5yXMr1P5JMMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hk/7DSP3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bv1d0Lmy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZKOmSR/4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zvzOT+2T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hk/7DSP3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bv1d0Lmy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZKOmSR/4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zvzOT+2T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 556401F799;
	Tue, 13 Oct 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YL86PCFtdlO3W/EEeLo5lOZSnX1P/YwqNufdTeIUy4c=;
	b=hk/7DSP3Taw0mjEWbugg0MeY8eaCEBDpezmesUA57ADXVbSCjpx4y12CYc6Yq0Wr3JADKP
	1usyxqmP56tvCDAB1QyyG2MJMAJtkyqP0i6ZOu7JEnP9ZRctI0VQhk/a9CCHt5yfsvKu7N
	KCnMCHHpi11KMjvoQFmdZAZDey+NAgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YL86PCFtdlO3W/EEeLo5lOZSnX1P/YwqNufdTeIUy4c=;
	b=bv1d0LmyHULd6p3idI8sikng9Q69VOcXJg4Ye/z9tu+7XH3bJorHjmxbUvFOvlgoM7MO/I
	Yy5KCVuPES7rQBAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YL86PCFtdlO3W/EEeLo5lOZSnX1P/YwqNufdTeIUy4c=;
	b=ZKOmSR/4KU1JW7hElgspfOh/rhEddfFYZWX13sP4emBS3fHrlfauX6oJMf4A/4IxCk5GDs
	cpa/+gjnJk0nsnWi6MJfsxVoBXrhexSvJ8y2NQqCLmIIgvWr4+AO76X5wpWVCv1AfRTvAW
	asCjuIgtIixd+FMduMF8cypK9qLVJIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YL86PCFtdlO3W/EEeLo5lOZSnX1P/YwqNufdTeIUy4c=;
	b=zvzOT+2TOasRVEpamR1WYp42AbzQYhnRy3n0D1y4ihLsaFlLFwYA8RRxIfdXOmPZc6HTQr
	/lrhvqGhS/RLhpDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFD7213432;
	Tue, 13 Oct 2026 09:46:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gIfJMQb+zWpmegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 09:46:46 +0000
Date: Tue, 13 Oct 2026 11:46:42 +0200
Message-ID: <878q42gcfx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cassiogabrielcontato@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	yilinzhang@moonshot.ai,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Protect delay DMA sync against concurrent HW_FREE
In-Reply-To: <pm-pmb-d74585d187e0b1810c08-v2-25432d0951f67fdaa1a9@gmail.com>
References: <pm-pmb-d74585d187e0b1810c08-v2-25432d0951f67fdaa1a9@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[treewide];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,moonshot.ai,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 13 Oct 2026 10:01:06 +0200,
Cen Zhang wrote:
> 
> A PCM DMA buffer must remain allocated until explicit DMA synchronization
> finishes. snd_pcm_delay() calls snd_pcm_dma_buffer_sync() after dropping
> the stream lock, without participating in the buffer-access exclusion
> used by HW_FREE.
> 
> With a managed NONCONTIG buffer requiring explicit sync, HW_PARAMS can
> allocate a separate runtime descriptor when the requested ring exceeds
> the preallocation. In PREPARED state with mmap_count zero, concurrent
> HWSYNC and HW_FREE calls on the same open PCM file can interleave:
> 
> 1. HWSYNC checks the state in snd_pcm_delay() under the stream lock and
>    releases that lock.
> 2. The sync helper fetches runtime->dma_buffer_p and enters
>    snd_dma_noncontig_sync() with that descriptor.
> 3. HW_FREE takes the negative buffer-access count, checks PREPARED under
>    the stream lock, releases the lock, and frees the DMA allocation and
>    dynamic descriptor through snd_pcm_lib_free_pages().
> 4. The sync callback resumes and reads the freed descriptor.
> 
> The stream lock does not cover the allocation's release, and the sync
> operation has no positive buffer-access count to prevent it. The stale
> read causes a use-after-free in snd_dma_noncontig_sync(). DELAY uses the
> same snd_pcm_delay() path.
> 
> Take a positive buffer-access count before checking the state and keep it
> until the DMA sync finishes, as the transfer and mmap paths already do.
> HW_FREE then returns -EBUSY while this access is active. If a buffer
> writer has already entered, snd_pcm_delay() returns -EBUSY before using
> the buffer. Keep the sync outside the stream lock and balance the count
> on the state-error path as well.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in snd_dma_noncontig_sync+0x295/0x310 [snd_pcm]
>     Read of size 4 at addr ffff888108f58584 by task pcm-uaf-fixture/487
> 
>     CPU: 1 UID: 0 PID: 487 Comm: pcm-uaf-fixture Not tainted 7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_dma_noncontig_sync+0x295/0x310 [snd_pcm]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_dma_noncontig_sync+0x295/0x310 [snd_pcm]
>      kasan_report+0xe0/0x110
>      ? snd_dma_noncontig_sync+0x295/0x310 [snd_pcm]
>      ? __pfx_snd_dma_noncontig_sync+0x10/0x10 [snd_pcm]
>      snd_dma_noncontig_sync+0x295/0x310 [snd_pcm]
>      ? __pfx_snd_dma_noncontig_sync+0x10/0x10 [snd_pcm]
>      snd_dma_buffer_sync+0xc9/0x110 [snd_pcm]
>      snd_pcm_delay+0x3bd/0x550 [snd_pcm]
>      snd_pcm_common_ioctl+0x1e7/0x3aa0 [snd_pcm]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_vfs_ioctl+0x1f5/0x1280
>      ? __pfx_do_vfs_ioctl+0x10/0x10
>      ? ioctl_has_perm.constprop.0.isra.0+0x34f/0x500
>      ? __pfx_snd_pcm_common_ioctl+0x10/0x10 [snd_pcm]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_pcm_ioctl+0x76/0xb0 [snd_pcm]
>      ? __pfx_snd_pcm_ioctl+0x10/0x10 [snd_pcm]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f1cae7ab91b
>     Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>     RSP: 002b:00007ffe12d544f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>     RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f1cae7ab91b
>     RDX: 0000000000000000 RSI: 0000000000004122 RDI: 0000000000000003
>     RBP: 00000000000001ee R08: 0000000000000073 R09: 00000000ffffffff
>     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
>     R13: 0000000000000001 R14: 00005584f32b1398 R15: 00005584f32b2ce8
>      </TASK>
> 
>     Allocated by task 487:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_pcm_lib_malloc_pages+0x27c/0x9f0 [snd_pcm]
>      snd_pcm_hw_params+0x171c/0x1d10 [snd_pcm]
>      snd_pcm_common_ioctl+0x1f62/0x3aa0 [snd_pcm]
>      snd_pcm_ioctl+0x76/0xb0 [snd_pcm]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 499:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_pcm_lib_free_pages+0x1c9/0x420 [snd_pcm]
>      snd_pcm_common_ioctl+0x2bd3/0x3aa0 [snd_pcm]
>      snd_pcm_ioctl+0x76/0xb0 [snd_pcm]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888108f58580
>      which belongs to the cache kmalloc-64 of size 64
>     The buggy address is located 4 bytes inside of
>      freed 64-byte region [ffff888108f58580, ffff888108f585c0)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x108f58
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888108f58480: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>      ffff888108f58500: 00 00 00 00 00 06 fc fc fc fc fc fc fc fc fc fc
>     >ffff888108f58580: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>                        ^
>      ffff888108f58600: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>      ffff888108f58680: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     ==================================================================
>     Disabling lock debugging due to kernel taint
>     ------------[ cut here ]------------
>     kernel BUG at kernel/dma/mapping.c:417!
>     Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>     CPU: 1 UID: 0 PID: 487 Comm: pcm-uaf-fixture Tainted: G    B               7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
>     Tainted: [B]=BAD_PAGE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:__dma_sync_sg_for_cpu+0x230/0x360
>     Code: df 48 c1 e8 03 80 3c 10 00 0f 85 fa 00 00 00 4c 8b 35 d4 6b 7a 09 e8 7f e2 17 00 83 fd 02 0f 86 39 fe ff ff e8 71 e2 17 00 90 <0f> 0b e8 69 e2 17 00 be 08 00 00 00 4c 89 ff e8 bc 5f 77 00 4c 89
>     RSP: 0018:ffff888111f3fc50 EFLAGS: 00010293
>     RAX: 0000000000000000 RBX: ffffffffc0250d10 RCX: ffffffff816d395f
>     RDX: ffff88810836ba00 RSI: ffff888108f58580 RDI: ffffffffc02510d8
>     RBP: 00000000ffff8881 R08: 0000000000000000 R09: fffffbfff804a239
>     R10: ffffffffc02511cf R11: 6e696c6261736944 R12: ffff888108f58580
>     R13: 0000000002ce00e5 R14: ffffffffc0258720 R15: 0000000000000000
>     FS:  00007f1cae69c780(0000) GS:ffff8881fd861000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055d1affa2480 CR3: 0000000108fc0003 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      snd_dma_noncontig_sync+0x15a/0x310 [snd_pcm]
>      ? __pfx_snd_dma_noncontig_sync+0x10/0x10 [snd_pcm]
>      snd_dma_buffer_sync+0xc9/0x110 [snd_pcm]
>      snd_pcm_delay+0x3bd/0x550 [snd_pcm]
>      snd_pcm_common_ioctl+0x1e7/0x3aa0 [snd_pcm]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_vfs_ioctl+0x1f5/0x1280
>      ? __pfx_do_vfs_ioctl+0x10/0x10
>      ? ioctl_has_perm.constprop.0.isra.0+0x34f/0x500
>      ? __pfx_snd_pcm_common_ioctl+0x10/0x10 [snd_pcm]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_pcm_ioctl+0x76/0xb0 [snd_pcm]
>      ? __pfx_snd_pcm_ioctl+0x10/0x10 [snd_pcm]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f1cae7ab91b
>     Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>     RSP: 002b:00007ffe12d544f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>     RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f1cae7ab91b
>     RDX: 0000000000000000 RSI: 0000000000004122 RDI: 0000000000000003
>     RBP: 00000000000001ee R08: 0000000000000073 R09: 00000000ffffffff
>     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
>     R13: 0000000000000001 R14: 00005584f32b1398 R15: 00005584f32b2ce8
>      </TASK>
>     Modules linked in: snd_pcmtest snd_pcm
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:__dma_sync_sg_for_cpu+0x230/0x360
>     Code: df 48 c1 e8 03 80 3c 10 00 0f 85 fa 00 00 00 4c 8b 35 d4 6b 7a 09 e8 7f e2 17 00 83 fd 02 0f 86 39 fe ff ff e8 71 e2 17 00 90 <0f> 0b e8 69 e2 17 00 be 08 00 00 00 4c 89 ff e8 bc 5f 77 00 4c 89
>     RSP: 0018:ffff888111f3fc50 EFLAGS: 00010293
>     RAX: 0000000000000000 RBX: ffffffffc0250d10 RCX: ffffffff816d395f
>     RDX: ffff88810836ba00 RSI: ffff888108f58580 RDI: ffffffffc02510d8
>     RBP: 00000000ffff8881 R08: 0000000000000000 R09: fffffbfff804a239
>     R10: ffffffffc02511cf R11: 6e696c6261736944 R12: ffff888108f58580
>     R13: 0000000002ce00e5 R14: ffffffffc0258720 R15: 0000000000000000
>     FS:  00007f1cae69c780(0000) GS:ffff8881fd861000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055d1affa2480 CR3: 0000000108fc0003 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: disabled
>     Rebooting in 1 seconds..
> 
> Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
