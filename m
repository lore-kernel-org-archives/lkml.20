Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA3443E47;
	Mon, 12 Oct 2026 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790100; cv=none; b=JJK1r7Q66KjsLhvW/NkuZpTqS5XLZ2sKGkhi6r4dB4YLWED/IXD3l2/zIIEmKbjzP0PfhllZ7P9YPVhIqFxcWtjTbu8dKRqRrIvP8qdy9SZgew0GORU8HFo3HZfd+inVKyMxqLBwDvQ701cQTBeBgzzrawKd/7bqIl3FkDHW3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790100; c=relaxed/simple;
	bh=/Yk6ut10/brhxdQ/Y6I/g0n31+EaQzefOzgCtEnvprw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkY9oYmQB2slRCInwDsx9eCM7dc1z2vwg8lN77yCoQY/MMmBhDgy+F37xW8FqWffphng7MRw/YVIOXZM8ZzBFG8JetpNYyZ45nUwjhx6fyNALw97TpP2xf7TXVzPuQQt+w4TAmoCEupc7DOWFzMGqqbKWwxL99hQRuxnIvlo70s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ea6E5ejR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BhwU3lV8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ea6E5ejR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BhwU3lV8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ea6E5ejR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BhwU3lV8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ea6E5ejR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BhwU3lV8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2938521E48;
	Mon, 12 Oct 2026 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791790096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xZPVuN6PZDUVZTx8i878JViS/oX//uBz42t3hEHR8I=;
	b=Ea6E5ejRm4GM8//g54xAjXAeVunDy2CZ2AFKGaQRgu5XTiZih3zTujUWIxBAPA/Km5kMp5
	IhDeSWEBW3IOUmcnDyb+zJBo9FUUkhiz9pb8QfSCyHS7hxS+qSkwglLNN+9Vqj4mdjQjC/
	5cO9gyM2FC2sF6Kvv/CBMflYACAHzfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791790096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xZPVuN6PZDUVZTx8i878JViS/oX//uBz42t3hEHR8I=;
	b=BhwU3lV8YfHimVNrGjayrc4R8xrSfe1XVQddrtccudPMs3H+Bmi7qywdfxk65O+R92kny6
	lMIgBkglzsmfVdBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ea6E5ejR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BhwU3lV8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791790096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xZPVuN6PZDUVZTx8i878JViS/oX//uBz42t3hEHR8I=;
	b=Ea6E5ejRm4GM8//g54xAjXAeVunDy2CZ2AFKGaQRgu5XTiZih3zTujUWIxBAPA/Km5kMp5
	IhDeSWEBW3IOUmcnDyb+zJBo9FUUkhiz9pb8QfSCyHS7hxS+qSkwglLNN+9Vqj4mdjQjC/
	5cO9gyM2FC2sF6Kvv/CBMflYACAHzfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791790096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2xZPVuN6PZDUVZTx8i878JViS/oX//uBz42t3hEHR8I=;
	b=BhwU3lV8YfHimVNrGjayrc4R8xrSfe1XVQddrtccudPMs3H+Bmi7qywdfxk65O+R92kny6
	lMIgBkglzsmfVdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA03013314;
	Mon, 12 Oct 2026 07:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X8D7Ig+MzGqsYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:28:15 +0000
Date: Mon, 12 Oct 2026 09:28:15 +0200
Message-ID: <871p9vidio.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	blum@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: jack: Remove debugfs before freeing unregistered jacks
In-Reply-To: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com>
References: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 2938521E48
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sun, 11 Oct 2026 17:55:56 +0200,
Cen Zhang wrote:
> 
> Jack debugfs files store a raw snd_jack_kctl pointer, so their
> callbacks must be drained before the attachment is freed.
> snd_jack_dev_free() unlinks and frees the attachments before calling
> snd_jack_dev_disconnect(). Its late snd_jack_remove_debugfs() call
> then has no entries left to traverse.
> 
> With CONFIG_SND_JACK_INJECTION_DEBUG and input support enabled, an
> HDA codec rebind on a live card can publish a non-phantom jack's type
> file while its component is still in SNDRV_DEV_BUILD. A later
> jack-control allocation failure permits the following order:
> 
>   1. hda_codec_driver_probe() creates a jack and publishes its debugfs
>      files before reaching snd_card_register().
>   2. A later control-build failure calls
>      snd_hda_codec_cleanup_for_unbind(), then snd_hda_jack_tbl_clear()
>      and snd_device_free(). __snd_device_disconnect() skips BUILD
>      components. snd_jack_dev_free() frees the attachment before its
>      late disconnect, leaving the debugfs files published.
>   3. After cleanup, a reader opens the surviving type file and
>      jack_type_read() dereferences the freed attachment's jack pointer.
> 
> The card's debugfs root remains live throughout this sequence. The
> result is a use-after-free even without an overlapping read. An
> already admitted callback is also not drained by this cleanup.
> 
> Call snd_jack_remove_debugfs() before unlinking any controls in the
> free callback. The existing debugfs_remove() rundown blocks new
> accesses and waits for active callbacks while the attachment, control
> and jack remain valid. Roots cleared by an earlier disconnect are
> NULL, so repeating the removal is harmless.
> 
> KASAN report as below:
> 
>     ==================================================================
>     BUG: KASAN: slab-use-after-free in jack_type_read+0x1da/0x1f0
>     Read of size 8 at addr ffff8881085f9da0 by task python3/429
> 
>     CPU: 2 UID: 0 PID: 429 Comm: python3 Not tainted 7.2.0-rc6-pmb-alsa-functional-v2+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? jack_type_read+0x1da/0x1f0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? jack_type_read+0x1da/0x1f0
>      kasan_report+0xe0/0x110
>      ? jack_type_read+0x1da/0x1f0
>      jack_type_read+0x1da/0x1f0
>      ? __pfx_jack_type_read+0x10/0x10
>      ? __pfx___debugfs_file_get+0x10/0x10
>      ? __pfx_cp_new_stat+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_permission+0x122/0x570
>      full_proxy_read+0x11f/0x180
>      ? __pfx_full_proxy_read+0x10/0x10
>      vfs_read+0x1a0/0xc20
>      ? __pfx_vfs_read+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __do_sys_newfstat+0xa6/0x100
>      ? find_held_lock+0x2b/0x80
>      ? __pfx___do_sys_newfstat+0x10/0x10
>      ksys_read+0x111/0x200
>      ? __pfx_ksys_read+0x10/0x10
>      ? full_proxy_llseek+0x11e/0x170
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f7e392e7687
>     Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
>     RSP: 002b:00007fff5f7b9180 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
>     RAX: ffffffffffffffda RBX: 00007f7e39253780 RCX: 00007f7e392e7687
>     RDX: 0000000000002000 RSI: 000000003d2e9b00 RDI: 0000000000000003
>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000202 R12: 00007f7e39253700
>     R13: 0000000000002000 R14: 00007f7e38d7e2c0 R15: 0000000000a55b98
>      </TASK>
> 
>     Allocated by task 425:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_jack_kctl_new+0x80/0x180
>      snd_jack_new+0x4b/0x490
>      snd_hda_jack_add_kctl_mst+0x19b/0x610
>      add_jack_kctl+0x204/0x320
>      snd_hda_jack_add_kctls+0x212/0x910
>      snd_hda_gen_build_controls+0x233/0x600
>      snd_hda_codec_build_controls+0x2e4/0x9f0
>      hda_codec_driver_probe+0x26e/0x590
>      really_probe+0x21f/0xa90
>      __driver_probe_device+0x1ec/0x490
>      device_driver_attach+0xdc/0x210
>      bind_store+0xec/0x180
>      drv_attr_store+0x79/0xb0
>      sysfs_kf_write+0xed/0x140
>      kernfs_fop_write_iter+0x34b/0x500
>      vfs_write+0x637/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 425:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_jack_kctl_private_free+0x153/0x200
>      __snd_ctl_remove+0x29f/0x3b0
>      snd_ctl_remove+0x46/0x70
>      snd_jack_dev_free+0x1b1/0x370
>      __snd_device_free+0x193/0x3f0
>      snd_device_free+0xcf/0x190
>      snd_hda_jack_tbl_clear+0x159/0x2e0
>      snd_hda_codec_cleanup_for_unbind+0x37e/0x9c0
>      hda_codec_driver_probe+0x3ae/0x590
>      really_probe+0x21f/0xa90
>      __driver_probe_device+0x1ec/0x490
>      device_driver_attach+0xdc/0x210
>      bind_store+0xec/0x180
>      drv_attr_store+0x79/0xb0
>      sysfs_kf_write+0xed/0x140
>      kernfs_fop_write_iter+0x34b/0x500
>      vfs_write+0x637/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff8881085f9d80
>      which belongs to the cache kmalloc-64 of size 64
>     The buggy address is located 32 bytes inside of
>      freed 64-byte region [ffff8881085f9d80, ffff8881085f9dc0)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1085f9
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff8881085f9c80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
>      ffff8881085f9d00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     >ffff8881085f9d80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>                                    ^
>      ffff8881085f9e00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>      ffff8881085f9e80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     ==================================================================
> 
> Fixes: 495000a38634 ("ALSA: core: Remove debugfs at disconnection")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Could you verify whether the problem still exists with the latest
sound.git tree for-next branch (i.e. for 7.4)?  There have been fixes
for the races at the disconnection, and snd_card_disconnect() became
already mandatory before the release.


thanks,

Takashi
