Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684144C50F;
	Fri, 16 Oct 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149216; cv=none; b=OHrb28cV3mlzbsbroCo1J5wKbkTJfLmjUSgzmSl2dVQjJ0NYL6+5jZz3rL6PWarxrAQwHIv+dw/u6f61y9zXW9I9IXHBG8zx+6deu+OpAZJLjZwN9CHXaZHH5zqfY5VspHcTqrUH6Vv5pmzNmr07wzMIJ041RmJYE1fn9NM04Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149216; c=relaxed/simple;
	bh=nAKNB7rGMICFYbKCpMzmn7jG90wvOoQD5hsvQs2nLrQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzRQXEJdh5yLcsTA1DxWkY9tM7NefHXS7jJAyGFkPNwH0uULK40ZXN8cKvmWaiMWAn+zseMJdrycMwbF9PLMSI7XSTuCPYQ9kNDF97evmgYTwnr4ErlW06TwUaggLM9kQRhpF+1pZq7pnbePBNXLB8CGfF/XYFCkgZWqM8r/mbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WzhBSn+9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aQay3Dvt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hiav64ng; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PpkwrDx2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WzhBSn+9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aQay3Dvt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hiav64ng";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PpkwrDx2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E608E21BE1;
	Fri, 16 Oct 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792149205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6iuCVS9+wBAeOsBSNArDJXfjsPVFcCvMqZTVKazNGws=;
	b=WzhBSn+96s2/xOjzzVwjwQLUeyiCzlc75XVXVfwPdUUy+9dBoIupBirVA31xZkIerzmXUs
	AfZnZ9f5udzxgqO8fJb8TBR/ToZa86MeJCOR9G2qjrAY83+mp0nO/DyePj/9vLPEImIDrw
	mpyqBO3I+0VyhGT9JA3i9hbNpQRHRZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792149205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6iuCVS9+wBAeOsBSNArDJXfjsPVFcCvMqZTVKazNGws=;
	b=aQay3DvtcYXHcMybXJlXicydGs+DZuMKn4/KiJoq/LYRUe+Tef2X34/4XXst858A6cwnfZ
	MKo1r6ls1zz/uNCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hiav64ng;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PpkwrDx2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792149204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6iuCVS9+wBAeOsBSNArDJXfjsPVFcCvMqZTVKazNGws=;
	b=Hiav64ngfUujawIZPlGjAyRP0Xfr8zIOeAKPaJY4M0RX0JbI7YpBCR8Lq+onpsM4HhmS/Q
	4GvxyXxWH1Wx4DyE+U5yKUjAqn0vdjyHwisJY1I9v1ll1oGGS2ZsZbFNxR8hTZjPv+kr+V
	CTkgIYk3noJIcq4hxgKN+yv7gSCpKiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792149204;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6iuCVS9+wBAeOsBSNArDJXfjsPVFcCvMqZTVKazNGws=;
	b=PpkwrDx2YuAL2ukAZqxdOtvWkk9GjTDHt7+mFwldsPG/QPUIfvuhHgoQ763hiMFWUkEcxc
	RbnG1pRPTfTTG0Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F76A1339F;
	Fri, 16 Oct 2026 11:13:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3je4EdQG0mpLAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 11:13:24 +0000
Date: Fri, 16 Oct 2026 13:13:23 +0200
Message-ID: <87ik316gq4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	blum@kernel.org,
	hui.wang@canonical.com,
	kai.vehmanen@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: jack: Protect debugfs setup against control removal
In-Reply-To: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com>
References: <pm-pmb-0f2e227b93626e3c7554-v2-0b7a6296bbea01ae57e8@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E608E21BE1
X-Rspamd-Action: no action
X-Spam-Level: 
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
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,canonical.com,linux.intel.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Fri, 16 Oct 2026 04:04:37 +0200,
Cen Zhang wrote:
> 
> The jack control attachment must remain alive while its injection
> interface is being initialized. snd_jack_kctl_add() links the attachment
> to jack->kctl_list and then calls snd_jack_debugfs_add_inject_node(),
> which dereferences jack_kctl->kctl to read the control name. Neither the
> list insertion nor the debugfs setup holds controls_rwsem.
> 
> With CONFIG_SND_JACK_INJECTION_DEBUG enabled, an independent kernel
> control owner can remove the newly linked control in this order:
> 
>   1. The creator publishes the control with snd_ctl_add(), which releases
>      controls_rwsem, and links its attachment in snd_jack_kctl_add().
>   2. The remover takes controls_rwsem for writing in snd_ctl_remove().
>      __snd_ctl_remove() unlinks the control and calls snd_ctl_free_one().
>      snd_jack_kctl_private_free() unlinks and frees the attachment, then
>      snd_ctl_free_one() frees the control.
>   3. The creator enters snd_jack_debugfs_add_inject_node() and reads the
>      control name through the freed attachment.
> 
> This causes a use-after-free read during jack creation. Hold the existing
> controls_rwsem for reading before linking the attachment and until the
> debugfs helper returns. The remover's write lock then keeps the attachment
> and its control alive throughout this post-publication setup interval.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in snd_jack_kctl_add+0x50b/0x5e0
>     Read of size 8 at addr ffff88810d8def00 by task kworker/2:1/68
> 
>     CPU: 2 UID: 0 PID: 68 Comm: kworker/2:1 Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Workqueue: events azx_probe_work [snd_hda_intel]
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_jack_kctl_add+0x50b/0x5e0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_jack_kctl_add+0x50b/0x5e0
>      kasan_report+0xe0/0x110
>      ? snd_jack_kctl_add+0x50b/0x5e0
>      snd_jack_kctl_add+0x50b/0x5e0
>      ? snd_jack_kctl_add+0x5/0x5e0
>      snd_jack_new+0x347/0x4c0
>      snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
>      add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
>      ? __pfx_add_jack_kctl+0x10/0x10 [snd_hda_codec]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? pmbd_probe_hit_cookie+0xee/0x1c0
>      snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
>      ? __pfx_snd_hda_gen_build_controls+0x10/0x10 [snd_hda_codec_generic]
>      snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
>      ? __pfx_snd_hda_codec_build_controls+0x10/0x10 [snd_hda_codec]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? snd_hda_codec_build_pcms+0x4d8/0x6e0 [snd_hda_codec]
>      hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
>      ? __pfx_hda_codec_driver_probe+0x10/0x10 [snd_hda_codec]
>      really_probe+0x21f/0xa90
>      __driver_probe_device+0x1ec/0x490
>      driver_probe_device+0x4f/0x130
>      __device_attach_driver+0x1d2/0x2e0
>      ? __pfx___device_attach_driver+0x10/0x10
>      bus_for_each_drv+0x155/0x1d0
>      ? __pfx_bus_for_each_drv+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      __device_attach+0x1c3/0x490
>      ? __pfx___device_attach+0x10/0x10
>      ? snd_hda_codec_configure+0x4a2/0x690 [snd_hda_codec]
>      snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
>      ? __pfx_snd_hda_codec_configure+0x10/0x10 [snd_hda_codec]
>      ? __pfx_azx_probe_codecs+0x10/0x10 [snd_hda_codec]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? request_threaded_irq+0x21f/0x380
>      azx_codec_configure+0x65/0x200 [snd_hda_codec]
>      azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
>      ? __pfx_azx_probe_work+0x10/0x10 [snd_hda_intel]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      process_one_work+0x908/0x19c0
>      ? __pfx_process_one_work+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_is_held_type+0x8f/0x100
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      worker_thread+0x65c/0xe40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __kthread_parkme+0x175/0x220
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0x34f/0x460
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x659/0x940
>      ? __pfx_ret_from_fork+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __switch_to+0x74f/0xf80
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
> 
>     Allocated by task 68:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_jack_kctl_new+0x80/0x180
>      snd_jack_new+0x4b/0x4c0
>      snd_hda_jack_add_kctl_mst+0x19e/0x540 [snd_hda_codec]
>      add_jack_kctl+0x1b9/0x2c0 [snd_hda_codec]
>      snd_hda_jack_add_kctls+0x212/0x910 [snd_hda_codec]
>      snd_hda_gen_build_controls+0x23a/0x6a0 [snd_hda_codec_generic]
>      snd_hda_codec_build_controls+0x2e4/0x9f0 [snd_hda_codec]
>      hda_codec_driver_probe+0x26e/0x590 [snd_hda_codec]
>      really_probe+0x21f/0xa90
>      __driver_probe_device+0x1ec/0x490
>      driver_probe_device+0x4f/0x130
>      __device_attach_driver+0x1d2/0x2e0
>      bus_for_each_drv+0x155/0x1d0
>      __device_attach+0x1c3/0x490
>      snd_hda_codec_configure+0x4c5/0x690 [snd_hda_codec]
>      azx_codec_configure+0x65/0x200 [snd_hda_codec]
>      azx_probe_work+0x4d8/0x23b0 [snd_hda_intel]
>      process_one_work+0x908/0x19c0
>      worker_thread+0x65c/0xe40
>      kthread+0x34f/0x460
>      ret_from_fork+0x659/0x940
>      ret_from_fork_asm+0x1a/0x30
> 
>     Freed by task 436:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_jack_kctl_private_free+0x154/0x200
>      __snd_ctl_remove+0x29f/0x3b0
>      snd_ctl_remove+0x46/0x70
>      remove_control_set+0x110/0x1b0 [pmbd_alsa_control_remove]
>      param_attr_store+0x191/0x2f0
>      module_attr_store+0x5d/0x90
>      sysfs_kf_write+0xed/0x140
>      kernfs_fop_write_iter+0x34b/0x500
>      vfs_write+0x637/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff88810d8def00
>      which belongs to the cache kmalloc-64 of size 64
>     The buggy address is located 0 bytes inside of
>      freed 64-byte region [ffff88810d8def00, ffff88810d8def40)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10d8de
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff8881000428c0 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff88810d8dee00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>      ffff88810d8dee80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     >ffff88810d8def00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>                        ^
>      ffff88810d8def80: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
>      ffff88810d8df000: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     ==================================================================
> 
> Fixes: 2d670ea2bd53 ("ALSA: jack: implement software jack injection via debugfs")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
> 
> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index 0f04018181acb20f6bf85b11a9f6d4c7d3179e5a..dd604ffd8c815a9828f5e4b30a70b7597c86a37f 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -418,6 +418,7 @@ static void snd_jack_kctl_private_free(struct snd_kcontrol *kctl)
>  
>  static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
>  {
> +	guard(rwsem_read)(&jack->card->controls_rwsem);
>  	jack_kctl->jack = jack;
>  	list_add_tail(&jack_kctl->list, &jack->kctl_list);
>  	snd_jack_debugfs_add_inject_node(jack, jack_kctl);

That looks too ad hoc.  We need to check the real cause at first.

Could you elaborate how this situation is triggered?  In the above
stack trace, it looks like that the jack ctl was created via hd-audio
codec, but how was it removed?


thanks,

Takashi
