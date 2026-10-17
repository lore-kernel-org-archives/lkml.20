Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2230EF91;
	Sat, 17 Oct 2026 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225184; cv=none; b=rQH4jQUeneJdoArIC4wYv/0cnUerV9MFUnGNZy2t5bMdi2oJqQlfrifTQlmENrMFgY/PJvT7Jd69XMQQzIMuDf6Ugzn1CKHw6GScREFaBk2J8HAzdGjTX4niwR5dG8ejZflnH5q+piZdA5Ie9jfI5MFCdy/N7GAW3YnnvdP/vjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225184; c=relaxed/simple;
	bh=mToXJ7sWBtYpzlFQG/d5UBLFhaf+LvP7H8Ophm7RpPE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6lT447kQJtuMfMicj0zURDhcj1e1vOgqtc3czg6SWszGK1Ke68BgUx3OkPcdPAVf3oKnYTQy7hfMXsiM52SeDpP/Yosr6x5fhBiipzN5CT1NaySqrLLu/tpnzc7Oj9jKq0WhWhquCwupAqz+gGK9COra3jdvA5Dj87sz/aHtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HzAV3ZsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qQl7Khiv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HzAV3ZsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qQl7Khiv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HzAV3ZsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qQl7Khiv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HzAV3ZsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qQl7Khiv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2106B1F74B;
	Sat, 17 Oct 2026 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwtbwuLtQRKCOH/xqQJP78Hu+i3k5hVR5HN1+YVwC1c=;
	b=HzAV3ZsJXZI42jcrgbbo4k6ZVCJZaKePSEhSJwIg5AaLNbzm8/DVBv6WGpIIi/Ug8rqW+A
	gl/KU4l5EsceRvJ8uPSUF8NRm9X6PKx4r4XdP8K3C+PVidFyvfvWltHTzlvVD+iswDW3sK
	SmnqByjavpGkfqwdooOlyUYVotL+p8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwtbwuLtQRKCOH/xqQJP78Hu+i3k5hVR5HN1+YVwC1c=;
	b=qQl7KhivPVPgxfM/UPPhI6m4YghW14vstIYiuGgO39OVodT8Je0Q04L8720br3o+31QiRQ
	ASJhg8cfKRLLrUCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792225181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwtbwuLtQRKCOH/xqQJP78Hu+i3k5hVR5HN1+YVwC1c=;
	b=HzAV3ZsJXZI42jcrgbbo4k6ZVCJZaKePSEhSJwIg5AaLNbzm8/DVBv6WGpIIi/Ug8rqW+A
	gl/KU4l5EsceRvJ8uPSUF8NRm9X6PKx4r4XdP8K3C+PVidFyvfvWltHTzlvVD+iswDW3sK
	SmnqByjavpGkfqwdooOlyUYVotL+p8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792225181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwtbwuLtQRKCOH/xqQJP78Hu+i3k5hVR5HN1+YVwC1c=;
	b=qQl7KhivPVPgxfM/UPPhI6m4YghW14vstIYiuGgO39OVodT8Je0Q04L8720br3o+31QiRQ
	ASJhg8cfKRLLrUCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C25F7133A7;
	Sat, 17 Oct 2026 08:19:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c5ghJpwv02oVHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Oct 2026 08:19:40 +0000
Date: Sat, 17 Oct 2026 10:19:40 +0200
Message-ID: <87o6cs20yr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: oss: Serialize final setup list cleanup
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sat, 17 Oct 2026 09:27:19 +0200,
Cen Zhang wrote:
> 
> OSS setup nodes and their task names must remain valid throughout
> snd_pcm_oss_look_for_setup(). The lookup holds setup_mutex while
> comparing names, traversing the list and copying a matched record, but
> snd_pcm_oss_proc_done() frees that list without taking the mutex.
> 
> With verbose proc support enabled, an OSS open on a stream with a
> populated setup list can overlap HDA codec unbind. The card remains
> registered, so the card-file reference does not prevent the PCM
> component from being freed.
> 
> The lookup runs before pcm->open_mutex is taken and before the driver
> acquires a PCM reference. Codec unbind disconnects the PCM and drains
> existing codec PCM references first. Its cleanup then reaches
> snd_pcm_free() through codec_release_pcms() and snd_device_free(). The
> n_unregister callback invokes snd_pcm_oss_unregister_minor() and
> snd_pcm_oss_proc_done().
> 
> Both columns below access the setup list of the same PCM stream. Without
> this fix, cleanup does not take setup_mutex:
> 
>   OSS open                        HDA PCM teardown
>   --------                        ----------------
>   snd_pcm_oss_look_for_setup()
>     lock(setup_mutex)
>     setup = setup_list
>                                   snd_pcm_oss_proc_done()
>                                     snd_info_free_entry()
>                                     /* no setup_mutex held */
>                                     snd_pcm_oss_proc_free_setup_list()
>                                       kfree(setup->task_name)
>                                       kfree(setup)
>     read setup->task_name
>     or setup->next -> UAF
> 
> Take setup_mutex around final list cleanup, as the proc clear/erase path
> already does. This waits for the active lookup to finish its reads and
> copy before freeing the nodes. Acquire the mutex after
> snd_info_free_entry() so proc callback rundown can finish without
> waiting on a mutex held by teardown.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in snd_pcm_oss_look_for_setup+0x30c/0x3c0
>     Read of size 8 at addr ffff888106ecc2c0 by task pmbdossuaf/427
> 
>     CPU: 3 UID: 0 PID: 427 Comm: pmbdossuaf Not tainted 7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
>      kasan_report+0xe0/0x110
>      ? snd_pcm_oss_look_for_setup+0x30c/0x3c0
>      snd_pcm_oss_look_for_setup+0x30c/0x3c0
>      snd_pcm_oss_open+0xd38/0x1240
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? avc_has_perm_noaudit+0x4a/0x330
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? find_held_lock+0x2b/0x80
>      ? __pfx_snd_pcm_oss_open+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __lock_acquire+0x466/0x2260
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? __pfx_snd_pcm_oss_open+0x10/0x10
>      soundcore_open+0x3ae/0x510
>      ? __pfx_soundcore_open+0x10/0x10
>      chrdev_open+0x21f/0x660
>      ? __pfx_chrdev_open+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_dentry_open+0x5c8/0x1300
>      ? __pfx_chrdev_open+0x10/0x10
>      ? security_inode_permission+0x5d/0xb0
>      vfs_open+0x87/0x390
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      path_openat+0x2460/0x3cd0
>      ? do_syscall_64+0x115/0x6a0
>      ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
>      ? __pfx_path_openat+0x10/0x10
>      do_file_open+0x21e/0x470
>      ? __pfx_do_file_open+0x10/0x10
>      ? _raw_spin_unlock+0x23/0x40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? alloc_fd+0x3a6/0x6b0
>      do_sys_openat2+0xf4/0x1b0
>      ? __pfx_do_sys_openat2+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      __x64_sys_openat+0x136/0x1e0
>      ? __pfx___x64_sys_openat+0x10/0x10
>      ? irqentry_exit+0xbe/0x820
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f687d8c4687
>     Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
>     RSP: 002b:00007ffca02dde50 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
>     RAX: ffffffffffffffda RBX: 00007f687d830780 RCX: 00007f687d8c4687
>     RDX: 0000000000080801 RSI: 00007f687d518b90 RDI: ffffffffffffff9c
>     RBP: 00007f687d66e1c8 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000001ff
>     R13: 00007f687d356830 R14: 00007ffca02ddf30 R15: 00007f687d518b90
>      </TASK>
> 
>     Allocated by task 426:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_pcm_oss_proc_write+0x619/0x950
>      snd_info_text_entry_release+0x100/0x260
>      close_pdeo.part.0+0xe0/0x2e0
>      close_pdeo+0x161/0x180
>      proc_reg_release+0x185/0x1f0
>      __fput+0x39f/0xa60
>      fput_close_sync+0xff/0x200
>      __x64_sys_close+0x8c/0xf0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 428:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_pcm_oss_proc_free_setup_list+0x9c/0x140
>      snd_pcm_oss_unregister_minor+0x203/0x450
>      snd_pcm_free+0xb0/0x180
>      __snd_device_free+0x193/0x3f0
>      snd_device_free+0xcf/0x190
>      snd_hda_codec_cleanup_for_unbind+0x1b3/0xad0
>      hda_codec_driver_remove+0x1c4/0x2e0
>      device_remove+0x12a/0x170
>      device_release_driver_internal+0x471/0x650
>      unbind_store+0xfd/0x110
>      drv_attr_store+0x79/0xb0
>      sysfs_kf_write+0xed/0x140
>      kernfs_fop_write_iter+0x34b/0x500
>      vfs_write+0x637/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888106ecc2c0
>      which belongs to the cache kmalloc-32 of size 32
>     The buggy address is located 0 bytes inside of
>      freed 32-byte region [ffff888106ecc2c0, ffff888106ecc2e0)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x106ecc
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff888100042780 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000400040 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888106ecc180: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>      ffff888106ecc200: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>     >ffff888106ecc280: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>                                                ^
>      ffff888106ecc300: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>      ffff888106ecc380: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>     ==================================================================
> 
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

How can this happen?  The PCM proc file belongs to the card, and
snd_oss_proc_done() is called from snd_pcm_free() at the card removal,
where all opened descriptors must have been released before reaching
this point and no new open is allowed any longer.


thanks,

Takashi
