Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B33AE185;
	Sat, 17 Oct 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225552; cv=none; b=ubBRQtPa8zYAVRR5ln/Nw9BBgsoo/PtHTXgGfxCZiL05tfeSX2zZEX4q0OJpkquJp7g1YOhbwo3EoNXrrMcaMGgzAMFXZUfpSZlumze+9Aivv/k3In3oTO7vPM70f0Rte3oSIqderql1BR/NH5HgXG2kBIVaeoolk5RSXlc7c+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225552; c=relaxed/simple;
	bh=0TUEVksSXFgW1fFK63R5UvbB+hgTvW15JGVN7zcrAio=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqPeXF89hkjfa1Vysw0U/cBKw9Rwvl4Et4IfnnEKJVkR1i6FqHTZZVr84W08XwXzZOIxnBMim2zs/UzgRrzxgOAVXqVkfOa93dmmOWv/Ptala0dLAm5vSYNABoHKL94Kuf85GV/aAI8qsHKsdLPdw6bKgCyC1a+tkpUWFJWaarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d+oc+Nop; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCV1CpHo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d+oc+Nop; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BCV1CpHo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d+oc+Nop";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCV1CpHo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d+oc+Nop";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BCV1CpHo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C8F621BE5;
	Sat, 17 Oct 2026 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBehH0jTBctJdRoNJd0x3kw/QSvHDI9nP++GnFC0NoE=;
	b=d+oc+Nop1OKp/ar6jruFkzZDSa03G5pOlwrAxq7R/Iz/6zsd1gn8Jgufl9iRzkBjGMUV3K
	1KSnMSryFwi6PWw+Px3QJNGI+SnjNXqAbCCT93LNzdnnXtLjCpYSpG9Zpe49L79rP4Y1B0
	3xBGLuQ3BIZeaxcZ/C95+6D1BD7niWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBehH0jTBctJdRoNJd0x3kw/QSvHDI9nP++GnFC0NoE=;
	b=BCV1CpHoiKdXoDRIamtGGhNbn5zWmcq7tKvceLGBlKTJk33q70vrYDGa8y52WpXhMA4Nii
	3uLPsIGN1KxB+uCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d+oc+Nop;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BCV1CpHo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBehH0jTBctJdRoNJd0x3kw/QSvHDI9nP++GnFC0NoE=;
	b=d+oc+Nop1OKp/ar6jruFkzZDSa03G5pOlwrAxq7R/Iz/6zsd1gn8Jgufl9iRzkBjGMUV3K
	1KSnMSryFwi6PWw+Px3QJNGI+SnjNXqAbCCT93LNzdnnXtLjCpYSpG9Zpe49L79rP4Y1B0
	3xBGLuQ3BIZeaxcZ/C95+6D1BD7niWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBehH0jTBctJdRoNJd0x3kw/QSvHDI9nP++GnFC0NoE=;
	b=BCV1CpHoiKdXoDRIamtGGhNbn5zWmcq7tKvceLGBlKTJk33q70vrYDGa8y52WpXhMA4Nii
	3uLPsIGN1KxB+uCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38620133A7;
	Sat, 17 Oct 2026 08:25:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8/2sBAwx02qhJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:25:48 +0000
Date: Sat, 17 Oct 2026 10:25:47 +0200
Message-ID: <87ld7w20ok.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: info: Serialize freeing with recursive registration
In-Reply-To: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com>
References: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: 8C8F621BE5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sat, 17 Oct 2026 08:58:31 +0200,
Cen Zhang wrote:
> 
> An snd_info_entry must remain alive while it is reachable from a proc
> node. snd_info_free_entry() clears entry->p under info_mutex, but drops
> the mutex before unlinking and freeing the entry. The recursive
> snd_info_register() walk can still find it and publish another node.
> 
> With a live card and a PCM OSS proc entry, unloading snd-pcm-oss can
> therefore overlap a card owner's repeated snd_card_register(). The OSS
> notifier removal holds register_mutex, while the already-registered card
> path holds snd_card_mutex. Neither excludes the other path:
> 
>   PCM OSS removal                    Card registration
>   snd_pcm_oss_proc_done()
>     snd_info_free_entry()
>       proc_remove(entry->p)
>       lock info_mutex
>       clear entry->p
>       unlock info_mutex
>                                      snd_info_card_register()
>                                        snd_info_register()
>                                          find linked OSS entry
>                                          lock info_mutex
>                                          publish new proc node
>                                          unlock info_mutex
>       unlink entry
>       kfree(entry)
> 
> A subsequent open of the new node passes its stale pde_data pointer to
> snd_info_text_entry_open(). alloc_info_private() then reads entry->p
> from freed storage.
> 
> Hold info_mutex across the entire recursive registration walk and across
> clearing, unlinking and freeing the entry tree. Use internal recursive
> helpers so the mutex is acquired only once. Registration then finishes
> before the entry is cleared, or walks the tree after the entry has been
> unlinked. Keep proc_remove() outside info_mutex: proc open takes the same
> mutex, and removal waits for pending proc operations to finish.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in alloc_info_private+0x12f/0x1a0
>     Read of size 8 at addr ffff888115c84250 by task python3/426
> 
>     CPU: 3 UID: 0 PID: 426 Comm: python3 Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? alloc_info_private+0x12f/0x1a0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? alloc_info_private+0x12f/0x1a0
>      kasan_report+0xe0/0x110
>      ? alloc_info_private+0x12f/0x1a0
>      alloc_info_private+0x12f/0x1a0
>      snd_info_text_entry_open+0xbd/0x2d0
>      ? __kasan_slab_alloc+0x89/0x90
>      ? __pfx_snd_info_text_entry_open+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? proc_reg_open+0x20e/0x590
>      ? __pfx_snd_info_text_entry_open+0x10/0x10
>      proc_reg_open+0x27d/0x590
>      do_dentry_open+0x5c8/0x1300
>      ? __pfx_proc_reg_open+0x10/0x10
>      ? security_inode_permission+0x5d/0xb0
>      vfs_open+0x87/0x390
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      path_openat+0x2460/0x3cd0
>      ? __pfx_path_openat+0x10/0x10
>      do_file_open+0x21e/0x470
>      ? __pfx_do_file_open+0x10/0x10
>      ? _raw_spin_unlock+0x23/0x40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? alloc_fd+0x3a6/0x6b0
>      do_sys_openat2+0xf4/0x1b0
>      ? __pfx_do_sys_openat2+0x10/0x10
>      __x64_sys_openat+0x136/0x1e0
>      ? __pfx___x64_sys_openat+0x10/0x10
>      ? irqentry_exit+0xbe/0x820
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f4e79f32687
>     Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
>     RSP: 002b:00007ffdd084f450 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
>     RAX: ffffffffffffffda RBX: 00007f4e79e9e780 RCX: 00007f4e79f32687
>     RDX: 0000000000080000 RSI: 00007f4e79c84d90 RDI: ffffffffffffff9c
>     RBP: 00007f4e79cdc1a0 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000001ff
>     R13: 00007f4e79e0b140 R14: 00007ffdd084f530 R15: 00007f4e79c84d90
>      </TASK>
> 
>     Allocated by task 421:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_info_create_entry+0x56/0x400
>      0xffffffffc0401b64
>      snd_pcm_notify+0x34e/0x470
>      0xffffffffc041b19b
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 424:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_info_free_entry+0x3d4/0x4d0
>      0xffffffffc0400d80
>      snd_pcm_notify+0x216/0x470
>      __do_sys_delete_module+0x338/0x530
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888115c84200
>      which belongs to the cache kmalloc-256 of size 256
>     The buggy address is located 80 bytes inside of
>      freed 256-byte region [ffff888115c84200, ffff888115c84300)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x115c84
>     head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>     flags: 0x200000000000040(head|node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000040 ffff888100042b40 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
>     head: 0200000000000040 ffff888100042b40 dead000000000100 dead000000000122
>     head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
>     head: 0200000000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
>     head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888115c84100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>      ffff888115c84180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>     >ffff888115c84200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                      ^
>      ffff888115c84280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>      ffff888115c84300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>     ==================================================================
> 
> Fixes: 2471b6c80a70 ("ALSA: info: Register proc entries recursively, too")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Does the above crash really happen with unmodified code?
The PCM oss proc unregister is per card, hence there can't be race
between register and unregister for the same card.

The hardening itself in the proc code is good, per se (although it's
doubtful whether we really need a global mutex from the performance
POV), though.


thanks,

Takashi
