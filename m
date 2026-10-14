Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA54C14E5;
	Wed, 14 Oct 2026 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982532; cv=none; b=RDFbH1XLxwVpKj85mi8nD/3M5LtxuhFyoS/d9y7vzFTvEcsRRnG6CQoMCGOsdbUUxYgkCChm9YrPzbZDu5TqGG29/DTP1ruTtE2SmiONQdUR+StC36h9dgbRpZIwGBic1Z8rp4I8lkGlkwEcvY2ifx8j7aHtpJXOgBNbJIMkaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982532; c=relaxed/simple;
	bh=vp35Wpg84GYilsM3sHyzCbkFikIbXGK4c4qGf/4xKPo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fNm6Z53t0rJgXlebg87Fw0QOMfzEEnU9Sx9nOz3RSq2oUD4QVqUfM5g87r/KrTylQnJH6lxsJ0GYXVuUSIaX3dboQOTPUPaFsdoVOCDrPlWpVQP4nYKeCT4vYcZC8oQ6sAijyZoeAsHiDQCA2YbOJiSaDUPRRC+6Tf9I7F2xl4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u8OMH419; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bNT8f1LC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u8OMH419; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bNT8f1LC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u8OMH419";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bNT8f1LC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u8OMH419";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bNT8f1LC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D2901FB62;
	Wed, 14 Oct 2026 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791982521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgxxu+1PPSwxwXFWz038axlLNIVl+qbhC3tT2e4DMZ8=;
	b=u8OMH419UOiNTJjN31icBT5QdOp7yBjFfwrj3HK1JSmgTYSkUQz2Z2jiforvQT6YOel5aK
	zVwmj5ouA+LbTMVlmp9MiBNXzgPnjTimmoToaozMm6tiBlPJYvYbBKMhfalfYPsdGf0znO
	J5zUuCbA7CVwLXkWRmPou7PtJUwhkxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791982521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgxxu+1PPSwxwXFWz038axlLNIVl+qbhC3tT2e4DMZ8=;
	b=bNT8f1LCS8DC1Q4iLuTCIBNrqD+d+E3KK+/UQ4pOKFyJEFIGRwbWqebh3UoZN3ADyNoV3f
	tHYndUEIDytZ0gCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791982521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgxxu+1PPSwxwXFWz038axlLNIVl+qbhC3tT2e4DMZ8=;
	b=u8OMH419UOiNTJjN31icBT5QdOp7yBjFfwrj3HK1JSmgTYSkUQz2Z2jiforvQT6YOel5aK
	zVwmj5ouA+LbTMVlmp9MiBNXzgPnjTimmoToaozMm6tiBlPJYvYbBKMhfalfYPsdGf0znO
	J5zUuCbA7CVwLXkWRmPou7PtJUwhkxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791982521;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgxxu+1PPSwxwXFWz038axlLNIVl+qbhC3tT2e4DMZ8=;
	b=bNT8f1LCS8DC1Q4iLuTCIBNrqD+d+E3KK+/UQ4pOKFyJEFIGRwbWqebh3UoZN3ADyNoV3f
	tHYndUEIDytZ0gCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 909A51368E;
	Wed, 14 Oct 2026 12:55:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yNRFArh7z2peFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 12:55:20 +0000
Date: Wed, 14 Oct 2026 14:55:19 +0200
Message-ID: <87y0c0cuh4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	yilinzhang@moonshot.ai,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: pcm: Serialize and check HW_REFINE ioctls
In-Reply-To: <pm-pmb-b3f7b3445bb11aaa9a7b-v3-371faafc2599ec7fa136@gmail.com>
References: <pm-pmb-b3f7b3445bb11aaa9a7b-v3-371faafc2599ec7fa136@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,intel.com,moonshot.ai,vger.kernel.org,suse.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 14 Oct 2026 12:52:33 +0200,
Cen Zhang wrote:
> 
> Hardware refinement must reject disconnected streams before entering
> their runtime constraint rules. The native ioctl checks the state at
> the outer dispatch, before copying the parameters, while the compat
> HW_REFINE32 path only checks that the runtime exists. Both call the
> unlocked refinement helper without the buffer access lock used by
> HW_PARAMS.
> 
> The BUFFER_BYTES rule keeps a substream pointer as its private payload.
> A compat request can still enter that rule after component disconnect.
> If component free overlaps its execution, the following order permits
> a use-after-free read of buffer_bytes_max:
> 
>   Component cleanup                 Compat HW_REFINE
>   -----------------                 ----------------
>   snd_pcm_dev_disconnect()
>     Runtime -> DISCONNECTED
>                                     Enter compat ioctl
>                                     snd_pcm_hw_refine()
>                                       Enter BUFFER_BYTES rule
>   snd_device_free()
>     snd_pcm_free_stream()
>       Free substream
>                                       Read buffer_bytes_max
> 
> Add a wrapper that acquires the existing buffer access lock and checks
> the same allowed states and mmap conditions as HW_PARAMS before running
> the refinement rules. Share the state checker with snd_pcm_hw_params()
> and use the wrapper for native, compat and legacy PCM HW_REFINE ioctls.
> This rejects the described entry after disconnect and serializes these
> refinement calls with other buffer-locked parameter operations.
> 
> Keep the original snd_pcm_hw_refine() helper for existing internal
> callers, including snd_pcm_hw_params() which already holds the buffer
> lock, to avoid locking that mutex recursively.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>     Read of size 8 at addr ffff888111b36870 by task pmbd_alsa_reade/486
> 
>     CPU: 2 UID: 0 PID: 486 Comm: pmbd_alsa_reade Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      kasan_report+0xe0/0x110
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      ? snd_pcm_hw_rule_div+0x16b/0x200
>      ? __pfx_snd_pcm_hw_rule_buffer_bytes_max+0x10/0x10
>      ? constrain_params_by_rules+0x17a/0xfe0
>      constrain_params_by_rules+0x506/0xfe0
>      ? __pfx_constrain_params_by_rules+0x10/0x10
>      ? __ia32_compat_sys_ioctl+0x289/0x2f0
>      ? do_int80_emulation+0x14a/0x5e0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? snd_interval_refine+0x284/0x470
>      snd_pcm_hw_refine+0x768/0xcc0
>      ? __pfx_snd_pcm_hw_refine+0x10/0x10
>      ? _copy_from_user+0x51/0xa0
>      snd_pcm_ioctl_hw_params_compat+0x138/0x280
>      snd_pcm_ioctl_compat+0x4c5/0x7c0
>      ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_ioctl+0xaa/0x280
>      ? ksys_write+0x16b/0x200
>      ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
>      __ia32_compat_sys_ioctl+0x289/0x2f0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_int80_emulation+0x14a/0x5e0
>      asm_int80_emulation+0x1a/0x20
>     RIP: 0023:0x8049084
>     Code: 80 b8 04 00 00 00 bb 01 00 00 00 b9 43 a0 04 08 ba 2b 00 00 00 cd 80 b8 36 00 00 00 89 f3 b9 10 41 5c c2 ba b8 b0 04 08 cd 80 <85> c0 78 6c b8 04 00 00 00 bb 01 00 00 00 b9 27 a0 04 08 ba 1c 00
>     RSP: 002b:00000000ffd35e40 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
>     RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c25c4110
>     RDX: 000000000804b0b8 RSI: 0000000000000003 RDI: 0000000000000004
>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>     R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>      </TASK>
> 
>     Allocated by task 486:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_pcm_new_stream+0x98f/0x1350
>      _snd_pcm_new+0x1d1/0x310
>      snd_pcm_new+0x43/0x60
>      0xffffffffc0401115
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 494:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_pcm_free_stream+0xcf/0x290
>      snd_pcm_free+0xb1/0xf0
>      __snd_device_free+0x1a1/0x490
>      snd_device_free+0xcf/0x190
>      case_owner_ioctl+0xb8/0x160 [pmbd_alsa_fixture]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888111b36800
>      which belongs to the cache kmalloc-1k of size 1024
>     The buggy address is located 112 bytes inside of
>      freed 1024-byte region [ffff888111b36800, ffff888111b36c00)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888111b35800 pfn:0x111b30
>     head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>     flags: 0x200000000000240(workingset|head|node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
>     raw: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
>     head: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
>     head: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
>     head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
>     head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888111b36700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>      ffff888111b36780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>     >ffff888111b36800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                                  ^
>      ffff888111b36880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>      ffff888111b36900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>     ==================================================================
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied to for-next branch now.  Thanks.


Takashi
